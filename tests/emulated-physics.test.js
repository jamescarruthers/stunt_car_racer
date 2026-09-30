import test,{after} from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import createMusashi from 'musashi-wasm/musashi.out.mjs';
import {OriginalMachine,ORIGINAL_STEP,ORIGINAL_SPEED_SCALE} from '../src/original-machine.js';
import {OriginalCar} from '../src/original-car.js';
import {SimulationClock,interpolatePose} from '../src/simulation-clock.js';
import {Track,wrapAngle} from '../src/track.js';
import {Rival} from '../src/physics.js';
import {carFrame} from '../src/orientation.js';
import * as THREE from 'three';
import {WorldRenderer} from '../src/renderer.js';

const read=name=>fs.readFileSync(new URL(name,import.meta.url));
const payload=read('../public/assets/original-code.bin');
// Use the same universal WebAssembly artifact that is shipped to the browser.
const module=await createMusashi({wasmBinary:read('../node_modules/musashi-wasm/musashi.out.wasm')});
const machine=new OriginalMachine(module,payload);
after(()=>machine.dispose());
const reference=JSON.parse(read('../analysis/original-physics-traces.json'));
const runtime=JSON.parse(read('../analysis/original-runtime-traces.json'));
const tracks=JSON.parse(read('../public/assets/tracks.json'));
const manifest=JSON.parse(read('../public/assets/manifest.json'));
const hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const compareState=expected=>{
 const actual=machine.state();
 for(const [key,value] of Object.entries(expected)) {
  if(!(key in actual))continue;
  if(typeof value==='number')assert.ok(Math.abs(actual[key]-value)<1e-12,`${key}: ${actual[key]} != ${value}`);
  else assert.equal(actual[key],value,key);
 }
};
const settle=(piece=29)=>{
 machine.initialise(0,{probe:true});machine.recover(piece);
 for(let i=0;i<100;i++)machine.step(16);
};

test('the browser executes the unchanged payload extracted from the supplied disk',()=>{
 assert.equal(hash(payload),manifest.payload.sha256);
 const disk=read(`../original/${manifest.disk.file}`);
 assert.deepEqual(payload,disk.subarray(manifest.payload.offset,manifest.payload.offset+manifest.payload.size));
 assert.equal(hash(disk),reference.sourceSha256);assert.equal(hash(disk),runtime.sourceSha256);
 settle();
 // Core physics instructions are unchanged after boot and running 100 ticks.
 assert.deepEqual(machine.memory.slice(0x61012,0x61260),new Uint8Array(payload.subarray(0x61012-0xe700,0x61260-0xe700)));
});

test('WASM matches every original acceleration, braking and corner replay sample',()=>{
 for(const [name,controls] of [['normal',1],['boost',17],['reverse',2],['reverseBoost',18]]) {
  settle();const trace=reference.flatAcceleration[name];compareState(trace[0]);
  for(const expected of trace.slice(1)){machine.step(controls);compareState(expected);}
 }
 for(const [name,controls] of [['normal',2],['boost',18]]) {
  settle();for(let i=0;i<40;i++)machine.step(1);
  compareState(reference.braking[name][0]);
  for(const expected of reference.braking[name].slice(1)){machine.step(controls);compareState(expected);}
 }
 settle(24);compareState(reference.corner[0]);
 for(const expected of reference.corner.slice(1)){machine.step(17);compareState(expected);}
});

test('WASM reproduces free fall and all Little Ramp recovery/run-up traces exactly',()=>{
 machine.initialise(0,{probe:true});machine.recover(34);machine.put(0x1bbdf,0,1);
 for(const [address,value,scale] of [[0x1bcd8,450,131072],[0x1bcdc,100,262144],[0x1bce0,450,131072]])machine.put(address,value*scale,4);
 for(let a=0x1bcea;a<0x1bd02;a+=2)machine.put(a,0);
 machine.locate();compareState(reference.freeFall[0]);
 for(const expected of reference.freeFall.slice(1)){machine.step(0);compareState(expected);}
 for(const sample of reference.littleRamp) {
  machine.initialise(0,{probe:true});machine.recover(34);
  for(let i=0;i<120;i++){machine.step(16);const s=machine.state();if(!s.chains&&s.contact)break;}
  compareState(sample.release);
  for(const expected of sample.trace){machine.step(expected.phase==='reverse'?2:17);compareState(expected);}
 }
});

