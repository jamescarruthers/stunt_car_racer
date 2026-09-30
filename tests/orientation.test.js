// Historical continuous-solver checks; current gameplay is covered by emulated-physics.test.js.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import * as THREE from 'three';
import {Track} from '../src/track.js';
import {Car,STEP} from '../tools/reference-physics.js';
import {WorldRenderer} from '../src/renderer.js';
import {roadAngles} from '../src/orientation.js';

function planeTrack(dx=0,dz=0) {
 const points=Array.from({length:101},(_,i)=>[-100,100].map(x=>{
  const z=i*4-200;return [x*32,(200+dx*x+dz*z)*128,z*32];
 }));
 return new Track({id:-1,name:'Test plane',spawn:0,boost:100,superBoost:100,half:999,finish:0,pieces:[{template:0,segments:100,points}]});
}
function placeCar(track,yaw,speed=0) {
 const car=new Car(track),hit=track.surface(0,0),angles=roadAngles(hit.dx,hit.dz,yaw);
 Object.assign(car,{x:0,y:hit.y+.9,z:0,yaw,...angles,vx:Math.sin(yaw)*speed,vz:Math.cos(yaw)*speed,vy:(hit.dx*Math.sin(yaw)+hit.dz*Math.cos(yaw))*speed,recovery:0,grounded:true});
 return car;
}

test('left and right steer toward the matching side of the driver view at every heading',()=>{
 const track=planeTrack();
 for(const yaw of [0,Math.PI/2,Math.PI,-Math.PI/2])for(const key of ['left','right']) {
  const car=placeCar(track,yaw,30);
  for(let i=0;i<120;i++)car.step(STEP,{[key]:true});
  const screenRightDisplacement=-Math.cos(yaw)*car.x+Math.sin(yaw)*car.z;
  assert.ok(key==='right'?screenRightDisplacement>.2:screenRightDisplacement<-.2,`${key}, heading ${yaw}`);
 }
});

test('suspension follows combined slopes and banks even when crossing the road at an angle',()=>{
 for(const [dx,dz] of [[.65,.2],[-.65,.2],[.3,-.4]])for(const yaw of [.4,1.4,-2]) {
  const track=planeTrack(dx,dz),car=placeCar(track,yaw,20);
  for(let i=0;i<180;i++)car.step(STEP);
  const hit=track.surface(car.x,car.z),angles=roadAngles(dx,dz,car.yaw);
  assert.ok(car.grounded);assert.equal(car.contacts,3);
  assert.ok(Math.abs(car.y-hit.y-.9)<.12);
  assert.ok(Math.abs(car.pitch-angles.pitch)<.025);
  assert.ok(Math.abs(car.roll-angles.roll)<.025);
  assert.equal(car.damage,0);
 }
});

test('all original tracks support the car on their steepest banks',()=>{
 const data=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url)));
 for(const d of data) {
  const track=new Track(d);
  const p=track.segments.filter(s=>!s.gap).map(s=>track.atDistance(s.distance+s.length/2)).sort((a,b)=>Math.abs(b.roll)-Math.abs(a.roll))[0];
  const car=new Car(track);Object.assign(car,{x:p.x,y:p.y+.9,z:p.z,yaw:p.yaw,pitch:p.pitch,roll:p.roll,recovery:0});
  for(let i=0;i<240;i++)car.step(STEP);
  assert.equal(car.contacts,3,d.name);assert.ok(car.grounded,d.name);
  assert.ok(Math.abs(car.roll-p.roll)<.025,d.name);assert.equal(car.damage,0,d.name);
 }
});

test('the rendered cockpit banks with the road and keeps a banked cross-section level',()=>{
 // Use the real render method and Three.js camera without requiring a GPU.
 const view=Object.create(WorldRenderer.prototype);
 Object.assign(view,{track:{version:0},trackVersion:0,rival:{},camera:new THREE.PerspectiveCamera(),target:new THREE.Vector3(),scene:new THREE.Scene(),sceneryGroup:new THREE.Group(),renderer:{render:(_,camera)=>camera.updateMatrixWorld(),domElement:null}});
 for(const yaw of [0,.8,-2])for(const bank of [-.65,.65]) {
  view.render({x:0,y:.9,z:0,yaw,pitch:0,roll:bank,shake:0},null);
  const normal=new THREE.Vector3(-Math.cos(yaw)*Math.sin(bank),Math.cos(bank),Math.sin(yaw)*Math.sin(bank));
  const up=new THREE.Vector3(0,1,0).applyQuaternion(view.camera.quaternion);
  assert.ok(up.dot(normal)>.999999,'camera up must match the road normal');
  const crossSection=side=>new THREE.Vector3(Math.sin(yaw)*30+Math.cos(yaw)*side,Math.tan(bank)*side,Math.cos(yaw)*30-Math.sin(yaw)*side).project(view.camera);
  assert.ok(Math.abs(crossSection(-3).y-crossSection(3).y)<1e-6,'road should not tilt against the cockpit');
 }
});
