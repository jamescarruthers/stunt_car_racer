import createMusashi from 'musashi-wasm/musashi.out.mjs';
import wasmUrl from 'musashi-wasm/musashi.out.wasm?url';
import {OriginalMachine} from './original-machine.js';

export async function loadOriginalMachine() {
 const read=async url=>{
  const response=await fetch(url);
  if(!response.ok)throw new Error(`Could not load ${url}`);
  return response.arrayBuffer();
 };
 const [payload,wasmBinary,manifest]=await Promise.all([
  read('assets/original-code.bin'),read(wasmUrl),
  fetch('assets/manifest.json').then(r=>r.json()),
 ]);
 const digest=await crypto.subtle.digest('SHA-256',payload);
 const hash=[...new Uint8Array(digest)].map(v=>v.toString(16).padStart(2,'0')).join('');
 if(payload.byteLength!==manifest.payload.size||hash!==manifest.payload.sha256)
  throw new Error('The original executable failed its integrity check. Re-extract the supplied disk.');
 const module=await createMusashi({wasmBinary:new Uint8Array(wasmBinary)});
 return new OriginalMachine(module,new Uint8Array(payload));
}
