import test,{after} from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import createUnicorn from '../src/vendor/unicorn-x86.mjs';
import {DosMachine} from '../src/dos-machine.js';
import {OriginalCar} from '../src/original-car.js';
import {Track,wrapAngle} from '../src/track.js';
import {Rival} from '../src/rival.js';
import {SimulationClock} from '../src/simulation-clock.js';
import {carFrame} from '../src/orientation.js';

const read=name=>fs.readFileSync(new URL(name,import.meta.url));
const json=name=>JSON.parse(read(name)),hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
const manifest=json('../public/assets/dos-physics.json');
const payload=read('../public/assets/dos-physics.bin'),cockpit=read('../public/assets/dos-cockpit.bin');
const machine=new DosMachine(await createUnicorn(),payload,manifest,cockpit);
const tracks=json('../public/assets/tracks.json');
after(()=>machine.dispose());

test('DOS browser code and damage bitplanes are unchanged bytes from the supplied executable',()=>{
 const exe=read('../analysis/dos/CAR-decoded.exe');
 assert.equal(hash(exe),manifest.decodedExeSha256);
 for(const [bytes,info] of [[payload,manifest.payload],[cockpit,manifest.cockpit]]) {
  assert.equal(bytes.length,info.bytes);assert.equal(hash(bytes),info.sha256);
  assert.deepEqual(bytes,exe.subarray(info.sourceFileOffset,info.sourceFileOffset+info.bytes));
 }
});

test('DOS WASM matches all 25,424 native reference updates across eight tracks, two leagues and two calibrations',()=>{
 const reference=json('../analysis/dos/physics/gameplay-traces.json');let count=0;
 for(const c of reference.cases) {
  machine.initialise(c.track,{superLeague:c.superLeague,calibration:c.calibration,probe:true});
  assert.equal(machine.stepSeconds,c.nominalTickSeconds);let phase='';
  for(const sample of c.samples) {
   if(sample.phase==='hold-crane'&&phase!=='hold-crane') {
    machine.recover(c.recoveryRequested);assert.equal(machine.get(0x5480),c.recoverySelected);
   }
   phase=sample.phase;machine.step(sample.controls);
   assert.equal(hash(machine.readMemory(0x19d80,65536)),sample.dataSha256,
    `track ${c.track}, super ${c.superLeague}, calibration ${c.calibration}, tick ${sample.tick}`);
   const actual=machine.state();
   for(const key of ['x','y','z','pitch','yaw','roll'])assert.equal(actual[key],sample.world[key]);
   count++;
  }
 }
 assert.equal(count,25424);
});

test('DOS race adapter settles without damage on all tracks and displays the native bridge heights',()=>{
 for(const d of tracks) {
  const track=new Track(d),car=new OriginalCar(track,machine,{practice:true});
  const initialBridge=d.id===5?track.pieces[51].points[4][0][1]:null;
  for(let i=0;i<220;i++)car.step(machine.stepSeconds);
  assert.equal(car.recovery,0,d.name);assert.ok(car.grounded,d.name);assert.equal(car.damage,0,d.name);
  if(d.id===5) {
   assert.notEqual(track.pieces[51].points[4][0][1],initialBridge);
   for(const {piece,rows} of machine.bridgeHeights(d))rows.forEach((row,j)=>row.forEach((y,side)=>assert.equal(track.pieces[piece].points[j][side][1],y)));
  }
 }
});

test('DOS native steering directions and banked cockpit orientation agree with the rendered road',()=>{
 for(const direction of ['left','right']) {
  const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});
  for(let i=0;i<220;i++)car.step(machine.stepSeconds);
  for(let i=0;i<45;i++)car.step(machine.stepSeconds,{throttle:true});
  const yaw=car.yaw;for(let i=0;i<5;i++)car.step(machine.stepSeconds,{[direction]:true});
  assert.ok(wrapAngle(car.yaw-yaw)*(direction==='left'?1:-1)>.002);
 }
 for(const id of [0,2,3,6]) {
  const track=new Track(tracks[id]),car=new OriginalCar(track,machine,{practice:true});
  const p=track.segments.filter(s=>!s.gap).map(s=>track.atDistance(s.distance+s.length/2)).sort((a,b)=>Math.abs(b.roll)-Math.abs(a.roll))[0];
  machine.put(0x4ae1,0);
  for(const [axis,value] of [p.x*512,p.y*1024,p.z*512].entries())
   for(let plane=0;plane<3;plane++)machine.put(0x530c+axis+plane*3,Math.round(value)>>plane*8);
  for(const [axis,value] of [p.pitch,p.yaw,-p.roll].entries()) {
   const raw=Math.round(value*65536/(Math.PI*2));machine.put(0x532d+axis,raw);machine.put(0x5330+axis,raw>>8);
  }
  for(let a=0x5315;a<0x532d;a++)machine.put(a,0);
  machine.locate();for(let i=0;i<25;i++)machine.step(0);car.readState();
  const surface=track.surface(car.x,car.z);assert.ok(surface);
  const up=carFrame(car.yaw,car.pitch,car.roll).up,normal=[-surface.dx,1,-surface.dz],length=Math.hypot(...normal);
  assert.ok(up.reduce((sum,v,i)=>sum+v*normal[i]/length,0)>.98,track.name);
 }
});

