import {planeGradient} from './orientation.js';
// Coordinates are decoded from the user's ADF. Amiga Y has four times the X/Z scale.
export const SCALE = 32;
export const lerp = (a,b,t) => a+(b-a)*t;
export const clamp = (v,a,b) => Math.max(a,Math.min(b,v));
export const wrapAngle = a => Math.atan2(Math.sin(a),Math.cos(a));
const mid = (a,b) => a.map((v,i)=>(v+b[i])/2);
const point = p => [p[0]/32,p[1]/128,p[2]/32];
export class Track {
 constructor(data) {
  this.data=data;this.id=data.id;this.name=data.name;this.bridgeClock=0;this.version=0;
  this.pieces=data.pieces.map((p,i)=>({...p,index:i,points:p.points.map(row=>row.map(point))}));
  this.original=this.pieces.map(p=>p.points.map(row=>row.map(v=>v.slice())));
  this.rebuild();
  // The disk contains placeholder bridge heights; materialise the first pose
  // before a crane target can occupy the bridge and freeze its animation.
  this.updateBridge(0,-1,-1);
 }
 rebuild() {
  this.segments=[];this.pieceDistance=[];this.grid=new Map();let distance=0;
  this.pieces.forEach((p,index)=>{
   this.pieceDistance[index]=distance;
   for(let j=0;j<p.segments;j++) {
    const a=p.points[j][0],b=p.points[j][1],d=p.points[j+1][0],c=p.points[j+1][1];
    const start=mid(a,b),end=mid(d,c),dx=end[0]-start[0],dz=end[2]-start[2],length=Math.hypot(dx,dz);
    const s={a,b,c,d,start,end,length,distance,piece:index,index:j,heading:Math.atan2(dx,dz),gap:Math.max(Math.abs(a[1]-d[1]),Math.abs(b[1]-c[1]))>=5};
    s.planes=[planeGradient(a,b,c),planeGradient(a,c,d)];
    this.segments.push(s);distance+=length;
    const minX=Math.floor(Math.min(a[0],b[0],c[0],d[0])/32),maxX=Math.floor(Math.max(a[0],b[0],c[0],d[0])/32);
    const minZ=Math.floor(Math.min(a[2],b[2],c[2],d[2])/32),maxZ=Math.floor(Math.max(a[2],b[2],c[2],d[2])/32);
    for(let x=minX;x<=maxX;x++)for(let z=minZ;z<=maxZ;z++) {const key=`${x},${z}`;if(!this.grid.has(key))this.grid.set(key,[]);this.grid.get(key).push(s);}
   }
  });
  // Steering follows the template's bend direction and strength. Tangents are
  // interpolated across polygon joins so a faceted curve does not jerk the wheel.
  const byPiece=this.pieces.map(()=>[]);this.segments.forEach(s=>byPiece[s.piece].push(s));
  this.segments.forEach((s,i)=>{
   const p=this.pieces[s.piece],first=byPiece[s.piece][0],last=byPiece[s.piece].at(-1);
   s.turn=(p.geometryType&128)?Math.sign(wrapAngle(last.heading-first.heading)):0;
   s.steeringAmount=p.steeringAmount??32;
   const before=this.segments[(i+this.segments.length-1)%this.segments.length],after=this.segments[(i+1)%this.segments.length];
   s.headingStart=s.heading+wrapAngle(before.heading-s.heading)/2;
   s.headingEnd=s.heading+wrapAngle(after.heading-s.heading)/2;
   s.steeringSegment=s===last?after:s;
  });
  this.length=distance;this.version++;
 }
 triangleHeight(x,z,a,b,c) {
  const ax=b[0]-a[0],az=b[2]-a[2],bx=c[0]-a[0],bz=c[2]-a[2];
  const det=ax*bz-az*bx;if(Math.abs(det)<1e-9)return null;
  const u=((x-a[0])*bz-(z-a[2])*bx)/det,v=(ax*(z-a[2])-az*(x-a[0]))/det;
  if(u<-.0001||v<-.0001||u+v>1.0001)return null;
  return a[1]+u*(b[1]-a[1])+v*(c[1]-a[1]);
 }
 surface(x,z,y=Infinity) {
  const segments=this.grid.get(`${Math.floor(x/32)},${Math.floor(z/32)}`)||[];let result=null;
  for(const s of segments) {
   if(s.gap)continue;
   let h=this.triangleHeight(x,z,s.a,s.b,s.c),plane=s.planes[0];if(h===null){h=this.triangleHeight(x,z,s.a,s.c,s.d);plane=s.planes[1];}
   if(h!==null&&h<y+2.5&&(!result||h>result.y)) {
    const t=clamp(((x-s.start[0])*(s.end[0]-s.start[0])+(z-s.start[2])*(s.end[2]-s.start[2]))/(s.length*s.length),0,1);
    result={y:h,segment:s,steeringSegment:s.steeringSegment,piece:s.piece,distance:s.distance+t*s.length,heading:s.heading,steeringHeading:s.headingStart+wrapAngle(s.headingEnd-s.headingStart)*t,slope:(s.end[1]-s.start[1])/s.length,...plane};
   }
  }
  return result;
 }
 atDistance(distance,lateral=0) {
  distance=((distance%this.length)+this.length)%this.length;
  let lo=0,hi=this.segments.length-1;
  while(lo<hi){const m=(lo+hi+1)>>1;if(this.segments[m].distance<=distance)lo=m;else hi=m-1;}
  const s=this.segments[lo],t=clamp((distance-s.distance)/s.length,0,1),side=(lateral+1)/2;
  const a=s.a.map((v,i)=>lerp(v,s.d[i],t)),b=s.b.map((v,i)=>lerp(v,s.c[i],t));
  const pos=a.map((v,i)=>lerp(v,b[i],side));
  return {x:pos[0],y:pos[1],z:pos[2],yaw:s.heading,pitch:Math.atan2(s.end[1]-s.start[1],s.length),roll:Math.atan2(b[1]-a[1],Math.hypot(b[0]-a[0],b[2]-a[2])),piece:s.piece,distance,segment:s};
 }
 nearest(x,z) {
  let best=null,dist=Infinity;
  for(const s of this.segments){const t=clamp(((x-s.start[0])*(s.end[0]-s.start[0])+(z-s.start[2])*(s.end[2]-s.start[2]))/(s.length*s.length),0,1);const d=Math.hypot(x-lerp(s.start[0],s.end[0],t),z-lerp(s.start[2],s.end[2],t));if(d<dist){dist=d;best=this.atDistance(s.distance+t*s.length);}}
  return {...best,off:dist};
 }
 recoveryPose(piece,lateral=-.28) {
  const count=this.pieces.length;
  piece=((piece%count)+count)%count;
  // Original $605B6 rejects template flags and the track's exclusion list,
  // then $5C538 retreats one section, wrapping at the start of the circuit.
  for(let tried=0;tried<count;tried++,piece=(piece+count-1)%count) {
   if(this.pieces[piece].recoveryAllowed===false)continue;
   const start=this.pieceDistance[piece],end=this.pieceDistance[piece+1]??this.length;
   return this.atDistance((start+end)/2,lateral);
  }
  throw new Error(`No crane recovery section in ${this.name}`);
 }
 applyOriginalBridge(heights) {
  let changed=false;
  this.previousBridgeHeights=new Map();
  for(const {piece,rows} of heights)for(let j=0;j<rows.length;j++)for(let side=0;side<2;side++) {
   const point=this.pieces[piece].points[j][side];
   this.previousBridgeHeights.set(point,point[1]);
   if(point[1]!==rows[j][side]){point[1]=rows[j][side];changed=true;}
  }
  if(changed)this.rebuild();
 }
 updateBridge(dt,playerPiece,opponentPiece) {
  if(this.id!==5)return;
  if([playerPiece,opponentPiece].some(p=>p>=48&&p<=55))return;
  this.bridgeClock+=dt;const frame=Math.floor(this.bridgeClock*(50/6));if(frame===this.bridgeFrame)return;this.bridgeFrame=frame;
  const phase=(frame&31)-16,height=(phase<0?-phase-1:phase)+4,inc=height/4;
  const strips=[[51,1,8,1,1],[52,0,7,8,1],[54,1,8,16,-1],[55,0,7,9,-1]];
  for(const [p,first,last,k,dir] of strips)for(let j=first;j<=last;j++)for(let side=0;side<2;side++)this.pieces[p].points[j][side][1]=(side?this.pieces[p].rightShift:this.pieces[p].leftShift)/128+(k+(j-first)*dir)*inc;
  this.rebuild();
 }
}
