import createUnicorn from './vendor/unicorn-x86.mjs';
import {DosMachine} from './dos-machine.js';

export async function loadDosMachine() {
 const read=async url=>{
  const r=await fetch(url);if(!r.ok)throw new Error(`Could not load ${url}`);return r;
 };
 const [manifest,payload,cockpit,module]=await Promise.all([
  read('assets/dos-physics.json').then(r=>r.json()),
  read('assets/dos-physics.bin').then(r=>r.arrayBuffer()),
  read('assets/dos-cockpit.bin').then(r=>r.arrayBuffer()),createUnicorn(),
 ]);
 for(const [bytes,info] of [[payload,manifest.payload],[cockpit,manifest.cockpit]]) {
  const digest=await crypto.subtle.digest('SHA-256',bytes);
  const hash=[...new Uint8Array(digest)].map(v=>v.toString(16).padStart(2,'0')).join('');
  if(bytes.byteLength!==info.bytes||hash!==info.sha256)throw new Error('DOS executable integrity check failed. Re-extract the supplied disk.');
 }
 return new DosMachine(module,new Uint8Array(payload),manifest,new Uint8Array(cockpit));
}
