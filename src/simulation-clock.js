import {ORIGINAL_STEP} from './original-machine.js';
import {clamp,lerp,wrapAngle} from './track.js';

// Presentation can run at 60/120/144 Hz without changing a single physics tick.
export class SimulationClock {
 constructor(stepSeconds=ORIGINAL_STEP){this.stepSeconds=stepSeconds;this.reset();}
 reset(){this.remainder=0;this.ticks=0;}
 advance(seconds,update) {
  this.remainder+=Math.max(0,seconds);
  while(this.remainder+1e-12>=this.stepSeconds) {
   this.remainder=Math.max(0,this.remainder-this.stepSeconds);
   update(this.stepSeconds);this.ticks++;
  }
 }
 get alpha(){return clamp(this.remainder/this.stepSeconds,0,1);}
}
export function interpolatePose(previous,current,alpha) {
 const t=clamp(alpha,0,1),a=previous||current;
 const result={};
 for(const key of ['x','y','z'])result[key]=lerp(a[key],current[key],t);
 for(const key of ['yaw','pitch','roll'])result[key]=a[key]+wrapAngle(current[key]-a[key])*t;
 return result;
}
