import {clamp,lerp} from './track.js';

// Presentation only. Shapes, frame order, offsets and the suspension lookup
// are extracted from the supplied Amiga disk. CPU state is never modified.
const EFFECT_STEP=6/50;
export class CockpitEffects {
 constructor(data){this.data=data;this.reset();}
 reset(){this.clock=0;this.frame=0;this.wheelPhase=0;this.previousWheelPhase=0;this.wheelY=[135,135];this.previousWheelY=[135,135];this.particles=[];this.seed=0x534352;}
 random(){this.seed=(Math.imul(this.seed,1664525)+1013904223)>>>0;return this.seed>>>16;}
 height(suspension){const index=255-(clamp(suspension+256,0,2047)>>3);return 135-this.data.wheelLift[index];}
 update(car,dt) {
  this.previousWheelY=this.wheelY;
  this.wheelY=(car.suspension||[0,0]).map(value=>this.height(value));
  this.previousWheelPhase=this.wheelPhase;
  this.wheelPhase+=car.speed*dt*.3;
  if(car.recovery){this.particles=[];this.clock=0;return;}
  const dusty=car.offRoadGround;
  if(!dusty){this.particles=[];this.clock=0;return;}
  this.clock+=dt;
  while(this.clock>=EFFECT_STEP) {
   this.clock-=EFFECT_STEP;this.frame++;
   // The original ground effect maintains sixteen particles in its 256x128
   // world viewport, with outward motion, upward launch and integer gravity.
   for(let i=0;i<16;i++) {
    let p=this.particles[i];
    if(p){p.previousX=p.x;p.previousY=p.y;p.vy+=2;p.x+=p.vx;p.y+=p.vy;}
    if(!p||p.x<0||p.x>=256||p.y<1||p.y>=128) {
     const x=this.random()&255,y=118+(this.random()&7);
     p=this.particles[i]={x,y,previousX:x,previousY:y,vx:(x-128)>>3,vy:-(Math.min(16,Math.abs(car.speed))/2+(this.random()&7))};
    }
   }
  }
 }
 object(ctx,image,id,x,y,height) {
  const s=this.data.objects[id],h=height===undefined?s.height:Math.min(s.height,height);
  ctx.drawImage(image,s.x,s.y,s.width,h,Math.round(x??s.screenX),Math.round(y??s.screenY),s.width,h);
 }
 drawDust(ctx,image) {
  const alpha=this.clock/EFFECT_STEP;
  ctx.save();ctx.beginPath();ctx.rect(32,16,256,128);ctx.clip();
  this.particles.forEach((p,i)=>{
   const frame=this.data.dustSequence[(i+this.frame)&15];
   this.object(ctx,image,29+frame,32+lerp(p.previousX,p.x,alpha)-this.data.dustOffsets[frame],16+lerp(p.previousY,p.y,alpha));
  });
  ctx.restore();
 }
 drawWheels(ctx,image,alpha) {
  const phase=Math.floor(lerp(this.previousWheelPhase,this.wheelPhase,alpha)),frame=((phase%3)+3)%3;
  for(const [side,id] of [[0,5-frame],[1,frame]]) {
   const y=Math.round(lerp(this.previousWheelY[side],this.wheelY[side],alpha));
   this.object(ctx,image,id,undefined,y,159-y);
  }
 }
}