test('all 1,134 steering probes and original suspension/traction integer results agree',()=>{
 let lastTrack=-1,lastPiece=-1;
 for(const s of reference.steeringSamples) {
  if(s.track!==lastTrack){machine.initialise(s.track,{probe:true});machine.recover(tracks[s.track].spawn);lastTrack=s.track;lastPiece=-1;}
  if(s.piece!==lastPiece) {
   for(const [address,value,scale] of [[0x1bcd8,s.x,131072],[0x1bcdc,s.y,262144],[0x1bce0,s.z,131072]])machine.put(address,Math.round(value*scale),4);
   machine.locate();lastPiece=s.piece;
  }
  const yaw=Math.round(s.yaw*65536/(2*Math.PI));
  machine.put(0x1bce6,yaw);machine.put(0x1bcf2,0);
  machine.put(0x1bd30,Math.round(s.speed/ORIGINAL_SPEED_SCALE));machine.put(0x1bb7e,1,1);machine.put(0x1bbc6,s.input*15,1);
  machine.call(0x61012);
  const rate=machine.get(0x1bcfe,2,true)*(238/256)*(50/6)*2*Math.PI/65536;
  const alignment=((machine.get(0x1bce6)-yaw+32768)%65536-32768)*2*Math.PI/65536/ORIGINAL_STEP;
  assert.ok(Math.abs(rate-s.rate)<1e-12);assert.ok(Math.abs(alignment-s.alignment)<1e-12);
 }
 machine.initialise(0,{probe:true});
 for(const s of reference.suspensionSamples) {
  machine.call(0x6180e,{d0:s.change&65535,d6:s.compression&65535});
  const raw=(machine.reg('d0')<<16)>>16;
  assert.equal(Math.max(0,Math.min(0x11ff,raw)),s.force);
 }
 for(const s of reference.tractionSamples) {
  machine.put(0x1bb7e,s.normal>0?1:0,1);machine.put(0x1bd42,s.normal);machine.put(0x1bd2c,s.speed);
  machine.put(0x1bd0e,s.gravity);machine.put(0x1bd40,0);machine.call(0x6217a);
  assert.equal(machine.get(0x1bd32,2,true),s.acceleration);
 }
});

test('5,600 gameplay ticks across every track and both leagues match Unicorn byte for byte',()=>{
 const spans=[[0x1bb4f,8],[0x1bb62,1],[0x1bb7d,2],[0x1bb9b,2],[0x1bbcd,3],[0x1bbdf,1],[0x1bc94,0xca],[0x1ca20,1]];
 assert.equal(runtime.cases.length,16);
 for(const c of runtime.cases) {
  machine.initialise(c.track,{superLeague:c.superLeague});machine.recover(tracks[c.track].spawn);
  for(const [tick,s] of c.trace.entries()) {
   if(s.recover!==null)machine.recover(s.recover);
   machine.step(s.controls);
   const bytes=spans.map(([a,n])=>machine.memory.slice(a,a+n));
   if(c.track===5){let pointer=machine.get(0x1efa2+95*2);pointer=((pointer&255)<<8)|(pointer>>8);bytes.push(machine.memory.slice(0x1ef82+pointer-0xb100,0x1ef82+pointer-0xb100+74));}
   assert.equal(Buffer.concat(bytes).toString('hex'),s.raw,`track ${c.track}, super ${c.superLeague}, tick ${tick}`);
   compareState(s.state);
  }
 }
});

