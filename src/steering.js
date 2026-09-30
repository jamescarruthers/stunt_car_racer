import {clamp,wrapAngle} from './track.js';

const ANGLE_UNIT=2*Math.PI/65536;
// Continuous equivalent of the supplied disk's $61012 steering routine.
// Template strength supplies the bend turn; inputs add 45 into a bend or
// subtract 35 away from it. On straights the original template strength is 32.
export function roadSteering(surface,yaw,speed,input) {
 const error=wrapAngle(surface.steeringHeading+surface.segment.turn*217*ANGLE_UNIT-yaw),s=surface.steeringSegment||surface.segment;
 const direction=Math.sign(input),correction=clamp(Math.abs(error)/ANGLE_UNIT/16,0,127);
 let amount=s.turn*s.steeringAmount;
 if(s.turn) {
  amount+=input*(direction===s.turn?45:35);
  if(direction===s.turn&&direction===Math.sign(error))amount+=input*correction;
 } else {
  amount=input*(s.steeringAmount+(direction===Math.sign(error)?correction:0));
 }
 // Original $61160 realigns a straight-running car, with speed-dependent force.
 const alignment=!s.turn?clamp(error,-255*ANGLE_UNIT,255*ANGLE_UNIT)*(Math.abs(speed)/(16*238/256)+50/6*.078125)*(1-Math.abs(input)):0;
 return amount*speed*ANGLE_UNIT+alignment;
}
