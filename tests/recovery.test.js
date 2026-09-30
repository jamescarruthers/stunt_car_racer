// Historical continuous-solver checks; current gameplay is covered by emulated-physics.test.js.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {Track} from '../src/track.js';
import {Car,STEP} from '../tools/reference-physics.js';
const data=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url)));
const manifest=JSON.parse(fs.readFileSync(new URL('../public/assets/manifest.json',import.meta.url)));
const disk=fs.readFileSync(new URL(`../original/${manifest.disk.file}`,import.meta.url));

test('crane exclusions and geometry flags come from the supplied ADF',()=>{
 const flags=disk.subarray(manifest.payload.offset+0x109c2,manifest.payload.offset+0x109c2+16);
 for(const t of data) {
  const record=manifest.assets.find(a=>a.file===`track-${t.id}`);
  const end=record.diskOffset+record.sourceBytes;
  const excluded=[...disk.subarray(end-t.trailer[5],end)];
  assert.deepEqual(t.recoveryForbidden,excluded,t.name);
  t.pieces.forEach((p,i)=>assert.equal(p.recoveryAllowed,!(flags[p.template]&128)&&!excluded.includes(i),`${t.name} section ${i}`));
 }
});

test('every section recovers backwards to the first allowed original section, with wraparound',()=>{
 for(const d of data) {
  const track=new Track(d);
  for(let i=0;i<d.pieces.length;i++) {
   const expected=Array.from({length:d.pieces.length},(_,n)=>(i-n+d.pieces.length)%d.pieces.length).find(p=>d.pieces[p].recoveryAllowed);
   const p=track.recoveryPose(i);
   assert.equal(p.piece,expected,`${d.name} section ${i}`);
  assert.ok(track.surface(p.x,p.z,p.y),`${d.name} section ${i}: crane target must be on solid road`);
   assert.ok(!p.segment.gap);
  }
 }
 const wrapFixture=structuredClone(data[0]);wrapFixture.pieces[0].recoveryAllowed=false;wrapFixture.recoveryForbidden.push(0);
 assert.equal(new Track(wrapFixture).recoveryPose(0).piece,43,'a forbidden section zero retreats through the circuit boundary');
});

test('Little Ramp recovers out of the low jump section onto the preceding ramp',()=>{
 const track=new Track(data[0]),car=new Car(track,{practice:true});
 assert.ok(data[0].recoveryForbidden.includes(34));
 car.resetAt(34);
 assert.equal(car.lastPiece,33);assert.ok(car.recoveryTarget.y>25);
 assert.ok(Math.abs(car.recoveryTarget.distance-(track.pieceDistance[33]+track.pieceDistance[34])/2)<1e-9);
 const wheels=[[-1,2],[1,2],[0,-2]];
 for(let i=0;i<3.2/STEP;i++)car.step(STEP);
 assert.ok(car.grounded);assert.equal(car.falls,1);
 assert.ok(wheels.every(([x,z])=>track.surface(car.x+Math.cos(car.yaw)*x+Math.sin(car.yaw)*z,car.z-Math.sin(car.yaw)*x+Math.cos(car.yaw)*z,car.y)));
 // Automatic recovery must use the same policy as the R key.
 car.x=450;car.z=450;car.y=25;car.lastPiece=34;car.fallTime=4.6;
 car.step(STEP);assert.equal(car.lastPiece,33);assert.ok(car.recovery>0);
});

test('crane skips complete forbidden runs at the High Jump and Draw Bridge',()=>{
 assert.equal(new Track(data[6]).recoveryPose(45).piece,29);
 assert.equal(new Track(data[5]).recoveryPose(54).piece,50);
});

test('after Little Ramp recovery a five-second reverse run-up clears the jump',()=>{
 const car=new Car(new Track(data[0]),{practice:true});car.resetAt(34);
 for(let i=0;i<3.2/STEP;i++)car.step(STEP);
 for(let i=0;i<5/STEP;i++)car.step(STEP,{brake:true});
 let cleared=false;
 for(let i=0;i<25/STEP;i++) {
  car.step(STEP,{throttle:true,boost:true});
  if(car.lastPiece>=36&&car.lastPiece<=38&&car.grounded){cleared=true;break;}
 }
 assert.ok(cleared);assert.equal(car.falls,1);assert.ok(car.damage<100);
});
