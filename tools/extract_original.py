#!/usr/bin/env python3
"""Decode only the supplied Quartex ADF. No downloaded assets or code are inputs.
Offsets are payload-relative. Format interpretation was checked against published
Amiga disassembly; the byte source, hashes and ranges are recorded for auditing.
"""
from pathlib import Path
import struct, hashlib, json, wave
from PIL import Image
ROOT=Path(__file__).resolve().parents[1]
ADF=next((ROOT/'original').glob('*.adf'))
disk=ADF.read_bytes()
START=0xdc00; SIZE=408540; BASE=0xe700
b=disk[START:START+SIZE]
assert b[:4]==bytes.fromhex('207c0000'), 'Unsupported disk: expected Quartex plaintext payload'
out=ROOT/'public/assets'; out.mkdir(parents=True,exist_ok=True)
analysis=ROOT/'analysis'; analysis.mkdir(exist_ok=True)
(analysis/'original.bin').write_bytes(b)
def word(p): return int.from_bytes(b[p:p+2],'big')
def little(p): return int.from_bytes(b[p:p+2],'little')
def long(p): return int.from_bytes(b[p:p+4],'big')
def sha(data): return hashlib.sha256(data).hexdigest()
manifest={'disk':{'file':ADF.name,'bytes':len(disk),'sha256':sha(disk)},'payload':{'offset':START,'size':len(b),'loadAddress':BASE,'sha256':sha(b)},'assets':[]}
def record(name,p,size,**extra):
 manifest['assets'].append({'file':name,'payloadOffset':p,'diskOffset':START+p,'sourceBytes':size,'sha256':sha(b[p:p+size]),**extra})
(out/'original-code.bin').write_bytes(b)
record('original-code.bin',0,len(b),format='unmodified 68000 payload, loaded at 0xE700')
levels=[0,51,85,119,153,187,221,255]
def palette(p):
 return [tuple(levels[(word(p+i*2)>>s)&7] for s in (8,4,0)) for i in range(16)]
