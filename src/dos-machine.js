// Hardware/routine adapter for the supplied DOS executable. All car forces,
// integration, steering, contacts, boost and crane movement execute as x86.
const BASE=0x10000,DATA=0x19d80,SIZE=0x100000,STOP=0xfff0;
const signed=(v,bits=16)=>(v<<(32-bits))>>(32-bits);
const TAU=Math.PI*2;

export class DosMachine {
 constructor(module,payload,manifest,cockpit) {
  Object.assign(this,{module,payload,manifest,cockpit});
  this.backend='dos';this.engine='Original x86 / Unicorn WASM';
  this.stepSeconds=.054921875;this.readyAtStart=true;this.ticks=0;
 }
 readMemory(address,size) {
  const result=new Uint8Array(size),view=new DataView(result.buffer),m=this.module;
  let i=0;for(;i+4<=size;i+=4)view.setInt32(i,m.getValue(this.pointer+address+i,'i32'),true);
  for(;i<size;i++)result[i]=m.getValue(this.pointer+address+i,'i8');return result;
 }
 writeMemory(address,bytes){this.module.writeArrayToMemory(bytes,this.pointer+address);}
 get(address,size=1,isSigned=false) {
  let v=0;for(let i=0;i<size;i++)v|=(this.module.getValue(this.pointer+DATA+address+i,'i8')&255)<<(i*8);
  return isSigned?signed(v,size*8):v;
 }
 put(address,value,size=1) {
  for(let i=0;i<size;i++)this.module.setValue(this.pointer+DATA+address+i,value>>>(i*8),'i8');
 }
 reg(name,value) {
  const id=this.module['X86_REG_'+name.toUpperCase()];
  if(value!==undefined)this.cpu.reg_write_i32(id,value);
  return this.cpu.reg_read_i32(id);
 }
 // The upstream JS convenience wrapper drops the IN/OUT arguments. Register
 // their actual C signatures through the same public Unicorn hook API.
 ioHook(instruction,callback,signature) {
  const m=this.module,p=m._malloc(4),extra=m._malloc(8),fn=m.addFunction(callback,signature);
  m.setValue(extra,instruction,'i32');
  const error=m.ccall('uc_hook_add','number',
   ['pointer','pointer','number','pointer','pointer','number','number','pointer'],
   [m.getValue(this.cpu.handle_ptr,'*'),p,m.HOOK_INSN,fn,0,1n,0n,extra]);
  m._free(extra);
  const hook={handle:m.getValue(p,'*'),callback:fn};m._free(p);
  if(error){m.removeFunction(fn);throw new Error(`DOS I/O hook failed: ${error}`);}
  this.hooks.push(hook);
 }
 initialise(track=0,{superLeague=false,probe=false,calibration=0x646f}={}) {
  if(!Number.isInteger(track)||track<0||track>7)throw new Error('Invalid DOS track');
  if(calibration<0x646f||calibration>0xffff)throw new Error('Invalid DOS calibration');
  this.dispose();const m=this.module;
  this.cpu=new m.Unicorn(m.ARCH_X86,m.MODE_16);this.pointer=m._malloc(SIZE);
  const error=m._uc_mem_map_ptr(m.getValue(this.cpu.handle_ptr,'*'),0n,BigInt(SIZE),m.PROT_ALL,this.pointer);
  if(error)throw new Error(`Cannot map DOS memory: ${error}`);
  this.writeMemory(0,new Uint8Array(SIZE));this.writeMemory(BASE,this.payload);
  for(const address of this.manifest.relocationWordOffsets) {
   const a=this.pointer+BASE+address,v=(m.getValue(a,'i8')&255)|((m.getValue(a+1,'i8')&255)<<8);
   m.setValue(a,(v+(BASE>>4))&255,'i8');m.setValue(a+1,(v+(BASE>>4))>>8,'i8');
  }
  for(const [r,v] of Object.entries({cs:BASE>>4,ds:DATA>>4,es:DATA>>4,ss:0x7000,eflags:0x202}))this.reg(r,v);
  this.hooks=[];this.stops=[];
  this.ioHook(m.X86_INS_IN,(_,port)=>{
   if(port!==0x61)throw new Error(`Unexpected DOS input port ${port.toString(16)}`);return 0;
  },'iiiii');
  this.ioHook(m.X86_INS_OUT,(_,port,size,value)=>this.output(port,size,value),'viiiii');
  this.hooks.push(this.cpu.hook_add(m.HOOK_INTR,(_,n)=>{throw new Error(`Unexpected DOS interrupt ${n}`);}));
  // Narrow hooks avoid a JS callback for every original instruction.
  for(const pc of [0x6629,0x66dd,0x40da,0x3fe9,0x2393])
   this.hooks.push(this.cpu.hook_add(m.HOOK_CODE,()=>{if(this.stops.includes(pc))this.cpu.emu_stop();},null,BASE+pc,BASE+pc));
  this.probe=probe;this.trackId=track;this.ticks=0;
  if(!probe)this.initEga();
  this.put(0x20,calibration,2);this.call(0x01aa);
  const bcd=this.get(0x22);this.stepSeconds=((bcd>>4)*10+(bcd&15)+this.get(0x23)/256)/100;
  this.speedScale=(calibration/65536)/this.stepSeconds/2048;
  this.put(0x5627,superLeague?11:0);this.put(0x568a,track);
  this.call(0x25de,{bx:track});this.call(0x5f85);this.call(0x41c1);
  this.put(0x5481,255);this.put(0x5679,0);this.put(0x4a70,0x80);
  this.call(0x13bf);this.recover(this.get(0x5672));
  this.call(0x81e0);this.locate();this.put(0x5413,0x80);
 }
 call(address,registers={},stops=[STOP]) {
  this.reg('sp',0xfffc);this.writeMemory(0x7fffc,[0xf0,0xff]);
  for(const [name,value] of Object.entries(registers))this.reg(name,value&65535);
  this.stops=stops;
  this.cpu.emu_start(BASE+address,BASE+stops[0],0,2000000);
  const pc=this.reg('ip');this.stops=[];
  if(!stops.includes(pc))throw new Error(`DOS routine ${address.toString(16)} stopped at ${pc.toString(16)}`);
  return pc;
 }
 recover(section){this.call(0x3980,{bx:section});this.locate();}
 locate(){this.call(0x65a0,{},[0x6629,0x66dd]);}
 step(controls=0) {
  this.put(0x8b2,controls);this.put(0x8c5,0,2);
  this.call(0x42df);this.call(0x81e0);this.locate();this.call(0x13bf);
  if(!this.probe) {
   // Native crack growth reads/writes the original cockpit EGA planes. On
   // wreck, stop only at the subsequent bitmap message presentation.
   this.call(0x1ed4,{},[STOP,0x2393]);this.reg('es',DATA>>4);
  }
  this.call(0x1c10,{},[0x1c23]);this.ticks++;
 }
 vector(low,step=3,width=2) {
  return Array.from({length:3},(_,i)=>{
   let v=0;for(let j=0;j<width;j++)v|=this.get(low+i+step*j)<<(j*8);return signed(v,width*8);
  });
 }
 state() {
  const [x,y,z]=this.vector(0x530c,3,3),[pitch,yaw,roll]=this.vector(0x532d),[vx,vy,vz]=this.vector(0x5315,6);
  return {x:x/512,y:y/1024,z:z/512,pitch:pitch*TAU/65536,yaw:yaw*TAU/65536,roll:roll*TAU/65536,
   speed:signed(this.get(0x5362)|(this.get(0x5365)<<8))*this.speedScale,
   vx:vx*this.speedScale,vy:vy*this.speedScale,vz:vz*this.speedScale,
   section:this.get(0x5480),chains:this.get(0x4ae1),contact:!!this.get(0x4b26)};
 }
 drivingStatus() {
  const bcd=this.get(0x5677);
  return {offRoad:!!this.get(0x4b27),contacts:this.get(0x4b26),boost:(bcd>>4)*10+(bcd&15),
   boosting:!!this.get(0x4b36),throttle:!!this.get(0x54b2),damage:this.get(0x4ad7)/120*100,
   wreck:!!this.get(0x4b28),impact:this.get(0x5468)/8};
 }
 recoveryTarget() {
  const pc=this.call(0x4097,{},[0x40da,0x3fe9]);
  return pc===0x3fe9?this.reg('bx')&255:null;
 }
 get opponentSpeed(){return this.get(0x4b8b,2,true)*this.speedScale;}
 setOpponent(track,rival) {
  if(!rival){this.put(0x5481,255);return;}
  const {pose}=rival,piece=pose.piece,start=track.pieceDistance[piece],end=track.pieceDistance[piece+1]??track.length;
  const distance=((rival.distance%track.length)+track.length)%track.length;
  this.put(0x5481,piece);this.put(0x5ff9,Math.round((distance-start)/(end-start)*track.pieces[piece].segments*256),2);
  this.put(0x4b67,160);this.put(0x4b8b,Math.round(rival.speed/this.speedScale),2);this.put(0x4b7f,1);
  const y=Math.round(pose.y*128);
  for(let i=0;i<3;i++){this.put(0x4c7d+i,y);this.put(0x4c81+i,y>>8);}
  this.call(0x3a96);this.call(0x5e20);
 }
 bridgeHeights(data) {
  if(this.trackId!==5)return null;
  return [51,52,54,55].map(piece=>{
   const p=data.pieces[piece];
   return {piece,rows:Array.from({length:p.segments+1},(_,j)=>[0,1].map(side=>{
    const id=side?p.rightId:p.leftId,shift=side?p.rightShift:p.leftShift;
    const a=this.get(0xb120+(id&127)*2,2)+j*2;
    return (((this.get(a)<<8|this.get(a+1))&32767)+shift)/128;
   }))};
  });
 }
 output(port,size,value) {
  if(port===0x61)return;
  if(port!==0x3c4&&port!==0x3ce)throw new Error(`Unexpected DOS output port ${port.toString(16)}`);
  if(this.probe)return;
  if(size!==2)throw new Error('Unexpected EGA byte register write');
  const index=value&255,data=value>>>8&255;
  if(port===0x3c4){if(index!==2)throw new Error('Unexpected EGA sequencer register');this.ega.mask=data;}
  else this.ega.registers[index]=data;
 }
 initEga() {
  if(this.cockpit?.length!==32000)throw new Error('Missing original DOS cockpit planes');
  const m=this.module,planes=Array.from({length:4},()=>new Uint8Array(65536)),registers=new Uint8Array(9);
  registers[4]=2;registers[8]=255;
  this.ega={planes,registers,mask:15,latches:new Uint8Array(4)};
  for(let i=0;i<4;i++)for(const offset of [0,0x2000])planes[3-i].set(this.cockpit.subarray(i*8000,(i+1)*8000),offset);
  this.hooks.push(this.cpu.hook_add(m.HOOK_MEM_READ,(_,type,address,size)=>{
   const a=Number(address)-0xa0000,{latches}=this.ega;
   if(registers[5]&8)throw new Error('Unsupported EGA read mode');
   for(let j=0;j<size;j++) {
    for(let p=0;p<4;p++)latches[p]=planes[p][a+j];
    m.setValue(this.pointer+Number(address)+j,latches[registers[4]&3],'i8');
   }
  },null,0xa0000,0xaffff));
  this.hooks.push(this.cpu.hook_add(m.HOOK_MEM_WRITE,(_,type,address,size,value)=>{
   const a=Number(address)-0xa0000,{latches,mask}=this.ega,mode=registers[5]&3,rotate=registers[3]&7,op=registers[3]>>3&3;
   if(mode>1)throw new Error('Unsupported EGA write mode');
   for(let j=0;j<size;j++)for(let p=0;p<4;p++)if(mask&(1<<p)) {
    if(mode===1){planes[p][a+j]=latches[p];continue;}
    let data=Number(value>>BigInt(8*j))&255;data=((data>>>rotate)|(data<<(8-rotate)))&255;
    if(registers[1]&(1<<p))data=registers[0]&(1<<p)?255:0;
    if(op===1)data&=latches[p];else if(op===2)data|=latches[p];else if(op===3)data^=latches[p];
    planes[p][a+j]=(data&registers[8])|(latches[p]&~registers[8]);
   }
  },null,0xa0000,0xaffff));
 }
 dispose() {
  if(!this.cpu)return;
  for(const hook of this.hooks||[])this.cpu.hook_del(hook);
  this.cpu.close();this.module._free(this.pointer);this.cpu=null;
 }
}
