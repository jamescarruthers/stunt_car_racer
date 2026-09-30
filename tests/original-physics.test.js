// Historical continuous-solver checks; current gameplay is covered by emulated-physics.test.js.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {Track} from '../src/track.js';
import {Car,STEP,wheelSupportForce,lateralGripAcceleration} from '../tools/reference-physics.js';
import {roadSteering} from '../src/steering.js';

// Recorded by tools/probe-original.py executing the supplied ADF's 68000 code.
// These comparisons allow integer rounding and different integration intervals;
// they do not assert that the browser suspension or complete race is identical.
const reference=JSON.parse(fs.readFileSync(new URL('../analysis/original-physics-traces.json',import.meta.url)));
const manifest=JSON.parse(fs.readFileSync(new URL('../public/assets/manifest.json',import.meta.url)));
assert.equal(reference.sourceSha256,manifest.disk.sha256,'reference traces must use the supplied disk');
const data=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url)))[0];
const advance=(car,seconds,input={})=>{while(seconds>1e-10){const dt=Math.min(seconds,STEP);car.step(dt,input);seconds-=dt;}};

test('falling velocity matches execution of the original physics within 0.05 world units/sec',()=>{
 const car=new Car(new Track(data)),start=reference.freeFall[0];
 Object.assign(car,start,{recovery:0,grounded:false,lastPiece:start.section});
 for(const expected of reference.freeFall.slice(1)) {
  advance(car,reference.physicsStepSeconds);
  assert.ok(Math.abs(car.vy-expected.vy)<.05,`at ${expected.time}s: browser ${car.vy}, original ${expected.vy}`);
  assert.ok(Math.abs(car.pitch-expected.pitch)<.01,`airborne pitch at ${expected.time}s`);
  // Both use velocity-first Euler integration. Account for the original .12s
  // interval versus the browser's 1/120s, without changing the reference data.
  const integrationOffset=.5*Math.abs(expected.vy)*(reference.physicsStepSeconds-STEP);
  assert.ok(Math.abs(car.y-integrationOffset-expected.y)<.1);
 }
});

test('1,134 steering responses across eight original tracks match the CPU probe',()=>{
 const tracks=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url))).map(d=>new Track(d));
 assert.equal(reference.steeringSamples.length,1134);
 for(const s of reference.steeringSamples) {
  const surface=tracks[s.track].surface(s.x,s.z);
  const actual=roadSteering(surface,s.yaw,s.speed,s.input);
  assert.ok(Math.abs(actual-s.rate-s.alignment)<.008,`track ${s.track}, section ${s.piece}, speed ${s.speed}, input ${s.input}`);
 }
});

test('suspension spring and damper forces match execution of original $6180E',()=>{
 const scale=((50/6)*(238/256))**2/2048;
 for(const s of reference.suspensionSamples) {
  // Browser ride height includes a preload of 317 original height units.
  const force=wheelSupportForce((s.compression-317)/1024,-s.change/1024/.12);
  assert.ok(Math.abs(force-s.force*scale)<.03);
 }
});

test('lateral grip follows the original load limit, including loss of support',()=>{
 const rate=(50/6)*(238/256),speedScale=rate/2048,accelerationScale=rate**2/2048;
 for(const s of reference.tractionSamples) {
  const acceleration=lateralGripAcceleration(s.speed*speedScale,s.normal*accelerationScale,s.gravity*accelerationScale);
  assert.ok(Math.abs(acceleration-s.acceleration*accelerationScale)<1e-9);
 }
});

test('normal and boosted braking follow the original stopping and reversing traces',()=>{
 for(const [name,trace] of Object.entries(reference.braking)) {
  const track=new Track(data),car=new Car(track),start=trace[0];
  Object.assign(car,start,{y:track.surface(start.x,start.z).y+.9,recovery:0,grounded:true,lastPiece:start.section});
  for(const expected of trace.slice(1)) {
   advance(car,reference.physicsStepSeconds,{brake:true,boost:name==='boost'});
   const forward=car.vx*Math.sin(start.yaw)+car.vz*Math.cos(start.yaw);
   const original=expected.vx*Math.sin(start.yaw)+expected.vz*Math.cos(start.yaw);
   assert.ok(Math.abs(forward-original)<1.25,`${name} braking at ${expected.time}s`);
  }
 }
});

test('normal, boost and reverse acceleration follow original flat-road traces',()=>{
 for(const [name,trace] of Object.entries(reference.flatAcceleration)) {
  const track=new Track(data),car=new Car(track),start=trace[0];
  Object.assign(car,start,{y:track.surface(start.x,start.z).y+.9,recovery:0,grounded:true,lastPiece:start.section});
  const input={throttle:!name.startsWith('reverse'),brake:name.startsWith('reverse'),boost:name.toLowerCase().includes('boost')};
  // Stop before the reverse-boost recording reaches the preceding curve.
  for(const expected of trace.slice(1).filter(s=>s.time<=3.6)) {
   advance(car,reference.physicsStepSeconds,input);
   const difference=Math.abs(Math.hypot(car.vx,car.vz)-Math.hypot(expected.vx,expected.vz));
   assert.ok(difference<1.25,`${name} at ${expected.time}s differs by ${difference}`);
  }
 }
});