def picture(name,p,pal,rle=True):
 planes=[bytearray(8000) for _ in range(4)]; start=p
 if rle:
  for y in range(200):
   for plane in range(4):
    row=bytearray()
    while len(row)<40:
     v=b[p];p+=1
     if v==128:continue
     if v>128:
      row.extend([b[p]]*(257-v));p+=1
     else:row.extend(b[p:p+v+1]);p+=v+1
    assert len(row)==40,(name,y,plane,len(row))
    planes[plane][y*40:y*40+40]=row
 else:
  for i in range(4000):
   for plane in range(4):
    planes[plane][i*2:i*2+2]=b[p:p+2];p+=2
 colors=palette(pal)
 pixels=[]
 for y in range(200):
  for x in range(320):
   idx=sum(((planes[j][y*40+x//8]>>(7-x%8))&1)<<j for j in range(4))
   pixels.append(colors[idx])
 im=Image.new('RGB',(320,200));im.putdata(pixels);im.save(out/f'{name}.png')
 record(f'{name}.png',start,p-start,paletteOffset=pal,format='4 bitplanes, '+('row RLE' if rle else 'word interleaved'))
 return im
cockpit=picture('cockpit',0x11aa4,0x11a84)
picture('menu',0x15552,0x15532,False)
picture('preview',0x1d294,0x1d274)
picture('standings',0x224f0,0x224d0)
picture('drivers',0x27396,0x27376,False)
# Original graphics-object atlas: tyre frames, flames, damage and dust.
# The game's bitmap loader treats palette index 1 as transparent.
sprites=picture('cockpit-sprites',0x5beb6,0x11a84,False).convert('RGBA')
transparent=palette(0x11a84)[1]
sprites.putdata([(*pixel[:3],0 if pixel[:3]==transparent else 255) for pixel in sprites.getdata()])
sprites.save(out/'cockpit-sprites.png')
manifest['assets'][-1]['transparentIndex']=1
objects=[]
for i in range(52):
 x,y,w,h,dx,dy,_,_=struct.unpack_from('>8H',b,0x5ba6c+i*16)
 objects.append({'x':x*16,'y':y,'width':(w+1)*16,'height':h+1,'screenX':dx*16,'screenY':dy})
portraits=[]
for i in range(12):
 offset=long(0x4a3a4+4*b[0x4a420+i])
 portraits.append({'x':offset%160*2,'y':offset//160,'width':80,'height':55})
effects={'objects':objects,'portraits':portraits,
 'dustOffsets':[word(0x5289c+2*i) for i in range(8)],
 'dustSequence':list(b[0x528ac:0x528bc]),
 'wheelLift':[word(0xe342+2*i)>>11 for i in range(256)]}
(out/'cockpit-effects.json').write_text(json.dumps(effects))
for p,n,description in [(0x5ba6c,52*16,'graphics-object source rectangles and screen positions'),
 (0x5289c,32,'dust offsets and animation sequence'),(0xe342,512,'wheel suspension lookup'),
 (0x4a3a4,136,'portrait source positions and driver mapping')]:
 record('cockpit-effects.json',p,n,format=description)
for name,p in [('wreck',0x2f0b6),('won',0x3607c),('lost',0x3c83e),('promotion',0x4274c)]:
 picture(name,p+34,p+2,b[p]>=128)
# Palette is kept as exact expanded 9-bit Amiga RGB values.
(out/'primary-font.bin').write_bytes(b[0x11782:0x11782+96*8])
record('primary-font.bin',0x11782,96*8)
font=bytearray()
for c in range(96):
 for y in range(8):
  v=0
  for x in range(6):
   bit=(c%32)*6+x
   w=word(0x18bc2+(c//32)*3840+y*160+(bit//16)*8)
   v|=((w>>(15-bit%16))&1)<<(7-x)
  font.append(v)
(out/'font.bin').write_bytes(font)
record('font.bin',0x18bc2,8960,format='6 by 8 font from menu bitplane 0')
(out/'palette.json').write_text(json.dumps(palette(0x11a84)))
# Original DMA sample records: absolute address, byte count, period, volume, flags.
samples=[]
for i in range(8):
 p=0xcfca+16*i; addr=long(p)-BASE; n=long(p+4); period=word(p+8);vol=word(p+10)
 if not (0<=addr<len(b) and 0<n<60000 and 50<=period<2000):continue
 raw=b[addr:addr+n]
 with wave.open(str(out/f'sound-{i}.wav'),'wb') as w:
  w.setnchannels(1);w.setsampwidth(1);w.setframerate(round(3546895/period));w.writeframes(bytes(v^128 for v in raw))
 record(f'sound-{i}.wav',addr,n,period=period,volume=vol)
 samples.append({'id':i,'period':period,'volume':vol,'length':n})
(out/'sounds.json').write_text(json.dumps(samples))
# Packed track bytecode uses little-endian pointers into an embedded 6502-era database.
DB=0x10882
def pointer(p):return DB+little(p)-0xb100
def template(t):
 p=pointer(DB+t*2); k=b[p]; n=b[p+k]//2
 coords=[struct.unpack_from('<hhhh',b,p+k+7+j*8) for j in range(n)]
 return {'offset':p,'segments':n-1,'type':b[p+1],'steer':b[p+k+6],'coords':coords}
def heights(h,n,wide):
 p=pointer(DB+32+(h&127)*2)
 return [word(p+2*i)&32767 if wide else ((b[p+i]&15)<<8)|((b[p+i]<<1)&224) for i in range(n+1)]
def rotate(x,z,r):
 return [(x,z),(z,2048-x),(2048-x,2048-z),(2048-z,x)][r]
tracks=[]
recovery_flags=b[0x109c2:0x109c2+16]
record('recovery-template-flags',0x109c2,16,format='bit 7 excludes a geometry template from crane recovery')
for tid in range(8):
 p=pointer(0x109a2+tid*2);start=p
 count,spawn,finish,half=b[p:p+4];p+=4
 ly=ry=little(p);p+=2
 pieces=[];repeat=0;lastcode=0;pos=0;parity=0
 while len(pieces)<count:
  if repeat:
   repeat-=1;code=lastcode
   direction=(code^(0xc0 if code&16 else 0))>>6
   pos=(pos+[16,1,-16,-1][direction])&255
  else:
   code=b[p];p+=1
   if code&15==15:repeat=code>>4;continue
   lastcode=code;pos=b[p];p+=1
  t=code&15
  if t>=12:
   l=[3,4,4][t-12];r=[4,3,0][t-12];code&=240;t=0
  else:
   l=b[p];p+=1
   if code&32:r=l
   else:r=b[p];p+=1
  geom=template(t);n=geom['segments']
  yl=heights(l,n,bool(l&128));yr=heights(r,n,bool(l&128))
  shiftl=ly-yl[0];shiftr=ry-yr[0]
  ly=shiftl+yl[-1];ry=shiftr+yr[-1]
  xz=geom['coords']
  if code&16:xz=[(v[2],v[3],v[0],v[1]) for v in xz[::-1]]
  points=[]
  for j,(lx,lz,rx,rz) in enumerate(xz):
   lx,lz=rotate(lx,lz,code>>6);rx,rz=rotate(rx,rz,code>>6)
   points.append([[lx+(pos&15)*2048,yl[j]+shiftl,lz+(pos>>4)*2048],[rx+(pos&15)*2048,yr[j]+shiftr,rz+(pos>>4)*2048]])
  pieces.append({'grid':pos,'code':code,'template':t,'geometryType':geom['type'],'steeringAmount':geom['steer'],'leftId':l,'rightId':(r&127)|(parity<<7),'leftShift':shiftl,'rightShift':shiftr,'segments':n,'points':points})
  parity=(parity+n)&1
 trailer=list(b[p:p+6]);p+=6
 # Original $605B6 checks both the template flags and this per-track exclusion
 # list when searching backwards for a place to lower the car.
 p+=trailer[4]*2
 recovery_forbidden=list(b[p:p+trailer[5]]);p+=trailer[5]
 assert all(0<=i<count for i in recovery_forbidden)
 for i,piece in enumerate(pieces):
  piece['recoveryAllowed']=not (recovery_flags[piece['template']]&128) and i not in recovery_forbidden
 name=b[0x106aa+16*tid:0x106aa+16*(tid+1)].decode('ascii').strip()
 tracks.append({'id':tid,'name':name,'spawn':spawn,'finish':finish,'half':half,'boost':trailer[2],'superBoost':trailer[3],'trailer':trailer,'recoveryForbidden':recovery_forbidden,'pieces':pieces,'offset':start})
 record(f'track-{tid}',start,p-start,sections=count)
# Preserve decoded endpoints; renderer accounts for one-unit rounding at adjoining pieces.
(out/'tracks.json').write_text(json.dumps(tracks,separators=(',',':')))
(out/'drivers.json').write_text(json.dumps([b[0x105aa+i*16:0x105aa+i*16+14].decode('ascii',errors='replace').strip() for i in range(11)]))
# Scenery template words with bit 15 set take their value from a second data stream.
scenery=[]
for i in range(25):
 q=long(0x5b2b8+i*8)-BASE;r=long(0x5b2bc+i*8)-BASE
 n=word(q);q+=2;pts=[]
 for j in range(n):
  v=[]
  for axis in range(2):
   value=word(q);q+=2
   if value&0x8000:value=word(r);r+=2
   v.append(value)
  pts.append(v)
 ne=b[q];q+=1;edges=[]
 for j in range(ne):edges.append([b[q]//2,b[q+1]//2]);q+=2
 nf=b[q];q+=1;faces=[]
 for j in range(nf):
  color,count=b[q:q+2];q+=2;ids=[b[q+k]//4 for k in range(count)];q+=count
  chosen=[edges[k] for k in ids];verts=chosen[0][:];remaining=chosen[1:]
  while remaining:
   found=next((k for k,e in enumerate(remaining) if verts[-1] in e),None)
   assert found is not None
   a,c=remaining.pop(found);verts.append(c if a==verts[-1] else a)
  faces.append({'color':color,'vertices':verts[:-1]})
 scenery.append({'points':pts,'faces':faces})
count=b[0x5b388]
placements=[list(b[0x5b389+2*i:0x5b38b+2*i]) for i in range(count)]
(out/'scenery.json').write_text(json.dumps({'shapes':scenery,'placements':placements}))
record('scenery.json',0x5b09e,0x5b3c9-0x5b09e,format='original silhouette templates, vertices, edge faces and azimuths')
(out/'config.json').write_text(json.dumps({'divisionTracks':[list(b[0x561c2+i*2:0x561c4+i*2]) for i in range(4)],'driverNames':[b[0x105aa+i*16:0x105aa+i*16+14].decode('ascii').strip() for i in range(11)]}))
record('config.json',0x561c2,8,format='division tracks, lowest division first')
record('drivers.json',0x105aa,16*11,format='14 character names at 16 byte strides')
(out/'manifest.json').write_text(json.dumps(manifest,indent=2))
print(json.dumps({'tracks':[(t['name'],len(t['pieces']),t['boost']) for t in tracks],'sounds':samples,'assets':len(manifest['assets'])},indent=2))
# Reproducible linear disassembly of the supplied bytes. Data words are labelled as data;
# code/data classification is provisional, as this game has self-modifying protection.
try:
 from capstone import Cs,CS_ARCH_M68K,CS_MODE_BIG_ENDIAN,CS_MODE_M68K_000
 md=Cs(CS_ARCH_M68K,CS_MODE_BIG_ENDIAN|CS_MODE_M68K_000);md.skipdata=True
 with (analysis/'original-68000.asm').open('w') as f:
  f.write('; Generated from supplied ADF, not from a downloaded disassembly.\n; Addresses include original load address $E700. Linear sweep includes data.\n')
  for start,end in [(0,0xd18e),(0x47d00,len(b))]:
   for i in md.disasm(b[start:end],BASE+start):f.write(f'{i.address:06x}: {i.bytes.hex():24s} {i.mnemonic:12s} {i.op_str}\n')
except ImportError:print('Install capstone to regenerate the optional assembly listing.')