test('display rates of 30, 60, 120 and 144 Hz produce identical original simulation state',()=>{
 const states=[];
 for(const hz of [30,60,120,144]) {
  const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true}),clock=new SimulationClock();
  for(let i=0;i<hz*18;i++)clock.advance(1/hz,dt=>car.step(dt,clock.ticks<60?{}:{throttle:true,boost:true}));
  assert.equal(clock.ticks,150);assert.ok(clock.alpha<1e-9);
  states.push({...car.snapshot(),boost:car.boost,speed:car.speed});
 }
 for(const state of states.slice(1))assert.deepEqual(state,states[0]);
});

test('render interpolation is smooth, wraps angles and never mutates original state',()=>{
 const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});
 for(let i=0;i<110;i++)car.step(ORIGINAL_STEP,i<60?{}:{throttle:true,boost:true});
 const raw=machine.memory.slice(0x1baf8,0x1bdd0),snapshot=car.snapshot();
 const positions=Array.from({length:15},(_,i)=>interpolatePose(car.previous,car,i/14));
 assert.deepEqual(positions[0],car.previous);assert.ok(Math.abs(positions.at(-1).x-car.x)<1e-10);
 for(let i=1;i<positions.length;i++)assert.ok(positions[i].x<positions[i-1].x);
 assert.deepEqual(machine.memory.slice(0x1baf8,0x1bdd0),raw);assert.deepEqual(car.snapshot(),snapshot);
 const p={x:0,y:0,z:0,yaw:Math.PI-.01,pitch:0,roll:0};
 const q={...p,yaw:-Math.PI+.01};assert.ok(Math.abs(wrapAngle(interpolatePose(p,q,.5).yaw-Math.PI))<1e-12);
});

test('manual crane recovery uses original placement, waits for fire and releases above the road',()=>{
 const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});car.resetAt(34);
 assert.equal(car.lastPiece,33);assert.equal(car.falls,1);
 for(let i=0;i<100;i++)car.step(ORIGINAL_STEP);
 assert.ok(car.recovery>0,'recovered car waits for the release button');
 for(let i=0;i<100;i++){car.step(ORIGINAL_STEP,{boost:true});if(!car.recovery)break;}
 assert.equal(car.recovery,0);assert.equal(car.grounded,false,'crane releases in the air');
 for(let i=0;i<100&&!car.grounded;i++)car.step(ORIGINAL_STEP);
 assert.ok(car.grounded,'released car lands on the ramp');
 for(let i=0;i<42;i++)car.step(ORIGINAL_STEP,{brake:true});
 let cleared=false;
 for(let i=0;i<220;i++){car.step(ORIGINAL_STEP,{throttle:true,boost:true});if(car.lastPiece>=36&&car.lastPiece<=38&&car.grounded){cleared=true;break;}}
 assert.ok(cleared);assert.equal(car.falls,1);
});

test('displayed bridge vertices use the original mutable collision height tables',()=>{
 const track=new Track(tracks[5]),car=new OriginalCar(track,machine,{practice:true});
 const initial=track.pieces[51].points[4][0][1];
 for(let i=0;i<20;i++)car.step(ORIGINAL_STEP);
 assert.notEqual(track.pieces[51].points[4][0][1],initial);
 const heights=machine.bridgeHeights(track.data);
 for(const {piece,rows} of heights)rows.forEach((row,j)=>row.forEach((height,side)=>assert.equal(track.pieces[piece].points[j][side][1],height)));
 const view=Object.create(WorldRenderer.prototype);
 Object.assign(view,{track,trackGroup:new THREE.Group(),palette:JSON.parse(read('../public/assets/palette.json')).map(p=>new THREE.Color(...p.map(v=>v/255)))});
 view.buildTrack();const unchanged=JSON.stringify(heights);
 for(const alpha of [0,.25,.5,.75,1]) {
  view.interpolateBridge(alpha);
  for(const [index,point] of view.bridgeVertices) {
   const previous=track.previousBridgeHeights.get(point);
   assert.ok(Math.abs(view.roadPositions.array[index]-(previous+(point[1]-previous)*alpha))<1e-5);
  }
  assert.equal(JSON.stringify(machine.bridgeHeights(track.data)),unchanged,'GPU interpolation must not alter native collision profiles');
 }
 view.disposeGroup(view.trackGroup);
 machine.put(0x1bb1c,52,1);const before=JSON.stringify(machine.bridgeHeights(track.data));machine.call(0x5a794);
 assert.equal(JSON.stringify(machine.bridgeHeights(track.data)),before);
});

