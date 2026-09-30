import {chromium} from '@playwright/test';
import {createServer} from 'node:http';
import {readFile} from 'node:fs/promises';
import path from 'node:path';
const basePath=process.argv.find(arg=>arg.startsWith('--base-path='))?.slice('--base-path='.length)||'/';
const targetUrl=process.argv.find(arg=>arg.startsWith('--url='))?.slice('--url='.length);
if(!basePath.startsWith('/')||!basePath.endsWith('/'))throw new Error('--base-path must start and end with /');
let server;
if(process.argv.includes('--production')) {
 const root=path.resolve('dist');
 server=createServer(async(req,res)=>{
  const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname);
  if(!pathname.startsWith(basePath)){res.writeHead(404).end();return;}
  const relativePath=pathname.slice(basePath.length)||'index.html';
  const filename=path.resolve(root,relativePath);
  if(!filename.startsWith(root+path.sep)){res.writeHead(403).end();return;}
  try {
   const type={'.html':'text/html','.js':'text/javascript','.css':'text/css','.wasm':'application/wasm','.json':'application/json','.png':'image/png','.bin':'application/octet-stream','.wav':'audio/wav'}[path.extname(filename)];
   res.writeHead(200,{'Content-Type':type||'application/octet-stream'}).end(await readFile(filename));
  }catch{res.writeHead(404).end();}
 });
 await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));
}
const browser=await chromium.launch({headless:true,executablePath:process.env.CHROME_PATH||'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'});const page=await browser.newPage({viewport:{width:1100,height:900},deviceScaleFactor:2});const errors=[];
page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(m.type()==='error')errors.push(m.text());});
await page.goto(targetUrl||(server?`http://127.0.0.1:${server.address().port}${basePath}`:'http://127.0.0.1:5173'));await page.waitForFunction(()=>window.__scr);await page.screenshot({path:'analysis/menu-browser.png'});
if(await page.locator('#physics').inputValue()!=='dos'||await page.evaluate(()=>window.__scr.physics.backend)!=='dos')errors.push('Fresh browser did not default to DOS physics');
if(process.argv.includes('--boost-only')) {
 await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.keyboard.press('Enter');
 for(const backend of ['amiga','dos']) {
  await page.locator('#physics').selectOption(backend);
  await page.waitForFunction(backend=>window.__scr.physics.backend===backend&&window.__scr.state.car.grounded&&!window.__scr.state.car.recovery,backend,{timeout:15000});
  const boost=await page.evaluate(()=>window.__scr.state.car.boost);
  await page.keyboard.down('Space');
  await page.waitForFunction(boost=>window.__scr.state.car.boost<boost,boost);
  await page.keyboard.press('KeyP');await page.keyboard.up('Space');
  for(const full of [false,true]) {
   if(await page.evaluate(()=>window.__scr.renderer.fullResolution)!==full)await page.keyboard.press('KeyG');
   await page.screenshot({path:`analysis/boost-${backend}-${full?'full':'original'}.png`});
  }
  await page.keyboard.press('KeyP');await page.waitForTimeout(250);
  await page.screenshot({path:`analysis/boost-${backend}-released.png`});
  console.log('Boost views captured:',backend);
 }
 console.log('Errors:',errors);await browser.close();if(server)await new Promise(resolve=>server.close(resolve));process.exit(errors.length?1:0);
}
if(process.argv.includes('--camera-only')) {
 await page.locator('#graphics').click();
 await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.keyboard.press('Enter');
 for(const backend of ['amiga','dos']) {
  await page.locator('#physics').selectOption(backend);
  await page.waitForFunction(backend=>window.__scr.physics.backend===backend&&window.__scr.state.car.grounded&&!window.__scr.state.car.recovery,backend,{timeout:15000});
  await page.waitForTimeout(1000);
  const view=await page.evaluate(()=>({car:window.__scr.state.car,camera:window.__scr.renderer.camera}));
  if(view.camera[1]-view.car.y<2)errors.push(`${backend} cockpit eye is still too low`);
  await page.screenshot({path:`analysis/cockpit-camera-${backend}.png`});
  console.log('Cockpit camera checked:',backend,view);
 }
 console.log('Errors:',errors);await browser.close();if(server)await new Promise(resolve=>server.close(resolve));process.exit(errors.length?1:0);
}
if(process.argv.includes('--dos-season-only')) {
 await page.locator('#screen').focus();
 await page.waitForFunction(()=>window.__scr.physics.backend==='dos'&&!document.querySelector('#physics').disabled);
 await page.keyboard.press('Enter');await page.keyboard.press('Enter');
 await page.waitForFunction(()=>window.__scr.state.car.grounded&&!window.__scr.state.car.recovery,{},{timeout:15000});
 await page.keyboard.down('ArrowUp');await page.waitForTimeout(2000);await page.keyboard.up('ArrowUp');
 const state=await page.evaluate(()=>window.__scr.state);
 if(state.mode!=='season'||state.car.damage!==0||state.car.speed<5)errors.push('DOS season start collided or failed to drive');
 await page.setViewportSize({width:390,height:844});
 const fits=await page.locator('#physics').evaluate(el=>{const r=el.getBoundingClientRect();return r.left>=0&&r.right<=innerWidth&&r.top>=0;});
 if(!fits)errors.push('Physics selector is outside the mobile viewport');
 await page.screenshot({path:'analysis/physics-selector-mobile.png'});
 console.log('DOS season start:',state,'Errors:',errors);
 await browser.close();if(server)await new Promise(resolve=>server.close(resolve));process.exit(errors.length?1:0);
}
await page.locator('#physics').selectOption('amiga');
await page.waitForFunction(()=>window.__scr.physics.backend==='amiga'&&!document.querySelector('#physics').disabled);
const physics=await page.evaluate(()=>window.__scr.physics);
if(!physics.engine.includes('Original 68000')||physics.stepSeconds!==.12)errors.push('Browser is not running the original physics');
async function checkResolution(full) {
 await page.waitForFunction(full=>{
  const c=document.querySelector('#screen'),r=c.getBoundingClientRect(),engine=window.__scr.renderer;
  const width=full?Math.round(r.width*devicePixelRatio):320,height=full?Math.round(r.height*devicePixelRatio):200;
  return engine.fullResolution===full&&engine.width===width&&engine.height===height&&c.width===width&&c.height===height;
 },full);
 if(await page.locator('#graphics').getAttribute('aria-pressed')!==String(full))errors.push('Graphics toggle accessibility state incorrect');
 if(full&&await page.locator('#screen').evaluate(c=>getComputedStyle(c).imageRendering)!=='auto')errors.push('Full resolution still uses CSS pixelation');
 console.log('Resolution checked:',await page.evaluate(()=>window.__scr.renderer));
}
await checkResolution(false);
await page.locator('#graphics').click();await checkResolution(true);
await page.reload();await page.waitForFunction(()=>window.__scr);await checkResolution(true);
await page.setViewportSize({width:800,height:700});await checkResolution(true);
await page.setViewportSize({width:1100,height:900});await checkResolution(true);
await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.waitForTimeout(400);await page.screenshot({path:'analysis/preview-browser.png'});
await page.keyboard.press('Enter');await page.waitForTimeout(6200);await page.screenshot({path:'analysis/race-browser.png'});
console.log('Initial:',await page.evaluate(()=>window.__scr.state));
await page.keyboard.down('ArrowUp');await page.keyboard.down('Space');await page.waitForTimeout(5000);await page.keyboard.up('ArrowUp');await page.keyboard.up('Space');
await page.screenshot({path:'analysis/driving-browser.png'});console.log('Driving:',await page.evaluate(()=>window.__scr.state));console.log('Renderer:',await page.evaluate(()=>window.__scr.renderer));
const interpolation=await page.evaluate(()=>new Promise(resolve=>{
 const samples=[];
 function sample(){samples.push({ticks:window.__scr.physics.ticks,x:window.__scr.renderer.camera[0]});if(samples.length<20)requestAnimationFrame(sample);else resolve(samples);}
 requestAnimationFrame(sample);
}));
if(!interpolation.some((s,i)=>i&&s.ticks===interpolation[i-1].ticks&&s.x!==interpolation[i-1].x))errors.push('Camera is not interpolating between original physics ticks');
for(const [key,direction,duration] of [['ArrowRight',-1,250],['ArrowLeft',1,450]]) {
 const before=await page.evaluate(()=>window.__scr.state.car.yaw);
 await page.keyboard.down(key);await page.waitForTimeout(duration);await page.keyboard.up(key);
 const after=await page.evaluate(()=>window.__scr.state.car.yaw),turn=Math.atan2(Math.sin(after-before),Math.cos(after-before));
 if(turn*direction<.03)errors.push(`${key} steered the wrong way: ${turn}`);
 console.log('Steering checked:',key,turn);
}
await page.keyboard.press('KeyP');const a=await page.evaluate(()=>window.__scr.state.car);await page.waitForTimeout(200);const b=await page.evaluate(()=>window.__scr.state.car);if(a.x!==b.x||a.z!==b.z)errors.push('Pause did not freeze physics');
const pausedView=await page.evaluate(()=>({camera:window.__scr.renderer.camera,physics:window.__scr.physics}));
await page.waitForTimeout(200);
if(JSON.stringify(pausedView)!==JSON.stringify(await page.evaluate(()=>({camera:window.__scr.renderer.camera,physics:window.__scr.physics}))))errors.push('Pause did not freeze interpolation');
await page.screenshot({path:'analysis/full-resolution-browser.png'});
await page.keyboard.press('KeyG');await checkResolution(false);await page.screenshot({path:'analysis/original-resolution-browser.png'});
await page.keyboard.press('KeyG');await checkResolution(true);
const afterGraphics=await page.evaluate(()=>window.__scr.state);
if(!afterGraphics.paused||afterGraphics.car.x!==a.x||afterGraphics.car.z!==a.z||afterGraphics.car.damage!==a.damage)errors.push('Switching graphics changed the race');
await page.keyboard.press('Escape');
for(let id=0;id<8;id++){
 await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');
 for(let i=0;i<id;i++)await page.keyboard.press('ArrowDown');
 await page.keyboard.press('Enter');await page.waitForTimeout(100);
 const state=await page.evaluate(()=>window.__scr.state);if(state.screen!=='preview')errors.push(`Track ${id} preview failed`);
 await page.keyboard.press('Enter');await page.waitForTimeout(100);
 const race=await page.evaluate(()=>window.__scr.state);if(race.screen!=='race'||!Number.isFinite(race.car.y))errors.push(`Track ${id} race failed`);
 console.log('Track checked:',state.track);
 await page.keyboard.press('Escape');
}
await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.waitForTimeout(200);
if((await page.evaluate(()=>window.__scr.state)).mode!=='season')errors.push('Season failed to start');
await page.waitForTimeout(6500);await page.keyboard.down('ArrowUp');await page.waitForTimeout(2000);await page.keyboard.up('ArrowUp');
if((await page.evaluate(()=>window.__scr.physics)).ticks<40)errors.push('Season simulation stopped');
// Physics selector: changing a running race starts that track with the other
// native core, preserving resolution. Reload remembers the choice.
const switchingTrack=(await page.evaluate(()=>window.__scr.state)).track;
await page.locator('#physics').selectOption('dos');
await page.waitForFunction(()=>window.__scr.physics.backend==='dos'&&!document.querySelector('#physics').disabled);
const dosStart=await page.evaluate(()=>({state:window.__scr.state,physics:window.__scr.physics}));
if(dosStart.state.track!==switchingTrack||dosStart.state.screen!=='race'||!dosStart.state.car.recovery||dosStart.physics.ticks>10)errors.push('DOS switch did not restart the current track');
if(dosStart.physics.stepSeconds!==.054921875||!dosStart.physics.engine.includes('Original x86'))errors.push('DOS native core/timing not selected');
await checkResolution(true);
await page.reload();await page.waitForFunction(()=>window.__scr);
if(await page.locator('#physics').inputValue()!=='dos'||(await page.evaluate(()=>window.__scr.physics.backend))!=='dos')errors.push('DOS preference did not persist');
await checkResolution(true);
for(let id=0;id<8;id++) {
 await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');
 for(let i=0;i<id;i++)await page.keyboard.press('ArrowDown');
 await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.waitForTimeout(150);
 const state=await page.evaluate(()=>window.__scr.state);
 if(state.screen!=='race'||!Number.isFinite(state.car.y))errors.push(`DOS track ${id} failed`);
 await page.keyboard.press('Escape');
}
await page.keyboard.press('ArrowDown');await page.keyboard.press('Enter');await page.keyboard.press('Enter');await page.keyboard.press('Enter');
await page.waitForFunction(()=>window.__scr.state.car.grounded&&!window.__scr.state.car.recovery,{},{timeout:15000});
await page.keyboard.down('ArrowUp');await page.keyboard.down('Space');await page.waitForTimeout(3000);await page.keyboard.up('ArrowUp');await page.keyboard.up('Space');
if((await page.evaluate(()=>window.__scr.state.car.speed))<10)errors.push('DOS controls did not accelerate the car');
for(const [key,direction,duration] of [['ArrowRight',-1,200],['ArrowLeft',1,350]]) {
 const before=await page.evaluate(()=>window.__scr.state.car.yaw);
 await page.keyboard.down(key);await page.waitForTimeout(duration);await page.keyboard.up(key);
 const after=await page.evaluate(()=>window.__scr.state.car.yaw),turn=Math.atan2(Math.sin(after-before),Math.cos(after-before));
 if(turn*direction<.01)errors.push(`DOS ${key} steered the wrong way: ${turn}`);
}
const dosInterpolation=await page.evaluate(()=>new Promise(resolve=>{
 const samples=[];function sample(){samples.push({ticks:window.__scr.physics.ticks,x:window.__scr.renderer.camera[0]});if(samples.length<20)requestAnimationFrame(sample);else resolve(samples);}requestAnimationFrame(sample);
}));
if(!dosInterpolation.some((s,i)=>i&&s.ticks===dosInterpolation[i-1].ticks&&s.x!==dosInterpolation[i-1].x))errors.push('DOS rendering is not interpolated');
await page.keyboard.press('KeyP');const dosPaused=JSON.stringify(await page.evaluate(()=>({state:window.__scr.state,physics:window.__scr.physics,camera:window.__scr.renderer.camera})));
await page.waitForTimeout(200);
if(dosPaused!==JSON.stringify(await page.evaluate(()=>({state:window.__scr.state,physics:window.__scr.physics,camera:window.__scr.renderer.camera}))))errors.push('DOS pause did not freeze the simulation and rendering');
await page.screenshot({path:'analysis/dos-physics-browser.png'});
await page.locator('#physics').selectOption('amiga');
await page.waitForFunction(()=>window.__scr.physics.backend==='amiga'&&!document.querySelector('#physics').disabled);
if((await page.evaluate(()=>window.__scr.physics.stepSeconds))!==.12)errors.push('Switching back did not restore Amiga timing');
await page.locator('#physics').selectOption('dos');
await page.waitForFunction(()=>window.__scr.physics.backend==='dos'&&!document.querySelector('#physics').disabled);
await page.keyboard.press('Escape');await page.keyboard.press('Enter');await page.keyboard.press('Enter');
await page.waitForFunction(()=>window.__scr.state.car.grounded&&!window.__scr.state.car.recovery,{},{timeout:15000});
await page.keyboard.down('ArrowUp');await page.waitForTimeout(2000);await page.keyboard.up('ArrowUp');
if((await page.evaluate(()=>window.__scr.state)).mode!=='season')errors.push('DOS season did not start');
console.log('DOS browser checked:',await page.evaluate(()=>({state:window.__scr.state,physics:window.__scr.physics})));
console.log('Errors:',errors);await browser.close();if(server)await new Promise(resolve=>server.close(resolve));if(errors.length)process.exitCode=1;
