import './style.css';
import {Track,clamp} from './track.js';
import {Rival} from './rival.js';
import {OriginalCar} from './original-car.js';
import {loadOriginalMachine} from './original-loader.js';

import {SimulationClock} from './simulation-clock.js';
import {WorldRenderer} from './renderer.js';
import {GameAudio} from './audio.js';
import {League} from './league.js';
import {CockpitEffects} from './cockpit-effects.js';
const canvas=document.querySelector('#screen'),ctx=canvas.getContext('2d',{alpha:false});ctx.imageSmoothingEnabled=false;
const keys=new Set(),audio=new GameAudio(),images={},touchKeys=new Set();
let tracks,palette,font,primary,world,track,car,rival,scenery,config,machine,cockpitEffects,effectsData,displayLeague,driversReturn='home';
const simulationClock=new SimulationClock();
let screen='home',selection=0,buttons=[],elapsed=0,lastTime=0,paused=false,mode='practice',selectedTrack=0,superLeague=false,result=null,league=null,countdown=0;
let save;try{save=JSON.parse(localStorage.getItem('scr-1989-v1')||'{}');}catch{save={};}
save.records??={};
let physicsBackend=save.physicsBackend==='amiga'?'amiga':'dos',switchingPhysics=false;
const machines={};
let fullResolution=save.fullResolution===true,renderPixelRatio=window.devicePixelRatio||1;
const colors={white:'#fff',yellow:'#ffff00',black:'#000',red:'#dd9999',blue:'#5599ff'};
// Centres of the exhaust openings in the original 320x200 cockpit bitmap,
// from the farthest pipe to the nearest. Spacing follows its perspective.
const exhaustMouths=[[92,130],[81,133],[69,138],[53,144]];
const announce=text=>document.querySelector('#announcer').textContent=text;
function persist(){try{localStorage.setItem('scr-1989-v1',JSON.stringify(save));}catch{}}
function resizeRendering() {
 renderPixelRatio=window.devicePixelRatio||1;
 const rect=canvas.getBoundingClientRect();
 const width=fullResolution?Math.max(1,Math.round(rect.width*renderPixelRatio)):320;
 const height=fullResolution?Math.max(1,Math.round(rect.height*renderPixelRatio)):200;
 if(canvas.width!==width||canvas.height!==height){canvas.width=width;canvas.height=height;}
 // UI coordinates stay in the original 320x200 space. The 3D image is drawn
 // directly into the full backing buffer, never reduced to that UI grid.
 ctx.setTransform(width/320,0,0,height/200,0,0);ctx.imageSmoothingEnabled=false;
 world?.setResolution(width,height);
 canvas.dataset.resolution=fullResolution?'full':'original';
 const button=document.querySelector('#graphics');button.textContent=fullResolution?'3D: FULL RES':'3D: ORIGINAL';button.setAttribute('aria-pressed',String(fullResolution));
}
function toggleResolution(){fullResolution=!fullResolution;save.fullResolution=fullResolution;persist();resizeRendering();announce(fullResolution?'Full-resolution 3D':'Original pixelated 3D');canvas.focus({preventScroll:true});}
async function getMachine(backend) {
 if(!machines[backend]) {
  machines[backend]=backend==='dos'
   ?import('./dos-loader.js').then(m=>m.loadDosMachine())
   :loadOriginalMachine();
  machines[backend].catch(()=>{delete machines[backend];});
 }
 return machines[backend];
}
function recordKey(trackId){return `${physicsBackend==='dos'?'dos-':''}${superLeague?'super':'standard'}-${trackId}`;}
async function switchPhysics(backend) {
 if(backend===physicsBackend||switchingPhysics)return;
 const select=document.querySelector('#physics'),wasPaused=paused;
 switchingPhysics=true;paused=true;keys.clear();touchKeys.clear();select.disabled=true;
 announce(`Loading ${backend==='dos'?'DOS':'Amiga'} physics…`);
 try {
  const next=await getMachine(backend);
  machine=next;physicsBackend=backend;save.physicsBackend=backend;persist();
  simulationClock.stepSeconds=machine.stepSeconds;simulationClock.reset();
  // Native memory layouts and update rates differ: restart on the same track.
  if(screen==='race')startRace();
  else {paused=wasPaused;}
  announce(`${backend==='dos'?'DOS':'Amiga'} physics selected.${screen==='race'?' Current race restarted.':''}`);
 } catch(error) {
  console.error(error);paused=wasPaused;select.value=physicsBackend;
  announce(`Could not load physics: ${error.message}. Select again to retry.`);
 } finally {switchingPhysics=false;select.disabled=false;lastTime=0;canvas.focus({preventScroll:true});}
}
function text(str,x,y,color='#fff',align='left',small=false) {
 str=String(str);const width=small?6:7,source=small?font:primary;
 if(align==='center')x-=str.length*width/2;if(align==='right')x-=str.length*width;
 x=Math.round(x);y=Math.round(y);ctx.fillStyle=color;
 for(let i=0;i<str.length;i++){const c=str.charCodeAt(i)-32;if(c<0||c>=96)continue;for(let row=0;row<8;row++){const bits=source[c*8+row];for(let col=0;col<(small?6:7);col++)if(bits&(128>>col))ctx.fillRect(x+i*width+col,y+row,1,1);}}
}
const rect=(x,y,w,h,color)=>{ctx.fillStyle=color;ctx.fillRect(x,y,w,h);};
const time=t=>!Number.isFinite(t)?'--:--.--':`${Math.floor(t/60).toString().padStart(2,'0')}:${(t%60).toFixed(2).padStart(5,'0')}`;
function menu(items){buttons=items;selection=clamp(selection,0,items.length-1);const el=document.querySelector('#accessible-menu');el.replaceChildren(...items.map((item,i)=>{const b=document.createElement('button');b.textContent=item.label;b.onclick=()=>{selection=i;activate();};return b;}));}
function switchScreen(next){screen=next;selection=0;keys.clear();touchKeys.clear();paused=false;simulationClock.reset();canvas.focus({preventScroll:true});document.querySelector('#screen-action').hidden=next!=='drivers';announce(next==='home'?'Main menu':next==='tracks'?'Choose a track':next==='preview'?track.name:next);setMenu();}
function setMenu(){
 if(screen==='home')menu([
  {label:league?'CONTINUE SEASON':'START A SEASON',x:36,y:79,w:216,h:15,action:()=>{mode='season';if(!league)league=new League(config);selectedTrack=seasonTrack();showDrivers('preview');}},
  {label:'PRACTICE',x:36,y:99,w:216,h:15,action:()=>{mode='practice';switchScreen('tracks');}},
  {label:'LAP RECORDS',x:36,y:119,w:216,h:15,action:()=>switchScreen('records')},
  {label:'DRIVERS / DIVISIONS',x:36,y:139,w:216,h:15,action:()=>showDrivers('home')},
  {label:`${superLeague?'SUPER':'STANDARD'} LEAGUE`,x:36,y:159,w:216,h:15,action:()=>{superLeague=!superLeague;setMenu();}},
  {label:'CONTROLS',x:36,y:179,w:216,h:15,action:()=>switchScreen('help')}
 ]);
 else if(screen==='drivers')menu([{label:driversReturn==='preview'?'CONTINUE TO TRACK':'BACK',x:0,y:0,w:320,h:200,action:()=>driversReturn==='preview'?showPreview():switchScreen(driversReturn)}]);
 else if(screen==='tracks')menu([...tracks.map((t,i)=>({label:t.name,x:36,y:70+i*13,w:216,h:12,action:()=>{selectedTrack=i;showPreview();}})),{label:'BACK',x:115,y:182,w:90,h:12,action:()=>switchScreen('home')}]);
 else if(screen==='preview')menu([{label:mode==='practice'?'START PRACTICE':'START RACE',x:79,y:165,w:162,h:20,action:startRace},{label:'BACK',x:7,y:186,w:65,h:13,action:()=>switchScreen(mode==='practice'?'tracks':'home')}]);
 else if(screen==='result')menu([{label:mode==='season'?'CONTINUE':'TRY AGAIN',x:89,y:163,w:142,h:16,action:()=>{if(mode==='season'){finishSeasonRace();}else startRace();}},{label:'MAIN MENU',x:99,y:184,w:122,h:13,action:()=>{if(mode==='season')finishSeasonRace(false);else switchScreen('home');}}]);
 else if(screen==='season')menu([{label:'NEXT RACE',x:95,y:166,w:130,h:18,action:()=>{selectedTrack=seasonTrack();showPreview();}},{label:'MAIN MENU',x:95,y:187,w:130,h:12,action:()=>switchScreen('home')}]);
 else if(screen==='race')menu([]);
 else menu([{label:'BACK',x:115,y:181,w:90,h:15,action:()=>switchScreen('home')}]);
}
function seasonTrack(){return league.track;}
function showDrivers(next){driversReturn=next;displayLeague=league||new League(config);switchScreen('drivers');announce('Drivers and divisions. Press Enter, Space, or tap to continue.');}
function showPreview(){track=new Track(tracks[selectedTrack]);world.loadTrack(track);switchScreen('preview');}
function startRace(){
 track=new Track(tracks[selectedTrack]);world.loadTrack(track);car=new OriginalCar(track,machine,{practice:mode==='practice',superLeague});rival=mode==='season'?new Rival(track,4-league.division,car.progress):null;
 cockpitEffects.reset();cockpitEffects.update(car,0);
 simulationClock.stepSeconds=machine.stepSeconds;
 countdown=0;result=null;switchScreen('race');audio.start().catch(console.warn);announce(`${mode==='practice'?'Practice':'Race'} on ${track.name}. Arrow up to accelerate; space to boost.`);
}
function finishSeasonRace(show=true){
 if(!league||!result)return switchScreen('home');
 league.record(result.win,car.bestLap<rival.bestLap);superLeague=superLeague||league.superLeague;
 save.league=league.serialize();persist();switchScreen(show?'season':'home');
}
function activate(){const b=buttons[selection];if(b){audio.start().catch(console.warn);b.action();}}
function drawMenuButtons(){buttons.forEach((b,i)=>{if(i===selection){rect(b.x,b.y,b.w,b.h,'#000');text('>',b.x+4,b.y+Math.floor((b.h-8)/2),colors.yellow);}text(b.label,b.x+b.w/2,b.y+Math.floor((b.h-8)/2),i===selection?colors.yellow:'#fff','center',true);});}
function menuBackdrop(){ctx.drawImage(images.menu,0,0);rect(32,70,224,130,'#777755');for(let i=0;i<5;i++)rect(32,72+i*24,224,17,['#337700','#552200','#777755','#005555','#777777'][i]);}
function panel(title){rect(0,0,320,200,'#005555');rect(8,8,304,184,'#000');rect(10,10,300,2,'#bbb');text(title,160,22,colors.yellow,'center');}
function drawHome(){menuBackdrop();drawMenuButtons();}
function drawTracks(){menuBackdrop();rect(32,68,224,130,'#003333');text('PRACTICE - SELECT TRACK',160,55,colors.yellow,'center',true);drawMenuButtons();}
function drawDrivers(){
 ctx.drawImage(images.drivers,0,0);
 displayLeague.roster.forEach((members,level)=>members.forEach((id,row)=>{
  const p=effectsData.portraits[id==='YOU'?11:id],x=(3-level)*80,y=12+row*55;
  ctx.drawImage(images.drivers,p.x,p.y,p.width,p.height,x,y,p.width,p.height);
  if(id==='YOU'){rect(x+3,y+44,74,9,'#000');text('YOU',x+40,y+44,colors.yellow,'center',true);}
 }));
}
function drawPreview(){
 ctx.drawImage(images.preview,0,0);const rendered=world.render(null,null,1,true,elapsed);ctx.drawImage(rendered,9,20,302,124);
 rect(10,8,300,12,'#000');text(track.name,160,10,colors.yellow,'center');
 text(`${track.pieces.length} SECTIONS`,18,145,'#fff','left',true);text(`${mode==='season'?'VS '+league.name(league.opponent):'PRACTICE'}`,302,145,'#fff','right',true);
 drawMenuButtons();
}
function drawHUD(){
 cockpitEffects.drawDust(ctx,images['cockpit-sprites']);
 cockpitEffects.drawWheels(ctx,images['cockpit-sprites'],simulationClock.alpha);
 ctx.drawImage(images.cockpitOverlay,0,0);
 // Every cockpit pixel comes from the disk; only changing instruments are drawn here.
 rect(37,178,48,7,'#bbb');rect(37,189,48,8,'#bbb');
 rect(233,178,48,7,'#bbb');rect(233,189,48,8,'#bbb');
 text(`LAP ${Math.min(3,car.laps+1)}`,61,177,'#000','center',true);
 text(`${Math.max(0,Math.round(Math.abs(car.speed)*2.237))}`,61,188,'#000','center',true);
 text(time(car.lapTime),256,177,'#000','center',true);
 text(`B ${Math.ceil(car.boost).toString().padStart(2,'0')}`,256,188,car.boosting?'#aa0000':'#000','center',true);
 rect(96,186,127,3,'#000');rect(96,186,clamp(Math.abs(car.speed)*2.237/240,0,1)*127,3,car.boosting?'#ffff00':'#5599ff');
 if(car.damage>0){ctx.strokeStyle='#000';ctx.lineWidth=1;ctx.beginPath();ctx.moveTo(32,9);let x=32,y=9;for(let i=0;i<car.damage*1.65;i++){x+=1.5;y+=Math.sin(i*3.8)>0?1:-1;ctx.lineTo(x,clamp(y,5,14));}ctx.stroke();}
 if(car.boosting){for(const side of [-1,1])for(let i=0;i<exhaustMouths.length;i++){const [leftX,y]=exhaustMouths[i],x=side<0?leftX:319-leftX;const h=5+Math.floor((Math.sin(elapsed*70+i*5)+1)*5);rect(x-2,y-h,5,h,'#ff7700');rect(x-1,y-h+2,3,h-2,'#ffff00');}}
 if(car.recovery>0){drawChains();text(car.autoRelease||car.chains>=228?'LOWERING CAR':'SPACE TO RELEASE',160,48,'#fff','center',true);}
 else if(countdown>0){rect(139,66,42,28,'#000');text(String(Math.ceil(countdown)),160,73,colors.yellow,'center');}
 else if(car.time<6)text('GO!',160,53,colors.yellow,'center',true);
 if(car.fallTime>1.5)text('CRANE RECOVERY',160,50,colors.yellow,'center',true);
 if(rival){const gap=Math.round(rival.travelled-car.totalProgress);text(`${gap>=0?'BEHIND':'AHEAD'} ${Math.abs(gap)}M`,160,20,'#fff','center',true);}
 if(paused){rect(86,55,148,52,'#000');text('PAUSED',160,65,colors.yellow,'center');text('P TO CONTINUE',160,84,'#fff','center',true);}
}
function drawChains(){ctx.strokeStyle='#bbb';ctx.lineWidth=2;for(const side of [-1,1]){ctx.beginPath();ctx.moveTo(160+side*105,-10);ctx.lineTo(160+side*70,145);ctx.stroke();ctx.fillStyle='#333';for(let y=0;y<143;y+=6){const x=160+side*(105-y*.24);ctx.fillRect(x-2,y,4,2);}}}
function drawRace(){ctx.drawImage(world.render(car,rival,simulationClock.alpha,false,(simulationClock.ticks+simulationClock.alpha)*simulationClock.stepSeconds),0,0,320,200);drawHUD();}
function drawResult(){ctx.drawImage(images[result.wreck?'wreck':result.win?'won':'lost'],0,0);rect(22,114,276,84,'#000');text(result.wreck?'CAR WRECKED':result.win?'YOU WON THE RACE':'RACE OVER',160,121,colors.yellow,'center');text(`BEST LAP  ${time(car.bestLap)}`,160,139,'#fff','center',true);drawMenuButtons();}
function drawRecords(){panel('LAP RECORDS');tracks.forEach((t,i)=>{text(t.name,18,45+i*15,'#fff','left',true);text(time(save.records[recordKey(t.id)]),300,45+i*15,colors.yellow,'right',true);});drawMenuButtons();}
function drawHelp(){panel('CONTROLS');const lines=[['UP / W','ACCELERATE'],['DOWN / S','BRAKE / REVERSE'],['LEFT / RIGHT','STEER'],['SPACE / SHIFT','BOOST / RELEASE'],['R','CRANE RECOVERY'],['P','PAUSE'],['G','3D RESOLUTION'],['M / F','SOUND / FULLSCREEN'],['ESC','RETURN TO MENU']];lines.forEach(([key,label],i)=>{text(key,22,42+i*13,colors.yellow,'left',true);text(label,136,42+i*13,'#fff','left',true);});text('THROTTLE STAYS OPEN UNTIL BRAKING',160,161,'#bbb','center',true);drawMenuButtons();}
function drawSeason(){panel(league.message||'SEASON STANDINGS');text(`DIVISION ${league.lastStandings?league.lastDivision:league.division}`,160,43,'#fff','center');text('DRIVER                POINTS',160,65,colors.yellow,'center',true);(league.lastStandings||league.standings).forEach((r,i)=>{text(r.name,42,85+i*15,r.id==='YOU'?colors.yellow:'#fff','left',true);text(r.points,278,85+i*15,'#fff','right',true);});text(`RACE ${league.race+1} OF 4`,160,140,'#bbb','center');drawMenuButtons();}
function finish(wreck=false){
 result={wreck,win:!wreck&&!rival?.finished};audio.play(wreck?4:result.win?0:5,.7);audio.engine(car,false);switchScreen('result');
}
function input(){const has=(...names)=>names.some(n=>keys.has(n)||touchKeys.has(n));let pad=null;try{pad=navigator.getGamepads?.()[0];}catch{}
 return {throttle:has('ArrowUp','KeyW')||(pad?.buttons[7]?.value>.1),brake:has('ArrowDown','KeyS')||(pad?.buttons[6]?.value>.1),left:has('ArrowLeft','KeyA')||(pad?.axes[0]<-.2),right:has('ArrowRight','KeyD')||(pad?.axes[0]>.2),boost:has('Space','ShiftLeft','ShiftRight')||pad?.buttons[0]?.pressed};}
