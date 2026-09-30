// Executes the supplied ADF's instructions. This file supplies memory, routine
// entry points and hardware boundaries; it does not calculate car forces.
export const ORIGINAL_STEP = 6 / 50;
export const ORIGINAL_SPEED_SCALE = (238 / 256) / ORIGINAL_STEP / 2048;
const ANGLE_SCALE = 2 * Math.PI / 65536;
const MEMORY_SIZE = 0x1000000, STACK = 0xeffffc, RETURN = 0xf00000;
const REG = {d0:0,d1:1,d2:2,d3:3,d4:4,d5:5,d6:6,d7:7,a0:8,a1:9,a2:10,a3:11,a4:12,a5:13,a6:14,a7:15,pc:16,sr:17};

export class OriginalMachine {
 constructor(module, payload) {
  this.module=module;this.payload=payload;this.calls=0;this.ticks=0;
  this.backend='amiga';this.engine='Original 68000 / Musashi WASM';this.stepSeconds=ORIGINAL_STEP;
  this.pointer=module._malloc(MEMORY_SIZE);
  if(!this.pointer)throw new Error('Cannot allocate original game memory');
  module._clear_regions();module._add_region(0,MEMORY_SIZE,this.pointer);
  this.memory=new Uint8Array(module.HEAPU8.buffer,this.pointer,MEMORY_SIZE);
  this.view=new DataView(this.memory.buffer,this.pointer,MEMORY_SIZE);
  this.stopHook=module.addFunction(()=>1,'ii');
  module._clear_pc_hook_addrs();module._add_pc_hook_addr(RETURN);
  module._set_pc_hook_func(this.stopHook);
  module._m68k_init();
 }
 put(address,value,size=2) {
  if(size===1)this.view.setUint8(address,value);
  else if(size===2)this.view.setUint16(address,value);
  else this.view.setUint32(address,value);
 }
 get(address,size=2,signed=false) {
  if(size===1)return signed?this.view.getInt8(address):this.view.getUint8(address);
  if(size===2)return signed?this.view.getInt16(address):this.view.getUint16(address);
  return signed?this.view.getInt32(address):this.view.getUint32(address);
 }
 reg(name){return this.module._m68k_get_reg(0,REG[name])>>>0;}
 call(pc,registers={},stops=[RETURN]) {
  const m=this.module;
  m._clear_pc_hook_addrs();for(const address of stops)m._add_pc_hook_addr(address);
  m._m68k_set_reg(REG.a7,STACK);this.put(STACK,RETURN,4);
  for(const [name,value] of Object.entries(registers))m._m68k_set_reg(REG[name],value);
  m._m68k_set_reg(REG.pc,pc);
  m._m68k_execute(4000000);
  // Musashi's instruction hook runs after fetching the opcode word.
  if(!stops.includes(this.reg('pc')-2))throw new Error(`Original routine $${pc.toString(16)} did not return (PC $${this.reg('pc').toString(16)})`);
  this.calls++;
 }
 initialise(track=0,{superLeague=false,probe=false}={}) {
  this.memory.fill(0);this.memory.set(this.payload,0xe700);
  this.put(0,STACK,4);this.put(4,RETURN,4);this.put(RETURN,0x4e71);
  this.module._m68k_pulse_reset();this.module._m68k_set_reg(REG.sr,0x2000);
  for(let i=0;i<15;i++)this.module._m68k_set_reg(i,0);
  // Amiga input polling, audio DMA and bitmap text are handled by the browser.
  for(const address of [0x60bae,0xf362,0x594c6])this.put(address,0x4e75);
  this.memory.fill(0,0x1baf8,0x1bdd0);
  this.memory.copyWithin(0x1baf8,0x1fe6c+(superLeague?11:0),0x1fe6c+(superLeague?11:0)+11);
  // The original bootstrap installs this steering guard at $5CEFA.
  this.put(0x64aec,this.get(0x5c962,4),4);
  this.put(0x1c9d0,superLeague?11:0,1);
  this.put(0x1ca33,track,1);
  this.call(0x5ae46,{d1:track});this.call(0x64304);
  this.put(0x1bb72,0x80,1);
  this.put(0x1ca20,0x99,1);this.put(0x1bb95,0x99,1);
  this.put(0x1bbcd,0x80,1);
  this.trackId=track;this.probe=probe;this.ticks=0;
  if(!probe) {
   const units=this.get(superLeague?0x1ca2d:0x1ca2c,1);
   const bcd=((Math.floor(units/10)<<4)|(units%10));
   this.put(0x1ca20,bcd,1);this.put(0x1bb95,bcd,1);
   this.put(0x1ca22,0,1); // Browser league/opponent presentation is independent.
   this.put(0x1bbcd,0,1);this.put(0x1bb1d,255,1);
   // The bridge also updates Amiga far-view vertices. Give those writes a
   // private scratch buffer; Three.js reads the actual mutable height profiles.
   this.put(0x7aae6,0xe00000,4);
   // Damage accumulation consults the cockpit pixels. Run the original
   // decompressor into offscreen Amiga bitplanes, then retain those bitplanes
   // for its original crack/wreck logic (the visible HUD is still browser UI).
   for(const address of [0x6a584,0x6a588,0x6a58c])this.put(address,0xc00000,4);
   this.call(0x1bace);
   this.call(0x5a794);
  }
 }
 recover(piece) {
  this.put(0x1bbc4,0x80,1);
  for(const address of [0x1bca4,0x1bca8,0x1bcac])this.put(address,0x1000,4);
  this.call(0x605b6,{d1:piece});
 }
 locate() {
  if(!this.probe) {
   // The non-drawing part of draw.world: original map lookup (including
   // adjacent squares), road position, off-road state, and recovery section.
   this.call(0x64e4c,{},[0x64f4a,0x64f80]);
   return;
  }
  this.call(0x60190);
  this.put(0x1bbd5,0,1);this.put(0x1bbd6,0,1);
  this.call(0x5fe04);
  const piece=this.reg('d0')&255;
  if(piece<this.get(0x1ca1a,1)) {
   this.put(0x1bb85,piece,1);
   this.call(0x5be44);this.call(0x60246);
   this.put(0x1bb1c,this.get(0x1bb85,1),1);
  }
 }
 step(controls=0) {
  this.put(0x1bb47,controls,1);
  this.call(0x5d8a2);this.call(0x6185c);this.locate();this.ticks++;
  if(!this.probe) {
   this.call(0x5a794);
   this.call(0x5dfb4);
   // $5DB34..$5DB58 is the original frame/countdown divider. Keep its integer
   // carry/overflow behaviour instead of approximating boost or chain timers.
   this.call(0x5db34,{},[0x5db58]);
  }
 }
 setOpponent(track,rival) {
  if(!rival){this.put(0x1bb1d,255,1);return;}
  const pose=rival.pose,piece=pose.piece;
  const start=track.pieceDistance[piece],end=track.pieceDistance[piece+1]??track.length;
  const distance=((rival.distance%track.length)+track.length)%track.length;
  this.put(0x1bb1d,piece,1);
  this.put(0x1bb0c,Math.round((distance-start)/(end-start)*track.pieces[piece].segments*256));
  // Opponent lanes use a normalized byte (player road X uses 0..384).
  this.put(0x1bbec,160); // Browser rival drives at lateral +0.25: 160/256.
  this.put(0x1bbee,Math.round(rival.speed/ORIGINAL_SPEED_SCALE));
  this.put(0x1bb44,1,1);
  for(const address of [0x1bd66,0x1bd68,0x1bd6a])this.put(address,Math.round(pose.y*128));
  this.call(0x6076c); // Original longitudinal separation around the circuit.
  this.call(0x636c0); // Original proximity tests and collision impulse setup.
 }
 get opponentSpeed(){return this.get(0x1bbee,2,true)*ORIGINAL_SPEED_SCALE;}
 drivingStatus() {
  const bcd=this.get(0x1ca20,1);
  return {offRoad:!!this.get(0x1bb9c,1),contacts:this.get(0x1bb7d,1),boost:(bcd>>4)*10+(bcd&15),
   boosting:!!this.get(0x1bb62,1),throttle:!!this.get(0x1bba8,1),damage:this.get(0x1bb55,1)/240*100,
   wreck:!!this.get(0x1bca2,1),impact:this.get(0x1bc3a)/2048,
   offRoadGround:!!(this.get(0x1bb9c,1)&128),suspension:[this.get(0x1bd14,2,true),this.get(0x1bd16,2,true)]};
 }
 recoveryTarget() {
  if(!this.get(0x1bb9c,1)||!this.get(0x1bb7e,1)||this.get(0x1bbdf,1))return null;
  const remaining=this.get(0x1bb41,1,true)-1;
  this.put(0x1bb41,Math.max(0,remaining),1);
  return remaining<0?this.get(0x1bb9b,1):null;
 }
 bridgeHeights(data) {
  if(this.trackId!==5)return null;
  return [51,52,54,55].map(piece=>{
   const p=data.pieces[piece];
   return {piece,rows:Array.from({length:p.segments+1},(_,j)=>[0,1].map(side=>{
    const id=side?p.rightId:p.leftId,shift=side?p.rightShift:p.leftShift;
    const pointer=this.get(0x1efa2+(id&127)*2);
    const address=0x1ef82+(((pointer&255)<<8)|(pointer>>8))-0xb100;
    return ((this.get(address+j*2)&32767)+shift)/128;
   }))};
  });
 }
 state() {
  return {
   x:this.get(0x1bcd8,4,true)/131072,y:this.get(0x1bcdc,4,true)/262144,z:this.get(0x1bce0,4,true)/131072,
   pitch:this.get(0x1bce4,2,true)*ANGLE_SCALE,yaw:this.get(0x1bce6,2,true)*ANGLE_SCALE,roll:this.get(0x1bce8,2,true)*ANGLE_SCALE,
   speed:this.get(0x1bd30,2,true)*ORIGINAL_SPEED_SCALE,
   vx:this.get(0x1bcea,2,true)*ORIGINAL_SPEED_SCALE,vy:this.get(0x1bcec,2,true)*ORIGINAL_SPEED_SCALE,vz:this.get(0x1bcee,2,true)*ORIGINAL_SPEED_SCALE,
   section:this.get(0x1bb1c,1),chains:this.get(0x1bbdf,1),contact:!!this.get(0x1bb7e,1),
  };
 }
 dispose() {
  this.module._clear_pc_hook_func();this.module.removeFunction(this.stopHook);
  this.module._clear_regions();this.module._free(this.pointer);
 }
}