test('off-road ground contact triggers the original recovery grace period and safe section',()=>{
 const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});
 for(let i=0;i<80;i++)car.step(ORIGINAL_STEP);
 const safe=machine.get(0x1bb9b,1);
 machine.put(0x1bcd8,450*131072,4);machine.put(0x1bce0,450*131072,4);machine.put(0x1bcdc,25*262144,4);machine.locate();car.readState();
 for(let i=0;i<160&&!car.falls;i++)car.step(ORIGINAL_STEP);
 assert.equal(car.falls,1);assert.equal(car.lastPiece,safe);assert.ok(car.recovery>0);
 assert.deepEqual(car.previous,car.snapshot(),'no interpolation across the relocation');
});

test('season rival contact is resolved by the original collision routine',()=>{
 const track=new Track(tracks[0]),car=new OriginalCar(track,machine),rival=new Rival(track);
 for(let i=0;i<100;i++)car.step(ORIGINAL_STEP);
 for(let i=0;i<30;i++)car.step(ORIGINAL_STEP,{throttle:true,boost:true});
 const near=track.nearest(car.x,car.z);rival.distance=near.distance+1;rival.pose=track.atDistance(rival.distance,.25);rival.speed=0;
 machine.setOpponent(track,rival);
 assert.ok(machine.get(0x1bb46,1),'native collision flag set');
 const before=car.speed;car.step(ORIGINAL_STEP);
 // Local speed in $1BD30 is sampled before acceleration. World velocity is
 // updated during this tick and reflects the native collision impulse.
 const forward=car.vx*Math.sin(car.yaw)+car.vz*Math.cos(car.yaw);
 assert.ok(forward<before-5,`${forward} must be slower than ${before}`);
 assert.ok(car.damage>0);
});

test('native bank angles map to a cockpit that follows the road rather than leaning against it',()=>{
 for(const d of [tracks[0],tracks[2],tracks[3],tracks[6]]) {
  const track=new Track(d),car=new OriginalCar(track,machine,{practice:true});
  const p=track.segments.filter(s=>!s.gap).map(s=>track.atDistance(s.distance+s.length/2)).sort((a,b)=>Math.abs(b.roll)-Math.abs(a.roll))[0];
  machine.put(0x1bbdf,0,1);
  for(const [a,v,scale] of [[0x1bcd8,p.x,131072],[0x1bcdc,p.y,262144],[0x1bce0,p.z,131072],[0x1bce4,p.pitch,65536/(2*Math.PI)],[0x1bce6,p.yaw,65536/(2*Math.PI)],[0x1bce8,-p.roll,65536/(2*Math.PI)]])machine.put(a,Math.round(v*scale),a<0x1bce4?4:2);
  for(let a=0x1bcea;a<0x1bd02;a+=2)machine.put(a,0);
  machine.locate();for(let i=0;i<12;i++)machine.step(0);car.readState();
  const surface=track.surface(car.x,car.z);
  assert.ok(surface,`${d.name}: on the bank`);
  const up=carFrame(car.yaw,car.pitch,car.roll).up;
  const normal=[-surface.dx,1,-surface.dz],length=Math.hypot(...normal);
  assert.ok(up.reduce((sum,v,i)=>sum+v*normal[i]/length,0)>.98,`${d.name}: car up must follow the bank's normal`);
 }
});
