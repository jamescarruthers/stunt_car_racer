import * as THREE from 'three';
import {lerp} from './track.js';
import {carFrame} from './orientation.js';
import {interpolatePose} from './simulation-clock.js';
const vec = p => new THREE.Vector3(...p);
const COCKPIT_EYE_HEIGHT=2.25,MIN_ROAD_CLEARANCE=.75;
export class WorldRenderer {
 constructor(palette,scenery) {
  this.renderer=new THREE.WebGLRenderer({antialias:false,alpha:false,preserveDrawingBuffer:true});
  this.renderer.setSize(320,200);this.renderer.setPixelRatio(1);this.renderer.outputColorSpace=THREE.SRGBColorSpace;
  this.renderer.setClearColor(new THREE.Color(...palette[7].map(c=>c/255)).convertSRGBToLinear());
  this.scene=new THREE.Scene();this.palette=palette.map(p=>new THREE.Color(`rgb(${p.join(',')})`));
  this.camera=new THREE.PerspectiveCamera(42.67,1.6,.08,16000);
  this.camera.setViewOffset(320,200,0,16,320,200);
  this.ground=new THREE.Mesh(new THREE.PlaneGeometry(30000,30000),new THREE.MeshBasicMaterial({color:this.palette[13],side:THREE.DoubleSide}));this.ground.rotation.x=-Math.PI/2;this.ground.position.set(512,-.1,512);this.scene.add(this.ground);
  this.trackGroup=new THREE.Group();this.scene.add(this.trackGroup);this.rival=this.makeCar();this.scene.add(this.rival);
  this.sceneryGroup=new THREE.Group();this.scene.add(this.sceneryGroup);
  for(const [azimuth,index] of scenery.placements){const shape=scenery.shapes[index],angle=azimuth/256*Math.PI*2,positions=[],colors=[];for(const face of shape.faces){for(let j=1;j<face.vertices.length-1;j++){for(const id of [face.vertices[0],face.vertices[j],face.vertices[j+1]]){const [x,y]=shape.points[id],xx=x*6;positions.push(Math.sin(angle)*6000+Math.cos(angle)*xx,y*6,Math.cos(angle)*6000-Math.sin(angle)*xx);const c=this.palette[face.color];colors.push(c.r,c.g,c.b);}}}const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.Float32BufferAttribute(positions,3));g.setAttribute('color',new THREE.Float32BufferAttribute(colors,3));this.sceneryGroup.add(new THREE.Mesh(g,new THREE.MeshBasicMaterial({vertexColors:true,side:THREE.DoubleSide})));}
  this.target=new THREE.Vector3();this.camera.up.set(0,1,0);
 }
 setResolution(width,height) {
  if(this.renderer.domElement.width!==width||this.renderer.domElement.height!==height)this.renderer.setSize(width,height,false);
 }
 disposeGroup(group) {group.traverse(o=>{o.geometry?.dispose();if(o.material){for(const m of Array.isArray(o.material)?o.material:[o.material])m.dispose();}});group.clear();}
 loadTrack(track) {this.track=track;this.buildTrack();}
 buildTrack() {
  this.disposeGroup(this.trackGroup);this.trackVersion=this.track.version;
  const positions=[],colors=[],edges=[];this.bridgeVertices=[];this.bridgeEdges=[];
  const triangle=(a,b,c,color)=>{for(const p of [a,b,c]){if(this.track.previousBridgeHeights?.has(p))this.bridgeVertices.push([positions.length+1,p]);positions.push(...p);colors.push(color.r,color.g,color.b);}};
  const quad=(a,b,c,d,col)=>{triangle(a,b,c,col);triangle(a,c,d,col);};
  const line=(a,b)=>{for(const p of [a,b]){if(this.track.previousBridgeHeights?.has(p))this.bridgeEdges.push([edges.length+1,p]);edges.push(p[0],p[1]+.018,p[2]);}};
  for(const s of this.track.segments) {
   const {a,b,c,d}=s,road=this.palette[s.gap?0:1+(s.piece&1)],wall=this.palette[s.piece&1?10:15];
   quad(a,b,c,d,road);
   quad(a,d,[d[0],0,d[2]],[a[0],0,a[2]],wall);
   quad(c,b,[b[0],0,b[2]],[c[0],0,c[2]],wall);
   line(a,d);line(b,c);
   if((s.index+(this.track.pieces[s.piece].rightId>>7))%2===0)line(a,b);
   if(s.index===0&&s.piece===(this.track.data.finish+1)%this.track.pieces.length) {
    const aa=a.map((v,i)=>lerp(v,d[i],.12)),bb=b.map((v,i)=>lerp(v,c[i],.12));
    for(let j=0;j<12;j++)for(let k=0;k<2;k++){
     const p=(u,v)=>{const l=a.map((x,i)=>lerp(x,aa[i],v)),r=b.map((x,i)=>lerp(x,bb[i],v));return [lerp(l[0],r[0],u),lerp(l[1],r[1],u)+.025,lerp(l[2],r[2],u)];};
     quad(p(j/12,k/2),p((j+1)/12,k/2),p((j+1)/12,(k+1)/2),p(j/12,(k+1)/2),this.palette[(j+k)%2?0:15]);
    }
   }
  }
  const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.Float32BufferAttribute(positions,3));g.setAttribute('color',new THREE.Float32BufferAttribute(colors,3));
  this.roadPositions=g.getAttribute('position');
  const mesh=new THREE.Mesh(g,new THREE.MeshBasicMaterial({vertexColors:true,side:THREE.DoubleSide}));this.trackGroup.add(mesh);
  const eg=new THREE.BufferGeometry();eg.setAttribute('position',new THREE.Float32BufferAttribute(edges,3));this.trackGroup.add(new THREE.LineSegments(eg,new THREE.LineBasicMaterial({color:this.palette[9]})));
  this.edgePositions=eg.getAttribute('position');
 }
 interpolateBridge(alpha) {
  if(!this.bridgeVertices?.length)return;
  // Only GPU vertex buffers change. Original collision geometry stays at the
  // current native tick; rendering must never write interpolated data back.
  for(const [indices,attribute,offset] of [[this.bridgeVertices,this.roadPositions,0],[this.bridgeEdges,this.edgePositions,.018]]) {
   for(const [index,point] of indices)attribute.array[index]=lerp(this.track.previousBridgeHeights.get(point)??point[1],point[1],alpha)+offset;
   attribute.needsUpdate=true;
  }
 }
 makeCar() {
  const group=new THREE.Group();
  const box=(x,y,z,w,h,l,color)=>{const mesh=new THREE.Mesh(new THREE.BoxGeometry(w,h,l),new THREE.MeshBasicMaterial({color:this.palette[color]}));mesh.position.set(x,y,z);group.add(mesh);return mesh;};
  box(0,.6,0,1.6,.65,4,11);box(0,1.05,-.7,1.4,.5,1.2,10);box(0,.96,.9,1.2,.35,1.6,14);box(0,.9,-1.8,2.5,.18,.45,12);
  box(0,1.45,-.3,.65,.6,.6,0);
  for(const x of [-1.1,1.1])for(const z of [-1.25,1.3]){
   const wheel=new THREE.Mesh(new THREE.CylinderGeometry(.7,.7,.6,8),new THREE.MeshBasicMaterial({color:this.palette[0]}));wheel.rotation.z=Math.PI/2;wheel.position.set(x,.6,z);group.add(wheel);
   const hub=new THREE.Mesh(new THREE.CylinderGeometry(.25,.25,.62,8),new THREE.MeshBasicMaterial({color:this.palette[14]}));hub.rotation.z=Math.PI/2;hub.position.copy(wheel.position);group.add(hub);
  }
  return group;
 }
 roadHeightForCamera(pose,section,alpha) {
  const track=this.track,count=track.pieces?.length;
  const segments=track.grid?.get(`${Math.floor(pose.x/32)},${Math.floor(pose.z/32)}`)||[];
  const displayed=p=>{
   const previous=track.previousBridgeHeights?.get(p);
   return previous===undefined?p:[p[0],lerp(previous,p[1],alpha),p[2]];
  };
  let height=null;
  for(const s of segments) {
   // Follow the occupied road and its joins; an overhead crossing must not
   // lift the viewpoint onto a different part of the circuit.
   const separation=Math.abs(s.piece-section);
   if(s.gap||(Number.isInteger(section)&&Math.min(separation,count-separation)>1))continue;
   const [a,b,c,d]=[s.a,s.b,s.c,s.d].map(displayed);
   const y=track.triangleHeight(pose.x,pose.z,a,b,c)??track.triangleHeight(pose.x,pose.z,a,c,d);
   if(y!==null&&(height===null||Math.abs(y-pose.y)<Math.abs(height-pose.y)))height=y;
  }
  return height;
 }
 render(car,rival,alpha=1,preview=false,clock=0) {
  if(this.track.version!==this.trackVersion)this.buildTrack();
  this.interpolateBridge(alpha);
  this.rival.visible=!!rival&&!preview;
  if(rival){const p=interpolatePose(rival.previous,rival.pose,alpha);this.rival.position.set(p.x,p.y,p.z);this.rival.rotation.set(-p.pitch,p.yaw,p.roll,'YXZ');}
  if(preview) {
   this.camera.clearViewOffset();this.camera.fov=43;this.camera.aspect=302/124;
   const bounds=new THREE.Box3().setFromObject(this.trackGroup),center=bounds.getCenter(new THREE.Vector3()),size=bounds.getSize(new THREE.Vector3());
   const radius=Math.max(size.x,size.z)*1.25,angle=clock*.12+.6;
   this.camera.position.set(center.x+Math.sin(angle)*radius,center.y+radius*.75,center.z+Math.cos(angle)*radius);this.camera.up.set(0,1,0);this.camera.lookAt(center);this.camera.updateProjectionMatrix();
  } else {
   this.camera.aspect=1.6;this.camera.fov=42.67;this.camera.setViewOffset(320,200,0,16,320,200);
   const pose=interpolatePose(car.previous,car,alpha);
   const {x,z,yaw,pitch,roll}=pose;
   const shake=Math.sin(clock*73)*car.shake*.025;
   let eyeY=pose.y+COCKPIT_EYE_HEIGHT+shake;
   if(car.grounded&&!car.recovery) {
    const roadY=this.roadHeightForCamera(pose,car.lastPiece,alpha);
    if(roadY!==null)eyeY=Math.max(eyeY,roadY+MIN_ROAD_CLEARANCE);
   }
   const frame=carFrame(yaw,pitch,roll);
   this.camera.position.set(x,eyeY,z);
   this.camera.up.fromArray(frame.up);
   this.target.set(x+frame.forward[0]*30,eyeY+frame.forward[1]*30,z+frame.forward[2]*30);this.camera.lookAt(this.target);
  }
  this.sceneryGroup.visible=!preview;this.sceneryGroup.position.set(this.camera.position.x,0,this.camera.position.z);this.renderer.render(this.scene,this.camera);return this.renderer.domElement;
 }
}