function update(dt){
 if(screen!=='race'||paused)return;
 if(car.recovery>0){car.step(dt,input());if(rival)rival.previous={...rival.pose};}
 else if(countdown>0)countdown=Math.max(0,countdown-dt);
 else {
  car.step(dt,input());
  if(rival){rival.speed=machine.opponentSpeed;rival.step(dt,car);machine.setOpponent(track,rival);}
 }
 cockpitEffects.update(car,dt);
 for(const event of car.events.splice(0)){
  if(event==='land')audio.play(3,Math.min(1,.2+car.shake*.5));
  if(event==='ground-impact'){audio.play(3,.7);audio.play(6,.5);}
  if(event==='recover')audio.play(1,.3);
  if(event==='lap'){
   audio.play(0,.5);const key=recordKey(track.id);
   if(car.bestLap<(save.records[key]??Infinity)){save.records[key]=car.bestLap;persist();announce('New lap record '+time(car.bestLap));}
  }
 }
 if(car.finished||rival?.finished)finish(car.damage>=100);
}
function frame(ms){const dt=lastTime?Math.min(.25,Math.max(0,(ms-lastTime)/1000)):0;lastTime=ms;elapsed+=dt;
 if(screen==='race'&&!paused)simulationClock.advance(dt,update);
 if(renderPixelRatio!==(window.devicePixelRatio||1))resizeRendering();
 ctx.imageSmoothingEnabled=false;
 if(screen==='home')drawHome();else if(screen==='tracks')drawTracks();else if(screen==='drivers')drawDrivers();else if(screen==='preview')drawPreview();else if(screen==='race')drawRace();else if(screen==='records')drawRecords();else if(screen==='help')drawHelp();else if(screen==='result')drawResult();else if(screen==='season')drawSeason();
 audio.engine(car,screen==='race'&&!paused&&!!car);requestAnimationFrame(frame);
}
function pause(){if(screen==='race'){paused=!paused;keys.clear();touchKeys.clear();announce(paused?'Paused':'Resumed');}}
function toggleSound(){const muted=audio.mute();document.querySelector('#sound').textContent=muted?'SOUND OFF':'SOUND ON';}
async function fullscreen(){try{if(document.fullscreenElement)await document.exitFullscreen();else await document.querySelector('#cabinet').requestFullscreen();}catch(e){console.warn('Fullscreen unavailable',e);}}
function back(){if(screen==='home')return;if(screen==='race'){audio.engine(car,false);switchScreen('home');}else switchScreen(screen==='preview'&&mode==='practice'?'tracks':'home');}
window.addEventListener('keydown',e=>{
 if(e.target.closest?.('select,input,textarea')||switchingPhysics)return;
 if(['ArrowUp','ArrowDown','ArrowLeft','ArrowRight','Space','Enter','Escape','Tab'].includes(e.code)&&e.code!=='Tab')e.preventDefault();keys.add(e.code);
 if(e.repeat)return;
 if(e.code==='KeyM')toggleSound();else if(e.code==='KeyF')fullscreen();else if(e.code==='KeyG')toggleResolution();else if(e.code==='Escape')back();else if(e.code==='KeyP')pause();
 else if(screen==='race'){if(e.code==='KeyR'&&!paused&&car.recovery<=0)car.resetAt(car.lastPiece);}
 else if(e.code==='ArrowDown'||e.code==='ArrowRight'){selection=(selection+1)%buttons.length;announce(buttons[selection]?.label);}
 else if(e.code==='ArrowUp'||e.code==='ArrowLeft'){selection=(selection+buttons.length-1)%buttons.length;announce(buttons[selection]?.label);}
 else if(e.code==='Enter'||e.code==='Space')activate();
});
window.addEventListener('keyup',e=>keys.delete(e.code));
window.addEventListener('blur',()=>{keys.clear();touchKeys.clear();if(screen==='race')paused=true;});
document.addEventListener('visibilitychange',()=>{if(document.hidden){keys.clear();if(screen==='race')paused=true;}});
canvas.addEventListener('pointermove',e=>{const r=canvas.getBoundingClientRect(),x=(e.clientX-r.left)*320/r.width,y=(e.clientY-r.top)*200/r.height;const i=buttons.findIndex(b=>x>=b.x&&x<=b.x+b.w&&y>=b.y&&y<=b.y+b.h);canvas.style.cursor=i>=0?'pointer':'default';if(i>=0)selection=i;});
canvas.addEventListener('pointerdown',e=>{canvas.focus();const r=canvas.getBoundingClientRect(),x=(e.clientX-r.left)*320/r.width,y=(e.clientY-r.top)*200/r.height;const i=buttons.findIndex(b=>x>=b.x&&x<=b.x+b.w&&y>=b.y&&y<=b.y+b.h);if(i>=0){selection=i;activate();}});
for(const b of document.querySelectorAll('[data-key]')){b.addEventListener('pointerdown',e=>{e.preventDefault();b.setPointerCapture(e.pointerId);touchKeys.add(b.dataset.key);audio.start().catch(console.warn);});for(const event of ['pointerup','pointercancel','lostpointercapture'])b.addEventListener(event,()=>touchKeys.delete(b.dataset.key));}
document.querySelector('#sound').onclick=toggleSound;document.querySelector('#fullscreen').onclick=fullscreen;document.querySelector('#graphics').onclick=toggleResolution;document.querySelector('#help').onclick=()=>{audio.engine(car,false);switchScreen('help');};
document.querySelector('#screen-action').onclick=activate;
new ResizeObserver(resizeRendering).observe(canvas);
window.addEventListener('resize',resizeRendering);
async function init(){
 const select=document.querySelector('#physics');select.value=physicsBackend;
 const originalReady=getMachine(physicsBackend);
 const json=async name=>{const r=await fetch(`assets/${name}.json`);if(!r.ok)throw new Error(`Could not load ${name}`);return r.json();};
 [tracks,palette,font,primary,scenery,config,effectsData]=await Promise.all([json('tracks'),json('palette'),fetch('assets/font.bin').then(r=>r.arrayBuffer()).then(b=>new Uint8Array(b)),fetch('assets/primary-font.bin').then(r=>r.arrayBuffer()).then(b=>new Uint8Array(b)),json('scenery'),json('config'),json('cockpit-effects')]);
 cockpitEffects=new CockpitEffects(effectsData);
 await Promise.all(['cockpit','cockpit-sprites','drivers','menu','preview','standings','wreck','won','lost','promotion'].map(async name=>{const i=new Image();i.src=`assets/${name}.png`;await i.decode();images[name]=i;}));
 const c=document.createElement('canvas');c.width=320;c.height=200;const cx=c.getContext('2d');cx.drawImage(images.cockpit,0,0);const pixels=cx.getImageData(0,0,320,200);
 for(let y=0;y<200;y++)for(let x=0;x<320;x++){const i=(y*320+x)*4;if((pixels.data[i]===153&&pixels.data[i+1]===153&&pixels.data[i+2]===119)||(y<166&&(x<16||x>303)&&pixels.data[i]===85&&pixels.data[i+2]===255))pixels.data[i+3]=0;}
 cx.putImageData(pixels,0,0);images.cockpitOverlay=c;
 machine=await originalReady;simulationClock.stepSeconds=machine.stepSeconds;
 select.disabled=false;select.onchange=()=>switchPhysics(select.value);
 world=new WorldRenderer(palette,scenery);
 resizeRendering();
 if(save.league&&Number.isInteger(save.league.division)&&save.league.division>=1&&save.league.division<=4)league=new League(config,save.league);
 document.querySelector('#loading').remove();switchScreen('home');requestAnimationFrame(frame);
 // Inspection hook: read-only snapshots for deterministic browser smoke checks.
 window.__scr={get state(){return {screen,paused,mode,track:track?.name,car:car?{...car.snapshot(),speed:car.speed,damage:car.damage,boost:car.boost,laps:car.laps,grounded:car.grounded,offRoadGround:car.offRoadGround,suspension:[...car.suspension],recovery:car.recovery,countdown}:null};},get presentation(){return {dustParticles:cockpitEffects.particles.length,dustTop:Math.min(128,...cockpitEffects.particles.map(p=>p.y)),wheelY:[...cockpitEffects.wheelY],wheelPhase:cockpitEffects.wheelPhase};},tracks:tracks.map(t=>({name:t.name,sections:t.pieces.length})),get physics(){return {backend:physicsBackend,engine:machine.engine,stepSeconds:simulationClock.stepSeconds,ticks:machine.ticks,alpha:simulationClock.alpha};},get renderer(){return {engine:'Three.js',revision:world.renderer.constructor.name,calls:world.renderer.info.render.calls,triangles:world.renderer.info.render.triangles,fullResolution,width:world.renderer.domElement.width,height:world.renderer.domElement.height,camera:world.camera.position.toArray()};}};
}
init().catch(error=>{console.error(error);document.querySelector('#loading').textContent=`Unable to start: ${error.message}. Reload to retry.`;});
