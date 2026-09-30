// Archived continuous solver, retained only for the historical audit tests.
// The browser game never imports this module.
import {clamp,lerp,wrapAngle} from '../src/track.js';
import {carFrame,planeGradient,roadAngles} from '../src/orientation.js';
import {roadSteering} from '../src/steering.js';
// Continuous browser solver. These scales come from this disk's PAL physics:
// six video frames per update, velocity/position reduction 238/256, and
// 2048 fixed-point speed units per world-unit displacement (see analysis/FORMAT.md).
export const STEP=1/120;
const ORIGINAL_RATE=50/6,REDUCED_RATE=ORIGINAL_RATE*238/256;
const ACCELERATION_SCALE=REDUCED_RATE**2/2048;
const ANGULAR_ACCELERATION_SCALE=REDUCED_RATE**2*2*Math.PI/65536;
export const CAR={halfWidth:1,halfLength:2,rideHeight:.9,
 gravity:317*ACCELERATION_SCALE,engine:240*ACCELERATION_SCALE,superEngine:320*ACCELERATION_SCALE,
 engineLoss:REDUCED_RATE/256,speedLimit:30720*REDUCED_RATE/2048,drag:1/1024,steeringResponse:-Math.log(1-238/256)*ORIGINAL_RATE,
 spring:1024*ACCELERATION_SCALE,damping:1024*ACCELERATION_SCALE*(276/256)/ORIGINAL_RATE,
 maxSuspensionForce:0x11ff*ACCELERATION_SCALE};
