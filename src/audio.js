// Original unsigned-converted Amiga DMA samples, decoded only after a user gesture.
export class GameAudio {
 constructor(){this.muted=false;this.buffers=[];this.loading=null;}
 async start() {
  if(!this.context){this.context=new AudioContext();this.master=this.context.createGain();this.master.gain.value=this.muted?0:.28;this.master.connect(this.context.destination);}
  await this.context.resume();
  if(!this.loading)this.loading=Promise.all(Array.from({length:8},async(_,i)=>{const r=await fetch(`assets/sound-${i}.wav`);if(!r.ok)throw new Error('Audio loading failed');this.buffers[i]=await this.context.decodeAudioData(await r.arrayBuffer());}));
  await this.loading;
 }
 mute(){this.muted=!this.muted;if(this.master)this.master.gain.value=this.muted?0:.28;return this.muted;}
 play(id,volume=1,rate=1){if(!this.context||!this.buffers[id])return;const source=this.context.createBufferSource(),gain=this.context.createGain();source.buffer=this.buffers[id];source.playbackRate.value=rate;gain.gain.value=volume;source.connect(gain);gain.connect(this.master);source.start();return source;}
 engine(car,running) {
  if(!this.context||!this.buffers[7])return;
  if(!running){if(this.motor){this.motor.stop();this.motor=null;}return;}
  if(!this.motor){this.motor=this.context.createBufferSource();this.motor.buffer=this.buffers[7];this.motor.loop=true;this.motorGain=this.context.createGain();this.motor.connect(this.motorGain);this.motorGain.connect(this.master);this.motor.start();}
  this.motor.playbackRate.setTargetAtTime(.5+Math.abs(car.speed)/30+(car.boosting?.55:0),this.context.currentTime,.07);
  this.motorGain.gain.setTargetAtTime(car.recovery>0?.08:car.throttle?.36:.16,this.context.currentTime,.05);
 }
}
