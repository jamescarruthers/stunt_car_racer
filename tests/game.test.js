// Historical continuous-solver checks; current gameplay is covered by emulated-physics.test.js.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {Track,wrapAngle} from '../src/track.js';
import {Car,STEP} from '../tools/reference-physics.js';
const data=JSON.parse(fs.readFileSync(new URL('../public/assets/tracks.json',import.meta.url)));
const ticks=(car,seconds,input={})=>{for(let i=0;i<seconds/STEP;i++)car.step(STEP,input);};
test('asset manifest matches the supplied disk byte ranges',()=>{
 const manifest=JSON.parse(fs.readFileSync(new URL('../public/assets/manifest.json',import.meta.url)));
 const disk=fs.readFileSync(new URL(`../original/${manifest.disk.file}`,import.meta.url));const hash=b=>crypto.createHash('sha256').update(b).digest('hex');
 assert.equal(hash(disk),manifest.disk.sha256);for(const a of manifest.assets)assert.equal(hash(disk.subarray(a.diskOffset,a.diskOffset+a.sourceBytes)),a.sha256,a.file);
});
test('all eight original circuits close, contain finite coordinates and have a valid start',()=>{
 assert.deepEqual(data.map(t=>t.pieces.length),[44,56,53,44,40,78,52,78]);
 for(const t of data){const track=new Track(t);assert.ok(track.length>2500);assert.ok(t.spawn<t.pieces.length);for(let i=0;i<t.pieces.length;i++){const p=t.pieces[i],n=t.pieces[(i+1)%t.pieces.length];for(let side=0;side<2;side++)for(let axis=0;axis<3;axis++){assert.ok(Number.isFinite(p.points[0][side][axis]));assert.ok(Math.abs(p.points.at(-1)[side][axis]-n.points[0][side][axis])<=1,`${t.name} join ${i}`);}}}
});
test('crane lowers and parked suspension settles on every track without damage',()=>{
 for(const t of data){const track=new Track(t),car=new Car(track);ticks(car,8);assert.ok(car.grounded,t.name);assert.equal(car.damage,0);const surface=track.surface(car.x,car.z);assert.ok(Math.abs(car.y-surface.y-.9)<.2);assert.ok(Math.abs(car.vy-surface.dx*car.vx-surface.dz*car.vz)<.2,t.name);}
});
test('throttle, boost, brake and steering change motion independently',()=>{
 const normal=new Car(new Track(data[0])),boost=new Car(new Track(data[0]));ticks(normal,3);ticks(boost,3);ticks(normal,5,{throttle:true});ticks(boost,5,{throttle:true,boost:true});assert.ok(boost.speed>normal.speed+15);assert.ok(boost.boost<normal.boost);
 const speed=normal.speed;ticks(normal,1,{brake:true});assert.ok(normal.speed<speed-6.5);const yaw=normal.yaw;ticks(normal,.4,{throttle:true,right:true});assert.ok(wrapAngle(normal.yaw-yaw)<-.01);
});
test('leaving a raised track falls, incurs a recovery penalty, and returns to the road',()=>{
 const car=new Car(new Track(data[0]));ticks(car,3);car.x=450;car.z=450;car.y=25;const before=car.y;ticks(car,1);assert.ok(before-car.y>4.5&&before-car.y<4.9);ticks(car,8);assert.ok(car.falls>=1);assert.ok(car.damage>=8);assert.ok(car.grounded);
});
test('finish line requires passing the half-lap checkpoint and forward travel',()=>{
 const car=new Car(new Track(data[0]));const finish=(car.track.data.finish+1)%car.track.pieces.length;car.lapTime=60;car.checkLap(finish,40);assert.equal(car.laps,0);car.checkLap(car.track.data.half,-1);car.checkLap(finish,40);assert.equal(car.laps,0);car.checkLap(car.track.data.half,40);car.checkLap(finish,-1);assert.equal(car.laps,0);car.checkLap(finish,40);assert.equal(car.laps,1);assert.equal(car.bestLap,60);
});
test('drawbridge geometry animates and stops while a car occupies it',()=>{
 const track=new Track(data[5]),before=track.pieces[51].points[4][0][1];track.updateBridge(.5,-1,-1);const after=track.pieces[51].points[4][0][1];assert.notEqual(before,after);track.updateBridge(1,52,-1);assert.equal(track.pieces[51].points[4][0][1],after);
});

import {League} from '../src/league.js';
const config=JSON.parse(fs.readFileSync(new URL('../public/assets/config.json',import.meta.url)));
test('season races both rivals on both original division tracks and persists promotion',()=>{
 const league=new League(config),matches=[];
 for(let i=0;i<4;i++){matches.push([league.opponent,league.track]);league.record(true,true);}
 assert.deepEqual(matches,[[0,0],[1,2],[1,0],[0,2]]);assert.equal(league.division,3);assert.equal(league.race,0);assert.ok(league.members.includes('YOU'));
 const restored=new League(config,JSON.parse(JSON.stringify(league.serialize())));assert.equal(restored.division,3);assert.equal(restored.track,1);assert.equal(restored.members.length,3);assert.equal(restored.roster.flat().filter(id=>id==='YOU').length,1);
});
test('fall recovery invalidates the current lap record and a race ends after three valid circuits',()=>{
 const car=new Car(new Track(data[0]));car.resetAt(car.lastPiece);car.lapTime=50;const finish=(car.track.data.finish+1)%car.track.pieces.length;
 car.checkLap(car.track.data.half,40);car.checkLap(finish,40);assert.equal(car.bestLap,Infinity);assert.equal(car.laps,1);
 for(let i=0;i<2;i++){car.lapTime=60+i;car.checkLap(car.track.data.half,40);car.checkLap(finish,40);}
 assert.equal(car.bestLap,60);assert.equal(car.laps,3);assert.equal(car.finished,true);
});

test('a boosted car clears Little Ramp and lands on the far ramp without tunnelling',()=>{
 const track=new Track(data[0]),car=new Car(track,{practice:true});const p=track.atDistance(track.pieceDistance[32]);
 Object.assign(car,{x:p.x,y:p.y+.9,z:p.z,yaw:p.yaw,pitch:p.pitch,roll:p.roll,vx:Math.sin(p.yaw)*90,vz:Math.cos(p.yaw)*90,vy:0,recovery:0,grounded:true,lastPiece:32,previousProgress:p.distance});
 let airborne=false,landed=false;for(let i=0;i<6/STEP;i++){car.step(STEP,{throttle:true,boost:true});airborne ||= car.airTime>.4;if(airborne&&car.grounded&&car.lastPiece>=35){landed=true;break;}}
 assert.ok(airborne);assert.ok(landed);assert.equal(car.falls,0);assert.ok(car.damage<15);
});
