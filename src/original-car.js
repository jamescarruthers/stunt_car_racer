import {clamp} from './track.js';

// Race bookkeeping around the emulated player. Position, rotation, contacts,
// velocities, engine, suspension and crane motion come from the selected CPU.
export class OriginalCar {
 constructor(track,machine,{superLeague=false,practice=false}={}) {
  this.track=track;this.machine=machine;this.superLeague=superLeague;this.practice=practice;
  this.time=0;this.lapTime=0;this.bestLap=Infinity;this.laps=0;this.lapTimes=[];
  this.events=[];this.halfPassed=false;this.finished=false;this.falls=0;
  this.totalProgress=0;this.lapValid=true;this.damage=0;this.shake=0;
  machine.initialise(track.id,{superLeague});
  this.syncBridge();this.resetAt(track.data.spawn,true);
 }
 snapshot(){return {x:this.x,y:this.y,z:this.z,yaw:this.yaw,pitch:this.pitch,roll:this.roll};}
 readState() {
  const s=this.machine.state();Object.assign(this,s);
  // Original Z rotation is clockwise in its camera convention. Three.js carFrame
  // uses positive roll to raise the driver's left side. This is presentation only.
  this.roll=-s.roll||0;
  this.lastPiece=s.section;this.recovery=s.chains?1:0;
  const status=this.machine.drivingStatus();this.nativeStatus=status;
  this.grounded=s.contact&&!status.offRoad;this.contacts=status.contacts;
  this.offRoadGround=status.offRoadGround&&s.contact&&!s.chains;this.suspension=status.suspension;
  this.boost=status.boost;this.boosting=status.boosting&&!s.chains;this.throttle=status.throttle;
 }
 resetAt(piece,initial=false) {
  if(!initial||!this.machine.readyAtStart)this.machine.recover(piece);
  this.readState();
  this.fallTime=0;this.airTime=0;this.shake=0;this.autoRelease=initial;
  this.progress=this.track.nearest(this.x,this.z).distance;this.previousProgress=this.progress;
  // A relocation has no meaningful interpolated path through the scenery.
  this.previous=this.snapshot();
  if(!initial){this.falls++;this.lapValid=false;this.events.push('recover');}
 }
 syncBridge() {
  const heights=this.machine.bridgeHeights(this.track.data);
  if(heights)this.track.applyOriginalBridge(heights);
 }
 step(dt,input={}) {
  if(Math.abs(dt-this.machine.stepSeconds)>1e-10)throw new Error('Physics must advance one native tick');
  if(this.finished)return;
  if(input.recover){this.resetAt(this.lastPiece);return;}
  this.previous=this.snapshot();this.time+=dt;this.shake=Math.max(0,this.shake-dt*5);
  const wasGrounded=this.grounded,wasOnChains=this.recovery>0,wasOnGround=this.offRoadGround;
  // Local +X is left in the Three.js cockpit. Opposing steering keys cancel.
  const steer=(input.left?1:0)-(input.right?1:0);
  const fire=!!input.boost||(wasOnChains&&this.autoRelease);
  const accelerate=!!input.throttle||(!wasOnChains&&fire);
  const controls=(input.brake?2:accelerate?1:0)|(steer>0?8:steer<0?4:0)|(fire?16:0);
  this.machine.step(controls);this.readState();this.syncBridge();
  if(!this.recovery)this.autoRelease=false;
  if(!wasOnChains)this.lapTime+=dt;
  this.airTime=this.contact?0:this.airTime+dt;
  // Impact counters are maintained by the original collision routines.
  const m=this.machine,status=this.nativeStatus;
  this.damage=status.wreck?100:clamp(status.damage,0,100);
  if(!wasGrounded&&this.grounded&&!wasOnChains){this.shake=Math.min(2,status.impact);this.events.push('land');}
  if(!wasOnGround&&this.offRoadGround&&!wasOnChains){this.shake=Math.min(2,status.impact);this.events.push('ground-impact');}
  if(this.damage>=100){this.finished=true;this.events.push('wreck');}
  if(!status.offRoad&&!this.recovery) {
   this.fallTime=0;
   const nearest=this.track.nearest(this.x,this.z);this.progress=nearest.distance;
   let delta=this.progress-this.previousProgress;
   if(delta>this.track.length/2)delta-=this.track.length;
   if(delta<-this.track.length/2)delta+=this.track.length;
   if(Math.abs(delta)<100)this.totalProgress+=delta;
   this.previousProgress=this.progress;this.checkLap(this.lastPiece,this.speed);
  } else if(!this.recovery) {
   this.fallTime+=dt;
   const section=m.recoveryTarget();
   if(section!==null)this.resetAt(section);
  }
 }
 checkLap(piece,speed) {
  if(piece===this.track.data.half&&speed>0)this.halfPassed=true;
  const finish=(this.track.data.finish+1)%this.track.pieces.length;
  if(piece===finish&&this.halfPassed&&speed>0) {
   this.halfPassed=false;this.laps++;this.lapTimes.push(this.lapTime);
   if(this.lapValid)this.bestLap=Math.min(this.bestLap,this.lapTime);
   this.lapValid=true;this.lapTime=0;this.events.push('lap');
   if(this.laps>=3&&!this.practice){this.finished=true;this.events.push('finish');}
  }
 }
}
