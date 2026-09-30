import {clamp,wrapAngle} from './track.js';

// Season rival policy remains a browser adaptation. Contacts with the player
// are passed to the selected original CPU collision routines.
export class Rival {
 constructor(track,level=0,startDistance=track.pieceDistance[track.data.spawn]){this.track=track;this.distance=startDistance+28;this.initial=this.distance;this.travelled=0;this.speed=0;this.level=level;this.laps=0;this.finished=false;this.bestLap=Infinity;this.lapTime=0;this.halfPassed=false;this.pose=track.atDistance(this.distance,.25);}
 step(dt,car) {
  this.previous={...this.pose};
  this.lapTime+=dt;const ahead=this.track.atDistance(this.distance+45,.24);const curve=Math.abs(wrapAngle(ahead.yaw-this.pose.yaw));
  let target=clamp(57+this.level*4-curve*45-Math.max(0,ahead.pitch)*35,24,78);
  if(car.totalProgress>this.travelled+80)target+=3;
  this.speed+=clamp(target-this.speed,-15*dt,8*dt);const delta=this.speed*dt;this.distance+=delta;this.travelled+=delta;
  const next=this.track.atDistance(this.distance,.25);const prevY=this.pose.y;
  this.pose={...next,y:Math.max(next.y,prevY-35*dt)};
  if(next.piece===this.track.data.half)this.halfPassed=true;
  if(next.piece===(this.track.data.finish+1)%this.track.pieces.length&&this.halfPassed){this.halfPassed=false;this.laps++;this.bestLap=Math.min(this.bestLap,this.lapTime);this.lapTime=0;if(this.laps>=3)this.finished=true;}
 }
}