export function wheelSupportForce(depth,velocity) {
 const compression=depth+CAR.gravity/CAR.spring;
 return compression>-.75?clamp(Math.min(compression,5)*CAR.spring-velocity*CAR.damping,0,CAR.maxSuspensionForce):0;
}
export function lateralGripAcceleration(speed,normal,gravity=0) {
 // $6217A: cancel small lateral slip; cap larger corrections at twice the
 // supporting force. Raw speed enters the original acceleration directly.
 const correction=gravity-speed*REDUCED_RATE,limit=2*Math.max(0,normal);
 return Math.abs(correction)>limit?gravity-(speed<0?-1:1)*limit:-speed*REDUCED_RATE;
}
export class Car {
 constructor(track,{superLeague=false,practice=false}={}) {
  this.track=track;this.superLeague=superLeague;this.practice=practice;this.damage=0;this.boost=superLeague?track.data.superBoost:track.data.boost;
  this.time=0;this.lapTime=0;this.bestLap=Infinity;this.laps=0;this.lapTimes=[];this.events=[];this.halfPassed=false;this.finished=false;this.falls=0;this.totalProgress=0;this.lapValid=true;
  this.resetAt(track.data.spawn,true);
 }
 resetAt(piece,initial=false) {
  const p=this.track.recoveryPose(piece);piece=p.piece;
  Object.assign(this,{x:p.x,y:p.y+CAR.rideHeight+5,z:p.z,yaw:p.yaw,pitch:p.pitch,roll:p.roll,vx:0,vy:0,vz:0,pitchVelocity:0,rollVelocity:0,speed:0,grounded:false,contacts:0,boosting:false,recovery:2.3,fallTime:0,airTime:0,shake:0,lastPiece:piece,progress:p.distance,previousProgress:p.distance,steer:0,throttle:0});
  this.yawVelocity=0;this.airPitchClock=0;this.airPitchForce=0;this.recoveryTarget=p;this.previous=this.snapshot();
  if(!initial){this.falls++;this.damage=clamp(this.damage+8,0,100);this.lapValid=false;this.events.push('recover');}
 }
 snapshot(){return {x:this.x,y:this.y,z:this.z,yaw:this.yaw,pitch:this.pitch,roll:this.roll};}
 step(dt,input={}) {
  this.previous=this.snapshot();this.shake=Math.max(0,this.shake-dt*5);this.time+=dt;
  if(this.finished)return;
  if(this.damage>=100){this.finished=true;this.events.push('wreck');return;}
  if(this.recovery>0){this.recovery=Math.max(0,this.recovery-dt);const p=this.recoveryTarget;this.y=p.y+CAR.rideHeight+5*this.recovery/2.3;this.roll=p.roll+Math.sin(this.recovery*5)*this.recovery*.025;return;}
  this.lapTime+=dt;
  if(input.throttle||input.boost)this.throttle=1;if(input.brake)this.throttle=0; // Original throttle latches until braking.
  const direction=(input.left?1:0)-(input.right?1:0);
  this.steer=direction;
  const fy=Math.sin(this.yaw),fz=Math.cos(this.yaw),rx=fz,rz=-fy;
  let forward=this.vx*fy+this.vz*fz,lateral=this.vx*rx+this.vz*rz;
  this.speed=forward;
  this.boosting=!!(input.boost&&this.boost>0&&(this.throttle||input.brake));
  if(this.boosting)this.boost=Math.max(0,this.boost-dt*(this.superLeague?.7:.52));
  let forceY=-CAR.gravity,contacts=0,roadContacts=0,supportSurface=null;const wheels=[],frame=carFrame(this.yaw,this.pitch,this.roll);
  for(const [wx,wz,weight] of [[-1,2,.25],[1,2,.25],[0,-2,.5]]) {
   const x=this.x+frame.side[0]*wx+frame.forward[0]*wz,z=this.z+frame.side[2]*wx+frame.forward[2]*wz;
   const wheelY=this.y+frame.forward[1]*wz+frame.side[1]*wx-CAR.rideHeight;
   const hit=this.track.surface(x,z,wheelY),floor=hit?hit.y:0;
   const depth=floor-wheelY;
   const roadVelocity=hit?hit.dx*this.vx+hit.dz*this.vz:0;
   const cp=Math.cos(this.pitch),sp=Math.sin(this.pitch),sr=Math.sin(this.roll),cr=Math.cos(this.roll);
   const velocity=this.vy-roadVelocity+this.pitchVelocity*(cp*wz-sp*sr*wx)+this.rollVelocity*cp*cr*wx;
   const force=wheelSupportForce(depth,velocity);
   forceY+=force*weight;
   wheels.push(hit?[x,floor,z]:null);
   if(force>0){contacts++;if(hit){roadContacts++;supportSurface ||= hit;}}
  }
  this.contacts=contacts;
  // The original gates steering on any road contact, not a two-wheel majority.
  // Banking can unload two wheels briefly without lifting the car off the road.
  const wasGrounded=this.grounded;this.grounded=roadContacts>0;
  if(contacts>0) {
   if(!wasGrounded&&this.airTime>.35&&this.vy<-7){const severity=Math.max(0,(-this.vy-7)*.4+Math.abs(this.roll)*3);this.damage=clamp(this.damage+severity,0,100);this.shake=Math.min(2,severity/8);this.events.push('land');}
   this.airTime=0;
  } else {this.airTime+=dt;}
  const center=this.track.surface(this.x,this.z,this.y-CAR.rideHeight);
  if(this.grounded) {
   this.airPitchClock=0;
   // Fit the actual contact plane, including camber and the car's heading.
   // A wheel over an edge must not abruptly level the car.
   const plane=wheels.every(w=>w!==null)?planeGradient(...wheels):center;
   const {pitch:targetPitch,roll:targetRoll}=plane?roadAngles(plane.dx,plane.dz,this.yaw):this;
   const acceleration=(this.superLeague&&!input.brake?CAR.superEngine:CAR.engine)*(this.boosting?2:1);
   let engine=input.brake?-acceleration:this.throttle?acceleration:0;
   // Original reverse uses the same engine force; boost can brake/reverse too.
   // Only forward drive has the speed-dependent loss and absolute speed cut.
   if(engine>0&&forward>0)engine=forward>=CAR.speedLimit?0:Math.max(0,engine-CAR.engineLoss*forward);
   const traction=2*Math.max(0,forceY+CAR.gravity);
   engine=clamp(engine,-traction,traction);
   forward+=(engine-CAR.gravity*Math.sin(this.pitch)-CAR.drag*forward*Math.abs(forward))*dt;
   lateral+=lateralGripAcceleration(lateral,forceY+CAR.gravity,-CAR.gravity*frame.side[1])*dt;
   const steeringSurface=center||supportSurface;
   if(steeringSurface)this.yawVelocity=lerp(this.yawVelocity,roadSteering(steeringSurface,this.yaw,forward,this.steer),1-Math.exp(-dt*CAR.steeringResponse));
   const pitchTarget=targetPitch+clamp(engine*.0017,-.06,.05);
   this.pitchVelocity+=(wrapAngle(pitchTarget-this.pitch)*65-this.pitchVelocity*12)*dt;
   this.rollVelocity+=(wrapAngle(targetRoll-this.roll)*65-this.rollVelocity*12)*dt;
  } else {
   // $61FE0 chooses nose-down torque once per original physics update. Keep
   // that cadence: selecting it each browser substep loses the original impulse
   // as soon as the nose passes horizontal. $62138 damps angular speed by 1/16.
   if(this.airPitchClock<=0) {
    let torque=this.pitch>=0?(this.pitch>=Math.PI/8?-256:-128):this.track.id===4?-8:this.track.id===7?-128:0;
    if(this.pitchVelocity < -256*REDUCED_RATE*2*Math.PI/65536)torque=0;
    this.airPitchForce=torque*ANGULAR_ACCELERATION_SCALE;this.airPitchClock+=1/ORIGINAL_RATE;
   }
   this.airPitchClock-=dt;
   this.pitchVelocity+=(this.airPitchForce-this.pitchVelocity*REDUCED_RATE/16)*dt;
   this.rollVelocity*=Math.exp(-dt*REDUCED_RATE/16);
   const drag=CAR.drag*Math.max(Math.abs(forward),Math.abs(lateral));
   forward*=Math.exp(-dt*drag);lateral*=Math.exp(-dt*drag);forceY-=this.vy*drag;
  }
  this.yaw+=this.yawVelocity*dt;
  this.pitch=clamp(this.pitch+this.pitchVelocity*dt,-1.4,1.4);this.roll=clamp(this.roll+this.rollVelocity*dt,-1.4,1.4);
  // An airborne car keeps its world momentum while its body can keep rotating.
  const velocityYaw=this.grounded?this.yaw:this.previous.yaw;
  this.vx=Math.sin(velocityYaw)*forward+Math.cos(velocityYaw)*lateral;
  this.vz=Math.cos(velocityYaw)*forward-Math.sin(velocityYaw)*lateral;
  this.vy=clamp(this.vy+forceY*dt,-100,100);
  this.x+=this.vx*dt;this.z+=this.vz*dt;this.y+=this.vy*dt;
  // Resolve a swept landing before the suspension can pass through a thin road.
  // Springs supply the bounce; this nonpenetration constraint handles hard impacts.
  const landing=this.track.surface(this.x,this.z,this.y-CAR.rideHeight);
  if(landing&&this.y<landing.y+.55&&this.previous.y>landing.y-1.2){
   this.y=landing.y+.55;this.vy=Math.max(this.vy,landing.dx*this.vx+landing.dz*this.vz);
  }
  if(this.y<CAR.rideHeight*.4){this.y=CAR.rideHeight*.4;this.vy=Math.max(0,this.vy)*.2;this.vx*=Math.exp(-dt*2);this.vz*=Math.exp(-dt*2);}
  if(center&&this.y-center.y<8) {
   this.progress=center.distance;this.lastPiece=center.piece;
   let delta=this.progress-this.previousProgress;if(delta>this.track.length/2)delta-=this.track.length;if(delta<-this.track.length/2)delta+=this.track.length;
   if(Math.abs(delta)<100)this.totalProgress+=delta;
   this.previousProgress=this.progress;
   this.checkLap(center.piece,forward);
   this.fallTime=0;
  } else {this.fallTime+=dt;}
  if(this.fallTime>4.5||input.recover)this.resetAt(this.lastPiece);
 }
 checkLap(piece,speed) {
  if(piece===this.track.data.half&&speed>0)this.halfPassed=true;
  const finish=(this.track.data.finish+1)%this.track.pieces.length;
  if(piece===finish&&this.halfPassed&&speed>0){this.halfPassed=false;this.laps++;this.lapTimes.push(this.lapTime);if(this.lapValid)this.bestLap=Math.min(this.bestLap,this.lapTime);this.lapValid=true;this.lapTime=0;this.events.push('lap');if(this.laps>=3&&!this.practice){this.finished=true;this.events.push('finish');}}
 }
}
