// Historical continuous-solver checks; current gameplay is covered by emulated-physics.test.js.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {Track,wrapAngle} from '../src/track.js';
import {Car,STEP} from '../tools/reference-physics.js';

const data=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url)));
function placeCar(track,distance,speed) {
 const p=track.atDistance(distance),car=new Car(track,{practice:true});
 Object.assign(car,{...p,y:p.y+.9,vx:Math.sin(p.yaw)*speed,vz:Math.cos(p.yaw)*speed,vy:Math.tan(p.pitch)*speed,recovery:0,grounded:true,lastPiece:p.piece,previousProgress:p.distance});
 return car;
}

// Complete each of the 38 bend groups, including its approach and exit, at
// two entry speeds. A simple test driver aims down the road using only the
// public left/right inputs. No car position, grip or steering is overridden.
for(const d of data)test(`${d.name}: complete every bend at 50 and 70 world units/sec`,()=>{
 const track=new Track(d);
 for(let first=0;first<track.pieces.length;first++) {
  if(!(track.pieces[first].geometryType&128)||(track.pieces[(first+track.pieces.length-1)%track.pieces.length].geometryType&128))continue;
  let last=first;
  while(last+1<track.pieces.length&&(track.pieces[last+1].geometryType&128))last++;
  for(const speed of [50,70]) {
   const car=placeCar(track,track.pieceDistance[first]-20,speed);
   let complete=false;
   for(let i=0;i<18/STEP;i++) {
    const here=track.nearest(car.x,car.z);
    const target=track.atDistance(here.distance+Math.max(8,Math.abs(car.speed)*.35));
    const error=wrapAngle(Math.atan2(target.x-car.x,target.z-car.z)-car.yaw);
    car.step(STEP,{left:error>.025,right:error<-.025});
    const after=track.nearest(car.x,car.z),label=`section ${first}–${last}, speed ${speed}`;
    assert.ok(after.off<6,label+': left the road');
    assert.equal(car.falls,0,label+': required crane recovery');
    if(after.distance>(track.pieceDistance[last+1]??track.length)+20){complete=true;break;}
   }
   assert.ok(complete,`section ${first}–${last}, speed ${speed}: did not complete bend`);
  }
 }
});

test('a single supporting road wheel keeps steering available',()=>{
 const track=new Track(data[0]),car=placeCar(track,track.pieceDistance[15],30);
 car.pitch=.2; // Front wheels lifted, rear wheel still supporting the car.
 const yaw=car.yaw;car.step(STEP,{left:true});
 assert.equal(car.contacts,1);assert.ok(car.grounded);assert.ok(wrapAngle(car.yaw-yaw)>0);
});

test('airborne rotation preserves world momentum and ignores new steering inputs',()=>{
 const track=new Track(data[0]);
 const cars=[true,false].map(left=>{
  const car=placeCar(track,track.pieceDistance[15],50);
  Object.assign(car,{x:450,z:450,y:100,yawVelocity:.5});
  const initialDirection=Math.atan2(car.vx,car.vz),yaw=car.yaw;
  for(let i=0;i<60;i++)car.step(STEP,{left,right:!left});
  assert.ok(Math.abs(wrapAngle(Math.atan2(car.vx,car.vz)-initialDirection))<1e-8);
  assert.ok(Math.abs(wrapAngle(car.yaw-yaw)-.25)<1e-8);
  return car;
 });
 assert.equal(cars[0].yaw,cars[1].yaw);
});

test('holding steering can still drive off the road',()=>{
 const track=new Track(data[0]),car=placeCar(track,track.pieceDistance[15],50);
 for(let i=0;i<300;i++)car.step(STEP,{left:true});
 assert.ok(track.nearest(car.x,car.z).off>6);
});