test('DOS crane skips Little Ramp jump section, waits for release and permits the original reverse run-up',()=>{
 const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});
 for(let i=0;i<220;i++)car.step(machine.stepSeconds);
 car.resetAt(34);assert.equal(car.lastPiece,33);
 for(let i=0;i<240;i++)car.step(machine.stepSeconds);
 assert.ok(car.recovery>0);
 for(let i=0;i<240&&(!car.grounded||car.recovery);i++)car.step(machine.stepSeconds,{boost:true});
 assert.ok(car.grounded);assert.equal(car.recovery,0);
 for(let i=0;i<Math.round(5/machine.stepSeconds);i++)car.step(machine.stepSeconds,{brake:true});
 let cleared=false;
 for(let i=0;i<400;i++) {
  car.step(machine.stepSeconds,{throttle:true,boost:true});
  if(car.lastPiece>=36&&car.lastPiece<=38&&car.grounded){cleared=true;break;}
 }
 assert.ok(cleared);assert.equal(car.falls,1);
});

test('DOS automatic recovery uses the original ground-contact delay and saved road section',()=>{
 const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true});
 for(let i=0;i<220;i++)car.step(machine.stepSeconds);
 const safe=machine.get(0x5415);
 for(const [axis,value] of [450*512,12*1024,450*512].entries())
  for(let plane=0;plane<3;plane++)machine.put(0x530c+axis+plane*3,value>>plane*8);
 machine.locate();car.readState();
 let groundContact=false;
 for(let i=0;i<300&&!car.falls&&!car.finished;i++){car.step(machine.stepSeconds);groundContact ||= car.offRoadGround;}
 assert.ok(groundContact,'dust must be triggered by native ground contact');
 assert.ok(car.events.includes('ground-impact'),'falling onto the ground must play its impact sound');
 assert.equal(car.falls,1);assert.equal(car.lastPiece,safe);assert.ok(car.recovery>0);
 assert.deepEqual(car.previous,car.snapshot());
});

test('DOS rival contact and pixel-dependent crack/wreck logic execute in the native routines',()=>{
 const track=new Track(tracks[0]),car=new OriginalCar(track,machine),rival=new Rival(track);
 for(let i=0;i<220;i++)car.step(machine.stepSeconds);
 for(let i=0;i<65;i++)car.step(machine.stepSeconds,{throttle:true,boost:true});
 rival.distance=track.nearest(car.x,car.z).distance+1;rival.pose=track.atDistance(rival.distance,.25);rival.speed=0;
 machine.setOpponent(track,rival);assert.ok(machine.get(0x547d));
 const before=car.speed;car.step(machine.stepSeconds);
 assert.ok(car.vx*Math.sin(car.yaw)+car.vz*Math.cos(car.yaw)<before-5);
 assert.ok(car.damage>0&&car.damage<100);
 machine.put(0x545e,0x80);for(let i=0;i<3;i++)machine.put(0x54d0+i,240);
 machine.call(0x1ed4,{},[0xfff0,0x2393]);assert.ok(machine.drivingStatus().wreck);
});

test('DOS season rival starts ahead of the actual crane position without an immediate collision',()=>{
 const track=new Track(tracks[0]),car=new OriginalCar(track,machine),rival=new Rival(track,0,car.progress);
 for(let i=0;i<240;i++) {
  const onChains=car.recovery;car.step(machine.stepSeconds,i>175?{throttle:true}:{});
  if(!onChains){rival.speed=machine.opponentSpeed;rival.step(machine.stepSeconds,car);machine.setOpponent(track,rival);}
 }
 assert.equal(car.damage,0);assert.equal(car.falls,0);assert.ok(car.speed>10);
});

test('DOS physics is identical at 30, 60, 120 and 144 Hz display rates',()=>{
 const snapshots=[];
 for(const hz of [30,60,120,144]) {
  const car=new OriginalCar(new Track(tracks[0]),machine,{practice:true}),clock=new SimulationClock(machine.stepSeconds);
  for(let i=0;i<hz*18;i++)clock.advance(1/hz,dt=>car.step(dt,clock.ticks<220?{}:{throttle:true,boost:true}));
  snapshots.push({...car.snapshot(),speed:car.speed,boost:car.boost,ticks:clock.ticks});
 }
 for(const s of snapshots.slice(1))assert.deepEqual(s,snapshots[0]);
 assert.equal(snapshots[0].ticks,Math.floor(18/.054921875));
});
