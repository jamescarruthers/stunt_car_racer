import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import * as THREE from 'three';
import {Track} from '../src/track.js';
import {WorldRenderer} from '../src/renderer.js';

const json=name=>JSON.parse(fs.readFileSync(new URL(name,import.meta.url)));
const tracks=json('../public/assets/tracks.json');
function viewFor(track) {
 const view=Object.create(WorldRenderer.prototype);
 Object.assign(view,{track,trackVersion:track.version,rival:{},camera:new THREE.PerspectiveCamera(),target:new THREE.Vector3(),scene:new THREE.Scene(),sceneryGroup:new THREE.Group(),renderer:{render:(_,camera)=>camera.updateMatrixWorld(),domElement:null}});
 return view;
}
function carAt(pose,extra={}) {
 const p={roll:0,...pose};
 return Object.freeze({...p,previous:Object.freeze({...p}),lastPiece:p.section??p.piece,grounded:true,recovery:0,shake:2,...extra});
}

test('recorded Amiga and DOS suspension compression no longer puts the cockpit under the road',()=>{
 const amiga=json('../analysis/original-runtime-traces.json').cases.find(c=>c.track===6&&c.superLeague);
 const dos=json('../analysis/dos/physics/gameplay-traces.json').cases.find(c=>c.track===1&&!c.superLeague&&c.calibration===0x646f);
 const cases=[{track:6,poses:amiga.trace.map(s=>s.state)},{track:1,poses:dos.samples.map(s=>({...s.world,section:s.section,contact:s.contact,chains:s.chains,offRoad:s.offRoad}))}];
 for(const c of cases) {
  const track=new Track(tracks[c.track]),view=viewFor(track);
  const pose=c.poses.find(p=>p.contact&&!p.chains&&!p.offRoad&&track.surface(p.x,p.z,p.y+8)?.y>p.y+1.25);
  assert.ok(pose,'reference trace must reproduce the previous camera clipping');
  const car=carAt(pose),road=track.surface(pose.x,pose.z,pose.y+8);
  const before=JSON.stringify(car);
  for(const alpha of [0,.25,.5,.75,1]) {
   view.render(car,null,alpha,false,3*Math.PI/2/73);
   assert.ok(view.camera.position.y>road.y+.5,'eye and near plane must clear the road even with downward shake');
  }
  assert.equal(JSON.stringify(car),before,'camera correction cannot move the simulated car');
 }
});

test('raised eye position clears compressed suspension on every original track bank',()=>{
 for(const d of tracks) {
  const track=new Track(d),view=viewFor(track);
  const p=track.segments.filter(s=>!s.gap).map(s=>track.atDistance(s.distance+s.length/2)).sort((a,b)=>Math.abs(b.roll)-Math.abs(a.roll))[0];
  const road=track.surface(p.x,p.z),car=carAt({...p,y:road.y-3});
  view.render(car,null);
  assert.ok(view.camera.position.y>road.y+.5,d.name);
  const settled=carAt({...p,y:road.y-.3});view.render(settled,null);
  assert.ok(view.camera.position.y>settled.y+2,'normal eye position should also be higher');
 }
});

test('camera clearance uses the displayed bridge height between physics updates',()=>{
 const track=new Track(tracks[5]);
 // Two valid bridge poses with a descending deck, like successive native ticks.
 const profiles=[51,52,54,55].map(piece=>({piece,rows:track.pieces[piece].points.map(row=>row.map(p=>p[1]+2))}));
 track.applyOriginalBridge(profiles);
 track.applyOriginalBridge(profiles.map(p=>({piece:p.piece,rows:p.rows.map(row=>row.map(y=>y-2))})));
 const view=viewFor(track),segment=track.segments.find(s=>s.piece===51&&!s.gap);
 const p=track.atDistance(segment.distance+segment.length/2),car=carAt({...p,y:p.y-4});
 const pointsBefore=JSON.stringify(track.pieces[51].points),heights=[];
 for(const alpha of [0,.25,.5,.75,1]) {
  view.render(car,null,alpha);
  const displayedRoad=p.y+2*(1-alpha);
  assert.ok(view.camera.position.y>displayedRoad+.5);
  heights.push(view.camera.position.y);
 }
 assert.ok(heights[0]>heights.at(-1)+1.9,'clearance follows the interpolated deck instead of snapping to the next physics height');
 assert.equal(JSON.stringify(track.pieces[51].points),pointsBefore);
});

test('falling below a track and crane motion retain their natural camera position',()=>{
 const track=new Track(tracks[0]),view=viewFor(track),p=track.atDistance(track.pieceDistance[track.data.spawn]+10);
 for(const extra of [{grounded:false},{grounded:true,recovery:1}]) {
  const car=carAt({...p,y:p.y-8},extra);view.render(car,null);
  assert.ok(view.camera.position.y<p.y-5,'an unsupported car must not have its camera snapped onto the road');
 }
});

test('an overhead crossing cannot lift the camera away from its occupied section',()=>{
 const track=new Track(tracks[0]),view=viewFor(track),p=track.atDistance(track.pieceDistance[track.data.spawn]+10);
 const road=track.surface(p.x,p.z),s=road.segment;
 const overhead={...s,piece:(s.piece+10)%track.pieces.length};
 for(const key of ['a','b','c','d'])overhead[key]=s[key].map((v,i)=>v+(i===1?2:0));
 track.grid.get(`${Math.floor(p.x/32)},${Math.floor(p.z/32)}`).unshift(overhead);
 const car=carAt({...p,y:road.y+2.1});view.render(car,null);
 assert.equal(view.roadHeightForCamera(car,car.lastPiece,1),road.y);
 const compressed=carAt({...p,y:road.y-3});view.render(compressed,null);
 assert.ok(view.camera.position.y>road.y+.5&&view.camera.position.y<road.y+1);
});
