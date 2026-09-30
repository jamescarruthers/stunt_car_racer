#!/usr/bin/env python3
"""Run the supplied disk's 68000 physics in isolation, with hardware I/O stubbed.

Development probe, not a full Amiga emulator. Install unicorn separately and set
PYTHONPATH to its installation. No downloaded game code or data is used.
"""
import argparse, hashlib, json, math
from pathlib import Path
from unicorn import Uc, UcError, UC_ARCH_M68K, UC_MODE_BIG_ENDIAN, UC_HOOK_CODE
from unicorn.m68k_const import *

ROOT=Path(__file__).resolve().parents[1]
disk=next((ROOT/'original').glob('*.adf')).read_bytes()

class Original:
 def __init__(self,track=0,gameplay=False,super_league=False):
  self.gameplay=gameplay
  self.u=Uc(UC_ARCH_M68K,UC_MODE_BIG_ENDIAN)
  self.u.ctl_set_cpu_model(UC_CPU_M68K_M68000)
  self.u.mem_map(0,0x1000000)
  self.u.mem_write(0xe700,disk[0xdc00:0xdc00+408540])
  self.u.reg_write(UC_M68K_REG_SR,0x2000)
  # Only hardware-facing input, sound and UI routines are replaced with RTS.
  for address in [0x60bae,0xf362,0x594c6]:
   self.u.mem_write(address,b'\x4e\x75')
  self.u.mem_write(0x1baf8,bytes(0x1bdd0-0x1baf8))
  self.u.mem_write(0x1baf8,bytes(self.u.mem_read(0x1fe6c+(11 if super_league else 0),11)))
  # Boot installs this value at $5CEFA, from the immediate at $5C960.
  # Without that runtime data, the intact steering routine disables itself.
  self.put(0x64aec,self.get(0x5c962,4),4)
  self.put(0x1c9d0,11 if super_league else 0,1)
  self.put(0x1ca33,track,1)
  self.call(0x5ae46,d1=track)
  self.call(0x64304)
  self.put(0x1bb72,0x80,1)
  self.put(0x1ca20,0x99,1);self.put(0x1bb95,0x99,1)
  self.put(0x1bbcd,0x80,1)
  if gameplay:
   units=self.get(0x1ca2d if super_league else 0x1ca2c,1)
   self.put(0x1ca20,(units//10)*16+units%10,1);self.put(0x1bb95,(units//10)*16+units%10,1)
   self.put(0x1ca22,0,1);self.put(0x1bbcd,0,1);self.put(0x1bb1d,255,1)
   self.put(0x7aae6,0xe00000,4)
   for a in [0x6a584,0x6a588,0x6a58c]:self.put(a,0xc00000,4)
   self.call(0x1bace);self.call(0x5a794)
 def put(self,a,v,n=2):self.u.mem_write(a,(v&((1<<(n*8))-1)).to_bytes(n,'big'))
 def get(self,a,n=2,signed=False):return int.from_bytes(self.u.mem_read(a,n),'big',signed=signed)
 def call(self,pc,**regs):
  self.u.reg_write(UC_M68K_REG_A7,0xeffffc);self.put(0xeffffc,0xf00000,4)
  for name,v in regs.items():self.u.reg_write(globals()['UC_M68K_REG_'+name.upper()],v)
  try:self.u.emu_start(pc,0xf00000,count=200000)
  except UcError as e:raise RuntimeError(f'{e}, PC={self.u.reg_read(UC_M68K_REG_PC):x}, called {pc:x}') from e
  if self.u.reg_read(UC_M68K_REG_PC)!=0xf00000:raise RuntimeError(f'Instruction limit: {self.u.reg_read(UC_M68K_REG_PC):x}, called {pc:x}')
 def recover(self,piece):
  self.put(0x1bbc4,0x80,1)
  for a in [0x1bca4,0x1bca8,0x1bcac]:self.put(a,0x1000,4)
  self.call(0x605b6,d1=piece)
 def call_until(self,pc,stops):
  hooks=[self.u.hook_add(UC_HOOK_CODE,lambda u,a,s,d:u.emu_stop(),begin=a,end=a) for a in stops]
  self.u.reg_write(UC_M68K_REG_A7,0xeffffc);self.put(0xeffffc,0xf00000,4)
  try:
   self.u.emu_start(pc,0xf00000,count=200000)
   if self.u.reg_read(UC_M68K_REG_PC) not in stops:raise RuntimeError(f'Unexpected stop at {self.u.reg_read(UC_M68K_REG_PC):x}')
  finally:
   for hook in hooks:self.u.hook_del(hook)
 def locate(self):
  if self.gameplay:
   self.call_until(0x64e4c,[0x64f4a,0x64f80]);return
  self.call(0x60190)
  self.put(0x1bbd5,0,1);self.put(0x1bbd6,0,1)
  self.call(0x5fe04)
  piece=self.u.reg_read(UC_M68K_REG_D0)&255
  if piece<self.get(0x1ca1a,1):
   self.put(0x1bb85,piece,1)
   self.call(0x5be44);self.call(0x60246)
   self.put(0x1bb1c,self.get(0x1bb85,1),1)
 def step(self,controls=0x11):
  self.put(0x1bb47,controls,1)
  self.call(0x5d8a2)
  self.call(0x6185c)
  self.locate()
  if self.gameplay:
   self.call(0x5a794);self.call(0x5dfb4)
   self.call_until(0x5db34,[0x5db58])
 def state(self):
  return {**{name:self.get(a,4,True)/scale for name,a,scale in [('x',0x1bcd8,131072),('y',0x1bcdc,262144),('z',0x1bce0,131072)]},
   'pitch':self.get(0x1bce4,2,True)*math.tau/65536,'yaw':self.get(0x1bce6,2,True)*math.tau/65536,
   'speed':self.get(0x1bd30,2,True)*(238/256)*(50/6)/2048,
   'vx':self.get(0x1bcea,2,True)*(238/256)*(50/6)/2048,
   'vy':self.get(0x1bcec,2,True)*(238/256)*(50/6)/2048,
   'vz':self.get(0x1bcee,2,True)*(238/256)*(50/6)/2048,
   'section':self.get(0x1bb1c,1),'chains':self.get(0x1bbdf,1),'contact':bool(self.get(0x1bb7e,1))}

def run_up(seconds):
 o=Original();o.recover(34)
 trace=[]
 for i in range(120):
  o.step(0x10)  # Release the chain; no acceleration or brake bits.
  if not o.state()['chains'] and o.state()['contact']:break
 else:raise RuntimeError('Crane failed to release and land')
 release=o.state()
 for i in range(round(seconds/.12)):
  o.step(2)
  trace.append({'phase':'reverse','time':(i+1)*.12,**o.state()})
 reverse_end=o.state()
 cleared=False
 for i in range(200):
  o.step(0x11)
  state=o.state()
  trace.append({'phase':'forward','time':(i+1)*.12,**state})
  if 36<=state['section']<=38 and state['contact']:
   cleared=True
   break
 return {'reverseSeconds':seconds,'cleared':cleared,'release':release,'reverseEnd':reverse_end,'end':o.state(),'trace':trace}

def free_fall():
 o=Original();o.recover(34)
 o.put(0x1bbdf,0,1)
 for a,v,scale in [(0x1bcd8,450,131072),(0x1bcdc,100,262144),(0x1bce0,450,131072)]:o.put(a,int(v*scale),4)
 for a in range(0x1bcea,0x1bd02,2):o.put(a,0)
 o.locate()
 trace=[{'time':0,**o.state()}]
 for i in range(15):
  o.step(0)
  trace.append({'time':(i+1)*.12,**o.state()})
 return trace

def flat_acceleration(controls):
 o=Original();o.recover(29)
 for i in range(100):o.step(0x10)
 trace=[{'time':0,**o.state()}]
 for i in range(40):
  o.step(controls)
  trace.append({'time':(i+1)*.12,**o.state()})
 return trace

def braking(controls):
 o=Original();o.recover(29)
 for i in range(100):o.step(0x10)
 for i in range(40):o.step(1)
 trace=[{'time':0,**o.state()}]
 for i in range(30):
  o.step(controls)
  trace.append({'time':(i+1)*.12,**o.state()})
 return trace

def suspension_samples():
 o=Original();samples=[]
 for compression in [-512,0,128,317,512,1024,4096]:
  for change in [-768,-256,0,256,768]:
   o.call(0x6180e,d0=change&65535,d6=compression&65535)
   raw=o.u.reg_read(UC_M68K_REG_D0)&65535
   if raw>=32768:raw-=65536
   samples.append({'compression':compression,'change':change,'force':max(0,min(0x11ff,raw))})
 return samples

def traction_samples():
 o=Original();samples=[]
 for normal in [0,317,1000]:
  for speed in [-4096,-512,0,512,4096]:
   for gravity in [-158,0,158]:
    o.put(0x1bb7e,int(normal>0),1);o.put(0x1bd42,normal)
    o.put(0x1bd2c,speed);o.put(0x1bd0e,gravity);o.put(0x1bd40,0)
    o.call(0x6217a)
    samples.append({'normal':normal,'speed':speed,'gravity':gravity,'acceleration':o.get(0x1bd32,2,True)})
 return samples

def corner():
 o=Original();o.recover(24)
 for i in range(100):o.step(0x10)
 trace=[{'time':0,**o.state()}]
 for i in range(160):
  o.step(0x11)
  trace.append({'time':(i+1)*.12,**o.state()})
 return trace

def steering_samples():
 tracks=json.loads((ROOT/'public/assets/tracks.json').read_text())
 samples=[]
 for track in tracks:
  o=Original(track['id']);o.recover(track['spawn'])
  seen=set()
  for piece,p in enumerate(track['pieces']):
   if p['template'] in seen:continue
   seen.add(p['template'])
   j=p['segments']//2
   a=[(p['points'][j][0][k]+p['points'][j][1][k])/2 for k in range(3)]
   b=[(p['points'][j+1][0][k]+p['points'][j+1][1][k])/2 for k in range(3)]
   x,y,z=[(a[k]+b[k])/2/[32,128,32][k] for k in range(3)]
   yaw=math.atan2(b[0]-a[0],b[2]-a[2])
   for a1,v,scale in [(0x1bcd8,x,131072),(0x1bcdc,y,262144),(0x1bce0,z,131072)]:o.put(a1,round(v*scale),4)
   o.locate()
   for speed in [30,60,-30]:
    for error in [-.1,0,.1]:
     for direction in [-1,0,1]:
      raw_yaw=round((yaw-error)*65536/math.tau)
      o.put(0x1bce6,raw_yaw);o.put(0x1bcf2,0)
      o.put(0x1bd30,round(speed/((238/256)*(50/6)/2048)))
      o.put(0x1bb7e,1,1);o.put(0x1bbc6,direction*15,1)
      o.call(0x61012)
      rate=o.get(0x1bcfe,2,True)*(238/256)*(50/6)*math.tau/65536
      adjustment=((o.get(0x1bce6)-raw_yaw+32768)%65536-32768)*math.tau/65536/(6/50)
      samples.append({'track':track['id'],'piece':piece,'x':x,'y':y,'z':z,'yaw':yaw-error,'speed':speed,'input':direction,'rate':rate,'alignment':adjustment,
       'difference':o.get(0x1bbf6,2,True)*math.tau/65536,'amount':o.get(0x1bbd4,1)})
 return samples

def runtime_traces():
 tracks=json.loads((ROOT/'public/assets/tracks.json').read_text())
 cases=[]
 for track in tracks:
  for super_league in [False,True]:
   o=Original(track['id'],gameplay=True,super_league=super_league)
   o.recover(track['spawn'])
   trace=[]
   for tick in range(350):
    recovery=None
    if tick==160:
     recovery=[34,20,38,34,32,54,45,40][track['id']]
     o.recover(recovery)
    controls=16 if tick<50 or 160<=tick<210 else 17 if tick<90 or tick>=252 else 9 if tick<100 else 5 if tick<110 else 18 if tick<140 else 2 if tick>=210 else 0
    o.step(controls)
    # Compare integer bytes, including all linear/angular velocities and forces,
    # suspension history, original damage/boost/crane flags and mutable bridge.
    spans=[(0x1bb4f,8),(0x1bb62,1),(0x1bb7d,2),(0x1bb9b,2),(0x1bbcd,3),(0x1bbdf,1),(0x1bc94,0xca),(0x1ca20,1)]
    raw=b''.join(bytes(o.u.mem_read(a,n)) for a,n in spans)
    profile=o.get(0x1efa2+95*2);profile=((profile&255)<<8)|(profile>>8)
    if track['id']==5:raw+=bytes(o.u.mem_read(0x1ef82+profile-0xb100,74))
    trace.append({'controls':controls,'recover':recovery,'raw':raw.hex(),'state':o.state()})
   cases.append({'track':track['id'],'superLeague':super_league,'trace':trace})
 return {'sourceSha256':hashlib.sha256(disk).hexdigest(),'physicsStepSeconds':.12,'cases':cases}

if __name__=='__main__':
 parser=argparse.ArgumentParser(description=__doc__)
 parser.add_argument('--output',type=Path)
 parser.add_argument('--runtime-only',action='store_true',help='Record browser runtime boundaries, finite boost, damage, bridge and both leagues')
 args=parser.parse_args()
 if args.runtime_only:
  result=runtime_traces()
  if args.output:args.output.write_text(json.dumps(result,separators=(',',':'))+'\n')
  print(json.dumps({'cases':len(result['cases']),'ticks':sum(len(c['trace']) for c in result['cases'])}))
  raise SystemExit
 result={'source':'original/Stunt_Car_Racer_1989_MicroStyle_cr_QTX.adf','sourceSha256':hashlib.sha256(disk).hexdigest(),'physicsStepSeconds':.12,
  'limitations':'Isolated original 68000 routines; hardware I/O stubbed, boot steering data initialized, unlimited boost, no opponents or full race loop.',
  'freeFall':free_fall(),'flatAcceleration':{name:flat_acceleration(controls) for name,controls in [('normal',1),('boost',0x11),('reverse',2),('reverseBoost',0x12)]},
  'littleRamp':[run_up(seconds) for seconds in [0,5,6,7]],'corner':corner(),'steeringSamples':steering_samples(),
  'braking':{'normal':braking(2),'boost':braking(0x12)},'suspensionSamples':suspension_samples(),'tractionSamples':traction_samples()}
 if args.output:args.output.write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps({'freeFallFinalVy':result['freeFall'][-1]['vy'],
  'steeringCases':len(result['steeringSamples']),'suspensionCases':len(result['suspensionSamples']),'tractionCases':len(result['tractionSamples']),
  'littleRamp':[{'reverseSeconds':case['reverseSeconds'],'cleared':case['cleared']} for case in result['littleRamp']]},indent=2))
