// The car faces +Z. Its local +X points left in the cockpit view;
// positive yaw turns left and positive roll raises that side of the car.
export function carFrame(yaw,pitch,roll) {
 const sy=Math.sin(yaw),cy=Math.cos(yaw),sp=Math.sin(pitch),cp=Math.cos(pitch),sr=Math.sin(roll),cr=Math.cos(roll);
 return {
  forward:[sy*cp,sp,cy*cp],
  side:[cy*cr-sy*sp*sr,cp*sr,-sy*cr-cy*sp*sr],
  up:[-cy*sr-sy*sp*cr,cp*cr,sy*sr-cy*sp*cr],
 };
}
export function roadAngles(dx,dz,yaw) {
 const pitch=Math.atan(dx*Math.sin(yaw)+dz*Math.cos(yaw));
 return {pitch,roll:Math.atan((dx*Math.cos(yaw)-dz*Math.sin(yaw))*Math.cos(pitch))};
}
export function planeGradient(a,b,c) {
 const ax=b[0]-a[0],az=b[2]-a[2],bx=c[0]-a[0],bz=c[2]-a[2],ay=b[1]-a[1],by=c[1]-a[1];
 const det=ax*bz-az*bx;
 return Math.abs(det)<1e-9?{dx:0,dz:0}:{dx:(ay*bz-az*by)/det,dz:(ax*by-ay*bx)/det};
}
