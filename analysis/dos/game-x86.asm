; Module-relative 16-bit x86 offsets. Linear listing: includes embedded data.
; Relative branch targets printed above 0xffff wrap to 16 bits.

; Range 0000–9d7f
0000: b8d809                 mov      ax, 0x9d8
0003: 8ed8                   mov      ds, ax
0005: fc                     cld      
0006: fa                     cli      
0007: b80935                 mov      ax, 0x3509
000a: cd21                   int      0x21
000c: 891e0000               mov      word ptr [0], bx
0010: 8c060200               mov      word ptr [2], es
0014: b80835                 mov      ax, 0x3508
0017: cd21                   int      0x21
0019: 891e0400               mov      word ptr [4], bx
001d: 8c060600               mov      word ptr [6], es
0021: b80000                 mov      ax, 0
0024: 8ed8                   mov      ds, ax
0026: baa005                 mov      dx, 0x5a0
0029: b80925                 mov      ax, 0x2509
002c: cd21                   int      0x21
002e: b80000                 mov      ax, 0
0031: 8ed8                   mov      ds, ax
0033: ba5a06                 mov      dx, 0x65a
0036: b80825                 mov      ax, 0x2508
0039: cd21                   int      0x21
003b: b40f                   mov      ah, 0xf
003d: cd10                   int      0x10
003f: 8bd0                   mov      dx, ax
0041: b8d809                 mov      ax, 0x9d8
0044: 8ed8                   mov      ds, ax
0046: 89160800               mov      word ptr [8], dx
004a: b80000                 mov      ax, 0
004d: 8ed8                   mov      ds, ax
004f: ba644d                 mov      dx, 0x4d64
0052: b82425                 mov      ax, 0x2524
0055: cd21                   int      0x21
0057: e83902                 call     0x293
005a: b036                   mov      al, 0x36
005c: e643                   out      0x43, al
005e: b80000                 mov      ax, 0
0061: e640                   out      0x40, al
0063: 8ac4                   mov      al, ah
0065: e640                   out      0x40, al
0067: b0b6                   mov      al, 0xb6
0069: e643                   out      0x43, al
006b: b000                   mov      al, 0
006d: e642                   out      0x42, al
006f: e642                   out      0x42, al
0071: e461                   in       al, 0x61
0073: 24fc                   and      al, 0xfc
0075: 0c02                   or       al, 2
0077: e661                   out      0x61, al
0079: fb                     sti      
007a: e83a02                 call     0x2b7
007d: e84102                 call     0x2c1
0080: e83402                 call     0x2b7
0083: b80d00                 mov      ax, 0xd
0086: cd10                   int      0x10
0088: bace03                 mov      dx, 0x3ce
008b: b80402                 mov      ax, 0x204
008e: ef                     out      dx, ax
008f: b8d809                 mov      ax, 0x9d8
0092: 8ed8                   mov      ds, ax
0094: 8ec0                   mov      es, ax
0096: e88d00                 call     0x126
0099: b8d809                 mov      ax, 0x9d8
009c: 8ec0                   mov      es, ax
009e: fb                     sti      
009f: e9ce3c                 jmp      0x3d70
00a2: 33f6                   xor      si, si
00a4: bb1500                 mov      bx, 0x15
00a7: e80e00                 call     0xb8
00aa: 43                     inc      bx
00ab: 8027ff                 and      byte ptr [bx], 0xff
00ae: 75f7                   jne      0xa7
00b0: 23f6                   and      si, si
00b2: 7403                   je       0xb7
00b4: e94005                 jmp      0x5f7
00b7: c3                     ret      
00b8: 8026b008ff             and      byte ptr [0x8b0], 0xff
00bd: 79f9                   jns      0xb8
00bf: 8026b0087f             and      byte ptr [0x8b0], 0x7f
00c4: bf3008                 mov      di, 0x830
00c7: b95400                 mov      cx, 0x54
00ca: b0ff                   mov      al, 0xff
00cc: f2ae                   repne scasb al, byte ptr es:[di]
00ce: e3e8                   jcxz     0xb8
00d0: 8bc7                   mov      ax, di
00d2: 2d3108                 sub      ax, 0x831
00d5: 3a07                   cmp      al, byte ptr [bx]
00d7: 7403                   je       0xdc
00d9: beffff                 mov      si, 0xffff
00dc: 80257f                 and      byte ptr [di], 0x7f
00df: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
00e5: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
00eb: 74f8                   je       0xe5
00ed: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
00f3: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
00f9: 74f8                   je       0xf3
00fb: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
0101: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
0107: 74f8                   je       0x101
0109: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
010f: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
0115: 74f8                   je       0x10f
0117: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
011d: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
0123: 74f8                   je       0x11d
0125: c3                     ret      
0126: fa                     cli      
0127: b80000                 mov      ax, 0
012a: 8ed8                   mov      ds, ax
012c: ba4802                 mov      dx, 0x248
012f: b80825                 mov      ax, 0x2508
0132: cd21                   int      0x21
0134: b8d809                 mov      ax, 0x9d8
0137: 8ed8                   mov      ds, ax
0139: 33c0                   xor      ax, ax
013b: a30d00                 mov      word ptr [0xd], ax
013e: fb                     sti      
013f: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
0145: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
014b: 74f8                   je       0x145
014d: b0ff                   mov      al, 0xff
014f: a21400                 mov      byte ptr [0x14], al
0152: 890e1100               mov      word ptr [0x11], cx
0156: 40                     inc      ax
0157: 880e1200               mov      byte ptr [0x12], cl
015b: d1d3                   rcl      bx, 1
015d: d1d3                   rcl      bx, 1
015f: 03c3                   add      ax, bx
0161: ff060d00               inc      word ptr [0xd]
0165: a01400                 mov      al, byte ptr [0x14]
0168: 22c0                   and      al, al
016a: 75e6                   jne      0x152
016c: fa                     cli      
016d: b80000                 mov      ax, 0
0170: 8ed8                   mov      ds, ax
0172: ba5a06                 mov      dx, 0x65a
0175: b80825                 mov      ax, 0x2508
0178: cd21                   int      0x21
017a: b8d809                 mov      ax, 0x9d8
017d: 8ed8                   mov      ds, ax
017f: 8b1e0d00               mov      bx, word ptr [0xd]
0183: fb                     sti      
0184: ba0e00                 mov      dx, 0xe
0187: b80037                 mov      ax, 0x3700
018a: f7f3                   div      bx
018c: ba2c97                 mov      dx, 0x972c
018f: f7e2                   mul      dx
0191: 22f6                   and      dh, dh
0193: 7406                   je       0x19b
0195: b8ffff                 mov      ax, 0xffff
0198: eb0d                   jmp      0x1a7
019a: 90                     nop      
019b: 8ac4                   mov      al, ah
019d: 8ae2                   mov      ah, dl
019f: 3d6f64                 cmp      ax, 0x646f
01a2: 7303                   jae      0x1a7
01a4: b86f64                 mov      ax, 0x646f
01a7: a32000                 mov      word ptr [0x20], ax
01aa: 8b1e2000               mov      bx, word ptr [0x20]
01ae: 8bc3                   mov      ax, bx
01b0: d1e8                   shr      ax, 1
01b2: a32500                 mov      word ptr [0x25], ax
01b5: ba8000                 mov      dx, 0x80
01b8: 33c0                   xor      ax, ax
01ba: f7f3                   div      bx
01bc: d1e8                   shr      ax, 1
01be: 150000                 adc      ax, 0
01c1: a32700                 mov      word ptr [0x27], ax
01c4: 8bc3                   mov      ax, bx
01c6: d1e8                   shr      ax, 1
01c8: d1e8                   shr      ax, 1
01ca: d1e8                   shr      ax, 1
01cc: d1e8                   shr      ax, 1
01ce: d1e8                   shr      ax, 1
01d0: d1e8                   shr      ax, 1
01d2: d1e8                   shr      ax, 1
01d4: d1e8                   shr      ax, 1
01d6: d1e8                   shr      ax, 1
01d8: d1e8                   shr      ax, 1
01da: d1e8                   shr      ax, 1
01dc: d1e8                   shr      ax, 1
01de: d1e8                   shr      ax, 1
01e0: 150000                 adc      ax, 0
01e3: a22900                 mov      byte ptr [0x29], al
01e6: ba3200                 mov      dx, 0x32
01e9: 33c0                   xor      ax, ax
01eb: f7f3                   div      bx
01ed: d1e8                   shr      ax, 1
01ef: 150000                 adc      ax, 0
01f2: 22e4                   and      ah, ah
01f4: 7402                   je       0x1f8
01f6: b0ff                   mov      al, 0xff
01f8: a22a00                 mov      byte ptr [0x2a], al
01fb: ba8000                 mov      dx, 0x80
01fe: 33c0                   xor      ax, ax
0200: f7f3                   div      bx
0202: d1e8                   shr      ax, 1
0204: 150000                 adc      ax, 0
0207: 22e4                   and      ah, ah
0209: 7402                   je       0x20d
020b: b0ff                   mov      al, 0xff
020d: a22b00                 mov      byte ptr [0x2b], al
0210: ba1e00                 mov      dx, 0x1e
0213: 33c0                   xor      ax, ax
0215: f7f3                   div      bx
0217: d1e8                   shr      ax, 1
0219: 150000                 adc      ax, 0
021c: 22e4                   and      ah, ah
021e: 7402                   je       0x222
0220: b0ff                   mov      al, 0xff
0222: a22c00                 mov      byte ptr [0x2c], al
0225: b80e00                 mov      ax, 0xe
0228: f7e3                   mul      bx
022a: 22c0                   and      al, al
022c: 8ac4                   mov      al, ah
022e: 8ae2                   mov      ah, dl
0230: 7901                   jns      0x233
0232: 40                     inc      ax
0233: a22300                 mov      byte ptr [0x23], al
0236: 8ad4                   mov      dl, ah
0238: 8ac2                   mov      al, dl
023a: 80e20f                 and      dl, 0xf
023d: 80fa09                 cmp      dl, 9
0240: 7602                   jbe      0x244
0242: 0406                   add      al, 6
0244: a22200                 mov      byte ptr [0x22], al
0247: c3                     ret      
0248: 50                     push     ax
0249: b0ff                   mov      al, 0xff
024b: 2ea24da6               mov      byte ptr cs:[0xa64d], al
024f: a01400                 mov      al, byte ptr [0x14]
0252: 22c0                   and      al, al
0254: 740b                   je       0x261
0256: fe0e1300               dec      byte ptr [0x13]
025a: 7505                   jne      0x261
025c: 32c0                   xor      al, al
025e: a21400                 mov      byte ptr [0x14], al
0261: b020                   mov      al, 0x20
0263: e620                   out      0x20, al
0265: 58                     pop      ax
0266: cf                     iret     
0267: fb                     sti      
0268: b80d00                 mov      ax, 0xd
026b: cd10                   int      0x10
026d: b80000                 mov      ax, 0
0270: cd33                   int      0x33
0272: b80300                 mov      ax, 3
0275: cd33                   int      0x33
0277: 53                     push     bx
0278: 51                     push     cx
0279: 52                     push     dx
027a: b800a0                 mov      ax, 0xa000
027d: 8ec0                   mov      es, ax
027f: b8aaaa                 mov      ax, 0xaaaa
0282: bf2800                 mov      di, 0x28
0285: ab                     stosw    word ptr es:[di], ax
0286: ab                     stosw    word ptr es:[di], ax
0287: ab                     stosw    word ptr es:[di], ax
0288: bf0000                 mov      di, 0
028b: 58                     pop      ax
028c: ab                     stosw    word ptr es:[di], ax
028d: 58                     pop      ax
028e: ab                     stosw    word ptr es:[di], ax
028f: 58                     pop      ax
0290: ab                     stosw    word ptr es:[di], ax
0291: ebdf                   jmp      0x272
0293: 33d2                   xor      dx, dx
0295: 33c9                   xor      cx, cx
0297: fb                     sti      
0298: b006                   mov      al, 6
029a: e643                   out      0x43, al
029c: e440                   in       al, 0x40
029e: 8ae0                   mov      ah, al
02a0: e440                   in       al, 0x40
02a2: 86e0                   xchg     al, ah
02a4: 23c0                   and      ax, ax
02a6: 740a                   je       0x2b2
02a8: 3bc2                   cmp      ax, dx
02aa: 7602                   jbe      0x2ae
02ac: 8bd0                   mov      dx, ax
02ae: e2e8                   loop     0x298
02b0: 8bc2                   mov      ax, dx
02b2: a30f00                 mov      word ptr [0xf], ax
02b5: fa                     cli      
02b6: c3                     ret      
02b7: baf203                 mov      dx, 0x3f2
02ba: b00f                   mov      al, 0xf
02bc: ee                     out      dx, al
02bd: f4                     hlt      
02be: f4                     hlt      
02bf: f4                     hlt      
02c0: c3                     ret      
02c1: 50                     push     ax
02c2: 53                     push     bx
02c3: 51                     push     cx
02c4: 52                     push     dx
02c5: 56                     push     si
02c6: 57                     push     di
02c7: 55                     push     bp
02c8: 1e                     push     ds
02c9: 06                     push     es
02ca: 07                     pop      es
02cb: 1f                     pop      ds
02cc: 5d                     pop      bp
02cd: 5f                     pop      di
02ce: 5e                     pop      si
02cf: 5a                     pop      dx
02d0: 59                     pop      cx
02d1: 5b                     pop      bx
02d2: 58                     pop      ax
02d3: f4                     hlt      
02d4: f4                     hlt      
02d5: f4                     hlt      
02d6: f4                     hlt      
02d7: f4                     hlt      
02d8: 06                     push     es
02d9: 50                     push     ax
02da: 52                     push     dx
02db: b800f0                 mov      ax, 0xf000
02de: 8ec0                   mov      es, ax
02e0: 26a0c7ef               mov      al, byte ptr es:[0xefc7]
02e4: 2410                   and      al, 0x10
02e6: b0fc                   mov      al, 0xfc
02e8: 7502                   jne      0x2ec
02ea: b0f7                   mov      al, 0xf7
02ec: baf203                 mov      dx, 0x3f2
02ef: ee                     out      dx, al
02f0: 5a                     pop      dx
02f1: 58                     pop      ax
02f2: 07                     pop      es
02f3: c3                     ret      
02f4: 0000                   add      byte ptr [bx + si], al
02f6: 0000                   add      byte ptr [bx + si], al
02f8: 0000                   add      byte ptr [bx + si], al
02fa: 0000                   add      byte ptr [bx + si], al
02fc: 0000                   add      byte ptr [bx + si], al
02fe: 0000                   add      byte ptr [bx + si], al
0300: a2b400                 mov      byte ptr [0xb4], al
0303: 881eb500               mov      byte ptr [0xb5], bl
0307: 8826b600               mov      byte ptr [0xb6], ah
030b: e80c00                 call     0x31a
030e: a0b400                 mov      al, byte ptr [0xb4]
0311: 8a1eb500               mov      bl, byte ptr [0xb5]
0315: 8a26b600               mov      ah, byte ptr [0xb6]
0319: c3                     ret      
031a: 8026b000ff             and      byte ptr [0xb0], 0xff
031f: 7418                   je       0x339
0321: fe06b100               inc      byte ptr [0xb1]
0325: 803eb10002             cmp      byte ptr [0xb1], 2
032a: 7404                   je       0x330
032c: a2b200                 mov      byte ptr [0xb2], al
032f: c3                     ret      
0330: a2b300                 mov      byte ptr [0xb3], al
0333: c606b00000             mov      byte ptr [0xb0], 0
0338: c3                     ret      
0339: 3c1f                   cmp      al, 0x1f
033b: 7509                   jne      0x346
033d: a2b000                 mov      byte ptr [0xb0], al
0340: c606b10000             mov      byte ptr [0xb1], 0
0345: c3                     ret      
0346: 3c7f                   cmp      al, 0x7f
0348: 722e                   jb       0x378
034a: 7527                   jne      0x373
034c: fe0eb200               dec      byte ptr [0xb2]
0350: a0bd02                 mov      al, byte ptr [0x2bd]
0353: 50                     push     ax
0354: a0bd4a                 mov      al, byte ptr [0x4abd]
0357: 3cc0                   cmp      al, 0xc0
0359: b007                   mov      al, 7
035b: 7502                   jne      0x35f
035d: b00e                   mov      al, 0xe
035f: a2bd02                 mov      byte ptr [0x2bd], al
0362: b080                   mov      al, 0x80
0364: a2b400                 mov      byte ptr [0xb4], al
0367: e8b0ff                 call     0x31a
036a: 58                     pop      ax
036b: a2bd02                 mov      byte ptr [0x2bd], al
036e: fe0eb200               dec      byte ptr [0xb2]
0372: c3                     ret      
0373: 3c80                   cmp      al, 0x80
0375: 7401                   je       0x378
0377: c3                     ret      
0378: 32e4                   xor      ah, ah
037a: 8bf0                   mov      si, ax
037c: 802617e2ff             and      byte ptr [0xe217], 0xff
0381: 7413                   je       0x396
0383: 33f6                   xor      si, si
0385: 2d2000                 sub      ax, 0x20
0388: d1e0                   shl      ax, 1
038a: 03f0                   add      si, ax
038c: d1e0                   shl      ax, 1
038e: 03f0                   add      si, ax
0390: 81c6d302               add      si, 0x2d3
0394: eb0a                   jmp      0x3a0
0396: d1e6                   shl      si, 1
0398: d1e6                   shl      si, 1
039a: d1e6                   shl      si, 1
039c: 81c62004               add      si, 0x420
03a0: a10a00                 mov      ax, word ptr [0xa]
03a3: 8ec0                   mov      es, ax
03a5: a0b300                 mov      al, byte ptr [0xb3]
03a8: 32e4                   xor      ah, ah
03aa: 8bc8                   mov      cx, ax
03ac: d1e0                   shl      ax, 1
03ae: d1e0                   shl      ax, 1
03b0: 03c1                   add      ax, cx
03b2: d1e0                   shl      ax, 1
03b4: d1e0                   shl      ax, 1
03b6: d1e0                   shl      ax, 1
03b8: 8bf8                   mov      di, ax
03ba: d1e7                   shl      di, 1
03bc: d1e7                   shl      di, 1
03be: d1e7                   shl      di, 1
03c0: 83ef28                 sub      di, 0x28
03c3: a0b200                 mov      al, byte ptr [0xb2]
03c6: 32e4                   xor      ah, ah
03c8: 8bc8                   mov      cx, ax
03ca: d1e0                   shl      ax, 1
03cc: d1e0                   shl      ax, 1
03ce: d1e0                   shl      ax, 1
03d0: 03060553               add      ax, word ptr [0x5305]
03d4: 2bc1                   sub      ax, cx
03d6: 802617e2ff             and      byte ptr [0xe217], 0xff
03db: 7406                   je       0x3e3
03dd: 2bc1                   sub      ax, cx
03df: 033e83df               add      di, word ptr [0xdf83]
03e3: 8ac8                   mov      cl, al
03e5: 80e107                 and      cl, 7
03e8: d1e8                   shr      ax, 1
03ea: d1e8                   shr      ax, 1
03ec: d1e8                   shr      ax, 1
03ee: 03f8                   add      di, ax
03f0: a0704a                 mov      al, byte ptr [0x4a70]
03f3: 3c45                   cmp      al, 0x45
03f5: 7505                   jne      0x3fc
03f7: 83c728                 add      di, 0x28
03fa: eb0f                   jmp      0x40b
03fc: 3c41                   cmp      al, 0x41
03fe: 750b                   jne      0x40b
0400: a017e2                 mov      al, byte ptr [0xe217]
0403: 22c0                   and      al, al
0405: 7504                   jne      0x40b
0407: 81ef4001               sub      di, 0x140
040b: 8026ba00ff             and      byte ptr [0xba], 0xff
0410: 7904                   jns      0x416
0412: 81c7a000               add      di, 0xa0
0416: b508                   mov      ch, 8
0418: 802617e2ff             and      byte ptr [0xe217], 0xff
041d: 7402                   je       0x421
041f: b506                   mov      ch, 6
0421: bac403                 mov      dx, 0x3c4
0424: b8020f                 mov      ax, 0xf02
0427: ef                     out      dx, ax
0428: bace03                 mov      dx, 0x3ce
042b: b80308                 mov      ax, 0x803
042e: ef                     out      dx, ax
042f: 8a3c                   mov      bh, byte ptr [si]
0431: 46                     inc      si
0432: 32db                   xor      bl, bl
0434: d3eb                   shr      bx, cl
0436: f7d3                   not      bx
0438: 268a25                 mov      ah, byte ptr es:[di]
043b: 26883d                 mov      byte ptr es:[di], bh
043e: 268a6501               mov      ah, byte ptr es:[di + 1]
0442: 26885d01               mov      byte ptr es:[di + 1], bl
0446: f7d3                   not      bx
0448: b80310                 mov      ax, 0x1003
044b: bace03                 mov      dx, 0x3ce
044e: ef                     out      dx, ax
044f: bac403                 mov      dx, 0x3c4
0452: b002                   mov      al, 2
0454: 8a26bd02               mov      ah, byte ptr [0x2bd]
0458: 80e40f                 and      ah, 0xf
045b: ef                     out      dx, ax
045c: 268a25                 mov      ah, byte ptr es:[di]
045f: 8ac7                   mov      al, bh
0461: aa                     stosb    byte ptr es:[di], al
0462: 268a05                 mov      al, byte ptr es:[di]
0465: 8ac3                   mov      al, bl
0467: aa                     stosb    byte ptr es:[di], al
0468: 83c726                 add      di, 0x26
046b: fecd                   dec      ch
046d: 75b2                   jne      0x421
046f: fe06b200               inc      byte ptr [0xb2]
0473: 803eb2002d             cmp      byte ptr [0xb2], 0x2d
0478: 7205                   jb       0x47f
047a: c606b20000             mov      byte ptr [0xb2], 0
047f: 8cd8                   mov      ax, ds
0481: 8ec0                   mov      es, ax
0483: 32ff                   xor      bh, bh
0485: bace03                 mov      dx, 0x3ce
0488: b80300                 mov      ax, 3
048b: ef                     out      dx, ax
048c: bac403                 mov      dx, 0x3c4
048f: b8020f                 mov      ax, 0xf02
0492: ef                     out      dx, ax
0493: c3                     ret      
0494: 32db                   xor      bl, bl
0496: 8026b008ff             and      byte ptr [0x8b0], 0xff
049b: 790f                   jns      0x4ac
049d: 32ff                   xor      bh, bh
049f: 81c33008               add      bx, 0x830
04a3: 8027ff                 and      byte ptr [bx], 0xff
04a6: b300                   mov      bl, 0
04a8: 7902                   jns      0x4ac
04aa: f6d3                   not      bl
04ac: 22db                   and      bl, bl
04ae: c3                     ret      
04af: 881eb500               mov      byte ptr [0xb5], bl
04b3: 8826b600               mov      byte ptr [0xb6], ah
04b7: 8026b008ff             and      byte ptr [0x8b0], 0xff
04bc: 74f9                   je       0x4b7
04be: 8026b00800             and      byte ptr [0x8b0], 0
04c3: c606b70000             mov      byte ptr [0xb7], 0
04c8: 32e4                   xor      ah, ah
04ca: bf3008                 mov      di, 0x830
04cd: b95400                 mov      cx, 0x54
04d0: b0ff                   mov      al, 0xff
04d2: 47                     inc      di
04d3: 2005                   and      byte ptr [di], al
04d5: 7509                   jne      0x4e0
04d7: e2f9                   loop     0x4d2
04d9: 22e4                   and      ah, ah
04db: 74da                   je       0x4b7
04dd: eb1c                   jmp      0x4fb
04df: 90                     nop      
04e0: 8bdf                   mov      bx, di
04e2: 81eb3008               sub      bx, 0x830
04e6: 80fb2a                 cmp      bl, 0x2a
04e9: 7405                   je       0x4f0
04eb: 80fb36                 cmp      bl, 0x36
04ee: 7507                   jne      0x4f7
04f0: c606b70040             mov      byte ptr [0xb7], 0x40
04f5: ebdb                   jmp      0x4d2
04f7: 8ae3                   mov      ah, bl
04f9: ebd7                   jmp      0x4d2
04fb: 8adc                   mov      bl, ah
04fd: 881eb900               mov      byte ptr [0xb9], bl
0501: 32ff                   xor      bh, bh
0503: 81c3bb00               add      bx, 0xbb
0507: 8026b700ff             and      byte ptr [0xb7], 0xff
050c: 7402                   je       0x510
050e: fec7                   inc      bh
0510: 8a07                   mov      al, byte ptr [bx]
0512: 8a1eb500               mov      bl, byte ptr [0xb5]
0516: 8a26b600               mov      ah, byte ptr [0xb6]
051a: c3                     ret      
051b: b402                   mov      ah, 2
051d: b90200                 mov      cx, 2
0520: eb06                   jmp      0x528
0522: 90                     nop      
0523: b40f                   mov      ah, 0xf
0525: b90a00                 mov      cx, 0xa
0528: b0b6                   mov      al, 0xb6
052a: e643                   out      0x43, al
052c: b000                   mov      al, 0
052e: e642                   out      0x42, al
0530: 8ac4                   mov      al, ah
0532: e642                   out      0x42, al
0534: 8a26bc02               mov      ah, byte ptr [0x2bc]
0538: d0ec                   shr      ah, 1
053a: 0a26bc02               or       ah, byte ptr [0x2bc]
053e: e461                   in       al, 0x61
0540: 0ac4                   or       al, ah
0542: e661                   out      0x61, al
0544: c606cd0800             mov      byte ptr [0x8cd], 0
0549: 8026cd08ff             and      byte ptr [0x8cd], 0xff
054e: 74f9                   je       0x549
0550: e2f2                   loop     0x544
0552: 24fe                   and      al, 0xfe
0554: e661                   out      0x61, al
0556: c3                     ret      
0557: c3                     ret      
0558: c3                     ret      
0559: 3c01                   cmp      al, 1
055b: 741d                   je       0x57a
055d: 3c02                   cmp      al, 2
055f: 741e                   je       0x57f
0561: 3c03                   cmp      al, 3
0563: 7428                   je       0x58d
0565: 3c10                   cmp      al, 0x10
0567: 741b                   je       0x584
0569: 3c20                   cmp      al, 0x20
056b: 741b                   je       0x588
056d: 3c81                   cmp      al, 0x81
056f: 7406                   je       0x577
0571: 3c15                   cmp      al, 0x15
0573: 7401                   je       0x576
0575: c3                     ret      
0576: c3                     ret      
0577: e91aff                 jmp      0x494
057a: a2bb02                 mov      byte ptr [0x2bb], al
057d: ebd9                   jmp      0x558
057f: a2bb02                 mov      byte ptr [0x2bb], al
0582: ebd4                   jmp      0x558
0584: 8ac3                   mov      al, bl
0586: ebcf                   jmp      0x557
0588: 881eba00               mov      byte ptr [0xba], bl
058c: c3                     ret      
058d: b002                   mov      al, 2
058f: a2bb02                 mov      byte ptr [0x2bb], al
0592: ebc4                   jmp      0x558
0594: 0000                   add      byte ptr [bx + si], al
0596: 0000                   add      byte ptr [bx + si], al
0598: 0000                   add      byte ptr [bx + si], al
059a: 0000                   add      byte ptr [bx + si], al
059c: 0000                   add      byte ptr [bx + si], al
059e: 0000                   add      byte ptr [bx + si], al
05a0: 50                     push     ax
05a1: 53                     push     bx
05a2: 1e                     push     ds
05a3: 51                     push     cx
05a4: b8d809                 mov      ax, 0x9d8
05a7: 8ed8                   mov      ds, ax
05a9: bb3008                 mov      bx, 0x830
05ac: b94000                 mov      cx, 0x40
05af: b87f7f                 mov      ax, 0x7f7f
05b2: 2107                   and      word ptr [bx], ax
05b4: 83c302                 add      bx, 2
05b7: e2f9                   loop     0x5b2
05b9: 59                     pop      cx
05ba: e460                   in       al, 0x60
05bc: 8ad8                   mov      bl, al
05be: e461                   in       al, 0x61
05c0: 0c80                   or       al, 0x80
05c2: e661                   out      0x61, al
05c4: 247f                   and      al, 0x7f
05c6: e661                   out      0x61, al
05c8: 8ac3                   mov      al, bl
05ca: 247f                   and      al, 0x7f
05cc: 80fb44                 cmp      bl, 0x44
05cf: 7426                   je       0x5f7
05d1: b0ff                   mov      al, 0xff
05d3: 22db                   and      bl, bl
05d5: 7905                   jns      0x5dc
05d7: 80e37f                 and      bl, 0x7f
05da: 32c0                   xor      al, al
05dc: 32ff                   xor      bh, bh
05de: 88873008               mov      byte ptr [bx + 0x830], al
05e2: a2b008                 mov      byte ptr [0x8b0], al
05e5: 22c0                   and      al, al
05e7: 7502                   jne      0x5eb
05e9: 8ad8                   mov      bl, al
05eb: 881eb108               mov      byte ptr [0x8b1], bl
05ef: 1f                     pop      ds
05f0: 5b                     pop      bx
05f1: b020                   mov      al, 0x20
05f3: e620                   out      0x20, al
05f5: 58                     pop      ax
05f6: cf                     iret     
05f7: fa                     cli      
05f8: e461                   in       al, 0x61
05fa: 24fc                   and      al, 0xfc
05fc: e661                   out      0x61, al
05fe: b034                   mov      al, 0x34
0600: e643                   out      0x43, al
0602: a10f00                 mov      ax, word ptr [0xf]
0605: e640                   out      0x40, al
0607: 8ac4                   mov      al, ah
0609: e640                   out      0x40, al
060b: b020                   mov      al, 0x20
060d: e620                   out      0x20, al
060f: b000                   mov      al, 0
0611: e621                   out      0x21, al
0613: b8d809                 mov      ax, 0x9d8
0616: 8ec0                   mov      es, ax
0618: 26a10200               mov      ax, word ptr es:[2]
061c: 8ed8                   mov      ds, ax
061e: 268b160000             mov      dx, word ptr es:[0]
0623: b80925                 mov      ax, 0x2509
0626: cd21                   int      0x21
0628: 26a10600               mov      ax, word ptr es:[6]
062c: 8ed8                   mov      ds, ax
062e: 268b160400             mov      dx, word ptr es:[4]
0633: b80825                 mov      ax, 0x2508
0636: cd21                   int      0x21
0638: b8d809                 mov      ax, 0x9d8
063b: 8ed8                   mov      ds, ax
063d: a10800                 mov      ax, word ptr [8]
0640: 32e4                   xor      ah, ah
0642: cd10                   int      0x10
0644: fb                     sti      
0645: b44c                   mov      ah, 0x4c
0647: cd21                   int      0x21
0649: c3                     ret      
064a: c606b00800             mov      byte ptr [0x8b0], 0
064f: b93200                 mov      cx, 0x32
0652: 8026b008ff             and      byte ptr [0x8b0], 0xff
0657: 74f9                   je       0x652
0659: c3                     ret      
065a: 50                     push     ax
065b: 53                     push     bx
065c: 51                     push     cx
065d: 52                     push     dx
065e: 56                     push     si
065f: 1e                     push     ds
0660: b8d809                 mov      ax, 0x9d8
0663: 8ed8                   mov      ds, ax
0665: b0ff                   mov      al, 0xff
0667: a2cd08                 mov      byte ptr [0x8cd], al
066a: a0fd5f                 mov      al, byte ptr [0x5ffd]
066d: 22c0                   and      al, al
066f: 7435                   je       0x6a6
0671: a1bb4a                 mov      ax, word ptr [0x4abb]
0674: 0306c24a               add      ax, word ptr [0x4ac2]
0678: 7914                   jns      0x68e
067a: a00460                 mov      al, byte ptr [0x6004]
067d: 22c0                   and      al, al
067f: 740d                   je       0x68e
0681: 33c0                   xor      ax, ax
0683: a2fd5f                 mov      byte ptr [0x5ffd], al
0686: e461                   in       al, 0x61
0688: 24fc                   and      al, 0xfc
068a: e661                   out      0x61, al
068c: 33c0                   xor      ax, ax
068e: a3bb4a                 mov      word ptr [0x4abb], ax
0691: d1e0                   shl      ax, 1
0693: 05d208                 add      ax, 0x8d2
0696: 8bd8                   mov      bx, ax
0698: 8b1f                   mov      bx, word ptr [bx]
069a: b0b6                   mov      al, 0xb6
069c: e643                   out      0x43, al
069e: 8ac3                   mov      al, bl
06a0: e642                   out      0x42, al
06a2: 8ac7                   mov      al, bh
06a4: e642                   out      0x42, al
06a6: a0ce08                 mov      al, byte ptr [0x8ce]
06a9: 22c0                   and      al, al
06ab: 741c                   je       0x6c9
06ad: fec8                   dec      al
06af: a2ce08                 mov      byte ptr [0x8ce], al
06b2: 7505                   jne      0x6b9
06b4: b003                   mov      al, 3
06b6: a2fd5f                 mov      byte ptr [0x5ffd], al
06b9: 8b1ed008               mov      bx, word ptr [0x8d0]
06bd: b0b6                   mov      al, 0xb6
06bf: e643                   out      0x43, al
06c1: 8ac3                   mov      al, bl
06c3: e642                   out      0x42, al
06c5: 8ac7                   mov      al, bh
06c7: e642                   out      0x42, al
06c9: a0cc08                 mov      al, byte ptr [0x8cc]
06cc: 22c0                   and      al, al
06ce: 750e                   jne      0x6de
06d0: fe06cb08               inc      byte ptr [0x8cb]
06d4: a0cb08                 mov      al, byte ptr [0x8cb]
06d7: 3c01                   cmp      al, 1
06d9: 7203                   jb       0x6de
06db: a2cc08                 mov      byte ptr [0x8cc], al
06de: ff26c508               jmp      word ptr [0x8c5]
06e2: 8bdb                   mov      bx, bx
06e4: c606b20800             mov      byte ptr [0x8b2], 0
06e9: 8b36b308               mov      si, word ptr [0x8b3]
06ed: b2ff                   mov      dl, 0xff
06ef: 2014                   and      byte ptr [si], dl
06f1: 7408                   je       0x6fb
06f3: 800eb20801             or       byte ptr [0x8b2], 1
06f8: eb0e                   jmp      0x708
06fa: 90                     nop      
06fb: 8b36b508               mov      si, word ptr [0x8b5]
06ff: 2014                   and      byte ptr [si], dl
0701: 7405                   je       0x708
0703: 800eb20802             or       byte ptr [0x8b2], 2
0708: 8b36b708               mov      si, word ptr [0x8b7]
070c: 2014                   and      byte ptr [si], dl
070e: 7408                   je       0x718
0710: 800eb20804             or       byte ptr [0x8b2], 4
0715: eb0e                   jmp      0x725
0717: 90                     nop      
0718: 8b36b908               mov      si, word ptr [0x8b9]
071c: 2014                   and      byte ptr [si], dl
071e: 7405                   je       0x725
0720: 800eb20808             or       byte ptr [0x8b2], 8
0725: 8b36bb08               mov      si, word ptr [0x8bb]
0729: 2014                   and      byte ptr [si], dl
072b: 7405                   je       0x732
072d: 800eb20810             or       byte ptr [0x8b2], 0x10
0732: 1f                     pop      ds
0733: 5e                     pop      si
0734: 5a                     pop      dx
0735: 59                     pop      cx
0736: 5b                     pop      bx
0737: b020                   mov      al, 0x20
0739: e620                   out      0x20, al
073b: 58                     pop      ax
073c: cf                     iret     
073d: c606b20800             mov      byte ptr [0x8b2], 0
0742: ba0102                 mov      dx, 0x201
0745: ee                     out      dx, al
0746: b403                   mov      ah, 3
0748: 33f6                   xor      si, si
074a: 8bde                   mov      bx, si
074c: ec                     in       al, dx
074d: 22c4                   and      al, ah
074f: 740c                   je       0x75d
0751: d0e8                   shr      al, 1
0753: 83d300                 adc      bx, 0
0756: d0e8                   shr      al, 1
0758: 83d600                 adc      si, 0
075b: ebef                   jmp      0x74c
075d: 3b36c108               cmp      si, word ptr [0x8c1]
0761: 7708                   ja       0x76b
0763: 800eb20801             or       byte ptr [0x8b2], 1
0768: eb0c                   jmp      0x776
076a: 90                     nop      
076b: 3b36c308               cmp      si, word ptr [0x8c3]
076f: 7205                   jb       0x776
0771: 800eb20802             or       byte ptr [0x8b2], 2
0776: 8bf3                   mov      si, bx
0778: 3b36bd08               cmp      si, word ptr [0x8bd]
077c: 7708                   ja       0x786
077e: 800eb20804             or       byte ptr [0x8b2], 4
0783: eb0c                   jmp      0x791
0785: 90                     nop      
0786: 3b36bf08               cmp      si, word ptr [0x8bf]
078a: 7205                   jb       0x791
078c: 800eb20808             or       byte ptr [0x8b2], 8
0791: ee                     out      dx, al
0792: ec                     in       al, dx
0793: 32e4                   xor      ah, ah
0795: a830                   test     al, 0x30
0797: 7402                   je       0x79b
0799: 7a0b                   jp       0x7a6
079b: f6d4                   not      ah
079d: 8826b008               mov      byte ptr [0x8b0], ah
07a1: 800eb20810             or       byte ptr [0x8b2], 0x10
07a6: 1f                     pop      ds
07a7: 5e                     pop      si
07a8: 5a                     pop      dx
07a9: 59                     pop      cx
07aa: 5b                     pop      bx
07ab: b020                   mov      al, 0x20
07ad: e620                   out      0x20, al
07af: 58                     pop      ax
07b0: cf                     iret     
07b1: fa                     cli      
07b2: c706b308ac08           mov      word ptr [0x8b3], 0x8ac
07b8: c706b508ab08           mov      word ptr [0x8b5], 0x8ab
07be: c706b708aa08           mov      word ptr [0x8b7], 0x8aa
07c4: c706b908a908           mov      word ptr [0x8b9], 0x8a9
07ca: c706bb08a708           mov      word ptr [0x8bb], 0x8a7
07d0: c706c508e406           mov      word ptr [0x8c5], 0x6e4
07d6: fb                     sti      
07d7: c3                     ret      
07d8: fa                     cli      
07d9: c706b3087808           mov      word ptr [0x8b3], 0x878
07df: c706b5088008           mov      word ptr [0x8b5], 0x880
07e5: c706b7087b08           mov      word ptr [0x8b7], 0x87b
07eb: c706b9087d08           mov      word ptr [0x8b9], 0x87d
07f1: c706bb086908           mov      word ptr [0x8bb], 0x869
07f7: c706c508e406           mov      word ptr [0x8c5], 0x6e4
07fd: fb                     sti      
07fe: c3                     ret      
07ff: 00c3                   add      bl, al
0801: a07654                 mov      al, byte ptr [0x5476]
0804: 22c0                   and      al, al
0806: 78f8                   js       0x800
0808: a1ee4a                 mov      ax, word ptr [0x4aee]
080b: 3d0a00                 cmp      ax, 0xa
080e: 72f0                   jb       0x800
0810: a0e14a                 mov      al, byte ptr [0x4ae1]
0813: 22c0                   and      al, al
0815: 750b                   jne      0x822
0817: a0274b                 mov      al, byte ptr [0x4b27]
081a: 22c0                   and      al, al
081c: 7904                   jns      0x822
081e: a2fd41                 mov      byte ptr [0x41fd], al
0821: c3                     ret      
0822: d02efd41               shr      byte ptr [0x41fd], 1
0826: 06                     push     es
0827: a10a00                 mov      ax, word ptr [0xa]
082a: 8ec0                   mov      es, ax
082c: c6061e4b00             mov      byte ptr [0x4b1e], 0
0831: c6061d4bff             mov      byte ptr [0x4b1d], 0xff
0836: bf0500                 mov      di, 5
0839: bb3c00                 mov      bx, 0x3c
083c: e82e05                 call     0xd6d
083f: bf0700                 mov      di, 7
0842: bb3e00                 mov      bx, 0x3e
0845: e82505                 call     0xd6d
0848: bf0800                 mov      di, 8
084b: b33d                   mov      bl, 0x3d
084d: e81d05                 call     0xd6d
0850: bf0a00                 mov      di, 0xa
0853: b33f                   mov      bl, 0x3f
0855: e81505                 call     0xd6d
0858: a11758                 mov      ax, word ptr [0x5817]
085b: 8bd0                   mov      dx, ax
085d: a1af58                 mov      ax, word ptr [0x58af]
0860: 86c6                   xchg     dh, al
0862: 2bd0                   sub      dx, ax
0864: 7905                   jns      0x86b
0866: c606e75480             mov      byte ptr [0x54e7], 0x80
086b: a11558                 mov      ax, word ptr [0x5815]
086e: 8bd0                   mov      dx, ax
0870: a1ad58                 mov      ax, word ptr [0x58ad]
0873: 86c6                   xchg     dh, al
0875: 2bd0                   sub      dx, ax
0877: 7905                   jns      0x87e
0879: c606e75480             mov      byte ptr [0x54e7], 0x80
087e: a0b854                 mov      al, byte ptr [0x54b8]
0881: 50                     push     ax
0882: bb3c00                 mov      bx, 0x3c
0885: e86702                 call     0xaef
0888: 7303                   jae      0x88d
088a: eb7b                   jmp      0x907
088c: 90                     nop      
088d: a1ec4a                 mov      ax, word ptr [0x4aec]
0890: 8bd0                   mov      dx, ax
0892: 2a067f4c               sub      al, byte ptr [0x4c7f]
0896: 1a26834c               sbb      ah, byte ptr [0x4c83]
089a: 7837                   js       0x8d3
089c: 8bc2                   mov      ax, dx
089e: 2a067e4c               sub      al, byte ptr [0x4c7e]
08a2: 1a26824c               sbb      ah, byte ptr [0x4c82]
08a6: 782b                   js       0x8d3
08a8: 8bc2                   mov      ax, dx
08aa: 2a067d4c               sub      al, byte ptr [0x4c7d]
08ae: 1a26814c               sbb      ah, byte ptr [0x4c81]
08b2: 781f                   js       0x8d3
08b4: a0e754                 mov      al, byte ptr [0x54e7]
08b7: 22c0                   and      al, al
08b9: 781d                   js       0x8d8
08bb: a07f4b                 mov      al, byte ptr [0x4b7f]
08be: 22c0                   and      al, al
08c0: 7416                   je       0x8d8
08c2: e87d00                 call     0x942
08c5: bb3d00                 mov      bx, 0x3d
08c8: e82402                 call     0xaef
08cb: 723a                   jb       0x907
08cd: e8fb08                 call     0x11cb
08d0: eb35                   jmp      0x907
08d2: 90                     nop      
08d3: c606294b80             mov      byte ptr [0x4b29], 0x80
08d8: c6060f5480             mov      byte ptr [0x540f], 0x80
08dd: e81c78                 call     0x80fc
08e0: e85f00                 call     0x942
08e3: bb3d00                 mov      bx, 0x3d
08e6: e80602                 call     0xaef
08e9: 7216                   jb       0x901
08eb: a0e754                 mov      al, byte ptr [0x54e7]
08ee: 22c0                   and      al, al
08f0: 7909                   jns      0x8fb
08f2: e8aa78                 call     0x819f
08f5: e8d178                 call     0x81c9
08f8: eb04                   jmp      0x8fe
08fa: 90                     nop      
08fb: e8b778                 call     0x81b5
08fe: e8ca08                 call     0x11cb
0901: e82d49                 call     0x5231
0904: e8df77                 call     0x80e6
0907: 58                     pop      ax
0908: 07                     pop      es
0909: 8ad8                   mov      bl, al
090b: e9c477                 jmp      0x80d2
090e: bb0300                 mov      bx, 3
0911: 8a87914b               mov      al, byte ptr [bx + 0x4b91]
0915: 22c0                   and      al, al
0917: 9c                     pushf    
0918: 7902                   jns      0x91c
091a: f6d8                   neg      al
091c: d0e8                   shr      al, 1
091e: 8887954b               mov      byte ptr [bx + 0x4b95], al
0922: d0e8                   shr      al, 1
0924: 8887994b               mov      byte ptr [bx + 0x4b99], al
0928: d0e8                   shr      al, 1
092a: 88879d4b               mov      byte ptr [bx + 0x4b9d], al
092e: 9d                     popf     
092f: 790c                   jns      0x93d
0931: f69f954b               neg      byte ptr [bx + 0x4b95]
0935: f69f994b               neg      byte ptr [bx + 0x4b99]
0939: f69f9d4b               neg      byte ptr [bx + 0x4b9d]
093d: fecb                   dec      bl
093f: 79d0                   jns      0x911
0941: c3                     ret      
0942: a0934b                 mov      al, byte ptr [0x4b93]
0945: 22c0                   and      al, al
0947: 7809                   js       0x952
0949: e8fe00                 call     0xa4a
094c: e80c00                 call     0x95b
094f: e9df00                 jmp      0xa31
0952: e8dc00                 call     0xa31
0955: e80300                 call     0x95b
0958: e9ef00                 jmp      0xa4a
095b: bb0400                 mov      bx, 4
095e: e87177                 call     0x80d2
0961: a0954b                 mov      al, byte ptr [0x4b95]
0964: 2a06964b               sub      al, byte ptr [0x4b96]
0968: a2d457                 mov      byte ptr [0x57d4], al
096b: a0974b                 mov      al, byte ptr [0x4b97]
096e: 2a06984b               sub      al, byte ptr [0x4b98]
0972: a22058                 mov      byte ptr [0x5820], al
0975: a0954b                 mov      al, byte ptr [0x4b95]
0978: f6d8                   neg      al
097a: 2a06964b               sub      al, byte ptr [0x4b96]
097e: a2d157                 mov      byte ptr [0x57d1], al
0981: a0974b                 mov      al, byte ptr [0x4b97]
0984: f6d8                   neg      al
0986: 2a06984b               sub      al, byte ptr [0x4b98]
098a: a21d58                 mov      byte ptr [0x581d], al
098d: a0924b                 mov      al, byte ptr [0x4b92]
0990: 0206994b               add      al, byte ptr [0x4b99]
0994: 02069d4b               add      al, byte ptr [0x4b9d]
0998: a2d357                 mov      byte ptr [0x57d3], al
099b: a0944b                 mov      al, byte ptr [0x4b94]
099e: 02069b4b               add      al, byte ptr [0x4b9b]
09a2: 02069f4b               add      al, byte ptr [0x4b9f]
09a6: a21f58                 mov      byte ptr [0x581f], al
09a9: a0924b                 mov      al, byte ptr [0x4b92]
09ac: 2a06994b               sub      al, byte ptr [0x4b99]
09b0: 2a069d4b               sub      al, byte ptr [0x4b9d]
09b4: a2d257                 mov      byte ptr [0x57d2], al
09b7: a0944b                 mov      al, byte ptr [0x4b94]
09ba: 2a069b4b               sub      al, byte ptr [0x4b9b]
09be: 2a069f4b               sub      al, byte ptr [0x4b9f]
09c2: a21e58                 mov      byte ptr [0x581e], al
09c5: bb0400                 mov      bx, 4
09c8: e81b00                 call     0x9e6
09cb: a1d157                 mov      ax, word ptr [0x57d1]
09ce: a3cd57                 mov      word ptr [0x57cd], ax
09d1: a11d58                 mov      ax, word ptr [0x581d]
09d4: a31958                 mov      word ptr [0x5819], ax
09d7: a1d357                 mov      ax, word ptr [0x57d3]
09da: a3cf57                 mov      word ptr [0x57cf], ax
09dd: a11f58                 mov      ax, word ptr [0x581f]
09e0: a31b58                 mov      word ptr [0x581b], ax
09e3: e9c600                 jmp      0xaac
09e6: b90400                 mov      cx, 4
09e9: a0a54b                 mov      al, byte ptr [0x4ba5]
09ec: 22c0                   and      al, al
09ee: 9c                     pushf    
09ef: 8a87cd57               mov      al, byte ptr [bx + 0x57cd]
09f3: 98                     cwde     
09f4: 9d                     popf     
09f5: 9c                     pushf    
09f6: 7902                   jns      0x9fa
09f8: d1e0                   shl      ax, 1
09fa: 0306a14b               add      ax, word ptr [0x4ba1]
09fe: 22e4                   and      ah, ah
0a00: 7408                   je       0xa0a
0a02: 7904                   jns      0xa08
0a04: 32c0                   xor      al, al
0a06: eb02                   jmp      0xa0a
0a08: b0ff                   mov      al, 0xff
0a0a: 8887cd57               mov      byte ptr [bx + 0x57cd], al
0a0e: 8a871958               mov      al, byte ptr [bx + 0x5819]
0a12: 98                     cwde     
0a13: 9d                     popf     
0a14: 7902                   jns      0xa18
0a16: d1e0                   shl      ax, 1
0a18: 0306a34b               add      ax, word ptr [0x4ba3]
0a1c: 22e4                   and      ah, ah
0a1e: 7408                   je       0xa28
0a20: 7904                   jns      0xa26
0a22: 32c0                   xor      al, al
0a24: eb02                   jmp      0xa28
0a26: b0ff                   mov      al, 0xff
0a28: 88871958               mov      byte ptr [bx + 0x5819], al
0a2c: fec3                   inc      bl
0a2e: e2b9                   loop     0x9e9
0a30: c3                     ret      
0a31: 32ff                   xor      bh, bh
0a33: a0a14b                 mov      al, byte ptr [0x4ba1]
0a36: 3c40                   cmp      al, 0x40
0a38: 72f6                   jb       0xa30
0a3a: a0914b                 mov      al, byte ptr [0x4b91]
0a3d: f6d8                   neg      al
0a3f: a28e4b                 mov      byte ptr [0x4b8e], al
0a42: a0934b                 mov      al, byte ptr [0x4b93]
0a45: f6d8                   neg      al
0a47: eb1b                   jmp      0xa64
0a49: 90                     nop      
0a4a: 32ff                   xor      bh, bh
0a4c: a0a14b                 mov      al, byte ptr [0x4ba1]
0a4f: 3cc0                   cmp      al, 0xc0
0a51: 73dd                   jae      0xa30
0a53: a0914b                 mov      al, byte ptr [0x4b91]
0a56: 2a06954b               sub      al, byte ptr [0x4b95]
0a5a: a28e4b                 mov      byte ptr [0x4b8e], al
0a5d: a0934b                 mov      al, byte ptr [0x4b93]
0a60: 2a06974b               sub      al, byte ptr [0x4b97]
0a64: a28f4b                 mov      byte ptr [0x4b8f], al
0a67: 8ae0                   mov      ah, al
0a69: a21a58                 mov      byte ptr [0x581a], al
0a6c: 0206974b               add      al, byte ptr [0x4b97]
0a70: a21b58                 mov      byte ptr [0x581b], al
0a73: a08e4b                 mov      al, byte ptr [0x4b8e]
0a76: 8ad0                   mov      dl, al
0a78: a2ce57                 mov      byte ptr [0x57ce], al
0a7b: 0206954b               add      al, byte ptr [0x4b95]
0a7f: a2cf57                 mov      byte ptr [0x57cf], al
0a82: 8ac2                   mov      al, dl
0a84: 2a06924b               sub      al, byte ptr [0x4b92]
0a88: a2cd57                 mov      byte ptr [0x57cd], al
0a8b: 0206954b               add      al, byte ptr [0x4b95]
0a8f: a2d057                 mov      byte ptr [0x57d0], al
0a92: 2a26944b               sub      ah, byte ptr [0x4b94]
0a96: 88261958               mov      byte ptr [0x5819], ah
0a9a: 0226974b               add      ah, byte ptr [0x4b97]
0a9e: 88261c58               mov      byte ptr [0x581c], ah
0aa2: 33db                   xor      bx, bx
0aa4: e82b76                 call     0x80d2
0aa7: 33db                   xor      bx, bx
0aa9: e83aff                 call     0x9e6
0aac: bb4000                 mov      bx, 0x40
0aaf: bf4300                 mov      di, 0x43
0ab2: e81b75                 call     0x7fd0
0ab5: a0934b                 mov      al, byte ptr [0x4b93]
0ab8: 22c0                   and      al, al
0aba: 7815                   js       0xad1
0abc: bb4300                 mov      bx, 0x43
0abf: bf4200                 mov      di, 0x42
0ac2: e83775                 call     0x7ffc
0ac5: bb4000                 mov      bx, 0x40
0ac8: bf4100                 mov      di, 0x41
0acb: e82e75                 call     0x7ffc
0ace: eb13                   jmp      0xae3
0ad0: 90                     nop      
0ad1: bb4000                 mov      bx, 0x40
0ad4: bf4100                 mov      di, 0x41
0ad7: e82275                 call     0x7ffc
0ada: bb4300                 mov      bx, 0x43
0add: bf4200                 mov      di, 0x42
0ae0: e81975                 call     0x7ffc
0ae3: bb4100                 mov      bx, 0x41
0ae6: bf4200                 mov      di, 0x42
0ae9: e8e474                 call     0x7fd0
0aec: 32ff                   xor      bh, bh
0aee: c3                     ret      
0aef: 8a87db57               mov      al, byte ptr [bx + 0x57db]
0af3: 8aa77358               mov      ah, byte ptr [bx + 0x5873]
0af7: 2a87d957               sub      al, byte ptr [bx + 0x57d9]
0afb: 1aa77158               sbb      ah, byte ptr [bx + 0x5871]
0aff: d1f8                   sar      ax, 1
0b01: a30e4b                 mov      word ptr [0x4b0e], ax
0b04: 8bd0                   mov      dx, ax
0b06: 32ed                   xor      ch, ch
0b08: 8a878f57               mov      al, byte ptr [bx + 0x578f]
0b0c: 8aa72758               mov      ah, byte ptr [bx + 0x5827]
0b10: 2a878d57               sub      al, byte ptr [bx + 0x578d]
0b14: 1aa72558               sbb      ah, byte ptr [bx + 0x5825]
0b18: d1f8                   sar      ax, 1
0b1a: a30c4b                 mov      word ptr [0x4b0c], ax
0b1d: 23c0                   and      ax, ax
0b1f: 7902                   jns      0xb23
0b21: f7d8                   neg      ax
0b23: 3d5b00                 cmp      ax, 0x5b
0b26: 7202                   jb       0xb2a
0b28: b05a                   mov      al, 0x5a
0b2a: a2944b                 mov      byte ptr [0x4b94], al
0b2d: 8bc2                   mov      ax, dx
0b2f: 22e4                   and      ah, ah
0b31: 7902                   jns      0xb35
0b33: f7d8                   neg      ax
0b35: 3d5b00                 cmp      ax, 0x5b
0b38: 7202                   jb       0xb3c
0b3a: b05a                   mov      al, 0x5a
0b3c: a2934b                 mov      byte ptr [0x4b93], al
0b3f: 3a06944b               cmp      al, byte ptr [0x4b94]
0b43: 7303                   jae      0xb48
0b45: a0944b                 mov      al, byte ptr [0x4b94]
0b48: 3c40                   cmp      al, 0x40
0b4a: 720a                   jb       0xb56
0b4c: d03e944b               sar      byte ptr [0x4b94], 1
0b50: d03e934b               sar      byte ptr [0x4b93], 1
0b54: fecd                   dec      ch
0b56: 882ea54b               mov      byte ptr [0x4ba5], ch
0b5a: a0944b                 mov      al, byte ptr [0x4b94]
0b5d: a2914b                 mov      byte ptr [0x4b91], al
0b60: a00d4b                 mov      al, byte ptr [0x4b0d]
0b63: 22c0                   and      al, al
0b65: 7906                   jns      0xb6d
0b67: f61e914b               neg      byte ptr [0x4b91]
0b6b: eb04                   jmp      0xb71
0b6d: f61e944b               neg      byte ptr [0x4b94]
0b71: a0934b                 mov      al, byte ptr [0x4b93]
0b74: d0e8                   shr      al, 1
0b76: d0e8                   shr      al, 1
0b78: a2924b                 mov      byte ptr [0x4b92], al
0b7b: a00f4b                 mov      al, byte ptr [0x4b0f]
0b7e: 22c0                   and      al, al
0b80: 7908                   jns      0xb8a
0b82: f61e924b               neg      byte ptr [0x4b92]
0b86: f61e934b               neg      byte ptr [0x4b93]
0b8a: 8a878d57               mov      al, byte ptr [bx + 0x578d]
0b8e: 8aa72558               mov      ah, byte ptr [bx + 0x5825]
0b92: 03060c4b               add      ax, word ptr [0x4b0c]
0b96: a3a14b                 mov      word ptr [0x4ba1], ax
0b99: 22e4                   and      ah, ah
0b9b: 7518                   jne      0xbb5
0b9d: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
0ba1: 8aa77158               mov      ah, byte ptr [bx + 0x5871]
0ba5: 03060e4b               add      ax, word ptr [0x4b0e]
0ba9: a3a34b                 mov      word ptr [0x4ba3], ax
0bac: 22e4                   and      ah, ah
0bae: 7505                   jne      0xbb5
0bb0: e85bfd                 call     0x90e
0bb3: f8                     clc      
0bb4: c3                     ret      
0bb5: f9                     stc      
0bb6: c3                     ret      
0bb7: 32ff                   xor      bh, bh
0bb9: b040                   mov      al, 0x40
0bbb: e8ef00                 call     0xcad
0bbe: a3524b                 mov      word ptr [0x4b52], ax
0bc1: 881e8254               mov      byte ptr [0x5482], bl
0bc5: e8c725                 call     0x318f
0bc8: e87f26                 call     0x324a
0bcb: a0254b                 mov      al, byte ptr [0x4b25]
0bce: 2a06cf4a               sub      al, byte ptr [0x4acf]
0bd2: a2f34a                 mov      byte ptr [0x4af3], al
0bd5: 8a1e534b               mov      bl, byte ptr [0x4b53]
0bd9: d0e3                   shl      bl, 1
0bdb: 32ff                   xor      bh, bh
0bdd: e85168                 call     0x7431
0be0: d0ec                   shr      ah, 1
0be2: d0ec                   shr      ah, 1
0be4: d0ec                   shr      ah, 1
0be6: d0ec                   shr      ah, 1
0be8: d0ec                   shr      ah, 1
0bea: a3fa4a                 mov      word ptr [0x4afa], ax
0bed: fec3                   inc      bl
0bef: e83f68                 call     0x7431
0bf2: a2fd4a                 mov      byte ptr [0x4afd], al
0bf5: fec3                   inc      bl
0bf7: e83768                 call     0x7431
0bfa: d0ec                   shr      ah, 1
0bfc: d0ec                   shr      ah, 1
0bfe: d0ec                   shr      ah, 1
0c00: d0ec                   shr      ah, 1
0c02: d0ec                   shr      ah, 1
0c04: a3fe4a                 mov      word ptr [0x4afe], ax
0c07: fec3                   inc      bl
0c09: e82568                 call     0x7431
0c0c: a2004b                 mov      byte ptr [0x4b00], al
0c0f: fec3                   inc      bl
0c11: 3a1e554b               cmp      bl, byte ptr [0x4b55]
0c15: 7213                   jb       0xc2a
0c17: e8406b                 call     0x775a
0c1a: e87225                 call     0x318f
0c1d: b302                   mov      bl, 2
0c1f: e8b700                 call     0xcd9
0c22: e8486b                 call     0x776d
0c25: e86725                 call     0x318f
0c28: eb03                   jmp      0xc2d
0c2a: e8ac00                 call     0xcd9
0c2d: a0534b                 mov      al, byte ptr [0x4b53]
0c30: e80107                 call     0x1334
0c33: bf0400                 mov      di, 4
0c36: 33db                   xor      bx, bx
0c38: e81701                 call     0xd52
0c3b: bf0600                 mov      di, 6
0c3e: bb0100                 mov      bx, 1
0c41: e80e01                 call     0xd52
0c44: d02e1754               shr      byte ptr [0x5417], 1
0c48: 33db                   xor      bx, bx
0c4a: bf0100                 mov      di, 1
0c4d: e86258                 call     0x64b2
0c50: d1e8                   shr      ax, 1
0c52: d0e8                   shr      al, 1
0c54: d0e8                   shr      al, 1
0c56: d0e8                   shr      al, 1
0c58: 98                     cwde     
0c59: 8bf8                   mov      di, ax
0c5b: 8a85f064               mov      al, byte ptr [di + 0x64f0]
0c5f: a25954                 mov      byte ptr [0x5459], al
0c62: a0524b                 mov      al, byte ptr [0x4b52]
0c65: a2044b                 mov      byte ptr [0x4b04], al
0c68: a0674b                 mov      al, byte ptr [0x4b67]
0c6b: 2a065954               sub      al, byte ptr [0x5459]
0c6f: a2104b                 mov      byte ptr [0x4b10], al
0c72: 33db                   xor      bx, bx
0c74: e87b00                 call     0xcf2
0c77: bf0500                 mov      di, 5
0c7a: bb0400                 mov      bx, 4
0c7d: a0104b                 mov      al, byte ptr [0x4b10]
0c80: e8dc00                 call     0xd5f
0c83: a0674b                 mov      al, byte ptr [0x4b67]
0c86: 02065954               add      al, byte ptr [0x5459]
0c8a: a2104b                 mov      byte ptr [0x4b10], al
0c8d: bb0100                 mov      bx, 1
0c90: e85f00                 call     0xcf2
0c93: bf0700                 mov      di, 7
0c96: bb0400                 mov      bx, 4
0c99: a0104b                 mov      al, byte ptr [0x4b10]
0c9c: e8c000                 call     0xd5f
0c9f: e88e04                 call     0x1130
0ca2: a0274b                 mov      al, byte ptr [0x4b27]
0ca5: 22c0                   and      al, al
0ca7: b0ff                   mov      al, 0xff
0ca9: 7902                   jns      0xcad
0cab: 32c0                   xor      al, al
0cad: 8ad8                   mov      bl, al
0caf: a1f95f                 mov      ax, word ptr [0x5ff9]
0cb2: 2bc3                   sub      ax, bx
0cb4: a2ca4a                 mov      byte ptr [0x4aca], al
0cb7: 8a1e8154               mov      bl, byte ptr [0x5481]
0cbb: 881ee04a               mov      byte ptr [0x4ae0], bl
0cbf: 790c                   jns      0xccd
0cc1: e8a96a                 call     0x776d
0cc4: e8c824                 call     0x318f
0cc7: 8a26774b               mov      ah, byte ptr [0x4b77]
0ccb: fecc                   dec      ah
0ccd: 88265a4b               mov      byte ptr [0x4b5a], ah
0cd1: 881e5d4b               mov      byte ptr [0x4b5d], bl
0cd5: a0ca4a                 mov      al, byte ptr [0x4aca]
0cd8: c3                     ret      
0cd9: e85567                 call     0x7431
0cdc: d0ec                   shr      ah, 1
0cde: d0ec                   shr      ah, 1
0ce0: d0ec                   shr      ah, 1
0ce2: d0ec                   shr      ah, 1
0ce4: d0ec                   shr      ah, 1
0ce6: a3024b                 mov      word ptr [0x4b02], ax
0ce9: fec3                   inc      bl
0ceb: e84367                 call     0x7431
0cee: a2014b                 mov      byte ptr [0x4b01], al
0cf1: c3                     ret      
0cf2: e88b6a                 call     0x7780
0cf5: d0ea                   shr      dl, 1
0cf7: d1d8                   rcr      ax, 1
0cf9: d0ea                   shr      dl, 1
0cfb: d1d8                   rcr      ax, 1
0cfd: d0ea                   shr      dl, 1
0cff: d1d8                   rcr      ax, 1
0d01: 88a7a14c               mov      byte ptr [bx + 0x4ca1], ah
0d05: 88879d4c               mov      byte ptr [bx + 0x4c9d], al
0d09: c3                     ret      
0d0a: 8a87db5e               mov      al, byte ptr [bx + 0x5edb]
0d0e: 2a87d95e               sub      al, byte ptr [bx + 0x5ed9]
0d12: 8aa7eb5e               mov      ah, byte ptr [bx + 0x5eeb]
0d16: 1aa7e95e               sbb      ah, byte ptr [bx + 0x5ee9]
0d1a: 9c                     pushf    
0d1b: 7902                   jns      0xd1f
0d1d: f7d8                   neg      ax
0d1f: d1e8                   shr      ax, 1
0d21: f6e6                   mul      dh
0d23: d1e0                   shl      ax, 1
0d25: 8ac4                   mov      al, ah
0d27: 8ae7                   mov      ah, bh
0d29: d0d4                   rcl      ah, 1
0d2b: 9d                     popf     
0d2c: 7902                   jns      0xd30
0d2e: f7d8                   neg      ax
0d30: 80261754ff             and      byte ptr [0x5417], 0xff
0d35: 790a                   jns      0xd41
0d37: 80c302                 add      bl, 2
0d3a: e80400                 call     0xd41
0d3d: 80eb02                 sub      bl, 2
0d40: c3                     ret      
0d41: 0287d95e               add      al, byte ptr [bx + 0x5ed9]
0d45: 8885d95e               mov      byte ptr [di + 0x5ed9], al
0d49: 12a7e95e               adc      ah, byte ptr [bx + 0x5ee9]
0d4d: 88a5e95e               mov      byte ptr [di + 0x5ee9], ah
0d51: c3                     ret      
0d52: a0524b                 mov      al, byte ptr [0x4b52]
0d55: 32ff                   xor      bh, bh
0d57: 02871954               add      al, byte ptr [bx + 0x5419]
0d5b: d01e1754               rcr      byte ptr [0x5417], 1
0d5f: 8af0                   mov      dh, al
0d61: e8a6ff                 call     0xd0a
0d64: 81cf2000               or       di, 0x20
0d68: 80cb20                 or       bl, 0x20
0d6b: eb9d                   jmp      0xd0a
0d6d: 8a85d95e               mov      al, byte ptr [di + 0x5ed9]
0d71: 8aa5e95e               mov      ah, byte ptr [di + 0x5ee9]
0d75: a30c4b                 mov      word ptr [0x4b0c], ax
0d78: 8a85f95e               mov      al, byte ptr [di + 0x5ef9]
0d7c: 8aa5095f               mov      ah, byte ptr [di + 0x5f09]
0d80: a30e4b                 mov      word ptr [0x4b0e], ax
0d83: e8da37                 call     0x4560
0d86: e86b39                 call     0x46f4
0d89: e94f3b                 jmp      0x48db
0d8c: 50                     push     ax
0d8d: 51                     push     cx
0d8e: 52                     push     dx
0d8f: 06                     push     es
0d90: 57                     push     di
0d91: 80264c08ff             and      byte ptr [0x84c], 0xff
0d96: 79f9                   jns      0xd91
0d98: 80264c087f             and      byte ptr [0x84c], 0x7f
0d9d: b800a0                 mov      ax, 0xa000
0da0: 8ec0                   mov      es, ax
0da2: bfd818                 mov      di, 0x18d8
0da5: bac403                 mov      dx, 0x3c4
0da8: b8020f                 mov      ax, 0xf02
0dab: ef                     out      dx, ax
0dac: b98002                 mov      cx, 0x280
0daf: 33c0                   xor      ax, ax
0db1: f3ab                   rep stosw word ptr es:[di], ax
0db3: 8cc0                   mov      ax, es
0db5: 80f402                 xor      ah, 2
0db8: 8ec0                   mov      es, ax
0dba: bfd818                 mov      di, 0x18d8
0dbd: b98002                 mov      cx, 0x280
0dc0: 33c0                   xor      ax, ax
0dc2: f3ab                   rep stosw word ptr es:[di], ax
0dc4: 5f                     pop      di
0dc5: 07                     pop      es
0dc6: 5a                     pop      dx
0dc7: 59                     pop      cx
0dc8: 58                     pop      ax
0dc9: c606bd0233             mov      byte ptr [0x2bd], 0x33
0dce: 32ff                   xor      bh, bh
0dd0: 8a1e8154               mov      bl, byte ptr [0x5481]
0dd4: 8a87c14b               mov      al, byte ptr [bx + 0x4bc1]
0dd8: a2fc41                 mov      byte ptr [0x41fc], al
0ddb: 50                     push     ax
0ddc: 53                     push     bx
0ddd: 51                     push     cx
0dde: 52                     push     dx
0ddf: 56                     push     si
0de0: 57                     push     di
0de1: 55                     push     bp
0de2: 1e                     push     ds
0de3: 06                     push     es
0de4: b01f                   mov      al, 0x1f
0de6: e817f5                 call     0x300
0de9: b000                   mov      al, 0
0deb: e812f5                 call     0x300
0dee: b014                   mov      al, 0x14
0df0: e80df5                 call     0x300
0df3: a0814c                 mov      al, byte ptr [0x4c81]
0df6: d0e8                   shr      al, 1
0df8: d0e8                   shr      al, 1
0dfa: d0e8                   shr      al, 1
0dfc: d0e8                   shr      al, 1
0dfe: 0430                   add      al, 0x30
0e00: 3c39                   cmp      al, 0x39
0e02: 7602                   jbe      0xe06
0e04: 0407                   add      al, 7
0e06: e8f7f4                 call     0x300
0e09: a0814c                 mov      al, byte ptr [0x4c81]
0e0c: 240f                   and      al, 0xf
0e0e: 0430                   add      al, 0x30
0e10: 3c39                   cmp      al, 0x39
0e12: 7602                   jbe      0xe16
0e14: 0407                   add      al, 7
0e16: e8e7f4                 call     0x300
0e19: 07                     pop      es
0e1a: 1f                     pop      ds
0e1b: 5d                     pop      bp
0e1c: 5f                     pop      di
0e1d: 5e                     pop      si
0e1e: 5a                     pop      dx
0e1f: 59                     pop      cx
0e20: 5b                     pop      bx
0e21: 58                     pop      ax
0e22: 50                     push     ax
0e23: 53                     push     bx
0e24: 51                     push     cx
0e25: 52                     push     dx
0e26: 56                     push     si
0e27: 57                     push     di
0e28: 55                     push     bp
0e29: 1e                     push     ds
0e2a: 06                     push     es
0e2b: b01f                   mov      al, 0x1f
0e2d: e8d0f4                 call     0x300
0e30: b002                   mov      al, 2
0e32: e8cbf4                 call     0x300
0e35: b014                   mov      al, 0x14
0e37: e8c6f4                 call     0x300
0e3a: a07d4c                 mov      al, byte ptr [0x4c7d]
0e3d: d0e8                   shr      al, 1
0e3f: d0e8                   shr      al, 1
0e41: d0e8                   shr      al, 1
0e43: d0e8                   shr      al, 1
0e45: 0430                   add      al, 0x30
0e47: 3c39                   cmp      al, 0x39
0e49: 7602                   jbe      0xe4d
0e4b: 0407                   add      al, 7
0e4d: e8b0f4                 call     0x300
0e50: a07d4c                 mov      al, byte ptr [0x4c7d]
0e53: 240f                   and      al, 0xf
0e55: 0430                   add      al, 0x30
0e57: 3c39                   cmp      al, 0x39
0e59: 7602                   jbe      0xe5d
0e5b: 0407                   add      al, 7
0e5d: e8a0f4                 call     0x300
0e60: 07                     pop      es
0e61: 1f                     pop      ds
0e62: 5d                     pop      bp
0e63: 5f                     pop      di
0e64: 5e                     pop      si
0e65: 5a                     pop      dx
0e66: 59                     pop      cx
0e67: 5b                     pop      bx
0e68: 58                     pop      ax
0e69: 50                     push     ax
0e6a: 53                     push     bx
0e6b: 51                     push     cx
0e6c: 52                     push     dx
0e6d: 56                     push     si
0e6e: 57                     push     di
0e6f: 55                     push     bp
0e70: 1e                     push     ds
0e71: 06                     push     es
0e72: b01f                   mov      al, 0x1f
0e74: e889f4                 call     0x300
0e77: b000                   mov      al, 0
0e79: e884f4                 call     0x300
0e7c: b015                   mov      al, 0x15
0e7e: e87ff4                 call     0x300
0e81: a0a14c                 mov      al, byte ptr [0x4ca1]
0e84: d0e8                   shr      al, 1
0e86: d0e8                   shr      al, 1
0e88: d0e8                   shr      al, 1
0e8a: d0e8                   shr      al, 1
0e8c: 0430                   add      al, 0x30
0e8e: 3c39                   cmp      al, 0x39
0e90: 7602                   jbe      0xe94
0e92: 0407                   add      al, 7
0e94: e869f4                 call     0x300
0e97: a0a14c                 mov      al, byte ptr [0x4ca1]
0e9a: 240f                   and      al, 0xf
0e9c: 0430                   add      al, 0x30
0e9e: 3c39                   cmp      al, 0x39
0ea0: 7602                   jbe      0xea4
0ea2: 0407                   add      al, 7
0ea4: e859f4                 call     0x300
0ea7: 07                     pop      es
0ea8: 1f                     pop      ds
0ea9: 5d                     pop      bp
0eaa: 5f                     pop      di
0eab: 5e                     pop      si
0eac: 5a                     pop      dx
0ead: 59                     pop      cx
0eae: 5b                     pop      bx
0eaf: 58                     pop      ax
0eb0: 50                     push     ax
0eb1: 53                     push     bx
0eb2: 51                     push     cx
0eb3: 52                     push     dx
0eb4: 56                     push     si
0eb5: 57                     push     di
0eb6: 55                     push     bp
0eb7: 1e                     push     ds
0eb8: 06                     push     es
0eb9: b01f                   mov      al, 0x1f
0ebb: e842f4                 call     0x300
0ebe: b002                   mov      al, 2
0ec0: e83df4                 call     0x300
0ec3: b015                   mov      al, 0x15
0ec5: e838f4                 call     0x300
0ec8: a09d4c                 mov      al, byte ptr [0x4c9d]
0ecb: d0e8                   shr      al, 1
0ecd: d0e8                   shr      al, 1
0ecf: d0e8                   shr      al, 1
0ed1: d0e8                   shr      al, 1
0ed3: 0430                   add      al, 0x30
0ed5: 3c39                   cmp      al, 0x39
0ed7: 7602                   jbe      0xedb
0ed9: 0407                   add      al, 7
0edb: e822f4                 call     0x300
0ede: a09d4c                 mov      al, byte ptr [0x4c9d]
0ee1: 240f                   and      al, 0xf
0ee3: 0430                   add      al, 0x30
0ee5: 3c39                   cmp      al, 0x39
0ee7: 7602                   jbe      0xeeb
0ee9: 0407                   add      al, 7
0eeb: e812f4                 call     0x300
0eee: 07                     pop      es
0eef: 1f                     pop      ds
0ef0: 5d                     pop      bp
0ef1: 5f                     pop      di
0ef2: 5e                     pop      si
0ef3: 5a                     pop      dx
0ef4: 59                     pop      cx
0ef5: 5b                     pop      bx
0ef6: 58                     pop      ax
0ef7: 50                     push     ax
0ef8: 53                     push     bx
0ef9: 51                     push     cx
0efa: 52                     push     dx
0efb: 56                     push     si
0efc: 57                     push     di
0efd: 55                     push     bp
0efe: 1e                     push     ds
0eff: 06                     push     es
0f00: b01f                   mov      al, 0x1f
0f02: e8fbf3                 call     0x300
0f05: b00c                   mov      al, 0xc
0f07: e8f6f3                 call     0x300
0f0a: b014                   mov      al, 0x14
0f0c: e8f1f3                 call     0x300
0f0f: a0834c                 mov      al, byte ptr [0x4c83]
0f12: d0e8                   shr      al, 1
0f14: d0e8                   shr      al, 1
0f16: d0e8                   shr      al, 1
0f18: d0e8                   shr      al, 1
0f1a: 0430                   add      al, 0x30
0f1c: 3c39                   cmp      al, 0x39
0f1e: 7602                   jbe      0xf22
0f20: 0407                   add      al, 7
0f22: e8dbf3                 call     0x300
0f25: a0834c                 mov      al, byte ptr [0x4c83]
0f28: 240f                   and      al, 0xf
0f2a: 0430                   add      al, 0x30
0f2c: 3c39                   cmp      al, 0x39
0f2e: 7602                   jbe      0xf32
0f30: 0407                   add      al, 7
0f32: e8cbf3                 call     0x300
0f35: 07                     pop      es
0f36: 1f                     pop      ds
0f37: 5d                     pop      bp
0f38: 5f                     pop      di
0f39: 5e                     pop      si
0f3a: 5a                     pop      dx
0f3b: 59                     pop      cx
0f3c: 5b                     pop      bx
0f3d: 58                     pop      ax
0f3e: 50                     push     ax
0f3f: 53                     push     bx
0f40: 51                     push     cx
0f41: 52                     push     dx
0f42: 56                     push     si
0f43: 57                     push     di
0f44: 55                     push     bp
0f45: 1e                     push     ds
0f46: 06                     push     es
0f47: b01f                   mov      al, 0x1f
0f49: e8b4f3                 call     0x300
0f4c: b00e                   mov      al, 0xe
0f4e: e8aff3                 call     0x300
0f51: b014                   mov      al, 0x14
0f53: e8aaf3                 call     0x300
0f56: a07f4c                 mov      al, byte ptr [0x4c7f]
0f59: d0e8                   shr      al, 1
0f5b: d0e8                   shr      al, 1
0f5d: d0e8                   shr      al, 1
0f5f: d0e8                   shr      al, 1
0f61: 0430                   add      al, 0x30
0f63: 3c39                   cmp      al, 0x39
0f65: 7602                   jbe      0xf69
0f67: 0407                   add      al, 7
0f69: e894f3                 call     0x300
0f6c: a07f4c                 mov      al, byte ptr [0x4c7f]
0f6f: 240f                   and      al, 0xf
0f71: 0430                   add      al, 0x30
0f73: 3c39                   cmp      al, 0x39
0f75: 7602                   jbe      0xf79
0f77: 0407                   add      al, 7
0f79: e884f3                 call     0x300
0f7c: 07                     pop      es
0f7d: 1f                     pop      ds
0f7e: 5d                     pop      bp
0f7f: 5f                     pop      di
0f80: 5e                     pop      si
0f81: 5a                     pop      dx
0f82: 59                     pop      cx
0f83: 5b                     pop      bx
0f84: 58                     pop      ax
0f85: 50                     push     ax
0f86: 53                     push     bx
0f87: 51                     push     cx
0f88: 52                     push     dx
0f89: 56                     push     si
0f8a: 57                     push     di
0f8b: 55                     push     bp
0f8c: 1e                     push     ds
0f8d: 06                     push     es
0f8e: b01f                   mov      al, 0x1f
0f90: e86df3                 call     0x300
0f93: b00c                   mov      al, 0xc
0f95: e868f3                 call     0x300
0f98: b015                   mov      al, 0x15
0f9a: e863f3                 call     0x300
0f9d: a0a34c                 mov      al, byte ptr [0x4ca3]
0fa0: d0e8                   shr      al, 1
0fa2: d0e8                   shr      al, 1
0fa4: d0e8                   shr      al, 1
0fa6: d0e8                   shr      al, 1
0fa8: 0430                   add      al, 0x30
0faa: 3c39                   cmp      al, 0x39
0fac: 7602                   jbe      0xfb0
0fae: 0407                   add      al, 7
0fb0: e84df3                 call     0x300
0fb3: a0a34c                 mov      al, byte ptr [0x4ca3]
0fb6: 240f                   and      al, 0xf
0fb8: 0430                   add      al, 0x30
0fba: 3c39                   cmp      al, 0x39
0fbc: 7602                   jbe      0xfc0
0fbe: 0407                   add      al, 7
0fc0: e83df3                 call     0x300
0fc3: 07                     pop      es
0fc4: 1f                     pop      ds
0fc5: 5d                     pop      bp
0fc6: 5f                     pop      di
0fc7: 5e                     pop      si
0fc8: 5a                     pop      dx
0fc9: 59                     pop      cx
0fca: 5b                     pop      bx
0fcb: 58                     pop      ax
0fcc: 50                     push     ax
0fcd: 53                     push     bx
0fce: 51                     push     cx
0fcf: 52                     push     dx
0fd0: 56                     push     si
0fd1: 57                     push     di
0fd2: 55                     push     bp
0fd3: 1e                     push     ds
0fd4: 06                     push     es
0fd5: b01f                   mov      al, 0x1f
0fd7: e826f3                 call     0x300
0fda: b00e                   mov      al, 0xe
0fdc: e821f3                 call     0x300
0fdf: b015                   mov      al, 0x15
0fe1: e81cf3                 call     0x300
0fe4: a09f4c                 mov      al, byte ptr [0x4c9f]
0fe7: d0e8                   shr      al, 1
0fe9: d0e8                   shr      al, 1
0feb: d0e8                   shr      al, 1
0fed: d0e8                   shr      al, 1
0fef: 0430                   add      al, 0x30
0ff1: 3c39                   cmp      al, 0x39
0ff3: 7602                   jbe      0xff7
0ff5: 0407                   add      al, 7
0ff7: e806f3                 call     0x300
0ffa: a09f4c                 mov      al, byte ptr [0x4c9f]
0ffd: 240f                   and      al, 0xf
0fff: 0430                   add      al, 0x30
1001: 3c39                   cmp      al, 0x39
1003: 7602                   jbe      0x1007
1005: 0407                   add      al, 7
1007: e8f6f2                 call     0x300
100a: 07                     pop      es
100b: 1f                     pop      ds
100c: 5d                     pop      bp
100d: 5f                     pop      di
100e: 5e                     pop      si
100f: 5a                     pop      dx
1010: 59                     pop      cx
1011: 5b                     pop      bx
1012: 58                     pop      ax
1013: 50                     push     ax
1014: 53                     push     bx
1015: 51                     push     cx
1016: 52                     push     dx
1017: 56                     push     si
1018: 57                     push     di
1019: 55                     push     bp
101a: 1e                     push     ds
101b: 06                     push     es
101c: b01f                   mov      al, 0x1f
101e: e8dff2                 call     0x300
1021: b000                   mov      al, 0
1023: e8daf2                 call     0x300
1026: b016                   mov      al, 0x16
1028: e8d5f2                 call     0x300
102b: a0914c                 mov      al, byte ptr [0x4c91]
102e: d0e8                   shr      al, 1
1030: d0e8                   shr      al, 1
1032: d0e8                   shr      al, 1
1034: d0e8                   shr      al, 1
1036: 0430                   add      al, 0x30
1038: 3c39                   cmp      al, 0x39
103a: 7602                   jbe      0x103e
103c: 0407                   add      al, 7
103e: e8bff2                 call     0x300
1041: a0914c                 mov      al, byte ptr [0x4c91]
1044: 240f                   and      al, 0xf
1046: 0430                   add      al, 0x30
1048: 3c39                   cmp      al, 0x39
104a: 7602                   jbe      0x104e
104c: 0407                   add      al, 7
104e: e8aff2                 call     0x300
1051: 07                     pop      es
1052: 1f                     pop      ds
1053: 5d                     pop      bp
1054: 5f                     pop      di
1055: 5e                     pop      si
1056: 5a                     pop      dx
1057: 59                     pop      cx
1058: 5b                     pop      bx
1059: 58                     pop      ax
105a: 50                     push     ax
105b: 53                     push     bx
105c: 51                     push     cx
105d: 52                     push     dx
105e: 56                     push     si
105f: 57                     push     di
1060: 55                     push     bp
1061: 1e                     push     ds
1062: 06                     push     es
1063: b01f                   mov      al, 0x1f
1065: e898f2                 call     0x300
1068: b002                   mov      al, 2
106a: e893f2                 call     0x300
106d: b016                   mov      al, 0x16
106f: e88ef2                 call     0x300
1072: a08d4c                 mov      al, byte ptr [0x4c8d]
1075: d0e8                   shr      al, 1
1077: d0e8                   shr      al, 1
1079: d0e8                   shr      al, 1
107b: d0e8                   shr      al, 1
107d: 0430                   add      al, 0x30
107f: 3c39                   cmp      al, 0x39
1081: 7602                   jbe      0x1085
1083: 0407                   add      al, 7
1085: e878f2                 call     0x300
1088: a08d4c                 mov      al, byte ptr [0x4c8d]
108b: 240f                   and      al, 0xf
108d: 0430                   add      al, 0x30
108f: 3c39                   cmp      al, 0x39
1091: 7602                   jbe      0x1095
1093: 0407                   add      al, 7
1095: e868f2                 call     0x300
1098: 07                     pop      es
1099: 1f                     pop      ds
109a: 5d                     pop      bp
109b: 5f                     pop      di
109c: 5e                     pop      si
109d: 5a                     pop      dx
109e: 59                     pop      cx
109f: 5b                     pop      bx
10a0: 58                     pop      ax
10a1: 50                     push     ax
10a2: 53                     push     bx
10a3: 51                     push     cx
10a4: 52                     push     dx
10a5: 56                     push     si
10a6: 57                     push     di
10a7: 55                     push     bp
10a8: 1e                     push     ds
10a9: 06                     push     es
10aa: b01f                   mov      al, 0x1f
10ac: e851f2                 call     0x300
10af: b006                   mov      al, 6
10b1: e84cf2                 call     0x300
10b4: b016                   mov      al, 0x16
10b6: e847f2                 call     0x300
10b9: a0994c                 mov      al, byte ptr [0x4c99]
10bc: d0e8                   shr      al, 1
10be: d0e8                   shr      al, 1
10c0: d0e8                   shr      al, 1
10c2: d0e8                   shr      al, 1
10c4: 0430                   add      al, 0x30
10c6: 3c39                   cmp      al, 0x39
10c8: 7602                   jbe      0x10cc
10ca: 0407                   add      al, 7
10cc: e831f2                 call     0x300
10cf: a0994c                 mov      al, byte ptr [0x4c99]
10d2: 240f                   and      al, 0xf
10d4: 0430                   add      al, 0x30
10d6: 3c39                   cmp      al, 0x39
10d8: 7602                   jbe      0x10dc
10da: 0407                   add      al, 7
10dc: e821f2                 call     0x300
10df: 07                     pop      es
10e0: 1f                     pop      ds
10e1: 5d                     pop      bp
10e2: 5f                     pop      di
10e3: 5e                     pop      si
10e4: 5a                     pop      dx
10e5: 59                     pop      cx
10e6: 5b                     pop      bx
10e7: 58                     pop      ax
10e8: 50                     push     ax
10e9: 53                     push     bx
10ea: 51                     push     cx
10eb: 52                     push     dx
10ec: 56                     push     si
10ed: 57                     push     di
10ee: 55                     push     bp
10ef: 1e                     push     ds
10f0: 06                     push     es
10f1: b01f                   mov      al, 0x1f
10f3: e80af2                 call     0x300
10f6: b008                   mov      al, 8
10f8: e805f2                 call     0x300
10fb: b016                   mov      al, 0x16
10fd: e800f2                 call     0x300
1100: a0954c                 mov      al, byte ptr [0x4c95]
1103: d0e8                   shr      al, 1
1105: d0e8                   shr      al, 1
1107: d0e8                   shr      al, 1
1109: d0e8                   shr      al, 1
110b: 0430                   add      al, 0x30
110d: 3c39                   cmp      al, 0x39
110f: 7602                   jbe      0x1113
1111: 0407                   add      al, 7
1113: e8eaf1                 call     0x300
1116: a0954c                 mov      al, byte ptr [0x4c95]
1119: 240f                   and      al, 0xf
111b: 0430                   add      al, 0x30
111d: 3c39                   cmp      al, 0x39
111f: 7602                   jbe      0x1123
1121: 0407                   add      al, 7
1123: e8daf1                 call     0x300
1126: 07                     pop      es
1127: 1f                     pop      ds
1128: 5d                     pop      bp
1129: 5f                     pop      di
112a: 5e                     pop      si
112b: 5a                     pop      dx
112c: 59                     pop      cx
112d: 5b                     pop      bx
112e: 58                     pop      ax
112f: c3                     ret      
1130: bb0100                 mov      bx, 1
1133: 33ff                   xor      di, di
1135: 8a85e05e               mov      al, byte ptr [di + 0x5ee0]
1139: 8aa5f05e               mov      ah, byte ptr [di + 0x5ef0]
113d: 2a85de5e               sub      al, byte ptr [di + 0x5ede]
1141: 1aa5ee5e               sbb      ah, byte ptr [di + 0x5eee]
1145: 8887144b               mov      byte ptr [bx + 0x4b14], al
1149: 88a7f54a               mov      byte ptr [bx + 0x4af5], ah
114d: d1f8                   sar      ax, 1
114f: 0087144b               add      byte ptr [bx + 0x4b14], al
1153: 10a7f54a               adc      byte ptr [bx + 0x4af5], ah
1157: bf2000                 mov      di, 0x20
115a: fecb                   dec      bl
115c: 79d7                   jns      0x1135
115e: b302                   mov      bl, 2
1160: 8bbff941               mov      di, word ptr [bx + 0x41f9]
1164: 81e7ff00               and      di, 0xff
1168: 8a87de5e               mov      al, byte ptr [bx + 0x5ede]
116c: 8aa7ee5e               mov      ah, byte ptr [bx + 0x5eee]
1170: 2a06144b               sub      al, byte ptr [0x4b14]
1174: 1a26f54a               sbb      ah, byte ptr [0x4af5]
1178: 8887e15e               mov      byte ptr [bx + 0x5ee1], al
117c: 88a7f15e               mov      byte ptr [bx + 0x5ef1], ah
1180: 8a87fe5e               mov      al, byte ptr [bx + 0x5efe]
1184: 8aa70e5f               mov      ah, byte ptr [bx + 0x5f0e]
1188: 0206154b               add      al, byte ptr [0x4b15]
118c: 1226f64a               adc      ah, byte ptr [0x4af6]
1190: 8887015f               mov      byte ptr [bx + 0x5f01], al
1194: 88a7115f               mov      byte ptr [bx + 0x5f11], ah
1198: 80eb02                 sub      bl, 2
119b: 79c3                   jns      0x1160
119d: a0524b                 mov      al, byte ptr [0x4b52]
11a0: 0480                   add      al, 0x80
11a2: a2044b                 mov      byte ptr [0x4b04], al
11a5: 7318                   jae      0x11bf
11a7: a1fe4a                 mov      ax, word ptr [0x4afe]
11aa: a3fa4a                 mov      word ptr [0x4afa], ax
11ad: a0004b                 mov      al, byte ptr [0x4b00]
11b0: a2fd4a                 mov      byte ptr [0x4afd], al
11b3: a1024b                 mov      ax, word ptr [0x4b02]
11b6: a3fe4a                 mov      word ptr [0x4afe], ax
11b9: a0014b                 mov      al, byte ptr [0x4b01]
11bc: a2004b                 mov      byte ptr [0x4b00], al
11bf: a0674b                 mov      al, byte ptr [0x4b67]
11c2: a2104b                 mov      byte ptr [0x4b10], al
11c5: bb0200                 mov      bx, 2
11c8: e927fb                 jmp      0xcf2
11cb: bb0400                 mov      bx, 4
11ce: e8016f                 call     0x80d2
11d1: a0954b                 mov      al, byte ptr [0x4b95]
11d4: a2d757                 mov      byte ptr [0x57d7], al
11d7: 2a06964b               sub      al, byte ptr [0x4b96]
11db: a2d857                 mov      byte ptr [0x57d8], al
11de: a0974b                 mov      al, byte ptr [0x4b97]
11e1: a22358                 mov      byte ptr [0x5823], al
11e4: 2a06984b               sub      al, byte ptr [0x4b98]
11e8: a22458                 mov      byte ptr [0x5824], al
11eb: a0954b                 mov      al, byte ptr [0x4b95]
11ee: f6d8                   neg      al
11f0: a2d657                 mov      byte ptr [0x57d6], al
11f3: 2a06964b               sub      al, byte ptr [0x4b96]
11f7: a2d557                 mov      byte ptr [0x57d5], al
11fa: a0974b                 mov      al, byte ptr [0x4b97]
11fd: f6d8                   neg      al
11ff: a22258                 mov      byte ptr [0x5822], al
1202: 2a06984b               sub      al, byte ptr [0x4b98]
1206: a22158                 mov      byte ptr [0x5821], al
1209: b308                   mov      bl, 8
120b: e8d8f7                 call     0x9e6
120e: a0d357                 mov      al, byte ptr [0x57d3]
1211: 3a06d757               cmp      al, byte ptr [0x57d7]
1215: 726e                   jb       0x1285
1217: a0d257                 mov      al, byte ptr [0x57d2]
121a: 3a06d657               cmp      al, byte ptr [0x57d6]
121e: 7328                   jae      0x1248
1220: a0e754                 mov      al, byte ptr [0x54e7]
1223: 22c0                   and      al, al
1225: 780f                   js       0x1236
1227: e8ad00                 call     0x12d7
122a: e89500                 call     0x12c2
122d: e8bc00                 call     0x12ec
1230: e8fef7                 call     0xa31
1233: e914f8                 jmp      0xa4a
1236: e8d700                 call     0x1310
1239: e8bc00                 call     0x12f8
123c: e8c500                 call     0x1304
123f: e8876f                 call     0x81c9
1242: e8ecf7                 call     0xa31
1245: e902f8                 jmp      0xa4a
1248: a0e754                 mov      al, byte ptr [0x54e7]
124b: 22c0                   and      al, al
124d: 781b                   js       0x126a
124f: e87000                 call     0x12c2
1252: a02358                 mov      al, byte ptr [0x5823]
1255: 3a061f58               cmp      al, byte ptr [0x581f]
1259: 7309                   jae      0x1264
125b: e8ca00                 call     0x1328
125e: e88b00                 call     0x12ec
1261: e8a000                 call     0x1304
1264: e8caf7                 call     0xa31
1267: e9e0f7                 jmp      0xa4a
126a: e8a300                 call     0x1310
126d: e89400                 call     0x1304
1270: e88500                 call     0x12f8
1273: e8536f                 call     0x81c9
1276: e8d1f7                 call     0xa4a
1279: e8b5f7                 call     0xa31
127c: bb0400                 mov      bx, 4
127f: e8506e                 call     0x80d2
1282: e99700                 jmp      0x131c
1285: a0e754                 mov      al, byte ptr [0x54e7]
1288: 22c0                   and      al, al
128a: 781b                   js       0x12a7
128c: e84800                 call     0x12d7
128f: a02258                 mov      al, byte ptr [0x5822]
1292: 3a061e58               cmp      al, byte ptr [0x581e]
1296: 7309                   jae      0x12a1
1298: e88100                 call     0x131c
129b: e84e00                 call     0x12ec
129e: e85700                 call     0x12f8
12a1: e8a6f7                 call     0xa4a
12a4: e98af7                 jmp      0xa31
12a7: e86600                 call     0x1310
12aa: e84b00                 call     0x12f8
12ad: e85400                 call     0x1304
12b0: e8166f                 call     0x81c9
12b3: e87bf7                 call     0xa31
12b6: e891f7                 call     0xa4a
12b9: bb0400                 mov      bx, 4
12bc: e8136e                 call     0x80d2
12bf: eb67                   jmp      0x1328
12c1: 90                     nop      
12c2: bb4400                 mov      bx, 0x44
12c5: bf4800                 mov      di, 0x48
12c8: e8316d                 call     0x7ffc
12cb: bb4500                 mov      bx, 0x45
12ce: bf4900                 mov      di, 0x49
12d1: e8286d                 call     0x7ffc
12d4: 32ff                   xor      bh, bh
12d6: c3                     ret      
12d7: bb4700                 mov      bx, 0x47
12da: bf4b00                 mov      di, 0x4b
12dd: e81c6d                 call     0x7ffc
12e0: bb4600                 mov      bx, 0x46
12e3: bf4a00                 mov      di, 0x4a
12e6: e8136d                 call     0x7ffc
12e9: 32ff                   xor      bh, bh
12eb: c3                     ret      
12ec: bb4900                 mov      bx, 0x49
12ef: bf4a00                 mov      di, 0x4a
12f2: e8076d                 call     0x7ffc
12f5: 32ff                   xor      bh, bh
12f7: c3                     ret      
12f8: bb4400                 mov      bx, 0x44
12fb: bf4800                 mov      di, 0x48
12fe: e8fb6c                 call     0x7ffc
1301: 32ff                   xor      bh, bh
1303: c3                     ret      
1304: bb4700                 mov      bx, 0x47
1307: bf4b00                 mov      di, 0x4b
130a: e8ef6c                 call     0x7ffc
130d: 32ff                   xor      bh, bh
130f: c3                     ret      
1310: bb4800                 mov      bx, 0x48
1313: bf4b00                 mov      di, 0x4b
1316: e8e36c                 call     0x7ffc
1319: 32ff                   xor      bh, bh
131b: c3                     ret      
131c: bb4500                 mov      bx, 0x45
131f: bf4900                 mov      di, 0x49
1322: e8d76c                 call     0x7ffc
1325: 32ff                   xor      bh, bh
1327: c3                     ret      
1328: bb4600                 mov      bx, 0x46
132b: bf4a00                 mov      di, 0x4a
132e: e8cb6c                 call     0x7ffc
1331: 32ff                   xor      bh, bh
1333: c3                     ret      
1334: 8ad8                   mov      bl, al
1336: 32ff                   xor      bh, bh
1338: 8b3e504b               mov      di, word ptr [0x4b50]
133c: 8a05                   mov      al, byte ptr [di]
133e: 0407                   add      al, 7
1340: a2564b                 mov      byte ptr [0x4b56], al
1343: 80265b4bff             and      byte ptr [0x4b5b], 0xff
1348: 7517                   jne      0x1361
134a: d0e3                   shl      bl, 1
134c: d0e3                   shl      bl, 1
134e: d0e3                   shl      bl, 1
1350: 02d8                   add      bl, al
1352: 8bfb                   mov      di, bx
1354: 33db                   xor      bx, bx
1356: e82700                 call     0x1380
1359: fec3                   inc      bl
135b: 80fb04                 cmp      bl, 4
135e: 75f6                   jne      0x1356
1360: c3                     ret      
1361: a0774b                 mov      al, byte ptr [0x4b77]
1364: 2ac3                   sub      al, bl
1366: fec8                   dec      al
1368: 8ad8                   mov      bl, al
136a: d0e3                   shl      bl, 1
136c: d0e3                   shl      bl, 1
136e: d0e3                   shl      bl, 1
1370: 021e564b               add      bl, byte ptr [0x4b56]
1374: 8bfb                   mov      di, bx
1376: b303                   mov      bl, 3
1378: e80500                 call     0x1380
137b: fecb                   dec      bl
137d: 79f9                   jns      0x1378
137f: c3                     ret      
1380: e85165                 call     0x78d4
1383: a10c4b                 mov      ax, word ptr [0x4b0c]
1386: 8887d95e               mov      byte ptr [bx + 0x5ed9], al
138a: 88a7e95e               mov      byte ptr [bx + 0x5ee9], ah
138e: a10e4b                 mov      ax, word ptr [0x4b0e]
1391: 8887f95e               mov      byte ptr [bx + 0x5ef9], al
1395: 88a7095f               mov      byte ptr [bx + 0x5f09], ah
1399: c3                     ret      
139a: e863ef                 call     0x300
139d: fec3                   inc      bl
139f: 32ff                   xor      bh, bh
13a1: a0a9dd                 mov      al, byte ptr [0xdda9]
13a4: 22c0                   and      al, al
13a6: 780e                   js       0x13b6
13a8: 8a87e040               mov      al, byte ptr [bx + 0x40e0]
13ac: 3cff                   cmp      al, 0xff
13ae: 75ea                   jne      0x139a
13b0: c3                     ret      
13b1: e84cef                 call     0x300
13b4: fec3                   inc      bl
13b6: 8a87b3dd               mov      al, byte ptr [bx - 0x224d]
13ba: 3cff                   cmp      al, 0xff
13bc: 75f3                   jne      0x13b1
13be: c3                     ret      
13bf: 803e8a5605             cmp      byte ptr [0x568a], 5
13c4: 7401                   je       0x13c7
13c6: c3                     ret      
13c7: a08054                 mov      al, byte ptr [0x5480]
13ca: 3c38                   cmp      al, 0x38
13cc: 7304                   jae      0x13d2
13ce: 3c33                   cmp      al, 0x33
13d0: 7317                   jae      0x13e9
13d2: a08154                 mov      al, byte ptr [0x5481]
13d5: 3c38                   cmp      al, 0x38
13d7: 731c                   jae      0x13f5
13d9: 3c33                   cmp      al, 0x33
13db: 730c                   jae      0x13e9
13dd: 8a26af54               mov      ah, byte ptr [0x54af]
13e1: 22e4                   and      ah, ah
13e3: 7410                   je       0x13f5
13e5: 3c30                   cmp      al, 0x30
13e7: 720c                   jb       0x13f5
13e9: b00c                   mov      al, 0xc
13eb: a2af54                 mov      byte ptr [0x54af], al
13ee: 02060c54               add      al, byte ptr [0x540c]
13f2: e98000                 jmp      0x1475
13f5: a0494b                 mov      al, byte ptr [0x4b49]
13f8: 22c0                   and      al, al
13fa: 7804                   js       0x1400
13fc: fe060c54               inc      byte ptr [0x540c]
1400: 33c0                   xor      ax, ax
1402: a3324b                 mov      word ptr [0x4b32], ax
1405: a2af54                 mov      byte ptr [0x54af], al
1408: a00c54                 mov      al, byte ptr [0x540c]
140b: 241f                   and      al, 0x1f
140d: 2c10                   sub      al, 0x10
140f: 7902                   jns      0x1413
1411: f6d0                   not      al
1413: 8bf8                   mov      di, ax
1415: 0404                   add      al, 4
1417: 8aa5e941               mov      ah, byte ptr [di + 0x41e9]
141b: 8826f44b               mov      byte ptr [0x4bf4], ah
141f: 8826f54b               mov      byte ptr [0x4bf5], ah
1423: 32e4                   xor      ah, ah
1425: d1e0                   shl      ax, 1
1427: d1e0                   shl      ax, 1
1429: d1e0                   shl      ax, 1
142b: d1e0                   shl      ax, 1
142d: d1e0                   shl      ax, 1
142f: a30c4b                 mov      word ptr [0x4b0c], ax
1432: bd0200                 mov      bp, 2
1435: 8b36deb1               mov      si, word ptr [0xb1de]
1439: bb0f00                 mov      bx, 0xf
143c: a10c4b                 mov      ax, word ptr [0x4b0c]
143f: 0106324b               add      word ptr [0x4b32], ax
1443: a1324b                 mov      ax, word ptr [0x4b32]
1446: 83fd20                 cmp      bp, 0x20
1449: 7503                   jne      0x144e
144b: 80cc80                 or       ah, 0x80
144e: 86e0                   xchg     al, ah
1450: 3e8902                 mov      word ptr ds:[bp + si], ax
1453: 83c502                 add      bp, 2
1456: 8bfd                   mov      di, bp
1458: bd4800                 mov      bp, 0x48
145b: 2bef                   sub      bp, di
145d: 3e8902                 mov      word ptr ds:[bp + si], ax
1460: 8bef                   mov      bp, di
1462: 83fd12                 cmp      bp, 0x12
1465: 74dc                   je       0x1443
1467: fecb                   dec      bl
1469: 75d1                   jne      0x143c
146b: 803e81542f             cmp      byte ptr [0x5481], 0x2f
1470: 751d                   jne      0x148f
1472: a00c54                 mov      al, byte ptr [0x540c]
1475: 241f                   and      al, 0x1f
1477: d0e8                   shr      al, 1
1479: 98                     cwde     
147a: 8bf8                   mov      di, ax
147c: 33db                   xor      bx, bx
147e: b0c6                   mov      al, 0xc6
1480: 0285d941               add      al, byte ptr [di + 0x41d9]
1484: 8887f14b               mov      byte ptr [bx + 0x4bf1], al
1488: fec3                   inc      bl
148a: 80fb03                 cmp      bl, 3
148d: 75f1                   jne      0x1480
148f: c3                     ret      
1490: 53                     push     bx
1491: e86cee                 call     0x300
1494: 5b                     pop      bx
1495: 43                     inc      bx
1496: 8a870042               mov      al, byte ptr [bx + 0x4200]
149a: 3cff                   cmp      al, 0xff
149c: 75f2                   jne      0x1490
149e: 32ff                   xor      bh, bh
14a0: c3                     ret      
14a1: c606704a41             mov      byte ptr [0x4a70], 0x41
14a6: c3                     ret      
14a7: a02556                 mov      al, byte ptr [0x5625]
14aa: a26c54                 mov      byte ptr [0x546c], al
14ad: e83504                 call     0x18e5
14b0: a0a9dd                 mov      al, byte ptr [0xdda9]
14b3: 22c0                   and      al, al
14b5: 75e9                   jne      0x14a0
14b7: a0aadd                 mov      al, byte ptr [0xddaa]
14ba: 22c0                   and      al, al
14bc: 752c                   jne      0x14ea
14be: b409                   mov      ah, 9
14c0: b0ee                   mov      al, 0xee
14c2: a2bd02                 mov      byte ptr [0x2bd], al
14c5: 80262756ff             and      byte ptr [0x5627], 0xff
14ca: 740c                   je       0x14d8
14cc: 88269d41               mov      byte ptr [0x419d], ah
14d0: b3bb                   mov      bl, 0xbb
14d2: e8cafe                 call     0x139f
14d5: eb0a                   jmp      0x14e1
14d7: 90                     nop      
14d8: 88260242               mov      byte ptr [0x4202], ah
14dc: 32db                   xor      bl, bl
14de: e8b5ff                 call     0x1496
14e1: b004                   mov      al, 4
14e3: 2a066c54               sub      al, byte ptr [0x546c]
14e7: e9e509                 jmp      0x1ecf
14ea: c606bd02ee             mov      byte ptr [0x2bd], 0xee
14ef: bba000                 mov      bx, 0xa0
14f2: e9c1fe                 jmp      0x13b6
14f5: b080                   mov      al, 0x80
14f7: eb03                   jmp      0x14fc
14f9: 90                     nop      
14fa: 32c0                   xor      al, al
14fc: a27e54                 mov      byte ptr [0x547e], al
14ff: e8a5ff                 call     0x14a7
1502: c606bd02ff             mov      byte ptr [0x2bd], 0xff
1507: a06c54                 mov      al, byte ptr [0x546c]
150a: d0e0                   shl      al, 1
150c: 8a26aadd               mov      ah, byte ptr [0xddaa]
1510: 22e4                   and      ah, ah
1512: 8a268c56               mov      ah, byte ptr [0x568c]
1516: 7407                   je       0x151f
1518: 8a26abdd               mov      ah, byte ptr [0xddab]
151c: 80f401                 xor      ah, 1
151f: 80e401                 and      ah, 1
1522: 02c4                   add      al, ah
1524: e82d14                 call     0x2954
1527: a00853                 mov      al, byte ptr [0x5308]
152a: 2401                   and      al, 1
152c: 7503                   jne      0x1531
152e: e96d82                 jmp      0xffff979e
1531: c606bd02ee             mov      byte ptr [0x2bd], 0xee
1536: b40b                   mov      ah, 0xb
1538: e8f479                 call     0x8f2f
153b: e8e07b                 call     0x911e
153e: e9e400                 jmp      0x1625
1541: e863ff                 call     0x14a7
1544: e83d01                 call     0x1684
1547: e9db00                 jmp      0x1625
154a: e8e90e                 call     0x2436
154d: a00a4b                 mov      al, byte ptr [0x4b0a]
1550: a27d4b                 mov      byte ptr [0x4b7d], al
1553: a0aadd                 mov      al, byte ptr [0xddaa]
1556: 22c0                   and      al, al
1558: 7406                   je       0x1560
155a: e8c578                 call     0x8e22
155d: e9c500                 jmp      0x1625
1560: e844ff                 call     0x14a7
1563: e9d182                 jmp      0xffff9837
1566: 8a1e7d4b               mov      bl, byte ptr [0x4b7d]
156a: 32ff                   xor      bh, bh
156c: 8a9f6556               mov      bl, byte ptr [bx + 0x5665]
1570: 881e7c4b               mov      byte ptr [0x4b7c], bl
1574: e8e702                 call     0x185e
1577: b020                   mov      al, 0x20
1579: e884ed                 call     0x300
157c: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
1580: 32ff                   xor      bh, bh
1582: a00753                 mov      al, byte ptr [0x5307]
1585: 22c0                   and      al, al
1587: 790e                   jns      0x1597
1589: e8d979                 call     0x8f65
158c: e8fd7a                 call     0x908c
158f: 80c30c                 add      bl, 0xc
1592: e8d079                 call     0x8f65
1595: eb1f                   jmp      0x15b6
1597: 8a874d56               mov      al, byte ptr [bx + 0x564d]
159b: e8167a                 call     0x8fb4
159e: 8a873556               mov      al, byte ptr [bx + 0x5635]
15a2: e8047a                 call     0x8fa9
15a5: 8a874156               mov      al, byte ptr [bx + 0x5641]
15a9: e8fd79                 call     0x8fa9
15ac: e8d87a                 call     0x9087
15af: 8a875956               mov      al, byte ptr [bx + 0x5659]
15b3: e8fe79                 call     0x8fb4
15b6: fe067d4b               inc      byte ptr [0x4b7d]
15ba: a07d4b                 mov      al, byte ptr [0x4b7d]
15bd: 3a06404b               cmp      al, byte ptr [0x4b40]
15c1: c3                     ret      
15c2: c606cb4a10             mov      byte ptr [0x4acb], 0x10
15c7: e88700                 call     0x1651
15ca: bf3e01                 mov      di, 0x13e
15cd: e80602                 call     0x17d6
15d0: bf6e01                 mov      di, 0x16e
15d3: e80002                 call     0x17d6
15d6: c606bd02ff             mov      byte ptr [0x2bd], 0xff
15db: b360                   mov      bl, 0x60
15dd: e8b6fe                 call     0x1496
15e0: c606bd0200             mov      byte ptr [0x2bd], 0
15e5: b01f                   mov      al, 0x1f
15e7: e816ed                 call     0x300
15ea: b005                   mov      al, 5
15ec: e811ed                 call     0x300
15ef: b014                   mov      al, 0x14
15f1: e80ced                 call     0x300
15f4: b36a                   mov      bl, 0x6a
15f6: e89dfe                 call     0x1496
15f9: 8a1e7c56               mov      bl, byte ptr [0x567c]
15fd: e85e02                 call     0x185e
1600: b3e9                   mov      bl, 0xe9
1602: e891fe                 call     0x1496
1605: b01f                   mov      al, 0x1f
1607: e8f6ec                 call     0x300
160a: b005                   mov      al, 5
160c: e8f1ec                 call     0x300
160f: b017                   mov      al, 0x17
1611: e8ecec                 call     0x300
1614: b378                   mov      bl, 0x78
1616: e87dfe                 call     0x1496
1619: 8a1e7d56               mov      bl, byte ptr [0x567d]
161d: e83e02                 call     0x185e
1620: b3ef                   mov      bl, 0xef
1622: e871fe                 call     0x1496
1625: e80700                 call     0x162f
1628: 32db                   xor      bl, bl
162a: b020                   mov      al, 0x20
162c: e92aef                 jmp      0x559
162f: e8ea25                 call     0x3c1c
1632: 2410                   and      al, 0x10
1634: 75f9                   jne      0x162f
1636: bf0500                 mov      di, 5
1639: e86716                 call     0x2ca3
163c: e8dd25                 call     0x3c1c
163f: 2410                   and      al, 0x10
1641: 74f9                   je       0x163c
1643: c3                     ret      
1644: e903ff                 jmp      0x154a
1647: a0aadd                 mov      al, byte ptr [0xddaa]
164a: 22c0                   and      al, al
164c: 75f6                   jne      0x1644
164e: e97f7f                 jmp      0x95d0
1651: e8090e                 call     0x245d
1654: bffe00                 mov      di, 0xfe
1657: c606bd0200             mov      byte ptr [0x2bd], 0
165c: e87701                 call     0x17d6
165f: b01f                   mov      al, 0x1f
1661: e89cec                 call     0x300
1664: b005                   mov      al, 5
1666: e897ec                 call     0x300
1669: a0cb4a                 mov      al, byte ptr [0x4acb]
166c: e891ec                 call     0x300
166f: 8a1e7e56               mov      bl, byte ptr [0x567e]
1673: e8e801                 call     0x185e
1676: b328                   mov      bl, 0x28
1678: e81bfe                 call     0x1496
167b: 8a1e7f56               mov      bl, byte ptr [0x567f]
167f: e8dc01                 call     0x185e
1682: eba4                   jmp      0x1628
1684: b080                   mov      al, 0x80
1686: a23bdf                 mov      byte ptr [0xdf3b], al
1689: bb0b00                 mov      bx, 0xb
168c: 8a876556               mov      al, byte ptr [bx + 0x5665]
1690: 88871956               mov      byte ptr [bx + 0x5619], al
1694: fecb                   dec      bl
1696: 79f4                   jns      0x168c
1698: e89b0d                 call     0x2436
169b: b30f                   mov      bl, 0xf
169d: b40c                   mov      ah, 0xc
169f: e8a713                 call     0x2a49
16a2: b3d7                   mov      bl, 0xd7
16a4: e8effd                 call     0x1496
16a7: c606bd0200             mov      byte ptr [0x2bd], 0
16ac: 8a260a4b               mov      ah, byte ptr [0x4b0a]
16b0: 22e4                   and      ah, ah
16b2: 752d                   jne      0x16e1
16b4: a06556                 mov      al, byte ptr [0x5665]
16b7: 3a06addd               cmp      al, byte ptr [0xddad]
16bb: 7573                   jne      0x1730
16bd: a02756                 mov      al, byte ptr [0x5627]
16c0: 22c0                   and      al, al
16c2: 741d                   je       0x16e1
16c4: bfee00                 mov      di, 0xee
16c7: e80c01                 call     0x17d6
16ca: b01f                   mov      al, 0x1f
16cc: e831ec                 call     0x300
16cf: b005                   mov      al, 5
16d1: e82cec                 call     0x300
16d4: b00f                   mov      al, 0xf
16d6: e827ec                 call     0x300
16d9: b3ce                   mov      bl, 0xce
16db: e8c1fc                 call     0x139f
16de: e98400                 jmp      0x1765
16e1: bfee00                 mov      di, 0xee
16e4: e8ef00                 call     0x17d6
16e7: b40f                   mov      ah, 0xf
16e9: b305                   mov      bl, 5
16eb: e85b13                 call     0x2a49
16ee: b3b7                   mov      bl, 0xb7
16f0: e8a3fd                 call     0x1496
16f3: a00a4b                 mov      al, byte ptr [0x4b0a]
16f6: 32e4                   xor      ah, ah
16f8: 8bf0                   mov      si, ax
16fa: 8a9c6556               mov      bl, byte ptr [si + 0x5665]
16fe: 3a1eaddd               cmp      bl, byte ptr [0xddad]
1702: 7504                   jne      0x1708
1704: 881e3bdf               mov      byte ptr [0xdf3b], bl
1708: e85301                 call     0x185e
170b: 8a260a4b               mov      ah, byte ptr [0x4b0a]
170f: 22e4                   and      ah, ah
1711: 751d                   jne      0x1730
1713: bf1e01                 mov      di, 0x11e
1716: e8bd00                 call     0x17d6
1719: b01f                   mov      al, 0x1f
171b: e8e2eb                 call     0x300
171e: b005                   mov      al, 5
1720: e8ddeb                 call     0x300
1723: b012                   mov      al, 0x12
1725: e8d8eb                 call     0x300
1728: b3a7                   mov      bl, 0xa7
172a: e872fc                 call     0x139f
172d: eb36                   jmp      0x1765
172f: 90                     nop      
1730: 8a26404b               mov      ah, byte ptr [0x4b40]
1734: fecc                   dec      ah
1736: 80fc0b                 cmp      ah, 0xb
1739: 742a                   je       0x1765
173b: bf1e01                 mov      di, 0x11e
173e: e89500                 call     0x17d6
1741: b01f                   mov      al, 0x1f
1743: e8baeb                 call     0x300
1746: b005                   mov      al, 5
1748: e8b5eb                 call     0x300
174b: b012                   mov      al, 0x12
174d: e8b0eb                 call     0x300
1750: b3c7                   mov      bl, 0xc7
1752: e841fd                 call     0x1496
1755: a0404b                 mov      al, byte ptr [0x4b40]
1758: fec8                   dec      al
175a: 32e4                   xor      ah, ah
175c: 8bf0                   mov      si, ax
175e: 8a9c6556               mov      bl, byte ptr [si + 0x5665]
1762: e8f900                 call     0x185e
1765: b002                   mov      al, 2
1767: a26c54                 mov      byte ptr [0x546c], al
176a: e8c90c                 call     0x2436
176d: a00a4b                 mov      al, byte ptr [0x4b0a]
1770: 32e4                   xor      ah, ah
1772: 8bf8                   mov      di, ax
1774: 8b851856               mov      ax, word ptr [di + 0x5618]
1778: 86e0                   xchg     al, ah
177a: 89851856               mov      word ptr [di + 0x5618], ax
177e: fe0e6c54               dec      byte ptr [0x546c]
1782: 79e6                   jns      0x176a
1784: a0addd                 mov      al, byte ptr [0xddad]
1787: 3a066556               cmp      al, byte ptr [0x5665]
178b: 751a                   jne      0x17a7
178d: 8a1e2756               mov      bl, byte ptr [0x5627]
1791: 22db                   and      bl, bl
1793: 7521                   jne      0x17b6
1795: a22756                 mov      byte ptr [0x5627], al
1798: bb0b00                 mov      bx, 0xb
179b: 889f1956               mov      byte ptr [bx + 0x5619], bl
179f: fecb                   dec      bl
17a1: 79f8                   jns      0x179b
17a3: 32c0                   xor      al, al
17a5: eb09                   jmp      0x17b0
17a7: e81600                 call     0x17c0
17aa: 8a871b43               mov      al, byte ptr [bx + 0x431b]
17ae: 22c0                   and      al, al
17b0: a22556                 mov      byte ptr [0x5625], al
17b3: 7401                   je       0x17b6
17b5: c3                     ret      
17b6: b006                   mov      al, 6
17b8: d0e0                   shl      al, 1
17ba: 2c02                   sub      al, 2
17bc: a22656                 mov      byte ptr [0x5626], al
17bf: c3                     ret      
17c0: b30b                   mov      bl, 0xb
17c2: 3a871956               cmp      al, byte ptr [bx + 0x5619]
17c6: 7404                   je       0x17cc
17c8: fecb                   dec      bl
17ca: 79f6                   jns      0x17c2
17cc: c3                     ret      
17cd: bd1800                 mov      bp, 0x18
17d0: be0707                 mov      si, 0x707
17d3: eb07                   jmp      0x17dc
17d5: 90                     nop      
17d6: be0707                 mov      si, 0x707
17d9: bd0f00                 mov      bp, 0xf
17dc: 803e704a41             cmp      byte ptr [0x4a70], 0x41
17e1: 7503                   jne      0x17e6
17e3: 83ef10                 sub      di, 0x10
17e6: a10a00                 mov      ax, word ptr [0xa]
17e9: 8ec0                   mov      es, ax
17eb: bace03                 mov      dx, 0x3ce
17ee: b80502                 mov      ax, 0x205
17f1: ef                     out      dx, ax
17f2: 8bbd7048               mov      di, word ptr [di + 0x4870]
17f6: 83c704                 add      di, 4
17f9: b80f0f                 mov      ax, 0xf0f
17fc: b90e00                 mov      cx, 0xe
17ff: f3ab                   rep stosw word ptr es:[di], ax
1801: 83c70c                 add      di, 0xc
1804: 8bdd                   mov      bx, bp
1806: b90d00                 mov      cx, 0xd
1809: b80880                 mov      ax, 0x8008
180c: ef                     out      dx, ax
180d: 268a05                 mov      al, byte ptr es:[di]
1810: b00f                   mov      al, 0xf
1812: 268805                 mov      byte ptr es:[di], al
1815: b8087f                 mov      ax, 0x7f08
1818: ef                     out      dx, ax
1819: 268a05                 mov      al, byte ptr es:[di]
181c: 8bc6                   mov      ax, si
181e: aa                     stosb    byte ptr es:[di], al
181f: b808ff                 mov      ax, 0xff08
1822: ef                     out      dx, ax
1823: 8bc6                   mov      ax, si
1825: f3ab                   rep stosw word ptr es:[di], ax
1827: b80801                 mov      ax, 0x108
182a: ef                     out      dx, ax
182b: 268a05                 mov      al, byte ptr es:[di]
182e: 32c0                   xor      al, al
1830: 268805                 mov      byte ptr es:[di], al
1833: b808fe                 mov      ax, 0xfe08
1836: ef                     out      dx, ax
1837: 268a05                 mov      al, byte ptr es:[di]
183a: 8bc6                   mov      ax, si
183c: aa                     stosb    byte ptr es:[di], al
183d: b808ff                 mov      ax, 0xff08
1840: ef                     out      dx, ax
1841: 83c70c                 add      di, 0xc
1844: fecb                   dec      bl
1846: 75be                   jne      0x1806
1848: b90e00                 mov      cx, 0xe
184b: 33c0                   xor      ax, ax
184d: f3ab                   rep stosw word ptr es:[di], ax
184f: b80500                 mov      ax, 5
1852: ef                     out      dx, ax
1853: 8cd8                   mov      ax, ds
1855: 8ec0                   mov      es, ax
1857: b380                   mov      bl, 0x80
1859: b020                   mov      al, 0x20
185b: e9fbec                 jmp      0x559
185e: bed06e                 mov      si, 0x6ed0
1861: b90d00                 mov      cx, 0xd
1864: eb0a                   jmp      0x1870
1866: 90                     nop      
1867: a2bd02                 mov      byte ptr [0x2bd], al
186a: bed06f                 mov      si, 0x6fd0
186d: b90f00                 mov      cx, 0xf
1870: 8ac3                   mov      al, bl
1872: 32e4                   xor      ah, ah
1874: d1e0                   shl      ax, 1
1876: d1e0                   shl      ax, 1
1878: d1e0                   shl      ax, 1
187a: d1e0                   shl      ax, 1
187c: 03f0                   add      si, ax
187e: 8a04                   mov      al, byte ptr [si]
1880: 46                     inc      si
1881: 51                     push     cx
1882: 56                     push     si
1883: e87aea                 call     0x300
1886: 5e                     pop      si
1887: 59                     pop      cx
1888: e2f4                   loop     0x187e
188a: c3                     ret      
188b: bac403                 mov      dx, 0x3c4
188e: b8020f                 mov      ax, 0xf02
1891: ef                     out      dx, ax
1892: bace03                 mov      dx, 0x3ce
1895: b80502                 mov      ax, 0x205
1898: ef                     out      dx, ax
1899: b003                   mov      al, 3
189b: 8b1e0a00               mov      bx, word ptr [0xa]
189f: 8ec3                   mov      es, bx
18a1: f3aa                   rep stosb byte ptr es:[di], al
18a3: b80500                 mov      ax, 5
18a6: ef                     out      dx, ax
18a7: 32ff                   xor      bh, bh
18a9: 8cd8                   mov      ax, ds
18ab: 8ec0                   mov      es, ax
18ad: c3                     ret      
18ae: 8b160a00               mov      dx, word ptr [0xa]
18b2: 8ec2                   mov      es, dx
18b4: 8bf0                   mov      si, ax
18b6: bac403                 mov      dx, 0x3c4
18b9: b8020f                 mov      ax, 0xf02
18bc: ef                     out      dx, ax
18bd: 8bc6                   mov      ax, si
18bf: bace03                 mov      dx, 0x3ce
18c2: 8ae0                   mov      ah, al
18c4: b008                   mov      al, 8
18c6: ef                     out      dx, ax
18c7: b80502                 mov      ax, 0x205
18ca: ef                     out      dx, ax
18cb: b003                   mov      al, 3
18cd: 268a25                 mov      ah, byte ptr es:[di]
18d0: 268805                 mov      byte ptr es:[di], al
18d3: 83ef28                 sub      di, 0x28
18d6: e2f5                   loop     0x18cd
18d8: b80500                 mov      ax, 5
18db: ef                     out      dx, ax
18dc: b808ff                 mov      ax, 0xff08
18df: ef                     out      dx, ax
18e0: 8cd8                   mov      ax, ds
18e2: 8ec0                   mov      es, ax
18e4: c3                     ret      
18e5: a10a00                 mov      ax, word ptr [0xa]
18e8: 8ec0                   mov      es, ax
18ea: b80502                 mov      ax, 0x205
18ed: bace03                 mov      dx, 0x3ce
18f0: ef                     out      dx, ax
18f1: bf040a                 mov      di, 0xa04
18f4: b80808                 mov      ax, 0x808
18f7: bb0e00                 mov      bx, 0xe
18fa: ba0c00                 mov      dx, 0xc
18fd: 8bcb                   mov      cx, bx
18ff: f3ab                   rep stosw word ptr es:[di], ax
1901: 03fa                   add      di, dx
1903: 8bcb                   mov      cx, bx
1905: f3ab                   rep stosw word ptr es:[di], ax
1907: 03fa                   add      di, dx
1909: 8bcb                   mov      cx, bx
190b: f3ab                   rep stosw word ptr es:[di], ax
190d: 03fa                   add      di, dx
190f: 8bcb                   mov      cx, bx
1911: f3ab                   rep stosw word ptr es:[di], ax
1913: 03fa                   add      di, dx
1915: 8bcb                   mov      cx, bx
1917: f3ab                   rep stosw word ptr es:[di], ax
1919: 03fa                   add      di, dx
191b: 8bcb                   mov      cx, bx
191d: f3ab                   rep stosw word ptr es:[di], ax
191f: 03fa                   add      di, dx
1921: 8bcb                   mov      cx, bx
1923: f3ab                   rep stosw word ptr es:[di], ax
1925: 03fa                   add      di, dx
1927: 8bcb                   mov      cx, bx
1929: f3ab                   rep stosw word ptr es:[di], ax
192b: 03fa                   add      di, dx
192d: 8bcb                   mov      cx, bx
192f: f3ab                   rep stosw word ptr es:[di], ax
1931: 03fa                   add      di, dx
1933: 8bcb                   mov      cx, bx
1935: f3ab                   rep stosw word ptr es:[di], ax
1937: 03fa                   add      di, dx
1939: 8bcb                   mov      cx, bx
193b: f3ab                   rep stosw word ptr es:[di], ax
193d: 03fa                   add      di, dx
193f: 8bcb                   mov      cx, bx
1941: f3ab                   rep stosw word ptr es:[di], ax
1943: 03fa                   add      di, dx
1945: 8bcb                   mov      cx, bx
1947: f3ab                   rep stosw word ptr es:[di], ax
1949: 03fa                   add      di, dx
194b: 8bcb                   mov      cx, bx
194d: f3ab                   rep stosw word ptr es:[di], ax
194f: 03fa                   add      di, dx
1951: 8bcb                   mov      cx, bx
1953: f3ab                   rep stosw word ptr es:[di], ax
1955: 03fa                   add      di, dx
1957: 8bcb                   mov      cx, bx
1959: f3ab                   rep stosw word ptr es:[di], ax
195b: 03fa                   add      di, dx
195d: 8bcb                   mov      cx, bx
195f: f3ab                   rep stosw word ptr es:[di], ax
1961: 03fa                   add      di, dx
1963: 8bcb                   mov      cx, bx
1965: f3ab                   rep stosw word ptr es:[di], ax
1967: 03fa                   add      di, dx
1969: 8bcb                   mov      cx, bx
196b: f3ab                   rep stosw word ptr es:[di], ax
196d: 03fa                   add      di, dx
196f: 8bcb                   mov      cx, bx
1971: f3ab                   rep stosw word ptr es:[di], ax
1973: 03fa                   add      di, dx
1975: 8bcb                   mov      cx, bx
1977: f3ab                   rep stosw word ptr es:[di], ax
1979: 03fa                   add      di, dx
197b: 8bcb                   mov      cx, bx
197d: f3ab                   rep stosw word ptr es:[di], ax
197f: 03fa                   add      di, dx
1981: 8bcb                   mov      cx, bx
1983: f3ab                   rep stosw word ptr es:[di], ax
1985: 03fa                   add      di, dx
1987: 8bcb                   mov      cx, bx
1989: f3ab                   rep stosw word ptr es:[di], ax
198b: 03fa                   add      di, dx
198d: 8bcb                   mov      cx, bx
198f: f3ab                   rep stosw word ptr es:[di], ax
1991: 03fa                   add      di, dx
1993: 8bcb                   mov      cx, bx
1995: f3ab                   rep stosw word ptr es:[di], ax
1997: 03fa                   add      di, dx
1999: 8bcb                   mov      cx, bx
199b: f3ab                   rep stosw word ptr es:[di], ax
199d: 03fa                   add      di, dx
199f: 8bcb                   mov      cx, bx
19a1: f3ab                   rep stosw word ptr es:[di], ax
19a3: 03fa                   add      di, dx
19a5: 8bcb                   mov      cx, bx
19a7: f3ab                   rep stosw word ptr es:[di], ax
19a9: 03fa                   add      di, dx
19ab: 8bcb                   mov      cx, bx
19ad: f3ab                   rep stosw word ptr es:[di], ax
19af: 03fa                   add      di, dx
19b1: 8bcb                   mov      cx, bx
19b3: f3ab                   rep stosw word ptr es:[di], ax
19b5: 03fa                   add      di, dx
19b7: 8bcb                   mov      cx, bx
19b9: f3ab                   rep stosw word ptr es:[di], ax
19bb: 03fa                   add      di, dx
19bd: 8bcb                   mov      cx, bx
19bf: f3ab                   rep stosw word ptr es:[di], ax
19c1: 03fa                   add      di, dx
19c3: 8bcb                   mov      cx, bx
19c5: f3ab                   rep stosw word ptr es:[di], ax
19c7: 03fa                   add      di, dx
19c9: 8bcb                   mov      cx, bx
19cb: f3ab                   rep stosw word ptr es:[di], ax
19cd: 03fa                   add      di, dx
19cf: 8bcb                   mov      cx, bx
19d1: f3ab                   rep stosw word ptr es:[di], ax
19d3: 03fa                   add      di, dx
19d5: 8bcb                   mov      cx, bx
19d7: f3ab                   rep stosw word ptr es:[di], ax
19d9: 03fa                   add      di, dx
19db: 8bcb                   mov      cx, bx
19dd: f3ab                   rep stosw word ptr es:[di], ax
19df: 03fa                   add      di, dx
19e1: 8bcb                   mov      cx, bx
19e3: f3ab                   rep stosw word ptr es:[di], ax
19e5: 03fa                   add      di, dx
19e7: 8bcb                   mov      cx, bx
19e9: f3ab                   rep stosw word ptr es:[di], ax
19eb: 03fa                   add      di, dx
19ed: 8bcb                   mov      cx, bx
19ef: f3ab                   rep stosw word ptr es:[di], ax
19f1: 03fa                   add      di, dx
19f3: 8bcb                   mov      cx, bx
19f5: f3ab                   rep stosw word ptr es:[di], ax
19f7: 03fa                   add      di, dx
19f9: 8bcb                   mov      cx, bx
19fb: f3ab                   rep stosw word ptr es:[di], ax
19fd: 03fa                   add      di, dx
19ff: 8bcb                   mov      cx, bx
1a01: f3ab                   rep stosw word ptr es:[di], ax
1a03: 03fa                   add      di, dx
1a05: 8bcb                   mov      cx, bx
1a07: f3ab                   rep stosw word ptr es:[di], ax
1a09: 03fa                   add      di, dx
1a0b: 8bcb                   mov      cx, bx
1a0d: f3ab                   rep stosw word ptr es:[di], ax
1a0f: 03fa                   add      di, dx
1a11: 8bcb                   mov      cx, bx
1a13: f3ab                   rep stosw word ptr es:[di], ax
1a15: 03fa                   add      di, dx
1a17: 8bcb                   mov      cx, bx
1a19: f3ab                   rep stosw word ptr es:[di], ax
1a1b: 03fa                   add      di, dx
1a1d: 8bcb                   mov      cx, bx
1a1f: f3ab                   rep stosw word ptr es:[di], ax
1a21: 03fa                   add      di, dx
1a23: 8bcb                   mov      cx, bx
1a25: f3ab                   rep stosw word ptr es:[di], ax
1a27: 03fa                   add      di, dx
1a29: 8bcb                   mov      cx, bx
1a2b: f3ab                   rep stosw word ptr es:[di], ax
1a2d: 03fa                   add      di, dx
1a2f: 8bcb                   mov      cx, bx
1a31: f3ab                   rep stosw word ptr es:[di], ax
1a33: 03fa                   add      di, dx
1a35: 8bcb                   mov      cx, bx
1a37: f3ab                   rep stosw word ptr es:[di], ax
1a39: 03fa                   add      di, dx
1a3b: 8bcb                   mov      cx, bx
1a3d: f3ab                   rep stosw word ptr es:[di], ax
1a3f: 03fa                   add      di, dx
1a41: 8bcb                   mov      cx, bx
1a43: f3ab                   rep stosw word ptr es:[di], ax
1a45: 03fa                   add      di, dx
1a47: 8bcb                   mov      cx, bx
1a49: f3ab                   rep stosw word ptr es:[di], ax
1a4b: 03fa                   add      di, dx
1a4d: 8bcb                   mov      cx, bx
1a4f: f3ab                   rep stosw word ptr es:[di], ax
1a51: 03fa                   add      di, dx
1a53: 8bcb                   mov      cx, bx
1a55: f3ab                   rep stosw word ptr es:[di], ax
1a57: 03fa                   add      di, dx
1a59: 8bcb                   mov      cx, bx
1a5b: f3ab                   rep stosw word ptr es:[di], ax
1a5d: 03fa                   add      di, dx
1a5f: 8bcb                   mov      cx, bx
1a61: f3ab                   rep stosw word ptr es:[di], ax
1a63: 03fa                   add      di, dx
1a65: 8bcb                   mov      cx, bx
1a67: f3ab                   rep stosw word ptr es:[di], ax
1a69: 03fa                   add      di, dx
1a6b: 8bcb                   mov      cx, bx
1a6d: f3ab                   rep stosw word ptr es:[di], ax
1a6f: 03fa                   add      di, dx
1a71: 8bcb                   mov      cx, bx
1a73: f3ab                   rep stosw word ptr es:[di], ax
1a75: 03fa                   add      di, dx
1a77: 8bcb                   mov      cx, bx
1a79: f3ab                   rep stosw word ptr es:[di], ax
1a7b: 03fa                   add      di, dx
1a7d: 8bcb                   mov      cx, bx
1a7f: f3ab                   rep stosw word ptr es:[di], ax
1a81: 03fa                   add      di, dx
1a83: 8bcb                   mov      cx, bx
1a85: f3ab                   rep stosw word ptr es:[di], ax
1a87: 03fa                   add      di, dx
1a89: 8bcb                   mov      cx, bx
1a8b: f3ab                   rep stosw word ptr es:[di], ax
1a8d: 03fa                   add      di, dx
1a8f: 8bcb                   mov      cx, bx
1a91: f3ab                   rep stosw word ptr es:[di], ax
1a93: 03fa                   add      di, dx
1a95: 8bcb                   mov      cx, bx
1a97: f3ab                   rep stosw word ptr es:[di], ax
1a99: 03fa                   add      di, dx
1a9b: 8bcb                   mov      cx, bx
1a9d: f3ab                   rep stosw word ptr es:[di], ax
1a9f: 03fa                   add      di, dx
1aa1: 8bcb                   mov      cx, bx
1aa3: f3ab                   rep stosw word ptr es:[di], ax
1aa5: 03fa                   add      di, dx
1aa7: 8bcb                   mov      cx, bx
1aa9: f3ab                   rep stosw word ptr es:[di], ax
1aab: 03fa                   add      di, dx
1aad: 8bcb                   mov      cx, bx
1aaf: f3ab                   rep stosw word ptr es:[di], ax
1ab1: 03fa                   add      di, dx
1ab3: 8bcb                   mov      cx, bx
1ab5: f3ab                   rep stosw word ptr es:[di], ax
1ab7: 03fa                   add      di, dx
1ab9: 8bcb                   mov      cx, bx
1abb: f3ab                   rep stosw word ptr es:[di], ax
1abd: 03fa                   add      di, dx
1abf: 8bcb                   mov      cx, bx
1ac1: f3ab                   rep stosw word ptr es:[di], ax
1ac3: 03fa                   add      di, dx
1ac5: 8bcb                   mov      cx, bx
1ac7: f3ab                   rep stosw word ptr es:[di], ax
1ac9: 03fa                   add      di, dx
1acb: 8bcb                   mov      cx, bx
1acd: f3ab                   rep stosw word ptr es:[di], ax
1acf: 03fa                   add      di, dx
1ad1: 8bcb                   mov      cx, bx
1ad3: f3ab                   rep stosw word ptr es:[di], ax
1ad5: 03fa                   add      di, dx
1ad7: 8bcb                   mov      cx, bx
1ad9: f3ab                   rep stosw word ptr es:[di], ax
1adb: 03fa                   add      di, dx
1add: 8bcb                   mov      cx, bx
1adf: f3ab                   rep stosw word ptr es:[di], ax
1ae1: 03fa                   add      di, dx
1ae3: 8bcb                   mov      cx, bx
1ae5: f3ab                   rep stosw word ptr es:[di], ax
1ae7: 03fa                   add      di, dx
1ae9: 8bcb                   mov      cx, bx
1aeb: f3ab                   rep stosw word ptr es:[di], ax
1aed: 03fa                   add      di, dx
1aef: 8bcb                   mov      cx, bx
1af1: f3ab                   rep stosw word ptr es:[di], ax
1af3: 03fa                   add      di, dx
1af5: 8bcb                   mov      cx, bx
1af7: f3ab                   rep stosw word ptr es:[di], ax
1af9: 03fa                   add      di, dx
1afb: 8bcb                   mov      cx, bx
1afd: f3ab                   rep stosw word ptr es:[di], ax
1aff: 03fa                   add      di, dx
1b01: 8bcb                   mov      cx, bx
1b03: f3ab                   rep stosw word ptr es:[di], ax
1b05: 03fa                   add      di, dx
1b07: 8bcb                   mov      cx, bx
1b09: f3ab                   rep stosw word ptr es:[di], ax
1b0b: 03fa                   add      di, dx
1b0d: 8bcb                   mov      cx, bx
1b0f: f3ab                   rep stosw word ptr es:[di], ax
1b11: 03fa                   add      di, dx
1b13: 8bcb                   mov      cx, bx
1b15: f3ab                   rep stosw word ptr es:[di], ax
1b17: 03fa                   add      di, dx
1b19: 8bcb                   mov      cx, bx
1b1b: f3ab                   rep stosw word ptr es:[di], ax
1b1d: 03fa                   add      di, dx
1b1f: 8bcb                   mov      cx, bx
1b21: f3ab                   rep stosw word ptr es:[di], ax
1b23: 03fa                   add      di, dx
1b25: 8bcb                   mov      cx, bx
1b27: f3ab                   rep stosw word ptr es:[di], ax
1b29: 03fa                   add      di, dx
1b2b: 8bcb                   mov      cx, bx
1b2d: f3ab                   rep stosw word ptr es:[di], ax
1b2f: 03fa                   add      di, dx
1b31: 8bcb                   mov      cx, bx
1b33: f3ab                   rep stosw word ptr es:[di], ax
1b35: 03fa                   add      di, dx
1b37: 8bcb                   mov      cx, bx
1b39: f3ab                   rep stosw word ptr es:[di], ax
1b3b: 03fa                   add      di, dx
1b3d: 8bcb                   mov      cx, bx
1b3f: f3ab                   rep stosw word ptr es:[di], ax
1b41: 03fa                   add      di, dx
1b43: 8bcb                   mov      cx, bx
1b45: f3ab                   rep stosw word ptr es:[di], ax
1b47: 03fa                   add      di, dx
1b49: 8bcb                   mov      cx, bx
1b4b: f3ab                   rep stosw word ptr es:[di], ax
1b4d: 03fa                   add      di, dx
1b4f: 8bcb                   mov      cx, bx
1b51: f3ab                   rep stosw word ptr es:[di], ax
1b53: 03fa                   add      di, dx
1b55: 8bcb                   mov      cx, bx
1b57: f3ab                   rep stosw word ptr es:[di], ax
1b59: 03fa                   add      di, dx
1b5b: 8bcb                   mov      cx, bx
1b5d: f3ab                   rep stosw word ptr es:[di], ax
1b5f: 03fa                   add      di, dx
1b61: 8bcb                   mov      cx, bx
1b63: f3ab                   rep stosw word ptr es:[di], ax
1b65: 03fa                   add      di, dx
1b67: 8bcb                   mov      cx, bx
1b69: f3ab                   rep stosw word ptr es:[di], ax
1b6b: 03fa                   add      di, dx
1b6d: 8bcb                   mov      cx, bx
1b6f: f3ab                   rep stosw word ptr es:[di], ax
1b71: 03fa                   add      di, dx
1b73: 8bcb                   mov      cx, bx
1b75: f3ab                   rep stosw word ptr es:[di], ax
1b77: 03fa                   add      di, dx
1b79: 8bcb                   mov      cx, bx
1b7b: f3ab                   rep stosw word ptr es:[di], ax
1b7d: 03fa                   add      di, dx
1b7f: 8bcb                   mov      cx, bx
1b81: f3ab                   rep stosw word ptr es:[di], ax
1b83: 03fa                   add      di, dx
1b85: 8bcb                   mov      cx, bx
1b87: f3ab                   rep stosw word ptr es:[di], ax
1b89: 03fa                   add      di, dx
1b8b: 8bcb                   mov      cx, bx
1b8d: f3ab                   rep stosw word ptr es:[di], ax
1b8f: 03fa                   add      di, dx
1b91: 8bcb                   mov      cx, bx
1b93: f3ab                   rep stosw word ptr es:[di], ax
1b95: 03fa                   add      di, dx
1b97: 8bcb                   mov      cx, bx
1b99: f3ab                   rep stosw word ptr es:[di], ax
1b9b: 03fa                   add      di, dx
1b9d: 8bcb                   mov      cx, bx
1b9f: f3ab                   rep stosw word ptr es:[di], ax
1ba1: 03fa                   add      di, dx
1ba3: 8bcb                   mov      cx, bx
1ba5: f3ab                   rep stosw word ptr es:[di], ax
1ba7: 03fa                   add      di, dx
1ba9: 8bcb                   mov      cx, bx
1bab: f3ab                   rep stosw word ptr es:[di], ax
1bad: 03fa                   add      di, dx
1baf: 8bcb                   mov      cx, bx
1bb1: f3ab                   rep stosw word ptr es:[di], ax
1bb3: 03fa                   add      di, dx
1bb5: 8bcb                   mov      cx, bx
1bb7: f3ab                   rep stosw word ptr es:[di], ax
1bb9: 03fa                   add      di, dx
1bbb: 8bcb                   mov      cx, bx
1bbd: f3ab                   rep stosw word ptr es:[di], ax
1bbf: 03fa                   add      di, dx
1bc1: 8bcb                   mov      cx, bx
1bc3: f3ab                   rep stosw word ptr es:[di], ax
1bc5: 03fa                   add      di, dx
1bc7: 8bcb                   mov      cx, bx
1bc9: f3ab                   rep stosw word ptr es:[di], ax
1bcb: 03fa                   add      di, dx
1bcd: 8bcb                   mov      cx, bx
1bcf: f3ab                   rep stosw word ptr es:[di], ax
1bd1: 03fa                   add      di, dx
1bd3: 8bcb                   mov      cx, bx
1bd5: f3ab                   rep stosw word ptr es:[di], ax
1bd7: 03fa                   add      di, dx
1bd9: 8bcb                   mov      cx, bx
1bdb: f3ab                   rep stosw word ptr es:[di], ax
1bdd: 03fa                   add      di, dx
1bdf: 8bcb                   mov      cx, bx
1be1: f3ab                   rep stosw word ptr es:[di], ax
1be3: 03fa                   add      di, dx
1be5: 8bcb                   mov      cx, bx
1be7: f3ab                   rep stosw word ptr es:[di], ax
1be9: 03fa                   add      di, dx
1beb: 8bcb                   mov      cx, bx
1bed: f3ab                   rep stosw word ptr es:[di], ax
1bef: 03fa                   add      di, dx
1bf1: 8bcb                   mov      cx, bx
1bf3: f3ab                   rep stosw word ptr es:[di], ax
1bf5: 03fa                   add      di, dx
1bf7: 8bcb                   mov      cx, bx
1bf9: f3ab                   rep stosw word ptr es:[di], ax
1bfb: b80500                 mov      ax, 5
1bfe: bace03                 mov      dx, 0x3ce
1c01: ef                     out      dx, ax
1c02: 8cd8                   mov      ax, ds
1c04: 8ec0                   mov      es, ax
1c06: c3                     ret      
1c07: 0000                   add      byte ptr [bx + si], al
1c09: 0000                   add      byte ptr [bx + si], al
1c0b: 0000                   add      byte ptr [bx + si], al
1c0d: 0000                   add      byte ptr [bx + si], al
1c0f: 0032                   add      byte ptr [bp + si], dh
1c11: ed                     in       ax, dx
1c12: a12500                 mov      ax, word ptr [0x25]
1c15: d1e0                   shl      ax, 1
1c17: 0106734b               add      word ptr [0x4b73], ax
1c1b: 7202                   jb       0x1c1f
1c1d: fecd                   dec      ch
1c1f: 882e494b               mov      byte ptr [0x4b49], ch
1c23: a0384b                 mov      al, byte ptr [0x4b38]
1c26: 22c0                   and      al, al
1c28: 7409                   je       0x1c33
1c2a: fe0e384b               dec      byte ptr [0x4b38]
1c2e: 7503                   jne      0x1c33
1c30: e89100                 call     0x1cc4
1c33: bb0100                 mov      bx, 1
1c36: e8b201                 call     0x1deb
1c39: e89900                 call     0x1cd5
1c3c: fecb                   dec      bl
1c3e: 79f6                   jns      0x1c36
1c40: e82b01                 call     0x1d6e
1c43: a07f54                 mov      al, byte ptr [0x547f]
1c46: 22c0                   and      al, al
1c48: 7903                   jns      0x1c4d
1c4a: e80000                 call     0x1c4d
1c4d: a0284b                 mov      al, byte ptr [0x4b28]
1c50: 22c0                   and      al, al
1c52: 7439                   je       0x1c8d
1c54: 7837                   js       0x1c8d
1c56: d0e8                   shr      al, 1
1c58: d0e8                   shr      al, 1
1c5a: 2401                   and      al, 1
1c5c: 7402                   je       0x1c60
1c5e: b003                   mov      al, 3
1c60: a2a654                 mov      byte ptr [0x54a6], al
1c63: a0e14a                 mov      al, byte ptr [0x4ae1]
1c66: 22c0                   and      al, al
1c68: 750e                   jne      0x1c78
1c6a: a0264b                 mov      al, byte ptr [0x4b26]
1c6d: 22c0                   and      al, al
1c6f: 7507                   jne      0x1c78
1c71: a0284b                 mov      al, byte ptr [0x4b28]
1c74: 3c06                   cmp      al, 6
1c76: 7215                   jb       0x1c8d
1c78: a0494b                 mov      al, byte ptr [0x4b49]
1c7b: 22c0                   and      al, al
1c7d: 780e                   js       0x1c8d
1c7f: fe0e284b               dec      byte ptr [0x4b28]
1c83: 7508                   jne      0x1c8d
1c85: b080                   mov      al, 0x80
1c87: a25d54                 mov      byte ptr [0x545d], al
1c8a: a2284b                 mov      byte ptr [0x4b28], al
1c8d: c3                     ret      
1c8e: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
1c92: 2a85b14c               sub      al, byte ptr [di + 0x4cb1]
1c96: 2f                     das      
1c97: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
1c9b: 1a85c94c               sbb      al, byte ptr [di + 0x4cc9]
1c9f: 2f                     das      
1ca0: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
1ca4: 1a85e14c               sbb      al, byte ptr [di + 0x4ce1]
1ca8: 2f                     das      
1ca9: 7318                   jae      0x1cc3
1cab: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
1caf: 8885b14c               mov      byte ptr [di + 0x4cb1], al
1cb3: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
1cb7: 8885c94c               mov      byte ptr [di + 0x4cc9], al
1cbb: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
1cbf: 8885e14c               mov      byte ptr [di + 0x4ce1], al
1cc3: c3                     ret      
1cc4: 53                     push     bx
1cc5: e89502                 call     0x1f5d
1cc8: bb0200                 mov      bx, 2
1ccb: bf7d1d                 mov      di, 0x1d7d
1cce: b080                   mov      al, 0x80
1cd0: e88004                 call     0x2153
1cd3: 5b                     pop      bx
1cd4: c3                     ret      
1cd5: 22db                   and      bl, bl
1cd7: 7507                   jne      0x1ce0
1cd9: a0274b                 mov      al, byte ptr [0x4b27]
1cdc: 2440                   and      al, 0x40
1cde: 7518                   jne      0x1cf8
1ce0: 8a878054               mov      al, byte ptr [bx + 0x5480]
1ce4: 8aa78354               mov      ah, byte ptr [bx + 0x5483]
1ce8: 22e4                   and      ah, ah
1cea: 790d                   jns      0x1cf9
1cec: 3a067656               cmp      al, byte ptr [0x5676]
1cf0: 7506                   jne      0x1cf8
1cf2: 32c0                   xor      al, al
1cf4: 88878354               mov      byte ptr [bx + 0x5483], al
1cf8: c3                     ret      
1cf9: 3a068956               cmp      al, byte ptr [0x5689]
1cfd: 75f9                   jne      0x1cf8
1cff: c687835480             mov      byte ptr [bx + 0x5483], 0x80
1d04: fe878554               inc      byte ptr [bx + 0x5485]
1d08: 8a878554               mov      al, byte ptr [bx + 0x5485]
1d0c: 3c01                   cmp      al, 1
1d0e: 7403                   je       0x1d13
1d10: e8e340                 call     0x5df6
1d13: 22db                   and      bl, bl
1d15: 752d                   jne      0x1d44
1d17: a08554                 mov      al, byte ptr [0x5485]
1d1a: 3c01                   cmp      al, 1
1d1c: 740e                   je       0x1d2c
1d1e: e89374                 call     0x91b4
1d21: a02a00                 mov      al, byte ptr [0x2a]
1d24: a2384b                 mov      byte ptr [0x4b38], al
1d27: 53                     push     bx
1d28: e89d00                 call     0x1dc8
1d2b: 5b                     pop      bx
1d2c: 53                     push     bx
1d2d: a10a00                 mov      ax, word ptr [0xa]
1d30: 22260c00               and      ah, byte ptr [0xc]
1d34: 8ec0                   mov      es, ax
1d36: a08554                 mov      al, byte ptr [0x5485]
1d39: bfd51b                 mov      di, 0x1bd5
1d3c: e80b05                 call     0x224a
1d3f: 8cd8                   mov      ax, ds
1d41: 8ec0                   mov      es, ax
1d43: 5b                     pop      bx
1d44: 8a878554               mov      al, byte ptr [bx + 0x5485]
1d48: 3c01                   cmp      al, 1
1d4a: 741f                   je       0x1d6b
1d4c: bf0200                 mov      di, 2
1d4f: e83cff                 call     0x1c8e
1d52: 7317                   jae      0x1d6b
1d54: 8ac3                   mov      al, bl
1d56: d0e8                   shr      al, 1
1d58: d0d8                   rcr      al, 1
1d5a: d0d8                   rcr      al, 1
1d5c: a2a254                 mov      byte ptr [0x54a2], al
1d5f: 22c0                   and      al, al
1d61: 7408                   je       0x1d6b
1d63: 32c0                   xor      al, al
1d65: a2384b                 mov      byte ptr [0x4b38], al
1d68: e859ff                 call     0x1cc4
1d6b: eb6f                   jmp      0x1ddc
1d6d: 90                     nop      
1d6e: bb0100                 mov      bx, 1
1d71: a07054                 mov      al, byte ptr [0x5470]
1d74: 22c0                   and      al, al
1d76: 753f                   jne      0x1db7
1d78: 8a878554               mov      al, byte ptr [bx + 0x5485]
1d7c: 3a066054               cmp      al, byte ptr [0x5460]
1d80: 7535                   jne      0x1db7
1d82: a27054                 mov      byte ptr [0x5470], al
1d85: a0284b                 mov      al, byte ptr [0x4b28]
1d88: 22c0                   and      al, al
1d8a: 7505                   jne      0x1d91
1d8c: c606284b2c             mov      byte ptr [0x4b28], 0x2c
1d91: 53                     push     bx
1d92: e81902                 call     0x1fae
1d95: 5b                     pop      bx
1d96: a0b247                 mov      al, byte ptr [0x47b2]
1d99: 3c0b                   cmp      al, 0xb
1d9b: 740f                   je       0x1dac
1d9d: bea944                 mov      si, 0x44a9
1da0: a07956                 mov      al, byte ptr [0x5679]
1da3: 22c0                   and      al, al
1da5: 790d                   jns      0x1db4
1da7: bef243                 mov      si, 0x43f2
1daa: eb08                   jmp      0x1db4
1dac: c6066e5480             mov      byte ptr [0x546e], 0x80
1db1: bea943                 mov      si, 0x43a9
1db4: e88004                 call     0x2237
1db7: a06e54                 mov      al, byte ptr [0x546e]
1dba: 24bf                   and      al, 0xbf
1dbc: 0a06a254               or       al, byte ptr [0x54a2]
1dc0: a26e54                 mov      byte ptr [0x546e], al
1dc3: fecb                   dec      bl
1dc5: 79aa                   jns      0x1d71
1dc7: c3                     ret      
1dc8: 53                     push     bx
1dc9: 33db                   xor      bx, bx
1dcb: bfed1b                 mov      di, 0x1bed
1dce: a0384b                 mov      al, byte ptr [0x4b38]
1dd1: 22c0                   and      al, al
1dd3: 7402                   je       0x1dd7
1dd5: b080                   mov      al, 0x80
1dd7: e87903                 call     0x2153
1dda: 5b                     pop      bx
1ddb: c3                     ret      
1ddc: 32c0                   xor      al, al
1dde: 8887c94c               mov      byte ptr [bx + 0x4cc9], al
1de2: 8887b14c               mov      byte ptr [bx + 0x4cb1], al
1de6: 8887e14c               mov      byte ptr [bx + 0x4ce1], al
1dea: c3                     ret      
1deb: a12200                 mov      ax, word ptr [0x22]
1dee: 0026ae47               add      byte ptr [0x47ae], ah
1df2: 1287b14c               adc      al, byte ptr [bx + 0x4cb1]
1df6: 27                     daa      
1df7: 8887b14c               mov      byte ptr [bx + 0x4cb1], al
1dfb: 7338                   jae      0x1e35
1dfd: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
1e01: 12c7                   adc      al, bh
1e03: 27                     daa      
1e04: 8887c94c               mov      byte ptr [bx + 0x4cc9], al
1e08: 3c60                   cmp      al, 0x60
1e0a: 7214                   jb       0x1e20
1e0c: c687c94c00             mov      byte ptr [bx + 0x4cc9], 0
1e11: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
1e15: 0401                   add      al, 1
1e17: 27                     daa      
1e18: 3c0a                   cmp      al, 0xa
1e1a: 7304                   jae      0x1e20
1e1c: 8887e14c               mov      byte ptr [bx + 0x4ce1], al
1e20: 22db                   and      bl, bl
1e22: 7511                   jne      0x1e35
1e24: a0384b                 mov      al, byte ptr [0x4b38]
1e27: 22c0                   and      al, al
1e29: 750a                   jne      0x1e35
1e2b: a08554                 mov      al, byte ptr [0x5485]
1e2e: 22c0                   and      al, al
1e30: 7403                   je       0x1e35
1e32: e893ff                 call     0x1dc8
1e35: c3                     ret      
1e36: a01854                 mov      al, byte ptr [0x5418]
1e39: 2403                   and      al, 3
1e3b: 75f8                   jne      0x1e35
1e3d: b800a0                 mov      ax, 0xa000
1e40: 8ec0                   mov      es, ax
1e42: a1ee4a                 mov      ax, word ptr [0x4aee]
1e45: 8bd0                   mov      dx, ax
1e47: d1e8                   shr      ax, 1
1e49: d1e8                   shr      ax, 1
1e4b: 03c2                   add      ax, dx
1e4d: d1e8                   shr      ax, 1
1e4f: d1e8                   shr      ax, 1
1e51: 33d2                   xor      dx, dx
1e53: 32db                   xor      bl, bl
1e55: eb06                   jmp      0x1e5d
1e57: 90                     nop      
1e58: 2de803                 sub      ax, 0x3e8
1e5b: fec2                   inc      dl
1e5d: 3de803                 cmp      ax, 0x3e8
1e60: 73f6                   jae      0x1e58
1e62: eb05                   jmp      0x1e69
1e64: 90                     nop      
1e65: 2c64                   sub      al, 0x64
1e67: fec6                   inc      dh
1e69: 3c64                   cmp      al, 0x64
1e6b: 73f8                   jae      0x1e65
1e6d: fecc                   dec      ah
1e6f: 79f4                   jns      0x1e65
1e71: eb05                   jmp      0x1e78
1e73: 90                     nop      
1e74: 2c0a                   sub      al, 0xa
1e76: fec3                   inc      bl
1e78: 3c0a                   cmp      al, 0xa
1e7a: 73f8                   jae      0x1e74
1e7c: a2c94a                 mov      byte ptr [0x4ac9], al
1e7f: 881ec74a               mov      byte ptr [0x4ac7], bl
1e83: 8836c84a               mov      byte ptr [0x4ac8], dh
1e87: 8816ca4a               mov      byte ptr [0x4aca], dl
1e8b: a07654                 mov      al, byte ptr [0x5476]
1e8e: 22c0                   and      al, al
1e90: b0f0                   mov      al, 0xf0
1e92: 7902                   jns      0x1e96
1e94: b0fd                   mov      al, 0xfd
1e96: bf651d                 mov      di, 0x1d65
1e99: e8b803                 call     0x2254
1e9c: a0ca4a                 mov      al, byte ptr [0x4aca]
1e9f: bf661d                 mov      di, 0x1d66
1ea2: e8af03                 call     0x2254
1ea5: a0c84a                 mov      al, byte ptr [0x4ac8]
1ea8: bf671d                 mov      di, 0x1d67
1eab: e8a603                 call     0x2254
1eae: a0c74a                 mov      al, byte ptr [0x4ac7]
1eb1: bf681d                 mov      di, 0x1d68
1eb4: e89d03                 call     0x2254
1eb7: a0c94a                 mov      al, byte ptr [0x4ac9]
1eba: bf691d                 mov      di, 0x1d69
1ebd: e89403                 call     0x2254
1ec0: a07054                 mov      al, byte ptr [0x5470]
1ec3: 22c0                   and      al, al
1ec5: 7503                   jne      0x1eca
1ec7: e9e400                 jmp      0x1fae
1eca: 8cd8                   mov      ax, ds
1ecc: 8ec0                   mov      es, ax
1ece: c3                     ret      
1ecf: 0430                   add      al, 0x30
1ed1: e92ce4                 jmp      0x300
1ed4: b800a0                 mov      ax, 0xa000
1ed7: 8ec0                   mov      es, ax
1ed9: a05e54                 mov      al, byte ptr [0x545e]
1edc: 22c0                   and      al, al
1ede: 741e                   je       0x1efe
1ee0: a0d054                 mov      al, byte ptr [0x54d0]
1ee3: 0206d154               add      al, byte ptr [0x54d1]
1ee7: d0d8                   rcr      al, 1
1ee9: 0206d254               add      al, byte ptr [0x54d2]
1eed: d0d8                   rcr      al, 1
1eef: d0e8                   shr      al, 1
1ef1: a2d854                 mov      byte ptr [0x54d8], al
1ef4: e89350                 call     0x6f8a
1ef7: b80300                 mov      ax, 3
1efa: bace03                 mov      dx, 0x3ce
1efd: ef                     out      dx, ax
1efe: a00e54                 mov      al, byte ptr [0x540e]
1f01: 22c0                   and      al, al
1f03: 7425                   je       0x1f2a
1f05: fe0e0e54               dec      byte ptr [0x540e]
1f09: 3a062b00               cmp      al, byte ptr [0x2b]
1f0d: 740c                   je       0x1f1b
1f0f: a05e54                 mov      al, byte ptr [0x545e]
1f12: 22c0                   and      al, al
1f14: 753d                   jne      0x1f53
1f16: 8cd8                   mov      ax, ds
1f18: 8ec0                   mov      es, ax
1f1a: c3                     ret      
1f1b: a02656                 mov      al, byte ptr [0x5626]
1f1e: 98                     cwde     
1f1f: 8bf8                   mov      di, ax
1f21: e87604                 call     0x239a
1f24: e87c1c                 call     0x3ba3
1f27: eb2a                   jmp      0x1f53
1f29: 90                     nop      
1f2a: a05e54                 mov      al, byte ptr [0x545e]
1f2d: 22c0                   and      al, al
1f2f: 7427                   je       0x1f58
1f31: a06854                 mov      al, byte ptr [0x5468]
1f34: 3c14                   cmp      al, 0x14
1f36: 721b                   jb       0x1f53
1f38: a02656                 mov      al, byte ptr [0x5626]
1f3b: 22c0                   and      al, al
1f3d: 7414                   je       0x1f53
1f3f: fec8                   dec      al
1f41: a22656                 mov      byte ptr [0x5626], al
1f44: 98                     cwde     
1f45: 8bf8                   mov      di, ax
1f47: e85004                 call     0x239a
1f4a: e85e1c                 call     0x3bab
1f4d: a02b00                 mov      al, byte ptr [0x2b]
1f50: a20e54                 mov      byte ptr [0x540e], al
1f53: 32c0                   xor      al, al
1f55: a25e54                 mov      byte ptr [0x545e], al
1f58: 8cd8                   mov      ax, ds
1f5a: 8ec0                   mov      es, ax
1f5c: c3                     ret      
1f5d: bea247                 mov      si, 0x47a2
1f60: b10b                   mov      cl, 0xb
1f62: a0a254                 mov      al, byte ptr [0x54a2]
1f65: 22c0                   and      al, al
1f67: 7505                   jne      0x1f6e
1f69: be8a47                 mov      si, 0x478a
1f6c: b107                   mov      cl, 7
1f6e: 880eb347               mov      byte ptr [0x47b3], cl
1f72: b800a0                 mov      ax, 0xa000
1f75: 8ec0                   mov      es, ax
1f77: bac403                 mov      dx, 0x3c4
1f7a: b80208                 mov      ax, 0x802
1f7d: ef                     out      dx, ax
1f7e: bf1a1e                 mov      di, 0x1e1a
1f81: bb2600                 mov      bx, 0x26
1f84: 56                     push     si
1f85: a5                     movsw    word ptr es:[di], word ptr [si]
1f86: 03fb                   add      di, bx
1f88: a5                     movsw    word ptr es:[di], word ptr [si]
1f89: 03fb                   add      di, bx
1f8b: a5                     movsw    word ptr es:[di], word ptr [si]
1f8c: 03fb                   add      di, bx
1f8e: a5                     movsw    word ptr es:[di], word ptr [si]
1f8f: 03fb                   add      di, bx
1f91: a5                     movsw    word ptr es:[di], word ptr [si]
1f92: 03fb                   add      di, bx
1f94: a5                     movsw    word ptr es:[di], word ptr [si]
1f95: bf1a3e                 mov      di, 0x3e1a
1f98: 5e                     pop      si
1f99: a5                     movsw    word ptr es:[di], word ptr [si]
1f9a: 03fb                   add      di, bx
1f9c: a5                     movsw    word ptr es:[di], word ptr [si]
1f9d: 03fb                   add      di, bx
1f9f: a5                     movsw    word ptr es:[di], word ptr [si]
1fa0: 03fb                   add      di, bx
1fa2: a5                     movsw    word ptr es:[di], word ptr [si]
1fa3: 03fb                   add      di, bx
1fa5: a5                     movsw    word ptr es:[di], word ptr [si]
1fa6: 03fb                   add      di, bx
1fa8: a5                     movsw    word ptr es:[di], word ptr [si]
1fa9: 8cd8                   mov      ax, ds
1fab: 8ec0                   mov      es, ax
1fad: c3                     ret      
1fae: bea247                 mov      si, 0x47a2
1fb1: b10b                   mov      cl, 0xb
1fb3: e8341b                 call     0x3aea
1fb6: 7905                   jns      0x1fbd
1fb8: be9647                 mov      si, 0x4796
1fbb: b107                   mov      cl, 7
1fbd: 880eb247               mov      byte ptr [0x47b2], cl
1fc1: 3b360060               cmp      si, word ptr [0x6000]
1fc5: 7439                   je       0x2000
1fc7: 89360060               mov      word ptr [0x6000], si
1fcb: bac403                 mov      dx, 0x3c4
1fce: b80208                 mov      ax, 0x802
1fd1: ef                     out      dx, ax
1fd2: bf0c1e                 mov      di, 0x1e0c
1fd5: bb2600                 mov      bx, 0x26
1fd8: 56                     push     si
1fd9: a5                     movsw    word ptr es:[di], word ptr [si]
1fda: 03fb                   add      di, bx
1fdc: a5                     movsw    word ptr es:[di], word ptr [si]
1fdd: 03fb                   add      di, bx
1fdf: a5                     movsw    word ptr es:[di], word ptr [si]
1fe0: 03fb                   add      di, bx
1fe2: a5                     movsw    word ptr es:[di], word ptr [si]
1fe3: 03fb                   add      di, bx
1fe5: a5                     movsw    word ptr es:[di], word ptr [si]
1fe6: 03fb                   add      di, bx
1fe8: a5                     movsw    word ptr es:[di], word ptr [si]
1fe9: bf0c3e                 mov      di, 0x3e0c
1fec: 5e                     pop      si
1fed: a5                     movsw    word ptr es:[di], word ptr [si]
1fee: 03fb                   add      di, bx
1ff0: a5                     movsw    word ptr es:[di], word ptr [si]
1ff1: 03fb                   add      di, bx
1ff3: a5                     movsw    word ptr es:[di], word ptr [si]
1ff4: 03fb                   add      di, bx
1ff6: a5                     movsw    word ptr es:[di], word ptr [si]
1ff7: 03fb                   add      di, bx
1ff9: a5                     movsw    word ptr es:[di], word ptr [si]
1ffa: 03fb                   add      di, bx
1ffc: a5                     movsw    word ptr es:[di], word ptr [si]
1ffd: b40f                   mov      ah, 0xf
1fff: ef                     out      dx, ax
2000: 8cd8                   mov      ax, ds
2002: 8ec0                   mov      es, ax
2004: c3                     ret      
2005: b800a0                 mov      ax, 0xa000
2008: bac403                 mov      dx, 0x3c4
200b: 8ec0                   mov      es, ax
200d: 32ff                   xor      bh, bh
200f: a06553                 mov      al, byte ptr [0x5365]
2012: 2c11                   sub      al, 0x11
2014: f9                     stc      
2015: 7902                   jns      0x2019
2017: 32c0                   xor      al, al
2019: d0d0                   rcl      al, 1
201b: b4b7                   mov      ah, 0xb7
201d: f6e4                   mul      ah
201f: d0ec                   shr      ah, 1
2021: 80fc40                 cmp      ah, 0x40
2024: 7203                   jb       0x2029
2026: 80ec40                 sub      ah, 0x40
2029: 88265a54               mov      byte ptr [0x545a], ah
202d: 2a265b54               sub      ah, byte ptr [0x545b]
2031: 7503                   jne      0x2036
2033: e90e01                 jmp      0x2144
2036: 7903                   jns      0x203b
2038: e98900                 jmp      0x20c4
203b: fecc                   dec      ah
203d: a05b54                 mov      al, byte ptr [0x545b]
2040: fec0                   inc      al
2042: 8ad8                   mov      bl, al
2044: 8bfb                   mov      di, bx
2046: d1ef                   shr      di, 1
2048: d1ef                   shr      di, 1
204a: 81c73c1b               add      di, 0x1b3c
204e: 2403                   and      al, 3
2050: 02e0                   add      ah, al
2052: 8aec                   mov      ch, ah
2054: b1ff                   mov      cl, 0xff
2056: 80fd04                 cmp      ch, 4
2059: 7233                   jb       0x208e
205b: b8020e                 mov      ax, 0xe02
205e: ef                     out      dx, ax
205f: 26880d                 mov      byte ptr es:[di], cl
2062: 26884d28               mov      byte ptr es:[di + 0x28], cl
2066: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
206b: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
2070: f6d1                   not      cl
2072: f6d4                   not      ah
2074: ef                     out      dx, ax
2075: 26880d                 mov      byte ptr es:[di], cl
2078: 26884d28               mov      byte ptr es:[di + 0x28], cl
207c: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
2081: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
2086: 47                     inc      di
2087: f6d1                   not      cl
2089: 80ed04                 sub      ch, 4
208c: ebc8                   jmp      0x2056
208e: 8add                   mov      bl, ch
2090: 8a8f8447               mov      cl, byte ptr [bx + 0x4784]
2094: b8020e                 mov      ax, 0xe02
2097: ef                     out      dx, ax
2098: 26880d                 mov      byte ptr es:[di], cl
209b: 26884d28               mov      byte ptr es:[di + 0x28], cl
209f: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
20a4: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
20a9: f6d1                   not      cl
20ab: b401                   mov      ah, 1
20ad: ef                     out      dx, ax
20ae: 26880d                 mov      byte ptr es:[di], cl
20b1: 26884d28               mov      byte ptr es:[di + 0x28], cl
20b5: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
20ba: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
20bf: f6d1                   not      cl
20c1: e98000                 jmp      0x2144
20c4: f6dc                   neg      ah
20c6: 8aec                   mov      ch, ah
20c8: 8a1e5a54               mov      bl, byte ptr [0x545a]
20cc: 8bfb                   mov      di, bx
20ce: 80e303                 and      bl, 3
20d1: d1ef                   shr      di, 1
20d3: d1ef                   shr      di, 1
20d5: 81c73c1b               add      di, 0x1b3c
20d9: 8a8f8447               mov      cl, byte ptr [bx + 0x4784]
20dd: b8020e                 mov      ax, 0xe02
20e0: ef                     out      dx, ax
20e1: 26880d                 mov      byte ptr es:[di], cl
20e4: 26884d28               mov      byte ptr es:[di + 0x28], cl
20e8: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
20ed: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
20f2: f6d1                   not      cl
20f4: f6d4                   not      ah
20f6: ef                     out      dx, ax
20f7: 26880d                 mov      byte ptr es:[di], cl
20fa: 26884d28               mov      byte ptr es:[di + 0x28], cl
20fe: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
2103: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
2108: 32c9                   xor      cl, cl
210a: 02dd                   add      bl, ch
210c: 80fb04                 cmp      bl, 4
210f: 7233                   jb       0x2144
2111: 47                     inc      di
2112: b8020e                 mov      ax, 0xe02
2115: ef                     out      dx, ax
2116: 26880d                 mov      byte ptr es:[di], cl
2119: 26884d28               mov      byte ptr es:[di + 0x28], cl
211d: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
2122: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
2127: f6d1                   not      cl
2129: f6d4                   not      ah
212b: ef                     out      dx, ax
212c: 26880d                 mov      byte ptr es:[di], cl
212f: 26884d28               mov      byte ptr es:[di + 0x28], cl
2133: 26888d0020             mov      byte ptr es:[di + 0x2000], cl
2138: 26888d2820             mov      byte ptr es:[di + 0x2028], cl
213d: f6d1                   not      cl
213f: 80eb04                 sub      bl, 4
2142: ebc8                   jmp      0x210c
2144: a05a54                 mov      al, byte ptr [0x545a]
2147: a25b54                 mov      byte ptr [0x545b], al
214a: b8020f                 mov      ax, 0xf02
214d: ef                     out      dx, ax
214e: 8cd8                   mov      ax, ds
2150: 8ec0                   mov      es, ax
2152: c3                     ret      
2153: a28947                 mov      byte ptr [0x4789], al
2156: b800a0                 mov      ax, 0xa000
2159: 8ec0                   mov      es, ax
215b: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
215f: 57                     push     di
2160: 53                     push     bx
2161: 240f                   and      al, 0xf
2163: e8df00                 call     0x2245
2166: 5b                     pop      bx
2167: 5f                     pop      di
2168: 47                     inc      di
2169: 57                     push     di
216a: 53                     push     bx
216b: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
216f: d0e8                   shr      al, 1
2171: d0e8                   shr      al, 1
2173: d0e8                   shr      al, 1
2175: d0e8                   shr      al, 1
2177: e8d000                 call     0x224a
217a: 5b                     pop      bx
217b: 5f                     pop      di
217c: 57                     push     di
217d: 53                     push     bx
217e: e86800                 call     0x21e9
2181: 5b                     pop      bx
2182: 5f                     pop      di
2183: 47                     inc      di
2184: 57                     push     di
2185: 53                     push     bx
2186: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
218a: 240f                   and      al, 0xf
218c: e8c000                 call     0x224f
218f: 5b                     pop      bx
2190: 5f                     pop      di
2191: 47                     inc      di
2192: 57                     push     di
2193: 53                     push     bx
2194: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
2198: d0e8                   shr      al, 1
219a: d0e8                   shr      al, 1
219c: d0e8                   shr      al, 1
219e: d0e8                   shr      al, 1
21a0: 8a268947               mov      ah, byte ptr [0x4789]
21a4: 22e4                   and      ah, ah
21a6: 7802                   js       0x21aa
21a8: b0f0                   mov      al, 0xf0
21aa: e89d00                 call     0x224a
21ad: 5b                     pop      bx
21ae: 5f                     pop      di
21af: b80308                 mov      ax, 0x803
21b2: bace03                 mov      dx, 0x3ce
21b5: ef                     out      dx, ax
21b6: b0fb                   mov      al, 0xfb
21b8: 268aa5a000             mov      ah, byte ptr es:[di + 0xa0]
21bd: 268885a000             mov      byte ptr es:[di + 0xa0], al
21c2: 268aa5a020             mov      ah, byte ptr es:[di + 0x20a0]
21c7: 268885a020             mov      byte ptr es:[di + 0x20a0], al
21cc: b80300                 mov      ax, 3
21cf: ef                     out      dx, ax
21d0: 47                     inc      di
21d1: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
21d5: 240f                   and      al, 0xf
21d7: 8a268947               mov      ah, byte ptr [0x4789]
21db: 22e4                   and      ah, ah
21dd: 7802                   js       0x21e1
21df: b0f0                   mov      al, 0xf0
21e1: e86b00                 call     0x224f
21e4: 8cd8                   mov      ax, ds
21e6: 8ec0                   mov      es, ax
21e8: c3                     ret      
21e9: bace03                 mov      dx, 0x3ce
21ec: b80308                 mov      ax, 0x803
21ef: ef                     out      dx, ax
21f0: b0f7                   mov      al, 0xf7
21f2: 268a6550               mov      ah, byte ptr es:[di + 0x50]
21f6: 26884550               mov      byte ptr es:[di + 0x50], al
21fa: 268aa5c800             mov      ah, byte ptr es:[di + 0xc8]
21ff: 268885c800             mov      byte ptr es:[di + 0xc8], al
2204: 268aa55020             mov      ah, byte ptr es:[di + 0x2050]
2209: 2688855020             mov      byte ptr es:[di + 0x2050], al
220e: 268aa5c820             mov      ah, byte ptr es:[di + 0x20c8]
2213: 268885c820             mov      byte ptr es:[di + 0x20c8], al
2218: b80300                 mov      ax, 3
221b: ef                     out      dx, ax
221c: c3                     ret      
221d: b800a0                 mov      ax, 0xa000
2220: 8ec0                   mov      es, ax
2222: bfd41b                 mov      di, 0x1bd4
2225: b01c                   mov      al, 0x1c
2227: e82000                 call     0x224a
222a: b012                   mov      al, 0x12
222c: bfd71b                 mov      di, 0x1bd7
222f: e82200                 call     0x2254
2232: 8cd8                   mov      ax, ds
2234: 8ec0                   mov      es, ax
2236: c3                     ret      
2237: ac                     lodsb    al, byte ptr [si]
2238: 8936af47               mov      word ptr [0x47af], si
223c: a2b147                 mov      byte ptr [0x47b1], al
223f: b080                   mov      al, 0x80
2241: a26154                 mov      byte ptr [0x5461], al
2244: c3                     ret      
2245: 32db                   xor      bl, bl
2247: eb0d                   jmp      0x2256
2249: 90                     nop      
224a: b380                   mov      bl, 0x80
224c: eb08                   jmp      0x2256
224e: 90                     nop      
224f: b3c0                   mov      bl, 0xc0
2251: eb03                   jmp      0x2256
2253: 90                     nop      
2254: b340                   mov      bl, 0x40
2256: 8bc8                   mov      cx, ax
2258: bac403                 mov      dx, 0x3c4
225b: b80207                 mov      ax, 0x702
225e: ef                     out      dx, ax
225f: 8bc1                   mov      ax, cx
2261: b90700                 mov      cx, 7
2264: 32e4                   xor      ah, ah
2266: 0430                   add      al, 0x30
2268: 8bf0                   mov      si, ax
226a: d1e6                   shl      si, 1
226c: d1e6                   shl      si, 1
226e: d1e6                   shl      si, 1
2270: 81c62004               add      si, 0x420
2274: ac                     lodsb    al, byte ptr [si]
2275: f6d0                   not      al
2277: 32e4                   xor      ah, ah
2279: d1e0                   shl      ax, 1
227b: d1e0                   shl      ax, 1
227d: d1e0                   shl      ax, 1
227f: d1e0                   shl      ax, 1
2281: baf00f                 mov      dx, 0xff0
2284: 22db                   and      bl, bl
2286: 792a                   jns      0x22b2
2288: d1e8                   shr      ax, 1
228a: d1ea                   shr      dx, 1
228c: f6c340                 test     bl, 0x40
228f: 7504                   jne      0x2295
2291: d1e8                   shr      ax, 1
2293: d1ea                   shr      dx, 1
2295: 268b2d                 mov      bp, word ptr es:[di]
2298: 23ea                   and      bp, dx
229a: 86e0                   xchg     al, ah
229c: 0bc5                   or       ax, bp
229e: 268805                 mov      byte ptr es:[di], al
22a1: 2688850020             mov      byte ptr es:[di + 0x2000], al
22a6: 26886501               mov      byte ptr es:[di + 1], ah
22aa: 2688a50120             mov      byte ptr es:[di + 0x2001], ah
22af: eb24                   jmp      0x22d5
22b1: 90                     nop      
22b2: f6c340                 test     bl, 0x40
22b5: 7504                   jne      0x22bb
22b7: d1e0                   shl      ax, 1
22b9: d1e2                   shl      dx, 1
22bb: 268b2d                 mov      bp, word ptr es:[di]
22be: 23ea                   and      bp, dx
22c0: 86e0                   xchg     al, ah
22c2: 0bc5                   or       ax, bp
22c4: 268805                 mov      byte ptr es:[di], al
22c7: 2688850020             mov      byte ptr es:[di + 0x2000], al
22cc: 26886501               mov      byte ptr es:[di + 1], ah
22d0: 2688a50120             mov      byte ptr es:[di + 0x2001], ah
22d5: 83c728                 add      di, 0x28
22d8: e29a                   loop     0x2274
22da: 32ff                   xor      bh, bh
22dc: c3                     ret      
22dd: b8b8b8                 mov      ax, 0xb8b8
22e0: a3fb5f                 mov      word ptr [0x5ffb], ax
22e3: 32c0                   xor      al, al
22e5: a28847                 mov      byte ptr [0x4788], al
22e8: c3                     ret      
22e9: 33db                   xor      bx, bx
22eb: 8a87394b               mov      al, byte ptr [bx + 0x4b39]
22ef: 8aa73c4b               mov      ah, byte ptr [bx + 0x4b3c]
22f3: fec4                   inc      ah
22f5: 7902                   jns      0x22f9
22f7: 33c0                   xor      ax, ax
22f9: 80fc08                 cmp      ah, 8
22fc: 7203                   jb       0x2301
22fe: b8ff07                 mov      ax, 0x7ff
2301: d1e8                   shr      ax, 1
2303: d1e8                   shr      ax, 1
2305: d1e8                   shr      ax, 1
2307: f6d0                   not      al
2309: 32e4                   xor      ah, ah
230b: 8bf0                   mov      si, ax
230d: 8a84d065               mov      al, byte ptr [si + 0x65d0]
2311: d0e8                   shr      al, 1
2313: d0e8                   shr      al, 1
2315: d0e8                   shr      al, 1
2317: f6d0                   not      al
2319: 0206ce4a               add      al, byte ptr [0x4ace]
231d: d0261654               shl      byte ptr [0x5416], 1
2321: 7204                   jb       0x2327
2323: 3cb8                   cmp      al, 0xb8
2325: 7602                   jbe      0x2329
2327: b0b8                   mov      al, 0xb8
2329: 3c97                   cmp      al, 0x97
232b: 7302                   jae      0x232f
232d: b097                   mov      al, 0x97
232f: 80f301                 xor      bl, 1
2332: 8887fb5f               mov      byte ptr [bx + 0x5ffb], al
2336: 80f301                 xor      bl, 1
2339: fec3                   inc      bl
233b: 80fb02                 cmp      bl, 2
233e: 75ab                   jne      0x22eb
2340: c3                     ret      
2341: a01c4b                 mov      al, byte ptr [0x4b1c]
2344: 32e4                   xor      ah, ah
2346: 8bd8                   mov      bx, ax
2348: a01a4b                 mov      al, byte ptr [0x4b1a]
234b: 8bc8                   mov      cx, ax
234d: d1e0                   shl      ax, 1
234f: 03c1                   add      ax, cx
2351: 03c3                   add      ax, bx
2353: a21c4b                 mov      byte ptr [0x4b1c], al
2356: 22e4                   and      ah, ah
2358: 741d                   je       0x2377
235a: b401                   mov      ah, 1
235c: a06553                 mov      al, byte ptr [0x5365]
235f: 22c0                   and      al, al
2361: 7902                   jns      0x2365
2363: f6dc                   neg      ah
2365: a08847                 mov      al, byte ptr [0x4788]
2368: 02c4                   add      al, ah
236a: 7806                   js       0x2372
236c: 3c03                   cmp      al, 3
236e: 7204                   jb       0x2374
2370: 2c06                   sub      al, 6
2372: 0403                   add      al, 3
2374: a28847                 mov      byte ptr [0x4788], al
2377: c3                     ret      
2378: a0284b                 mov      al, byte ptr [0x4b28]
237b: 22c0                   and      al, al
237d: 751a                   jne      0x2399
237f: c606c04a02             mov      byte ptr [0x4ac0], 2
2384: c606ce4a92             mov      byte ptr [0x4ace], 0x92
2389: c606f24a82             mov      byte ptr [0x4af2], 0x82
238e: c606284b3c             mov      byte ptr [0x4b28], 0x3c
2393: be3b44                 mov      si, 0x443b
2396: e89efe                 call     0x2237
2399: c3                     ret      
239a: 8bc7                   mov      ax, di
239c: d1e7                   shl      di, 1
239e: 03f8                   add      di, ax
23a0: 83c706                 add      di, 6
23a3: c3                     ret      
23a4: 0000                   add      byte ptr [bx + si], al
23a6: 0000                   add      byte ptr [bx + si], al
23a8: 0000                   add      byte ptr [bx + si], al
23aa: 0000                   add      byte ptr [bx + si], al
23ac: 0000                   add      byte ptr [bx + si], al
23ae: 0000                   add      byte ptr [bx + si], al
23b0: e80e1e                 call     0x41c1
23b3: bb7f00                 mov      bx, 0x7f
23b6: c606704a00             mov      byte ptr [0x4a70], 0
23bb: c6870d5600             mov      byte ptr [bx + 0x560d], 0
23c0: e83528                 call     0x4bf8
23c3: 80fb0c                 cmp      bl, 0xc
23c6: 7304                   jae      0x23cc
23c8: 889f1956               mov      byte ptr [bx + 0x5619], bl
23cc: fecb                   dec      bl
23ce: 79eb                   jns      0x23bb
23d0: e80600                 call     0x23d9
23d3: c60626560a             mov      byte ptr [0x5626], 0xa
23d8: c3                     ret      
23d9: bb3b00                 mov      bx, 0x3b
23dc: 33c0                   xor      ax, ax
23de: a28c56                 mov      byte ptr [0x568c], al
23e1: 88873556               mov      byte ptr [bx + 0x5635], al
23e5: 80fb0c                 cmp      bl, 0xc
23e8: 7309                   jae      0x23f3
23ea: 889f6556               mov      byte ptr [bx + 0x5665], bl
23ee: c687f94c0a             mov      byte ptr [bx + 0x4cf9], 0xa
23f3: fecb                   dec      bl
23f5: 79e5                   jns      0x23dc
23f7: c3                     ret      
23f8: bb0b00                 mov      bx, 0xb
23fb: e8fa27                 call     0x4bf8
23fe: 243f                   and      al, 0x3f
2400: 0287f447               add      al, byte ptr [bx + 0x47f4]
2404: 88872956               mov      byte ptr [bx + 0x5629], al
2408: fecb                   dec      bl
240a: 79ef                   jns      0x23fb
240c: 8a1e8c56               mov      bl, byte ptr [0x568c]
2410: 32c0                   xor      al, al
2412: a26c54                 mov      byte ptr [0x546c], al
2415: 8a26aadd               mov      ah, byte ptr [0xddaa]
2419: 22e4                   and      ah, ah
241b: 7406                   je       0x2423
241d: 3a062556               cmp      al, byte ptr [0x5625]
2421: 7509                   jne      0x242c
2423: e83700                 call     0x245d
2426: e87f00                 call     0x24a8
2429: e80801                 call     0x2534
242c: a06c54                 mov      al, byte ptr [0x546c]
242f: fec0                   inc      al
2431: 3c04                   cmp      al, 4
2433: 72dd                   jb       0x2412
2435: c3                     ret      
2436: a0aadd                 mov      al, byte ptr [0xddaa]
2439: 22c0                   and      al, al
243b: 740d                   je       0x244a
243d: f6d0                   not      al
243f: 040c                   add      al, 0xc
2441: a20a4b                 mov      byte ptr [0x4b0a], al
2444: b00c                   mov      al, 0xc
2446: a2404b                 mov      byte ptr [0x4b40], al
2449: c3                     ret      
244a: 8a1e6c54               mov      bl, byte ptr [0x546c]
244e: 8a870048               mov      al, byte ptr [bx + 0x4800]
2452: a20a4b                 mov      byte ptr [0x4b0a], al
2455: 8a870448               mov      al, byte ptr [bx + 0x4804]
2459: a2404b                 mov      byte ptr [0x4b40], al
245c: c3                     ret      
245d: e8d6ff                 call     0x2436
2460: a0aadd                 mov      al, byte ptr [0xddaa]
2463: 22c0                   and      al, al
2465: 7410                   je       0x2477
2467: b00b                   mov      al, 0xb
2469: 2a068c56               sub      al, byte ptr [0x568c]
246d: a27e56                 mov      byte ptr [0x567e], al
2470: 8ae0                   mov      ah, al
2472: a0abdd                 mov      al, byte ptr [0xddab]
2475: eb29                   jmp      0x24a0
2477: 8a1e8c56               mov      bl, byte ptr [0x568c]
247b: 32ff                   xor      bh, bh
247d: 8a870848               mov      al, byte ptr [bx + 0x4808]
2481: 02060a4b               add      al, byte ptr [0x4b0a]
2485: 32e4                   xor      ah, ah
2487: 8bf8                   mov      di, ax
2489: 8a851956               mov      al, byte ptr [di + 0x5619]
248d: a27e56                 mov      byte ptr [0x567e], al
2490: 8a870e48               mov      al, byte ptr [bx + 0x480e]
2494: 02060a4b               add      al, byte ptr [0x4b0a]
2498: 8bf8                   mov      di, ax
249a: 8a851956               mov      al, byte ptr [di + 0x5619]
249e: b40b                   mov      ah, 0xb
24a0: a27f56                 mov      byte ptr [0x567f], al
24a3: 8826addd               mov      byte ptr [0xddad], ah
24a7: c3                     ret      
24a8: 33db                   xor      bx, bx
24aa: e84b27                 call     0x4bf8
24ad: 3ca0                   cmp      al, 0xa0
24af: 7202                   jb       0x24b3
24b1: b340                   mov      bl, 0x40
24b3: 881e0c4b               mov      byte ptr [0x4b0c], bl
24b7: a07e56                 mov      al, byte ptr [0x567e]
24ba: 32e4                   xor      ah, ah
24bc: 8bf8                   mov      di, ax
24be: 8a1e7f56               mov      bl, byte ptr [0x567f]
24c2: fe874d56               inc      byte ptr [bx + 0x564d]
24c6: fe854d56               inc      byte ptr [di + 0x564d]
24ca: 8bc7                   mov      ax, di
24cc: 8a266e54               mov      ah, byte ptr [0x546e]
24d0: 3a1eaddd               cmp      bl, byte ptr [0xddad]
24d4: 7409                   je       0x24df
24d6: 3a06addd               cmp      al, byte ptr [0xddad]
24da: 750a                   jne      0x24e6
24dc: 80f4c0                 xor      ah, 0xc0
24df: 88260c4b               mov      byte ptr [0x4b0c], ah
24e3: eb19                   jmp      0x24fe
24e5: 90                     nop      
24e6: 8a852956               mov      al, byte ptr [di + 0x5629]
24ea: 3a872956               cmp      al, byte ptr [bx + 0x5629]
24ee: 720e                   jb       0x24fe
24f0: 7507                   jne      0x24f9
24f2: e80327                 call     0x4bf8
24f5: d0e8                   shr      al, 1
24f7: 7205                   jb       0x24fe
24f9: 80360c4bc0             xor      byte ptr [0x4b0c], 0xc0
24fe: a00c4b                 mov      al, byte ptr [0x4b0c]
2501: d0e0                   shl      al, 1
2503: 8bc7                   mov      ax, di
2505: 7209                   jb       0x2510
2507: 8ad3                   mov      dl, bl
2509: 7809                   js       0x2514
250b: 8af3                   mov      dh, bl
250d: eb07                   jmp      0x2516
250f: 90                     nop      
2510: 8ad0                   mov      dl, al
2512: 79f7                   jns      0x250b
2514: 8af0                   mov      dh, al
2516: 8ada                   mov      bl, dl
2518: fe873556               inc      byte ptr [bx + 0x5635]
251c: 8ade                   mov      bl, dh
251e: fe874156               inc      byte ptr [bx + 0x5641]
2522: a06c54                 mov      al, byte ptr [0x546c]
2525: 3a062556               cmp      al, byte ptr [0x5625]
2529: 7508                   jne      0x2533
252b: 881e7d56               mov      byte ptr [0x567d], bl
252f: 88167c56               mov      byte ptr [0x567c], dl
2533: c3                     ret      
2534: e8fffe                 call     0x2436
2537: a00a4b                 mov      al, byte ptr [0x4b0a]
253a: 32e4                   xor      ah, ah
253c: 8bf8                   mov      di, ax
253e: a0404b                 mov      al, byte ptr [0x4b40]
2541: 2bc7                   sub      ax, di
2543: 8bc8                   mov      cx, ax
2545: 8a851956               mov      al, byte ptr [di + 0x5619]
2549: 88856556               mov      byte ptr [di + 0x5665], al
254d: 8ad8                   mov      bl, al
254f: 8a873556               mov      al, byte ptr [bx + 0x5635]
2553: d0e0                   shl      al, 1
2555: 02874156               add      al, byte ptr [bx + 0x5641]
2559: 88875956               mov      byte ptr [bx + 0x5659], al
255d: 47                     inc      di
255e: e2e5                   loop     0x2545
2560: a00a4b                 mov      al, byte ptr [0x4b0a]
2563: 32e4                   xor      ah, ah
2565: 8ad4                   mov      dl, ah
2567: 8bf8                   mov      di, ax
2569: a0404b                 mov      al, byte ptr [0x4b40]
256c: 2bc7                   sub      ax, di
256e: 8bc8                   mov      cx, ax
2570: 49                     dec      cx
2571: 8b856556               mov      ax, word ptr [di + 0x5665]
2575: 8ad8                   mov      bl, al
2577: 8ac4                   mov      al, ah
2579: 32e4                   xor      ah, ah
257b: 8bf0                   mov      si, ax
257d: 8a875956               mov      al, byte ptr [bx + 0x5659]
2581: 3a845956               cmp      al, byte ptr [si + 0x5659]
2585: 7224                   jb       0x25ab
2587: 752c                   jne      0x25b5
2589: 8a873556               mov      al, byte ptr [bx + 0x5635]
258d: 3a843556               cmp      al, byte ptr [si + 0x5635]
2591: 7218                   jb       0x25ab
2593: 7520                   jne      0x25b5
2595: a0aadd                 mov      al, byte ptr [0xddaa]
2598: 22c0                   and      al, al
259a: 7408                   je       0x25a4
259c: 8bc6                   mov      ax, si
259e: 3ad8                   cmp      bl, al
25a0: 7209                   jb       0x25ab
25a2: 7311                   jae      0x25b5
25a4: e85126                 call     0x4bf8
25a7: d0e8                   shr      al, 1
25a9: 730a                   jae      0x25b5
25ab: 8bc6                   mov      ax, si
25ad: 8ae3                   mov      ah, bl
25af: 89856556               mov      word ptr [di + 0x5665], ax
25b3: fec2                   inc      dl
25b5: 47                     inc      di
25b6: e2b9                   loop     0x2571
25b8: 22d2                   and      dl, dl
25ba: 75a4                   jne      0x2560
25bc: c3                     ret      
25bd: 3e8a02                 mov      al, byte ptr ds:[bp + si]
25c0: 45                     inc      bp
25c1: 22c0                   and      al, al
25c3: c3                     ret      
25c4: 22d2                   and      dl, dl
25c6: 780b                   js       0x25d3
25c8: f6c240                 test     dl, 0x40
25cb: 7503                   jne      0x25d0
25cd: 0410                   add      al, 0x10
25cf: c3                     ret      
25d0: 0401                   add      al, 1
25d2: c3                     ret      
25d3: f6c240                 test     dl, 0x40
25d6: 7503                   jne      0x25db
25d8: 2c10                   sub      al, 0x10
25da: c3                     ret      
25db: 2c01                   sub      al, 1
25dd: c3                     ret      
25de: 32ff                   xor      bh, bh
25e0: 8bfb                   mov      di, bx
25e2: d1e7                   shl      di, 1
25e4: 8bb520b2               mov      si, word ptr [di - 0x4de0]
25e8: 33ed                   xor      bp, bp
25ea: e8d0ff                 call     0x25bd
25ed: 3e88867056             mov      byte ptr ds:[bp + 0x5670], al
25f2: 83fd04                 cmp      bp, 4
25f5: 75f3                   jne      0x25ea
25f7: e8c3ff                 call     0x25bd
25fa: a20c4b                 mov      byte ptr [0x4b0c], al
25fd: a20e4b                 mov      byte ptr [0x4b0e], al
2600: e8baff                 call     0x25bd
2603: a20d4b                 mov      byte ptr [0x4b0d], al
2606: a20f4b                 mov      byte ptr [0x4b0f], al
2609: 8adf                   mov      bl, bh
260b: 883e8d4b               mov      byte ptr [0x4b8d], bh
260f: c706324b0000           mov      word ptr [0x4b32], 0
2615: 883eba4a               mov      byte ptr [0x4aba], bh
2619: 8026ba4aff             and      byte ptr [0x4aba], 0xff
261e: 741d                   je       0x263d
2620: fe0eba4a               dec      byte ptr [0x4aba]
2624: 8a16084b               mov      dl, byte ptr [0x4b08]
2628: 8897ad5a               mov      byte ptr [bx + 0x5aad], dl
262c: f6c210                 test     dl, 0x10
262f: 7403                   je       0x2634
2631: 80f2c0                 xor      dl, 0xc0
2634: a0e24a                 mov      al, byte ptr [0x4ae2]
2637: e88aff                 call     0x25c4
263a: eb29                   jmp      0x2665
263c: 90                     nop      
263d: e87dff                 call     0x25bd
2640: 8ad0                   mov      dl, al
2642: 8887ad5a               mov      byte ptr [bx + 0x5aad], al
2646: 240f                   and      al, 0xf
2648: 3c0f                   cmp      al, 0xf
264a: 750f                   jne      0x265b
264c: 8ac2                   mov      al, dl
264e: d0e8                   shr      al, 1
2650: d0e8                   shr      al, 1
2652: d0e8                   shr      al, 1
2654: d0e8                   shr      al, 1
2656: a2ba4a                 mov      byte ptr [0x4aba], al
2659: ebbe                   jmp      0x2619
265b: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
265f: a2084b                 mov      byte ptr [0x4b08], al
2662: e858ff                 call     0x25bd
2665: 8887fb5a               mov      byte ptr [bx + 0x5afb], al
2669: a2e24a                 mov      byte ptr [0x4ae2], al
266c: 8a368d4b               mov      dh, byte ptr [0x4b8d]
2670: d0ee                   shr      dh, 1
2672: d0ee                   shr      dh, 1
2674: d0de                   rcr      dh, 1
2676: 8ac2                   mov      al, dl
2678: 240f                   and      al, 0xf
267a: 3c0c                   cmp      al, 0xc
267c: 7218                   jb       0x2696
267e: 32e4                   xor      ah, ah
2680: 8bf8                   mov      di, ax
2682: 80a7ad5af0             and      byte ptr [bx + 0x5aad], 0xf0
2687: 8a85e447               mov      al, byte ptr [di + 0x47e4]
268b: 8887495b               mov      byte ptr [bx + 0x5b49], al
268f: 8a85e647               mov      al, byte ptr [di + 0x47e6]
2693: eb17                   jmp      0x26ac
2695: 90                     nop      
2696: e824ff                 call     0x25bd
2699: 8887495b               mov      byte ptr [bx + 0x5b49], al
269d: f6c220                 test     dl, 0x20
26a0: 7407                   je       0x26a9
26a2: 8a87495b               mov      al, byte ptr [bx + 0x5b49]
26a6: eb04                   jmp      0x26ac
26a8: 90                     nop      
26a9: e811ff                 call     0x25bd
26ac: 247f                   and      al, 0x7f
26ae: 0ac6                   or       al, dh
26b0: 8887975b               mov      byte ptr [bx + 0x5b97], al
26b4: 55                     push     bp
26b5: a1324b                 mov      ax, word ptr [0x4b32]
26b8: d1e0                   shl      ax, 1
26ba: d1e0                   shl      ax, 1
26bc: d1e0                   shl      ax, 1
26be: d1e0                   shl      ax, 1
26c0: d1e0                   shl      ax, 1
26c2: 88a76b5d               mov      byte ptr [bx + 0x5d6b], ah
26c6: 88871d5d               mov      byte ptr [bx + 0x5d1d], al
26ca: 55                     push     bp
26cb: e8c10a                 call     0x318f
26ce: 5d                     pop      bp
26cf: a08d4b                 mov      al, byte ptr [0x4b8d]
26d2: 02061f4b               add      al, byte ptr [0x4b1f]
26d6: 2402                   and      al, 2
26d8: 00068d4b               add      byte ptr [0x4b8d], al
26dc: a1324b                 mov      ax, word ptr [0x4b32]
26df: 8a0e774b               mov      cl, byte ptr [0x4b77]
26e3: 32ed                   xor      ch, ch
26e5: 03c1                   add      ax, cx
26e7: a3324b                 mov      word ptr [0x4b32], ax
26ea: 33ed                   xor      bp, bp
26ec: e86201                 call     0x2851
26ef: 8ad0                   mov      dl, al
26f1: a10c4b                 mov      ax, word ptr [0x4b0c]
26f4: 2ac6                   sub      al, dh
26f6: 8887e55b               mov      byte ptr [bx + 0x5be5], al
26fa: 1ae2                   sbb      ah, dl
26fc: 88a7335c               mov      byte ptr [bx + 0x5c33], ah
2700: a0774b                 mov      al, byte ptr [0x4b77]
2703: 32e4                   xor      ah, ah
2705: 8be8                   mov      bp, ax
2707: e84701                 call     0x2851
270a: 8ad0                   mov      dl, al
270c: 8a87e55b               mov      al, byte ptr [bx + 0x5be5]
2710: 02c6                   add      al, dh
2712: 8aa7335c               mov      ah, byte ptr [bx + 0x5c33]
2716: 12e2                   adc      ah, dl
2718: a30c4b                 mov      word ptr [0x4b0c], ax
271b: 33ed                   xor      bp, bp
271d: e85a01                 call     0x287a
2720: 8ad0                   mov      dl, al
2722: a00e4b                 mov      al, byte ptr [0x4b0e]
2725: 2ac6                   sub      al, dh
2727: 8887815c               mov      byte ptr [bx + 0x5c81], al
272b: a00f4b                 mov      al, byte ptr [0x4b0f]
272e: 1ac2                   sbb      al, dl
2730: 8887cf5c               mov      byte ptr [bx + 0x5ccf], al
2734: a0774b                 mov      al, byte ptr [0x4b77]
2737: 32e4                   xor      ah, ah
2739: 8be8                   mov      bp, ax
273b: e83c01                 call     0x287a
273e: 8ad0                   mov      dl, al
2740: 8a87815c               mov      al, byte ptr [bx + 0x5c81]
2744: 02c6                   add      al, dh
2746: 8aa7cf5c               mov      ah, byte ptr [bx + 0x5ccf]
274a: 12e2                   adc      ah, dl
274c: a30e4b                 mov      word ptr [0x4b0e], ax
274f: 5d                     pop      bp
2750: fec3                   inc      bl
2752: 3a1e7156               cmp      bl, byte ptr [0x5671]
2756: 7403                   je       0x275b
2758: e9befe                 jmp      0x2619
275b: 8a1e7356               mov      bl, byte ptr [0x5673]
275f: fec3                   inc      bl
2761: 3a1e7156               cmp      bl, byte ptr [0x5671]
2765: 7202                   jb       0x2769
2767: 32db                   xor      bl, bl
2769: 881e8956               mov      byte ptr [0x5689], bl
276d: a1324b                 mov      ax, word ptr [0x4b32]
2770: d1e0                   shl      ax, 1
2772: d1e0                   shl      ax, 1
2774: d1e0                   shl      ax, 1
2776: d1e0                   shl      ax, 1
2778: d1e0                   shl      ax, 1
277a: a37456                 mov      word ptr [0x5674], ax
277d: 33db                   xor      bx, bx
277f: e83bfe                 call     0x25bd
2782: 88878156               mov      byte ptr [bx + 0x5681], al
2786: fec3                   inc      bl
2788: 80fb06                 cmp      bl, 6
278b: 75f2                   jne      0x277f
278d: 80268556ff             and      byte ptr [0x5685], 0xff
2792: 7418                   je       0x27ac
2794: 32db                   xor      bl, bl
2796: e824fe                 call     0x25bd
2799: 88870f4c               mov      byte ptr [bx + 0x4c0f], al
279d: e81dfe                 call     0x25bd
27a0: 88871a4c               mov      byte ptr [bx + 0x4c1a], al
27a4: fec3                   inc      bl
27a6: 3a1e8556               cmp      bl, byte ptr [0x5685]
27aa: 75ea                   jne      0x2796
27ac: 80268656ff             and      byte ptr [0x5686], 0xff
27b1: 7411                   je       0x27c4
27b3: 32db                   xor      bl, bl
27b5: e805fe                 call     0x25bd
27b8: 88879c53               mov      byte ptr [bx + 0x539c], al
27bc: fec3                   inc      bl
27be: 3a1e8656               cmp      bl, byte ptr [0x5686]
27c2: 75f1                   jne      0x27b5
27c4: e87738                 call     0x603e
27c7: c606ba4a00             mov      byte ptr [0x4aba], 0
27cc: b67c                   mov      dh, 0x7c
27ce: c606574b02             mov      byte ptr [0x4b57], 2
27d3: eb6f                   jmp      0x2844
27d5: 90                     nop      
27d6: a08556                 mov      al, byte ptr [0x5685]
27d9: 32e4                   xor      ah, ah
27db: 8bf8                   mov      di, ax
27dd: eb07                   jmp      0x27e6
27df: 90                     nop      
27e0: 3a9d0f4c               cmp      bl, byte ptr [di + 0x4c0f]
27e4: 7406                   je       0x27ec
27e6: 4f                     dec      di
27e7: 79f7                   jns      0x27e0
27e9: eb1c                   jmp      0x2807
27eb: 90                     nop      
27ec: 8a851a4c               mov      al, byte ptr [di + 0x4c1a]
27f0: 8887c14b               mov      byte ptr [bx + 0x4bc1], al
27f4: 22c0                   and      al, al
27f6: 7908                   jns      0x2800
27f8: c606ba4a03             mov      byte ptr [0x4aba], 3
27fd: bf0300                 mov      di, 3
2800: 247f                   and      al, 0x7f
2802: 8af0                   mov      dh, al
2804: eb3a                   jmp      0x2840
2806: 90                     nop      
2807: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
280b: 240f                   and      al, 0xf
280d: 98                     cwde     
280e: 8bf8                   mov      di, ax
2810: 8a8540b2               mov      al, byte ptr [di - 0x4dc0]
2814: 22c0                   and      al, al
2816: 790a                   jns      0x2822
2818: a01cc0                 mov      al, byte ptr [0xc01c]
281b: 8af0                   mov      dh, al
281d: 80ee0a                 sub      dh, 0xa
2820: eb0a                   jmp      0x282c
2822: 8ac6                   mov      al, dh
2824: 040a                   add      al, 0xa
2826: 7802                   js       0x282a
2828: 8af0                   mov      dh, al
282a: 8ac6                   mov      al, dh
282c: 8b3eba4a               mov      di, word ptr [0x4aba]
2830: 81e7ff00               and      di, 0xff
2834: 7406                   je       0x283c
2836: fe0eba4a               dec      byte ptr [0x4aba]
283a: 0c80                   or       al, 0x80
283c: 8887c14b               mov      byte ptr [bx + 0x4bc1], al
2840: fecb                   dec      bl
2842: 7992                   jns      0x27d6
2844: 8a1e7156               mov      bl, byte ptr [0x5671]
2848: fecb                   dec      bl
284a: fe0e574b               dec      byte ptr [0x4b57]
284e: 7586                   jne      0x27d6
2850: c3                     ret      
2851: 56                     push     si
2852: 8b364e4b               mov      si, word ptr [0x4b4e]
2856: a0594b                 mov      al, byte ptr [0x4b59]
2859: 22c0                   and      al, al
285b: 790e                   jns      0x286b
285d: d1e5                   shl      bp, 1
285f: 45                     inc      bp
2860: 3e8a32                 mov      dh, byte ptr ds:[bp + si]
2863: 4d                     dec      bp
2864: 3e8a02                 mov      al, byte ptr ds:[bp + si]
2867: 247f                   and      al, 0x7f
2869: 5e                     pop      si
286a: c3                     ret      
286b: 3e8a32                 mov      dh, byte ptr ds:[bp + si]
286e: d0e6                   shl      dh, 1
2870: 80e6e0                 and      dh, 0xe0
2873: 3e8a02                 mov      al, byte ptr ds:[bp + si]
2876: 240f                   and      al, 0xf
2878: 5e                     pop      si
2879: c3                     ret      
287a: 56                     push     si
287b: 8b36804b               mov      si, word ptr [0x4b80]
287f: a0594b                 mov      al, byte ptr [0x4b59]
2882: 22c0                   and      al, al
2884: 790e                   jns      0x2894
2886: d1e5                   shl      bp, 1
2888: 45                     inc      bp
2889: 3e8a32                 mov      dh, byte ptr ds:[bp + si]
288c: 4d                     dec      bp
288d: 3e8a02                 mov      al, byte ptr ds:[bp + si]
2890: 247f                   and      al, 0x7f
2892: 5e                     pop      si
2893: c3                     ret      
2894: 3e8a32                 mov      dh, byte ptr ds:[bp + si]
2897: d0e6                   shl      dh, 1
2899: 80e6e0                 and      dh, 0xe0
289c: 3e8a02                 mov      al, byte ptr ds:[bp + si]
289f: 240f                   and      al, 0xf
28a1: 5e                     pop      si
28a2: c3                     ret      
28a3: 8a1ee14a               mov      bl, byte ptr [0x4ae1]
28a7: 32ff                   xor      bh, bh
28a9: 22db                   and      bl, bl
28ab: 742e                   je       0x28db
28ad: 80fbe6                 cmp      bl, 0xe6
28b0: 7218                   jb       0x28ca
28b2: b02c                   mov      al, 0x2c
28b4: 80267b54ff             and      byte ptr [0x547b], 0xff
28b9: 7902                   jns      0x28bd
28bb: f6d8                   neg      al
28bd: a2ec54                 mov      byte ptr [0x54ec], al
28c0: c6068a4b00             mov      byte ptr [0x4b8a], 0
28c5: fe0ee14a               dec      byte ptr [0x4ae1]
28c9: c3                     ret      
28ca: 80fbe5                 cmp      bl, 0xe5
28cd: 750d                   jne      0x28dc
28cf: 32e4                   xor      ah, ah
28d1: e8cd00                 call     0x29a1
28d4: b003                   mov      al, 3
28d6: e89800                 call     0x2971
28d9: 79ea                   jns      0x28c5
28db: c3                     ret      
28dc: 80fbe4                 cmp      bl, 0xe4
28df: 7531                   jne      0x2912
28e1: b004                   mov      al, 4
28e3: e88b00                 call     0x2971
28e6: b4ff                   mov      ah, 0xff
28e8: e8b600                 call     0x29a1
28eb: 75ee                   jne      0x28db
28ed: e80823                 call     0x4bf8
28f0: 241f                   and      al, 0x1f
28f2: 04a0                   add      al, 0xa0
28f4: be6043                 mov      si, 0x4360
28f7: 8a268954               mov      ah, byte ptr [0x5489]
28fb: 22e4                   and      ah, ah
28fd: 7903                   jns      0x2902
28ff: be6044                 mov      si, 0x4460
2902: 8a267956               mov      ah, byte ptr [0x5679]
2906: 22e4                   and      ah, ah
2908: 7802                   js       0x290c
290a: b08c                   mov      al, 0x8c
290c: a2e14a                 mov      byte ptr [0x4ae1], al
290f: e925f9                 jmp      0x2237
2912: 32e4                   xor      ah, ah
2914: e88a00                 call     0x29a1
2917: b002                   mov      al, 2
2919: e85500                 call     0x2971
291c: 8026494bff             and      byte ptr [0x4b49], 0xff
2921: 780a                   js       0x292d
2923: fe0ee14a               dec      byte ptr [0x4ae1]
2927: 7504                   jne      0x292d
2929: fe06e14a               inc      byte ptr [0x4ae1]
292d: 80268954ff             and      byte ptr [0x5489], 0xff
2932: 7508                   jne      0x293c
2934: 8026e14aff             and      byte ptr [0x4ae1], 0xff
2939: 7908                   jns      0x2943
293b: c3                     ret      
293c: a0a554                 mov      al, byte ptr [0x54a5]
293f: 22c0                   and      al, al
2941: 7510                   jne      0x2953
2943: 32c0                   xor      al, al
2945: a2e14a                 mov      byte ptr [0x4ae1], al
2948: a2274b                 mov      byte ptr [0x4b27], al
294b: a26154                 mov      byte ptr [0x5461], al
294e: b080                   mov      al, 0x80
2950: a28954                 mov      byte ptr [0x5489], al
2953: c3                     ret      
2954: 8ad8                   mov      bl, al
2956: 32ff                   xor      bh, bh
2958: 8a870b43               mov      al, byte ptr [bx + 0x430b]
295c: a28a56                 mov      byte ptr [0x568a], al
295f: a02756                 mov      al, byte ptr [0x5627]
2962: 22c0                   and      al, al
2964: 7403                   je       0x2969
2966: 80f301                 xor      bl, 1
2969: 8a871343               mov      al, byte ptr [bx + 0x4313]
296d: a27856                 mov      byte ptr [0x5678], al
2970: c3                     ret      
2971: 8ad0                   mov      dl, al
2973: a0f84a                 mov      al, byte ptr [0x4af8]
2976: 8a26214b               mov      ah, byte ptr [0x4b21]
297a: 2b066954               sub      ax, word ptr [0x5469]
297e: 2ae2                   sub      ah, dl
2980: 8ad4                   mov      dl, ah
2982: d1f8                   sar      ax, 1
2984: d1f8                   sar      ax, 1
2986: d1f8                   sar      ax, 1
2988: fecc                   dec      ah
298a: 7908                   jns      0x2994
298c: 80fcfe                 cmp      ah, 0xfe
298f: 7303                   jae      0x2994
2991: b800fe                 mov      ax, 0xfe00
2994: 28067d53               sub      byte ptr [0x537d], al
2998: 18268053               sbb      byte ptr [0x5380], ah
299c: 8ac2                   mov      al, dl
299e: 0402                   add      al, 2
29a0: c3                     ret      
29a1: b010                   mov      al, 0x10
29a3: 80267b54ff             and      byte ptr [0x547b], 0xff
29a8: 7904                   jns      0x29ae
29aa: f6dc                   neg      ah
29ac: f6d8                   neg      al
29ae: a2064b                 mov      byte ptr [0x4b06], al
29b1: 32c0                   xor      al, al
29b3: e8af12                 call     0x3c65
29b6: 8bd0                   mov      dx, ax
29b8: a16c4b                 mov      ax, word ptr [0x4b6c]
29bb: d1e0                   shl      ax, 1
29bd: d1e0                   shl      ax, 1
29bf: d1e0                   shl      ax, 1
29c1: d1e0                   shl      ax, 1
29c3: d1e0                   shl      ax, 1
29c5: 8bc8                   mov      cx, ax
29c7: a0ec54                 mov      al, byte ptr [0x54ec]
29ca: 3a06064b               cmp      al, byte ptr [0x4b06]
29ce: 7408                   je       0x29d8
29d0: 00168a4b               add      byte ptr [0x4b8a], dl
29d4: 1036ec54               adc      byte ptr [0x54ec], dh
29d8: a08a4b                 mov      al, byte ptr [0x4b8a]
29db: 8a26ec54               mov      ah, byte ptr [0x54ec]
29df: 2bc1                   sub      ax, cx
29e1: a22f53                 mov      byte ptr [0x532f], al
29e4: 88263253               mov      byte ptr [0x5332], ah
29e8: c7065a530000           mov      word ptr [0x535a], 0
29ee: a0ec54                 mov      al, byte ptr [0x54ec]
29f1: 3a06064b               cmp      al, byte ptr [0x4b06]
29f5: c3                     ret      
29f6: bb0200                 mov      bx, 2
29f9: 8bfb                   mov      di, bx
29fb: 8a85254c               mov      al, byte ptr [di + 0x4c25]
29ff: 8aa54d4c               mov      ah, byte ptr [di + 0x4c4d]
2a03: 80fb02                 cmp      bl, 2
2a06: 7502                   jne      0x2a0a
2a08: f7d8                   neg      ax
2a0a: 8bd0                   mov      dx, ax
2a0c: a07b54                 mov      al, byte ptr [0x547b]
2a0f: 22c0                   and      al, al
2a11: b8a000                 mov      ax, 0xa0
2a14: 7902                   jns      0x2a18
2a16: f7d8                   neg      ax
2a18: f7ea                   imul     dx
2a1a: 22c0                   and      al, al
2a1c: 8ac4                   mov      al, ah
2a1e: 8ae2                   mov      ah, dl
2a20: 7405                   je       0x2a27
2a22: 22f6                   and      dh, dh
2a24: 7901                   jns      0x2a27
2a26: 40                     inc      ax
2a27: 99                     cdq      
2a28: d1e0                   shl      ax, 1
2a2a: d0d2                   rcl      dl, 1
2a2c: d1e0                   shl      ax, 1
2a2e: d0d2                   rcl      dl, 1
2a30: d1e0                   shl      ax, 1
2a32: d0d2                   rcl      dl, 1
2a34: 00870c53               add      byte ptr [bx + 0x530c], al
2a38: 10a70f53               adc      byte ptr [bx + 0x530f], ah
2a3c: 10971253               adc      byte ptr [bx + 0x5312], dl
2a40: bf0300                 mov      di, 3
2a43: 80eb02                 sub      bl, 2
2a46: 79b3                   jns      0x29fb
2a48: c3                     ret      
2a49: b01f                   mov      al, 0x1f
2a4b: e8b2d8                 call     0x300
2a4e: 8ac3                   mov      al, bl
2a50: e8add8                 call     0x300
2a53: 8ac4                   mov      al, ah
2a55: e9a8d8                 jmp      0x300
2a58: e88aee                 call     0x18e5
2a5b: bffe00                 mov      di, 0xfe
2a5e: be7777                 mov      si, 0x7777
2a61: e875ed                 call     0x17d9
2a64: b8020f                 mov      ax, 0xf02
2a67: bac403                 mov      dx, 0x3c4
2a6a: ef                     out      dx, ax
2a6b: bfd514                 mov      di, 0x14d5
2a6e: a10a00                 mov      ax, word ptr [0xa]
2a71: 8ec0                   mov      es, ax
2a73: 33c0                   xor      ax, ax
2a75: b90b00                 mov      cx, 0xb
2a78: f3aa                   rep stosb byte ptr es:[di], al
2a7a: 8cd8                   mov      ax, ds
2a7c: 8ec0                   mov      es, ax
2a7e: c606bd02ff             mov      byte ptr [0x2bd], 0xff
2a83: b3e0                   mov      bl, 0xe0
2a85: e80eea                 call     0x1496
2a88: c606bd0200             mov      byte ptr [0x2bd], 0
2a8d: b30e                   mov      bl, 0xe
2a8f: b410                   mov      ah, 0x10
2a91: e8b5ff                 call     0x2a49
2a94: b03e                   mov      al, 0x3e
2a96: e867d8                 call     0x300
2a99: b364                   mov      bl, 0x64
2a9b: b4bd                   mov      ah, 0xbd
2a9d: b00b                   mov      al, 0xb
2a9f: 2a06aadd               sub      al, byte ptr [0xddaa]
2aa3: d0e0                   shl      al, 1
2aa5: d0e0                   shl      al, 1
2aa7: d0e0                   shl      al, 1
2aa9: d0e0                   shl      al, 1
2aab: a2bd4a                 mov      byte ptr [0x4abd], al
2aae: d02e6648               shr      byte ptr [0x4866], 1
2ab2: 32db                   xor      bl, bl
2ab4: 8ae3                   mov      ah, bl
2ab6: 0226bd4a               add      ah, byte ptr [0x4abd]
2aba: e8f2d9                 call     0x4af
2abd: 803ebd4ac0             cmp      byte ptr [0x4abd], 0xc0
2ac2: 7515                   jne      0x2ad9
2ac4: 3cfd                   cmp      al, 0xfd
2ac6: 7508                   jne      0x2ad0
2ac8: c606664880             mov      byte ptr [0x4866], 0x80
2acd: eb64                   jmp      0x2b33
2acf: 90                     nop      
2ad0: 3cfe                   cmp      al, 0xfe
2ad2: 7505                   jne      0x2ad9
2ad4: e82f04                 call     0x2f06
2ad7: ebdb                   jmp      0x2ab4
2ad9: 3c0d                   cmp      al, 0xd
2adb: 7440                   je       0x2b1d
2add: 3c20                   cmp      al, 0x20
2adf: 7504                   jne      0x2ae5
2ae1: 22db                   and      bl, bl
2ae3: 74cf                   je       0x2ab4
2ae5: 3c7f                   cmp      al, 0x7f
2ae7: 7509                   jne      0x2af2
2ae9: fecb                   dec      bl
2aeb: 78c5                   js       0x2ab2
2aed: e810d8                 call     0x300
2af0: ebc2                   jmp      0x2ab4
2af2: 3c80                   cmp      al, 0x80
2af4: 73be                   jae      0x2ab4
2af6: 3a1e1448               cmp      bl, byte ptr [0x4814]
2afa: 73b8                   jae      0x2ab4
2afc: e801d8                 call     0x300
2aff: 8ad4                   mov      dl, ah
2b01: 32f6                   xor      dh, dh
2b03: 8bf2                   mov      si, dx
2b05: 8884d16e               mov      byte ptr [si + 0x6ed1], al
2b09: fec3                   inc      bl
2b0b: eba7                   jmp      0x2ab4
2b0d: 8884d16e               mov      byte ptr [si + 0x6ed1], al
2b11: 46                     inc      si
2b12: fec3                   inc      bl
2b14: 3a1e1448               cmp      bl, byte ptr [0x4814]
2b18: 75f3                   jne      0x2b0d
2b1a: eb17                   jmp      0x2b33
2b1c: 90                     nop      
2b1d: 3a1e1448               cmp      bl, byte ptr [0x4814]
2b21: 7410                   je       0x2b33
2b23: 021ebd4a               add      bl, byte ptr [0x4abd]
2b27: 32ff                   xor      bh, bh
2b29: 8bf3                   mov      si, bx
2b2b: 2a1ebd4a               sub      bl, byte ptr [0x4abd]
2b2f: b020                   mov      al, 0x20
2b31: ebda                   jmp      0x2b0d
2b33: e9f2ea                 jmp      0x1628
2b36: fecc                   dec      ah
2b38: 8826e34a               mov      byte ptr [0x4ae3], ah
2b3c: 881ee24a               mov      byte ptr [0x4ae2], bl
2b40: a2be4a                 mov      byte ptr [0x4abe], al
2b43: e861e9                 call     0x14a7
2b46: 32db                   xor      bl, bl
2b48: 881ec14a               mov      byte ptr [0x4ac1], bl
2b4c: c606bd02ee             mov      byte ptr [0x2bd], 0xee
2b51: e84be8                 call     0x139f
2b54: c606cb4a00             mov      byte ptr [0x4acb], 0
2b59: bfce00                 mov      di, 0xce
2b5c: b9050d                 mov      cx, 0xd05
2b5f: 80263348ff             and      byte ptr [0x4833], 0xff
2b64: 7406                   je       0x2b6c
2b66: bfae00                 mov      di, 0xae
2b69: b9050b                 mov      cx, 0xb05
2b6c: 8a26cb4a               mov      ah, byte ptr [0x4acb]
2b70: 8826c94a               mov      byte ptr [0x4ac9], ah
2b74: 3a26be4a               cmp      ah, byte ptr [0x4abe]
2b78: 750f                   jne      0x2b89
2b7a: b044                   mov      al, 0x44
2b7c: 8a26c14a               mov      ah, byte ptr [0x4ac1]
2b80: 22e4                   and      ah, ah
2b82: 7502                   jne      0x2b86
2b84: b0ee                   mov      al, 0xee
2b86: a23643                 mov      byte ptr [0x4336], al
2b89: a03643                 mov      al, byte ptr [0x4336]
2b8c: 8ae0                   mov      ah, al
2b8e: 8bf0                   mov      si, ax
2b90: 57                     push     di
2b91: 51                     push     cx
2b92: e844ec                 call     0x17d9
2b95: fe06cb4a               inc      byte ptr [0x4acb]
2b99: c606364377             mov      byte ptr [0x4336], 0x77
2b9e: b01f                   mov      al, 0x1f
2ba0: e85dd7                 call     0x300
2ba3: 59                     pop      cx
2ba4: 51                     push     cx
2ba5: 8ac1                   mov      al, cl
2ba7: e856d7                 call     0x300
2baa: 59                     pop      cx
2bab: 51                     push     cx
2bac: 8ac5                   mov      al, ch
2bae: e84fd7                 call     0x300
2bb1: c606bd0200             mov      byte ptr [0x2bd], 0
2bb6: a0c94a                 mov      al, byte ptr [0x4ac9]
2bb9: fec0                   inc      al
2bbb: e811f3                 call     0x1ecf
2bbe: b02e                   mov      al, 0x2e
2bc0: e83dd7                 call     0x300
2bc3: b020                   mov      al, 0x20
2bc5: e838d7                 call     0x300
2bc8: a0c94a                 mov      al, byte ptr [0x4ac9]
2bcb: 0206e24a               add      al, byte ptr [0x4ae2]
2bcf: 32e4                   xor      ah, ah
2bd1: 8bf8                   mov      di, ax
2bd3: 8a9dd047               mov      bl, byte ptr [di + 0x47d0]
2bd7: e8c5e7                 call     0x139f
2bda: 59                     pop      cx
2bdb: 5f                     pop      di
2bdc: 80c503                 add      ch, 3
2bdf: 83c730                 add      di, 0x30
2be2: a0e24a                 mov      al, byte ptr [0x4ae2]
2be5: 3c18                   cmp      al, 0x18
2be7: 750c                   jne      0x2bf5
2be9: a0c94a                 mov      al, byte ptr [0x4ac9]
2bec: fec0                   inc      al
2bee: 57                     push     di
2bef: 51                     push     cx
2bf0: e8dcf2                 call     0x1ecf
2bf3: 59                     pop      cx
2bf4: 5f                     pop      di
2bf5: a0e34a                 mov      al, byte ptr [0x4ae3]
2bf8: 3a06c94a               cmp      al, byte ptr [0x4ac9]
2bfc: 722c                   jb       0x2c2a
2bfe: a0e24a                 mov      al, byte ptr [0x4ae2]
2c01: 3c1c                   cmp      al, 0x1c
2c03: 7403                   je       0x2c08
2c05: e964ff                 jmp      0x2b6c
2c08: 57                     push     di
2c09: 51                     push     cx
2c0a: b323                   mov      bl, 0x23
2c0c: e887e8                 call     0x1496
2c0f: a0b0dd                 mov      al, byte ptr [0xddb0]
2c12: d0e0                   shl      al, 1
2c14: 0206c94a               add      al, byte ptr [0x4ac9]
2c18: 32e4                   xor      ah, ah
2c1a: 8bf8                   mov      di, ax
2c1c: 8a9d0b43               mov      bl, byte ptr [di + 0x430b]
2c20: 32c0                   xor      al, al
2c22: e842ec                 call     0x1867
2c25: 59                     pop      cx
2c26: 5f                     pop      di
2c27: e942ff                 jmp      0x2b6c
2c2a: 8026c14aff             and      byte ptr [0x4ac1], 0xff
2c2f: 740d                   je       0x2c3e
2c31: e8f4e9                 call     0x1628
2c34: bf0700                 mov      di, 7
2c37: e86900                 call     0x2ca3
2c3a: a0be4a                 mov      al, byte ptr [0x4abe]
2c3d: c3                     ret      
2c3e: e8db0f                 call     0x3c1c
2c41: 22c0                   and      al, al
2c43: 75f9                   jne      0x2c3e
2c45: bf0200                 mov      di, 2
2c48: e85800                 call     0x2ca3
2c4b: e8ce0f                 call     0x3c1c
2c4e: 2410                   and      al, 0x10
2c50: a2c14a                 mov      byte ptr [0x4ac1], al
2c53: 7403                   je       0x2c58
2c55: e9fcfe                 jmp      0x2b54
2c58: a0b108                 mov      al, byte ptr [0x8b1]
2c5b: 2c02                   sub      al, 2
2c5d: 720e                   jb       0x2c6d
2c5f: 8a1ee34a               mov      bl, byte ptr [0x4ae3]
2c63: fec3                   inc      bl
2c65: 3ac3                   cmp      al, bl
2c67: 7704                   ja       0x2c6d
2c69: 8ad8                   mov      bl, al
2c6b: eb1f                   jmp      0x2c8c
2c6d: 8a1ebe4a               mov      bl, byte ptr [0x4abe]
2c71: a0234b                 mov      al, byte ptr [0x4b23]
2c74: 2403                   and      al, 3
2c76: 74d3                   je       0x2c4b
2c78: 2401                   and      al, 1
2c7a: 7408                   je       0x2c84
2c7c: fecb                   dec      bl
2c7e: 790c                   jns      0x2c8c
2c80: 32db                   xor      bl, bl
2c82: 7408                   je       0x2c8c
2c84: 3a1ee34a               cmp      bl, byte ptr [0x4ae3]
2c88: 7702                   ja       0x2c8c
2c8a: fec3                   inc      bl
2c8c: 881ebe4a               mov      byte ptr [0x4abe], bl
2c90: bada03                 mov      dx, 0x3da
2c93: ec                     in       al, dx
2c94: 2408                   and      al, 8
2c96: 75fb                   jne      0x2c93
2c98: ec                     in       al, dx
2c99: 2408                   and      al, 8
2c9b: 74fb                   je       0x2c98
2c9d: e9b4fe                 jmp      0x2b54
2ca0: bf1400                 mov      di, 0x14
2ca3: 8bcf                   mov      cx, di
2ca5: 2ec6064da600           mov      byte ptr cs:[0xa64d], 0
2cab: 2e80264da6ff           and      byte ptr cs:[0xa64d], 0xff
2cb1: 74f8                   je       0x2cab
2cb3: e2f0                   loop     0x2ca5
2cb5: c3                     ret      
2cb6: 22c0                   and      al, al
2cb8: 7505                   jne      0x2cbf
2cba: e84a66                 call     0x9307
2cbd: eb2c                   jmp      0x2ceb
2cbf: e81166                 call     0x92d3
2cc2: 3c02                   cmp      al, 2
2cc4: 7325                   jae      0x2ceb
2cc6: a27956                 mov      byte ptr [0x5679], al
2cc9: c606b1dd01             mov      byte ptr [0xddb1], 1
2cce: 8a26b0dd               mov      ah, byte ptr [0xddb0]
2cd2: d0e4                   shl      ah, 1
2cd4: 02c4                   add      al, ah
2cd6: 8ad8                   mov      bl, al
2cd8: e879fc                 call     0x2954
2cdb: ebc3                   jmp      0x2ca0
2cdd: 32c0                   xor      al, al
2cdf: e8990f                 call     0x3c7b
2ce2: c606795680             mov      byte ptr [0x5679], 0x80
2ce7: c3                     ret      
2ce8: e8b5ff                 call     0x2ca0
2ceb: a0b1dd                 mov      al, byte ptr [0xddb1]
2cee: 22c0                   and      al, al
2cf0: 75cd                   jne      0x2cbf
2cf2: b001                   mov      al, 1
2cf4: 8a1e7956               mov      bl, byte ptr [0x5679]
2cf8: 22db                   and      bl, bl
2cfa: 7902                   jns      0x2cfe
2cfc: b002                   mov      al, 2
2cfe: b403                   mov      ah, 3
2d00: 32db                   xor      bl, bl
2d02: e831fe                 call     0x2b36
2d05: 3c02                   cmp      al, 2
2d07: 74d4                   je       0x2cdd
2d09: 72ab                   jb       0x2cb6
2d0b: e892ff                 call     0x2ca0
2d0e: b004                   mov      al, 4
2d10: b404                   mov      ah, 4
2d12: b304                   mov      bl, 4
2d14: c6063348ff             mov      byte ptr [0x4833], 0xff
2d19: e81afe                 call     0x2b36
2d1c: c606334800             mov      byte ptr [0x4833], 0
2d21: 3c02                   cmp      al, 2
2d23: 725e                   jb       0x2d83
2d25: 7429                   je       0x2d50
2d27: 3c03                   cmp      al, 3
2d29: 75bd                   jne      0x2ce8
2d2b: e8abf6                 call     0x23d9
2d2e: 80266b08ff             and      byte ptr [0x86b], 0xff
2d33: 7404                   je       0x2d39
2d35: 58                     pop      ax
2d36: e96910                 jmp      0x3da2
2d39: a0aadd                 mov      al, byte ptr [0xddaa]
2d3c: 22c0                   and      al, al
2d3e: 750a                   jne      0x2d4a
2d40: b080                   mov      al, 0x80
2d42: e8360f                 call     0x3c7b
2d45: 7203                   jb       0x2d4a
2d47: e9af00                 jmp      0x2df9
2d4a: e863f6                 call     0x23b0
2d4d: e9a900                 jmp      0x2df9
2d50: a03248                 mov      al, byte ptr [0x4832]
2d53: fec8                   dec      al
2d55: 7902                   jns      0x2d59
2d57: b002                   mov      al, 2
2d59: a23248                 mov      byte ptr [0x4832], al
2d5c: 8ad8                   mov      bl, al
2d5e: 32ff                   xor      bh, bh
2d60: d1e3                   shl      bx, 1
2d62: 8bb73448               mov      si, word ptr [bx + 0x4834]
2d66: bf2941                 mov      di, 0x4129
2d69: 06                     push     es
2d6a: 8cd8                   mov      ax, ds
2d6c: 8ec0                   mov      es, ax
2d6e: b90d00                 mov      cx, 0xd
2d71: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
2d73: bf3d41                 mov      di, 0x413d
2d76: 83ee0d                 sub      si, 0xd
2d79: b90d00                 mov      cx, 0xd
2d7c: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
2d7e: 07                     pop      es
2d7f: b002                   mov      al, 2
2d81: eb8d                   jmp      0x2d10
2d83: a28856                 mov      byte ptr [0x5688], al
2d86: 22c0                   and      al, al
2d88: 741b                   je       0x2da5
2d8a: 8a26aadd               mov      ah, byte ptr [0xddaa]
2d8e: 22e4                   and      ah, ah
2d90: 8a263248               mov      ah, byte ptr [0x4832]
2d94: 740a                   je       0x2da0
2d96: 80fc02                 cmp      ah, 2
2d99: 750a                   jne      0x2da5
2d9b: e885d7                 call     0x523
2d9e: ebdf                   jmp      0x2d7f
2da0: 80fc01                 cmp      ah, 1
2da3: 74f6                   je       0x2d9b
2da5: d0e0                   shl      al, 1
2da7: d0e0                   shl      al, 1
2da9: 0408                   add      al, 8
2dab: 8ad8                   mov      bl, al
2dad: be10c5                 mov      si, 0xc510
2db0: bfb95d                 mov      di, 0x5db9
2db3: b98000                 mov      cx, 0x80
2db6: f3a5                   rep movsw word ptr es:[di], word ptr [si]
2db8: a08b56                 mov      al, byte ptr [0x568b]
2dbb: a2f44a                 mov      byte ptr [0x4af4], al
2dbe: e8dffe                 call     0x2ca0
2dc1: 32c0                   xor      al, al
2dc3: e8b50e                 call     0x3c7b
2dc6: e89e1e                 call     0x4c67
2dc9: a00d54                 mov      al, byte ptr [0x540d]
2dcc: 22c0                   and      al, al
2dce: 7807                   js       0x2dd7
2dd0: a08856                 mov      al, byte ptr [0x5688]
2dd3: 22c0                   and      al, al
2dd5: 7413                   je       0x2dea
2dd7: a0f44a                 mov      al, byte ptr [0x4af4]
2dda: a28b56                 mov      byte ptr [0x568b], al
2ddd: beb95d                 mov      si, 0x5db9
2de0: bf10c5                 mov      di, 0xc510
2de3: b98000                 mov      cx, 0x80
2de6: f3a5                   rep movsw word ptr es:[di], word ptr [si]
2de8: eb0f                   jmp      0x2df9
2dea: b080                   mov      al, 0x80
2dec: a28b56                 mov      byte ptr [0x568b], al
2def: b080                   mov      al, 0x80
2df1: e8870e                 call     0x3c7b
2df4: 7303                   jae      0x2df9
2df6: e8b7f5                 call     0x23b0
2df9: e8a5e6                 call     0x14a1
2dfc: e848e8                 call     0x1647
2dff: e9e9fe                 jmp      0x2ceb
2e02: c3                     ret      
2e03: a07f4b                 mov      al, byte ptr [0x4b7f]
2e06: 22c0                   and      al, al
2e08: 74f8                   je       0x2e02
2e0a: 33c0                   xor      ax, ax
2e0c: 8bf8                   mov      di, ax
2e0e: a31954                 mov      word ptr [0x5419], ax
2e11: a26354                 mov      byte ptr [0x5463], al
2e14: a01b54                 mov      al, byte ptr [0x541b]
2e17: 22c0                   and      al, al
2e19: 7433                   je       0x2e4e
2e1b: 8a26494b               mov      ah, byte ptr [0x4b49]
2e1f: 22e4                   and      ah, ah
2e21: 7804                   js       0x2e27
2e23: fe0e1b54               dec      byte ptr [0x541b]
2e27: 02066454               add      al, byte ptr [0x5464]
2e2b: 240f                   and      al, 0xf
2e2d: 8ad8                   mov      bl, al
2e2f: 8a87c047               mov      al, byte ptr [bx + 0x47c0]
2e33: 22c0                   and      al, al
2e35: 7903                   jns      0x2e3a
2e37: f6d8                   neg      al
2e39: 47                     inc      di
2e3a: 88851954               mov      byte ptr [di + 0x5419], al
2e3e: 80c305                 add      bl, 5
2e41: 80e30f                 and      bl, 0xf
2e44: 8a87c047               mov      al, byte ptr [bx + 0x47c0]
2e48: a26354                 mov      byte ptr [0x5463], al
2e4b: eb41                   jmp      0x2e8e
2e4d: 90                     nop      
2e4e: a08154                 mov      al, byte ptr [0x5481]
2e51: 32e4                   xor      ah, ah
2e53: 8bf8                   mov      di, ax
2e55: 8a85c14b               mov      al, byte ptr [di + 0x4bc1]
2e59: 22c0                   and      al, al
2e5b: 7831                   js       0x2e8e
2e5d: a07654                 mov      al, byte ptr [0x5476]
2e60: 22c0                   and      al, al
2e62: 782a                   js       0x2e8e
2e64: a0694b                 mov      al, byte ptr [0x4b69]
2e67: 22c0                   and      al, al
2e69: 7823                   js       0x2e8e
2e6b: b408                   mov      ah, 8
2e6d: a05f54                 mov      al, byte ptr [0x545f]
2e70: d0e0                   shl      al, 1
2e72: 731a                   jae      0x2e8e
2e74: 7902                   jns      0x2e78
2e76: b410                   mov      ah, 0x10
2e78: 88266454               mov      byte ptr [0x5464], ah
2e7c: e8791d                 call     0x4bf8
2e7f: 241f                   and      al, 0x1f
2e81: 8a268056               mov      ah, byte ptr [0x5680]
2e85: 3ae0                   cmp      ah, al
2e87: 7205                   jb       0x2e8e
2e89: b010                   mov      al, 0x10
2e8b: a21b54                 mov      byte ptr [0x541b], al
2e8e: a05b4b                 mov      al, byte ptr [0x4b5b]
2e91: d0e8                   shr      al, 1
2e93: 3206694b               xor      al, byte ptr [0x4b69]
2e97: a25f54                 mov      byte ptr [0x545f], al
2e9a: c3                     ret      
2e9b: a0264b                 mov      al, byte ptr [0x4b26]
2e9e: 8ac8                   mov      cl, al
2ea0: 22c0                   and      al, al
2ea2: 750e                   jne      0x2eb2
2ea4: 8a26234b               mov      ah, byte ptr [0x4b23]
2ea8: 80e403                 and      ah, 3
2eab: 7413                   je       0x2ec0
2ead: b4c8                   mov      ah, 0xc8
2eaf: eb0f                   jmp      0x2ec0
2eb1: 90                     nop      
2eb2: a06253                 mov      al, byte ptr [0x5362]
2eb5: 8a266553               mov      ah, byte ptr [0x5365]
2eb9: 25f0ff                 and      ax, 0xfff0
2ebc: 7902                   jns      0x2ec0
2ebe: f7d8                   neg      ax
2ec0: 80c405                 add      ah, 5
2ec3: d1e8                   shr      ax, 1
2ec5: d1e8                   shr      ax, 1
2ec7: d1e8                   shr      ax, 1
2ec9: 2b06bb4a               sub      ax, word ptr [0x4abb]
2ecd: d1f8                   sar      ax, 1
2ecf: d1f8                   sar      ax, 1
2ed1: d1f8                   sar      ax, 1
2ed3: 22e4                   and      ah, ah
2ed5: 7808                   js       0x2edf
2ed7: 741d                   je       0x2ef6
2ed9: b80001                 mov      ax, 0x100
2edc: eb18                   jmp      0x2ef6
2ede: 90                     nop      
2edf: 22c9                   and      cl, cl
2ee1: 740b                   je       0x2eee
2ee3: 80fcff                 cmp      ah, 0xff
2ee6: 740e                   je       0x2ef6
2ee8: b800ff                 mov      ax, 0xff00
2eeb: eb09                   jmp      0x2ef6
2eed: 90                     nop      
2eee: 3de0ff                 cmp      ax, 0xffe0
2ef1: 7303                   jae      0x2ef6
2ef3: b8e0ff                 mov      ax, 0xffe0
2ef6: 8bc8                   mov      cx, ax
2ef8: d1e0                   shl      ax, 1
2efa: d1f9                   sar      cx, 1
2efc: 03c1                   add      ax, cx
2efe: d1f9                   sar      cx, 1
2f00: 03c1                   add      ax, cx
2f02: a3c24a                 mov      word ptr [0x4ac2], ax
2f05: c3                     ret      
2f06: 51                     push     cx
2f07: 52                     push     dx
2f08: 56                     push     si
2f09: 57                     push     di
2f0a: 06                     push     es
2f0b: be0e0e                 mov      si, 0xe0e
2f0e: bf6e01                 mov      di, 0x16e
2f11: e8c5e8                 call     0x17d9
2f14: b394                   mov      bl, 0x94
2f16: e886e4                 call     0x139f
2f19: b42f                   mov      ah, 0x2f
2f1b: cd21                   int      0x21
2f1d: 891e1548               mov      word ptr [0x4815], bx
2f21: 8c061748               mov      word ptr [0x4817], es
2f25: e899d3                 call     0x2c1
2f28: a01948                 mov      al, byte ptr [0x4819]
2f2b: 22c0                   and      al, al
2f2d: 7457                   je       0x2f86
2f2f: b44f                   mov      ah, 0x4f
2f31: cd21                   int      0x21
2f33: 7303                   jae      0x2f38
2f35: eb4f                   jmp      0x2f86
2f37: 90                     nop      
2f38: e87cd3                 call     0x2b7
2f3b: 8b1e1548               mov      bx, word ptr [0x4815]
2f3f: a11748                 mov      ax, word ptr [0x4817]
2f42: 8ec0                   mov      es, ax
2f44: bf916f                 mov      di, 0x6f91
2f47: b90800                 mov      cx, 8
2f4a: 268a471e               mov      al, byte ptr es:[bx + 0x1e]
2f4e: 3c2e                   cmp      al, 0x2e
2f50: 7406                   je       0x2f58
2f52: 8805                   mov      byte ptr [di], al
2f54: 43                     inc      bx
2f55: 47                     inc      di
2f56: e2f2                   loop     0x2f4a
2f58: b0ff                   mov      al, 0xff
2f5a: 8805                   mov      byte ptr [di], al
2f5c: bb0800                 mov      bx, 8
2f5f: 2bd9                   sub      bx, cx
2f61: 53                     push     bx
2f62: b01f                   mov      al, 0x1f
2f64: e899d3                 call     0x300
2f67: b014                   mov      al, 0x14
2f69: e894d3                 call     0x300
2f6c: b017                   mov      al, 0x17
2f6e: e88fd3                 call     0x300
2f71: bb916f                 mov      bx, 0x6f91
2f74: 8a07                   mov      al, byte ptr [bx]
2f76: 3cff                   cmp      al, 0xff
2f78: 7408                   je       0x2f82
2f7a: 53                     push     bx
2f7b: e882d3                 call     0x300
2f7e: 5b                     pop      bx
2f7f: 43                     inc      bx
2f80: ebf2                   jmp      0x2f74
2f82: 5b                     pop      bx
2f83: eb22                   jmp      0x2fa7
2f85: 90                     nop      
2f86: a03248                 mov      al, byte ptr [0x4832]
2f89: 32e4                   xor      ah, ah
2f8b: 8bf0                   mov      si, ax
2f8d: d1e6                   shl      si, 1
2f8f: 8b941a48               mov      dx, word ptr [si + 0x481a]
2f93: b44e                   mov      ah, 0x4e
2f95: 33c9                   xor      cx, cx
2f97: cd21                   int      0x21
2f99: 7207                   jb       0x2fa2
2f9b: b0ff                   mov      al, 0xff
2f9d: a21948                 mov      byte ptr [0x4819], al
2fa0: eb96                   jmp      0x2f38
2fa2: 33db                   xor      bx, bx
2fa4: e810d3                 call     0x2b7
2fa7: 07                     pop      es
2fa8: 5f                     pop      di
2fa9: 5e                     pop      si
2faa: 5a                     pop      dx
2fab: 59                     pop      cx
2fac: 8ae3                   mov      ah, bl
2fae: 0226bd4a               add      ah, byte ptr [0x4abd]
2fb2: c3                     ret      
2fb3: fa                     cli      
2fb4: c706b308ac08           mov      word ptr [0x8b3], 0x8ac
2fba: c706b508ab08           mov      word ptr [0x8b5], 0x8ab
2fc0: c706b708aa08           mov      word ptr [0x8b7], 0x8aa
2fc6: c706b908a908           mov      word ptr [0x8b9], 0x8a9
2fcc: c706bb08a708           mov      word ptr [0x8bb], 0x8a7
2fd2: c706c508e206           mov      word ptr [0x8c5], 0x6e2
2fd8: fb                     sti      
2fd9: c606614802             mov      byte ptr [0x4861], 2
2fde: b8e206                 mov      ax, 0x6e2
2fe1: b90800                 mov      cx, 8
2fe4: be18e2                 mov      si, 0xe218
2fe7: 8904                   mov      word ptr [si], ax
2fe9: 83c60a                 add      si, 0xa
2fec: e2f9                   loop     0x2fe7
2fee: c3                     ret      
2fef: e85611                 call     0x4148
2ff2: bfce00                 mov      di, 0xce
2ff5: e8dee7                 call     0x17d6
2ff8: b40d                   mov      ah, 0xd
2ffa: b305                   mov      bl, 5
2ffc: e84afa                 call     0x2a49
2fff: bb6700                 mov      bx, 0x67
3002: e82968                 call     0x982e
3005: e8a7d4                 call     0x4af
3008: 3c6e                   cmp      al, 0x6e
300a: 74e2                   je       0x2fee
300c: 3c4e                   cmp      al, 0x4e
300e: 74de                   je       0x2fee
3010: 3c79                   cmp      al, 0x79
3012: 7404                   je       0x3018
3014: 3c59                   cmp      al, 0x59
3016: 75ed                   jne      0x3005
3018: bffe00                 mov      di, 0xfe
301b: e8b8e7                 call     0x17d6
301e: b410                   mov      ah, 0x10
3020: b305                   mov      bl, 5
3022: e824fa                 call     0x2a49
3025: bb8500                 mov      bx, 0x85
3028: e80368                 call     0x982e
302b: c606a70800             mov      byte ptr [0x8a7], 0
3030: b4ff                   mov      ah, 0xff
3032: e86e00                 call     0x30a3
3035: 22c0                   and      al, al
3037: 7903                   jns      0x303c
3039: e977ff                 jmp      0x2fb3
303c: e89400                 call     0x30d3
303f: bf2e01                 mov      di, 0x12e
3042: e891e7                 call     0x17d6
3045: b413                   mov      ah, 0x13
3047: b305                   mov      bl, 5
3049: e8fdf9                 call     0x2a49
304c: bba400                 mov      bx, 0xa4
304f: e8dc67                 call     0x982e
3052: e86d00                 call     0x30c2
3055: 32e4                   xor      ah, ah
3057: e84900                 call     0x30a3
305a: e8ce00                 call     0x312b
305d: bf5e01                 mov      di, 0x15e
3060: e873e7                 call     0x17d6
3063: b416                   mov      ah, 0x16
3065: b305                   mov      bl, 5
3067: e8dff9                 call     0x2a49
306a: bbbc00                 mov      bx, 0xbc
306d: e8be67                 call     0x982e
3070: e84f00                 call     0x30c2
3073: 32e4                   xor      ah, ah
3075: e82b00                 call     0x30a3
3078: e87e00                 call     0x30f9
307b: c606614801             mov      byte ptr [0x4861], 1
3080: fa                     cli      
3081: c706c5083d07           mov      word ptr [0x8c5], 0x73d
3087: fb                     sti      
3088: b83d07                 mov      ax, 0x73d
308b: b90800                 mov      cx, 8
308e: be18e2                 mov      si, 0xe218
3091: 8904                   mov      word ptr [si], ax
3093: 83c60a                 add      si, 0xa
3096: e2f9                   loop     0x3091
3098: c3                     ret      
3099: 8026a708ff             and      byte ptr [0x8a7], 0xff
309e: 78f9                   js       0x3099
30a0: b0ff                   mov      al, 0xff
30a2: c3                     ret      
30a3: 22e4                   and      ah, ah
30a5: 7407                   je       0x30ae
30a7: 8026a708ff             and      byte ptr [0x8a7], 0xff
30ac: 78eb                   js       0x3099
30ae: ba0102                 mov      dx, 0x201
30b1: ec                     in       al, dx
30b2: 2430                   and      al, 0x30
30b4: 3c30                   cmp      al, 0x30
30b6: 7403                   je       0x30bb
30b8: b07f                   mov      al, 0x7f
30ba: c3                     ret      
30bb: fb                     sti      
30bc: 22e4                   and      ah, ah
30be: 74ee                   je       0x30ae
30c0: ebe1                   jmp      0x30a3
30c2: b90500                 mov      cx, 5
30c5: f4                     hlt      
30c6: e2fd                   loop     0x30c5
30c8: ba0102                 mov      dx, 0x201
30cb: ec                     in       al, dx
30cc: 2430                   and      al, 0x30
30ce: 3c30                   cmp      al, 0x30
30d0: 75f9                   jne      0x30cb
30d2: c3                     ret      
30d3: fa                     cli      
30d4: ba0102                 mov      dx, 0x201
30d7: ee                     out      dx, al
30d8: b403                   mov      ah, 3
30da: 33f6                   xor      si, si
30dc: 8bde                   mov      bx, si
30de: ec                     in       al, dx
30df: 22c4                   and      al, ah
30e1: 740c                   je       0x30ef
30e3: d0e8                   shr      al, 1
30e5: 83d300                 adc      bx, 0
30e8: d0e8                   shr      al, 1
30ea: 83d600                 adc      si, 0
30ed: ebef                   jmp      0x30de
30ef: 89366448               mov      word ptr [0x4864], si
30f3: 891e6248               mov      word ptr [0x4862], bx
30f7: fb                     sti      
30f8: c3                     ret      
30f9: fa                     cli      
30fa: ba0102                 mov      dx, 0x201
30fd: ee                     out      dx, al
30fe: b403                   mov      ah, 3
3100: 33f6                   xor      si, si
3102: 8bde                   mov      bx, si
3104: ec                     in       al, dx
3105: 22c4                   and      al, ah
3107: 740c                   je       0x3115
3109: d0e8                   shr      al, 1
310b: 83d300                 adc      bx, 0
310e: d0e8                   shr      al, 1
3110: 83d600                 adc      si, 0
3113: ebef                   jmp      0x3104
3115: 03366448               add      si, word ptr [0x4864]
3119: d1de                   rcr      si, 1
311b: 8936c308               mov      word ptr [0x8c3], si
311f: 031e6248               add      bx, word ptr [0x4862]
3123: d1db                   rcr      bx, 1
3125: 891ebf08               mov      word ptr [0x8bf], bx
3129: fb                     sti      
312a: c3                     ret      
312b: fa                     cli      
312c: ba0102                 mov      dx, 0x201
312f: ee                     out      dx, al
3130: b403                   mov      ah, 3
3132: 33f6                   xor      si, si
3134: 8bde                   mov      bx, si
3136: ec                     in       al, dx
3137: 22c4                   and      al, ah
3139: 740c                   je       0x3147
313b: d0e8                   shr      al, 1
313d: 83d300                 adc      bx, 0
3140: d0e8                   shr      al, 1
3142: 83d600                 adc      si, 0
3145: ebef                   jmp      0x3136
3147: 03366448               add      si, word ptr [0x4864]
314b: d1de                   rcr      si, 1
314d: 8936c108               mov      word ptr [0x8c1], si
3151: 031e6248               add      bx, word ptr [0x4862]
3155: d1db                   rcr      bx, 1
3157: 891ebd08               mov      word ptr [0x8bd], bx
315b: fb                     sti      
315c: c3                     ret      
315d: 0000                   add      byte ptr [bx + si], al
315f: 00a01b4b               add      byte ptr [bx + si + 0x4b1b], ah
3163: 0206be4a               add      al, byte ptr [0x4abe]
3167: 3c10                   cmp      al, 0x10
3169: 7322                   jae      0x318d
316b: d0e0                   shl      al, 1
316d: d0e0                   shl      al, 1
316f: d0e0                   shl      al, 1
3171: d0e0                   shl      al, 1
3173: 8ae0                   mov      ah, al
3175: a0194b                 mov      al, byte ptr [0x4b19]
3178: 0206bd4a               add      al, byte ptr [0x4abd]
317c: 3c10                   cmp      al, 0x10
317e: 730d                   jae      0x318d
3180: 240f                   and      al, 0xf
3182: 0ac4                   or       al, ah
3184: 8ad8                   mov      bl, al
3186: 32ff                   xor      bh, bh
3188: 8a87b95d               mov      al, byte ptr [bx + 0x5db9]
318c: c3                     ret      
318d: f9                     stc      
318e: c3                     ret      
318f: 8a87495b               mov      al, byte ptr [bx + 0x5b49]
3193: a2594b                 mov      byte ptr [0x4b59], al
3196: 32e4                   xor      ah, ah
3198: d0e0                   shl      al, 1
319a: 8bf8                   mov      di, ax
319c: 8b8520b1               mov      ax, word ptr [di - 0x4ee0]
31a0: a34e4b                 mov      word ptr [0x4b4e], ax
31a3: 32e4                   xor      ah, ah
31a5: 8a87975b               mov      al, byte ptr [bx + 0x5b97]
31a9: d0e0                   shl      al, 1
31ab: 8bf8                   mov      di, ax
31ad: 8ac4                   mov      al, ah
31af: d0d0                   rcl      al, 1
31b1: d0e0                   shl      al, 1
31b3: a28d4b                 mov      byte ptr [0x4b8d], al
31b6: 8b8520b1               mov      ax, word ptr [di - 0x4ee0]
31ba: a3804b                 mov      word ptr [0x4b80], ax
31bd: 8a87e55b               mov      al, byte ptr [bx + 0x5be5]
31c1: 8aa7335c               mov      ah, byte ptr [bx + 0x5c33]
31c5: a3e84a                 mov      word ptr [0x4ae8], ax
31c8: 8a87815c               mov      al, byte ptr [bx + 0x5c81]
31cc: 8aa7cf5c               mov      ah, byte ptr [bx + 0x5ccf]
31d0: a3ea4a                 mov      word ptr [0x4aea], ax
31d3: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
31d7: 24c0                   and      al, 0xc0
31d9: a2cf4a                 mov      byte ptr [0x4acf], al
31dc: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
31e0: 2410                   and      al, 0x10
31e2: d0e0                   shl      al, 1
31e4: d0e0                   shl      al, 1
31e6: d0e0                   shl      al, 1
31e8: a25b4b                 mov      byte ptr [0x4b5b], al
31eb: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
31ef: 240f                   and      al, 0xf
31f1: a2da54                 mov      byte ptr [0x54da], al
31f4: d0e0                   shl      al, 1
31f6: 32e4                   xor      ah, ah
31f8: 8bf8                   mov      di, ax
31fa: 8b8500b1               mov      ax, word ptr [di - 0x4f00]
31fe: a3504b                 mov      word ptr [0x4b50], ax
3201: 8bf8                   mov      di, ax
3203: 8a4501                 mov      al, byte ptr [di + 1]
3206: a2694b                 mov      byte ptr [0x4b69], al
3209: 8a05                   mov      al, byte ptr [di]
320b: 32e4                   xor      ah, ah
320d: 8be8                   mov      bp, ax
320f: 3e8a03                 mov      al, byte ptr ds:[bp + di]
3212: 45                     inc      bp
3213: a2554b                 mov      byte ptr [0x4b55], al
3216: 2c02                   sub      al, 2
3218: a21f4b                 mov      byte ptr [0x4b1f], al
321b: 0402                   add      al, 2
321d: d0e8                   shr      al, 1
321f: fec8                   dec      al
3221: a2774b                 mov      byte ptr [0x4b77], al
3224: 3e8a03                 mov      al, byte ptr ds:[bp + di]
3227: 45                     inc      bp
3228: d0e8                   shr      al, 1
322a: d0d8                   rcr      al, 1
322c: 2480                   and      al, 0x80
322e: a2544b                 mov      byte ptr [0x4b54], al
3231: 3e8a03                 mov      al, byte ptr ds:[bp + di]
3234: 45                     inc      bp
3235: a2754b                 mov      byte ptr [0x4b75], al
3238: 3e8a03                 mov      al, byte ptr ds:[bp + di]
323b: 45                     inc      bp
323c: a2764b                 mov      byte ptr [0x4b76], al
323f: 83c502                 add      bp, 2
3242: 3e8a03                 mov      al, byte ptr ds:[bp + di]
3245: 45                     inc      bp
3246: a27e4b                 mov      byte ptr [0x4b7e], al
3249: c3                     ret      
324a: 32ff                   xor      bh, bh
324c: 8a87fb5a               mov      al, byte ptr [bx + 0x5afb]
3250: 8ae0                   mov      ah, al
3252: 240f                   and      al, 0xf
3254: d0ec                   shr      ah, 1
3256: d0ec                   shr      ah, 1
3258: d0ec                   shr      ah, 1
325a: d0ec                   shr      ah, 1
325c: 2a06194b               sub      al, byte ptr [0x4b19]
3260: 8ad8                   mov      bl, al
3262: 2a261b4b               sub      ah, byte ptr [0x4b1b]
3266: 8ac4                   mov      al, ah
3268: 8ae7                   mov      ah, bh
326a: 8bf8                   mov      di, ax
326c: 8026254bff             and      byte ptr [0x4b25], 0xff
3271: 780e                   js       0x3281
3273: f606254b40             test     byte ptr [0x4b25], 0x40
3278: 741c                   je       0x3296
327a: 87df                   xchg     di, bx
327c: f6db                   neg      bl
327e: eb16                   jmp      0x3296
3280: 90                     nop      
3281: f606254b40             test     byte ptr [0x4b25], 0x40
3286: 750a                   jne      0x3292
3288: f6db                   neg      bl
328a: 81f7ff00               xor      di, 0xff
328e: 47                     inc      di
328f: eb05                   jmp      0x3296
3291: 90                     nop      
3292: f6db                   neg      bl
3294: 87df                   xchg     di, bx
3296: 8ac3                   mov      al, bl
3298: d0e0                   shl      al, 1
329a: d0e0                   shl      al, 1
329c: d0e0                   shl      al, 1
329e: 0206854b               add      al, byte ptr [0x4b85]
32a2: a24b4b                 mov      byte ptr [0x4b4b], al
32a5: 8bc7                   mov      ax, di
32a7: d0e0                   shl      al, 1
32a9: d0e0                   shl      al, 1
32ab: d0e0                   shl      al, 1
32ad: 0206874b               add      al, byte ptr [0x4b87]
32b1: a24d4b                 mov      byte ptr [0x4b4d], al
32b4: c3                     ret      
32b5: 3ae0                   cmp      ah, al
32b7: 731c                   jae      0x32d5
32b9: 02c4                   add      al, ah
32bb: 730d                   jae      0x32ca
32bd: 8ac3                   mov      al, bl
32bf: 240f                   and      al, 0xf
32c1: 3c0f                   cmp      al, 0xf
32c3: 742e                   je       0x32f3
32c5: fec3                   inc      bl
32c7: eb25                   jmp      0x32ee
32c9: 90                     nop      
32ca: f6c3f0                 test     bl, 0xf0
32cd: 7424                   je       0x32f3
32cf: 80eb10                 sub      bl, 0x10
32d2: eb1a                   jmp      0x32ee
32d4: 90                     nop      
32d5: 02c4                   add      al, ah
32d7: 730e                   jae      0x32e7
32d9: 8ac3                   mov      al, bl
32db: 24f0                   and      al, 0xf0
32dd: 3cf0                   cmp      al, 0xf0
32df: 7412                   je       0x32f3
32e1: 80c310                 add      bl, 0x10
32e4: eb08                   jmp      0x32ee
32e6: 90                     nop      
32e7: f6c30f                 test     bl, 0xf
32ea: 7407                   je       0x32f3
32ec: fecb                   dec      bl
32ee: 8a87b95d               mov      al, byte ptr [bx + 0x5db9]
32f2: c3                     ret      
32f3: b0ff                   mov      al, 0xff
32f5: c3                     ret      
32f6: 8ad0                   mov      dl, al
32f8: bb0200                 mov      bx, 2
32fb: 8a870c53               mov      al, byte ptr [bx + 0x530c]
32ff: 22c0                   and      al, al
3301: 7504                   jne      0x3307
3303: fe870c53               inc      byte ptr [bx + 0x530c]
3307: 8a870c53               mov      al, byte ptr [bx + 0x530c]
330b: d0e0                   shl      al, 1
330d: 8a870f53               mov      al, byte ptr [bx + 0x530f]
3311: d0d0                   rcl      al, 1
3313: 8887664b               mov      byte ptr [bx + 0x4b66], al
3317: 8a871253               mov      al, byte ptr [bx + 0x5312]
331b: d0d0                   rcl      al, 1
331d: 8887194b               mov      byte ptr [bx + 0x4b19], al
3321: 80eb02                 sub      bl, 2
3324: 79d5                   jns      0x32fb
3326: 33ff                   xor      di, di
3328: 8bdf                   mov      bx, di
332a: 22d2                   and      dl, dl
332c: 781d                   js       0x334b
332e: f6c240                 test     dl, 0x40
3331: 750b                   jne      0x333e
3333: e84c00                 call     0x3382
3336: bf0200                 mov      di, 2
3339: 8bdf                   mov      bx, di
333b: eb45                   jmp      0x3382
333d: 90                     nop      
333e: bf0200                 mov      di, 2
3341: e83e00                 call     0x3382
3344: b302                   mov      bl, 2
3346: 33ff                   xor      di, di
3348: eb0e                   jmp      0x3358
334a: 90                     nop      
334b: f6c240                 test     dl, 0x40
334e: 7527                   jne      0x3377
3350: e80500                 call     0x3358
3353: bf0200                 mov      di, 2
3356: 8bdf                   mov      bx, di
3358: b000                   mov      al, 0
335a: 2a870c53               sub      al, byte ptr [bx + 0x530c]
335e: 8885f74a               mov      byte ptr [di + 0x4af7], al
3362: b000                   mov      al, 0
3364: 1a870f53               sbb      al, byte ptr [bx + 0x530f]
3368: 8885204b               mov      byte ptr [di + 0x4b20], al
336c: b008                   mov      al, 8
336e: 1a871253               sbb      al, byte ptr [bx + 0x5312]
3372: 8885d64a               mov      byte ptr [di + 0x4ad6], al
3376: c3                     ret      
3377: bf0200                 mov      di, 2
337a: e8dbff                 call     0x3358
337d: bb0200                 mov      bx, 2
3380: 33ff                   xor      di, di
3382: 8a870c53               mov      al, byte ptr [bx + 0x530c]
3386: 8885f74a               mov      byte ptr [di + 0x4af7], al
338a: 8a870f53               mov      al, byte ptr [bx + 0x530f]
338e: 8885204b               mov      byte ptr [di + 0x4b20], al
3392: 8a871253               mov      al, byte ptr [bx + 0x5312]
3396: 8885d64a               mov      byte ptr [di + 0x4ad6], al
339a: c3                     ret      
339b: a03153                 mov      al, byte ptr [0x5331]
339e: 0420                   add      al, 0x20
33a0: 24c0                   and      al, 0xc0
33a2: a2254b                 mov      byte ptr [0x4b25], al
33a5: e84eff                 call     0x32f6
33a8: a00d53                 mov      al, byte ptr [0x530d]
33ab: a2f84a                 mov      byte ptr [0x4af8], al
33ae: a01053                 mov      al, byte ptr [0x5310]
33b1: a2214b                 mov      byte ptr [0x4b21], al
33b4: a01353                 mov      al, byte ptr [0x5313]
33b7: d0e8                   shr      al, 1
33b9: d01e214b               rcr      byte ptr [0x4b21], 1
33bd: d01ef84a               rcr      byte ptr [0x4af8], 1
33c1: d0e8                   shr      al, 1
33c3: d01e214b               rcr      byte ptr [0x4b21], 1
33c7: d01ef84a               rcr      byte ptr [0x4af8], 1
33cb: d0e8                   shr      al, 1
33cd: d01e214b               rcr      byte ptr [0x4b21], 1
33d1: d01ef84a               rcr      byte ptr [0x4af8], 1
33d5: b407                   mov      ah, 7
33d7: 8b166c53               mov      dx, word ptr [0x536c]
33db: 80fe05                 cmp      dh, 5
33de: 7204                   jb       0x33e4
33e0: d1e2                   shl      dx, 1
33e2: b402                   mov      ah, 2
33e4: b080                   mov      al, 0x80
33e6: 03d0                   add      dx, ax
33e8: 33c9                   xor      cx, cx
33ea: 80263053ff             and      byte ptr [0x5330], 0xff
33ef: 7908                   jns      0x33f9
33f1: 8a0e2d53               mov      cl, byte ptr [0x532d]
33f5: 8a2e3053               mov      ch, byte ptr [0x5330]
33f9: 8bc2                   mov      ax, dx
33fb: 2bc1                   sub      ax, cx
33fd: d1f8                   sar      ax, 1
33ff: d1f8                   sar      ax, 1
3401: d1f8                   sar      ax, 1
3403: d1f8                   sar      ax, 1
3405: 8bc8                   mov      cx, ax
3407: a0f84a                 mov      al, byte ptr [0x4af8]
340a: 8a26214b               mov      ah, byte ptr [0x4b21]
340e: 03c1                   add      ax, cx
3410: a3ec4a                 mov      word ptr [0x4aec], ax
3413: bb0200                 mov      bx, 2
3416: 8a87f74a               mov      al, byte ptr [bx + 0x4af7]
341a: 8aa7204b               mov      ah, byte ptr [bx + 0x4b20]
341e: 80e47f                 and      ah, 0x7f
3421: d1e8                   shr      ax, 1
3423: d1e8                   shr      ax, 1
3425: d1e8                   shr      ax, 1
3427: d1e8                   shr      ax, 1
3429: f7d8                   neg      ax
342b: 88a7854b               mov      byte ptr [bx + 0x4b85], ah
342f: 88874a4b               mov      byte ptr [bx + 0x4b4a], al
3433: 80eb02                 sub      bl, 2
3436: 79de                   jns      0x3416
3438: 32d2                   xor      dl, dl
343a: a02e53                 mov      al, byte ptr [0x532e]
343d: 8a263153               mov      ah, byte ptr [0x5331]
3441: 80ec20                 sub      ah, 0x20
3444: d1e0                   shl      ax, 1
3446: d1e0                   shl      ax, 1
3448: 8ac4                   mov      al, ah
344a: b4ff                   mov      ah, 0xff
344c: a3e44a                 mov      word ptr [0x4ae4], ax
344f: f7d8                   neg      ax
3451: a35e4b                 mov      word ptr [0x4b5e], ax
3454: c3                     ret      
3455: b88001                 mov      ax, 0x180
3458: d1e8                   shr      ax, 1
345a: 8b166e4b               mov      dx, word ptr [0x4b6e]
345e: 2bd0                   sub      dx, ax
3460: a05b4b                 mov      al, byte ptr [0x4b5b]
3463: 22c0                   and      al, al
3465: 7902                   jns      0x3469
3467: f7da                   neg      dx
3469: 89166c4b               mov      word ptr [0x4b6c], dx
346d: 8ae6                   mov      ah, dh
346f: 22f6                   and      dh, dh
3471: 7902                   jns      0x3475
3473: f7da                   neg      dx
3475: 80fe01                 cmp      dh, 1
3478: 721a                   jb       0x3494
347a: a0274b                 mov      al, byte ptr [0x4b27]
347d: 22c0                   and      al, al
347f: 7812                   js       0x3493
3481: c606274b80             mov      byte ptr [0x4b27], 0x80
3486: 88267b54               mov      byte ptr [0x547b], ah
348a: a02c00                 mov      al, byte ptr [0x2c]
348d: a27454                 mov      byte ptr [0x5474], al
3490: e8f61f                 call     0x5489
3493: c3                     ret      
3494: a0274b                 mov      al, byte ptr [0x4b27]
3497: 2440                   and      al, 0x40
3499: 75f8                   jne      0x3493
349b: 8836274b               mov      byte ptr [0x4b27], dh
349f: 88367f54               mov      byte ptr [0x547f], dh
34a3: c3                     ret      
34a4: 33db                   xor      bx, bx
34a6: 8bfb                   mov      di, bx
34a8: c606e45408             mov      byte ptr [0x54e4], 8
34ad: c606e554f8             mov      byte ptr [0x54e5], 0xf8
34b2: 33db                   xor      bx, bx
34b4: 881e6d54               mov      byte ptr [0x546d], bl
34b8: e82100                 call     0x34dc
34bb: fecb                   dec      bl
34bd: 3a1ee554               cmp      bl, byte ptr [0x54e5]
34c1: 73f5                   jae      0x34b8
34c3: b301                   mov      bl, 1
34c5: c6066d5480             mov      byte ptr [0x546d], 0x80
34ca: e80f00                 call     0x34dc
34cd: fec3                   inc      bl
34cf: 3a1ee454               cmp      bl, byte ptr [0x54e4]
34d3: 76f5                   jbe      0x34ca
34d5: 47                     inc      di
34d6: 83ff11                 cmp      di, 0x11
34d9: 75cd                   jne      0x34a8
34db: c3                     ret      
34dc: 881ee24a               mov      byte ptr [0x4ae2], bl
34e0: 8bc7                   mov      ax, di
34e2: a2e34a                 mov      byte ptr [0x4ae3], al
34e5: 8026254bff             and      byte ptr [0x4b25], 0xff
34ea: 780e                   js       0x34fa
34ec: f606254b40             test     byte ptr [0x4b25], 0x40
34f1: 741b                   je       0x350e
34f3: f6db                   neg      bl
34f5: 87df                   xchg     di, bx
34f7: eb15                   jmp      0x350e
34f9: 90                     nop      
34fa: f606254b40             test     byte ptr [0x4b25], 0x40
34ff: 7509                   jne      0x350a
3501: f6db                   neg      bl
3503: f6d8                   neg      al
3505: 8bf8                   mov      di, ax
3507: eb05                   jmp      0x350e
3509: 90                     nop      
350a: 87df                   xchg     di, bx
350c: f6db                   neg      bl
350e: 8bc7                   mov      ax, di
3510: 881ebd4a               mov      byte ptr [0x4abd], bl
3514: a2be4a                 mov      byte ptr [0x4abe], al
3517: c606894b00             mov      byte ptr [0x4b89], 0
351c: c606884b00             mov      byte ptr [0x4b88], 0
3521: e83cfc                 call     0x3160
3524: 7218                   jb       0x353e
3526: 3cff                   cmp      al, 0xff
3528: 7414                   je       0x353e
352a: a2e04a                 mov      byte ptr [0x4ae0], al
352d: c606864b00             mov      byte ptr [0x4b86], 0
3532: c706824b8080           mov      word ptr [0x4b82], 0x8080
3538: e8ba34                 call     0x69f5
353b: e86238                 call     0x6da0
353e: 8a1ee24a               mov      bl, byte ptr [0x4ae2]
3542: a0e34a                 mov      al, byte ptr [0x4ae3]
3545: 32e4                   xor      ah, ah
3547: 8afc                   mov      bh, ah
3549: 8bf8                   mov      di, ax
354b: c3                     ret      
354c: 32ff                   xor      bh, bh
354e: 8a1e5854               mov      bl, byte ptr [0x5458]
3552: 80e303                 and      bl, 3
3555: 8a87004a               mov      al, byte ptr [bx + 0x4a00]
3559: a21253                 mov      byte ptr [0x5312], al
355c: 8a87044a               mov      al, byte ptr [bx + 0x4a04]
3560: a21453                 mov      byte ptr [0x5314], al
3563: 8a87084a               mov      al, byte ptr [bx + 0x4a08]
3567: a23153                 mov      byte ptr [0x5331], al
356a: c606135303             mov      byte ptr [0x5313], 3
356f: c6061053f0             mov      byte ptr [0x5310], 0xf0
3574: c606e64ab8             mov      byte ptr [0x4ae6], 0xb8
3579: e8f72f                 call     0x6573
357c: b94000                 mov      cx, 0x40
357f: bf50c5                 mov      di, 0xc550
3582: b8c0c0                 mov      ax, 0xc0c0
3585: f3ab                   rep stosw word ptr es:[di], ax
3587: a10a00                 mov      ax, word ptr [0xa]
358a: 8ec0                   mov      es, ax
358c: bac403                 mov      dx, 0x3c4
358f: b8020f                 mov      ax, 0xf02
3592: bf8402                 mov      di, 0x284
3595: bb1000                 mov      bx, 0x10
3598: bd0800                 mov      bp, 8
359b: b8ffff                 mov      ax, 0xffff
359e: 8bcb                   mov      cx, bx
35a0: f3ab                   rep stosw word ptr es:[di], ax
35a2: 03fd                   add      di, bp
35a4: 8bcb                   mov      cx, bx
35a6: f3ab                   rep stosw word ptr es:[di], ax
35a8: 03fd                   add      di, bp
35aa: 8bcb                   mov      cx, bx
35ac: f3ab                   rep stosw word ptr es:[di], ax
35ae: 03fd                   add      di, bp
35b0: 8bcb                   mov      cx, bx
35b2: f3ab                   rep stosw word ptr es:[di], ax
35b4: 03fd                   add      di, bp
35b6: 8bcb                   mov      cx, bx
35b8: f3ab                   rep stosw word ptr es:[di], ax
35ba: 03fd                   add      di, bp
35bc: 8bcb                   mov      cx, bx
35be: f3ab                   rep stosw word ptr es:[di], ax
35c0: 03fd                   add      di, bp
35c2: 8bcb                   mov      cx, bx
35c4: f3ab                   rep stosw word ptr es:[di], ax
35c6: 03fd                   add      di, bp
35c8: 8bcb                   mov      cx, bx
35ca: f3ab                   rep stosw word ptr es:[di], ax
35cc: 03fd                   add      di, bp
35ce: 8bcb                   mov      cx, bx
35d0: f3ab                   rep stosw word ptr es:[di], ax
35d2: 03fd                   add      di, bp
35d4: 8bcb                   mov      cx, bx
35d6: f3ab                   rep stosw word ptr es:[di], ax
35d8: 03fd                   add      di, bp
35da: 8bcb                   mov      cx, bx
35dc: f3ab                   rep stosw word ptr es:[di], ax
35de: 03fd                   add      di, bp
35e0: 8bcb                   mov      cx, bx
35e2: f3ab                   rep stosw word ptr es:[di], ax
35e4: 03fd                   add      di, bp
35e6: 8bcb                   mov      cx, bx
35e8: f3ab                   rep stosw word ptr es:[di], ax
35ea: 03fd                   add      di, bp
35ec: 8bcb                   mov      cx, bx
35ee: f3ab                   rep stosw word ptr es:[di], ax
35f0: 03fd                   add      di, bp
35f2: 8bcb                   mov      cx, bx
35f4: f3ab                   rep stosw word ptr es:[di], ax
35f6: 03fd                   add      di, bp
35f8: 8bcb                   mov      cx, bx
35fa: f3ab                   rep stosw word ptr es:[di], ax
35fc: 03fd                   add      di, bp
35fe: 8bcb                   mov      cx, bx
3600: f3ab                   rep stosw word ptr es:[di], ax
3602: 03fd                   add      di, bp
3604: 8bcb                   mov      cx, bx
3606: f3ab                   rep stosw word ptr es:[di], ax
3608: 03fd                   add      di, bp
360a: 8bcb                   mov      cx, bx
360c: f3ab                   rep stosw word ptr es:[di], ax
360e: 03fd                   add      di, bp
3610: 8bcb                   mov      cx, bx
3612: f3ab                   rep stosw word ptr es:[di], ax
3614: 03fd                   add      di, bp
3616: 8bcb                   mov      cx, bx
3618: f3ab                   rep stosw word ptr es:[di], ax
361a: 03fd                   add      di, bp
361c: 8bcb                   mov      cx, bx
361e: f3ab                   rep stosw word ptr es:[di], ax
3620: 03fd                   add      di, bp
3622: 8bcb                   mov      cx, bx
3624: f3ab                   rep stosw word ptr es:[di], ax
3626: 03fd                   add      di, bp
3628: 8bcb                   mov      cx, bx
362a: f3ab                   rep stosw word ptr es:[di], ax
362c: 03fd                   add      di, bp
362e: 8bcb                   mov      cx, bx
3630: f3ab                   rep stosw word ptr es:[di], ax
3632: 03fd                   add      di, bp
3634: 8bcb                   mov      cx, bx
3636: f3ab                   rep stosw word ptr es:[di], ax
3638: 03fd                   add      di, bp
363a: 8bcb                   mov      cx, bx
363c: f3ab                   rep stosw word ptr es:[di], ax
363e: 03fd                   add      di, bp
3640: 8bcb                   mov      cx, bx
3642: f3ab                   rep stosw word ptr es:[di], ax
3644: 03fd                   add      di, bp
3646: 8bcb                   mov      cx, bx
3648: f3ab                   rep stosw word ptr es:[di], ax
364a: 03fd                   add      di, bp
364c: 8bcb                   mov      cx, bx
364e: f3ab                   rep stosw word ptr es:[di], ax
3650: 03fd                   add      di, bp
3652: 8bcb                   mov      cx, bx
3654: f3ab                   rep stosw word ptr es:[di], ax
3656: 03fd                   add      di, bp
3658: 8bcb                   mov      cx, bx
365a: f3ab                   rep stosw word ptr es:[di], ax
365c: 03fd                   add      di, bp
365e: 8bcb                   mov      cx, bx
3660: f3ab                   rep stosw word ptr es:[di], ax
3662: 03fd                   add      di, bp
3664: 8bcb                   mov      cx, bx
3666: f3ab                   rep stosw word ptr es:[di], ax
3668: 03fd                   add      di, bp
366a: 8bcb                   mov      cx, bx
366c: f3ab                   rep stosw word ptr es:[di], ax
366e: 03fd                   add      di, bp
3670: 8bcb                   mov      cx, bx
3672: f3ab                   rep stosw word ptr es:[di], ax
3674: 03fd                   add      di, bp
3676: 8bcb                   mov      cx, bx
3678: f3ab                   rep stosw word ptr es:[di], ax
367a: 03fd                   add      di, bp
367c: 8bcb                   mov      cx, bx
367e: f3ab                   rep stosw word ptr es:[di], ax
3680: 03fd                   add      di, bp
3682: 8bcb                   mov      cx, bx
3684: f3ab                   rep stosw word ptr es:[di], ax
3686: 03fd                   add      di, bp
3688: 8bcb                   mov      cx, bx
368a: f3ab                   rep stosw word ptr es:[di], ax
368c: 03fd                   add      di, bp
368e: 8bcb                   mov      cx, bx
3690: f3ab                   rep stosw word ptr es:[di], ax
3692: 03fd                   add      di, bp
3694: 8bcb                   mov      cx, bx
3696: f3ab                   rep stosw word ptr es:[di], ax
3698: 03fd                   add      di, bp
369a: 8bcb                   mov      cx, bx
369c: f3ab                   rep stosw word ptr es:[di], ax
369e: 03fd                   add      di, bp
36a0: 8bcb                   mov      cx, bx
36a2: f3ab                   rep stosw word ptr es:[di], ax
36a4: 03fd                   add      di, bp
36a6: 8bcb                   mov      cx, bx
36a8: f3ab                   rep stosw word ptr es:[di], ax
36aa: 03fd                   add      di, bp
36ac: 8bcb                   mov      cx, bx
36ae: f3ab                   rep stosw word ptr es:[di], ax
36b0: 03fd                   add      di, bp
36b2: 8bcb                   mov      cx, bx
36b4: f3ab                   rep stosw word ptr es:[di], ax
36b6: 03fd                   add      di, bp
36b8: 8bcb                   mov      cx, bx
36ba: f3ab                   rep stosw word ptr es:[di], ax
36bc: 03fd                   add      di, bp
36be: 8bcb                   mov      cx, bx
36c0: f3ab                   rep stosw word ptr es:[di], ax
36c2: 03fd                   add      di, bp
36c4: 8bcb                   mov      cx, bx
36c6: f3ab                   rep stosw word ptr es:[di], ax
36c8: 03fd                   add      di, bp
36ca: 8bcb                   mov      cx, bx
36cc: f3ab                   rep stosw word ptr es:[di], ax
36ce: 03fd                   add      di, bp
36d0: 8bcb                   mov      cx, bx
36d2: f3ab                   rep stosw word ptr es:[di], ax
36d4: 03fd                   add      di, bp
36d6: 8bcb                   mov      cx, bx
36d8: f3ab                   rep stosw word ptr es:[di], ax
36da: 03fd                   add      di, bp
36dc: 8bcb                   mov      cx, bx
36de: f3ab                   rep stosw word ptr es:[di], ax
36e0: 03fd                   add      di, bp
36e2: 8bcb                   mov      cx, bx
36e4: f3ab                   rep stosw word ptr es:[di], ax
36e6: 03fd                   add      di, bp
36e8: 8bcb                   mov      cx, bx
36ea: f3ab                   rep stosw word ptr es:[di], ax
36ec: 03fd                   add      di, bp
36ee: 8bcb                   mov      cx, bx
36f0: f3ab                   rep stosw word ptr es:[di], ax
36f2: 03fd                   add      di, bp
36f4: 8bcb                   mov      cx, bx
36f6: f3ab                   rep stosw word ptr es:[di], ax
36f8: 03fd                   add      di, bp
36fa: 8bcb                   mov      cx, bx
36fc: f3ab                   rep stosw word ptr es:[di], ax
36fe: 03fd                   add      di, bp
3700: 8bcb                   mov      cx, bx
3702: f3ab                   rep stosw word ptr es:[di], ax
3704: 03fd                   add      di, bp
3706: 8bcb                   mov      cx, bx
3708: f3ab                   rep stosw word ptr es:[di], ax
370a: 03fd                   add      di, bp
370c: 8bcb                   mov      cx, bx
370e: f3ab                   rep stosw word ptr es:[di], ax
3710: 03fd                   add      di, bp
3712: 8bcb                   mov      cx, bx
3714: f3ab                   rep stosw word ptr es:[di], ax
3716: 03fd                   add      di, bp
3718: 8bcb                   mov      cx, bx
371a: f3ab                   rep stosw word ptr es:[di], ax
371c: 03fd                   add      di, bp
371e: 8bcb                   mov      cx, bx
3720: f3ab                   rep stosw word ptr es:[di], ax
3722: 03fd                   add      di, bp
3724: 8bcb                   mov      cx, bx
3726: f3ab                   rep stosw word ptr es:[di], ax
3728: 03fd                   add      di, bp
372a: 8bcb                   mov      cx, bx
372c: f3ab                   rep stosw word ptr es:[di], ax
372e: 03fd                   add      di, bp
3730: 8bcb                   mov      cx, bx
3732: f3ab                   rep stosw word ptr es:[di], ax
3734: 03fd                   add      di, bp
3736: 8bcb                   mov      cx, bx
3738: f3ab                   rep stosw word ptr es:[di], ax
373a: 03fd                   add      di, bp
373c: 8bcb                   mov      cx, bx
373e: f3ab                   rep stosw word ptr es:[di], ax
3740: 03fd                   add      di, bp
3742: 8bcb                   mov      cx, bx
3744: f3ab                   rep stosw word ptr es:[di], ax
3746: 03fd                   add      di, bp
3748: 8bcb                   mov      cx, bx
374a: f3ab                   rep stosw word ptr es:[di], ax
374c: 03fd                   add      di, bp
374e: 8bcb                   mov      cx, bx
3750: f3ab                   rep stosw word ptr es:[di], ax
3752: 03fd                   add      di, bp
3754: 8bcb                   mov      cx, bx
3756: f3ab                   rep stosw word ptr es:[di], ax
3758: 03fd                   add      di, bp
375a: 8bcb                   mov      cx, bx
375c: f3ab                   rep stosw word ptr es:[di], ax
375e: 03fd                   add      di, bp
3760: 8bcb                   mov      cx, bx
3762: f3ab                   rep stosw word ptr es:[di], ax
3764: 03fd                   add      di, bp
3766: 8bcb                   mov      cx, bx
3768: f3ab                   rep stosw word ptr es:[di], ax
376a: 03fd                   add      di, bp
376c: 8bcb                   mov      cx, bx
376e: f3ab                   rep stosw word ptr es:[di], ax
3770: 03fd                   add      di, bp
3772: 8bcb                   mov      cx, bx
3774: f3ab                   rep stosw word ptr es:[di], ax
3776: 03fd                   add      di, bp
3778: 8bcb                   mov      cx, bx
377a: f3ab                   rep stosw word ptr es:[di], ax
377c: 03fd                   add      di, bp
377e: 8bcb                   mov      cx, bx
3780: f3ab                   rep stosw word ptr es:[di], ax
3782: 03fd                   add      di, bp
3784: 8bcb                   mov      cx, bx
3786: f3ab                   rep stosw word ptr es:[di], ax
3788: 03fd                   add      di, bp
378a: 8bcb                   mov      cx, bx
378c: f3ab                   rep stosw word ptr es:[di], ax
378e: 03fd                   add      di, bp
3790: 8bcb                   mov      cx, bx
3792: f3ab                   rep stosw word ptr es:[di], ax
3794: 03fd                   add      di, bp
3796: 8bcb                   mov      cx, bx
3798: f3ab                   rep stosw word ptr es:[di], ax
379a: 03fd                   add      di, bp
379c: 8bcb                   mov      cx, bx
379e: f3ab                   rep stosw word ptr es:[di], ax
37a0: 03fd                   add      di, bp
37a2: 8bcb                   mov      cx, bx
37a4: f3ab                   rep stosw word ptr es:[di], ax
37a6: 03fd                   add      di, bp
37a8: 8bcb                   mov      cx, bx
37aa: f3ab                   rep stosw word ptr es:[di], ax
37ac: 03fd                   add      di, bp
37ae: 8bcb                   mov      cx, bx
37b0: f3ab                   rep stosw word ptr es:[di], ax
37b2: 03fd                   add      di, bp
37b4: 8bcb                   mov      cx, bx
37b6: f3ab                   rep stosw word ptr es:[di], ax
37b8: 03fd                   add      di, bp
37ba: 8bcb                   mov      cx, bx
37bc: f3ab                   rep stosw word ptr es:[di], ax
37be: 03fd                   add      di, bp
37c0: 8bcb                   mov      cx, bx
37c2: f3ab                   rep stosw word ptr es:[di], ax
37c4: 03fd                   add      di, bp
37c6: 8bcb                   mov      cx, bx
37c8: f3ab                   rep stosw word ptr es:[di], ax
37ca: 03fd                   add      di, bp
37cc: 8bcb                   mov      cx, bx
37ce: f3ab                   rep stosw word ptr es:[di], ax
37d0: 03fd                   add      di, bp
37d2: 8bcb                   mov      cx, bx
37d4: f3ab                   rep stosw word ptr es:[di], ax
37d6: 03fd                   add      di, bp
37d8: 8bcb                   mov      cx, bx
37da: f3ab                   rep stosw word ptr es:[di], ax
37dc: 03fd                   add      di, bp
37de: 8bcb                   mov      cx, bx
37e0: f3ab                   rep stosw word ptr es:[di], ax
37e2: 03fd                   add      di, bp
37e4: 8bcb                   mov      cx, bx
37e6: f3ab                   rep stosw word ptr es:[di], ax
37e8: 03fd                   add      di, bp
37ea: 8bcb                   mov      cx, bx
37ec: f3ab                   rep stosw word ptr es:[di], ax
37ee: 03fd                   add      di, bp
37f0: 8bcb                   mov      cx, bx
37f2: f3ab                   rep stosw word ptr es:[di], ax
37f4: 03fd                   add      di, bp
37f6: 8bcb                   mov      cx, bx
37f8: f3ab                   rep stosw word ptr es:[di], ax
37fa: 03fd                   add      di, bp
37fc: 8bcb                   mov      cx, bx
37fe: f3ab                   rep stosw word ptr es:[di], ax
3800: 03fd                   add      di, bp
3802: 8bcb                   mov      cx, bx
3804: f3ab                   rep stosw word ptr es:[di], ax
3806: 03fd                   add      di, bp
3808: 8bcb                   mov      cx, bx
380a: f3ab                   rep stosw word ptr es:[di], ax
380c: 03fd                   add      di, bp
380e: 8bcb                   mov      cx, bx
3810: f3ab                   rep stosw word ptr es:[di], ax
3812: 03fd                   add      di, bp
3814: 8bcb                   mov      cx, bx
3816: f3ab                   rep stosw word ptr es:[di], ax
3818: 03fd                   add      di, bp
381a: 8bcb                   mov      cx, bx
381c: f3ab                   rep stosw word ptr es:[di], ax
381e: 03fd                   add      di, bp
3820: 8bcb                   mov      cx, bx
3822: f3ab                   rep stosw word ptr es:[di], ax
3824: 03fd                   add      di, bp
3826: 8bcb                   mov      cx, bx
3828: f3ab                   rep stosw word ptr es:[di], ax
382a: 03fd                   add      di, bp
382c: 8bcb                   mov      cx, bx
382e: f3ab                   rep stosw word ptr es:[di], ax
3830: 03fd                   add      di, bp
3832: 8bcb                   mov      cx, bx
3834: f3ab                   rep stosw word ptr es:[di], ax
3836: 03fd                   add      di, bp
3838: 8bcb                   mov      cx, bx
383a: f3ab                   rep stosw word ptr es:[di], ax
383c: 03fd                   add      di, bp
383e: 8bcb                   mov      cx, bx
3840: f3ab                   rep stosw word ptr es:[di], ax
3842: 03fd                   add      di, bp
3844: 8bcb                   mov      cx, bx
3846: f3ab                   rep stosw word ptr es:[di], ax
3848: 03fd                   add      di, bp
384a: 8bcb                   mov      cx, bx
384c: f3ab                   rep stosw word ptr es:[di], ax
384e: 03fd                   add      di, bp
3850: 8bcb                   mov      cx, bx
3852: f3ab                   rep stosw word ptr es:[di], ax
3854: 03fd                   add      di, bp
3856: 8bcb                   mov      cx, bx
3858: f3ab                   rep stosw word ptr es:[di], ax
385a: 03fd                   add      di, bp
385c: 8bcb                   mov      cx, bx
385e: f3ab                   rep stosw word ptr es:[di], ax
3860: 03fd                   add      di, bp
3862: 8bcb                   mov      cx, bx
3864: f3ab                   rep stosw word ptr es:[di], ax
3866: 03fd                   add      di, bp
3868: 8bcb                   mov      cx, bx
386a: f3ab                   rep stosw word ptr es:[di], ax
386c: 03fd                   add      di, bp
386e: 8bcb                   mov      cx, bx
3870: f3ab                   rep stosw word ptr es:[di], ax
3872: 03fd                   add      di, bp
3874: 8bcb                   mov      cx, bx
3876: f3ab                   rep stosw word ptr es:[di], ax
3878: 03fd                   add      di, bp
387a: 8bcb                   mov      cx, bx
387c: f3ab                   rep stosw word ptr es:[di], ax
387e: 03fd                   add      di, bp
3880: 8bcb                   mov      cx, bx
3882: f3ab                   rep stosw word ptr es:[di], ax
3884: 03fd                   add      di, bp
3886: 8bcb                   mov      cx, bx
3888: f3ab                   rep stosw word ptr es:[di], ax
388a: 03fd                   add      di, bp
388c: 8bcb                   mov      cx, bx
388e: f3ab                   rep stosw word ptr es:[di], ax
3890: 03fd                   add      di, bp
3892: 8bcb                   mov      cx, bx
3894: f3ab                   rep stosw word ptr es:[di], ax
3896: 03fd                   add      di, bp
3898: 8bcb                   mov      cx, bx
389a: f3ab                   rep stosw word ptr es:[di], ax
389c: b80204                 mov      ax, 0x402
389f: ef                     out      dx, ax
38a0: bf8402                 mov      di, 0x284
38a3: 33c0                   xor      ax, ax
38a5: 8bcb                   mov      cx, bx
38a7: f3ab                   rep stosw word ptr es:[di], ax
38a9: 03fd                   add      di, bp
38ab: 8bcb                   mov      cx, bx
38ad: f3ab                   rep stosw word ptr es:[di], ax
38af: 03fd                   add      di, bp
38b1: 8bcb                   mov      cx, bx
38b3: f3ab                   rep stosw word ptr es:[di], ax
38b5: 03fd                   add      di, bp
38b7: 8bcb                   mov      cx, bx
38b9: f3ab                   rep stosw word ptr es:[di], ax
38bb: 03fd                   add      di, bp
38bd: 8bcb                   mov      cx, bx
38bf: f3ab                   rep stosw word ptr es:[di], ax
38c1: 03fd                   add      di, bp
38c3: 8bcb                   mov      cx, bx
38c5: f3ab                   rep stosw word ptr es:[di], ax
38c7: 03fd                   add      di, bp
38c9: 8bcb                   mov      cx, bx
38cb: f3ab                   rep stosw word ptr es:[di], ax
38cd: 03fd                   add      di, bp
38cf: 8bcb                   mov      cx, bx
38d1: f3ab                   rep stosw word ptr es:[di], ax
38d3: 03fd                   add      di, bp
38d5: 8bcb                   mov      cx, bx
38d7: f3ab                   rep stosw word ptr es:[di], ax
38d9: 03fd                   add      di, bp
38db: 8bcb                   mov      cx, bx
38dd: f3ab                   rep stosw word ptr es:[di], ax
38df: 03fd                   add      di, bp
38e1: 8bcb                   mov      cx, bx
38e3: f3ab                   rep stosw word ptr es:[di], ax
38e5: 03fd                   add      di, bp
38e7: 8bcb                   mov      cx, bx
38e9: f3ab                   rep stosw word ptr es:[di], ax
38eb: b8020f                 mov      ax, 0xf02
38ee: ef                     out      dx, ax
38ef: 8cd8                   mov      ax, ds
38f1: 8ec0                   mov      es, ax
38f3: c606bc600b             mov      byte ptr [0x60bc], 0xb
38f8: e8a9fb                 call     0x34a4
38fb: c606bc6008             mov      byte ptr [0x60bc], 8
3900: c3                     ret      
3901: d13e0c4b               sar      word ptr [0x4b0c], 1
3905: a10e4b                 mov      ax, word ptr [0x4b0e]
3908: d1f8                   sar      ax, 1
390a: a30e4b                 mov      word ptr [0x4b0e], ax
390d: 80c431                 add      ah, 0x31
3910: 8adc                   mov      bl, ah
3912: 32ed                   xor      ch, ch
3914: e8620c                 call     0x4579
3917: ff362c4b               push     word ptr [0x4b2c]
391b: a10e4b                 mov      ax, word ptr [0x4b0e]
391e: d1f8                   sar      ax, 1
3920: a30e4b                 mov      word ptr [0x4b0e], ax
3923: 80c449                 add      ah, 0x49
3926: 8adc                   mov      bl, ah
3928: 32ed                   xor      ch, ch
392a: e84c0c                 call     0x4579
392d: 8f06624b               pop      word ptr [0x4b62]
3931: c3                     ret      
3932: 33db                   xor      bx, bx
3934: a0554b                 mov      al, byte ptr [0x4b55]
3937: 8ae7                   mov      ah, bh
3939: 8bf8                   mov      di, ax
393b: 4f                     dec      di
393c: d0e8                   shr      al, 1
393e: 8ae8                   mov      ch, al
3940: 8a97bd58               mov      dl, byte ptr [bx + 0x58bd]
3944: 8ab7fd58               mov      dh, byte ptr [bx + 0x58fd]
3948: 8a85bd58               mov      al, byte ptr [di + 0x58bd]
394c: 8887bd58               mov      byte ptr [bx + 0x58bd], al
3950: 8a85fd58               mov      al, byte ptr [di + 0x58fd]
3954: 8887fd58               mov      byte ptr [bx + 0x58fd], al
3958: 8895bd58               mov      byte ptr [di + 0x58bd], dl
395c: 88b5fd58               mov      byte ptr [di + 0x58fd], dh
3960: 4f                     dec      di
3961: f6c301                 test     bl, 1
3964: 7510                   jne      0x3976
3966: 8a873d59               mov      al, byte ptr [bx + 0x593d]
396a: 8aa53d59               mov      ah, byte ptr [di + 0x593d]
396e: 88a73d59               mov      byte ptr [bx + 0x593d], ah
3972: 88853d59               mov      byte ptr [di + 0x593d], al
3976: fec3                   inc      bl
3978: fecd                   dec      ch
397a: 75c4                   jne      0x3940
397c: c3                     ret      
397d: e8ed3d                 call     0x776d
3980: 881ee04a               mov      byte ptr [0x4ae0], bl
3984: 881e8054               mov      byte ptr [0x5480], bl
3988: 32ff                   xor      bh, bh
398a: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
398e: 240f                   and      al, 0xf
3990: 8ae7                   mov      ah, bh
3992: 8bf8                   mov      di, ax
3994: 8a8540b2               mov      al, byte ptr [di - 0x4dc0]
3998: 22c0                   and      al, al
399a: 78e1                   js       0x397d
399c: 8b3e8656               mov      di, word ptr [0x5686]
39a0: 81e7ff00               and      di, 0xff
39a4: 740a                   je       0x39b0
39a6: 4f                     dec      di
39a7: 3a9d9c53               cmp      bl, byte ptr [di + 0x539c]
39ab: 74d0                   je       0x397d
39ad: 4f                     dec      di
39ae: 79f7                   jns      0x39a7
39b0: bf0c53                 mov      di, 0x530c
39b3: b94800                 mov      cx, 0x48
39b6: 33c0                   xor      ax, ax
39b8: f3ab                   rep stosw word ptr es:[di], ax
39ba: c606e14af0             mov      byte ptr [0x4ae1], 0xf0
39bf: e8cdf7                 call     0x318f
39c2: 32ff                   xor      bh, bh
39c4: 8a87fb5a               mov      al, byte ptr [bx + 0x5afb]
39c8: 8ae0                   mov      ah, al
39ca: 240f                   and      al, 0xf
39cc: a2bd4a                 mov      byte ptr [0x4abd], al
39cf: d0ec                   shr      ah, 1
39d1: d0ec                   shr      ah, 1
39d3: d0ec                   shr      ah, 1
39d5: d0ec                   shr      ah, 1
39d7: 8826be4a               mov      byte ptr [0x4abe], ah
39db: d0e8                   shr      al, 1
39dd: a21253                 mov      byte ptr [0x5312], al
39e0: 8ac7                   mov      al, bh
39e2: a20c53                 mov      byte ptr [0x530c], al
39e5: a20e53                 mov      byte ptr [0x530e], al
39e8: d0d8                   rcr      al, 1
39ea: 0440                   add      al, 0x40
39ec: a20f53                 mov      byte ptr [0x530f], al
39ef: d0ec                   shr      ah, 1
39f1: 88261453               mov      byte ptr [0x5314], ah
39f5: 8ac7                   mov      al, bh
39f7: d0d8                   rcr      al, 1
39f9: 0440                   add      al, 0x40
39fb: a21153                 mov      byte ptr [0x5311], al
39fe: c606135304             mov      byte ptr [0x5313], 4
3a03: 33db                   xor      bx, bx
3a05: a0da54                 mov      al, byte ptr [0x54da]
3a08: 3c04                   cmp      al, 4
3a0a: 7404                   je       0x3a10
3a0c: 3c0a                   cmp      al, 0xa
3a0e: 7502                   jne      0x3a12
3a10: b320                   mov      bl, 0x20
3a12: a0cf4a                 mov      al, byte ptr [0x4acf]
3a15: 32065b4b               xor      al, byte ptr [0x4b5b]
3a19: 02c3                   add      al, bl
3a1b: a23153                 mov      byte ptr [0x5331], al
3a1e: e87af9                 call     0x339b
3a21: e80c38                 call     0x7230
3a24: e82efa                 call     0x3455
3a27: e8b647                 call     0x81e0
3a2a: b81000                 mov      ax, 0x10
3a2d: 88261353               mov      byte ptr [0x5313], ah
3a31: 88260d53               mov      byte ptr [0x530d], ah
3a35: a21053                 mov      byte ptr [0x5310], al
3a38: a05154                 mov      al, byte ptr [0x5451]
3a3b: 8a26dd54               mov      ah, byte ptr [0x54dd]
3a3f: 8a168954               mov      dl, byte ptr [0x5489]
3a43: 22d2                   and      dl, dl
3a45: 7415                   je       0x3a5c
3a47: 8bd0                   mov      dx, ax
3a49: d1e0                   shl      ax, 1
3a4b: 051800                 add      ax, 0x18
3a4e: a21053                 mov      byte ptr [0x5310], al
3a51: 88261353               mov      byte ptr [0x5313], ah
3a55: c606e14ae6             mov      byte ptr [0x4ae1], 0xe6
3a5a: 8bc2                   mov      ax, dx
3a5c: d1e0                   shl      ax, 1
3a5e: d1e0                   shl      ax, 1
3a60: d1e0                   shl      ax, 1
3a62: d1e0                   shl      ax, 1
3a64: d1e0                   shl      ax, 1
3a66: d1e0                   shl      ax, 1
3a68: a36954                 mov      word ptr [0x5469], ax
3a6b: e888ef                 call     0x29f6
3a6e: bb0200                 mov      bx, 2
3a71: b81000                 mov      ax, 0x10
3a74: 88874f54               mov      byte ptr [bx + 0x544f], al
3a78: 88a7db54               mov      byte ptr [bx + 0x54db], ah
3a7c: 88a74c54               mov      byte ptr [bx + 0x544c], ah
3a80: 88a75153               mov      byte ptr [bx + 0x5351], ah
3a84: fecb                   dec      bl
3a86: 79ec                   jns      0x3a74
3a88: e810f9                 call     0x339b
3a8b: c6067754af             mov      byte ptr [0x5477], 0xaf
3a90: c606785408             mov      byte ptr [0x5478], 8
3a95: c3                     ret      
3a96: a1f95f                 mov      ax, word ptr [0x5ff9]
3a99: 2b067154               sub      ax, word ptr [0x5471]
3a9d: d1f8                   sar      ax, 1
3a9f: d1f8                   sar      ax, 1
3aa1: d1f8                   sar      ax, 1
3aa3: 8a1e8154               mov      bl, byte ptr [0x5481]
3aa7: 32ff                   xor      bh, bh
3aa9: 8b3e8054               mov      di, word ptr [0x5480]
3aad: 81e7ff00               and      di, 0xff
3ab1: 8bd0                   mov      dx, ax
3ab3: 8a871d5d               mov      al, byte ptr [bx + 0x5d1d]
3ab7: 8aa76b5d               mov      ah, byte ptr [bx + 0x5d6b]
3abb: 2a851d5d               sub      al, byte ptr [di + 0x5d1d]
3abf: 1aa56b5d               sbb      ah, byte ptr [di + 0x5d6b]
3ac3: 03c2                   add      ax, dx
3ac5: 8af4                   mov      dh, ah
3ac7: 88260c4a               mov      byte ptr [0x4a0c], ah
3acb: 7902                   jns      0x3acf
3acd: f7d8                   neg      ax
3acf: 8b0e7456               mov      cx, word ptr [0x5674]
3ad3: 2bc8                   sub      cx, ax
3ad5: 3bc8                   cmp      cx, ax
3ad7: 7205                   jb       0x3ade
3ad9: 8bc8                   mov      cx, ax
3adb: 80f680                 xor      dh, 0x80
3ade: 890eee4a               mov      word ptr [0x4aee], cx
3ae2: 80f680                 xor      dh, 0x80
3ae5: 88367654               mov      byte ptr [0x5476], dh
3ae9: c3                     ret      
3aea: a08654                 mov      al, byte ptr [0x5486]
3aed: 2a068554               sub      al, byte ptr [0x5485]
3af1: 7524                   jne      0x3b17
3af3: a08054                 mov      al, byte ptr [0x5480]
3af6: 2a068956               sub      al, byte ptr [0x5689]
3afa: 7304                   jae      0x3b00
3afc: 02067156               add      al, byte ptr [0x5671]
3b00: 8a268154               mov      ah, byte ptr [0x5481]
3b04: 2a268956               sub      ah, byte ptr [0x5689]
3b08: 7304                   jae      0x3b0e
3b0a: 02267156               add      ah, byte ptr [0x5671]
3b0e: 2ae0                   sub      ah, al
3b10: 7505                   jne      0x3b17
3b12: a00c4a                 mov      al, byte ptr [0x4a0c]
3b15: 22c0                   and      al, al
3b17: c3                     ret      
3b18: 02067756               add      al, byte ptr [0x5677]
3b1c: 27                     daa      
3b1d: 3a061154               cmp      al, byte ptr [0x5411]
3b21: 7203                   jb       0x3b26
3b23: a01154                 mov      al, byte ptr [0x5411]
3b26: a27756                 mov      byte ptr [0x5677], al
3b29: a10a00                 mov      ax, word ptr [0xa]
3b2c: 22260c00               and      ah, byte ptr [0xc]
3b30: 8ec0                   mov      es, ax
3b32: a07756                 mov      al, byte ptr [0x5677]
3b35: d0e8                   shr      al, 1
3b37: d0e8                   shr      al, 1
3b39: d0e8                   shr      al, 1
3b3b: d0e8                   shr      al, 1
3b3d: bfd81b                 mov      di, 0x1bd8
3b40: e811e7                 call     0x2254
3b43: a07756                 mov      al, byte ptr [0x5677]
3b46: 240f                   and      al, 0xf
3b48: bfd91b                 mov      di, 0x1bd9
3b4b: e806e7                 call     0x2254
3b4e: 8cd8                   mov      ax, ds
3b50: 8ec0                   mov      es, ax
3b52: c3                     ret      
3b53: a0a554                 mov      al, byte ptr [0x54a5]
3b56: 0a06c04a               or       al, byte ptr [0x4ac0]
3b5a: 753c                   jne      0x3b98
3b5c: a0b254                 mov      al, byte ptr [0x54b2]
3b5f: 22c0                   and      al, al
3b61: 7807                   js       0x3b6a
3b63: a0234b                 mov      al, byte ptr [0x4b23]
3b66: 2403                   and      al, 3
3b68: 742e                   je       0x3b98
3b6a: a07756                 mov      al, byte ptr [0x5677]
3b6d: 22c0                   and      al, al
3b6f: 7427                   je       0x3b98
3b71: 8026494bff             and      byte ptr [0x4b49], 0xff
3b76: 7811                   js       0x3b89
3b78: fe0e7a54               dec      byte ptr [0x547a]
3b7c: 790b                   jns      0x3b89
3b7e: a00b60                 mov      al, byte ptr [0x600b]
3b81: a27a54                 mov      byte ptr [0x547a], al
3b84: b099                   mov      al, 0x99
3b86: e88fff                 call     0x3b18
3b89: c606364b80             mov      byte ptr [0x4b36], 0x80
3b8e: 800e2a4b03             or       byte ptr [0x4b2a], 3
3b93: d1265c53               shl      word ptr [0x535c], 1
3b97: c3                     ret      
3b98: 80262a4bfc             and      byte ptr [0x4b2a], 0xfc
3b9d: c606364b00             mov      byte ptr [0x4b36], 0
3ba2: c3                     ret      
3ba3: b00f                   mov      al, 0xf
3ba5: be2d4a                 mov      si, 0x4a2d
3ba8: eb0e                   jmp      0x3bb8
3baa: 90                     nop      
3bab: b00f                   mov      al, 0xf
3bad: be4d4a                 mov      si, 0x4a4d
3bb0: eb06                   jmp      0x3bb8
3bb2: 90                     nop      
3bb3: b00a                   mov      al, 0xa
3bb5: be0d4a                 mov      si, 0x4a0d
3bb8: 8be8                   mov      bp, ax
3bba: 8bdf                   mov      bx, di
3bbc: b90800                 mov      cx, 8
3bbf: bac403                 mov      dx, 0x3c4
3bc2: b80208                 mov      ax, 0x802
3bc5: ef                     out      dx, ax
3bc6: ac                     lodsb    al, byte ptr [si]
3bc7: 2688850020             mov      byte ptr es:[di + 0x2000], al
3bcc: aa                     stosb    byte ptr es:[di], al
3bcd: 4f                     dec      di
3bce: b002                   mov      al, 2
3bd0: d0ec                   shr      ah, 1
3bd2: 73f1                   jae      0x3bc5
3bd4: 83c728                 add      di, 0x28
3bd7: e2e9                   loop     0x3bc2
3bd9: b40f                   mov      ah, 0xf
3bdb: ef                     out      dx, ax
3bdc: 8bfb                   mov      di, bx
3bde: 47                     inc      di
3bdf: 8bc5                   mov      ax, bp
3be1: 83eb05                 sub      bx, 5
3be4: 8887d95f               mov      byte ptr [bx + 0x5fd9], al
3be8: c3                     ret      
3be9: bfd95f                 mov      di, 0x5fd9
3bec: b91e00                 mov      cx, 0x1e
3bef: b00f                   mov      al, 0xf
3bf1: f3aa                   rep stosb byte ptr es:[di], al
3bf3: bf0500                 mov      di, 5
3bf6: b800a0                 mov      ax, 0xa000
3bf9: 8ec0                   mov      es, ax
3bfb: a02656                 mov      al, byte ptr [0x5626]
3bfe: a2ba4a                 mov      byte ptr [0x4aba], al
3c01: 47                     inc      di
3c02: fe0eba4a               dec      byte ptr [0x4aba]
3c06: 780e                   js       0x3c16
3c08: e8a8ff                 call     0x3bb3
3c0b: 47                     inc      di
3c0c: 83ff23                 cmp      di, 0x23
3c0f: 72f0                   jb       0x3c01
3c11: 8cd8                   mov      ax, ds
3c13: 8ec0                   mov      es, ax
3c15: c3                     ret      
3c16: e88aff                 call     0x3ba3
3c19: 47                     inc      di
3c1a: ebf0                   jmp      0x3c0c
3c1c: a1c508                 mov      ax, word ptr [0x8c5]
3c1f: 3de406                 cmp      ax, 0x6e4
3c22: a0b208                 mov      al, byte ptr [0x8b2]
3c25: 7529                   jne      0x3c50
3c27: 8a26a760               mov      ah, byte ptr [0x60a7]
3c2b: 22e4                   and      ah, ah
3c2d: 7421                   je       0x3c50
3c2f: 8ae0                   mov      ah, al
3c31: f6c410                 test     ah, 0x10
3c34: 7402                   je       0x3c38
3c36: 0c01                   or       al, 1
3c38: f6c402                 test     ah, 2
3c3b: 7402                   je       0x3c3f
3c3d: 0c10                   or       al, 0x10
3c3f: f6c401                 test     ah, 1
3c42: 7404                   je       0x3c48
3c44: 0c02                   or       al, 2
3c46: 24fe                   and      al, 0xfe
3c48: 22c0                   and      al, al
3c4a: 7515                   jne      0x3c61
3c4c: fe067ce2               inc      byte ptr [0xe27c]
3c50: 8a26704a               mov      ah, byte ptr [0x4a70]
3c54: 22e4                   and      ah, ah
3c56: 7809                   js       0x3c61
3c58: 80264c08ff             and      byte ptr [0x84c], 0xff
3c5d: 7902                   jns      0x3c61
3c5f: b010                   mov      al, 0x10
3c61: a2234b                 mov      byte ptr [0x4b23], al
3c64: c3                     ret      
3c65: 8b362500               mov      si, word ptr [0x25]
3c69: f7ee                   imul     si
3c6b: d1e0                   shl      ax, 1
3c6d: 23c0                   and      ax, ax
3c6f: 8bc2                   mov      ax, dx
3c71: d1d0                   rcl      ax, 1
3c73: 7405                   je       0x3c7a
3c75: 23d2                   and      dx, dx
3c77: 7901                   jns      0x3c7a
3c79: 40                     inc      ax
3c7a: c3                     ret      
3c7b: a2cb4a                 mov      byte ptr [0x4acb], al
3c7e: 8ae0                   mov      ah, al
3c80: bb0400                 mov      bx, 4
3c83: 22e4                   and      ah, ah
3c85: 780d                   js       0x3c94
3c87: 8a87b44a               mov      al, byte ptr [bx + 0x4ab4]
3c8b: 88872bc5               mov      byte ptr [bx - 0x3ad5], al
3c8f: eb12                   jmp      0x3ca3
3c91: 90                     nop      
3c92: f8                     clc      
3c93: c3                     ret      
3c94: a08b56                 mov      al, byte ptr [0x568b]
3c97: 22c0                   and      al, al
3c99: 79f7                   jns      0x3c92
3c9b: 8a872bc5               mov      al, byte ptr [bx - 0x3ad5]
3c9f: 8887b44a               mov      byte ptr [bx + 0x4ab4], al
3ca3: fecb                   dec      bl
3ca5: 79dc                   jns      0x3c83
3ca7: 22e4                   and      ah, ah
3ca9: 7811                   js       0x3cbc
3cab: bb0b00                 mov      bx, 0xb
3cae: 8a87816f               mov      al, byte ptr [bx + 0x6f81]
3cb2: 343b                   xor      al, 0x3b
3cb4: 88870d56               mov      byte ptr [bx + 0x560d], al
3cb8: fecb                   dec      bl
3cba: 79f2                   jns      0x3cae
3cbc: bb1a00                 mov      bx, 0x1a
3cbf: 22e4                   and      ah, ah
3cc1: 7908                   jns      0x3ccb
3cc3: 8a9710c5               mov      dl, byte ptr [bx - 0x3af0]
3cc7: 8ab735c5               mov      dh, byte ptr [bx - 0x3acb]
3ccb: 33ff                   xor      di, di
3ccd: 47                     inc      di
3cce: 7820                   js       0x3cf0
3cd0: e8250f                 call     0x4bf8
3cd3: 8ac8                   mov      cl, al
3cd5: 22e4                   and      ah, ah
3cd7: 7827                   js       0x3d00
3cd9: 3a870d56               cmp      al, byte ptr [bx + 0x560d]
3cdd: 75ee                   jne      0x3ccd
3cdf: 8bc7                   mov      ax, di
3ce1: 888710c5               mov      byte ptr [bx - 0x3af0], al
3ce5: 88a735c5               mov      byte ptr [bx - 0x3acb], ah
3ce9: 8a26cb4a               mov      ah, byte ptr [0x4acb]
3ced: eb19                   jmp      0x3d08
3cef: 90                     nop      
3cf0: c606b54a3b             mov      byte ptr [0x4ab5], 0x3b
3cf5: 8ac4                   mov      al, ah
3cf7: 22c0                   and      al, al
3cf9: 7803                   js       0x3cfe
3cfb: e97dff                 jmp      0x3c7b
3cfe: f9                     stc      
3cff: c3                     ret      
3d00: 3bfa                   cmp      di, dx
3d02: 75c9                   jne      0x3ccd
3d04: 888f054f               mov      byte ptr [bx + 0x4f05], cl
3d08: fecb                   dec      bl
3d0a: 79b3                   jns      0x3cbf
3d0c: bb0400                 mov      bx, 4
3d0f: bf0900                 mov      di, 9
3d12: 8a87b44a               mov      al, byte ptr [bx + 0x4ab4]
3d16: 22e4                   and      ah, ah
3d18: 7806                   js       0x3d20
3d1a: 888730c5               mov      byte ptr [bx - 0x3ad0], al
3d1e: eb06                   jmp      0x3d26
3d20: 3a8730c5               cmp      al, byte ptr [bx - 0x3ad0]
3d24: 75ca                   jne      0x3cf0
3d26: fecb                   dec      bl
3d28: 79e8                   jns      0x3d12
3d2a: 22e4                   and      ah, ah
3d2c: 792c                   jns      0x3d5a
3d2e: bb1a00                 mov      bx, 0x1a
3d31: a0aadd                 mov      al, byte ptr [0xddaa]
3d34: 22c0                   and      al, al
3d36: 7405                   je       0x3d3d
3d38: 80fb18                 cmp      bl, 0x18
3d3b: 7208                   jb       0x3d45
3d3d: 8a87054f               mov      al, byte ptr [bx + 0x4f05]
3d41: 88870d56               mov      byte ptr [bx + 0x560d], al
3d45: fecb                   dec      bl
3d47: 79e8                   jns      0x3d31
3d49: bb0b00                 mov      bx, 0xb
3d4c: 8a870d56               mov      al, byte ptr [bx + 0x560d]
3d50: 343b                   xor      al, 0x3b
3d52: 8887816f               mov      byte ptr [bx + 0x6f81], al
3d56: fecb                   dec      bl
3d58: 79f2                   jns      0x3d4c
3d5a: b080                   mov      al, 0x80
3d5c: a28b56                 mov      byte ptr [0x568b], al
3d5f: f8                     clc      
3d60: c3                     ret      
3d61: 0000                   add      byte ptr [bx + si], al
3d63: 0000                   add      byte ptr [bx + si], al
3d65: 0000                   add      byte ptr [bx + si], al
3d67: 0000                   add      byte ptr [bx + si], al
3d69: 0000                   add      byte ptr [bx + si], al
3d6b: 0000                   add      byte ptr [bx + si], al
3d6d: 0000                   add      byte ptr [bx + si], al
3d6f: 00b8d809               add      byte ptr [bx + si + 0x9d8], bh
3d73: 8ed8                   mov      ds, ax
3d75: 8ec0                   mov      es, ax
3d77: bed06e                 mov      si, 0x6ed0
3d7a: bf0552                 mov      di, 0x5205
3d7d: b98000                 mov      cx, 0x80
3d80: f3a5                   rep movsw word ptr es:[di], word ptr [si]
3d82: 33f6                   xor      si, si
3d84: 8bde                   mov      bx, si
3d86: 8a849760               mov      al, byte ptr [si + 0x6097]
3d8a: 8887054d               mov      byte ptr [bx + 0x4d05], al
3d8e: 8887054e               mov      byte ptr [bx + 0x4e05], al
3d92: 4e                     dec      si
3d93: 7903                   jns      0x3d98
3d95: be0f00                 mov      si, 0xf
3d98: fecb                   dec      bl
3d9a: 75ea                   jne      0x3d86
3d9c: e84107                 call     0x44e0
3d9f: e84df2                 call     0x2fef
3da2: e80be6                 call     0x23b0
3da5: e8a003                 call     0x4148
3da8: e8f6d6                 call     0x14a1
3dab: e83250                 call     0x8de0
3dae: e8f0d6                 call     0x14a1
3db1: e893d8                 call     0x1647
3db4: e8830e                 call     0x4c3a
3db7: d02e1054               shr      byte ptr [0x5410], 1
3dbb: 32ff                   xor      bh, bh
3dbd: e8e1d6                 call     0x14a1
3dc0: e828ef                 call     0x2ceb
3dc3: 80267956ff             and      byte ptr [0x5679], 0xff
3dc8: 7822                   js       0x3dec
3dca: e80601                 call     0x3ed3
3dcd: b080                   mov      al, 0x80
3dcf: e86656                 call     0x9438
3dd2: e8df01                 call     0x3fb4
3dd5: 32c0                   xor      al, al
3dd7: e85e56                 call     0x9438
3dda: e8c4d6                 call     0x14a1
3ddd: e86803                 call     0x4148
3de0: ebd5                   jmp      0x3db7
3de2: b0c0                   mov      al, 0xc0
3de4: a21054                 mov      byte ptr [0x5410], al
3de7: a26e54                 mov      byte ptr [0x546e], al
3dea: eb22                   jmp      0x3e0e
3dec: e81852                 call     0x9007
3def: bb1700                 mov      bx, 0x17
3df2: e8e7df                 call     0x1ddc
3df5: 32ff                   xor      bh, bh
3df7: 80fb10                 cmp      bl, 0x10
3dfa: 7306                   jae      0x3e02
3dfc: b009                   mov      al, 9
3dfe: 8887e14c               mov      byte ptr [bx + 0x4ce1], al
3e02: fecb                   dec      bl
3e04: 79ec                   jns      0x3df2
3e06: 32c0                   xor      al, al
3e08: a27a56                 mov      byte ptr [0x567a], al
3e0b: a27b56                 mov      byte ptr [0x567b], al
3e0e: a02556                 mov      al, byte ptr [0x5625]
3e11: a26c54                 mov      byte ptr [0x546c], al
3e14: e846e6                 call     0x245d
3e17: a01054                 mov      al, byte ptr [0x5410]
3e1a: 22c0                   and      al, al
3e1c: 7814                   js       0x3e32
3e1e: a17e56                 mov      ax, word ptr [0x567e]
3e21: 3a06addd               cmp      al, byte ptr [0xddad]
3e25: 7411                   je       0x3e38
3e27: 3a26addd               cmp      ah, byte ptr [0xddad]
3e2b: 7505                   jne      0x3e32
3e2d: 8ae0                   mov      ah, al
3e2f: eb07                   jmp      0x3e38
3e31: 90                     nop      
3e32: e8c3e5                 call     0x23f8
3e35: eb54                   jmp      0x3e8b
3e37: 90                     nop      
3e38: 88268056               mov      byte ptr [0x5680], ah
3e3c: c6060853c0             mov      byte ptr [0x5308], 0xc0
3e41: e8b6d6                 call     0x14fa
3e44: 80266b08ff             and      byte ptr [0x86b], 0xff
3e49: 7597                   jne      0x3de2
3e4b: e88500                 call     0x3ed3
3e4e: b080                   mov      al, 0x80
3e50: e8e555                 call     0x9438
3e53: e85e01                 call     0x3fb4
3e56: 32c0                   xor      al, al
3e58: e8dd55                 call     0x9438
3e5b: 32c0                   xor      al, al
3e5d: e8d653                 call     0x9236
3e60: e895e5                 call     0x23f8
3e63: e80d06                 call     0x4473
3e66: e8df02                 call     0x4148
3e69: a00853                 mov      al, byte ptr [0x5308]
3e6c: 22c0                   and      al, al
3e6e: 740b                   je       0x3e7b
3e70: e887d6                 call     0x14fa
3e73: 32c0                   xor      al, al
3e75: a20853                 mov      byte ptr [0x5308], al
3e78: e826d6                 call     0x14a1
3e7b: e877d6                 call     0x14f5
3e7e: e8c9d6                 call     0x154a
3e81: a0aadd                 mov      al, byte ptr [0xddaa]
3e84: 22c0                   and      al, al
3e86: 7403                   je       0x3e8b
3e88: e81b52                 call     0x90a6
3e8b: fe06afdd               inc      byte ptr [0xddaf]
3e8f: fe068c56               inc      byte ptr [0x568c]
3e93: a08c56                 mov      al, byte ptr [0x568c]
3e96: 3a06acdd               cmp      al, byte ptr [0xddac]
3e9a: 7303                   jae      0x3e9f
3e9c: e96fff                 jmp      0x3e0e
3e9f: c6068c5600             mov      byte ptr [0x568c], 0
3ea4: a0aadd                 mov      al, byte ptr [0xddaa]
3ea7: 22c0                   and      al, al
3ea9: 750f                   jne      0x3eba
3eab: e893d6                 call     0x1541
3eae: e8fc05                 call     0x44ad
3eb1: e893d7                 call     0x1647
3eb4: e822e5                 call     0x23d9
3eb7: e9fdfe                 jmp      0x3db7
3eba: e8d951                 call     0x9096
3ebd: d02e1054               shr      byte ptr [0x5410], 1
3ec1: fe0eabdd               dec      byte ptr [0xddab]
3ec5: 7803                   js       0x3eca
3ec7: e925ff                 jmp      0x3def
3eca: a05856                 mov      al, byte ptr [0x5658]
3ecd: 3c07                   cmp      al, 7
3ecf: 73e3                   jae      0x3eb4
3ed1: 72e4                   jb       0x3eb7
3ed3: e8eb02                 call     0x41c1
3ed6: c606704a00             mov      byte ptr [0x4a70], 0
3edb: bb0e55                 mov      bx, 0x550e
3ede: b91f00                 mov      cx, 0x1f
3ee1: c60708                 mov      byte ptr [bx], 8
3ee4: 83c304                 add      bx, 4
3ee7: e2f8                   loop     0x3ee1
3ee9: 32ff                   xor      bh, bh
3eeb: a07856                 mov      al, byte ptr [0x5678]
3eee: a2804a                 mov      byte ptr [0x4a80], al
3ef1: 2ec7068a6c9090         mov      word ptr cs:[0x6c8a], 0x9090
3ef8: a10a00                 mov      ax, word ptr [0xa]
3efb: 8ec0                   mov      es, ax
3efd: bac403                 mov      dx, 0x3c4
3f00: b8020f                 mov      ax, 0xf02
3f03: ef                     out      dx, ax
3f04: 33c0                   xor      ax, ax
3f06: b9a00f                 mov      cx, 0xfa0
3f09: 8bf8                   mov      di, ax
3f0b: f3ab                   rep stosw word ptr es:[di], ax
3f0d: b8d809                 mov      ax, 0x9d8
3f10: 8ec0                   mov      es, ax
3f12: c606744a17             mov      byte ptr [0x4a74], 0x17
3f17: c606814a10             mov      byte ptr [0x4a81], 0x10
3f1c: e80e05                 call     0x442d
3f1f: a10a00                 mov      ax, word ptr [0xa]
3f22: 8ec0                   mov      es, ax
3f24: 33ff                   xor      di, di
3f26: b80208                 mov      ax, 0x802
3f29: bac403                 mov      dx, 0x3c4
3f2c: ef                     out      dx, ax
3f2d: b8ffff                 mov      ax, 0xffff
3f30: b97800                 mov      cx, 0x78
3f33: f3ab                   rep stosw word ptr es:[di], ax
3f35: bb2700                 mov      bx, 0x27
3f38: b99400                 mov      cx, 0x94
3f3b: aa                     stosb    byte ptr es:[di], al
3f3c: 03fb                   add      di, bx
3f3e: e2fb                   loop     0x3f3b
3f40: b99803                 mov      cx, 0x398
3f43: f3ab                   rep stosw word ptr es:[di], ax
3f45: bf1701                 mov      di, 0x117
3f48: b99400                 mov      cx, 0x94
3f4b: aa                     stosb    byte ptr es:[di], al
3f4c: 03fb                   add      di, bx
3f4e: e2fb                   loop     0x3f4b
3f50: b8020f                 mov      ax, 0xf02
3f53: ef                     out      dx, ax
3f54: 8cd8                   mov      ax, ds
3f56: 8ec0                   mov      es, ax
3f58: e86e18                 call     0x57c9
3f5b: e82903                 call     0x4287
3f5e: 8a1e8a56               mov      bl, byte ptr [0x568a]
3f62: e879e6                 call     0x25de
3f65: e857d4                 call     0x13bf
3f68: e81a20                 call     0x5f85
3f6b: e8def5                 call     0x354c
3f6e: e85e19                 call     0x58cf
3f71: bb2c00                 mov      bx, 0x2c
3f74: c606bd02ee             mov      byte ptr [0x2bd], 0xee
3f79: e81ad5                 call     0x1496
3f7c: e8d503                 call     0x4354
3f7f: 7305                   jae      0x3f86
3f81: e8c8f5                 call     0x354c
3f84: ebeb                   jmp      0x3f71
3f86: c606704a00             mov      byte ptr [0x4a70], 0
3f8b: 2ec7068a6cfec0         mov      word ptr cs:[0x6c8a], 0xc0fe
3f92: c606814a00             mov      byte ptr [0x4a81], 0
3f97: bac403                 mov      dx, 0x3c4
3f9a: b8020f                 mov      ax, 0xf02
3f9d: ef                     out      dx, ax
3f9e: 33ff                   xor      di, di
3fa0: a10a00                 mov      ax, word ptr [0xa]
3fa3: 8ec0                   mov      es, ax
3fa5: b9a00f                 mov      cx, 0xfa0
3fa8: 8bc7                   mov      ax, di
3faa: f3ab                   rep stosw word ptr es:[di], ax
3fac: 8cd8                   mov      ax, ds
3fae: 8ec0                   mov      es, ax
3fb0: e87a04                 call     0x442d
3fb3: c3                     ret      
3fb4: b8d809                 mov      ax, 0x9d8
3fb7: 8ed8                   mov      ds, ax
3fb9: 8ec0                   mov      es, ax
3fbb: c606a760ff             mov      byte ptr [0x60a7], 0xff
3fc0: e8fe01                 call     0x41c1
3fc3: e8f002                 call     0x42b6
3fc6: e8b801                 call     0x4181
3fc9: e81dfc                 call     0x3be9
3fcc: e84ee2                 call     0x221d
3fcf: 8a1e7256               mov      bl, byte ptr [0x5672]
3fd3: 881e8154               mov      byte ptr [0x5481], bl
3fd7: c706f95f0004           mov      word ptr [0x5ff9], 0x400
3fdd: c606674b4c             mov      byte ptr [0x4b67], 0x4c
3fe2: e83120                 call     0x6016
3fe5: 8a1e7256               mov      bl, byte ptr [0x5672]
3fe9: e894f9                 call     0x3980
3fec: e89a14                 call     0x5489
3fef: e8ae25                 call     0x65a0
3ff2: e8f803                 call     0x43ed
3ff5: e8e841                 call     0x81e0
3ff8: e8a525                 call     0x65a0
3ffb: e807e0                 call     0x2005
3ffe: e8dce2                 call     0x22dd
4001: e8e5e2                 call     0x22e9
4004: e8e603                 call     0x43ed
4007: c606185400             mov      byte ptr [0x5418], 0
400c: b080                   mov      al, 0x80
400e: a21354                 mov      byte ptr [0x5413], al
4011: a2704a                 mov      byte ptr [0x4a70], al
4014: e84904                 call     0x4460
4017: fe0e1854               dec      byte ptr [0x5418]
401b: e818de                 call     0x1e36
401e: e820e3                 call     0x2341
4021: e8bb02                 call     0x42df
4024: e8b941                 call     0x81e0
4027: e871ee                 call     0x2e9b
402a: bac403                 mov      dx, 0x3c4
402d: b8020f                 mov      ax, 0xf02
4030: ef                     out      dx, ax
4031: e86c25                 call     0x65a0
4034: e87214                 call     0x54a9
4037: e8afe2                 call     0x22e9
403a: e882d3                 call     0x13bf
403d: e894de                 call     0x1ed4
4040: e8c2df                 call     0x2005
4043: e8cadb                 call     0x1c10
4046: e82b03                 call     0x4374
4049: e88703                 call     0x43d3
404c: a05d54                 mov      al, byte ptr [0x545d]
404f: 22c0                   and      al, al
4051: 793e                   jns      0x4091
4053: a0384b                 mov      al, byte ptr [0x4b38]
4056: 22c0                   and      al, al
4058: 7537                   jne      0x4091
405a: a0e14a                 mov      al, byte ptr [0x4ae1]
405d: 22c0                   and      al, al
405f: 7507                   jne      0x4068
4061: a0264b                 mov      al, byte ptr [0x4b26]
4064: 22c0                   and      al, al
4066: 7429                   je       0x4091
4068: a07054                 mov      al, byte ptr [0x5470]
406b: 22c0                   and      al, al
406d: 7505                   jne      0x4074
406f: b00b                   mov      al, 0xb
4071: a2b347                 mov      byte ptr [0x47b3], al
4074: be6044                 mov      si, 0x4460
4077: e8bde1                 call     0x2237
407a: e87003                 call     0x43ed
407d: b8eaff                 mov      ax, 0xffea
4080: a3c24a                 mov      word ptr [0x4ac2], ax
4083: 88260460               mov      byte ptr [0x6004], ah
4087: 32c0                   xor      al, al
4089: a21a4b                 mov      byte ptr [0x4b1a], al
408c: e8a0d5                 call     0x162f
408f: eb68                   jmp      0x40f9
4091: e85903                 call     0x43ed
4094: e80503                 call     0x439c
4097: a0e14a                 mov      al, byte ptr [0x4ae1]
409a: 22c0                   and      al, al
409c: 753c                   jne      0x40da
409e: 8a26274b               mov      ah, byte ptr [0x4b27]
40a2: 22e4                   and      ah, ah
40a4: 7934                   jns      0x40da
40a6: a0264b                 mov      al, byte ptr [0x4b26]
40a9: 22c0                   and      al, al
40ab: 742d                   je       0x40da
40ad: a0214b                 mov      al, byte ptr [0x4b21]
40b0: 22c0                   and      al, al
40b2: 7804                   js       0x40b8
40b4: 3c02                   cmp      al, 2
40b6: 7304                   jae      0x40bc
40b8: 88267f54               mov      byte ptr [0x547f], ah
40bc: fe0e7454               dec      byte ptr [0x5474]
40c0: 7918                   jns      0x40da
40c2: fe067454               inc      byte ptr [0x5474]
40c6: a0284b                 mov      al, byte ptr [0x4b28]
40c9: 22c0                   and      al, al
40cb: 750d                   jne      0x40da
40cd: e88403                 call     0x4454
40d0: 8a1e1554               mov      bl, byte ptr [0x5415]
40d4: e912ff                 jmp      0x3fe9
40d7: a27454                 mov      byte ptr [0x5474], al
40da: a0e14a                 mov      al, byte ptr [0x4ae1]
40dd: 22c0                   and      al, al
40df: 750e                   jne      0x40ef
40e1: a0274b                 mov      al, byte ptr [0x4b27]
40e4: 22c0                   and      al, al
40e6: 780e                   js       0x40f6
40e8: a0264b                 mov      al, byte ptr [0x4b26]
40eb: 22c0                   and      al, al
40ed: 7407                   je       0x40f6
40ef: 80263108ff             and      byte ptr [0x831], 0xff
40f4: 7803                   js       0x40f9
40f6: e91eff                 jmp      0x4017
40f9: 802631087f             and      byte ptr [0x831], 0x7f
40fe: a07054                 mov      al, byte ptr [0x5470]
4101: 22c0                   and      al, al
4103: 7505                   jne      0x410a
4105: c6066e54c0             mov      byte ptr [0x546e], 0xc0
410a: c606704a00             mov      byte ptr [0x4a70], 0
410f: e84203                 call     0x4454
4112: a07956                 mov      al, byte ptr [0x5679]
4115: 22c0                   and      al, al
4117: 7921                   jns      0x413a
4119: a0aadd                 mov      al, byte ptr [0xddaa]
411c: 22c0                   and      al, al
411e: 7420                   je       0x4140
4120: 8a1eaddd               mov      bl, byte ptr [0xddad]
4124: 32ff                   xor      bh, bh
4126: a02656                 mov      al, byte ptr [0x5626]
4129: 8887f94c               mov      byte ptr [bx + 0x4cf9], al
412d: a08554                 mov      al, byte ptr [0x5485]
4130: 3c04                   cmp      al, 4
4132: 7406                   je       0x413a
4134: 80c30c                 add      bl, 0xc
4137: e8a2dc                 call     0x1ddc
413a: a08b54                 mov      al, byte ptr [0x548b]
413d: a22656                 mov      byte ptr [0x5626], al
4140: c606a76000             mov      byte ptr [0x60a7], 0
4145: e9f20a                 jmp      0x4c3a
4148: c606704a41             mov      byte ptr [0x4a70], 0x41
414d: e8f703                 call     0x4547
4150: b800a0                 mov      ax, 0xa000
4153: a30a00                 mov      word ptr [0xa], ax
4156: 8ec0                   mov      es, ax
4158: bad403                 mov      dx, 0x3d4
415b: b80c00                 mov      ax, 0xc
415e: ef                     out      dx, ax
415f: be1400                 mov      si, 0x14
4162: e8bb4b                 call     0x8d20
4165: c606804a17             mov      byte ptr [0x4a80], 0x17
416a: c606744a03             mov      byte ptr [0x4a74], 3
416f: e8bb02                 call     0x442d
4172: bac403                 mov      dx, 0x3c4
4175: b8020f                 mov      ax, 0xf02
4178: ef                     out      dx, ax
4179: b8d809                 mov      ax, 0x9d8
417c: 8ed8                   mov      ds, ax
417e: 8ec0                   mov      es, ax
4180: c3                     ret      
4181: a10a00                 mov      ax, word ptr [0xa]
4184: 8ec0                   mov      es, ax
4186: b85e18                 mov      ax, 0x185e
4189: 8ed8                   mov      ds, ax
418b: bd0200                 mov      bp, 2
418e: be0000                 mov      si, 0
4191: bac403                 mov      dx, 0x3c4
4194: b408                   mov      ah, 8
4196: b002                   mov      al, 2
4198: 33ff                   xor      di, di
419a: b9a00f                 mov      cx, 0xfa0
419d: ef                     out      dx, ax
419e: f3a5                   rep movsw word ptr es:[di], word ptr [si]
41a0: d0ec                   shr      ah, 1
41a2: 73f4                   jae      0x4198
41a4: 8cc0                   mov      ax, es
41a6: 80f402                 xor      ah, 2
41a9: 8ec0                   mov      es, ax
41ab: 4d                     dec      bp
41ac: 75e0                   jne      0x418e
41ae: b40f                   mov      ah, 0xf
41b0: ef                     out      dx, ax
41b1: b8d809                 mov      ax, 0x9d8
41b4: 8ed8                   mov      ds, ax
41b6: 8ec0                   mov      es, ax
41b8: a07856                 mov      al, byte ptr [0x5678]
41bb: a2804a                 mov      byte ptr [0x4a80], al
41be: e96c02                 jmp      0x442d
41c1: 33db                   xor      bx, bx
41c3: 32c0                   xor      al, al
41c5: 88870c54               mov      byte ptr [bx + 0x540c], al
41c9: 80fb74                 cmp      bl, 0x74
41cc: 7204                   jb       0x41d2
41ce: 8887b14b               mov      byte ptr [bx + 0x4bb1], al
41d2: 88878d56               mov      byte ptr [bx + 0x568d], al
41d6: 80fb90                 cmp      bl, 0x90
41d9: 7304                   jae      0x41df
41db: 88870c53               mov      byte ptr [bx + 0x530c], al
41df: 80fb02                 cmp      bl, 2
41e2: 7204                   jb       0x41e8
41e4: 8887b24a               mov      byte ptr [bx + 0x4ab2], al
41e8: fecb                   dec      bl
41ea: 75d7                   jne      0x41c3
41ec: beeabf                 mov      si, 0xbfea
41ef: a02756                 mov      al, byte ptr [0x5627]
41f2: 32e4                   xor      ah, ah
41f4: 03f0                   add      si, ax
41f6: bf0560                 mov      di, 0x6005
41f9: b90b00                 mov      cx, 0xb
41fc: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
41fe: b37c                   mov      bl, 0x7c
4200: c6870d5507             mov      byte ptr [bx + 0x550d], 7
4205: c6870e5517             mov      byte ptr [bx + 0x550e], 0x17
420a: 80eb04                 sub      bl, 4
420d: 79f1                   jns      0x4200
420f: c6065b543f             mov      byte ptr [0x545b], 0x3f
4214: c606ce4aba             mov      byte ptr [0x4ace], 0xba
4219: c606ba60ba             mov      byte ptr [0x60ba], 0xba
421e: c706e14c0909           mov      word ptr [0x4ce1], 0x909
4224: c606e34c09             mov      byte ptr [0x4ce3], 9
4229: a0addd                 mov      al, byte ptr [0xddad]
422c: 32e4                   xor      ah, ah
422e: 040c                   add      al, 0xc
4230: 8bd8                   mov      bx, ax
4232: e8a7db                 call     0x1ddc
4235: e8d905                 call     0x4811
4238: c606e64aa0             mov      byte ptr [0x4ae6], 0xa0
423d: c606f24a78             mov      byte ptr [0x4af2], 0x78
4242: e80f02                 call     0x4454
4245: c606605404             mov      byte ptr [0x5460], 4
424a: b409                   mov      ah, 9
424c: e8000a                 call     0x4c4f
424f: c606b54a3b             mov      byte ptr [0x4ab5], 0x3b
4254: b40b                   mov      ah, 0xb
4256: 8826b347               mov      byte ptr [0x47b3], ah
425a: 8826b247               mov      byte ptr [0x47b2], ah
425e: 32c0                   xor      al, al
4260: a20460                 mov      byte ptr [0x6004], al
4263: 8a0e8356               mov      cl, byte ptr [0x5683]
4267: a02756                 mov      al, byte ptr [0x5627]
426a: 22c0                   and      al, al
426c: 7404                   je       0x4272
426e: 8a0e8456               mov      cl, byte ptr [0x5684]
4272: 32ed                   xor      ch, ch
4274: 8ac5                   mov      al, ch
4276: 0401                   add      al, 1
4278: 27                     daa      
4279: e2fb                   loop     0x4276
427b: a21154                 mov      byte ptr [0x5411], al
427e: a27756                 mov      byte ptr [0x5677], al
4281: a02656                 mov      al, byte ptr [0x5626]
4284: a28b54                 mov      byte ptr [0x548b], al
4287: b92000                 mov      cx, 0x20
428a: bfdd58                 mov      di, 0x58dd
428d: b080                   mov      al, 0x80
428f: f3aa                   rep stosb byte ptr es:[di], al
4291: b92000                 mov      cx, 0x20
4294: bf3d59                 mov      di, 0x593d
4297: f3aa                   rep stosb byte ptr es:[di], al
4299: 33c0                   xor      ax, ax
429b: a21ec0                 mov      byte ptr [0xc01e], al
429e: a21fc0                 mov      byte ptr [0xc01f], al
42a1: 33c0                   xor      ax, ax
42a3: a30553                 mov      word ptr [0x5305], ax
42a6: a20753                 mov      byte ptr [0x5307], al
42a9: a20853                 mov      byte ptr [0x5308], al
42ac: a20953                 mov      byte ptr [0x5309], al
42af: a20a53                 mov      byte ptr [0x530a], al
42b2: a20b53                 mov      byte ptr [0x530b], al
42b5: c3                     ret      
42b6: b94000                 mov      cx, 0x40
42b9: 8cd8                   mov      ax, ds
42bb: 8ec0                   mov      es, ax
42bd: 33c0                   xor      ax, ax
42bf: bf1160                 mov      di, 0x6011
42c2: f3ab                   rep stosw word ptr es:[di], ax
42c4: c6061060c0             mov      byte ptr [0x6010], 0xc0
42c9: 8a1eaadd               mov      bl, byte ptr [0xddaa]
42cd: 22db                   and      bl, bl
42cf: 740b                   je       0x42dc
42d1: 8a1eaddd               mov      bl, byte ptr [0xddad]
42d5: 8a87f94c               mov      al, byte ptr [bx + 0x4cf9]
42d9: a22656                 mov      byte ptr [0x5626], al
42dc: e90af9                 jmp      0x3be9
42df: e83af9                 call     0x3c1c
42e2: a0264b                 mov      al, byte ptr [0x4b26]
42e5: 22c0                   and      al, al
42e7: 7419                   je       0x4302
42e9: a0e14a                 mov      al, byte ptr [0x4ae1]
42ec: 22c0                   and      al, al
42ee: 7512                   jne      0x4302
42f0: a0234b                 mov      al, byte ptr [0x4b23]
42f3: 240c                   and      al, 0xc
42f5: 740b                   je       0x4302
42f7: 3c04                   cmp      al, 4
42f9: 7405                   je       0x4300
42fb: b00f                   mov      al, 0xf
42fd: eb03                   jmp      0x4302
42ff: 90                     nop      
4300: b0f1                   mov      al, 0xf1
4302: a27b4b                 mov      byte ptr [0x4b7b], al
4305: a0234b                 mov      al, byte ptr [0x4b23]
4308: 2410                   and      al, 0x10
430a: 3410                   xor      al, 0x10
430c: a2a554                 mov      byte ptr [0x54a5], al
430f: 33d2                   xor      dx, dx
4311: a06553                 mov      al, byte ptr [0x5365]
4314: 22c0                   and      al, al
4316: 7804                   js       0x431c
4318: 3c78                   cmp      al, 0x78
431a: 7331                   jae      0x434d
431c: a0e14a                 mov      al, byte ptr [0x4ae1]
431f: 22c0                   and      al, al
4321: 752a                   jne      0x434d
4323: a0c04a                 mov      al, byte ptr [0x4ac0]
4326: 22c0                   and      al, al
4328: 7523                   jne      0x434d
432a: a0234b                 mov      al, byte ptr [0x4b23]
432d: 2403                   and      al, 3
432f: 3c01                   cmp      al, 1
4331: 7409                   je       0x433c
4333: 7710                   ja       0x4345
4335: a0b254                 mov      al, byte ptr [0x54b2]
4338: 22c0                   and      al, al
433a: 7911                   jns      0x434d
433c: 8b160760               mov      dx, word ptr [0x6007]
4340: b080                   mov      al, 0x80
4342: eb06                   jmp      0x434a
4344: 90                     nop      
4345: ba10ff                 mov      dx, 0xff10
4348: 32c0                   xor      al, al
434a: a2b254                 mov      byte ptr [0x54b2], al
434d: 89165c53               mov      word ptr [0x535c], dx
4351: e9fff7                 jmp      0x3b53
4354: e8c5f8                 call     0x3c1c
4357: a0234b                 mov      al, byte ptr [0x4b23]
435a: a804                   test     al, 4
435c: 7510                   jne      0x436e
435e: a808                   test     al, 8
4360: 7506                   jne      0x4368
4362: a810                   test     al, 0x10
4364: 74ee                   je       0x4354
4366: f8                     clc      
4367: c3                     ret      
4368: fe0e5854               dec      byte ptr [0x5458]
436c: f9                     stc      
436d: c3                     ret      
436e: fe065854               inc      byte ptr [0x5458]
4372: f9                     stc      
4373: c3                     ret      
4374: 80264908ff             and      byte ptr [0x849], 0xff
4379: 7920                   jns      0x439b
437b: 802649087f             and      byte ptr [0x849], 0x7f
4380: b0ff                   mov      al, 0xff
4382: a20360                 mov      byte ptr [0x6003], al
4385: a1af47                 mov      ax, word ptr [0x47af]
4388: a39360                 mov      word ptr [0x6093], ax
438b: a06154                 mov      al, byte ptr [0x5461]
438e: 8a26b147               mov      ah, byte ptr [0x47b1]
4392: a39560                 mov      word ptr [0x6095], ax
4395: bef244                 mov      si, 0x44f2
4398: e99cde                 jmp      0x2237
439b: c3                     ret      
439c: a00360                 mov      al, byte ptr [0x6003]
439f: 22c0                   and      al, al
43a1: 74f8                   je       0x439b
43a3: e8ae00                 call     0x4454
43a6: 33c0                   xor      ax, ax
43a8: a3c24a                 mov      word ptr [0x4ac2], ax
43ab: e81951                 call     0x94c7
43ae: 80264908ff             and      byte ptr [0x849], 0xff
43b3: 79f6                   jns      0x43ab
43b5: 802649087f             and      byte ptr [0x849], 0x7f
43ba: c606036000             mov      byte ptr [0x6003], 0
43bf: 90                     nop      
43c0: a19560                 mov      ax, word ptr [0x6095]
43c3: a26154                 mov      byte ptr [0x5461], al
43c6: 8826b147               mov      byte ptr [0x47b1], ah
43ca: a19360                 mov      ax, word ptr [0x6093]
43cd: a3af47                 mov      word ptr [0x47af], ax
43d0: e98d00                 jmp      0x4460
43d3: 80264f08ff             and      byte ptr [0x84f], 0xff
43d8: 7912                   jns      0x43ec
43da: 80264f087f             and      byte ptr [0x84f], 0x7f
43df: 8036026003             xor      byte ptr [0x6002], 3
43e4: 7403                   je       0x43e9
43e6: eb78                   jmp      0x4460
43e8: 90                     nop      
43e9: eb69                   jmp      0x4454
43eb: 90                     nop      
43ec: c3                     ret      
43ed: e82b23                 call     0x671b
43f0: a0cc08                 mov      al, byte ptr [0x8cc]
43f3: 22c0                   and      al, al
43f5: 74f9                   je       0x43f0
43f7: 32c0                   xor      al, al
43f9: a2cc08                 mov      byte ptr [0x8cc], al
43fc: a2cb08                 mov      byte ptr [0x8cb], al
43ff: 8a260b00               mov      ah, byte ptr [0xb]
4403: 80f402                 xor      ah, 2
4406: 88260b00               mov      byte ptr [0xb], ah
440a: bad403                 mov      dx, 0x3d4
440d: b00c                   mov      al, 0xc
440f: 80e402                 and      ah, 2
4412: 80f402                 xor      ah, 2
4415: d0e4                   shl      ah, 1
4417: d0e4                   shl      ah, 1
4419: d0e4                   shl      ah, 1
441b: d0e4                   shl      ah, 1
441d: ef                     out      dx, ax
441e: bada03                 mov      dx, 0x3da
4421: ec                     in       al, dx
4422: 2408                   and      al, 8
4424: 75fb                   jne      0x4421
4426: ec                     in       al, dx
4427: 2408                   and      al, 8
4429: 74fb                   je       0x4426
442b: c3                     ret      
442c: c3                     ret      
442d: be714a                 mov      si, 0x4a71
4430: fa                     cli      
4431: 32c9                   xor      cl, cl
4433: 8a2c                   mov      ch, byte ptr [si]
4435: bada03                 mov      dx, 0x3da
4438: ec                     in       al, dx
4439: b2c0                   mov      dl, 0xc0
443b: 8ac1                   mov      al, cl
443d: ee                     out      dx, al
443e: 8ac5                   mov      al, ch
4440: ee                     out      dx, al
4441: bada03                 mov      dx, 0x3da
4444: ec                     in       al, dx
4445: b2c0                   mov      dl, 0xc0
4447: b020                   mov      al, 0x20
4449: ee                     out      dx, al
444a: 46                     inc      si
444b: fec1                   inc      cl
444d: 80f90f                 cmp      cl, 0xf
4450: 76e1                   jbe      0x4433
4452: fb                     sti      
4453: c3                     ret      
4454: 32c0                   xor      al, al
4456: a2fd5f                 mov      byte ptr [0x5ffd], al
4459: e461                   in       al, 0x61
445b: 24fc                   and      al, 0xfc
445d: e661                   out      0x61, al
445f: c3                     ret      
4460: e838ea                 call     0x2e9b
4463: b0ff                   mov      al, 0xff
4465: a2fd5f                 mov      byte ptr [0x5ffd], al
4468: e461                   in       al, 0x61
446a: 24fc                   and      al, 0xfc
446c: 0a060260               or       al, byte ptr [0x6002]
4470: e661                   out      0x61, al
4472: c3                     ret      
4473: e8d100                 call     0x4547
4476: b800a2                 mov      ax, 0xa200
4479: 8ec0                   mov      es, ax
447b: be0800                 mov      si, 8
447e: a06e54                 mov      al, byte ptr [0x546e]
4481: 22c0                   and      al, al
4483: 790d                   jns      0x4492
4485: be0c00                 mov      si, 0xc
4488: a0c04a                 mov      al, byte ptr [0x4ac0]
448b: 22c0                   and      al, al
448d: 7403                   je       0x4492
448f: be0000                 mov      si, 0
4492: e88b48                 call     0x8d20
4495: e87400                 call     0x450c
4498: bad403                 mov      dx, 0x3d4
449b: b80c20                 mov      ax, 0x200c
449e: ef                     out      dx, ax
449f: e88dd1                 call     0x162f
44a2: bad403                 mov      dx, 0x3d4
44a5: b80c00                 mov      ax, 0xc
44a8: ef                     out      dx, ax
44a9: e98300                 jmp      0x452f
44ac: c3                     ret      
44ad: a03bdf                 mov      al, byte ptr [0xdf3b]
44b0: 22c0                   and      al, al
44b2: 78f8                   js       0x44ac
44b4: e89000                 call     0x4547
44b7: bad403                 mov      dx, 0x3d4
44ba: b80c00                 mov      ax, 0xc
44bd: ef                     out      dx, ax
44be: b800a2                 mov      ax, 0xa200
44c1: 8ec0                   mov      es, ax
44c3: be1000                 mov      si, 0x10
44c6: e85748                 call     0x8d20
44c9: e84000                 call     0x450c
44cc: bad403                 mov      dx, 0x3d4
44cf: b80c20                 mov      ax, 0x200c
44d2: ef                     out      dx, ax
44d3: e859d1                 call     0x162f
44d6: bad403                 mov      dx, 0x3d4
44d9: b80c00                 mov      ax, 0xc
44dc: ef                     out      dx, ax
44dd: eb50                   jmp      0x452f
44df: 90                     nop      
44e0: e86400                 call     0x4547
44e3: bad403                 mov      dx, 0x3d4
44e6: b80c00                 mov      ax, 0xc
44e9: ef                     out      dx, ax
44ea: b800a2                 mov      ax, 0xa200
44ed: 8ec0                   mov      es, ax
44ef: be1c00                 mov      si, 0x1c
44f2: e82b48                 call     0x8d20
44f5: e81400                 call     0x450c
44f8: bad403                 mov      dx, 0x3d4
44fb: b80c20                 mov      ax, 0x200c
44fe: ef                     out      dx, ax
44ff: e82dd1                 call     0x162f
4502: bad403                 mov      dx, 0x3d4
4505: b80c00                 mov      ax, 0xc
4508: ef                     out      dx, ax
4509: eb24                   jmp      0x452f
450b: 90                     nop      
450c: 06                     push     es
450d: b8d809                 mov      ax, 0x9d8
4510: 8ec0                   mov      es, ax
4512: 8ed8                   mov      ds, ax
4514: be714a                 mov      si, 0x4a71
4517: bf924a                 mov      di, 0x4a92
451a: b90800                 mov      cx, 8
451d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
451f: be824a                 mov      si, 0x4a82
4522: bf714a                 mov      di, 0x4a71
4525: b90800                 mov      cx, 8
4528: f3a5                   rep movsw word ptr es:[di], word ptr [si]
452a: e800ff                 call     0x442d
452d: 07                     pop      es
452e: c3                     ret      
452f: 06                     push     es
4530: b8d809                 mov      ax, 0x9d8
4533: 8ec0                   mov      es, ax
4535: 8ed8                   mov      ds, ax
4537: be924a                 mov      si, 0x4a92
453a: bf714a                 mov      di, 0x4a71
453d: b90800                 mov      cx, 8
4540: f3a5                   rep movsw word ptr es:[di], word ptr [si]
4542: e8e8fe                 call     0x442d
4545: 07                     pop      es
4546: c3                     ret      
4547: bea24a                 mov      si, 0x4aa2
454a: e9e3fe                 jmp      0x4430
454d: be824a                 mov      si, 0x4a82
4550: e9ddfe                 jmp      0x4430
4553: 0000                   add      byte ptr [bx + si], al
4555: 0000                   add      byte ptr [bx + si], al
4557: 0000                   add      byte ptr [bx + si], al
4559: 0000                   add      byte ptr [bx + si], al
455b: 0000                   add      byte ptr [bx + si], al
455d: 0000                   add      byte ptr [bx + si], al
455f: 0032                   add      byte ptr [bp + si], dh
4561: ff8aef8b               dec      word ptr [bp + si - 0x7411]
4565: eb80                   jmp      0x44e7
4567: 3ebc6008               mov      sp, 0x860
456b: 7406                   je       0x4573
456d: e891f3                 call     0x3901
4570: 8bdd                   mov      bx, bp
4572: c3                     ret      
4573: 8a1e0f4b               mov      bl, byte ptr [0x4b0f]
4577: fec3                   inc      bl
4579: 32ff                   xor      bh, bh
457b: 8aef                   mov      ch, bh
457d: 8bbfd06a               mov      di, word ptr [bx + 0x6ad0]
4581: 81e7ff00               and      di, 0xff
4585: b107                   mov      cl, 7
4587: 2a8dd064               sub      cl, byte ptr [di + 0x64d0]
458b: a00e4b                 mov      al, byte ptr [0x4b0e]
458e: 83ff08                 cmp      di, 8
4591: 7221                   jb       0x45b4
4593: f6d0                   not      al
4595: b501                   mov      ch, 1
4597: e81a00                 call     0x45b4
459a: 32ed                   xor      ch, ch
459c: 8afd                   mov      bh, ch
459e: 8a872558               mov      al, byte ptr [bx + 0x5825]
45a2: 22c0                   and      al, al
45a4: 7907                   jns      0x45ad
45a6: 0402                   add      al, 2
45a8: 88872558               mov      byte ptr [bx + 0x5825], al
45ac: c3                     ret      
45ad: 2c02                   sub      al, 2
45af: 88872558               mov      byte ptr [bx + 0x5825], al
45b3: c3                     ret      
45b4: d2e8                   shr      al, cl
45b6: 0a87d06b               or       al, byte ptr [bx + 0x6bd0]
45ba: 8ad8                   mov      bl, al
45bc: 8aa7d069               mov      ah, byte ptr [bx + 0x69d0]
45c0: 02a5e064               add      ah, byte ptr [di + 0x64e0]
45c4: 8a87d068               mov      al, byte ptr [bx + 0x68d0]
45c8: a32c4b                 mov      word ptr [0x4b2c], ax
45cb: 8a1e0d4b               mov      bl, byte ptr [0x4b0d]
45cf: fec3                   inc      bl
45d1: 8bbfd06a               mov      di, word ptr [bx + 0x6ad0]
45d5: 81e7ff00               and      di, 0xff
45d9: b107                   mov      cl, 7
45db: 2a8dd064               sub      cl, byte ptr [di + 0x64d0]
45df: a00c4b                 mov      al, byte ptr [0x4b0c]
45e2: 83ff08                 cmp      di, 8
45e5: 7202                   jb       0x45e9
45e7: f6d0                   not      al
45e9: d2e8                   shr      al, cl
45eb: 0a87d06b               or       al, byte ptr [bx + 0x6bd0]
45ef: 8ad8                   mov      bl, al
45f1: 8aa7d069               mov      ah, byte ptr [bx + 0x69d0]
45f5: 02a5e064               add      ah, byte ptr [di + 0x64e0]
45f9: 8a87d068               mov      al, byte ptr [bx + 0x68d0]
45fd: a3604b                 mov      word ptr [0x4b60], ax
4600: 83ff08                 cmp      di, 8
4603: 9f                     lahf     
4604: 32e5                   xor      ah, ch
4606: 9e                     sahf     
4607: 7303                   jae      0x460c
4609: eb75                   jmp      0x4680
460b: 90                     nop      
460c: a1604b                 mov      ax, word ptr [0x4b60]
460f: 2b062c4b               sub      ax, word ptr [0x4b2c]
4613: 7936                   jns      0x464b
4615: e8a101                 call     0x47b9
4618: 32ff                   xor      bh, bh
461a: 8ae7                   mov      ah, bh
461c: d0e8                   shr      al, 1
461e: 12c4                   adc      al, ah
4620: 8ad0                   mov      dl, al
4622: 8bf8                   mov      di, ax
4624: 8a9dd065               mov      bl, byte ptr [di + 0x65d0]
4628: a12c4b                 mov      ax, word ptr [0x4b2c]
462b: 2a87d068               sub      al, byte ptr [bx + 0x68d0]
462f: 1aa7d069               sbb      ah, byte ptr [bx + 0x69d0]
4633: 80c420                 add      ah, 0x20
4636: a3624b                 mov      word ptr [0x4b62], ax
4639: 8bdd                   mov      bx, bp
463b: a15e4b                 mov      ax, word ptr [0x4b5e]
463e: 2ac2                   sub      al, dl
4640: 88878d57               mov      byte ptr [bx + 0x578d], al
4644: 1ae7                   sbb      ah, bh
4646: 88a72558               mov      byte ptr [bx + 0x5825], ah
464a: c3                     ret      
464b: f7d8                   neg      ax
464d: e86901                 call     0x47b9
4650: d0e8                   shr      al, 1
4652: 32ff                   xor      bh, bh
4654: 8ad0                   mov      dl, al
4656: 8ae7                   mov      ah, bh
4658: 8bf8                   mov      di, ax
465a: 8a9dd065               mov      bl, byte ptr [di + 0x65d0]
465e: a1604b                 mov      ax, word ptr [0x4b60]
4661: 2a87d068               sub      al, byte ptr [bx + 0x68d0]
4665: 1aa7d069               sbb      ah, byte ptr [bx + 0x69d0]
4669: 80c420                 add      ah, 0x20
466c: a3624b                 mov      word ptr [0x4b62], ax
466f: 8bdd                   mov      bx, bp
4671: b6ff                   mov      dh, 0xff
4673: 2b16e44a               sub      dx, word ptr [0x4ae4]
4677: 88978d57               mov      byte ptr [bx + 0x578d], dl
467b: 88b72558               mov      byte ptr [bx + 0x5825], dh
467f: c3                     ret      
4680: a1604b                 mov      ax, word ptr [0x4b60]
4683: 2b062c4b               sub      ax, word ptr [0x4b2c]
4687: 7933                   jns      0x46bc
4689: e82d01                 call     0x47b9
468c: d0e8                   shr      al, 1
468e: 8ad0                   mov      dl, al
4690: 32ff                   xor      bh, bh
4692: 8ae7                   mov      ah, bh
4694: 8bf8                   mov      di, ax
4696: 8a9dd065               mov      bl, byte ptr [di + 0x65d0]
469a: a12c4b                 mov      ax, word ptr [0x4b2c]
469d: 2a87d068               sub      al, byte ptr [bx + 0x68d0]
46a1: 1aa7d069               sbb      ah, byte ptr [bx + 0x69d0]
46a5: 80c420                 add      ah, 0x20
46a8: a3624b                 mov      word ptr [0x4b62], ax
46ab: 8bdd                   mov      bx, bp
46ad: 32f6                   xor      dh, dh
46af: 2b16e44a               sub      dx, word ptr [0x4ae4]
46b3: 88978d57               mov      byte ptr [bx + 0x578d], dl
46b7: 88b72558               mov      byte ptr [bx + 0x5825], dh
46bb: c3                     ret      
46bc: f7d8                   neg      ax
46be: e8f800                 call     0x47b9
46c1: 32ff                   xor      bh, bh
46c3: d0e8                   shr      al, 1
46c5: 12c7                   adc      al, bh
46c7: 8ad0                   mov      dl, al
46c9: 8ae7                   mov      ah, bh
46cb: 8bf8                   mov      di, ax
46cd: 8a9dd065               mov      bl, byte ptr [di + 0x65d0]
46d1: a1604b                 mov      ax, word ptr [0x4b60]
46d4: 2a87d068               sub      al, byte ptr [bx + 0x68d0]
46d8: 1aa7d069               sbb      ah, byte ptr [bx + 0x69d0]
46dc: 80c420                 add      ah, 0x20
46df: a3624b                 mov      word ptr [0x4b62], ax
46e2: 8bdd                   mov      bx, bp
46e4: a15e4b                 mov      ax, word ptr [0x4b5e]
46e7: b6ff                   mov      dh, 0xff
46e9: 2bc2                   sub      ax, dx
46eb: 88878d57               mov      byte ptr [bx + 0x578d], al
46ef: 88a72558               mov      byte ptr [bx + 0x5825], ah
46f3: c3                     ret      
46f4: 32ff                   xor      bh, bh
46f6: 8beb                   mov      bp, bx
46f8: 8a97fd58               mov      dl, byte ptr [bx + 0x58fd]
46fc: 2a16ec4a               sub      dl, byte ptr [0x4aec]
4700: 8a9fbd58               mov      bl, byte ptr [bx + 0x58bd]
4704: 1a1eed4a               sbb      bl, byte ptr [0x4aed]
4708: 9c                     pushf    
4709: fec3                   inc      bl
470b: 8bbfd06a               mov      di, word ptr [bx + 0x6ad0]
470f: 81e7ff00               and      di, 0xff
4713: b107                   mov      cl, 7
4715: 2a8dd064               sub      cl, byte ptr [di + 0x64d0]
4719: 8ac2                   mov      al, dl
471b: 9d                     popf     
471c: 7302                   jae      0x4720
471e: f6d0                   not      al
4720: d2e8                   shr      al, cl
4722: 0a87d06b               or       al, byte ptr [bx + 0x6bd0]
4726: 8ad8                   mov      bl, al
4728: 8aa7d069               mov      ah, byte ptr [bx + 0x69d0]
472c: 02a5e064               add      ah, byte ptr [di + 0x64e0]
4730: 2a26bc60               sub      ah, byte ptr [0x60bc]
4734: 8826654b               mov      byte ptr [0x4b65], ah
4738: 83ff08                 cmp      di, 8
473b: 7342                   jae      0x477f
473d: 8a87d068               mov      al, byte ptr [bx + 0x68d0]
4741: 2b06624b               sub      ax, word ptr [0x4b62]
4745: 7922                   jns      0x4769
4747: e86f00                 call     0x47b9
474a: 32ff                   xor      bh, bh
474c: 8ad0                   mov      dl, al
474e: 32f6                   xor      dh, dh
4750: 8bdd                   mov      bx, bp
4752: 32c0                   xor      al, al
4754: 2ac2                   sub      al, dl
4756: 7202                   jb       0x475a
4758: fec6                   inc      dh
475a: 8ae6                   mov      ah, dh
475c: 2b06e64a               sub      ax, word ptr [0x4ae6]
4760: 8887d957               mov      byte ptr [bx + 0x57d9], al
4764: 88a77158               mov      byte ptr [bx + 0x5871], ah
4768: c3                     ret      
4769: f7d8                   neg      ax
476b: e84b00                 call     0x47b9
476e: 8bdd                   mov      bx, bp
4770: b4ff                   mov      ah, 0xff
4772: 2b06e64a               sub      ax, word ptr [0x4ae6]
4776: 8887d957               mov      byte ptr [bx + 0x57d9], al
477a: 88a77158               mov      byte ptr [bx + 0x5871], ah
477e: c3                     ret      
477f: 8a87d068               mov      al, byte ptr [bx + 0x68d0]
4783: 2b06624b               sub      ax, word ptr [0x4b62]
4787: 7914                   jns      0x479d
4789: e82d00                 call     0x47b9
478c: 8bdd                   mov      bx, bp
478e: b401                   mov      ah, 1
4790: 2b06e64a               sub      ax, word ptr [0x4ae6]
4794: 8887d957               mov      byte ptr [bx + 0x57d9], al
4798: 88a77158               mov      byte ptr [bx + 0x5871], ah
479c: c3                     ret      
479d: f7d8                   neg      ax
479f: e81700                 call     0x47b9
47a2: b402                   mov      ah, 2
47a4: 8bdd                   mov      bx, bp
47a6: f6d8                   neg      al
47a8: 7202                   jb       0x47ac
47aa: fec4                   inc      ah
47ac: 2b06e64a               sub      ax, word ptr [0x4ae6]
47b0: 8887d957               mov      byte ptr [bx + 0x57d9], al
47b4: 88a77158               mov      byte ptr [bx + 0x5871], ah
47b8: c3                     ret      
47b9: 32ff                   xor      bh, bh
47bb: 80fce0                 cmp      ah, 0xe0
47be: 724a                   jb       0x480a
47c0: d1e0                   shl      ax, 1
47c2: d1e0                   shl      ax, 1
47c4: d1e0                   shl      ax, 1
47c6: 23c0                   and      ax, ax
47c8: 792f                   jns      0x47f9
47ca: d1e0                   shl      ax, 1
47cc: 23c0                   and      ax, ax
47ce: 791a                   jns      0x47ea
47d0: d1e0                   shl      ax, 1
47d2: 8adc                   mov      bl, ah
47d4: 8aa7d06d               mov      ah, byte ptr [bx + 0x6dd0]
47d8: 80e4f8                 and      ah, 0xf8
47db: 3ae0                   cmp      ah, al
47dd: 8a87d067               mov      al, byte ptr [bx + 0x67d0]
47e1: 7306                   jae      0x47e9
47e3: fec0                   inc      al
47e5: 7502                   jne      0x47e9
47e7: b0ff                   mov      al, 0xff
47e9: c3                     ret      
47ea: 8adc                   mov      bl, ah
47ec: 3a87506d               cmp      al, byte ptr [bx + 0x6d50]
47f0: 8a875067               mov      al, byte ptr [bx + 0x6750]
47f4: 7202                   jb       0x47f8
47f6: fec0                   inc      al
47f8: c3                     ret      
47f9: 8adc                   mov      bl, ah
47fb: 24fe                   and      al, 0xfe
47fd: 3a87d06c               cmp      al, byte ptr [bx + 0x6cd0]
4801: 8a87d066               mov      al, byte ptr [bx + 0x66d0]
4805: 7202                   jb       0x4809
4807: fec0                   inc      al
4809: c3                     ret      
480a: 22e4                   and      ah, ah
480c: 74d9                   je       0x47e7
480e: 32c0                   xor      al, al
4810: c3                     ret      
4811: a03253                 mov      al, byte ptr [0x5332]
4814: 3a06ba60               cmp      al, byte ptr [0x60ba]
4818: 750b                   jne      0x4825
481a: a02f53                 mov      al, byte ptr [0x532f]
481d: 24c0                   and      al, 0xc0
481f: 3a06bb60               cmp      al, byte ptr [0x60bb]
4823: 74eb                   je       0x4810
4825: a02f53                 mov      al, byte ptr [0x532f]
4828: 24c0                   and      al, 0xc0
482a: a2bb60                 mov      byte ptr [0x60bb], al
482d: 8a263253               mov      ah, byte ptr [0x5332]
4831: 8826ba60               mov      byte ptr [0x60ba], ah
4835: d1e0                   shl      ax, 1
4837: d1e0                   shl      ax, 1
4839: 7302                   jae      0x483d
483b: f6dc                   neg      ah
483d: 8adc                   mov      bl, ah
483f: 32ff                   xor      bh, bh
4841: 8a97d065               mov      dl, byte ptr [bx + 0x65d0]
4845: f6db                   neg      bl
4847: 8ac3                   mov      al, bl
4849: 7404                   je       0x484f
484b: 8a87d065               mov      al, byte ptr [bx + 0x65d0]
484f: 8af0                   mov      dh, al
4851: 8bf2                   mov      si, dx
4853: bbad59                 mov      bx, 0x59ad
4856: b98000                 mov      cx, 0x80
4859: 32e4                   xor      ah, ah
485b: b080                   mov      al, 0x80
485d: eb07                   jmp      0x4866
485f: 90                     nop      
4860: 02c2                   add      al, dl
4862: 7302                   jae      0x4866
4864: fec4                   inc      ah
4866: 8827                   mov      byte ptr [bx], ah
4868: 43                     inc      bx
4869: e2f5                   loop     0x4860
486b: 32e4                   xor      ah, ah
486d: b98000                 mov      cx, 0x80
4870: 8ac1                   mov      al, cl
4872: d0e6                   shl      dh, 1
4874: 7319                   jae      0x488f
4876: eb09                   jmp      0x4881
4878: 90                     nop      
4879: 02c6                   add      al, dh
487b: fec4                   inc      ah
487d: 7302                   jae      0x4881
487f: fec4                   inc      ah
4881: 8827                   mov      byte ptr [bx], ah
4883: 43                     inc      bx
4884: e2f3                   loop     0x4879
4886: eb0c                   jmp      0x4894
4888: 90                     nop      
4889: 02c6                   add      al, dh
488b: 7302                   jae      0x488f
488d: fec4                   inc      ah
488f: 8827                   mov      byte ptr [bx], ah
4891: 43                     inc      bx
4892: e2f5                   loop     0x4889
4894: 8bd6                   mov      dx, si
4896: c606345480             mov      byte ptr [0x5434], 0x80
489b: bb0100                 mov      bx, 1
489e: 8ae3                   mov      ah, bl
48a0: 32c0                   xor      al, al
48a2: 02c2                   add      al, dl
48a4: 7302                   jae      0x48a8
48a6: fec4                   inc      ah
48a8: 88873454               mov      byte ptr [bx + 0x5434], al
48ac: 88a74054               mov      byte ptr [bx + 0x5440], ah
48b0: d0af4054               shr      byte ptr [bx + 0x5440], 1
48b4: d09f3454               rcr      byte ptr [bx + 0x5434], 1
48b8: fec3                   inc      bl
48ba: 80fb09                 cmp      bl, 9
48bd: 72e3                   jb       0x48a2
48bf: 33c0                   xor      ax, ax
48c1: bb0100                 mov      bx, 1
48c4: 02c6                   add      al, dh
48c6: 7302                   jae      0x48ca
48c8: fec4                   inc      ah
48ca: 88871c54               mov      byte ptr [bx + 0x541c], al
48ce: 88a72854               mov      byte ptr [bx + 0x5428], ah
48d2: fec3                   inc      bl
48d4: 80fb09                 cmp      bl, 9
48d7: 72eb                   jb       0x48c4
48d9: c3                     ret      
48da: c3                     ret      
48db: 32ff                   xor      bh, bh
48dd: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
48e1: 22c0                   and      al, al
48e3: 78f5                   js       0x48da
48e5: 32ff                   xor      bh, bh
48e7: 8a872558               mov      al, byte ptr [bx + 0x5825]
48eb: 0a877158               or       al, byte ptr [bx + 0x5871]
48ef: 7556                   jne      0x4947
48f1: 8bbf8d57               mov      di, word ptr [bx + 0x578d]
48f5: 81e7ff00               and      di, 0xff
48f9: 81ff8000               cmp      di, 0x80
48fd: 720f                   jb       0x490e
48ff: 8a95ad59               mov      dl, byte ptr [di + 0x59ad]
4903: 22d2                   and      dl, dl
4905: 7840                   js       0x4947
4907: 8ab52d59               mov      dh, byte ptr [di + 0x592d]
490b: eb1d                   jmp      0x492a
490d: 90                     nop      
490e: 81f77f00               xor      di, 0x7f
4912: 47                     inc      di
4913: 81ff8000               cmp      di, 0x80
4917: 7201                   jb       0x491a
4919: 4f                     dec      di
491a: 32d2                   xor      dl, dl
491c: 2a952d5a               sub      dl, byte ptr [di + 0x5a2d]
4920: 7802                   js       0x4924
4922: 7523                   jne      0x4947
4924: 32f6                   xor      dh, dh
4926: 2ab5ad59               sub      dh, byte ptr [di + 0x59ad]
492a: 8a8fd957               mov      cl, byte ptr [bx + 0x57d9]
492e: 8aef                   mov      ch, bh
4930: 8bf9                   mov      di, cx
4932: 22c9                   and      cl, cl
4934: 7914                   jns      0x494a
4936: 8aadad59               mov      ch, byte ptr [di + 0x59ad]
493a: d0ed                   shr      ch, 1
493c: 12ef                   adc      ch, bh
493e: d0ed                   shr      ch, 1
4940: 8a852d59               mov      al, byte ptr [di + 0x592d]
4944: eb22                   jmp      0x4968
4946: 90                     nop      
4947: eb54                   jmp      0x499d
4949: 90                     nop      
494a: 81f77f00               xor      di, 0x7f
494e: 47                     inc      di
494f: 81ff8000               cmp      di, 0x80
4953: 7201                   jb       0x4956
4955: 4f                     dec      di
4956: 8aad2d5a               mov      ch, byte ptr [di + 0x5a2d]
495a: d0ed                   shr      ch, 1
495c: 12ef                   adc      ch, bh
495e: d0ed                   shr      ch, 1
4960: f6dd                   neg      ch
4962: 32c0                   xor      al, al
4964: 2a85ad59               sub      al, byte ptr [di + 0x59ad]
4968: 80263253ff             and      byte ptr [0x5332], 0xff
496d: 7813                   js       0x4982
496f: 2ac2                   sub      al, dl
4971: 702a                   jo       0x499d
4973: 3480                   xor      al, 0x80
4975: 8887d957               mov      byte ptr [bx + 0x57d9], al
4979: 8ac6                   mov      al, dh
497b: 02c5                   add      al, ch
497d: 7113                   jno      0x4992
497f: eb18                   jmp      0x4999
4981: 90                     nop      
4982: 02c2                   add      al, dl
4984: 7017                   jo       0x499d
4986: 3480                   xor      al, 0x80
4988: 8887d957               mov      byte ptr [bx + 0x57d9], al
498c: 8ac6                   mov      al, dh
498e: 2ac5                   sub      al, ch
4990: 7007                   jo       0x4999
4992: 3480                   xor      al, 0x80
4994: 88878d57               mov      byte ptr [bx + 0x578d], al
4998: c3                     ret      
4999: 888fd957               mov      byte ptr [bx + 0x57d9], cl
499d: 881ebf4a               mov      byte ptr [0x4abf], bl
49a1: 32ff                   xor      bh, bh
49a3: 8a878d57               mov      al, byte ptr [bx + 0x578d]
49a7: 8aa72558               mov      ah, byte ptr [bx + 0x5825]
49ab: 2d8000                 sub      ax, 0x80
49ae: 88262e4b               mov      byte ptr [0x4b2e], ah
49b2: 7902                   jns      0x49b6
49b4: f7d8                   neg      ax
49b6: d1e0                   shl      ax, 1
49b8: 8adc                   mov      bl, ah
49ba: 8ae7                   mov      ah, bh
49bc: 8bf8                   mov      di, ax
49be: d1ef                   shr      di, 1
49c0: 8a852d5a               mov      al, byte ptr [di + 0x5a2d]
49c4: 02871c54               add      al, byte ptr [bx + 0x541c]
49c8: 8ae7                   mov      ah, bh
49ca: 12a72854               adc      ah, byte ptr [bx + 0x5428]
49ce: a3344b                 mov      word ptr [0x4b34], ax
49d1: 8a85ad59               mov      al, byte ptr [di + 0x59ad]
49d5: 02873454               add      al, byte ptr [bx + 0x5434]
49d9: 8ae7                   mov      ah, bh
49db: 12a74054               adc      ah, byte ptr [bx + 0x5440]
49df: a30c4b                 mov      word ptr [0x4b0c], ax
49e2: 8a1ebf4a               mov      bl, byte ptr [0x4abf]
49e6: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
49ea: 8aa77158               mov      ah, byte ptr [bx + 0x5871]
49ee: 2d8000                 sub      ax, 0x80
49f1: 88262f4b               mov      byte ptr [0x4b2f], ah
49f5: 7902                   jns      0x49f9
49f7: f7d8                   neg      ax
49f9: d1e0                   shl      ax, 1
49fb: 8adc                   mov      bl, ah
49fd: 8ae7                   mov      ah, bh
49ff: 8bf8                   mov      di, ax
4a01: d1ef                   shr      di, 1
4a03: 8aa72854               mov      ah, byte ptr [bx + 0x5428]
4a07: 8a852d5a               mov      al, byte ptr [di + 0x5a2d]
4a0b: 02871c54               add      al, byte ptr [bx + 0x541c]
4a0f: 7302                   jae      0x4a13
4a11: fec4                   inc      ah
4a13: d1e8                   shr      ax, 1
4a15: 150000                 adc      ax, 0
4a18: d1e8                   shr      ax, 1
4a1a: a3324b                 mov      word ptr [0x4b32], ax
4a1d: 8a85ad59               mov      al, byte ptr [di + 0x59ad]
4a21: 02873454               add      al, byte ptr [bx + 0x5434]
4a25: 8ae7                   mov      ah, bh
4a27: 12a74054               adc      ah, byte ptr [bx + 0x5440]
4a2b: a30e4b                 mov      word ptr [0x4b0e], ax
4a2e: 8a1ebf4a               mov      bl, byte ptr [0x4abf]
4a32: 80262e4bff             and      byte ptr [0x4b2e], 0xff
4a37: 790a                   jns      0x4a43
4a39: b80001                 mov      ax, 0x100
4a3c: 2b060c4b               sub      ax, word ptr [0x4b0c]
4a40: a30c4b                 mov      word ptr [0x4b0c], ax
4a43: 80262f4bff             and      byte ptr [0x4b2f], 0xff
4a48: 790a                   jns      0x4a54
4a4a: b80001                 mov      ax, 0x100
4a4d: 2b060e4b               sub      ax, word ptr [0x4b0e]
4a51: a30e4b                 mov      word ptr [0x4b0e], ax
4a54: a02f4b                 mov      al, byte ptr [0x4b2f]
4a57: 32063253               xor      al, byte ptr [0x5332]
4a5b: 780e                   js       0x4a6b
4a5d: a10c4b                 mov      ax, word ptr [0x4b0c]
4a60: 0306324b               add      ax, word ptr [0x4b32]
4a64: 88878d57               mov      byte ptr [bx + 0x578d], al
4a68: eb0c                   jmp      0x4a76
4a6a: 90                     nop      
4a6b: a10c4b                 mov      ax, word ptr [0x4b0c]
4a6e: 2b06324b               sub      ax, word ptr [0x4b32]
4a72: 88878d57               mov      byte ptr [bx + 0x578d], al
4a76: 88a72558               mov      byte ptr [bx + 0x5825], ah
4a7a: a02e4b                 mov      al, byte ptr [0x4b2e]
4a7d: 32063253               xor      al, byte ptr [0x5332]
4a81: 7810                   js       0x4a93
4a83: a10e4b                 mov      ax, word ptr [0x4b0e]
4a86: 2b06344b               sub      ax, word ptr [0x4b34]
4a8a: 8887d957               mov      byte ptr [bx + 0x57d9], al
4a8e: 88a77158               mov      byte ptr [bx + 0x5871], ah
4a92: c3                     ret      
4a93: a10e4b                 mov      ax, word ptr [0x4b0e]
4a96: 0306344b               add      ax, word ptr [0x4b34]
4a9a: 8887d957               mov      byte ptr [bx + 0x57d9], al
4a9e: 88a77158               mov      byte ptr [bx + 0x5871], ah
4aa2: c3                     ret      
4aa3: 33f6                   xor      si, si
4aa5: f6c301                 test     bl, 1
4aa8: 7501                   jne      0x4aab
4aaa: 46                     inc      si
4aab: 8aa4bd60               mov      ah, byte ptr [si + 0x60bd]
4aaf: 8826574b               mov      byte ptr [0x4b57], ah
4ab3: 8aa4bf60               mov      ah, byte ptr [si + 0x60bf]
4ab7: 8826ba4a               mov      byte ptr [0x4aba], ah
4abb: d0eb                   shr      bl, 1
4abd: 80e301                 and      bl, 1
4ac0: e80f36                 call     0x80d2
4ac3: b80308                 mov      ax, 0x803
4ac6: bace03                 mov      dx, 0x3ce
4ac9: ef                     out      dx, ax
4aca: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
4ace: 8a875d59               mov      al, byte ptr [bx + 0x595d]
4ad2: 0284c360               add      al, byte ptr [si + 0x60c3]
4ad6: 8aa7b95e               mov      ah, byte ptr [bx + 0x5eb9]
4ada: a2ad57                 mov      byte ptr [0x57ad], al
4add: 8826f957               mov      byte ptr [0x57f9], ah
4ae1: 8b3e574b               mov      di, word ptr [0x4b57]
4ae5: 81e7ff00               and      di, 0xff
4ae9: 0285c560               add      al, byte ptr [di + 0x60c5]
4aed: a2ae57                 mov      byte ptr [0x57ae], al
4af0: 02a5d460               add      ah, byte ptr [di + 0x60d4]
4af4: 8826fa57               mov      byte ptr [0x57fa], ah
4af8: bb2000                 mov      bx, 0x20
4afb: bf2100                 mov      di, 0x21
4afe: 8bd0                   mov      dx, ax
4b00: 8bf0                   mov      si, ax
4b02: a00260                 mov      al, byte ptr [0x6002]
4b05: 22c0                   and      al, al
4b07: 741a                   je       0x4b23
4b09: e461                   in       al, 0x61
4b0b: 24fd                   and      al, 0xfd
4b0d: e661                   out      0x61, al
4b0f: b91000                 mov      cx, 0x10
4b12: 8bd6                   mov      dx, si
4b14: 80e202                 and      dl, 2
4b17: 32c2                   xor      al, dl
4b19: e661                   out      0x61, al
4b1b: d1ee                   shr      si, 1
4b1d: e2f3                   loop     0x4b12
4b1f: 0c03                   or       al, 3
4b21: e661                   out      0x61, al
4b23: e8d634                 call     0x7ffc
4b26: 32ff                   xor      bh, bh
4b28: a0ae57                 mov      al, byte ptr [0x57ae]
4b2b: 8a26fa57               mov      ah, byte ptr [0x57fa]
4b2f: fe0e574b               dec      byte ptr [0x4b57]
4b33: fe0eba4a               dec      byte ptr [0x4aba]
4b37: 79a1                   jns      0x4ada
4b39: bace03                 mov      dx, 0x3ce
4b3c: b80300                 mov      ax, 3
4b3f: ef                     out      dx, ax
4b40: c3                     ret      
4b41: bf4000                 mov      di, 0x40
4b44: 8bcf                   mov      cx, di
4b46: 8a8550c5               mov      al, byte ptr [di - 0x3ab0]
4b4a: 2a854fc5               sub      al, byte ptr [di - 0x3ab1]
4b4e: 8ae0                   mov      ah, al
4b50: 7902                   jns      0x4b54
4b52: f6d8                   neg      al
4b54: 3c04                   cmp      al, 4
4b56: 731c                   jae      0x4b74
4b58: 22c9                   and      cl, cl
4b5a: 780c                   js       0x4b68
4b5c: 47                     inc      di
4b5d: 81ff8000               cmp      di, 0x80
4b61: 72e3                   jb       0x4b46
4b63: bf4000                 mov      di, 0x40
4b66: d0e1                   shl      cl, 1
4b68: 4f                     dec      di
4b69: 75db                   jne      0x4b46
4b6b: b0d2                   mov      al, 0xd2
4b6d: 8887b95e               mov      byte ptr [bx + 0x5eb9], al
4b71: 22c0                   and      al, al
4b73: c3                     ret      
4b74: 22e4                   and      ah, ah
4b76: 7801                   js       0x4b79
4b78: 4f                     dec      di
4b79: 8bd7                   mov      dx, di
4b7b: e87a00                 call     0x4bf8
4b7e: 2407                   and      al, 7
4b80: 2c02                   sub      al, 2
4b82: 028550c5               add      al, byte ptr [di - 0x3ab0]
4b86: 8887b95e               mov      byte ptr [bx + 0x5eb9], al
4b8a: e86b00                 call     0x4bf8
4b8d: 2407                   and      al, 7
4b8f: 2c04                   sub      al, 4
4b91: 02c2                   add      al, dl
4b93: 88875d59               mov      byte ptr [bx + 0x595d], al
4b97: 8ad0                   mov      dl, al
4b99: 8bfa                   mov      di, dx
4b9b: 23ff                   and      di, di
4b9d: c3                     ret      
4b9e: a03053                 mov      al, byte ptr [0x5330]
4ba1: 2480                   and      al, 0x80
4ba3: a27354                 mov      byte ptr [0x5473], al
4ba6: c7062758fe02           mov      word ptr [0x5827], 0x2fe
4bac: c7068f577888           mov      word ptr [0x578f], 0x8878
4bb2: bb0300                 mov      bx, 3
4bb5: b80001                 mov      ax, 0x100
4bb8: 8887bd58               mov      byte ptr [bx + 0x58bd], al
4bbc: 2b06e64a               sub      ax, word ptr [0x4ae6]
4bc0: 8887d957               mov      byte ptr [bx + 0x57d9], al
4bc4: 88a77158               mov      byte ptr [bx + 0x5871], ah
4bc8: e810fd                 call     0x48db
4bcb: fecb                   dec      bl
4bcd: 80fb02                 cmp      bl, 2
4bd0: 73e3                   jae      0x4bb5
4bd2: b80200                 mov      ax, 2
4bd5: bac403                 mov      dx, 0x3c4
4bd8: ef                     out      dx, ax
4bd9: a10a00                 mov      ax, word ptr [0xa]
4bdc: 8ec0                   mov      es, ax
4bde: b302                   mov      bl, 2
4be0: bf0300                 mov      di, 3
4be3: e8cb33                 call     0x7fb1
4be6: b8020f                 mov      ax, 0xf02
4be9: bac403                 mov      dx, 0x3c4
4bec: ef                     out      dx, ax
4bed: d0267354               shl      byte ptr [0x5473], 1
4bf1: 32ff                   xor      bh, bh
4bf3: 8cd8                   mov      ax, ds
4bf5: 8ec0                   mov      es, ax
4bf7: c3                     ret      
4bf8: a0b84a                 mov      al, byte ptr [0x4ab8]
4bfb: d0e8                   shr      al, 1
4bfd: a0b74a                 mov      al, byte ptr [0x4ab7]
4c00: a2b84a                 mov      byte ptr [0x4ab8], al
4c03: d0c8                   ror      al, 1
4c05: a2124b                 mov      byte ptr [0x4b12], al
4c08: a0b64a                 mov      al, byte ptr [0x4ab6]
4c0b: a2b74a                 mov      byte ptr [0x4ab7], al
4c0e: 240f                   and      al, 0xf
4c10: d0e8                   shr      al, 1
4c12: a2114b                 mov      byte ptr [0x4b11], al
4c15: a0b54a                 mov      al, byte ptr [0x4ab5]
4c18: a2b64a                 mov      byte ptr [0x4ab6], al
4c1b: a0b44a                 mov      al, byte ptr [0x4ab4]
4c1e: a2b54a                 mov      byte ptr [0x4ab5], al
4c21: a0b64a                 mov      al, byte ptr [0x4ab6]
4c24: 24f0                   and      al, 0xf0
4c26: 0a06114b               or       al, byte ptr [0x4b11]
4c2a: d0c8                   ror      al, 1
4c2c: d0c8                   ror      al, 1
4c2e: d0c8                   ror      al, 1
4c30: d0c8                   ror      al, 1
4c32: 3206124b               xor      al, byte ptr [0x4b12]
4c36: a2b44a                 mov      byte ptr [0x4ab4], al
4c39: c3                     ret      
4c3a: bfb560                 mov      di, 0x60b5
4c3d: beb44a                 mov      si, 0x4ab4
4c40: 8cc2                   mov      dx, es
4c42: b8d809                 mov      ax, 0x9d8
4c45: 8ec0                   mov      es, ax
4c47: b90500                 mov      cx, 5
4c4a: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
4c4c: 8ec2                   mov      es, dx
4c4e: c3                     ret      
4c4f: 81c6b060               add      si, 0x60b0
4c53: bfb84a                 mov      di, 0x4ab8
4c56: fd                     std      
4c57: 8cc2                   mov      dx, es
4c59: b8d809                 mov      ax, 0x9d8
4c5c: 8ec0                   mov      es, ax
4c5e: b90500                 mov      cx, 5
4c61: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
4c63: fc                     cld      
4c64: 8ec2                   mov      es, dx
4c66: c3                     ret      
4c67: be0e0e                 mov      si, 0xe0e
4c6a: bf6e01                 mov      di, 0x16e
4c6d: e869cb                 call     0x17d9
4c70: b8d809                 mov      ax, 0x9d8
4c73: 8ed8                   mov      ds, ax
4c75: 8ec0                   mov      es, ax
4c77: e8ddcb                 call     0x1857
4c7a: b394                   mov      bl, 0x94
4c7c: e820c7                 call     0x139f
4c7f: b008                   mov      al, 8
4c81: a21448                 mov      byte ptr [0x4814], al
4c84: 32c0                   xor      al, al
4c86: a21948                 mov      byte ptr [0x4819], al
4c89: b0c0                   mov      al, 0xc0
4c8b: e81dde                 call     0x2aab
4c8e: a06648                 mov      al, byte ptr [0x4866]
4c91: 22c0                   and      al, al
4c93: 78d1                   js       0x4c66
4c95: b8d809                 mov      ax, 0x9d8
4c98: 8ed8                   mov      ds, ax
4c9a: 8ec0                   mov      es, ax
4c9c: e889c9                 call     0x1628
4c9f: e898ff                 call     0x4c3a
4ca2: bf0100                 mov      di, 1
4ca5: e8fbdf                 call     0x2ca3
4ca8: b00c                   mov      al, 0xc
4caa: a21448                 mov      byte ptr [0x4814], al
4cad: b091                   mov      al, 0x91
4caf: 3cff                   cmp      al, 0xff
4cb1: 7404                   je       0x4cb7
4cb3: 3c20                   cmp      al, 0x20
4cb5: 7503                   jne      0x4cba
4cb7: e92e01                 jmp      0x4de8
4cba: bb916f                 mov      bx, 0x6f91
4cbd: 43                     inc      bx
4cbe: 803f20                 cmp      byte ptr [bx], 0x20
4cc1: 7405                   je       0x4cc8
4cc3: 803fff                 cmp      byte ptr [bx], 0xff
4cc6: 75f5                   jne      0x4cbd
4cc8: a03248                 mov      al, byte ptr [0x4832]
4ccb: 32e4                   xor      ah, ah
4ccd: d1e0                   shl      ax, 1
4ccf: 8bf0                   mov      si, ax
4cd1: 8bb41a48               mov      si, word ptr [si + 0x481a]
4cd5: 46                     inc      si
4cd6: ad                     lodsw    ax, word ptr [si]
4cd7: 8907                   mov      word ptr [bx], ax
4cd9: ad                     lodsw    ax, word ptr [si]
4cda: 894702                 mov      word ptr [bx + 2], ax
4cdd: 32c0                   xor      al, al
4cdf: 884704                 mov      byte ptr [bx + 4], al
4ce2: b001                   mov      al, 1
4ce4: e8b14e                 call     0x9b98
4ce7: ba916f                 mov      dx, 0x6f91
4cea: e8d4b5                 call     0x2c1
4ced: a08856                 mov      al, byte ptr [0x5688]
4cf0: 22c0                   and      al, al
4cf2: 7442                   je       0x4d36
4cf4: b43c                   mov      ah, 0x3c
4cf6: 33c9                   xor      cx, cx
4cf8: cd21                   int      0x21
4cfa: 7303                   jae      0x4cff
4cfc: e98d00                 jmp      0x4d8c
4cff: 8bd8                   mov      bx, ax
4d01: 53                     push     bx
4d02: b440                   mov      ah, 0x40
4d04: b9c000                 mov      cx, 0xc0
4d07: ba10c5                 mov      dx, 0xc510
4d0a: a03248                 mov      al, byte ptr [0x4832]
4d0d: 3c02                   cmp      al, 2
4d0f: 740d                   je       0x4d1e
4d11: ba054f                 mov      dx, 0x4f05
4d14: b90001                 mov      cx, 0x100
4d17: 3c01                   cmp      al, 1
4d19: 7403                   je       0x4d1e
4d1b: b90002                 mov      cx, 0x200
4d1e: cd21                   int      0x21
4d20: 5b                     pop      bx
4d21: 7269                   jb       0x4d8c
4d23: 53                     push     bx
4d24: 5b                     pop      bx
4d25: b43e                   mov      ah, 0x3e
4d27: cd21                   int      0x21
4d29: 7261                   jb       0x4d8c
4d2b: 32c0                   xor      al, al
4d2d: a20d54                 mov      byte ptr [0x540d], al
4d30: e8654e                 call     0x9b98
4d33: e981b5                 jmp      0x2b7
4d36: b8003d                 mov      ax, 0x3d00
4d39: cd21                   int      0x21
4d3b: 724f                   jb       0x4d8c
4d3d: 8bd8                   mov      bx, ax
4d3f: 53                     push     bx
4d40: b43f                   mov      ah, 0x3f
4d42: b9c000                 mov      cx, 0xc0
4d45: ba10c5                 mov      dx, 0xc510
4d48: a03248                 mov      al, byte ptr [0x4832]
4d4b: 3c02                   cmp      al, 2
4d4d: 740d                   je       0x4d5c
4d4f: ba054f                 mov      dx, 0x4f05
4d52: b90001                 mov      cx, 0x100
4d55: 3c01                   cmp      al, 1
4d57: 7403                   je       0x4d5c
4d59: b90002                 mov      cx, 0x200
4d5c: cd21                   int      0x21
4d5e: 5b                     pop      bx
4d5f: 722b                   jb       0x4d8c
4d61: 53                     push     bx
4d62: ebc0                   jmp      0x4d24
4d64: fb                     sti      
4d65: 53                     push     bx
4d66: 51                     push     cx
4d67: 52                     push     dx
4d68: 56                     push     si
4d69: 57                     push     di
4d6a: 06                     push     es
4d6b: 1e                     push     ds
4d6c: b8d809                 mov      ax, 0x9d8
4d6f: 8ed8                   mov      ds, ax
4d71: 8ec0                   mov      es, ax
4d73: a00d54                 mov      al, byte ptr [0x540d]
4d76: 50                     push     ax
4d77: 8bc7                   mov      ax, di
4d79: 32e4                   xor      ah, ah
4d7b: e80e00                 call     0x4d8c
4d7e: 58                     pop      ax
4d7f: a20d54                 mov      byte ptr [0x540d], al
4d82: 1f                     pop      ds
4d83: 07                     pop      es
4d84: 5f                     pop      di
4d85: 5e                     pop      si
4d86: 5a                     pop      dx
4d87: 59                     pop      cx
4d88: 5b                     pop      bx
4d89: b001                   mov      al, 1
4d8b: cf                     iret     
4d8c: e894b7                 call     0x523
4d8f: b459                   mov      ah, 0x59
4d91: 33db                   xor      bx, bx
4d93: cd21                   int      0x21
4d95: 50                     push     ax
4d96: be0e0e                 mov      si, 0xe0e
4d99: bf6e01                 mov      di, 0x16e
4d9c: e83aca                 call     0x17d9
4d9f: 32c0                   xor      al, al
4da1: a2bd02                 mov      byte ptr [0x2bd], al
4da4: 58                     pop      ax
4da5: 3c1f                   cmp      al, 0x1f
4da7: 7202                   jb       0x4dab
4da9: b001                   mov      al, 1
4dab: 98                     cwde     
4dac: d1e0                   shl      ax, 1
4dae: 05e360                 add      ax, 0x60e3
4db1: 8bd8                   mov      bx, ax
4db3: 8b1f                   mov      bx, word ptr [bx]
4db5: 53                     push     bx
4db6: b01f                   mov      al, 0x1f
4db8: e845b5                 call     0x300
4dbb: b005                   mov      al, 5
4dbd: e840b5                 call     0x300
4dc0: b017                   mov      al, 0x17
4dc2: e83bb5                 call     0x300
4dc5: 5b                     pop      bx
4dc6: 8a07                   mov      al, byte ptr [bx]
4dc8: 3cff                   cmp      al, 0xff
4dca: 7408                   je       0x4dd4
4dcc: 53                     push     bx
4dcd: e830b5                 call     0x300
4dd0: 5b                     pop      bx
4dd1: 43                     inc      bx
4dd2: ebf2                   jmp      0x4dc6
4dd4: e8e0b4                 call     0x2b7
4dd7: e855c8                 call     0x162f
4dda: be0e0e                 mov      si, 0xe0e
4ddd: bf6e01                 mov      di, 0x16e
4de0: e8f6c9                 call     0x17d9
4de3: b394                   mov      bl, 0x94
4de5: e8b7c5                 call     0x139f
4de8: b0ff                   mov      al, 0xff
4dea: a20d54                 mov      byte ptr [0x540d], al
4ded: e9c7b4                 jmp      0x2b7
4df0: bf8402                 mov      di, 0x284
4df3: bac403                 mov      dx, 0x3c4
4df6: b8020f                 mov      ax, 0xf02
4df9: ef                     out      dx, ax
4dfa: a10a00                 mov      ax, word ptr [0xa]
4dfd: 8ec0                   mov      es, ax
4dff: ba0800                 mov      dx, 8
4e02: bb1000                 mov      bx, 0x10
4e05: b8ffff                 mov      ax, 0xffff
4e08: 8bcb                   mov      cx, bx
4e0a: f3ab                   rep stosw word ptr es:[di], ax
4e0c: 03fa                   add      di, dx
4e0e: 8bcb                   mov      cx, bx
4e10: f3ab                   rep stosw word ptr es:[di], ax
4e12: 03fa                   add      di, dx
4e14: 8bcb                   mov      cx, bx
4e16: f3ab                   rep stosw word ptr es:[di], ax
4e18: 03fa                   add      di, dx
4e1a: 8bcb                   mov      cx, bx
4e1c: f3ab                   rep stosw word ptr es:[di], ax
4e1e: 03fa                   add      di, dx
4e20: 8bcb                   mov      cx, bx
4e22: f3ab                   rep stosw word ptr es:[di], ax
4e24: 03fa                   add      di, dx
4e26: 8bcb                   mov      cx, bx
4e28: f3ab                   rep stosw word ptr es:[di], ax
4e2a: 03fa                   add      di, dx
4e2c: 8bcb                   mov      cx, bx
4e2e: f3ab                   rep stosw word ptr es:[di], ax
4e30: 03fa                   add      di, dx
4e32: 8bcb                   mov      cx, bx
4e34: f3ab                   rep stosw word ptr es:[di], ax
4e36: 03fa                   add      di, dx
4e38: 8bcb                   mov      cx, bx
4e3a: f3ab                   rep stosw word ptr es:[di], ax
4e3c: 03fa                   add      di, dx
4e3e: 8bcb                   mov      cx, bx
4e40: f3ab                   rep stosw word ptr es:[di], ax
4e42: 03fa                   add      di, dx
4e44: 8bcb                   mov      cx, bx
4e46: f3ab                   rep stosw word ptr es:[di], ax
4e48: 03fa                   add      di, dx
4e4a: 8bcb                   mov      cx, bx
4e4c: f3ab                   rep stosw word ptr es:[di], ax
4e4e: 03fa                   add      di, dx
4e50: 8bcb                   mov      cx, bx
4e52: f3ab                   rep stosw word ptr es:[di], ax
4e54: 03fa                   add      di, dx
4e56: 8bcb                   mov      cx, bx
4e58: f3ab                   rep stosw word ptr es:[di], ax
4e5a: 03fa                   add      di, dx
4e5c: 8bcb                   mov      cx, bx
4e5e: f3ab                   rep stosw word ptr es:[di], ax
4e60: 03fa                   add      di, dx
4e62: 8bcb                   mov      cx, bx
4e64: f3ab                   rep stosw word ptr es:[di], ax
4e66: 03fa                   add      di, dx
4e68: 8bcb                   mov      cx, bx
4e6a: f3ab                   rep stosw word ptr es:[di], ax
4e6c: 03fa                   add      di, dx
4e6e: 8bcb                   mov      cx, bx
4e70: f3ab                   rep stosw word ptr es:[di], ax
4e72: 03fa                   add      di, dx
4e74: 8bcb                   mov      cx, bx
4e76: f3ab                   rep stosw word ptr es:[di], ax
4e78: 03fa                   add      di, dx
4e7a: 8bcb                   mov      cx, bx
4e7c: f3ab                   rep stosw word ptr es:[di], ax
4e7e: 03fa                   add      di, dx
4e80: 8bcb                   mov      cx, bx
4e82: f3ab                   rep stosw word ptr es:[di], ax
4e84: 03fa                   add      di, dx
4e86: 8bcb                   mov      cx, bx
4e88: f3ab                   rep stosw word ptr es:[di], ax
4e8a: 03fa                   add      di, dx
4e8c: 8bcb                   mov      cx, bx
4e8e: f3ab                   rep stosw word ptr es:[di], ax
4e90: 03fa                   add      di, dx
4e92: 8bcb                   mov      cx, bx
4e94: f3ab                   rep stosw word ptr es:[di], ax
4e96: 03fa                   add      di, dx
4e98: 8bcb                   mov      cx, bx
4e9a: f3ab                   rep stosw word ptr es:[di], ax
4e9c: 03fa                   add      di, dx
4e9e: 8bcb                   mov      cx, bx
4ea0: f3ab                   rep stosw word ptr es:[di], ax
4ea2: 03fa                   add      di, dx
4ea4: 8bcb                   mov      cx, bx
4ea6: f3ab                   rep stosw word ptr es:[di], ax
4ea8: 03fa                   add      di, dx
4eaa: 8bcb                   mov      cx, bx
4eac: f3ab                   rep stosw word ptr es:[di], ax
4eae: 03fa                   add      di, dx
4eb0: 8bcb                   mov      cx, bx
4eb2: f3ab                   rep stosw word ptr es:[di], ax
4eb4: 03fa                   add      di, dx
4eb6: 8bcb                   mov      cx, bx
4eb8: f3ab                   rep stosw word ptr es:[di], ax
4eba: 03fa                   add      di, dx
4ebc: 8bcb                   mov      cx, bx
4ebe: f3ab                   rep stosw word ptr es:[di], ax
4ec0: 03fa                   add      di, dx
4ec2: 8bcb                   mov      cx, bx
4ec4: f3ab                   rep stosw word ptr es:[di], ax
4ec6: 03fa                   add      di, dx
4ec8: 8bcb                   mov      cx, bx
4eca: f3ab                   rep stosw word ptr es:[di], ax
4ecc: 03fa                   add      di, dx
4ece: 8bcb                   mov      cx, bx
4ed0: f3ab                   rep stosw word ptr es:[di], ax
4ed2: 03fa                   add      di, dx
4ed4: 8bcb                   mov      cx, bx
4ed6: f3ab                   rep stosw word ptr es:[di], ax
4ed8: 03fa                   add      di, dx
4eda: 8bcb                   mov      cx, bx
4edc: f3ab                   rep stosw word ptr es:[di], ax
4ede: 03fa                   add      di, dx
4ee0: 8bcb                   mov      cx, bx
4ee2: f3ab                   rep stosw word ptr es:[di], ax
4ee4: 03fa                   add      di, dx
4ee6: 8bcb                   mov      cx, bx
4ee8: f3ab                   rep stosw word ptr es:[di], ax
4eea: 03fa                   add      di, dx
4eec: 8bcb                   mov      cx, bx
4eee: f3ab                   rep stosw word ptr es:[di], ax
4ef0: 03fa                   add      di, dx
4ef2: 8bcb                   mov      cx, bx
4ef4: f3ab                   rep stosw word ptr es:[di], ax
4ef6: 03fa                   add      di, dx
4ef8: 8bcb                   mov      cx, bx
4efa: f3ab                   rep stosw word ptr es:[di], ax
4efc: 03fa                   add      di, dx
4efe: 8bcb                   mov      cx, bx
4f00: f3ab                   rep stosw word ptr es:[di], ax
4f02: 03fa                   add      di, dx
4f04: 8bcb                   mov      cx, bx
4f06: f3ab                   rep stosw word ptr es:[di], ax
4f08: 03fa                   add      di, dx
4f0a: 8bcb                   mov      cx, bx
4f0c: f3ab                   rep stosw word ptr es:[di], ax
4f0e: 03fa                   add      di, dx
4f10: 8bcb                   mov      cx, bx
4f12: f3ab                   rep stosw word ptr es:[di], ax
4f14: 03fa                   add      di, dx
4f16: 8bcb                   mov      cx, bx
4f18: f3ab                   rep stosw word ptr es:[di], ax
4f1a: 03fa                   add      di, dx
4f1c: 8bcb                   mov      cx, bx
4f1e: f3ab                   rep stosw word ptr es:[di], ax
4f20: 03fa                   add      di, dx
4f22: 8bcb                   mov      cx, bx
4f24: f3ab                   rep stosw word ptr es:[di], ax
4f26: 03fa                   add      di, dx
4f28: 8bcb                   mov      cx, bx
4f2a: f3ab                   rep stosw word ptr es:[di], ax
4f2c: 03fa                   add      di, dx
4f2e: 8bcb                   mov      cx, bx
4f30: f3ab                   rep stosw word ptr es:[di], ax
4f32: 03fa                   add      di, dx
4f34: 8bcb                   mov      cx, bx
4f36: f3ab                   rep stosw word ptr es:[di], ax
4f38: 03fa                   add      di, dx
4f3a: 8bcb                   mov      cx, bx
4f3c: f3ab                   rep stosw word ptr es:[di], ax
4f3e: 03fa                   add      di, dx
4f40: 8bcb                   mov      cx, bx
4f42: f3ab                   rep stosw word ptr es:[di], ax
4f44: 03fa                   add      di, dx
4f46: 8bcb                   mov      cx, bx
4f48: f3ab                   rep stosw word ptr es:[di], ax
4f4a: 03fa                   add      di, dx
4f4c: 8bcb                   mov      cx, bx
4f4e: f3ab                   rep stosw word ptr es:[di], ax
4f50: 03fa                   add      di, dx
4f52: 8bcb                   mov      cx, bx
4f54: f3ab                   rep stosw word ptr es:[di], ax
4f56: 03fa                   add      di, dx
4f58: 8bcb                   mov      cx, bx
4f5a: f3ab                   rep stosw word ptr es:[di], ax
4f5c: 03fa                   add      di, dx
4f5e: 8bcb                   mov      cx, bx
4f60: f3ab                   rep stosw word ptr es:[di], ax
4f62: 03fa                   add      di, dx
4f64: 8bcb                   mov      cx, bx
4f66: f3ab                   rep stosw word ptr es:[di], ax
4f68: 03fa                   add      di, dx
4f6a: 8bcb                   mov      cx, bx
4f6c: f3ab                   rep stosw word ptr es:[di], ax
4f6e: 03fa                   add      di, dx
4f70: 8bcb                   mov      cx, bx
4f72: f3ab                   rep stosw word ptr es:[di], ax
4f74: 03fa                   add      di, dx
4f76: 8bcb                   mov      cx, bx
4f78: f3ab                   rep stosw word ptr es:[di], ax
4f7a: 03fa                   add      di, dx
4f7c: 8bcb                   mov      cx, bx
4f7e: f3ab                   rep stosw word ptr es:[di], ax
4f80: 03fa                   add      di, dx
4f82: 8bcb                   mov      cx, bx
4f84: f3ab                   rep stosw word ptr es:[di], ax
4f86: 03fa                   add      di, dx
4f88: 8bcb                   mov      cx, bx
4f8a: f3ab                   rep stosw word ptr es:[di], ax
4f8c: 03fa                   add      di, dx
4f8e: 8bcb                   mov      cx, bx
4f90: f3ab                   rep stosw word ptr es:[di], ax
4f92: 03fa                   add      di, dx
4f94: 8bcb                   mov      cx, bx
4f96: f3ab                   rep stosw word ptr es:[di], ax
4f98: 03fa                   add      di, dx
4f9a: 8bcb                   mov      cx, bx
4f9c: f3ab                   rep stosw word ptr es:[di], ax
4f9e: 03fa                   add      di, dx
4fa0: 8bcb                   mov      cx, bx
4fa2: f3ab                   rep stosw word ptr es:[di], ax
4fa4: 03fa                   add      di, dx
4fa6: 8bcb                   mov      cx, bx
4fa8: f3ab                   rep stosw word ptr es:[di], ax
4faa: 03fa                   add      di, dx
4fac: 8bcb                   mov      cx, bx
4fae: f3ab                   rep stosw word ptr es:[di], ax
4fb0: 03fa                   add      di, dx
4fb2: 8bcb                   mov      cx, bx
4fb4: f3ab                   rep stosw word ptr es:[di], ax
4fb6: 03fa                   add      di, dx
4fb8: 8bcb                   mov      cx, bx
4fba: f3ab                   rep stosw word ptr es:[di], ax
4fbc: 03fa                   add      di, dx
4fbe: 8bcb                   mov      cx, bx
4fc0: f3ab                   rep stosw word ptr es:[di], ax
4fc2: 03fa                   add      di, dx
4fc4: 8bcb                   mov      cx, bx
4fc6: f3ab                   rep stosw word ptr es:[di], ax
4fc8: 03fa                   add      di, dx
4fca: 8bcb                   mov      cx, bx
4fcc: f3ab                   rep stosw word ptr es:[di], ax
4fce: 03fa                   add      di, dx
4fd0: 8bcb                   mov      cx, bx
4fd2: f3ab                   rep stosw word ptr es:[di], ax
4fd4: 03fa                   add      di, dx
4fd6: 8bcb                   mov      cx, bx
4fd8: f3ab                   rep stosw word ptr es:[di], ax
4fda: 03fa                   add      di, dx
4fdc: 8bcb                   mov      cx, bx
4fde: f3ab                   rep stosw word ptr es:[di], ax
4fe0: 03fa                   add      di, dx
4fe2: 8bcb                   mov      cx, bx
4fe4: f3ab                   rep stosw word ptr es:[di], ax
4fe6: 03fa                   add      di, dx
4fe8: 8bcb                   mov      cx, bx
4fea: f3ab                   rep stosw word ptr es:[di], ax
4fec: 03fa                   add      di, dx
4fee: 8bcb                   mov      cx, bx
4ff0: f3ab                   rep stosw word ptr es:[di], ax
4ff2: 03fa                   add      di, dx
4ff4: 8bcb                   mov      cx, bx
4ff6: f3ab                   rep stosw word ptr es:[di], ax
4ff8: 03fa                   add      di, dx
4ffa: 8bcb                   mov      cx, bx
4ffc: f3ab                   rep stosw word ptr es:[di], ax
4ffe: 03fa                   add      di, dx
5000: 8bcb                   mov      cx, bx
5002: f3ab                   rep stosw word ptr es:[di], ax
5004: 03fa                   add      di, dx
5006: 8bcb                   mov      cx, bx
5008: f3ab                   rep stosw word ptr es:[di], ax
500a: 03fa                   add      di, dx
500c: 8bcb                   mov      cx, bx
500e: f3ab                   rep stosw word ptr es:[di], ax
5010: 03fa                   add      di, dx
5012: 8bcb                   mov      cx, bx
5014: f3ab                   rep stosw word ptr es:[di], ax
5016: 03fa                   add      di, dx
5018: 8bcb                   mov      cx, bx
501a: f3ab                   rep stosw word ptr es:[di], ax
501c: 03fa                   add      di, dx
501e: 8bcb                   mov      cx, bx
5020: f3ab                   rep stosw word ptr es:[di], ax
5022: 03fa                   add      di, dx
5024: 8bcb                   mov      cx, bx
5026: f3ab                   rep stosw word ptr es:[di], ax
5028: 03fa                   add      di, dx
502a: 8bcb                   mov      cx, bx
502c: f3ab                   rep stosw word ptr es:[di], ax
502e: 03fa                   add      di, dx
5030: 8bcb                   mov      cx, bx
5032: f3ab                   rep stosw word ptr es:[di], ax
5034: 03fa                   add      di, dx
5036: 8bcb                   mov      cx, bx
5038: f3ab                   rep stosw word ptr es:[di], ax
503a: 03fa                   add      di, dx
503c: 8bcb                   mov      cx, bx
503e: f3ab                   rep stosw word ptr es:[di], ax
5040: 03fa                   add      di, dx
5042: 8bcb                   mov      cx, bx
5044: f3ab                   rep stosw word ptr es:[di], ax
5046: 03fa                   add      di, dx
5048: 8bcb                   mov      cx, bx
504a: f3ab                   rep stosw word ptr es:[di], ax
504c: 03fa                   add      di, dx
504e: 8bcb                   mov      cx, bx
5050: f3ab                   rep stosw word ptr es:[di], ax
5052: 03fa                   add      di, dx
5054: 8bcb                   mov      cx, bx
5056: f3ab                   rep stosw word ptr es:[di], ax
5058: 03fa                   add      di, dx
505a: 8bcb                   mov      cx, bx
505c: f3ab                   rep stosw word ptr es:[di], ax
505e: 03fa                   add      di, dx
5060: 8bcb                   mov      cx, bx
5062: f3ab                   rep stosw word ptr es:[di], ax
5064: 03fa                   add      di, dx
5066: 8bcb                   mov      cx, bx
5068: f3ab                   rep stosw word ptr es:[di], ax
506a: 03fa                   add      di, dx
506c: 8bcb                   mov      cx, bx
506e: f3ab                   rep stosw word ptr es:[di], ax
5070: 03fa                   add      di, dx
5072: 8bcb                   mov      cx, bx
5074: f3ab                   rep stosw word ptr es:[di], ax
5076: 03fa                   add      di, dx
5078: 8bcb                   mov      cx, bx
507a: f3ab                   rep stosw word ptr es:[di], ax
507c: 03fa                   add      di, dx
507e: 8bcb                   mov      cx, bx
5080: f3ab                   rep stosw word ptr es:[di], ax
5082: 03fa                   add      di, dx
5084: 8bcb                   mov      cx, bx
5086: f3ab                   rep stosw word ptr es:[di], ax
5088: 03fa                   add      di, dx
508a: b85e18                 mov      ax, 0x185e
508d: 8ed8                   mov      ds, ax
508f: be3c13                 mov      si, 0x133c
5092: 8bea                   mov      bp, dx
5094: bac403                 mov      dx, 0x3c4
5097: b80208                 mov      ax, 0x802
509a: ef                     out      dx, ax
509b: 8bcb                   mov      cx, bx
509d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
509f: 03fd                   add      di, bp
50a1: 03f5                   add      si, bp
50a3: 8bcb                   mov      cx, bx
50a5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50a7: 03fd                   add      di, bp
50a9: 03f5                   add      si, bp
50ab: 8bcb                   mov      cx, bx
50ad: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50af: 03fd                   add      di, bp
50b1: 03f5                   add      si, bp
50b3: 8bcb                   mov      cx, bx
50b5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50b7: 03fd                   add      di, bp
50b9: 03f5                   add      si, bp
50bb: 8bcb                   mov      cx, bx
50bd: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50bf: 03fd                   add      di, bp
50c1: 03f5                   add      si, bp
50c3: 8bcb                   mov      cx, bx
50c5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50c7: 03fd                   add      di, bp
50c9: 03f5                   add      si, bp
50cb: 8bcb                   mov      cx, bx
50cd: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50cf: 03fd                   add      di, bp
50d1: 03f5                   add      si, bp
50d3: 8bcb                   mov      cx, bx
50d5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50d7: 03fd                   add      di, bp
50d9: 03f5                   add      si, bp
50db: 8bcb                   mov      cx, bx
50dd: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50df: 03fd                   add      di, bp
50e1: 03f5                   add      si, bp
50e3: 8bcb                   mov      cx, bx
50e5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50e7: 03fd                   add      di, bp
50e9: 03f5                   add      si, bp
50eb: 8bcb                   mov      cx, bx
50ed: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50ef: 03fd                   add      di, bp
50f1: 03f5                   add      si, bp
50f3: 8bcb                   mov      cx, bx
50f5: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50f7: 03fd                   add      di, bp
50f9: 03f5                   add      si, bp
50fb: 8bcb                   mov      cx, bx
50fd: f3a5                   rep movsw word ptr es:[di], word ptr [si]
50ff: 03fd                   add      di, bp
5101: 03f5                   add      si, bp
5103: 8bcb                   mov      cx, bx
5105: f3a5                   rep movsw word ptr es:[di], word ptr [si]
5107: 03fd                   add      di, bp
5109: 03f5                   add      si, bp
510b: 8bcb                   mov      cx, bx
510d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
510f: 03fd                   add      di, bp
5111: 03f5                   add      si, bp
5113: 8bcb                   mov      cx, bx
5115: f3a5                   rep movsw word ptr es:[di], word ptr [si]
5117: 03fd                   add      di, bp
5119: 03f5                   add      si, bp
511b: 8bcb                   mov      cx, bx
511d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
511f: 03fd                   add      di, bp
5121: 03f5                   add      si, bp
5123: 8bcb                   mov      cx, bx
5125: f3a5                   rep movsw word ptr es:[di], word ptr [si]
5127: 03fd                   add      di, bp
5129: 03f5                   add      si, bp
512b: 8bcb                   mov      cx, bx
512d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
512f: 03fd                   add      di, bp
5131: 03f5                   add      si, bp
5133: 8bcb                   mov      cx, bx
5135: f3a5                   rep movsw word ptr es:[di], word ptr [si]
5137: 03fd                   add      di, bp
5139: 03f5                   add      si, bp
513b: 8bcb                   mov      cx, bx
513d: f3a5                   rep movsw word ptr es:[di], word ptr [si]
513f: 03fd                   add      di, bp
5141: 03f5                   add      si, bp
5143: 8bcb                   mov      cx, bx
5145: f3a5                   rep movsw word ptr es:[di], word ptr [si]
5147: 03fd                   add      di, bp
5149: 03f5                   add      si, bp
514b: 81ef7003               sub      di, 0x370
514f: 81c6d01b               add      si, 0x1bd0
5153: d0ec                   shr      ah, 1
5155: 7203                   jb       0x515a
5157: e940ff                 jmp      0x509a
515a: beac16                 mov      si, 0x16ac
515d: bfac16                 mov      di, 0x16ac
5160: bd2600                 mov      bp, 0x26
5163: b92400                 mov      cx, 0x24
5166: b408                   mov      ah, 8
5168: ef                     out      dx, ax
5169: a5                     movsw    word ptr es:[di], word ptr [si]
516a: a5                     movsw    word ptr es:[di], word ptr [si]
516b: 03f9                   add      di, cx
516d: 03f1                   add      si, cx
516f: a5                     movsw    word ptr es:[di], word ptr [si]
5170: a5                     movsw    word ptr es:[di], word ptr [si]
5171: 03f9                   add      di, cx
5173: 03f1                   add      si, cx
5175: a5                     movsw    word ptr es:[di], word ptr [si]
5176: a5                     movsw    word ptr es:[di], word ptr [si]
5177: 03f9                   add      di, cx
5179: 03f1                   add      si, cx
517b: a5                     movsw    word ptr es:[di], word ptr [si]
517c: a5                     movsw    word ptr es:[di], word ptr [si]
517d: 03f9                   add      di, cx
517f: 03f1                   add      si, cx
5181: a5                     movsw    word ptr es:[di], word ptr [si]
5182: a5                     movsw    word ptr es:[di], word ptr [si]
5183: 03f9                   add      di, cx
5185: 03f1                   add      si, cx
5187: a5                     movsw    word ptr es:[di], word ptr [si]
5188: a5                     movsw    word ptr es:[di], word ptr [si]
5189: 03f9                   add      di, cx
518b: 03f1                   add      si, cx
518d: a5                     movsw    word ptr es:[di], word ptr [si]
518e: 03fd                   add      di, bp
5190: 03f5                   add      si, bp
5192: a5                     movsw    word ptr es:[di], word ptr [si]
5193: 03fd                   add      di, bp
5195: 03f5                   add      si, bp
5197: a5                     movsw    word ptr es:[di], word ptr [si]
5198: 03fd                   add      di, bp
519a: 03f5                   add      si, bp
519c: a5                     movsw    word ptr es:[di], word ptr [si]
519d: 03fd                   add      di, bp
519f: 03f5                   add      si, bp
51a1: a5                     movsw    word ptr es:[di], word ptr [si]
51a2: 03fd                   add      di, bp
51a4: 03f5                   add      si, bp
51a6: a5                     movsw    word ptr es:[di], word ptr [si]
51a7: 03fd                   add      di, bp
51a9: 03f5                   add      si, bp
51ab: a5                     movsw    word ptr es:[di], word ptr [si]
51ac: 03fd                   add      di, bp
51ae: 03f5                   add      si, bp
51b0: a5                     movsw    word ptr es:[di], word ptr [si]
51b1: 03fd                   add      di, bp
51b3: 03f5                   add      si, bp
51b5: 81ef3002               sub      di, 0x230
51b9: 81c6101d               add      si, 0x1d10
51bd: d0ec                   shr      ah, 1
51bf: 7202                   jb       0x51c3
51c1: eba5                   jmp      0x5168
51c3: 83c71c                 add      di, 0x1c
51c6: bec816                 mov      si, 0x16c8
51c9: b408                   mov      ah, 8
51cb: ef                     out      dx, ax
51cc: a5                     movsw    word ptr es:[di], word ptr [si]
51cd: a5                     movsw    word ptr es:[di], word ptr [si]
51ce: 03f9                   add      di, cx
51d0: 03f1                   add      si, cx
51d2: a5                     movsw    word ptr es:[di], word ptr [si]
51d3: a5                     movsw    word ptr es:[di], word ptr [si]
51d4: 03f9                   add      di, cx
51d6: 03f1                   add      si, cx
51d8: a5                     movsw    word ptr es:[di], word ptr [si]
51d9: a5                     movsw    word ptr es:[di], word ptr [si]
51da: 03f9                   add      di, cx
51dc: 03f1                   add      si, cx
51de: a5                     movsw    word ptr es:[di], word ptr [si]
51df: a5                     movsw    word ptr es:[di], word ptr [si]
51e0: 03f9                   add      di, cx
51e2: 03f1                   add      si, cx
51e4: a5                     movsw    word ptr es:[di], word ptr [si]
51e5: a5                     movsw    word ptr es:[di], word ptr [si]
51e6: 03f9                   add      di, cx
51e8: 03f1                   add      si, cx
51ea: a5                     movsw    word ptr es:[di], word ptr [si]
51eb: a5                     movsw    word ptr es:[di], word ptr [si]
51ec: 03fd                   add      di, bp
51ee: 03f5                   add      si, bp
51f0: a5                     movsw    word ptr es:[di], word ptr [si]
51f1: 03fd                   add      di, bp
51f3: 03f5                   add      si, bp
51f5: a5                     movsw    word ptr es:[di], word ptr [si]
51f6: 03fd                   add      di, bp
51f8: 03f5                   add      si, bp
51fa: a5                     movsw    word ptr es:[di], word ptr [si]
51fb: 03fd                   add      di, bp
51fd: 03f5                   add      si, bp
51ff: a5                     movsw    word ptr es:[di], word ptr [si]
5200: 03fd                   add      di, bp
5202: 03f5                   add      si, bp
5204: a5                     movsw    word ptr es:[di], word ptr [si]
5205: 03fd                   add      di, bp
5207: 03f5                   add      si, bp
5209: a5                     movsw    word ptr es:[di], word ptr [si]
520a: 03fd                   add      di, bp
520c: 03f5                   add      si, bp
520e: a5                     movsw    word ptr es:[di], word ptr [si]
520f: 03fd                   add      di, bp
5211: 03f5                   add      si, bp
5213: a5                     movsw    word ptr es:[di], word ptr [si]
5214: 03fd                   add      di, bp
5216: 03f5                   add      si, bp
5218: 81ef3202               sub      di, 0x232
521c: 81c60e1d               add      si, 0x1d0e
5220: d0ec                   shr      ah, 1
5222: 7202                   jb       0x5226
5224: eba5                   jmp      0x51cb
5226: b40f                   mov      ah, 0xf
5228: ef                     out      dx, ax
5229: b8d809                 mov      ax, 0x9d8
522c: 8ed8                   mov      ds, ax
522e: 8ec0                   mov      es, ax
5230: c3                     ret      
5231: a01e4b                 mov      al, byte ptr [0x4b1e]
5234: 3cc0                   cmp      al, 0xc0
5236: 7205                   jb       0x523d
5238: b0bf                   mov      al, 0xbf
523a: a21e4b                 mov      byte ptr [0x4b1e], al
523d: 8a261d4b               mov      ah, byte ptr [0x4b1d]
5241: 80fc40                 cmp      ah, 0x40
5244: 7306                   jae      0x524c
5246: b440                   mov      ah, 0x40
5248: 88261d4b               mov      byte ptr [0x4b1d], ah
524c: 3ae0                   cmp      ah, al
524e: 7735                   ja       0x5285
5250: 0404                   add      al, 4
5252: 25fcfc                 and      ax, 0xfcfc
5255: 8826fc4a               mov      byte ptr [0x4afc], ah
5259: a2134b                 mov      byte ptr [0x4b13], al
525c: 8adc                   mov      bl, ah
525e: 32ff                   xor      bh, bh
5260: 8bf3                   mov      si, bx
5262: 2ac4                   sub      al, ah
5264: 8ae7                   mov      ah, bh
5266: 8bc8                   mov      cx, ax
5268: 81c350c6               add      bx, 0xc650
526c: 81c650c7               add      si, 0xc750
5270: b4c0                   mov      ah, 0xc0
5272: 8a07                   mov      al, byte ptr [bx]
5274: 22c0                   and      al, al
5276: 7504                   jne      0x527c
5278: 8824                   mov      byte ptr [si], ah
527a: 8827                   mov      byte ptr [bx], ah
527c: fe07                   inc      byte ptr [bx]
527e: 43                     inc      bx
527f: 46                     inc      si
5280: e2f0                   loop     0x5272
5282: 32ff                   xor      bh, bh
5284: c3                     ret      
5285: d02e294b               shr      byte ptr [0x4b29], 1
5289: d02e0f54               shr      byte ptr [0x540f], 1
528d: c3                     ret      
528e: 32f6                   xor      dh, dh
5290: 8b8750c6               mov      ax, word ptr [bx - 0x39b0]
5294: 8b8f10c5               mov      cx, word ptr [bx - 0x3af0]
5298: 3ac1                   cmp      al, cl
529a: 7312                   jae      0x52ae
529c: 8ad0                   mov      dl, al
529e: 8bfa                   mov      di, dx
52a0: 80b5d05f08             xor      byte ptr [di + 0x5fd0], 8
52a5: 8ad1                   mov      dl, cl
52a7: 8bfa                   mov      di, dx
52a9: 80b5d15f08             xor      byte ptr [di + 0x5fd1], 8
52ae: 3ae5                   cmp      ah, ch
52b0: 7312                   jae      0x52c4
52b2: 8ad4                   mov      dl, ah
52b4: 8bfa                   mov      di, dx
52b6: 80b5d05f04             xor      byte ptr [di + 0x5fd0], 4
52bb: 8ad5                   mov      dl, ch
52bd: 8bfa                   mov      di, dx
52bf: 80b5d15f04             xor      byte ptr [di + 0x5fd1], 4
52c4: 8b8752c6               mov      ax, word ptr [bx - 0x39ae]
52c8: 8b8f12c5               mov      cx, word ptr [bx - 0x3aee]
52cc: 3ac1                   cmp      al, cl
52ce: 7312                   jae      0x52e2
52d0: 8ad0                   mov      dl, al
52d2: 8bfa                   mov      di, dx
52d4: 80b5d05f02             xor      byte ptr [di + 0x5fd0], 2
52d9: 8ad1                   mov      dl, cl
52db: 8bfa                   mov      di, dx
52dd: 80b5d15f02             xor      byte ptr [di + 0x5fd1], 2
52e2: 3ae5                   cmp      ah, ch
52e4: 7312                   jae      0x52f8
52e6: 8ad4                   mov      dl, ah
52e8: 8bfa                   mov      di, dx
52ea: 80b5d05f01             xor      byte ptr [di + 0x5fd0], 1
52ef: 8ad5                   mov      dl, ch
52f1: 8bfa                   mov      di, dx
52f3: 80b5d15f01             xor      byte ptr [di + 0x5fd1], 1
52f8: c3                     ret      
52f9: a0294b                 mov      al, byte ptr [0x4b29]
52fc: 22c0                   and      al, al
52fe: 79f8                   jns      0x52f8
5300: d0e8                   shr      al, 1
5302: a2294b                 mov      byte ptr [0x4b29], al
5305: 8a1efc4a               mov      bl, byte ptr [0x4afc]
5309: 32ff                   xor      bh, bh
530b: bac403                 mov      dx, 0x3c4
530e: b80204                 mov      ax, 0x402
5311: ef                     out      dx, ax
5312: bace03                 mov      dx, 0x3ce
5315: b80308                 mov      ax, 0x803
5318: ef                     out      dx, ax
5319: a10a00                 mov      ax, word ptr [0xa]
531c: 8ec0                   mov      es, ax
531e: 881e0c4b               mov      byte ptr [0x4b0c], bl
5322: 8b8712c5               mov      ax, word ptr [bx - 0x3aee]
5326: 8bd0                   mov      dx, ax
5328: 8b8710c5               mov      ax, word ptr [bx - 0x3af0]
532c: 3ac4                   cmp      al, ah
532e: 7302                   jae      0x5332
5330: 8ac4                   mov      al, ah
5332: 3ac2                   cmp      al, dl
5334: 7302                   jae      0x5338
5336: 8ac2                   mov      al, dl
5338: 3ac6                   cmp      al, dh
533a: 7302                   jae      0x533e
533c: 8ac6                   mov      al, dh
533e: a20a4b                 mov      byte ptr [0x4b0a], al
5341: 3c40                   cmp      al, 0x40
5343: 7703                   ja       0x5348
5345: e99b00                 jmp      0x53e3
5348: e843ff                 call     0x528e
534b: a00a4b                 mov      al, byte ptr [0x4b0a]
534e: 32e4                   xor      ah, ah
5350: 8bf8                   mov      di, ax
5352: 8bf0                   mov      si, ax
5354: d1e7                   shl      di, 1
5356: 8bbd1048               mov      di, word ptr [di + 0x4810]
535a: 8ac3                   mov      al, bl
535c: 2c40                   sub      al, 0x40
535e: d0e8                   shr      al, 1
5360: d0e8                   shr      al, 1
5362: 0404                   add      al, 4
5364: 03f8                   add      di, ax
5366: 8a84d15f               mov      al, byte ptr [si + 0x5fd1]
536a: 240f                   and      al, 0xf
536c: a2db4a                 mov      byte ptr [0x4adb], al
536f: 7522                   jne      0x5393
5371: 8b8750c6               mov      ax, word ptr [bx - 0x39b0]
5375: 3a8710c5               cmp      al, byte ptr [bx - 0x3af0]
5379: 7216                   jb       0x5391
537b: 3aa711c5               cmp      ah, byte ptr [bx - 0x3aef]
537f: 7210                   jb       0x5391
5381: 8b8752c6               mov      ax, word ptr [bx - 0x39ae]
5385: 3a8712c5               cmp      al, byte ptr [bx - 0x3aee]
5389: 7206                   jb       0x5391
538b: 3aa713c5               cmp      ah, byte ptr [bx - 0x3aed]
538f: 7349                   jae      0x53da
5391: 32c0                   xor      al, al
5393: bb7a72                 mov      bx, 0x727a
5396: d7                     xlatb    
5397: 32ff                   xor      bh, bh
5399: 47                     inc      di
539a: eb30                   jmp      0x53cc
539c: 90                     nop      
539d: 32c0                   xor      al, al
539f: 268a25                 mov      ah, byte ptr es:[di]
53a2: aa                     stosb    byte ptr es:[di], al
53a3: 83ef29                 sub      di, 0x29
53a6: 4e                     dec      si
53a7: 8aa4d15f               mov      ah, byte ptr [si + 0x5fd1]
53ab: 22e4                   and      ah, ah
53ad: 74f0                   je       0x539f
53af: 7829                   js       0x53da
53b1: 3226db4a               xor      ah, byte ptr [0x4adb]
53b5: 8826db4a               mov      byte ptr [0x4adb], ah
53b9: 741f                   je       0x53da
53bb: 80fc0f                 cmp      ah, 0xf
53be: 74dd                   je       0x539d
53c0: 8ac4                   mov      al, ah
53c2: bb7a72                 mov      bx, 0x727a
53c5: d7                     xlatb    
53c6: 32ff                   xor      bh, bh
53c8: 268a25                 mov      ah, byte ptr es:[di]
53cb: aa                     stosb    byte ptr es:[di], al
53cc: 83ef29                 sub      di, 0x29
53cf: 4e                     dec      si
53d0: 8aa4d15f               mov      ah, byte ptr [si + 0x5fd1]
53d4: 22e4                   and      ah, ah
53d6: 74f0                   je       0x53c8
53d8: 79d7                   jns      0x53b1
53da: 32ff                   xor      bh, bh
53dc: 8a1e0c4b               mov      bl, byte ptr [0x4b0c]
53e0: e8abfe                 call     0x528e
53e3: a00c4b                 mov      al, byte ptr [0x4b0c]
53e6: 0404                   add      al, 4
53e8: 8ad8                   mov      bl, al
53ea: 3a06134b               cmp      al, byte ptr [0x4b13]
53ee: 7303                   jae      0x53f3
53f0: e92bff                 jmp      0x531e
53f3: b80300                 mov      ax, 3
53f6: bace03                 mov      dx, 0x3ce
53f9: ef                     out      dx, ax
53fa: 8cd8                   mov      ax, ds
53fc: 8ec0                   mov      es, ax
53fe: c3                     ret      
53ff: a06554                 mov      al, byte ptr [0x5465]
5402: 22c0                   and      al, al
5404: 7403                   je       0x5409
5406: e995f7                 jmp      0x4b9e
5409: bf3f00                 mov      di, 0x3f
540c: bb0100                 mov      bx, 1
540f: a1e64a                 mov      ax, word ptr [0x4ae6]
5412: f7d8                   neg      ax
5414: 7806                   js       0x541c
5416: b8ffff                 mov      ax, 0xffff
5419: eb08                   jmp      0x5423
541b: 90                     nop      
541c: 80fcff                 cmp      ah, 0xff
541f: 7402                   je       0x5423
5421: 33c0                   xor      ax, ax
5423: 8a263253               mov      ah, byte ptr [0x5332]
5427: 22e4                   and      ah, ah
5429: 8ae0                   mov      ah, al
542b: 782e                   js       0x545b
542d: 8ac4                   mov      al, ah
542f: 2a852d5a               sub      al, byte ptr [di + 0x5a2d]
5433: 7302                   jae      0x5437
5435: 32c0                   xor      al, al
5437: 3a8590c5               cmp      al, byte ptr [di - 0x3a70]
543b: 7304                   jae      0x5441
543d: 888590c5               mov      byte ptr [di - 0x3a70], al
5441: 8ac4                   mov      al, ah
5443: 02872d5a               add      al, byte ptr [bx + 0x5a2d]
5447: 7302                   jae      0x544b
5449: b0ff                   mov      al, 0xff
544b: 3a8550c5               cmp      al, byte ptr [di - 0x3ab0]
544f: 7304                   jae      0x5455
5451: 888550c5               mov      byte ptr [di - 0x3ab0], al
5455: fec3                   inc      bl
5457: 4f                     dec      di
5458: 79d3                   jns      0x542d
545a: c3                     ret      
545b: 8ac4                   mov      al, ah
545d: 02852d5a               add      al, byte ptr [di + 0x5a2d]
5461: 7302                   jae      0x5465
5463: b0ff                   mov      al, 0xff
5465: 3a8590c5               cmp      al, byte ptr [di - 0x3a70]
5469: 7304                   jae      0x546f
546b: 888590c5               mov      byte ptr [di - 0x3a70], al
546f: 8ac4                   mov      al, ah
5471: 2a872d5a               sub      al, byte ptr [bx + 0x5a2d]
5475: 7302                   jae      0x5479
5477: 32c0                   xor      al, al
5479: 3a8550c5               cmp      al, byte ptr [di - 0x3ab0]
547d: 7304                   jae      0x5483
547f: 888550c5               mov      byte ptr [di - 0x3ab0], al
5483: fec3                   inc      bl
5485: 4f                     dec      di
5486: 79d3                   jns      0x545b
5488: c3                     ret      
5489: bfb95e                 mov      di, 0x5eb9
548c: b8d4d4                 mov      ax, 0xd4d4
548f: b91000                 mov      cx, 0x10
5492: f3ab                   rep stosw word ptr es:[di], ax
5494: c3                     ret      
5495: a09b53                 mov      al, byte ptr [0x539b]
5498: 3c10                   cmp      al, 0x10
549a: 7202                   jb       0x549e
549c: b010                   mov      al, 0x10
549e: a25c54                 mov      byte ptr [0x545c], al
54a1: b30f                   mov      bl, 0xf
54a3: b008                   mov      al, 8
54a5: eb4c                   jmp      0x54f3
54a7: 90                     nop      
54a8: c3                     ret      
54a9: a01654                 mov      al, byte ptr [0x5416]
54ac: 22c0                   and      al, al
54ae: 7507                   jne      0x54b7
54b0: a0c04a                 mov      al, byte ptr [0x4ac0]
54b3: 22c0                   and      al, al
54b5: 74f1                   je       0x54a8
54b7: a0274b                 mov      al, byte ptr [0x4b27]
54ba: 22c0                   and      al, al
54bc: 78ea                   js       0x54a8
54be: a09b53                 mov      al, byte ptr [0x539b]
54c1: 3c01                   cmp      al, 1
54c3: 72e3                   jb       0x54a8
54c5: 3c32                   cmp      al, 0x32
54c7: 7202                   jb       0x54cb
54c9: b032                   mov      al, 0x32
54cb: a25c54                 mov      byte ptr [0x545c], al
54ce: bb1f00                 mov      bx, 0x1f
54d1: e824f7                 call     0x4bf8
54d4: 2407                   and      al, 7
54d6: 98                     cwde     
54d7: 8bf8                   mov      di, ax
54d9: a05c54                 mov      al, byte ptr [0x545c]
54dc: 3c08                   cmp      al, 8
54de: 7305                   jae      0x54e5
54e0: b008                   mov      al, 8
54e2: eb0f                   jmp      0x54f3
54e4: 90                     nop      
54e5: 83ff06                 cmp      di, 6
54e8: 7209                   jb       0x54f3
54ea: b00d                   mov      al, 0xd
54ec: 83ff07                 cmp      di, 7
54ef: 7502                   jne      0x54f3
54f1: b003                   mov      al, 3
54f3: 0402                   add      al, 2
54f5: a25c70                 mov      byte ptr [0x705c], al
54f8: 881ede4a               mov      byte ptr [0x4ade], bl
54fc: a0264b                 mov      al, byte ptr [0x4b26]
54ff: 22c0                   and      al, al
5501: 7502                   jne      0x5505
5503: eb84                   jmp      0x5489
5505: a10a00                 mov      ax, word ptr [0xa]
5508: 8ec0                   mov      es, ax
550a: e88100                 call     0x558e
550d: 7516                   jne      0x5525
550f: 8a87b95f               mov      al, byte ptr [bx + 0x5fb9]
5513: 0402                   add      al, 2
5515: 8887b95f               mov      byte ptr [bx + 0x5fb9], al
5519: 0087b95e               add      byte ptr [bx + 0x5eb9], al
551d: 8a87995f               mov      al, byte ptr [bx + 0x5f99]
5521: 00875d59               add      byte ptr [bx + 0x595d], al
5525: fecb                   dec      bl
5527: 79e1                   jns      0x550a
5529: 8a1ede4a               mov      bl, byte ptr [0x4ade]
552d: 8a87b95e               mov      al, byte ptr [bx + 0x5eb9]
5531: 3cb8                   cmp      al, 0xb8
5533: 7250                   jb       0x5585
5535: e8c0f6                 call     0x4bf8
5538: 2407                   and      al, 7
553a: 8a265c54               mov      ah, byte ptr [0x545c]
553e: d0ec                   shr      ah, 1
5540: d0ec                   shr      ah, 1
5542: 02c4                   add      al, ah
5544: f6d0                   not      al
5546: 8887b95f               mov      byte ptr [bx + 0x5fb9], al
554a: 8a26274b               mov      ah, byte ptr [0x4b27]
554e: 22e4                   and      ah, ah
5550: 7906                   jns      0x5558
5552: e8ecf5                 call     0x4b41
5555: eb1c                   jmp      0x5573
5557: 90                     nop      
5558: e89df6                 call     0x4bf8
555b: 243f                   and      al, 0x3f
555d: 0420                   add      al, 0x20
555f: 88875d59               mov      byte ptr [bx + 0x595d], al
5563: 98                     cwde     
5564: 8bf8                   mov      di, ax
5566: e88ff6                 call     0x4bf8
5569: 0cf8                   or       al, 0xf8
556b: 02859072               add      al, byte ptr [di + 0x7290]
556f: 8887b95e               mov      byte ptr [bx + 0x5eb9], al
5573: 8bc7                   mov      ax, di
5575: 2c40                   sub      al, 0x40
5577: 98                     cwde     
5578: d1f8                   sar      ax, 1
557a: d1f8                   sar      ax, 1
557c: d1f8                   sar      ax, 1
557e: 8887995f               mov      byte ptr [bx + 0x5f99], al
5582: e80900                 call     0x558e
5585: fecb                   dec      bl
5587: 79a4                   jns      0x552d
5589: 8cd8                   mov      ax, ds
558b: 8ec0                   mov      es, ax
558d: c3                     ret      
558e: 881e7c4b               mov      byte ptr [0x4b7c], bl
5592: 8bbfb95e               mov      di, word ptr [bx + 0x5eb9]
5596: 81e7ff00               and      di, 0xff
559a: 81ffb800               cmp      di, 0xb8
559e: 730d                   jae      0x55ad
55a0: 8a875d59               mov      al, byte ptr [bx + 0x595d]
55a4: 22c0                   and      al, al
55a6: 7805                   js       0x55ad
55a8: 83ff40                 cmp      di, 0x40
55ab: 7709                   ja       0x55b6
55ad: b0d2                   mov      al, 0xd2
55af: 8887b95e               mov      byte ptr [bx + 0x5eb9], al
55b3: 22c0                   and      al, al
55b5: c3                     ret      
55b6: 8a26274b               mov      ah, byte ptr [0x4b27]
55ba: 22e4                   and      ah, ah
55bc: 7906                   jns      0x55c4
55be: e8e2f4                 call     0x4aa3
55c1: eb43                   jmp      0x5606
55c3: 90                     nop      
55c4: 32e4                   xor      ah, ah
55c6: 8bd8                   mov      bx, ax
55c8: bac403                 mov      dx, 0x3c4
55cb: b80201                 mov      ax, 0x102
55ce: ef                     out      dx, ax
55cf: bace03                 mov      dx, 0x3ce
55d2: b80308                 mov      ax, 0x803
55d5: ef                     out      dx, ax
55d6: 8bc3                   mov      ax, bx
55d8: 247c                   and      al, 0x7c
55da: d1e8                   shr      ax, 1
55dc: d1e8                   shr      ax, 1
55de: 3c1e                   cmp      al, 0x1e
55e0: 7202                   jb       0x55e4
55e2: 2c02                   sub      al, 2
55e4: d1e7                   shl      di, 1
55e6: 8bbd1048               mov      di, word ptr [di + 0x4810]
55ea: 03f8                   add      di, ax
55ec: 83c704                 add      di, 4
55ef: 268a05                 mov      al, byte ptr es:[di]
55f2: 8a871063               mov      al, byte ptr [bx + 0x6310]
55f6: aa                     stosb    byte ptr es:[di], al
55f7: 83ef29                 sub      di, 0x29
55fa: 268a05                 mov      al, byte ptr es:[di]
55fd: 8a871063               mov      al, byte ptr [bx + 0x6310]
5601: aa                     stosb    byte ptr es:[di], al
5602: b80300                 mov      ax, 3
5605: ef                     out      dx, ax
5606: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
560a: 32c0                   xor      al, al
560c: c3                     ret      
560d: a06253                 mov      al, byte ptr [0x5362]
5610: 8a266553               mov      ah, byte ptr [0x5365]
5614: 22e4                   and      ah, ah
5616: 7902                   jns      0x561a
5618: f7d8                   neg      ax
561a: 88269b53               mov      byte ptr [0x539b], ah
561e: 8a1e264b               mov      bl, byte ptr [0x4b26]
5622: 22db                   and      bl, bl
5624: 7512                   jne      0x5638
5626: a01a4b                 mov      al, byte ptr [0x4b1a]
5629: 8ae0                   mov      ah, al
562b: d0e8                   shr      al, 1
562d: d0e8                   shr      al, 1
562f: d0e8                   shr      al, 1
5631: 2ae0                   sub      ah, al
5633: 88261a4b               mov      byte ptr [0x4b1a], ah
5637: c3                     ret      
5638: 80fc08                 cmp      ah, 8
563b: 730b                   jae      0x5648
563d: d1e0                   shl      ax, 1
563f: d1e0                   shl      ax, 1
5641: d1e0                   shl      ax, 1
5643: 88261a4b               mov      byte ptr [0x4b1a], ah
5647: c3                     ret      
5648: d1e0                   shl      ax, 1
564a: 80c430                 add      ah, 0x30
564d: 7302                   jae      0x5651
564f: b4ff                   mov      ah, 0xff
5651: 88261a4b               mov      byte ptr [0x4b1a], ah
5655: c3                     ret      
5656: 32ff                   xor      bh, bh
5658: 8a1e8054               mov      bl, byte ptr [0x5480]
565c: 881ee04a               mov      byte ptr [0x4ae0], bl
5660: e82cdb                 call     0x318f
5663: a19453                 mov      ax, word ptr [0x5394]
5666: 32265b4b               xor      ah, byte ptr [0x4b5b]
566a: 2a062e53               sub      al, byte ptr [0x532e]
566e: 1a263153               sbb      ah, byte ptr [0x5331]
5672: 33ff                   xor      di, di
5674: 8a16694b               mov      dl, byte ptr [0x4b69]
5678: 22d2                   and      dl, dl
567a: 790c                   jns      0x5688
567c: 47                     inc      di
567d: 8a16544b               mov      dl, byte ptr [0x4b54]
5681: 32165b4b               xor      dl, byte ptr [0x4b5b]
5685: 7901                   jns      0x5688
5687: 47                     inc      di
5688: 0285e071               add      al, byte ptr [di + 0x71e0]
568c: 12a5e371               adc      ah, byte ptr [di + 0x71e3]
5690: 88260d4b               mov      byte ptr [0x4b0d], ah
5694: 7902                   jns      0x5698
5696: f7d8                   neg      ax
5698: a3324b                 mov      word ptr [0x4b32], ax
569b: 80fc08                 cmp      ah, 8
569e: 7205                   jb       0x56a5
56a0: b47f                   mov      ah, 0x7f
56a2: eb09                   jmp      0x56ad
56a4: 90                     nop      
56a5: d1e0                   shl      ax, 1
56a7: d1e0                   shl      ax, 1
56a9: d1e0                   shl      ax, 1
56ab: d1e0                   shl      ax, 1
56ad: 88265c4b               mov      byte ptr [0x4b5c], ah
56b1: a0b754                 mov      al, byte ptr [0x54b7]
56b4: 22c0                   and      al, al
56b6: 7811                   js       0x56c9
56b8: a0774b                 mov      al, byte ptr [0x4b77]
56bb: 2a067254               sub      al, byte ptr [0x5472]
56bf: 3c02                   cmp      al, 2
56c1: 7306                   jae      0x56c9
56c3: e89420                 call     0x775a
56c6: e8c6da                 call     0x318f
56c9: a0544b                 mov      al, byte ptr [0x4b54]
56cc: 32065b4b               xor      al, byte ptr [0x4b5b]
56d0: a22e4b                 mov      byte ptr [0x4b2e], al
56d3: a07b4b                 mov      al, byte ptr [0x4b7b]
56d6: 22c0                   and      al, al
56d8: 7441                   je       0x571b
56da: 32060d4b               xor      al, byte ptr [0x4b0d]
56de: 8a26694b               mov      ah, byte ptr [0x4b69]
56e2: 22e4                   and      ah, ah
56e4: 7926                   jns      0x570c
56e6: 8a267b4b               mov      ah, byte ptr [0x4b7b]
56ea: 32262e4b               xor      ah, byte ptr [0x4b2e]
56ee: 780a                   js       0x56fa
56f0: 8a267e4b               mov      ah, byte ptr [0x4b7e]
56f4: 80c42d                 add      ah, 0x2d
56f7: eb17                   jmp      0x5710
56f9: 90                     nop      
56fa: 8a262e4b               mov      ah, byte ptr [0x4b2e]
56fe: 88267b4b               mov      byte ptr [0x4b7b], ah
5702: 8a267e4b               mov      ah, byte ptr [0x4b7e]
5706: 80ec23                 sub      ah, 0x23
5709: eb0d                   jmp      0x5718
570b: 90                     nop      
570c: 8a267e4b               mov      ah, byte ptr [0x4b7e]
5710: 22c0                   and      al, al
5712: 7804                   js       0x5718
5714: 02265c4b               add      ah, byte ptr [0x4b5c]
5718: eb7a                   jmp      0x5794
571a: 90                     nop      
571b: 33d2                   xor      dx, dx
571d: a0694b                 mov      al, byte ptr [0x4b69]
5720: 22c0                   and      al, al
5722: 790d                   jns      0x5731
5724: a02e4b                 mov      al, byte ptr [0x4b2e]
5727: a27b4b                 mov      byte ptr [0x4b7b], al
572a: 8a267e4b               mov      ah, byte ptr [0x4b7e]
572e: eb64                   jmp      0x5794
5730: 90                     nop      
5731: a1324b                 mov      ax, word ptr [0x4b32]
5734: 22e4                   and      ah, ah
5736: 7407                   je       0x573f
5738: 80ec1e                 sub      ah, 0x1e
573b: 7925                   jns      0x5762
573d: b0ff                   mov      al, 0xff
573f: 8a266553               mov      ah, byte ptr [0x5365]
5743: 22e4                   and      ah, ah
5745: 7902                   jns      0x5749
5747: f6dc                   neg      ah
5749: 80c40a                 add      ah, 0xa
574c: f6e4                   mul      ah
574e: d1f8                   sar      ax, 1
5750: d1f8                   sar      ax, 1
5752: d1f8                   sar      ax, 1
5754: d1f8                   sar      ax, 1
5756: d1f8                   sar      ax, 1
5758: d1f8                   sar      ax, 1
575a: d1f8                   sar      ax, 1
575c: 22c0                   and      al, al
575e: 7502                   jne      0x5762
5760: fec0                   inc      al
5762: 80260d4bff             and      byte ptr [0x4b0d], 0xff
5767: 7902                   jns      0x576b
5769: f7d8                   neg      ax
576b: 00062e53               add      byte ptr [0x532e], al
576f: 10263153               adc      byte ptr [0x5331], ah
5773: 8bc2                   mov      ax, dx
5775: 2a061953               sub      al, byte ptr [0x5319]
5779: 1a261f53               sbb      ah, byte ptr [0x531f]
577d: a22553                 mov      byte ptr [0x5325], al
5780: 88262b53               mov      byte ptr [0x532b], ah
5784: a0264b                 mov      al, byte ptr [0x4b26]
5787: 22c0                   and      al, al
5789: 7508                   jne      0x5793
578b: 32c0                   xor      al, al
578d: a22553                 mov      byte ptr [0x5325], al
5790: a22b53                 mov      byte ptr [0x532b], al
5793: c3                     ret      
5794: 8ad4                   mov      dl, ah
5796: 32f6                   xor      dh, dh
5798: a06253                 mov      al, byte ptr [0x5362]
579b: 8a266553               mov      ah, byte ptr [0x5365]
579f: f7ea                   imul     dx
57a1: 22c0                   and      al, al
57a3: 8ac4                   mov      al, ah
57a5: 8ae2                   mov      ah, dl
57a7: 7405                   je       0x57ae
57a9: 22f6                   and      dh, dh
57ab: 7901                   jns      0x57ae
57ad: 40                     inc      ax
57ae: 80267b4bff             and      byte ptr [0x4b7b], 0xff
57b3: 7902                   jns      0x57b7
57b5: f7d8                   neg      ax
57b7: d1f8                   sar      ax, 1
57b9: d1f8                   sar      ax, 1
57bb: d1f8                   sar      ax, 1
57bd: 8bd0                   mov      dx, ax
57bf: a0334b                 mov      al, byte ptr [0x4b33]
57c2: 3c1e                   cmp      al, 0x1e
57c4: 72ad                   jb       0x5773
57c6: e968ff                 jmp      0x5731
57c9: a10a00                 mov      ax, word ptr [0xa]
57cc: 8ec0                   mov      es, ax
57ce: bac403                 mov      dx, 0x3c4
57d1: b80203                 mov      ax, 0x302
57d4: ef                     out      dx, ax
57d5: b30c                   mov      bl, 0xc
57d7: bff200                 mov      di, 0xf2
57da: bee671                 mov      si, 0x71e6
57dd: b90a00                 mov      cx, 0xa
57e0: a5                     movsw    word ptr es:[di], word ptr [si]
57e1: a4                     movsb    byte ptr es:[di], byte ptr [si]
57e2: 83c725                 add      di, 0x25
57e5: e2f9                   loop     0x57e0
57e7: 81ef8d01               sub      di, 0x18d
57eb: fecb                   dec      bl
57ed: 75eb                   jne      0x57da
57ef: b30c                   mov      bl, 0xc
57f1: bf8216                 mov      di, 0x1682
57f4: be0472                 mov      si, 0x7204
57f7: b90a00                 mov      cx, 0xa
57fa: a5                     movsw    word ptr es:[di], word ptr [si]
57fb: a4                     movsb    byte ptr es:[di], byte ptr [si]
57fc: 83c725                 add      di, 0x25
57ff: e2f9                   loop     0x57fa
5801: 81ef8d01               sub      di, 0x18d
5805: fecb                   dec      bl
5807: 75eb                   jne      0x57f4
5809: bf8102                 mov      di, 0x281
580c: b30b                   mov      bl, 0xb
580e: bac403                 mov      dx, 0x3c4
5811: b90c00                 mov      cx, 0xc
5814: 80fb01                 cmp      bl, 1
5817: 7502                   jne      0x581b
5819: b108                   mov      cl, 8
581b: be2272                 mov      si, 0x7222
581e: b80203                 mov      ax, 0x302
5821: ef                     out      dx, ax
5822: a5                     movsw    word ptr es:[di], word ptr [si]
5823: b0ff                   mov      al, 0xff
5825: aa                     stosb    byte ptr es:[di], al
5826: 83ef02                 sub      di, 2
5829: b8020c                 mov      ax, 0xc02
582c: 80fb0b                 cmp      bl, 0xb
582f: 750b                   jne      0x583c
5831: b404                   mov      ah, 4
5833: ef                     out      dx, ax
5834: 33c0                   xor      ax, ax
5836: 268905                 mov      word ptr es:[di], ax
5839: b80208                 mov      ax, 0x802
583c: ef                     out      dx, ax
583d: b83fff                 mov      ax, 0xff3f
5840: ab                     stosw    word ptr es:[di], ax
5841: 83c725                 add      di, 0x25
5844: e2d8                   loop     0x581e
5846: fecb                   dec      bl
5848: 75c7                   jne      0x5811
584a: bfa402                 mov      di, 0x2a4
584d: b30b                   mov      bl, 0xb
584f: b90c00                 mov      cx, 0xc
5852: 80fb01                 cmp      bl, 1
5855: 7502                   jne      0x5859
5857: b108                   mov      cl, 8
5859: be3a72                 mov      si, 0x723a
585c: b80203                 mov      ax, 0x302
585f: ef                     out      dx, ax
5860: b0ff                   mov      al, 0xff
5862: aa                     stosb    byte ptr es:[di], al
5863: a5                     movsw    word ptr es:[di], word ptr [si]
5864: 83ef03                 sub      di, 3
5867: b8020c                 mov      ax, 0xc02
586a: 80fb0b                 cmp      bl, 0xb
586d: 750b                   jne      0x587a
586f: b404                   mov      ah, 4
5871: ef                     out      dx, ax
5872: 33c0                   xor      ax, ax
5874: 268905                 mov      word ptr es:[di], ax
5877: b80208                 mov      ax, 0x802
587a: ef                     out      dx, ax
587b: b8fffc                 mov      ax, 0xfcff
587e: ab                     stosw    word ptr es:[di], ax
587f: 83c726                 add      di, 0x26
5882: e2d8                   loop     0x585c
5884: fecb                   dec      bl
5886: 75c7                   jne      0x584f
5888: b80203                 mov      ax, 0x302
588b: ef                     out      dx, ax
588c: bff100                 mov      di, 0xf1
588f: be5272                 mov      si, 0x7252
5892: b90a00                 mov      cx, 0xa
5895: bb2700                 mov      bx, 0x27
5898: a4                     movsb    byte ptr es:[di], byte ptr [si]
5899: 03fb                   add      di, bx
589b: e2fb                   loop     0x5898
589d: bf8116                 mov      di, 0x1681
58a0: be5c72                 mov      si, 0x725c
58a3: b90a00                 mov      cx, 0xa
58a6: a4                     movsb    byte ptr es:[di], byte ptr [si]
58a7: 03fb                   add      di, bx
58a9: e2fb                   loop     0x58a6
58ab: bf1601                 mov      di, 0x116
58ae: be6672                 mov      si, 0x7266
58b1: b90a00                 mov      cx, 0xa
58b4: a4                     movsb    byte ptr es:[di], byte ptr [si]
58b5: 03fb                   add      di, bx
58b7: e2fb                   loop     0x58b4
58b9: bfa616                 mov      di, 0x16a6
58bc: be7072                 mov      si, 0x7270
58bf: b90a00                 mov      cx, 0xa
58c2: a4                     movsb    byte ptr es:[di], byte ptr [si]
58c3: 03fb                   add      di, bx
58c5: e2fb                   loop     0x58c2
58c7: b40f                   mov      ah, 0xf
58c9: ef                     out      dx, ax
58ca: 8cd8                   mov      ax, ds
58cc: 8ec0                   mov      es, ax
58ce: c3                     ret      
58cf: e885bf                 call     0x1857
58d2: a10a00                 mov      ax, word ptr [0xa]
58d5: 8ec0                   mov      es, ax
58d7: bac403                 mov      dx, 0x3c4
58da: b8020f                 mov      ax, 0xf02
58dd: ef                     out      dx, ax
58de: bf4a1a                 mov      di, 0x1a4a
58e1: b30f                   mov      bl, 0xf
58e3: 33c0                   xor      ax, ax
58e5: b90a00                 mov      cx, 0xa
58e8: f3ab                   rep stosw word ptr es:[di], ax
58ea: 83c714                 add      di, 0x14
58ed: fecb                   dec      bl
58ef: 75f4                   jne      0x58e5
58f1: 8cd8                   mov      ax, ds
58f3: 8ec0                   mov      es, ax
58f5: 8a1e8a56               mov      bl, byte ptr [0x568a]
58f9: 32ff                   xor      bh, bh
58fb: 8a87d871               mov      al, byte ptr [bx + 0x71d8]
58ff: a25942                 mov      byte ptr [0x4259], al
5902: c606bd0233             mov      byte ptr [0x2bd], 0x33
5907: b358                   mov      bl, 0x58
5909: e88abb                 call     0x1496
590c: 8a1e8a56               mov      bl, byte ptr [0x568a]
5910: b033                   mov      al, 0x33
5912: e852bf                 call     0x1867
5915: e810bd                 call     0x1628
5918: b80203                 mov      ax, 0x302
591b: bac403                 mov      dx, 0x3c4
591e: ef                     out      dx, ax
591f: bb0600                 mov      bx, 6
5922: 32ff                   xor      bh, bh
5924: 8bbfd071               mov      di, word ptr [bx + 0x71d0]
5928: b91400                 mov      cx, 0x14
592b: 53                     push     bx
592c: e85cbf                 call     0x188b
592f: 5b                     pop      bx
5930: 80eb02                 sub      bl, 2
5933: 79ef                   jns      0x5924
5935: b003                   mov      al, 3
5937: bfc91c                 mov      di, 0x1cc9
593a: b91300                 mov      cx, 0x13
593d: e86ebf                 call     0x18ae
5940: b0c0                   mov      al, 0xc0
5942: bfde1c                 mov      di, 0x1cde
5945: b91300                 mov      cx, 0x13
5948: e863bf                 call     0x18ae
594b: b8020f                 mov      ax, 0xf02
594e: bac403                 mov      dx, 0x3c4
5951: ef                     out      dx, ax
5952: c3                     ret      
5953: 0000                   add      byte ptr [bx + si], al
5955: 0000                   add      byte ptr [bx + si], al
5957: 0000                   add      byte ptr [bx + si], al
5959: 0000                   add      byte ptr [bx + si], al
595b: 0000                   add      byte ptr [bx + si], al
595d: 0000                   add      byte ptr [bx + si], al
595f: 0005                   add      byte ptr [di], al
5961: 2000                   and      byte ptr [bx + si], al
5963: 8beb                   mov      bp, bx
5965: 8aec                   mov      ch, ah
5967: d1e0                   shl      ax, 1
5969: 32e5                   xor      ah, ch
596b: 8acc                   mov      cl, ah
596d: 32e5                   xor      ah, ch
596f: 7911                   jns      0x5982
5971: d1e0                   shl      ax, 1
5973: f6dc                   neg      ah
5975: 750d                   jne      0x5984
5977: 8826154b               mov      byte ptr [0x4b15], ah
597b: a0d065                 mov      al, byte ptr [0x65d0]
597e: a2144b                 mov      byte ptr [0x4b14], al
5981: c3                     ret      
5982: d1e0                   shl      ax, 1
5984: 8adc                   mov      bl, ah
5986: 8a87d065               mov      al, byte ptr [bx + 0x65d0]
598a: a2154b                 mov      byte ptr [0x4b15], al
598d: f6db                   neg      bl
598f: 7404                   je       0x5995
5991: 8a9fd065               mov      bl, byte ptr [bx + 0x65d0]
5995: 881e144b               mov      byte ptr [0x4b14], bl
5999: 8bdd                   mov      bx, bp
599b: c3                     ret      
599c: 8bd0                   mov      dx, ax
599e: 8a87254c               mov      al, byte ptr [bx + 0x4c25]
59a2: 8aa74d4c               mov      ah, byte ptr [bx + 0x4c4d]
59a6: 23c0                   and      ax, ax
59a8: 9c                     pushf    
59a9: 7902                   jns      0x59ad
59ab: f7d8                   neg      ax
59ad: d1e8                   shr      ax, 1
59af: d1e8                   shr      ax, 1
59b1: f7ea                   imul     dx
59b3: 22c0                   and      al, al
59b5: 8ac4                   mov      al, ah
59b7: 8ae2                   mov      ah, dl
59b9: 7405                   je       0x59c0
59bb: 22f6                   and      dh, dh
59bd: 7901                   jns      0x59c0
59bf: 40                     inc      ax
59c0: 9d                     popf     
59c1: 7902                   jns      0x59c5
59c3: f7d8                   neg      ax
59c5: c3                     ret      
59c6: 32ff                   xor      bh, bh
59c8: 8aec                   mov      ch, ah
59ca: f6c440                 test     ah, 0x40
59cd: 7502                   jne      0x59d1
59cf: f7d0                   not      ax
59d1: d1e0                   shl      ax, 1
59d3: d1e0                   shl      ax, 1
59d5: 8adc                   mov      bl, ah
59d7: 80fbff                 cmp      bl, 0xff
59da: 7503                   jne      0x59df
59dc: 33c0                   xor      ax, ax
59de: c3                     ret      
59df: 8ac8                   mov      cl, al
59e1: 8b87d06d               mov      ax, word ptr [bx + 0x6dd0]
59e5: d0e0                   shl      al, 1
59e7: d0e4                   shl      ah, 1
59e9: d0e0                   shl      al, 1
59eb: d0e4                   shl      ah, 1
59ed: d0e0                   shl      al, 1
59ef: d0e4                   shl      ah, 1
59f1: d0e0                   shl      al, 1
59f3: d0e4                   shl      ah, 1
59f5: d0e0                   shl      al, 1
59f7: d0e4                   shl      ah, 1
59f9: 8ad0                   mov      dl, al
59fb: 2ac4                   sub      al, ah
59fd: 8aa7d065               mov      ah, byte ptr [bx + 0x65d0]
5a01: 8af4                   mov      dh, ah
5a03: 1aa7d165               sbb      ah, byte ptr [bx + 0x65d1]
5a07: d1e8                   shr      ax, 1
5a09: f6e1                   mul      cl
5a0b: d1ea                   shr      dx, 1
5a0d: 2ad4                   sub      dl, ah
5a0f: 1af7                   sbb      dh, bh
5a11: 8bc2                   mov      ax, dx
5a13: d1e8                   shr      ax, 1
5a15: d1e8                   shr      ax, 1
5a17: d1e8                   shr      ax, 1
5a19: d1e8                   shr      ax, 1
5a1b: 22ed                   and      ch, ch
5a1d: 7902                   jns      0x5a21
5a1f: f7d8                   neg      ax
5a21: c3                     ret      
5a22: 32ff                   xor      bh, bh
5a24: 8a87254c               mov      al, byte ptr [bx + 0x4c25]
5a28: 8aa74d4c               mov      ah, byte ptr [bx + 0x4c4d]
5a2c: 99                     cdq      
5a2d: d0ea                   shr      dl, 1
5a2f: d1d8                   rcr      ax, 1
5a31: 8bf0                   mov      si, ax
5a33: d0ea                   shr      dl, 1
5a35: d1d8                   rcr      ax, 1
5a37: d0ea                   shr      dl, 1
5a39: d1d8                   rcr      ax, 1
5a3b: 03c6                   add      ax, si
5a3d: d0ea                   shr      dl, 1
5a3f: d1d8                   rcr      ax, 1
5a41: 22ed                   and      ch, ch
5a43: 7902                   jns      0x5a47
5a45: f7d8                   neg      ax
5a47: c3                     ret      
5a48: 32ff                   xor      bh, bh
5a4a: a02e53                 mov      al, byte ptr [0x532e]
5a4d: 8a263153               mov      ah, byte ptr [0x5331]
5a51: e80cff                 call     0x5960
5a54: a0154b                 mov      al, byte ptr [0x4b15]
5a57: a2f64a                 mov      byte ptr [0x4af6], al
5a5a: a0144b                 mov      al, byte ptr [0x4b14]
5a5d: a2f54a                 mov      byte ptr [0x4af5], al
5a60: 880e2e4b               mov      byte ptr [0x4b2e], cl
5a64: 882e2f4b               mov      byte ptr [0x4b2f], ch
5a68: a02e53                 mov      al, byte ptr [0x532e]
5a6b: 8a263153               mov      ah, byte ptr [0x5331]
5a6f: 2b069453               sub      ax, word ptr [0x5394]
5a73: e8eafe                 call     0x5960
5a76: a0154b                 mov      al, byte ptr [0x4b15]
5a79: a20c4b                 mov      byte ptr [0x4b0c], al
5a7c: a0144b                 mov      al, byte ptr [0x4b14]
5a7f: a20e4b                 mov      byte ptr [0x4b0e], al
5a82: 880e0d4b               mov      byte ptr [0x4b0d], cl
5a86: 882e0f4b               mov      byte ptr [0x4b0f], ch
5a8a: a02d53                 mov      al, byte ptr [0x532d]
5a8d: 8a263053               mov      ah, byte ptr [0x5330]
5a91: e8ccfe                 call     0x5960
5a94: b306                   mov      bl, 6
5a96: 8a36144b               mov      dh, byte ptr [0x4b14]
5a9a: a0f54a                 mov      al, byte ptr [0x4af5]
5a9d: 8ae5                   mov      ah, ch
5a9f: 32262f4b               xor      ah, byte ptr [0x4b2f]
5aa3: e8aa01                 call     0x5c50
5aa6: b308                   mov      bl, 8
5aa8: a0f64a                 mov      al, byte ptr [0x4af6]
5aab: 8ae5                   mov      ah, ch
5aad: 32262e4b               xor      ah, byte ptr [0x4b2e]
5ab1: e89c01                 call     0x5c50
5ab4: b31a                   mov      bl, 0x1a
5ab6: a00e4b                 mov      al, byte ptr [0x4b0e]
5ab9: 8ae5                   mov      ah, ch
5abb: 32260f4b               xor      ah, byte ptr [0x4b0f]
5abf: e88e01                 call     0x5c50
5ac2: b31c                   mov      bl, 0x1c
5ac4: a00c4b                 mov      al, byte ptr [0x4b0c]
5ac7: 8ae5                   mov      ah, ch
5ac9: 32260d4b               xor      ah, byte ptr [0x4b0d]
5acd: e88001                 call     0x5c50
5ad0: b302                   mov      bl, 2
5ad2: 8a36154b               mov      dh, byte ptr [0x4b15]
5ad6: a0f54a                 mov      al, byte ptr [0x4af5]
5ad9: 8ae1                   mov      ah, cl
5adb: 32262f4b               xor      ah, byte ptr [0x4b2f]
5adf: e86e01                 call     0x5c50
5ae2: e8a301                 call     0x5c88
5ae5: b303                   mov      bl, 3
5ae7: a0f64a                 mov      al, byte ptr [0x4af6]
5aea: 8ae1                   mov      ah, cl
5aec: 32262e4b               xor      ah, byte ptr [0x4b2e]
5af0: e85d01                 call     0x5c50
5af3: e89201                 call     0x5c88
5af6: b322                   mov      bl, 0x22
5af8: a00e4b                 mov      al, byte ptr [0x4b0e]
5afb: 8ae1                   mov      ah, cl
5afd: 32260f4b               xor      ah, byte ptr [0x4b0f]
5b01: e84c01                 call     0x5c50
5b04: e88101                 call     0x5c88
5b07: b323                   mov      bl, 0x23
5b09: a00c4b                 mov      al, byte ptr [0x4b0c]
5b0c: 8ae1                   mov      ah, cl
5b0e: 32260d4b               xor      ah, byte ptr [0x4b0d]
5b12: e83b01                 call     0x5c50
5b15: e87001                 call     0x5c88
5b18: b304                   mov      bl, 4
5b1a: a0144b                 mov      al, byte ptr [0x4b14]
5b1d: 8ae5                   mov      ah, ch
5b1f: e85201                 call     0x5c74
5b22: e86301                 call     0x5c88
5b25: b31e                   mov      bl, 0x1e
5b27: a00c4b                 mov      al, byte ptr [0x4b0c]
5b2a: 8a260d4b               mov      ah, byte ptr [0x4b0d]
5b2e: e84301                 call     0x5c74
5b31: b320                   mov      bl, 0x20
5b33: a00e4b                 mov      al, byte ptr [0x4b0e]
5b36: 8a260f4b               mov      ah, byte ptr [0x4b0f]
5b3a: e83701                 call     0x5c74
5b3d: c6065d4c04             mov      byte ptr [0x4c5d], 4
5b42: c606354c00             mov      byte ptr [0x4c35], 0
5b47: b30a                   mov      bl, 0xa
5b49: a0f54a                 mov      al, byte ptr [0x4af5]
5b4c: 8a262f4b               mov      ah, byte ptr [0x4b2f]
5b50: e82101                 call     0x5c74
5b53: b30c                   mov      bl, 0xc
5b55: a0f64a                 mov      al, byte ptr [0x4af6]
5b58: 8a262e4b               mov      ah, byte ptr [0x4b2e]
5b5c: e81501                 call     0x5c74
5b5f: b30e                   mov      bl, 0xe
5b61: a0154b                 mov      al, byte ptr [0x4b15]
5b64: 8ae1                   mov      ah, cl
5b66: e80b01                 call     0x5c74
5b69: bf0600                 mov      di, 6
5b6c: 8bef                   mov      bp, di
5b6e: 8a85254c               mov      al, byte ptr [di + 0x4c25]
5b72: 8aa54d4c               mov      ah, byte ptr [di + 0x4c4d]
5b76: 8aec                   mov      ch, ah
5b78: d1e0                   shl      ax, 1
5b7a: 8adc                   mov      bl, ah
5b7c: 32e4                   xor      ah, ah
5b7e: d0e8                   shr      al, 1
5b80: 8bf8                   mov      di, ax
5b82: 8a852d5a               mov      al, byte ptr [di + 0x5a2d]
5b86: 02871c54               add      al, byte ptr [bx + 0x541c]
5b8a: 12a72854               adc      ah, byte ptr [bx + 0x5428]
5b8e: d1e8                   shr      ax, 1
5b90: 8bd0                   mov      dx, ax
5b92: 8a85ad59               mov      al, byte ptr [di + 0x59ad]
5b96: 02873454               add      al, byte ptr [bx + 0x5434]
5b9a: 9c                     pushf    
5b9b: 3480                   xor      al, 0x80
5b9d: 98                     cwde     
5b9e: 9d                     popf     
5b9f: 12a74054               adc      ah, byte ptr [bx + 0x5440]
5ba3: 22ed                   and      ch, ch
5ba5: 7902                   jns      0x5ba9
5ba7: f7d8                   neg      ax
5ba9: 8bfd                   mov      di, bp
5bab: 8885264c               mov      byte ptr [di + 0x4c26], al
5baf: 88a54e4c               mov      byte ptr [di + 0x4c4e], ah
5bb3: 8ac5                   mov      al, ch
5bb5: 32063253               xor      al, byte ptr [0x5332]
5bb9: 7902                   jns      0x5bbd
5bbb: f7da                   neg      dx
5bbd: 8895254c               mov      byte ptr [di + 0x4c25], dl
5bc1: 88b54d4c               mov      byte ptr [di + 0x4c4d], dh
5bc5: 83c702                 add      di, 2
5bc8: 83ff12                 cmp      di, 0x12
5bcb: 729f                   jb       0x5b6c
5bcd: 7503                   jne      0x5bd2
5bcf: bf1a00                 mov      di, 0x1a
5bd2: 83ff22                 cmp      di, 0x22
5bd5: 7295                   jb       0x5b6c
5bd7: a0314c                 mov      al, byte ptr [0x4c31]
5bda: 2a062c4c               sub      al, byte ptr [0x4c2c]
5bde: a2394c                 mov      byte ptr [0x4c39], al
5be1: a0594c                 mov      al, byte ptr [0x4c59]
5be4: 1a06544c               sbb      al, byte ptr [0x4c54]
5be8: a2614c                 mov      byte ptr [0x4c61], al
5beb: a02e4c                 mov      al, byte ptr [0x4c2e]
5bee: 8a26564c               mov      ah, byte ptr [0x4c56]
5bf2: f7d8                   neg      ax
5bf4: 2a062f4c               sub      al, byte ptr [0x4c2f]
5bf8: a23a4c                 mov      byte ptr [0x4c3a], al
5bfb: 1a26574c               sbb      ah, byte ptr [0x4c57]
5bff: 8826624c               mov      byte ptr [0x4c62], ah
5c03: a0324c                 mov      al, byte ptr [0x4c32]
5c06: 02062b4c               add      al, byte ptr [0x4c2b]
5c0a: a23b4c                 mov      byte ptr [0x4c3b], al
5c0d: 8a265a4c               mov      ah, byte ptr [0x4c5a]
5c11: 1226534c               adc      ah, byte ptr [0x4c53]
5c15: 8826634c               mov      byte ptr [0x4c63], ah
5c19: a02d4c                 mov      al, byte ptr [0x4c2d]
5c1c: 2a06304c               sub      al, byte ptr [0x4c30]
5c20: a23c4c                 mov      byte ptr [0x4c3c], al
5c23: 8a26554c               mov      ah, byte ptr [0x4c55]
5c27: 1a26584c               sbb      ah, byte ptr [0x4c58]
5c2b: 8826644c               mov      byte ptr [0x4c64], ah
5c2f: a0334c                 mov      al, byte ptr [0x4c33]
5c32: 8a265b4c               mov      ah, byte ptr [0x4c5b]
5c36: f7d8                   neg      ax
5c38: a23d4c                 mov      byte ptr [0x4c3d], al
5c3b: 8826654c               mov      byte ptr [0x4c65], ah
5c3f: a0354c                 mov      al, byte ptr [0x4c35]
5c42: 8a265d4c               mov      ah, byte ptr [0x4c5d]
5c46: f7d8                   neg      ax
5c48: a2374c                 mov      byte ptr [0x4c37], al
5c4b: 88265f4c               mov      byte ptr [0x4c5f], ah
5c4f: c3                     ret      
5c50: 9c                     pushf    
5c51: f6e6                   mul      dh
5c53: 32d2                   xor      dl, dl
5c55: d1e0                   shl      ax, 1
5c57: d0d2                   rcl      dl, 1
5c59: d1e0                   shl      ax, 1
5c5b: d0d2                   rcl      dl, 1
5c5d: d0e0                   shl      al, 1
5c5f: 12e7                   adc      ah, bh
5c61: 7302                   jae      0x5c65
5c63: fec2                   inc      dl
5c65: 88a7254c               mov      byte ptr [bx + 0x4c25], ah
5c69: 9d                     popf     
5c6a: 7903                   jns      0x5c6f
5c6c: 80ca80                 or       dl, 0x80
5c6f: 88974d4c               mov      byte ptr [bx + 0x4c4d], dl
5c73: c3                     ret      
5c74: 80e480                 and      ah, 0x80
5c77: d0ec                   shr      ah, 1
5c79: d0ec                   shr      ah, 1
5c7b: d1e0                   shl      ax, 1
5c7d: d1e0                   shl      ax, 1
5c7f: 8887254c               mov      byte ptr [bx + 0x4c25], al
5c83: 88a74d4c               mov      byte ptr [bx + 0x4c4d], ah
5c87: c3                     ret      
5c88: 8aa74d4c               mov      ah, byte ptr [bx + 0x4c4d]
5c8c: 22e4                   and      ah, ah
5c8e: 7913                   jns      0x5ca3
5c90: 8a87254c               mov      al, byte ptr [bx + 0x4c25]
5c94: bd0080                 mov      bp, 0x8000
5c97: 2be8                   sub      bp, ax
5c99: 8bc5                   mov      ax, bp
5c9b: 8887254c               mov      byte ptr [bx + 0x4c25], al
5c9f: 88a74d4c               mov      byte ptr [bx + 0x4c4d], ah
5ca3: c3                     ret      
5ca4: bf0200                 mov      di, 2
5ca7: 32ff                   xor      bh, bh
5ca9: a01553                 mov      al, byte ptr [0x5315]
5cac: 8a261b53               mov      ah, byte ptr [0x531b]
5cb0: 8a9d9070               mov      bl, byte ptr [di + 0x7090]
5cb4: e8e5fc                 call     0x599c
5cb7: a30c4b                 mov      word ptr [0x4b0c], ax
5cba: a01653                 mov      al, byte ptr [0x5316]
5cbd: 8a261c53               mov      ah, byte ptr [0x531c]
5cc1: 8a9d9370               mov      bl, byte ptr [di + 0x7093]
5cc5: e8d4fc                 call     0x599c
5cc8: 01060c4b               add      word ptr [0x4b0c], ax
5ccc: a01753                 mov      al, byte ptr [0x5317]
5ccf: 8a261d53               mov      ah, byte ptr [0x531d]
5cd3: 8a9d9670               mov      bl, byte ptr [di + 0x7096]
5cd7: e8c2fc                 call     0x599c
5cda: 03060c4b               add      ax, word ptr [0x4b0c]
5cde: 88856053               mov      byte ptr [di + 0x5360], al
5ce2: 88a56353               mov      byte ptr [di + 0x5363], ah
5ce6: 83ef02                 sub      di, 2
5ce9: 79be                   jns      0x5ca9
5ceb: c3                     ret      
5cec: 32ff                   xor      bh, bh
5cee: b580                   mov      ch, 0x80
5cf0: b30f                   mov      bl, 0xf
5cf2: e82dfd                 call     0x5a22
5cf5: a24953                 mov      byte ptr [0x5349], al
5cf8: 88264c53               mov      byte ptr [0x534c], ah
5cfc: b304                   mov      bl, 4
5cfe: e821fd                 call     0x5a22
5d01: a24a53                 mov      byte ptr [0x534a], al
5d04: 88264d53               mov      byte ptr [0x534d], ah
5d08: b30e                   mov      bl, 0xe
5d0a: e815fd                 call     0x5a22
5d0d: f7d8                   neg      ax
5d0f: a24853                 mov      byte ptr [0x5348], al
5d12: 88264b53               mov      byte ptr [0x534b], ah
5d16: c3                     ret      
5d17: bf0200                 mov      di, 2
5d1a: 32ff                   xor      bh, bh
5d1c: a06653                 mov      al, byte ptr [0x5366]
5d1f: 8a266953               mov      ah, byte ptr [0x5369]
5d23: 8a9d9970               mov      bl, byte ptr [di + 0x7099]
5d27: e872fc                 call     0x599c
5d2a: a30c4b                 mov      word ptr [0x4b0c], ax
5d2d: a06753                 mov      al, byte ptr [0x5367]
5d30: 8a266a53               mov      ah, byte ptr [0x536a]
5d34: 8a9d9c70               mov      bl, byte ptr [di + 0x709c]
5d38: e861fc                 call     0x599c
5d3b: 01060c4b               add      word ptr [0x4b0c], ax
5d3f: a06853                 mov      al, byte ptr [0x5368]
5d42: 8a266b53               mov      ah, byte ptr [0x536b]
5d46: 8a9d9f70               mov      bl, byte ptr [di + 0x709f]
5d4a: e84ffc                 call     0x599c
5d4d: 03060c4b               add      ax, word ptr [0x4b0c]
5d51: 88852153               mov      byte ptr [di + 0x5321], al
5d55: 88a52753               mov      byte ptr [di + 0x5327], ah
5d59: 4f                     dec      di
5d5a: 79c0                   jns      0x5d1c
5d5c: c3                     ret      
5d5d: bf0100                 mov      di, 1
5d60: 32ff                   xor      bh, bh
5d62: a01853                 mov      al, byte ptr [0x5318]
5d65: 8a261e53               mov      ah, byte ptr [0x531e]
5d69: 8a9da270               mov      bl, byte ptr [di + 0x70a2]
5d6d: e82cfc                 call     0x599c
5d70: a30c4b                 mov      word ptr [0x4b0c], ax
5d73: a01953                 mov      al, byte ptr [0x5319]
5d76: 8a261f53               mov      ah, byte ptr [0x531f]
5d7a: 8a9da470               mov      bl, byte ptr [di + 0x70a4]
5d7e: e81bfc                 call     0x599c
5d81: 03060c4b               add      ax, word ptr [0x4b0c]
5d85: 88857653               mov      byte ptr [di + 0x5376], al
5d89: 88a57953               mov      byte ptr [di + 0x5379], ah
5d8d: 4f                     dec      di
5d8e: 79d2                   jns      0x5d62
5d90: a07753                 mov      al, byte ptr [0x5377]
5d93: 8a267a53               mov      ah, byte ptr [0x537a]
5d97: b304                   mov      bl, 4
5d99: e800fc                 call     0x599c
5d9c: 02061a53               add      al, byte ptr [0x531a]
5da0: a27853                 mov      byte ptr [0x5378], al
5da3: 12262053               adc      ah, byte ptr [0x5320]
5da7: 88267b53               mov      byte ptr [0x537b], ah
5dab: c3                     ret      
5dac: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
5db0: 32ff                   xor      bh, bh
5db2: bf0200                 mov      di, 2
5db5: 80f301                 xor      bl, 1
5db8: 8a878d57               mov      al, byte ptr [bx + 0x578d]
5dbc: 8aa72558               mov      ah, byte ptr [bx + 0x5825]
5dc0: 2d8000                 sub      ax, 0x80
5dc3: 7902                   jns      0x5dc7
5dc5: f7d8                   neg      ax
5dc7: 2d5000                 sub      ax, 0x50
5dca: 720c                   jb       0x5dd8
5dcc: d1e8                   shr      ax, 1
5dce: d1e8                   shr      ax, 1
5dd0: 0087d957               add      byte ptr [bx + 0x57d9], al
5dd4: 10a77158               adc      byte ptr [bx + 0x5871], ah
5dd8: 4f                     dec      di
5dd9: 75da                   jne      0x5db5
5ddb: c3                     ret      
5ddc: 8b3e2700               mov      di, word ptr [0x27]
5de0: d1e0                   shl      ax, 1
5de2: d1e0                   shl      ax, 1
5de4: f7ef                   imul     di
5de6: 22c0                   and      al, al
5de8: 8ac4                   mov      al, ah
5dea: 8ae2                   mov      ah, dl
5dec: 7405                   je       0x5df3
5dee: 22f6                   and      dh, dh
5df0: 7901                   jns      0x5df3
5df2: 40                     inc      ax
5df3: 03c1                   add      ax, cx
5df5: c3                     ret      
5df6: 22db                   and      bl, bl
5df8: 7406                   je       0x5e00
5dfa: a1f95f                 mov      ax, word ptr [0x5ff9]
5dfd: eb04                   jmp      0x5e03
5dff: 90                     nop      
5e00: a17154                 mov      ax, word ptr [0x5471]
5e03: 22e4                   and      ah, ah
5e05: 7512                   jne      0x5e19
5e07: f6d0                   not      al
5e09: 8a262400               mov      ah, byte ptr [0x24]
5e0d: f6e4                   mul      ah
5e0f: 80fc0a                 cmp      ah, 0xa
5e12: 7202                   jb       0x5e16
5e14: 0406                   add      al, 6
5e16: e8d9bf                 call     0x1df2
5e19: c3                     ret      
5e1a: 0000                   add      byte ptr [bx + si], al
5e1c: 0000                   add      byte ptr [bx + si], al
5e1e: 0000                   add      byte ptr [bx + si], al
5e20: 32ff                   xor      bh, bh
5e22: 8a1e8056               mov      bl, byte ptr [0x5680]
5e26: 32e4                   xor      ah, ah
5e28: 88261454               mov      byte ptr [0x5414], ah
5e2c: a0674b                 mov      al, byte ptr [0x4b67]
5e2f: a2de4a                 mov      byte ptr [0x4ade], al
5e32: 2a06dd4a               sub      al, byte ptr [0x4add]
5e36: 7304                   jae      0x5e3c
5e38: f6d8                   neg      al
5e3a: fecc                   dec      ah
5e3c: a30c4b                 mov      word ptr [0x4b0c], ax
5e3f: 8bd0                   mov      dx, ax
5e41: a1ee4a                 mov      ax, word ptr [0x4aee]
5e44: 22e4                   and      ah, ah
5e46: 7403                   je       0x5e4b
5e48: e98700                 jmp      0x5ed2
5e4b: 3c40                   cmp      al, 0x40
5e4d: 7310                   jae      0x5e5f
5e4f: 80267654ff             and      byte ptr [0x5476], 0xff
5e54: 7805                   js       0x5e5b
5e56: 80fa32                 cmp      dl, 0x32
5e59: 7304                   jae      0x5e5f
5e5b: fe0e1454               dec      byte ptr [0x5414]
5e5f: 3c10                   cmp      al, 0x10
5e61: 7313                   jae      0x5e76
5e63: 80fa32                 cmp      dl, 0x32
5e66: 730e                   jae      0x5e76
5e68: 813e6e4b8001           cmp      word ptr [0x4b6e], 0x180
5e6e: 7306                   jae      0x5e76
5e70: e84803                 call     0x61bb
5e73: eb0f                   jmp      0x5e84
5e75: 90                     nop      
5e76: 32e4                   xor      ah, ah
5e78: 88267554               mov      byte ptr [0x5475], ah
5e7c: 88261ac0               mov      byte ptr [0xc01a], ah
5e80: 3c18                   cmp      al, 0x18
5e82: 731c                   jae      0x5ea0
5e84: 8a87b06f               mov      al, byte ptr [bx + 0x6fb0]
5e88: 2408                   and      al, 8
5e8a: 740e                   je       0x5e9a
5e8c: a07654                 mov      al, byte ptr [0x5476]
5e8f: 22c0                   and      al, al
5e91: 7807                   js       0x5e9a
5e93: a0ee4a                 mov      al, byte ptr [0x4aee]
5e96: 3c0e                   cmp      al, 0xe
5e98: 7338                   jae      0x5ed2
5e9a: e8b200                 call     0x5f4f
5e9d: eb71                   jmp      0x5f10
5e9f: 90                     nop      
5ea0: 8a267654               mov      ah, byte ptr [0x5476]
5ea4: 22e4                   and      ah, ah
5ea6: 7824                   js       0x5ecc
5ea8: 3c32                   cmp      al, 0x32
5eaa: 730e                   jae      0x5eba
5eac: 8a87b06f               mov      al, byte ptr [bx + 0x6fb0]
5eb0: 2402                   and      al, 2
5eb2: 7412                   je       0x5ec6
5eb4: e8c700                 call     0x5f7e
5eb7: eb31                   jmp      0x5eea
5eb9: 90                     nop      
5eba: 3cc8                   cmp      al, 0xc8
5ebc: 7314                   jae      0x5ed2
5ebe: 8a87b06f               mov      al, byte ptr [bx + 0x6fb0]
5ec2: 2420                   and      al, 0x20
5ec4: 740c                   je       0x5ed2
5ec6: e89300                 call     0x5f5c
5ec9: eb1f                   jmp      0x5eea
5ecb: 90                     nop      
5ecc: e88d00                 call     0x5f5c
5ecf: eb3f                   jmp      0x5f10
5ed1: 90                     nop      
5ed2: b440                   mov      ah, 0x40
5ed4: 8a87b06f               mov      al, byte ptr [bx + 0x6fb0]
5ed8: 2408                   and      al, 8
5eda: 7402                   je       0x5ede
5edc: b46e                   mov      ah, 0x6e
5ede: 8ac3                   mov      al, bl
5ee0: 2401                   and      al, 1
5ee2: 7402                   je       0x5ee6
5ee4: f6d4                   not      ah
5ee6: 8826de4a               mov      byte ptr [0x4ade], ah
5eea: b90200                 mov      cx, 2
5eed: 8a1e8154               mov      bl, byte ptr [0x5481]
5ef1: 881ee04a               mov      byte ptr [0x4ae0], bl
5ef5: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
5ef9: 240f                   and      al, 0xf
5efb: 98                     cwde     
5efc: 8bf8                   mov      di, ax
5efe: 8a8540b2               mov      al, byte ptr [di - 0x4dc0]
5f02: 22c0                   and      al, al
5f04: 7905                   jns      0x5f0b
5f06: c606de4a80             mov      byte ptr [0x4ade], 0x80
5f0b: e84c18                 call     0x775a
5f0e: e2e5                   loop     0x5ef5
5f10: a06354                 mov      al, byte ptr [0x5463]
5f13: 22c0                   and      al, al
5f15: 780d                   js       0x5f24
5f17: 7517                   jne      0x5f30
5f19: a0de4a                 mov      al, byte ptr [0x4ade]
5f1c: 2a06674b               sub      al, byte ptr [0x4b67]
5f20: 742c                   je       0x5f4e
5f22: 770c                   ja       0x5f30
5f24: 3cf0                   cmp      al, 0xf0
5f26: 7326                   jae      0x5f4e
5f28: a02900                 mov      al, byte ptr [0x29]
5f2b: f6d8                   neg      al
5f2d: eb08                   jmp      0x5f37
5f2f: 90                     nop      
5f30: 3c10                   cmp      al, 0x10
5f32: 721a                   jb       0x5f4e
5f34: a02900                 mov      al, byte ptr [0x29]
5f37: 0206674b               add      al, byte ptr [0x4b67]
5f3b: 8a267f4b               mov      ah, byte ptr [0x4b7f]
5f3f: 22e4                   and      ah, ah
5f41: 740b                   je       0x5f4e
5f43: 3cff                   cmp      al, 0xff
5f45: 7307                   jae      0x5f4e
5f47: 3c20                   cmp      al, 0x20
5f49: 7203                   jb       0x5f4e
5f4b: a2674b                 mov      byte ptr [0x4b67], al
5f4e: c3                     ret      
5f4f: a10c4b                 mov      ax, word ptr [0x4b0c]
5f52: 3c38                   cmp      al, 0x38
5f54: 7327                   jae      0x5f7d
5f56: 22e4                   and      ah, ah
5f58: 781e                   js       0x5f78
5f5a: 7912                   jns      0x5f6e
5f5c: a10c4b                 mov      ax, word ptr [0x4b0c]
5f5f: 3c38                   cmp      al, 0x38
5f61: 731a                   jae      0x5f7d
5f63: a0dd4a                 mov      al, byte ptr [0x4add]
5f66: 22e4                   and      ah, ah
5f68: 780a                   js       0x5f74
5f6a: 3ca0                   cmp      al, 0xa0
5f6c: 730a                   jae      0x5f78
5f6e: c606de4ae0             mov      byte ptr [0x4ade], 0xe0
5f73: c3                     ret      
5f74: 3c60                   cmp      al, 0x60
5f76: 72f6                   jb       0x5f6e
5f78: c606de4a20             mov      byte ptr [0x4ade], 0x20
5f7d: c3                     ret      
5f7e: a0dd4a                 mov      al, byte ptr [0x4add]
5f81: a2de4a                 mov      byte ptr [0x4ade], al
5f84: c3                     ret      
5f85: b8ffff                 mov      ax, 0xffff
5f88: b98000                 mov      cx, 0x80
5f8b: bfb95d                 mov      di, 0x5db9
5f8e: f3ab                   rep stosw word ptr es:[di], ax
5f90: bffb5a                 mov      di, 0x5afb
5f93: 32e4                   xor      ah, ah
5f95: 8adc                   mov      bl, ah
5f97: 8a05                   mov      al, byte ptr [di]
5f99: 8bf0                   mov      si, ax
5f9b: 889cb95d               mov      byte ptr [si + 0x5db9], bl
5f9f: 47                     inc      di
5fa0: fec3                   inc      bl
5fa2: 3a1e7156               cmp      bl, byte ptr [0x5671]
5fa6: 75ef                   jne      0x5f97
5fa8: c3                     ret      
5fa9: a08954                 mov      al, byte ptr [0x5489]
5fac: 22c0                   and      al, al
5fae: 7465                   je       0x6015
5fb0: 8a1e8154               mov      bl, byte ptr [0x5481]
5fb4: 32ff                   xor      bh, bh
5fb6: e8d6d1                 call     0x318f
5fb9: e87803                 call     0x6334
5fbc: e844ce                 call     0x2e03
5fbf: e87a01                 call     0x613c
5fc2: e89501                 call     0x615a
5fc5: e8c200                 call     0x608a
5fc8: a18b4b                 mov      ax, word ptr [0x4b8b]
5fcb: 8a0e764b               mov      cl, byte ptr [0x4b76]
5fcf: 32ed                   xor      ch, ch
5fd1: f7e1                   mul      cx
5fd3: 8ac4                   mov      al, ah
5fd5: 8ae2                   mov      ah, dl
5fd7: e88bdc                 call     0x3c65
5fda: 99                     cdq      
5fdb: d1e0                   shl      ax, 1
5fdd: d0d2                   rcl      dl, 1
5fdf: d1e0                   shl      ax, 1
5fe1: d0d2                   rcl      dl, 1
5fe3: d1e0                   shl      ax, 1
5fe5: d0d2                   rcl      dl, 1
5fe7: 0006584b               add      byte ptr [0x4b58], al
5feb: 1026f95f               adc      byte ptr [0x5ff9], ah
5fef: 1016fa5f               adc      byte ptr [0x5ffa], dl
5ff3: a0fa5f                 mov      al, byte ptr [0x5ffa]
5ff6: 3a06774b               cmp      al, byte ptr [0x4b77]
5ffa: 7219                   jb       0x6015
5ffc: 2a06774b               sub      al, byte ptr [0x4b77]
6000: a2fa5f                 mov      byte ptr [0x5ffa], al
6003: 8a1e8154               mov      bl, byte ptr [0x5481]
6007: fec3                   inc      bl
6009: 3a1e7156               cmp      bl, byte ptr [0x5671]
600d: 7202                   jb       0x6011
600f: 32db                   xor      bl, bl
6011: 881e8154               mov      byte ptr [0x5481], bl
6015: c3                     ret      
6016: e89eab                 call     0xbb7
6019: e8dceb                 call     0x4bf8
601c: 247f                   and      al, 0x7f
601e: 0468                   add      al, 0x68
6020: 8ad0                   mov      dl, al
6022: 32f6                   xor      dh, dh
6024: bb0300                 mov      bx, 3
6027: 8a879d4c               mov      al, byte ptr [bx + 0x4c9d]
602b: 8aa7a14c               mov      ah, byte ptr [bx + 0x4ca1]
602f: 03c2                   add      ax, dx
6031: 88877d4c               mov      byte ptr [bx + 0x4c7d], al
6035: 88a7814c               mov      byte ptr [bx + 0x4c81], ah
6039: fecb                   dec      bl
603b: 79ea                   jns      0x6027
603d: c3                     ret      
603e: a0aadd                 mov      al, byte ptr [0xddaa]
6041: 22c0                   and      al, al
6043: 7407                   je       0x604c
6045: a08c56                 mov      al, byte ptr [0x568c]
6048: 22c0                   and      al, al
604a: 753d                   jne      0x6089
604c: b90001                 mov      cx, 0x100
604f: e8a6eb                 call     0x4bf8
6052: e2fb                   loop     0x604f
6054: a02756                 mov      al, byte ptr [0x5627]
6057: 22c0                   and      al, al
6059: 8a1e8a56               mov      bl, byte ptr [0x568a]
605d: a08156                 mov      al, byte ptr [0x5681]
6060: 7406                   je       0x6068
6062: 80c320                 add      bl, 0x20
6065: a08256                 mov      al, byte ptr [0x5682]
6068: a21dc0                 mov      byte ptr [0xc01d], al
606b: 32ff                   xor      bh, bh
606d: e888eb                 call     0x4bf8
6070: 2287aabf               and      al, byte ptr [bx - 0x4056]
6074: 0287b2bf               add      al, byte ptr [bx - 0x404e]
6078: a21bc0                 mov      byte ptr [0xc01b], al
607b: e87aeb                 call     0x4bf8
607e: 2287babf               and      al, byte ptr [bx - 0x4046]
6082: 0287c2bf               add      al, byte ptr [bx - 0x403e]
6086: a21cc0                 mov      byte ptr [0xc01c], al
6089: c3                     ret      
608a: 33d2                   xor      dx, dx
608c: a18b4b                 mov      ax, word ptr [0x4b8b]
608f: 8acc                   mov      cl, ah
6091: 22e4                   and      ah, ah
6093: 784a                   js       0x60df
6095: d1e0                   shl      ax, 1
6097: a01454                 mov      al, byte ptr [0x5414]
609a: 22c0                   and      al, al
609c: 790e                   jns      0x60ac
609e: a07654                 mov      al, byte ptr [0x5476]
60a1: 22c0                   and      al, al
60a3: 7907                   jns      0x60ac
60a5: 80ec14                 sub      ah, 0x14
60a8: 7302                   jae      0x60ac
60aa: 32e4                   xor      ah, ah
60ac: 8ac1                   mov      al, cl
60ae: f6e4                   mul      ah
60b0: d1e0                   shl      ax, 1
60b2: d0d6                   rcl      dh, 1
60b4: d1e0                   shl      ax, 1
60b6: d0d6                   rcl      dh, 1
60b8: 8ad4                   mov      dl, ah
60ba: a07f4b                 mov      al, byte ptr [0x4b7f]
60bd: 22c0                   and      al, al
60bf: 741e                   je       0x60df
60c1: a1c354                 mov      ax, word ptr [0x54c3]
60c4: 22e4                   and      ah, ah
60c6: 7817                   js       0x60df
60c8: 32ed                   xor      ch, ch
60ca: 8a0e8c4b               mov      cl, byte ptr [0x4b8c]
60ce: 2bc1                   sub      ax, cx
60d0: 8026694bff             and      byte ptr [0x4b69], 0xff
60d5: 7905                   jns      0x60dc
60d7: 2bc1                   sub      ax, cx
60d9: 2d2300                 sub      ax, 0x23
60dc: a3c354                 mov      word ptr [0x54c3], ax
60df: a1c354                 mov      ax, word ptr [0x54c3]
60e2: 2bc2                   sub      ax, dx
60e4: 8bd0                   mov      dx, ax
60e6: 8a0e7f4b               mov      cl, byte ptr [0x4b7f]
60ea: 22c9                   and      cl, cl
60ec: 743f                   je       0x612d
60ee: a09d4c                 mov      al, byte ptr [0x4c9d]
60f1: 8a26a14c               mov      ah, byte ptr [0x4ca1]
60f5: 02069e4c               add      al, byte ptr [0x4c9e]
60f9: 1226a24c               adc      ah, byte ptr [0x4ca2]
60fd: d1d8                   rcr      ax, 1
60ff: 2a069f4c               sub      al, byte ptr [0x4c9f]
6103: 1a26a34c               sbb      ah, byte ptr [0x4ca3]
6107: 8acc                   mov      cl, ah
6109: 7902                   jns      0x610d
610b: f7d8                   neg      ax
610d: 80fc02                 cmp      ah, 2
6110: 7205                   jb       0x6117
6112: b0ff                   mov      al, 0xff
6114: eb03                   jmp      0x6119
6116: 90                     nop      
6117: d1e8                   shr      ax, 1
6119: 8ae0                   mov      ah, al
611b: d0e8                   shr      al, 1
611d: d0e8                   shr      al, 1
611f: 02c4                   add      al, ah
6121: 8ae7                   mov      ah, bh
6123: d0d4                   rcl      ah, 1
6125: 22c9                   and      cl, cl
6127: 7902                   jns      0x612b
6129: f7d8                   neg      ax
612b: 03c2                   add      ax, dx
612d: e835db                 call     0x3c65
6130: 03068b4b               add      ax, word ptr [0x4b8b]
6134: 7902                   jns      0x6138
6136: 32e4                   xor      ah, ah
6138: a38b4b                 mov      word ptr [0x4b8b], ax
613b: c3                     ret      
613c: 8b160960               mov      dx, word ptr [0x6009]
6140: 8a261b54               mov      ah, byte ptr [0x541b]
6144: 22e4                   and      ah, ah
6146: 7403                   je       0x614b
6148: 83ea19                 sub      dx, 0x19
614b: a07f4b                 mov      al, byte ptr [0x4b7f]
614e: 22c0                   and      al, al
6150: 7502                   jne      0x6154
6152: 33d2                   xor      dx, dx
6154: 8bc2                   mov      ax, dx
6156: a3c354                 mov      word ptr [0x54c3], ax
6159: c3                     ret      
615a: a07f4b                 mov      al, byte ptr [0x4b7f]
615d: 22c0                   and      al, al
615f: 7501                   jne      0x6162
6161: c3                     ret      
6162: 8a1e8154               mov      bl, byte ptr [0x5481]
6166: 8a87c14b               mov      al, byte ptr [bx + 0x4bc1]
616a: 22c0                   and      al, al
616c: 7809                   js       0x6177
616e: 3a061bc0               cmp      al, byte ptr [0xc01b]
6172: 7203                   jb       0x6177
6174: a01bc0                 mov      al, byte ptr [0xc01b]
6177: 247f                   and      al, 0x7f
6179: a26254                 mov      byte ptr [0x5462], al
617c: a08c4b                 mov      al, byte ptr [0x4b8c]
617f: 2a066254               sub      al, byte ptr [0x5462]
6183: 720f                   jb       0x6194
6185: 742e                   je       0x61b5
6187: c606d45480             mov      byte ptr [0x54d4], 0x80
618c: f71ec354               neg      word ptr [0x54c3]
6190: 3c0e                   cmp      al, 0xe
6192: 7220                   jb       0x61b4
6194: 8aa7c14b               mov      ah, byte ptr [bx + 0x4bc1]
6198: 22e4                   and      ah, ah
619a: 7814                   js       0x61b0
619c: 22c0                   and      al, al
619e: 7910                   jns      0x61b0
61a0: 8a26d454               mov      ah, byte ptr [0x54d4]
61a4: 22e4                   and      ah, ah
61a6: 7408                   je       0x61b0
61a8: 3cfe                   cmp      al, 0xfe
61aa: 7308                   jae      0x61b4
61ac: d026d454               shl      byte ptr [0x54d4], 1
61b0: d126c354               shl      word ptr [0x54c3], 1
61b4: c3                     ret      
61b5: c606d45480             mov      byte ptr [0x54d4], 0x80
61ba: c3                     ret      
61bb: a08954                 mov      al, byte ptr [0x5489]
61be: 22c0                   and      al, al
61c0: 7507                   jne      0x61c9
61c2: c3                     ret      
61c3: c606755403             mov      byte ptr [0x5475], 3
61c8: c3                     ret      
61c9: a07f4b                 mov      al, byte ptr [0x4b7f]
61cc: 22c0                   and      al, al
61ce: 7407                   je       0x61d7
61d0: a0264b                 mov      al, byte ptr [0x4b26]
61d3: 22c0                   and      al, al
61d5: 7542                   jne      0x6219
61d7: a0f84a                 mov      al, byte ptr [0x4af8]
61da: 8a26214b               mov      ah, byte ptr [0x4b21]
61de: 2a067d4c               sub      al, byte ptr [0x4c7d]
61e2: 1a26814c               sbb      ah, byte ptr [0x4c81]
61e6: 052800                 add      ax, 0x28
61e9: 8ad4                   mov      dl, ah
61eb: 7902                   jns      0x61ef
61ed: f7d8                   neg      ax
61ef: 3dc000                 cmp      ax, 0xc0
61f2: 73cf                   jae      0x61c3
61f4: 8a267554               mov      ah, byte ptr [0x5475]
61f8: 22e4                   and      ah, ah
61fa: 741d                   je       0x6219
61fc: fe0e7554               dec      byte ptr [0x5475]
6200: 32e4                   xor      ah, ah
6202: f6d8                   neg      al
6204: 22d2                   and      dl, dl
6206: 7902                   jns      0x620a
6208: f7d8                   neg      ax
620a: d1e0                   shl      ax, 1
620c: d1e0                   shl      ax, 1
620e: d1e0                   shl      ax, 1
6210: d1e0                   shl      ax, 1
6212: a28c53                 mov      byte ptr [0x538c], al
6215: 88268f53               mov      byte ptr [0x538f], ah
6219: a10c4b                 mov      ax, word ptr [0x4b0c]
621c: 3c2d                   cmp      al, 0x2d
621e: 7312                   jae      0x6232
6220: a0ee4a                 mov      al, byte ptr [0x4aee]
6223: 3c08                   cmp      al, 8
6225: 730b                   jae      0x6232
6227: b008                   mov      al, 8
6229: 22e4                   and      ah, ah
622b: 7802                   js       0x622f
622d: f6d8                   neg      al
622f: a28e53                 mov      byte ptr [0x538e], al
6232: a01ac0                 mov      al, byte ptr [0xc01a]
6235: 22c0                   and      al, al
6237: 781c                   js       0x6255
6239: b203                   mov      dl, 3
623b: a18b4b                 mov      ax, word ptr [0x4b8b]
623e: 2a066253               sub      al, byte ptr [0x5362]
6242: 1a266553               sbb      ah, byte ptr [0x5365]
6246: 7902                   jns      0x624a
6248: f6da                   neg      dl
624a: d1f8                   sar      ax, 1
624c: 02e2                   add      ah, dl
624e: a28d53                 mov      byte ptr [0x538d], al
6251: 88269053               mov      byte ptr [0x5390], ah
6255: b080                   mov      al, 0x80
6257: a27d54                 mov      byte ptr [0x547d], al
625a: a21ac0                 mov      byte ptr [0xc01a], al
625d: e89100                 call     0x62f1
6260: bf0200                 mov      di, 2
6263: b502                   mov      ch, 2
6265: 8a858b53               mov      al, byte ptr [di + 0x538b]
6269: 8aa58e53               mov      ah, byte ptr [di + 0x538e]
626d: 22e4                   and      ah, ah
626f: 7902                   jns      0x6273
6271: f7d8                   neg      ax
6273: 02ec                   add      ch, ah
6275: 4f                     dec      di
6276: 79ed                   jns      0x6265
6278: bf0200                 mov      di, 2
627b: 8a85d054               mov      al, byte ptr [di + 0x54d0]
627f: 02c5                   add      al, ch
6281: 7302                   jae      0x6285
6283: b0ff                   mov      al, 0xff
6285: 8885d054               mov      byte ptr [di + 0x54d0], al
6289: 4f                     dec      di
628a: 79ef                   jns      0x627b
628c: c6065e5480             mov      byte ptr [0x545e], 0x80
6291: c3                     ret      
6292: a07d54                 mov      al, byte ptr [0x547d]
6295: 22c0                   and      al, al
6297: 7457                   je       0x62f0
6299: c6067d5400             mov      byte ptr [0x547d], 0
629e: a18b4b                 mov      ax, word ptr [0x4b8b]
62a1: 2a068d53               sub      al, byte ptr [0x538d]
62a5: 1a269053               sbb      ah, byte ptr [0x5390]
62a9: 22e4                   and      ah, ah
62ab: 7902                   jns      0x62af
62ad: 32e4                   xor      ah, ah
62af: a38b4b                 mov      word ptr [0x4b8b], ax
62b2: a08c53                 mov      al, byte ptr [0x538c]
62b5: 8a268f53               mov      ah, byte ptr [0x538f]
62b9: d1f8                   sar      ax, 1
62bb: d1f8                   sar      ax, 1
62bd: d1f8                   sar      ax, 1
62bf: d1f8                   sar      ax, 1
62c1: bb0200                 mov      bx, 2
62c4: 28878d4c               sub      byte ptr [bx + 0x4c8d], al
62c8: 18a7914c               sbb      byte ptr [bx + 0x4c91], ah
62cc: fecb                   dec      bl
62ce: 79f4                   jns      0x62c4
62d0: b302                   mov      bl, 2
62d2: 8a878b53               mov      al, byte ptr [bx + 0x538b]
62d6: 00877c53               add      byte ptr [bx + 0x537c], al
62da: 8a878e53               mov      al, byte ptr [bx + 0x538e]
62de: 10877f53               adc      byte ptr [bx + 0x537f], al
62e2: 32c0                   xor      al, al
62e4: 88878b53               mov      byte ptr [bx + 0x538b], al
62e8: 88878e53               mov      byte ptr [bx + 0x538e], al
62ec: fecb                   dec      bl
62ee: 79e2                   jns      0x62d2
62f0: c3                     ret      
62f1: a00260                 mov      al, byte ptr [0x6002]
62f4: 22c0                   and      al, al
62f6: 74f8                   je       0x62f0
62f8: a0fd5f                 mov      al, byte ptr [0x5ffd]
62fb: a2cf08                 mov      byte ptr [0x8cf], al
62fe: 32c0                   xor      al, al
6300: a2fd5f                 mov      byte ptr [0x5ffd], al
6303: c706d008a00f           mov      word ptr [0x8d0], 0xfa0
6309: c606ce0801             mov      byte ptr [0x8ce], 1
630e: c3                     ret      
630f: a00260                 mov      al, byte ptr [0x6002]
6312: 22c0                   and      al, al
6314: 74da                   je       0x62f0
6316: a01ac0                 mov      al, byte ptr [0xc01a]
6319: 22c0                   and      al, al
631b: 75d3                   jne      0x62f0
631d: a0fd5f                 mov      al, byte ptr [0x5ffd]
6320: a2cf08                 mov      byte ptr [0x8cf], al
6323: 32c0                   xor      al, al
6325: a2fd5f                 mov      byte ptr [0x5ffd], al
6328: c706d0087e04           mov      word ptr [0x8d0], 0x47e
632e: c606ce0801             mov      byte ptr [0x8ce], 1
6333: c3                     ret      
6334: c6067f4b00             mov      byte ptr [0x4b7f], 0
6339: ba2800                 mov      dx, 0x28
633c: a0694b                 mov      al, byte ptr [0x4b69]
633f: 22c0                   and      al, al
6341: 7902                   jns      0x6345
6343: b27c                   mov      dl, 0x7c
6345: 88160e4b               mov      byte ptr [0x4b0e], dl
6349: bb0200                 mov      bx, 2
634c: 8a879d4c               mov      al, byte ptr [bx + 0x4c9d]
6350: 8aa7a14c               mov      ah, byte ptr [bx + 0x4ca1]
6354: 2a877d4c               sub      al, byte ptr [bx + 0x4c7d]
6358: 1aa7814c               sbb      ah, byte ptr [bx + 0x4c81]
635c: 03c2                   add      ax, dx
635e: 790d                   jns      0x636d
6360: 80fcff                 cmp      ah, 0xff
6363: 7504                   jne      0x6369
6365: 3ca0                   cmp      al, 0xa0
6367: 7302                   jae      0x636b
6369: b0a0                   mov      al, 0xa0
636b: b4ff                   mov      ah, 0xff
636d: 8bc8                   mov      cx, ax
636f: 2a87854c               sub      al, byte ptr [bx + 0x4c85]
6373: 1aa7894c               sbb      ah, byte ptr [bx + 0x4c89]
6377: 52                     push     dx
6378: e861fa                 call     0x5ddc
637b: 5a                     pop      dx
637c: 7902                   jns      0x6380
637e: 33c0                   xor      ax, ax
6380: 80fc04                 cmp      ah, 4
6383: 7203                   jb       0x6388
6385: b8ff03                 mov      ax, 0x3ff
6388: 08267f4b               or       byte ptr [0x4b7f], ah
638c: 08067f4b               or       byte ptr [0x4b7f], al
6390: 2bc2                   sub      ax, dx
6392: 8887754c               mov      byte ptr [bx + 0x4c75], al
6396: 88a7794c               mov      byte ptr [bx + 0x4c79], ah
639a: 8bc1                   mov      ax, cx
639c: 8887854c               mov      byte ptr [bx + 0x4c85], al
63a0: 88a7894c               mov      byte ptr [bx + 0x4c89], ah
63a4: fecb                   dec      bl
63a6: 79a4                   jns      0x634c
63a8: b302                   mov      bl, 2
63aa: 33c0                   xor      ax, ax
63ac: 0287754c               add      al, byte ptr [bx + 0x4c75]
63b0: 12a7794c               adc      ah, byte ptr [bx + 0x4c79]
63b4: fecb                   dec      bl
63b6: 79f4                   jns      0x63ac
63b8: 8bd0                   mov      dx, ax
63ba: b302                   mov      bl, 2
63bc: 8a87754c               mov      al, byte ptr [bx + 0x4c75]
63c0: 8aa7794c               mov      ah, byte ptr [bx + 0x4c79]
63c4: d1e0                   shl      ax, 1
63c6: d1e0                   shl      ax, 1
63c8: 8bc8                   mov      cx, ax
63ca: 8a87754c               mov      al, byte ptr [bx + 0x4c75]
63ce: 8aa7794c               mov      ah, byte ptr [bx + 0x4c79]
63d2: 03c2                   add      ax, dx
63d4: 03c1                   add      ax, cx
63d6: d1f8                   sar      ax, 1
63d8: d1f8                   sar      ax, 1
63da: d1f8                   sar      ax, 1
63dc: 8887954c               mov      byte ptr [bx + 0x4c95], al
63e0: 88a7994c               mov      byte ptr [bx + 0x4c99], ah
63e4: fecb                   dec      bl
63e6: 79d4                   jns      0x63bc
63e8: 8a1e8056               mov      bl, byte ptr [0x5680]
63ec: 8a87b06f               mov      al, byte ptr [bx + 0x6fb0]
63f0: 2404                   and      al, 4
63f2: 741f                   je       0x6413
63f4: a0934c                 mov      al, byte ptr [0x4c93]
63f7: 0a068f4c               or       al, byte ptr [0x4c8f]
63fb: 0a069b4c               or       al, byte ptr [0x4c9b]
63ff: 0a06974c               or       al, byte ptr [0x4c97]
6403: 24fc                   and      al, 0xfc
6405: 750c                   jne      0x6413
6407: e8eee7                 call     0x4bf8
640a: 240f                   and      al, 0xf
640c: 7505                   jne      0x6413
640e: c6068f4ca0             mov      byte ptr [0x4c8f], 0xa0
6413: bb0200                 mov      bx, 2
6416: 8a87954c               mov      al, byte ptr [bx + 0x4c95]
641a: 8aa7994c               mov      ah, byte ptr [bx + 0x4c99]
641e: e844d8                 call     0x3c65
6421: 02878d4c               add      al, byte ptr [bx + 0x4c8d]
6425: 12a7914c               adc      ah, byte ptr [bx + 0x4c91]
6429: 88878d4c               mov      byte ptr [bx + 0x4c8d], al
642d: 88a7914c               mov      byte ptr [bx + 0x4c91], ah
6431: e831d8                 call     0x3c65
6434: d1f8                   sar      ax, 1
6436: 00877d4c               add      byte ptr [bx + 0x4c7d], al
643a: 10a7814c               adc      byte ptr [bx + 0x4c81], ah
643e: fecb                   dec      bl
6440: 79d4                   jns      0x6416
6442: c6060c4b28             mov      byte ptr [0x4b0c], 0x28
6447: b001                   mov      al, 1
6449: 33db                   xor      bx, bx
644b: bf0100                 mov      di, 1
644e: e87800                 call     0x64c9
6451: c6060c4b70             mov      byte ptr [0x4b0c], 0x70
6456: b001                   mov      al, 1
6458: 33db                   xor      bx, bx
645a: 22f6                   and      dh, dh
645c: 7902                   jns      0x6460
645e: fec3                   inc      bl
6460: bf0200                 mov      di, 2
6463: e86300                 call     0x64c9
6466: bf0200                 mov      di, 2
6469: 32ff                   xor      bh, bh
646b: 8a9d10c0               mov      bl, byte ptr [di - 0x3ff0]
646f: 8a857d4c               mov      al, byte ptr [di + 0x4c7d]
6473: 8aa5814c               mov      ah, byte ptr [di + 0x4c81]
6477: 055000                 add      ax, 0x50
647a: 8887fd58               mov      byte ptr [bx + 0x58fd], al
647e: 88a7bd58               mov      byte ptr [bx + 0x58bd], ah
6482: 4f                     dec      di
6483: 79e6                   jns      0x646b
6485: a03b59                 mov      al, byte ptr [0x593b]
6488: 8a26fb58               mov      ah, byte ptr [0x58fb]
648c: 2a063959               sub      al, byte ptr [0x5939]
6490: 1a26f958               sbb      ah, byte ptr [0x58f9]
6494: d1f8                   sar      ax, 1
6496: 8bd0                   mov      dx, ax
6498: 02063a59               add      al, byte ptr [0x593a]
649c: 1226fa58               adc      ah, byte ptr [0x58fa]
64a0: a23c59                 mov      byte ptr [0x593c], al
64a3: 8826fc58               mov      byte ptr [0x58fc], ah
64a7: 8bc2                   mov      ax, dx
64a9: 28063a59               sub      byte ptr [0x593a], al
64ad: 1826fa58               sbb      byte ptr [0x58fa], ah
64b1: c3                     ret      
64b2: 8a877d4c               mov      al, byte ptr [bx + 0x4c7d]
64b6: 8aa7814c               mov      ah, byte ptr [bx + 0x4c81]
64ba: 2a857d4c               sub      al, byte ptr [di + 0x4c7d]
64be: 1aa5814c               sbb      ah, byte ptr [di + 0x4c81]
64c2: 8af4                   mov      dh, ah
64c4: 7902                   jns      0x64c8
64c6: f7d8                   neg      ax
64c8: c3                     ret      
64c9: a20d4b                 mov      byte ptr [0x4b0d], al
64cc: 881e0e4b               mov      byte ptr [0x4b0e], bl
64d0: e8dfff                 call     0x64b2
64d3: 8bc8                   mov      cx, ax
64d5: a10c4b                 mov      ax, word ptr [0x4b0c]
64d8: 2bc1                   sub      ax, cx
64da: 7931                   jns      0x650d
64dc: 22f6                   and      dh, dh
64de: 7902                   jns      0x64e2
64e0: 8bdf                   mov      bx, di
64e2: 00877d4c               add      byte ptr [bx + 0x4c7d], al
64e6: 10a7814c               adc      byte ptr [bx + 0x4c81], ah
64ea: 83ff02                 cmp      di, 2
64ed: 7405                   je       0x64f4
64ef: 33db                   xor      bx, bx
64f1: eb59                   jmp      0x654c
64f3: 90                     nop      
64f4: 33db                   xor      bx, bx
64f6: bf0100                 mov      di, 1
64f9: e85000                 call     0x654c
64fc: b302                   mov      bl, 2
64fe: e84b00                 call     0x654c
6501: 33db                   xor      bx, bx
6503: e84600                 call     0x654c
6506: bf0200                 mov      di, 2
6509: 8a1e0e4b               mov      bl, byte ptr [0x4b0e]
650d: 83ff02                 cmp      di, 2
6510: 7539                   jne      0x654b
6512: a07f4b                 mov      al, byte ptr [0x4b7f]
6515: 22c0                   and      al, al
6517: 7532                   jne      0x654b
6519: 22f6                   and      dh, dh
651b: 7800                   js       0x651d
651d: 8a878d4c               mov      al, byte ptr [bx + 0x4c8d]
6521: 8aa7914c               mov      ah, byte ptr [bx + 0x4c91]
6525: 2a068f4c               sub      al, byte ptr [0x4c8f]
6529: 1a26934c               sbb      ah, byte ptr [0x4c93]
652d: 7806                   js       0x6535
652f: 751a                   jne      0x654b
6531: 3c10                   cmp      al, 0x10
6533: 7316                   jae      0x654b
6535: b302                   mov      bl, 2
6537: 8a8714c0               mov      al, byte ptr [bx - 0x3fec]
653b: 8aa717c0               mov      ah, byte ptr [bx - 0x3fe9]
653f: 00878d4c               add      byte ptr [bx + 0x4c8d], al
6543: 10a7914c               adc      byte ptr [bx + 0x4c91], ah
6547: fecb                   dec      bl
6549: 79ec                   jns      0x6537
654b: c3                     ret      
654c: 8a878d4c               mov      al, byte ptr [bx + 0x4c8d]
6550: 8aa7914c               mov      ah, byte ptr [bx + 0x4c91]
6554: 02858d4c               add      al, byte ptr [di + 0x4c8d]
6558: 12a5914c               adc      ah, byte ptr [di + 0x4c91]
655c: d1f8                   sar      ax, 1
655e: 88878d4c               mov      byte ptr [bx + 0x4c8d], al
6562: 88a7914c               mov      byte ptr [bx + 0x4c91], ah
6566: 88858d4c               mov      byte ptr [di + 0x4c8d], al
656a: 88a5914c               mov      byte ptr [di + 0x4c91], ah
656e: c3                     ret      
656f: 00e8                   add      al, ch
6571: 7de8                   jge      0x655b
6573: be9072                 mov      si, 0x7290
6576: bf50c5                 mov      di, 0xc550
6579: b94000                 mov      cx, 0x40
657c: f3a5                   rep movsw word ptr es:[di], word ptr [si]
657e: 33c0                   xor      ax, ax
6580: bf90c6                 mov      di, 0xc690
6583: b94000                 mov      cx, 0x40
6586: f3ab                   rep stosw word ptr es:[di], ax
6588: e810ce                 call     0x339b
658b: 32c0                   xor      al, al
658d: a2844b                 mov      byte ptr [0x4b84], al
6590: a2b654                 mov      byte ptr [0x54b6], al
6593: a2b754                 mov      byte ptr [0x54b7], al
6596: a2e754                 mov      byte ptr [0x54e7], al
6599: a2294b                 mov      byte ptr [0x4b29], al
659c: a20f54                 mov      byte ptr [0x540f], al
659f: c3                     ret      
65a0: e8cdff                 call     0x6570
65a3: a0e14a                 mov      al, byte ptr [0x4ae1]
65a6: 22c0                   and      al, al
65a8: 750c                   jne      0x65b6
65aa: a0274b                 mov      al, byte ptr [0x4b27]
65ad: 22c0                   and      al, al
65af: 7905                   jns      0x65b6
65b1: e8e1ee                 call     0x5495
65b4: 32ff                   xor      bh, bh
65b6: 32c0                   xor      al, al
65b8: a2bd4a                 mov      byte ptr [0x4abd], al
65bb: a2be4a                 mov      byte ptr [0x4abe], al
65be: e89fcb                 call     0x3160
65c1: 7212                   jb       0x65d5
65c3: 3cff                   cmp      al, 0xff
65c5: 7523                   jne      0x65ea
65c7: 8a26684b               mov      ah, byte ptr [0x4b68]
65cb: a0664b                 mov      al, byte ptr [0x4b66]
65ce: e8e4cc                 call     0x32b5
65d1: 3cff                   cmp      al, 0xff
65d3: 7515                   jne      0x65ea
65d5: c606274bc0             mov      byte ptr [0x4b27], 0xc0
65da: a07956                 mov      al, byte ptr [0x5679]
65dd: 22c0                   and      al, al
65df: 7906                   jns      0x65e7
65e1: e8c5f9                 call     0x5fa9
65e4: e8d0a5                 call     0xbb7
65e7: e9f300                 jmp      0x66dd
65ea: a2e04a                 mov      byte ptr [0x4ae0], al
65ed: e8400c                 call     0x7230
65f0: e862ce                 call     0x3455
65f3: a02e53                 mov      al, byte ptr [0x532e]
65f6: 8a263153               mov      ah, byte ptr [0x5331]
65fa: 2b069453               sub      ax, word ptr [0x5394]
65fe: 32265b4b               xor      ah, byte ptr [0x4b5b]
6602: 7902                   jns      0x6606
6604: f7d8                   neg      ax
6606: 80fc40                 cmp      ah, 0x40
6609: f5                     cmc      
660a: d01eb754               rcr      byte ptr [0x54b7], 1
660e: a0e04a                 mov      al, byte ptr [0x4ae0]
6611: a28054                 mov      byte ptr [0x5480], al
6614: 8a26274b               mov      ah, byte ptr [0x4b27]
6618: 80e440                 and      ah, 0x40
661b: 7503                   jne      0x6620
661d: a21554                 mov      byte ptr [0x5415], al
6620: e8810e                 call     0x74a4
6623: a0554b                 mov      al, byte ptr [0x4b55]
6626: a2a754                 mov      byte ptr [0x54a7], al
6629: c706824b8080           mov      word ptr [0x4b82], 0x8080
662f: a07956                 mov      al, byte ptr [0x5679]
6632: 22c0                   and      al, al
6634: 790c                   jns      0x6642
6636: e870f9                 call     0x5fa9
6639: e85ad4                 call     0x3a96
663c: e8e1f7                 call     0x5e20
663f: e875a5                 call     0xbb7
6642: a08054                 mov      al, byte ptr [0x5480]
6645: a2e04a                 mov      byte ptr [0x4ae0], al
6648: c606864b00             mov      byte ptr [0x4b86], 0
664d: a0454b                 mov      al, byte ptr [0x4b45]
6650: 22c0                   and      al, al
6652: 7908                   jns      0x665c
6654: e8fc10                 call     0x7753
6657: c606454b00             mov      byte ptr [0x4b45], 0
665c: a0454b                 mov      al, byte ptr [0x4b45]
665f: 22c0                   and      al, al
6661: 750f                   jne      0x6672
6663: e80711                 call     0x776d
6666: 3a1e5d4b               cmp      bl, byte ptr [0x4b5d]
666a: 7503                   jne      0x666f
666c: e892a1                 call     0x801
666f: e8e810                 call     0x775a
6672: e88003                 call     0x69f5
6675: 32ff                   xor      bh, bh
6677: e86e08                 call     0x6ee8
667a: e82307                 call     0x6da0
667d: 32ff                   xor      bh, bh
667f: c606d94a00             mov      byte ptr [0x4ad9], 0
6684: c606864b02             mov      byte ptr [0x4b86], 2
6689: e86c05                 call     0x6bf8
668c: e8c410                 call     0x7753
668f: e86303                 call     0x69f5
6692: 32ff                   xor      bh, bh
6694: e80907                 call     0x6da0
6697: 32ff                   xor      bh, bh
6699: e85c05                 call     0x6bf8
669c: c606844b80             mov      byte ptr [0x4b84], 0x80
66a1: 8a268a56               mov      ah, byte ptr [0x568a]
66a5: 80fc05                 cmp      ah, 5
66a8: 750e                   jne      0x66b8
66aa: b031                   mov      al, 0x31
66ac: 2a068054               sub      al, byte ptr [0x5480]
66b0: 3c03                   cmp      al, 3
66b2: 7304                   jae      0x66b8
66b4: 0402                   add      al, 2
66b6: 7502                   jne      0x66ba
66b8: b002                   mov      al, 2
66ba: 8a26e14a               mov      ah, byte ptr [0x4ae1]
66be: 22e4                   and      ah, ah
66c0: 7402                   je       0x66c4
66c2: b005                   mov      al, 5
66c4: a2da4a                 mov      byte ptr [0x4ada], al
66c7: e88910                 call     0x7753
66ca: e82803                 call     0x69f5
66cd: 32ff                   xor      bh, bh
66cf: e8ce06                 call     0x6da0
66d2: 32ff                   xor      bh, bh
66d4: e82105                 call     0x6bf8
66d7: fe0eda4a               dec      byte ptr [0x4ada]
66db: 75ea                   jne      0x66c7
66dd: c606844b00             mov      byte ptr [0x4b84], 0
66e2: e81aed                 call     0x53ff
66e5: e811ec                 call     0x52f9
66e8: a00f54                 mov      al, byte ptr [0x540f]
66eb: 22c0                   and      al, al
66ed: 791f                   jns      0x670e
66ef: 8a1e1d4b               mov      bl, byte ptr [0x4b1d]
66f3: eb13                   jmp      0x6708
66f5: 90                     nop      
66f6: 32ff                   xor      bh, bh
66f8: 8a8750c7               mov      al, byte ptr [bx - 0x38b0]
66fc: 3a8710c5               cmp      al, byte ptr [bx - 0x3af0]
6700: 7304                   jae      0x6706
6702: 888710c5               mov      byte ptr [bx - 0x3af0], al
6706: fec3                   inc      bl
6708: 3a1e1e4b               cmp      bl, byte ptr [0x4b1e]
670c: 76e8                   jbe      0x66f6
670e: e83c0a                 call     0x714d
6711: e88009                 call     0x7094
6714: e82401                 call     0x683b
6717: e9e621                 jmp      0x8900
671a: c3                     ret      
671b: a06154                 mov      al, byte ptr [0x5461]
671e: 22c0                   and      al, al
6720: 74f8                   je       0x671a
6722: a0a8dd                 mov      al, byte ptr [0xdda8]
6725: 22c0                   and      al, al
6727: a10a00                 mov      ax, word ptr [0xa]
672a: 7403                   je       0x672f
672c: 80f402                 xor      ah, 2
672f: 8ec0                   mov      es, ax
6731: 8b36af47               mov      si, word ptr [0x47af]
6735: 81fef344               cmp      si, 0x44f3
6739: 7303                   jae      0x673e
673b: eb6f                   jmp      0x67ac
673d: 90                     nop      
673e: bac403                 mov      dx, 0x3c4
6741: b8020f                 mov      ax, 0xf02
6744: ef                     out      dx, ax
6745: bace03                 mov      dx, 0x3ce
6748: b80308                 mov      ax, 0x803
674b: ef                     out      dx, ax
674c: be29c0                 mov      si, 0xc029
674f: bfd003                 mov      di, 0x3d0
6752: bd1c00                 mov      bp, 0x1c
6755: b90800                 mov      cx, 8
6758: 268a05                 mov      al, byte ptr es:[di]
675b: a4                     movsb    byte ptr es:[di], byte ptr [si]
675c: e2fa                   loop     0x6758
675e: 83c720                 add      di, 0x20
6761: 4d                     dec      bp
6762: 75f1                   jne      0x6755
6764: b80310                 mov      ax, 0x1003
6767: ef                     out      dx, ax
6768: bac403                 mov      dx, 0x3c4
676b: b80208                 mov      ax, 0x802
676e: ef                     out      dx, ax
676f: bfd003                 mov      di, 0x3d0
6772: bd1c00                 mov      bp, 0x1c
6775: b90800                 mov      cx, 8
6778: 268a05                 mov      al, byte ptr es:[di]
677b: a4                     movsb    byte ptr es:[di], byte ptr [si]
677c: e2fa                   loop     0x6778
677e: 83c720                 add      di, 0x20
6781: 4d                     dec      bp
6782: 75f1                   jne      0x6775
6784: b002                   mov      al, 2
6786: d0ec                   shr      ah, 1
6788: 73e4                   jae      0x676e
678a: b8020f                 mov      ax, 0xf02
678d: ef                     out      dx, ax
678e: bace03                 mov      dx, 0x3ce
6791: b80300                 mov      ax, 3
6794: ef                     out      dx, ax
6795: 8b36af47               mov      si, word ptr [0x47af]
6799: bfc104                 mov      di, 0x4c1
679c: a0b147                 mov      al, byte ptr [0x47b1]
679f: 22c0                   and      al, al
67a1: 750c                   jne      0x67af
67a3: bf6105                 mov      di, 0x561
67a6: eb07                   jmp      0x67af
67a8: 8b36af47               mov      si, word ptr [0x47af]
67ac: bfc104                 mov      di, 0x4c1
67af: e81600                 call     0x67c8
67b2: a0b147                 mov      al, byte ptr [0x47b1]
67b5: 22c0                   and      al, al
67b7: 7406                   je       0x67bf
67b9: bf0106                 mov      di, 0x601
67bc: e80900                 call     0x67c8
67bf: b80300                 mov      ax, 3
67c2: ef                     out      dx, ax
67c3: 8cd8                   mov      ax, ds
67c5: 8ec0                   mov      es, ax
67c7: c3                     ret      
67c8: b80308                 mov      ax, 0x803
67cb: bace03                 mov      dx, 0x3ce
67ce: ef                     out      dx, ax
67cf: b8020f                 mov      ax, 0xf02
67d2: bac403                 mov      dx, 0x3c4
67d5: ef                     out      dx, ax
67d6: b90600                 mov      cx, 6
67d9: 268a05                 mov      al, byte ptr es:[di]
67dc: ad                     lodsw    ax, word ptr [si]
67dd: f7d0                   not      ax
67df: aa                     stosb    byte ptr es:[di], al
67e0: 268a05                 mov      al, byte ptr es:[di]
67e3: 8ac4                   mov      al, ah
67e5: aa                     stosb    byte ptr es:[di], al
67e6: 268a05                 mov      al, byte ptr es:[di]
67e9: ad                     lodsw    ax, word ptr [si]
67ea: f7d0                   not      ax
67ec: aa                     stosb    byte ptr es:[di], al
67ed: 268a05                 mov      al, byte ptr es:[di]
67f0: 8ac4                   mov      al, ah
67f2: aa                     stosb    byte ptr es:[di], al
67f3: 268a05                 mov      al, byte ptr es:[di]
67f6: ad                     lodsw    ax, word ptr [si]
67f7: f7d0                   not      ax
67f9: aa                     stosb    byte ptr es:[di], al
67fa: 268a05                 mov      al, byte ptr es:[di]
67fd: 8ac4                   mov      al, ah
67ff: aa                     stosb    byte ptr es:[di], al
6800: 83c722                 add      di, 0x22
6803: e2d4                   loop     0x67d9
6805: b002                   mov      al, 2
6807: 8a26a654               mov      ah, byte ptr [0x54a6]
680b: ef                     out      dx, ax
680c: bace03                 mov      dx, 0x3ce
680f: b80310                 mov      ax, 0x1003
6812: ef                     out      dx, ax
6813: 83ee24                 sub      si, 0x24
6816: 81eff000               sub      di, 0xf0
681a: b90600                 mov      cx, 6
681d: 268a05                 mov      al, byte ptr es:[di]
6820: a4                     movsb    byte ptr es:[di], byte ptr [si]
6821: 268a05                 mov      al, byte ptr es:[di]
6824: a4                     movsb    byte ptr es:[di], byte ptr [si]
6825: 268a05                 mov      al, byte ptr es:[di]
6828: a4                     movsb    byte ptr es:[di], byte ptr [si]
6829: 268a05                 mov      al, byte ptr es:[di]
682c: a4                     movsb    byte ptr es:[di], byte ptr [si]
682d: 268a05                 mov      al, byte ptr es:[di]
6830: a4                     movsb    byte ptr es:[di], byte ptr [si]
6831: 268a05                 mov      al, byte ptr es:[di]
6834: a4                     movsb    byte ptr es:[di], byte ptr [si]
6835: 83c722                 add      di, 0x22
6838: e2e3                   loop     0x681d
683a: c3                     ret      
683b: a10a00                 mov      ax, word ptr [0xa]
683e: 8ec0                   mov      es, ax
6840: bb2700                 mov      bx, 0x27
6843: bac403                 mov      dx, 0x3c4
6846: b8020f                 mov      ax, 0xf02
6849: ef                     out      dx, ax
684a: b80308                 mov      ax, 0x803
684d: bace03                 mov      dx, 0x3ce
6850: ef                     out      dx, ax
6851: bec9c4                 mov      si, 0xc4c9
6854: bf8402                 mov      di, 0x284
6857: 268a05                 mov      al, byte ptr es:[di]
685a: a4                     movsb    byte ptr es:[di], byte ptr [si]
685b: 46                     inc      si
685c: 46                     inc      si
685d: 03fb                   add      di, bx
685f: 268a05                 mov      al, byte ptr es:[di]
6862: a4                     movsb    byte ptr es:[di], byte ptr [si]
6863: 46                     inc      si
6864: 46                     inc      si
6865: 03fb                   add      di, bx
6867: 268a05                 mov      al, byte ptr es:[di]
686a: a4                     movsb    byte ptr es:[di], byte ptr [si]
686b: 46                     inc      si
686c: 46                     inc      si
686d: 03fb                   add      di, bx
686f: 268a05                 mov      al, byte ptr es:[di]
6872: a4                     movsb    byte ptr es:[di], byte ptr [si]
6873: 46                     inc      si
6874: 46                     inc      si
6875: 03fb                   add      di, bx
6877: 268a05                 mov      al, byte ptr es:[di]
687a: a4                     movsb    byte ptr es:[di], byte ptr [si]
687b: 46                     inc      si
687c: 46                     inc      si
687d: 03fb                   add      di, bx
687f: 268a05                 mov      al, byte ptr es:[di]
6882: a4                     movsb    byte ptr es:[di], byte ptr [si]
6883: 46                     inc      si
6884: 46                     inc      si
6885: 03fb                   add      di, bx
6887: 268a05                 mov      al, byte ptr es:[di]
688a: a4                     movsb    byte ptr es:[di], byte ptr [si]
688b: 46                     inc      si
688c: 46                     inc      si
688d: 03fb                   add      di, bx
688f: 268a05                 mov      al, byte ptr es:[di]
6892: a4                     movsb    byte ptr es:[di], byte ptr [si]
6893: 46                     inc      si
6894: 46                     inc      si
6895: bfa302                 mov      di, 0x2a3
6898: 268a05                 mov      al, byte ptr es:[di]
689b: a4                     movsb    byte ptr es:[di], byte ptr [si]
689c: 46                     inc      si
689d: 46                     inc      si
689e: 03fb                   add      di, bx
68a0: 268a05                 mov      al, byte ptr es:[di]
68a3: a4                     movsb    byte ptr es:[di], byte ptr [si]
68a4: 46                     inc      si
68a5: 46                     inc      si
68a6: 03fb                   add      di, bx
68a8: 268a05                 mov      al, byte ptr es:[di]
68ab: a4                     movsb    byte ptr es:[di], byte ptr [si]
68ac: 46                     inc      si
68ad: 46                     inc      si
68ae: 03fb                   add      di, bx
68b0: 268a05                 mov      al, byte ptr es:[di]
68b3: a4                     movsb    byte ptr es:[di], byte ptr [si]
68b4: 46                     inc      si
68b5: 46                     inc      si
68b6: 03fb                   add      di, bx
68b8: 268a05                 mov      al, byte ptr es:[di]
68bb: a4                     movsb    byte ptr es:[di], byte ptr [si]
68bc: 46                     inc      si
68bd: 46                     inc      si
68be: 03fb                   add      di, bx
68c0: 268a05                 mov      al, byte ptr es:[di]
68c3: a4                     movsb    byte ptr es:[di], byte ptr [si]
68c4: 46                     inc      si
68c5: 46                     inc      si
68c6: 03fb                   add      di, bx
68c8: 268a05                 mov      al, byte ptr es:[di]
68cb: a4                     movsb    byte ptr es:[di], byte ptr [si]
68cc: 46                     inc      si
68cd: 46                     inc      si
68ce: 03fb                   add      di, bx
68d0: 268a05                 mov      al, byte ptr es:[di]
68d3: a4                     movsb    byte ptr es:[di], byte ptr [si]
68d4: b80310                 mov      ax, 0x1003
68d7: ef                     out      dx, ax
68d8: bac403                 mov      dx, 0x3c4
68db: b80208                 mov      ax, 0x802
68de: ef                     out      dx, ax
68df: becac4                 mov      si, 0xc4ca
68e2: bf8402                 mov      di, 0x284
68e5: 268a05                 mov      al, byte ptr es:[di]
68e8: a4                     movsb    byte ptr es:[di], byte ptr [si]
68e9: 46                     inc      si
68ea: 46                     inc      si
68eb: 03fb                   add      di, bx
68ed: 268a05                 mov      al, byte ptr es:[di]
68f0: a4                     movsb    byte ptr es:[di], byte ptr [si]
68f1: 46                     inc      si
68f2: 46                     inc      si
68f3: 03fb                   add      di, bx
68f5: 268a05                 mov      al, byte ptr es:[di]
68f8: a4                     movsb    byte ptr es:[di], byte ptr [si]
68f9: 46                     inc      si
68fa: 46                     inc      si
68fb: 03fb                   add      di, bx
68fd: 268a05                 mov      al, byte ptr es:[di]
6900: a4                     movsb    byte ptr es:[di], byte ptr [si]
6901: 46                     inc      si
6902: 46                     inc      si
6903: 03fb                   add      di, bx
6905: 268a05                 mov      al, byte ptr es:[di]
6908: a4                     movsb    byte ptr es:[di], byte ptr [si]
6909: 46                     inc      si
690a: 46                     inc      si
690b: 03fb                   add      di, bx
690d: 268a05                 mov      al, byte ptr es:[di]
6910: a4                     movsb    byte ptr es:[di], byte ptr [si]
6911: 46                     inc      si
6912: 46                     inc      si
6913: 03fb                   add      di, bx
6915: 268a05                 mov      al, byte ptr es:[di]
6918: a4                     movsb    byte ptr es:[di], byte ptr [si]
6919: 46                     inc      si
691a: 46                     inc      si
691b: 03fb                   add      di, bx
691d: 268a05                 mov      al, byte ptr es:[di]
6920: a4                     movsb    byte ptr es:[di], byte ptr [si]
6921: 46                     inc      si
6922: 46                     inc      si
6923: bfa302                 mov      di, 0x2a3
6926: 268a05                 mov      al, byte ptr es:[di]
6929: a4                     movsb    byte ptr es:[di], byte ptr [si]
692a: 46                     inc      si
692b: 46                     inc      si
692c: 03fb                   add      di, bx
692e: 268a05                 mov      al, byte ptr es:[di]
6931: a4                     movsb    byte ptr es:[di], byte ptr [si]
6932: 46                     inc      si
6933: 46                     inc      si
6934: 03fb                   add      di, bx
6936: 268a05                 mov      al, byte ptr es:[di]
6939: a4                     movsb    byte ptr es:[di], byte ptr [si]
693a: 46                     inc      si
693b: 46                     inc      si
693c: 03fb                   add      di, bx
693e: 268a05                 mov      al, byte ptr es:[di]
6941: a4                     movsb    byte ptr es:[di], byte ptr [si]
6942: 46                     inc      si
6943: 46                     inc      si
6944: 03fb                   add      di, bx
6946: 268a05                 mov      al, byte ptr es:[di]
6949: a4                     movsb    byte ptr es:[di], byte ptr [si]
694a: 46                     inc      si
694b: 46                     inc      si
694c: 03fb                   add      di, bx
694e: 268a05                 mov      al, byte ptr es:[di]
6951: a4                     movsb    byte ptr es:[di], byte ptr [si]
6952: 46                     inc      si
6953: 46                     inc      si
6954: 03fb                   add      di, bx
6956: 268a05                 mov      al, byte ptr es:[di]
6959: a4                     movsb    byte ptr es:[di], byte ptr [si]
695a: 46                     inc      si
695b: 46                     inc      si
695c: 03fb                   add      di, bx
695e: 268a05                 mov      al, byte ptr es:[di]
6961: a4                     movsb    byte ptr es:[di], byte ptr [si]
6962: b80204                 mov      ax, 0x402
6965: ef                     out      dx, ax
6966: becbc4                 mov      si, 0xc4cb
6969: bf8402                 mov      di, 0x284
696c: 268a05                 mov      al, byte ptr es:[di]
696f: a4                     movsb    byte ptr es:[di], byte ptr [si]
6970: 46                     inc      si
6971: 46                     inc      si
6972: 03fb                   add      di, bx
6974: 268a05                 mov      al, byte ptr es:[di]
6977: a4                     movsb    byte ptr es:[di], byte ptr [si]
6978: 46                     inc      si
6979: 46                     inc      si
697a: 03fb                   add      di, bx
697c: 268a05                 mov      al, byte ptr es:[di]
697f: a4                     movsb    byte ptr es:[di], byte ptr [si]
6980: 46                     inc      si
6981: 46                     inc      si
6982: 03fb                   add      di, bx
6984: 268a05                 mov      al, byte ptr es:[di]
6987: a4                     movsb    byte ptr es:[di], byte ptr [si]
6988: 46                     inc      si
6989: 46                     inc      si
698a: 03fb                   add      di, bx
698c: 268a05                 mov      al, byte ptr es:[di]
698f: a4                     movsb    byte ptr es:[di], byte ptr [si]
6990: 46                     inc      si
6991: 46                     inc      si
6992: 03fb                   add      di, bx
6994: 268a05                 mov      al, byte ptr es:[di]
6997: a4                     movsb    byte ptr es:[di], byte ptr [si]
6998: 46                     inc      si
6999: 46                     inc      si
699a: 03fb                   add      di, bx
699c: 268a05                 mov      al, byte ptr es:[di]
699f: a4                     movsb    byte ptr es:[di], byte ptr [si]
69a0: 46                     inc      si
69a1: 46                     inc      si
69a2: 03fb                   add      di, bx
69a4: 268a05                 mov      al, byte ptr es:[di]
69a7: a4                     movsb    byte ptr es:[di], byte ptr [si]
69a8: 46                     inc      si
69a9: 46                     inc      si
69aa: bfa302                 mov      di, 0x2a3
69ad: 268a05                 mov      al, byte ptr es:[di]
69b0: a4                     movsb    byte ptr es:[di], byte ptr [si]
69b1: 46                     inc      si
69b2: 46                     inc      si
69b3: 03fb                   add      di, bx
69b5: 268a05                 mov      al, byte ptr es:[di]
69b8: a4                     movsb    byte ptr es:[di], byte ptr [si]
69b9: 46                     inc      si
69ba: 46                     inc      si
69bb: 03fb                   add      di, bx
69bd: 268a05                 mov      al, byte ptr es:[di]
69c0: a4                     movsb    byte ptr es:[di], byte ptr [si]
69c1: 46                     inc      si
69c2: 46                     inc      si
69c3: 03fb                   add      di, bx
69c5: 268a05                 mov      al, byte ptr es:[di]
69c8: a4                     movsb    byte ptr es:[di], byte ptr [si]
69c9: 46                     inc      si
69ca: 46                     inc      si
69cb: 03fb                   add      di, bx
69cd: 268a05                 mov      al, byte ptr es:[di]
69d0: a4                     movsb    byte ptr es:[di], byte ptr [si]
69d1: 46                     inc      si
69d2: 46                     inc      si
69d3: 03fb                   add      di, bx
69d5: 268a05                 mov      al, byte ptr es:[di]
69d8: a4                     movsb    byte ptr es:[di], byte ptr [si]
69d9: 46                     inc      si
69da: 46                     inc      si
69db: 03fb                   add      di, bx
69dd: 268a05                 mov      al, byte ptr es:[di]
69e0: a4                     movsb    byte ptr es:[di], byte ptr [si]
69e1: 46                     inc      si
69e2: 46                     inc      si
69e3: 03fb                   add      di, bx
69e5: 268a05                 mov      al, byte ptr es:[di]
69e8: a4                     movsb    byte ptr es:[di], byte ptr [si]
69e9: bace03                 mov      dx, 0x3ce
69ec: b80300                 mov      ax, 3
69ef: ef                     out      dx, ax
69f0: 8cd8                   mov      ax, ds
69f2: 8ec0                   mov      es, ax
69f4: c3                     ret      
69f5: 32ff                   xor      bh, bh
69f7: 8a1ee04a               mov      bl, byte ptr [0x4ae0]
69fb: e891c7                 call     0x318f
69fe: 32ff                   xor      bh, bh
6a00: 8a1ee04a               mov      bl, byte ptr [0x4ae0]
6a04: e843c8                 call     0x324a
6a07: a0254b                 mov      al, byte ptr [0x4b25]
6a0a: 2a06cf4a               sub      al, byte ptr [0x4acf]
6a0e: a2f34a                 mov      byte ptr [0x4af3], al
6a11: e83602                 call     0x6c4a
6a14: 32ff                   xor      bh, bh
6a16: 8a1ed94a               mov      bl, byte ptr [0x4ad9]
6a1a: 22db                   and      bl, bl
6a1c: 7407                   je       0x6a25
6a1e: 8b87bb58               mov      ax, word ptr [bx + 0x58bb]
6a22: a3a354                 mov      word ptr [0x54a3], ax
6a25: a0f34a                 mov      al, byte ptr [0x4af3]
6a28: 32065b4b               xor      al, byte ptr [0x4b5b]
6a2c: 80266d54ff             and      byte ptr [0x546d], 0xff
6a31: 790e                   jns      0x6a41
6a33: 8026694bff             and      byte ptr [0x4b69], 0xff
6a38: 780e                   js       0x6a48
6a3a: f606694b40             test     byte ptr [0x4b69], 0x40
6a3f: 7407                   je       0x6a48
6a41: 8026544bff             and      byte ptr [0x4b54], 0xff
6a46: 7902                   jns      0x6a4a
6a48: 0440                   add      al, 0x40
6a4a: a2b554                 mov      byte ptr [0x54b5], al
6a4d: 22c0                   and      al, al
6a4f: 7923                   jns      0x6a74
6a51: a2b654                 mov      byte ptr [0x54b6], al
6a54: c606864b00             mov      byte ptr [0x4b86], 0
6a59: e8d6ce                 call     0x3932
6a5c: 32ff                   xor      bh, bh
6a5e: a08d4b                 mov      al, byte ptr [0x4b8d]
6a61: 02061f4b               add      al, byte ptr [0x4b1f]
6a65: 2402                   and      al, 2
6a67: a28d4b                 mov      byte ptr [0x4b8d], al
6a6a: 80265b4bff             and      byte ptr [0x4b5b], 0xff
6a6f: 750d                   jne      0x6a7e
6a71: eb76                   jmp      0x6ae9
6a73: 90                     nop      
6a74: 80265b4bff             and      byte ptr [0x4b5b], 0xff
6a79: 7403                   je       0x6a7e
6a7b: eb6c                   jmp      0x6ae9
6a7d: 90                     nop      
6a7e: 8b3e504b               mov      di, word ptr [0x4b50]
6a82: 8a05                   mov      al, byte ptr [di]
6a84: 0407                   add      al, 7
6a86: a2564b                 mov      byte ptr [0x4b56], al
6a89: 33ff                   xor      di, di
6a8b: 32ff                   xor      bh, bh
6a8d: 8a1e864b               mov      bl, byte ptr [0x4b86]
6a91: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
6a95: 22c0                   and      al, al
6a97: 7845                   js       0x6ade
6a99: c687dd5880             mov      byte ptr [bx + 0x58dd], 0x80
6a9e: 3a1ed94a               cmp      bl, byte ptr [0x4ad9]
6aa2: 7308                   jae      0x6aac
6aa4: c687bd5880             mov      byte ptr [bx + 0x58bd], 0x80
6aa9: eb33                   jmp      0x6ade
6aab: 90                     nop      
6aac: 32ff                   xor      bh, bh
6aae: 8bc3                   mov      ax, bx
6ab0: d0e0                   shl      al, 1
6ab2: d0e0                   shl      al, 1
6ab4: 1206564b               adc      al, byte ptr [0x4b56]
6ab8: 8bf8                   mov      di, ax
6aba: e8170e                 call     0x78d4
6abd: e8a0da                 call     0x4560
6ac0: e831dc                 call     0x46f4
6ac3: 8ac3                   mov      al, bl
6ac5: 32068d4b               xor      al, byte ptr [0x4b8d]
6ac9: 2402                   and      al, 2
6acb: 7503                   jne      0x6ad0
6acd: e8b900                 call     0x6b89
6ad0: 32ff                   xor      bh, bh
6ad2: 8bc3                   mov      ax, bx
6ad4: 8bf8                   mov      di, ax
6ad6: 81e70100               and      di, 1
6ada: 8885824b               mov      byte ptr [di + 0x4b82], al
6ade: fec3                   inc      bl
6ae0: 3a1e554b               cmp      bl, byte ptr [0x4b55]
6ae4: 75ab                   jne      0x6a91
6ae6: eb79                   jmp      0x6b61
6ae8: 90                     nop      
6ae9: 8b3e504b               mov      di, word ptr [0x4b50]
6aed: 32ff                   xor      bh, bh
6aef: 8a16554b               mov      dl, byte ptr [0x4b55]
6af3: feca                   dec      dl
6af5: d0e2                   shl      dl, 1
6af7: d0e2                   shl      dl, 1
6af9: 8a05                   mov      al, byte ptr [di]
6afb: 33ff                   xor      di, di
6afd: 0407                   add      al, 7
6aff: 02c2                   add      al, dl
6b01: a2574b                 mov      byte ptr [0x4b57], al
6b04: a2564b                 mov      byte ptr [0x4b56], al
6b07: 8a1e864b               mov      bl, byte ptr [0x4b86]
6b0b: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
6b0f: 22c0                   and      al, al
6b11: 7846                   js       0x6b59
6b13: c687dd5880             mov      byte ptr [bx + 0x58dd], 0x80
6b18: 3a1ed94a               cmp      bl, byte ptr [0x4ad9]
6b1c: 7308                   jae      0x6b26
6b1e: c687bd5880             mov      byte ptr [bx + 0x58bd], 0x80
6b23: eb34                   jmp      0x6b59
6b25: 90                     nop      
6b26: 8ad3                   mov      dl, bl
6b28: d0e2                   shl      dl, 1
6b2a: d0e2                   shl      dl, 1
6b2c: a0564b                 mov      al, byte ptr [0x4b56]
6b2f: 2ac2                   sub      al, dl
6b31: 32e4                   xor      ah, ah
6b33: 8bf8                   mov      di, ax
6b35: e89c0d                 call     0x78d4
6b38: e825da                 call     0x4560
6b3b: e8b6db                 call     0x46f4
6b3e: 8ac3                   mov      al, bl
6b40: 32068d4b               xor      al, byte ptr [0x4b8d]
6b44: 2402                   and      al, 2
6b46: 7503                   jne      0x6b4b
6b48: e83e00                 call     0x6b89
6b4b: 32ff                   xor      bh, bh
6b4d: 8bc3                   mov      ax, bx
6b4f: 8bf8                   mov      di, ax
6b51: 81e70100               and      di, 1
6b55: 8885824b               mov      byte ptr [di + 0x4b82], al
6b59: fec3                   inc      bl
6b5b: 3a1e554b               cmp      bl, byte ptr [0x4b55]
6b5f: 75aa                   jne      0x6b0b
6b61: 32ff                   xor      bh, bh
6b63: 8b878b57               mov      ax, word ptr [bx + 0x578b]
6b67: a3ab57                 mov      word ptr [0x57ab], ax
6b6a: 8b872358               mov      ax, word ptr [bx + 0x5823]
6b6e: a34358                 mov      word ptr [0x5843], ax
6b71: 8a1e864b               mov      bl, byte ptr [0x4b86]
6b75: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
6b79: 22c0                   and      al, al
6b7b: 7803                   js       0x6b80
6b7d: e865dd                 call     0x48e5
6b80: fec3                   inc      bl
6b82: 3a1e554b               cmp      bl, byte ptr [0x4b55]
6b86: 75ed                   jne      0x6b75
6b88: c3                     ret      
6b89: 32ff                   xor      bh, bh
6b8b: 8bfb                   mov      di, bx
6b8d: 81e70100               and      di, 1
6b91: 8a85824b               mov      al, byte ptr [di + 0x4b82]
6b95: 22c0                   and      al, al
6b97: 785e                   js       0x6bf7
6b99: 8ae7                   mov      ah, bh
6b9b: 8bf8                   mov      di, ax
6b9d: 83ff02                 cmp      di, 2
6ba0: 7303                   jae      0x6ba5
6ba2: 83c71e                 add      di, 0x1e
6ba5: f6c301                 test     bl, 1
6ba8: 7515                   jne      0x6bbf
6baa: 8a878d57               mov      al, byte ptr [bx + 0x578d]
6bae: 2a858d57               sub      al, byte ptr [di + 0x578d]
6bb2: 8a872558               mov      al, byte ptr [bx + 0x5825]
6bb6: 1a852558               sbb      al, byte ptr [di + 0x5825]
6bba: 793b                   jns      0x6bf7
6bbc: eb13                   jmp      0x6bd1
6bbe: 90                     nop      
6bbf: 8a858d57               mov      al, byte ptr [di + 0x578d]
6bc3: 2a878d57               sub      al, byte ptr [bx + 0x578d]
6bc7: 8a852558               mov      al, byte ptr [di + 0x5825]
6bcb: 1a872558               sbb      al, byte ptr [bx + 0x5825]
6bcf: 7926                   jns      0x6bf7
6bd1: b002                   mov      al, 2
6bd3: 8887dd58               mov      byte ptr [bx + 0x58dd], al
6bd7: 88bf1d59               mov      byte ptr [bx + 0x591d], bh
6bdb: 8a872558               mov      al, byte ptr [bx + 0x5825]
6bdf: 88874558               mov      byte ptr [bx + 0x5845], al
6be3: 8a878d57               mov      al, byte ptr [bx + 0x578d]
6be7: 8887ad57               mov      byte ptr [bx + 0x57ad], al
6beb: 80cb20                 or       bl, 0x20
6bee: e803db                 call     0x46f4
6bf1: e8e7dc                 call     0x48db
6bf4: 80e31f                 and      bl, 0x1f
6bf7: c3                     ret      
6bf8: a0b654                 mov      al, byte ptr [0x54b6]
6bfb: 32ff                   xor      bh, bh
6bfd: 22c0                   and      al, al
6bff: 7843                   js       0x6c44
6c01: 8a1e554b               mov      bl, byte ptr [0x4b55]
6c05: bf0100                 mov      di, 1
6c08: fecb                   dec      bl
6c0a: 8a878d57               mov      al, byte ptr [bx + 0x578d]
6c0e: 88858d57               mov      byte ptr [di + 0x578d], al
6c12: 8a872558               mov      al, byte ptr [bx + 0x5825]
6c16: 88852558               mov      byte ptr [di + 0x5825], al
6c1a: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
6c1e: 8885d957               mov      byte ptr [di + 0x57d9], al
6c22: 8a877158               mov      al, byte ptr [bx + 0x5871]
6c26: 88857158               mov      byte ptr [di + 0x5871], al
6c2a: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
6c2e: 8885bd58               mov      byte ptr [di + 0x58bd], al
6c32: 8a87fd58               mov      al, byte ptr [bx + 0x58fd]
6c36: 8885fd58               mov      byte ptr [di + 0x58fd], al
6c3a: 4f                     dec      di
6c3b: 79cb                   jns      0x6c08
6c3d: c706824b0001           mov      word ptr [0x4b82], 0x100
6c43: c3                     ret      
6c44: c606864b00             mov      byte ptr [0x4b86], 0
6c49: c3                     ret      
6c4a: b02a                   mov      al, 0x2a
6c4c: 2a06894b               sub      al, byte ptr [0x4b89]
6c50: 7902                   jns      0x6c54
6c52: 32c0                   xor      al, al
6c54: 8af0                   mov      dh, al
6c56: 8026b754ff             and      byte ptr [0x54b7], 0xff
6c5b: 7912                   jns      0x6c6f
6c5d: a0554b                 mov      al, byte ptr [0x4b55]
6c60: d0e8                   shr      al, 1
6c62: 2ac6                   sub      al, dh
6c64: 7902                   jns      0x6c68
6c66: 32c0                   xor      al, al
6c68: 8af0                   mov      dh, al
6c6a: b201                   mov      dl, 1
6c6c: eb03                   jmp      0x6c71
6c6e: 90                     nop      
6c6f: 32d2                   xor      dl, dl
6c71: a0774b                 mov      al, byte ptr [0x4b77]
6c74: 0006894b               add      byte ptr [0x4b89], al
6c78: 32c0                   xor      al, al
6c7a: 8af8                   mov      bh, al
6c7c: 8a1e1f4b               mov      bl, byte ptr [0x4b1f]
6c80: 8a26e04a               mov      ah, byte ptr [0x4ae0]
6c84: 3a267356               cmp      ah, byte ptr [0x5673]
6c88: 7502                   jne      0x6c8c
6c8a: fec0                   inc      al
6c8c: 88873d59               mov      byte ptr [bx + 0x593d], al
6c90: 33ed                   xor      bp, bp
6c92: 8b364e4b               mov      si, word ptr [0x4b4e]
6c96: 8b3e804b               mov      di, word ptr [0x4b80]
6c9a: 32ff                   xor      bh, bh
6c9c: 8a1e864b               mov      bl, byte ptr [0x4b86]
6ca0: 22db                   and      bl, bl
6ca2: 7520                   jne      0x6cc4
6ca4: 8bcd                   mov      cx, bp
6ca6: 8026594bff             and      byte ptr [0x4b59], 0xff
6cab: 790d                   jns      0x6cba
6cad: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6cb0: 22c0                   and      al, al
6cb2: 7803                   js       0x6cb7
6cb4: e99d00                 jmp      0x6d54
6cb7: e99500                 jmp      0x6d4f
6cba: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6cbd: 22c0                   and      al, al
6cbf: 782c                   js       0x6ced
6cc1: eb2f                   jmp      0x6cf2
6cc3: 90                     nop      
6cc4: bd0100                 mov      bp, 1
6cc7: 8bcd                   mov      cx, bp
6cc9: 8026594bff             and      byte ptr [0x4b59], 0xff
6cce: 7903                   jns      0x6cd3
6cd0: eb61                   jmp      0x6d33
6cd2: 90                     nop      
6cd3: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6cd6: 22c0                   and      al, al
6cd8: 7813                   js       0x6ced
6cda: 8bc5                   mov      ax, bp
6cdc: 3ac6                   cmp      al, dh
6cde: 9f                     lahf     
6cdf: 32e2                   xor      ah, dl
6ce1: 9e                     sahf     
6ce2: 720e                   jb       0x6cf2
6ce4: c787bd588080           mov      word ptr [bx + 0x58bd], 0x8080
6cea: eb38                   jmp      0x6d24
6cec: 90                     nop      
6ced: c6873d5900             mov      byte ptr [bx + 0x593d], 0
6cf2: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6cf5: d0e0                   shl      al, 1
6cf7: 24e0                   and      al, 0xe0
6cf9: 3e8a22                 mov      ah, byte ptr ds:[bp + si]
6cfc: 80e40f                 and      ah, 0xf
6cff: 0306e84a               add      ax, word ptr [0x4ae8]
6d03: 8887fd58               mov      byte ptr [bx + 0x58fd], al
6d07: 88a7bd58               mov      byte ptr [bx + 0x58bd], ah
6d0b: 3e8a03                 mov      al, byte ptr ds:[bp + di]
6d0e: d0e0                   shl      al, 1
6d10: 24e0                   and      al, 0xe0
6d12: 3e8a23                 mov      ah, byte ptr ds:[bp + di]
6d15: 80e40f                 and      ah, 0xf
6d18: 0306ea4a               add      ax, word ptr [0x4aea]
6d1c: 8887fe58               mov      byte ptr [bx + 0x58fe], al
6d20: 88a7be58               mov      byte ptr [bx + 0x58be], ah
6d24: 45                     inc      bp
6d25: 80c302                 add      bl, 2
6d28: 3a1e1f4b               cmp      bl, byte ptr [0x4b1f]
6d2c: 72a5                   jb       0x6cd3
6d2e: 74c2                   je       0x6cf2
6d30: eb61                   jmp      0x6d93
6d32: 90                     nop      
6d33: 8be9                   mov      bp, cx
6d35: d1e5                   shl      bp, 1
6d37: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6d3a: 22c0                   and      al, al
6d3c: 7811                   js       0x6d4f
6d3e: 3ace                   cmp      cl, dh
6d40: 9f                     lahf     
6d41: 32e2                   xor      ah, dl
6d43: 9e                     sahf     
6d44: 720e                   jb       0x6d54
6d46: c787bd588080           mov      word ptr [bx + 0x58bd], 0x8080
6d4c: eb32                   jmp      0x6d80
6d4e: 90                     nop      
6d4f: c6873d5900             mov      byte ptr [bx + 0x593d], 0
6d54: 3e8a4201               mov      al, byte ptr ds:[bp + si + 1]
6d58: 3e8a22                 mov      ah, byte ptr ds:[bp + si]
6d5b: 80e47f                 and      ah, 0x7f
6d5e: 0306e84a               add      ax, word ptr [0x4ae8]
6d62: 8887fd58               mov      byte ptr [bx + 0x58fd], al
6d66: 88a7bd58               mov      byte ptr [bx + 0x58bd], ah
6d6a: 3e8a4301               mov      al, byte ptr ds:[bp + di + 1]
6d6e: 3e8a23                 mov      ah, byte ptr ds:[bp + di]
6d71: 80e47f                 and      ah, 0x7f
6d74: 0306ea4a               add      ax, word ptr [0x4aea]
6d78: 8887fe58               mov      byte ptr [bx + 0x58fe], al
6d7c: 88a7be58               mov      byte ptr [bx + 0x58be], ah
6d80: fec1                   inc      cl
6d82: 80c302                 add      bl, 2
6d85: 3a1e1f4b               cmp      bl, byte ptr [0x4b1f]
6d89: 72a8                   jb       0x6d33
6d8b: 7507                   jne      0x6d94
6d8d: 8be9                   mov      bp, cx
6d8f: d1e5                   shl      bp, 1
6d91: ebc1                   jmp      0x6d54
6d93: 4d                     dec      bp
6d94: 3e8a02                 mov      al, byte ptr ds:[bp + si]
6d97: 22c0                   and      al, al
6d99: 7904                   jns      0x6d9f
6d9b: 88873b59               mov      byte ptr [bx + 0x593b], al
6d9f: c3                     ret      
6da0: a10a00                 mov      ax, word ptr [0xa]
6da3: 8ec0                   mov      es, ax
6da5: b80308                 mov      ax, 0x803
6da8: bace03                 mov      dx, 0x3ce
6dab: ef                     out      dx, ax
6dac: b001                   mov      al, 1
6dae: f606b55440             test     byte ptr [0x54b5], 0x40
6db3: 7402                   je       0x6db7
6db5: 3401                   xor      al, 1
6db7: a2834b                 mov      byte ptr [0x4b83], al
6dba: 8ad8                   mov      bl, al
6dbc: 3401                   xor      al, 1
6dbe: a2824b                 mov      byte ptr [0x4b82], al
6dc1: 80c302                 add      bl, 2
6dc4: 881e7c4b               mov      byte ptr [0x4b7c], bl
6dc8: c606574b01             mov      byte ptr [0x4b57], 1
6dcd: a0884b                 mov      al, byte ptr [0x4b88]
6dd0: 3c28                   cmp      al, 0x28
6dd2: 7204                   jb       0x6dd8
6dd4: 32db                   xor      bl, bl
6dd6: 740b                   je       0x6de3
6dd8: a07c4b                 mov      al, byte ptr [0x4b7c]
6ddb: 32068d4b               xor      al, byte ptr [0x4b8d]
6ddf: 2402                   and      al, 2
6de1: 8ad8                   mov      bl, al
6de3: e8ec12                 call     0x80d2
6de6: a07c4b                 mov      al, byte ptr [0x4b7c]
6de9: d0e8                   shr      al, 1
6deb: fec8                   dec      al
6ded: 3a065a4b               cmp      al, byte ptr [0x4b5a]
6df1: 750c                   jne      0x6dff
6df3: a05d4b                 mov      al, byte ptr [0x4b5d]
6df6: 3a06e04a               cmp      al, byte ptr [0x4ae0]
6dfa: 7503                   jne      0x6dff
6dfc: e8029a                 call     0x801
6dff: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6e03: 32ff                   xor      bh, bh
6e05: 80a7bd58ff             and      byte ptr [bx + 0x58bd], 0xff
6e0a: 7849                   js       0x6e55
6e0c: 80a7dd58ff             and      byte ptr [bx + 0x58dd], 0xff
6e11: 7826                   js       0x6e39
6e13: 8026e954ff             and      byte ptr [0x54e9], 0xff
6e18: 791c                   jns      0x6e36
6e1a: f6c301                 test     bl, 1
6e1d: 7410                   je       0x6e2f
6e1f: 80263253ff             and      byte ptr [0x5332], 0xff
6e24: 7810                   js       0x6e36
6e26: e88a00                 call     0x6eb3
6e29: e8a000                 call     0x6ecc
6e2c: eb0e                   jmp      0x6e3c
6e2e: 90                     nop      
6e2f: 80263253ff             and      byte ptr [0x5332], 0xff
6e34: 78f0                   js       0x6e26
6e36: e89300                 call     0x6ecc
6e39: e87700                 call     0x6eb3
6e3c: 8b3e574b               mov      di, word ptr [0x4b57]
6e40: 81e7ff00               and      di, 0xff
6e44: a07c4b                 mov      al, byte ptr [0x4b7c]
6e47: 8885824b               mov      byte ptr [di + 0x4b82], al
6e4b: a0fd41                 mov      al, byte ptr [0x41fd]
6e4e: 22c0                   and      al, al
6e50: 7903                   jns      0x6e55
6e52: e8cd99                 call     0x822
6e55: 80367c4b01             xor      byte ptr [0x4b7c], 1
6e5a: fe0e574b               dec      byte ptr [0x4b57]
6e5e: 799f                   jns      0x6dff
6e60: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6e64: 32ff                   xor      bh, bh
6e66: 8bfb                   mov      di, bx
6e68: 81e7fe00               and      di, 0xfe
6e6c: 8a853d59               mov      al, byte ptr [di + 0x593d]
6e70: 22c0                   and      al, al
6e72: 781e                   js       0x6e92
6e74: 2401                   and      al, 1
6e76: 8ad8                   mov      bl, al
6e78: c6853d5980             mov      byte ptr [di + 0x593d], 0x80
6e7d: e85212                 call     0x80d2
6e80: e829ef                 call     0x5dac
6e83: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6e87: 32ff                   xor      bh, bh
6e89: 8bfb                   mov      di, bx
6e8b: 81f70100               xor      di, 1
6e8f: e81f11                 call     0x7fb1
6e92: fe06884b               inc      byte ptr [0x4b88]
6e96: a07c4b                 mov      al, byte ptr [0x4b7c]
6e99: 0402                   add      al, 2
6e9b: a27c4b                 mov      byte ptr [0x4b7c], al
6e9e: 3a06554b               cmp      al, byte ptr [0x4b55]
6ea2: 7303                   jae      0x6ea7
6ea4: e921ff                 jmp      0x6dc8
6ea7: bace03                 mov      dx, 0x3ce
6eaa: b80300                 mov      ax, 3
6ead: ef                     out      dx, ax
6eae: 8cd8                   mov      ax, ds
6eb0: 8ec0                   mov      es, ax
6eb2: c3                     ret      
6eb3: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6eb7: 32ff                   xor      bh, bh
6eb9: 8b3e574b               mov      di, word ptr [0x4b57]
6ebd: 81e7ff00               and      di, 0xff
6ec1: 8a85824b               mov      al, byte ptr [di + 0x4b82]
6ec5: 8ae7                   mov      ah, bh
6ec7: 8bf8                   mov      di, ax
6ec9: e9e510                 jmp      0x7fb1
6ecc: a0b854                 mov      al, byte ptr [0x54b8]
6ecf: 50                     push     ax
6ed0: 33db                   xor      bx, bx
6ed2: e8fd11                 call     0x80d2
6ed5: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6ed9: 32ff                   xor      bh, bh
6edb: 8bfb                   mov      di, bx
6edd: 81cf2000               or       di, 0x20
6ee1: e8cd10                 call     0x7fb1
6ee4: 5b                     pop      bx
6ee5: e9ea11                 jmp      0x80d2
6ee8: 32ff                   xor      bh, bh
6eea: 8a1ed94a               mov      bl, byte ptr [0x4ad9]
6eee: c606574b02             mov      byte ptr [0x4b57], 2
6ef3: 8a872558               mov      al, byte ptr [bx + 0x5825]
6ef7: 22c0                   and      al, al
6ef9: 751e                   jne      0x6f19
6efb: 8a878d57               mov      al, byte ptr [bx + 0x578d]
6eff: 3c40                   cmp      al, 0x40
6f01: 7216                   jb       0x6f19
6f03: 3cc0                   cmp      al, 0xc0
6f05: 7312                   jae      0x6f19
6f07: 8a877158               mov      al, byte ptr [bx + 0x5871]
6f0b: 22c0                   and      al, al
6f0d: 7813                   js       0x6f22
6f0f: 7508                   jne      0x6f19
6f11: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
6f15: 3cc0                   cmp      al, 0xc0
6f17: 7209                   jb       0x6f22
6f19: fec3                   inc      bl
6f1b: fe0e574b               dec      byte ptr [0x4b57]
6f1f: 75d2                   jne      0x6ef3
6f21: c3                     ret      
6f22: 881e7c4b               mov      byte ptr [0x4b7c], bl
6f26: 8bc3                   mov      ax, bx
6f28: 2401                   and      al, 1
6f2a: a27d4b                 mov      byte ptr [0x4b7d], al
6f2d: 8bf8                   mov      di, ax
6f2f: 8a85a354               mov      al, byte ptr [di + 0x54a3]
6f33: 8887bb58               mov      byte ptr [bx + 0x58bb], al
6f37: a0454b                 mov      al, byte ptr [0x4b45]
6f3a: e8f7a3                 call     0x1334
6f3d: 8a1e7d4b               mov      bl, byte ptr [0x4b7d]
6f41: bf0400                 mov      di, 4
6f44: a0444b                 mov      al, byte ptr [0x4b44]
6f47: e8159e                 call     0xd5f
6f4a: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6f4e: 8a87fd58               mov      al, byte ptr [bx + 0x58fd]
6f52: 8aa7bd58               mov      ah, byte ptr [bx + 0x58bd]
6f56: 2a87fb58               sub      al, byte ptr [bx + 0x58fb]
6f5a: 1aa7bb58               sbb      ah, byte ptr [bx + 0x58bb]
6f5e: 8a16444b               mov      dl, byte ptr [0x4b44]
6f62: 32f6                   xor      dh, dh
6f64: f7ea                   imul     dx
6f66: 22c0                   and      al, al
6f68: 8ac4                   mov      al, ah
6f6a: 8ae2                   mov      ah, dl
6f6c: 7405                   je       0x6f73
6f6e: 22f6                   and      dh, dh
6f70: 7901                   jns      0x6f73
6f72: 40                     inc      ax
6f73: 0087fb58               add      byte ptr [bx + 0x58fb], al
6f77: 10a7bb58               adc      byte ptr [bx + 0x58bb], ah
6f7b: 80eb02                 sub      bl, 2
6f7e: bf0400                 mov      di, 4
6f81: e8e99d                 call     0xd6d
6f84: 8a1e7c4b               mov      bl, byte ptr [0x4b7c]
6f88: eb8f                   jmp      0x6f19
6f8a: a0d854                 mov      al, byte ptr [0x54d8]
6f8d: 3a06d74a               cmp      al, byte ptr [0x4ad7]
6f91: 7701                   ja       0x6f94
6f93: c3                     ret      
6f94: e878f3                 call     0x630f
6f97: fe06d74a               inc      byte ptr [0x4ad7]
6f9b: e85adc                 call     0x4bf8
6f9e: 8a2620c0               mov      ah, byte ptr [0xc020]
6fa2: d0e8                   shr      al, 1
6fa4: 7321                   jae      0x6fc7
6fa6: d0e8                   shr      al, 1
6fa8: 7310                   jae      0x6fba
6faa: 80fc05                 cmp      ah, 5
6fad: 7206                   jb       0x6fb5
6faf: d0e8                   shr      al, 1
6fb1: 7207                   jb       0x6fba
6fb3: fecc                   dec      ah
6fb5: fec4                   inc      ah
6fb7: eb0e                   jmp      0x6fc7
6fb9: 90                     nop      
6fba: 80fc03                 cmp      ah, 3
6fbd: 7306                   jae      0x6fc5
6fbf: d0e8                   shr      al, 1
6fc1: 73f2                   jae      0x6fb5
6fc3: fec4                   inc      ah
6fc5: fecc                   dec      ah
6fc7: 882620c0               mov      byte ptr [0xc020], ah
6fcb: a0d74a                 mov      al, byte ptr [0x4ad7]
6fce: 3c78                   cmp      al, 0x78
6fd0: 720e                   jb       0x6fe0
6fd2: fe0ed74a               dec      byte ptr [0x4ad7]
6fd6: b80500                 mov      ax, 5
6fd9: bace03                 mov      dx, 0x3ce
6fdc: ef                     out      dx, ax
6fdd: e998b3                 jmp      0x2378
6fe0: d0e8                   shr      al, 1
6fe2: d0e8                   shr      al, 1
6fe4: 98                     cwde     
6fe5: 8bf8                   mov      di, ax
6fe7: 8a1ed74a               mov      bl, byte ptr [0x4ad7]
6feb: 80e303                 and      bl, 3
6fee: 8afc                   mov      bh, ah
6ff0: bac403                 mov      dx, 0x3c4
6ff3: b8020f                 mov      ax, 0xf02
6ff6: ef                     out      dx, ax
6ff7: bace03                 mov      dx, 0x3ce
6ffa: b80308                 mov      ax, 0x803
6ffd: ef                     out      dx, ax
6ffe: a020c0                 mov      al, byte ptr [0xc020]
7001: 98                     cwde     
7002: 8bf8                   mov      di, ax
7004: d1e7                   shl      di, 1
7006: 8bbd7048               mov      di, word ptr [di + 0x4870]
700a: 83c705                 add      di, 5
700d: a0d74a                 mov      al, byte ptr [0x4ad7]
7010: d0e8                   shr      al, 1
7012: d0e8                   shr      al, 1
7014: 03f8                   add      di, ax
7016: 268a05                 mov      al, byte ptr es:[di]
7019: 32ff                   xor      bh, bh
701b: 228725c0               and      al, byte ptr [bx - 0x3fdb]
701f: 7454                   je       0x7075
7021: 8a8721c0               mov      al, byte ptr [bx - 0x3fdf]
7025: 268805                 mov      byte ptr es:[di], al
7028: 2688850020             mov      byte ptr es:[di + 0x2000], al
702d: 268a45b0               mov      al, byte ptr es:[di - 0x50]
7031: 8a8721c0               mov      al, byte ptr [bx - 0x3fdf]
7035: 268845b0               mov      byte ptr es:[di - 0x50], al
7039: 268885b01f             mov      byte ptr es:[di + 0x1fb0], al
703e: 268a45d8               mov      al, byte ptr es:[di - 0x28]
7042: 8a8721c0               mov      al, byte ptr [bx - 0x3fdf]
7046: 268845d8               mov      byte ptr es:[di - 0x28], al
704a: 268885d81f             mov      byte ptr es:[di + 0x1fd8], al
704f: b80310                 mov      ax, 0x1003
7052: ef                     out      dx, ax
7053: bac403                 mov      dx, 0x3c4
7056: b8020c                 mov      ax, 0xc02
7059: ef                     out      dx, ax
705a: 268a45b0               mov      al, byte ptr es:[di - 0x50]
705e: 8a8725c0               mov      al, byte ptr [bx - 0x3fdb]
7062: 268845b0               mov      byte ptr es:[di - 0x50], al
7066: 268885b01f             mov      byte ptr es:[di + 0x1fb0], al
706b: b80300                 mov      ax, 3
706e: bace03                 mov      dx, 0x3ce
7071: ef                     out      dx, ax
7072: e915ff                 jmp      0x6f8a
7075: fe06d854               inc      byte ptr [0x54d8]
7079: 7903                   jns      0x707e
707b: e958ff                 jmp      0x6fd6
707e: e80300                 call     0x7084
7081: e906ff                 jmp      0x6f8a
7084: bf0200                 mov      di, 2
7087: a0d854                 mov      al, byte ptr [0x54d8]
708a: d0e0                   shl      al, 1
708c: 8885d054               mov      byte ptr [di + 0x54d0], al
7090: 4f                     dec      di
7091: 79f4                   jns      0x7087
7093: c3                     ret      
7094: a0e14a                 mov      al, byte ptr [0x4ae1]
7097: 22c0                   and      al, al
7099: 7513                   jne      0x70ae
709b: a07754                 mov      al, byte ptr [0x5477]
709e: 3c5f                   cmp      al, 0x5f
70a0: 7418                   je       0x70ba
70a2: 2a067854               sub      al, byte ptr [0x5478]
70a6: a27754                 mov      byte ptr [0x5477], al
70a9: 8006785408             add      byte ptr [0x5478], 8
70ae: b81400                 mov      ax, 0x14
70b1: e80700                 call     0x70bb
70b4: b86400                 mov      ax, 0x64
70b7: e80100                 call     0x70bb
70ba: c3                     ret      
70bb: a2084b                 mov      byte ptr [0x4b08], al
70be: 8b3e7754               mov      di, word ptr [0x5477]
70c2: 81e7ff00               and      di, 0xff
70c6: 32e4                   xor      ah, ah
70c8: d1e8                   shr      ax, 1
70ca: d1e8                   shr      ax, 1
70cc: d1e7                   shl      di, 1
70ce: 8bbd1048               mov      di, word ptr [di + 0x4810]
70d2: 83c704                 add      di, 4
70d5: 03f8                   add      di, ax
70d7: a10a00                 mov      ax, word ptr [0xa]
70da: 8ec0                   mov      es, ax
70dc: bace03                 mov      dx, 0x3ce
70df: b91000                 mov      cx, 0x10
70e2: b3c4                   mov      bl, 0xc4
70e4: be89c4                 mov      si, 0xc489
70e7: bd2a00                 mov      bp, 0x2a
70ea: b8020f                 mov      ax, 0xf02
70ed: 8ad3                   mov      dl, bl
70ef: ef                     out      dx, ax
70f0: 268a25                 mov      ah, byte ptr es:[di]
70f3: 8a24                   mov      ah, byte ptr [si]
70f5: 46                     inc      si
70f6: b008                   mov      al, 8
70f8: b2ce                   mov      dl, 0xce
70fa: ef                     out      dx, ax
70fb: f6d4                   not      ah
70fd: 268825                 mov      byte ptr es:[di], ah
7100: b80203                 mov      ax, 0x302
7103: 8ad3                   mov      dl, bl
7105: ef                     out      dx, ax
7106: 8a24                   mov      ah, byte ptr [si]
7108: 46                     inc      si
7109: 268825                 mov      byte ptr es:[di], ah
710c: 47                     inc      di
710d: b8020f                 mov      ax, 0xf02
7110: 8ad3                   mov      dl, bl
7112: ef                     out      dx, ax
7113: 268a25                 mov      ah, byte ptr es:[di]
7116: 8a24                   mov      ah, byte ptr [si]
7118: 46                     inc      si
7119: b008                   mov      al, 8
711b: b2ce                   mov      dl, 0xce
711d: ef                     out      dx, ax
711e: f6d4                   not      ah
7120: 268825                 mov      byte ptr es:[di], ah
7123: b80203                 mov      ax, 0x302
7126: 8ad3                   mov      dl, bl
7128: ef                     out      dx, ax
7129: 8a24                   mov      ah, byte ptr [si]
712b: 46                     inc      si
712c: 268825                 mov      byte ptr es:[di], ah
712f: 47                     inc      di
7130: 2bfd                   sub      di, bp
7132: 81ff8002               cmp      di, 0x280
7136: 7204                   jb       0x713c
7138: e2b0                   loop     0x70ea
713a: eba3                   jmp      0x70df
713c: b808ff                 mov      ax, 0xff08
713f: b2ce                   mov      dl, 0xce
7141: ef                     out      dx, ax
7142: b8020f                 mov      ax, 0xf02
7145: b2c4                   mov      dl, 0xc4
7147: ef                     out      dx, ax
7148: 8cd8                   mov      ax, ds
714a: 8ec0                   mov      es, ax
714c: c3                     ret      
714d: bac403                 mov      dx, 0x3c4
7150: b80204                 mov      ax, 0x402
7153: ef                     out      dx, ax
7154: a10a00                 mov      ax, word ptr [0xa]
7157: 8ec0                   mov      es, ax
7159: bd4000                 mov      bp, 0x40
715c: bf50c5                 mov      di, 0xc550
715f: 8a05                   mov      al, byte ptr [di]
7161: b97f00                 mov      cx, 0x7f
7164: 47                     inc      di
7165: 3a05                   cmp      al, byte ptr [di]
7167: 7602                   jbe      0x716b
7169: 8a05                   mov      al, byte ptr [di]
716b: e2f7                   loop     0x7164
716d: 3c40                   cmp      al, 0x40
716f: 7625                   jbe      0x7196
7171: 32e4                   xor      ah, ah
7173: 8bf0                   mov      si, ax
7175: 8be8                   mov      bp, ax
7177: d1e0                   shl      ax, 1
7179: 8bf8                   mov      di, ax
717b: 8bbd0e48               mov      di, word ptr [di + 0x480e]
717f: 83c704                 add      di, 4
7182: 83ee40                 sub      si, 0x40
7185: 33c0                   xor      ax, ax
7187: bb1000                 mov      bx, 0x10
718a: ba4800                 mov      dx, 0x48
718d: 8bcb                   mov      cx, bx
718f: f3ab                   rep stosw word ptr es:[di], ax
7191: 2bfa                   sub      di, dx
7193: 4e                     dec      si
7194: 75f7                   jne      0x718d
7196: bace03                 mov      dx, 0x3ce
7199: b80308                 mov      ax, 0x803
719c: ef                     out      dx, ax
719d: be50c5                 mov      si, 0xc550
71a0: ba0400                 mov      dx, 4
71a3: ad                     lodsw    ax, word ptr [si]
71a4: 8b0c                   mov      cx, word ptr [si]
71a6: 83c602                 add      si, 2
71a9: 8bd8                   mov      bx, ax
71ab: 3ac7                   cmp      al, bh
71ad: 7302                   jae      0x71b1
71af: 8ac7                   mov      al, bh
71b1: 3ac1                   cmp      al, cl
71b3: 7302                   jae      0x71b7
71b5: 8ac1                   mov      al, cl
71b7: 3ac5                   cmp      al, ch
71b9: 7302                   jae      0x71bd
71bb: 8ac5                   mov      al, ch
71bd: 3c40                   cmp      al, 0x40
71bf: 7643                   jbe      0x7204
71c1: 3cc0                   cmp      al, 0xc0
71c3: 7202                   jb       0x71c7
71c5: b0bf                   mov      al, 0xbf
71c7: 32e4                   xor      ah, ah
71c9: 8bf8                   mov      di, ax
71cb: d1e7                   shl      di, 1
71cd: 8bbd0e48               mov      di, word ptr [di + 0x480e]
71d1: 03fa                   add      di, dx
71d3: 268a25                 mov      ah, byte ptr es:[di]
71d6: b4ff                   mov      ah, 0xff
71d8: 3ac3                   cmp      al, bl
71da: 7703                   ja       0x71df
71dc: 80e43f                 and      ah, 0x3f
71df: 3ac7                   cmp      al, bh
71e1: 7703                   ja       0x71e6
71e3: 80e4cf                 and      ah, 0xcf
71e6: 3ac1                   cmp      al, cl
71e8: 7703                   ja       0x71ed
71ea: 80e4f3                 and      ah, 0xf3
71ed: 3ac5                   cmp      al, ch
71ef: 7703                   ja       0x71f4
71f1: 80e4fc                 and      ah, 0xfc
71f4: 22e4                   and      ah, ah
71f6: 7426                   je       0x721e
71f8: 268825                 mov      byte ptr es:[di], ah
71fb: 83ef28                 sub      di, 0x28
71fe: fec8                   dec      al
7200: 3c40                   cmp      al, 0x40
7202: 77cf                   ja       0x71d3
7204: fec2                   inc      dl
7206: 80fa24                 cmp      dl, 0x24
7209: 7298                   jb       0x71a3
720b: bace03                 mov      dx, 0x3ce
720e: b80300                 mov      ax, 3
7211: ef                     out      dx, ax
7212: bac403                 mov      dx, 0x3c4
7215: b8020f                 mov      ax, 0xf02
7218: ef                     out      dx, ax
7219: 8cd8                   mov      ax, ds
721b: 8ec0                   mov      es, ax
721d: c3                     ret      
721e: 268825                 mov      byte ptr es:[di], ah
7221: 83ef28                 sub      di, 0x28
7224: fec8                   dec      al
7226: 3bc5                   cmp      ax, bp
7228: 77f4                   ja       0x721e
722a: ebd8                   jmp      0x7204
722c: 0000                   add      byte ptr [bx + si], al
722e: 0000                   add      byte ptr [bx + si], al
7230: 8a1ee04a               mov      bl, byte ptr [0x4ae0]
7234: 32ff                   xor      bh, bh
7236: e856bf                 call     0x318f
7239: e80ec0                 call     0x324a
723c: a0254b                 mov      al, byte ptr [0x4b25]
723f: 2a06cf4a               sub      al, byte ptr [0x4acf]
7243: a2f34a                 mov      byte ptr [0x4af3], al
7246: a0694b                 mov      al, byte ptr [0x4b69]
7249: 22c0                   and      al, al
724b: 7903                   jns      0x7250
724d: eb74                   jmp      0x72c3
724f: 90                     nop      
7250: d0e0                   shl      al, 1
7252: 7820                   js       0x7274
7254: e81804                 call     0x766f
7257: 8b3e504b               mov      di, word ptr [0x4b50]
725b: a10c4b                 mov      ax, word ptr [0x4b0c]
725e: 2b4502                 sub      ax, word ptr [di + 2]
7261: a36e4b                 mov      word ptr [0x4b6e], ax
7264: a10e4b                 mov      ax, word ptr [0x4b0e]
7267: a36a4b                 mov      word ptr [0x4b6a], ax
726a: 8a26cf4a               mov      ah, byte ptr [0x4acf]
726e: 8ac7                   mov      al, bh
7270: a39453                 mov      word ptr [0x5394], ax
7273: c3                     ret      
7274: e8f803                 call     0x766f
7277: a10c4b                 mov      ax, word ptr [0x4b0c]
727a: 2b060e4b               sub      ax, word ptr [0x4b0e]
727e: bab500                 mov      dx, 0xb5
7281: f7ea                   imul     dx
7283: 22c0                   and      al, al
7285: 8ac4                   mov      al, ah
7287: 8ae2                   mov      ah, dl
7289: 7405                   je       0x7290
728b: 22f6                   and      dh, dh
728d: 7901                   jns      0x7290
728f: 40                     inc      ax
7290: 8b3e504b               mov      di, word ptr [0x4b50]
7294: 2b4502                 sub      ax, word ptr [di + 2]
7297: a36e4b                 mov      word ptr [0x4b6e], ax
729a: a10c4b                 mov      ax, word ptr [0x4b0c]
729d: 03060e4b               add      ax, word ptr [0x4b0e]
72a1: 8a5507                 mov      dl, byte ptr [di + 7]
72a4: 32f6                   xor      dh, dh
72a6: f7ea                   imul     dx
72a8: 22c0                   and      al, al
72aa: 8ac4                   mov      al, ah
72ac: 8ae2                   mov      ah, dl
72ae: 7405                   je       0x72b5
72b0: 22f6                   and      dh, dh
72b2: 7901                   jns      0x72b5
72b4: 40                     inc      ax
72b5: a36a4b                 mov      word ptr [0x4b6a], ax
72b8: 8b4504                 mov      ax, word ptr [di + 4]
72bb: 0226cf4a               add      ah, byte ptr [0x4acf]
72bf: a39453                 mov      word ptr [0x5394], ax
72c2: c3                     ret      
72c3: bf0200                 mov      di, 2
72c6: e80b06                 call     0x78d4
72c9: bb0200                 mov      bx, 2
72cc: e891d2                 call     0x4560
72cf: 8a16254b               mov      dl, byte ptr [0x4b25]
72d3: d0e2                   shl      dl, 1
72d5: d0d2                   rcl      dl, 1
72d7: d0d2                   rcl      dl, 1
72d9: 80fa02                 cmp      dl, 2
72dc: 7203                   jb       0x72e1
72de: 80cafc                 or       dl, 0xfc
72e1: a08f57                 mov      al, byte ptr [0x578f]
72e4: 8a262758               mov      ah, byte ptr [0x5827]
72e8: 0306e44a               add      ax, word ptr [0x4ae4]
72ec: 02e2                   add      ah, dl
72ee: 7903                   jns      0x72f3
72f0: 80c404                 add      ah, 4
72f3: 80ec02                 sub      ah, 2
72f6: a3704b                 mov      word ptr [0x4b70], ax
72f9: d1e0                   shl      ax, 1
72fb: d1e0                   shl      ax, 1
72fd: d1e0                   shl      ax, 1
72ff: d1e0                   shl      ax, 1
7301: d1e0                   shl      ax, 1
7303: d1e0                   shl      ax, 1
7305: 80c440                 add      ah, 0x40
7308: 2a26544b               sub      ah, byte ptr [0x4b54]
730c: a39453                 mov      word ptr [0x5394], ax
730f: 8a0e694b               mov      cl, byte ptr [0x4b69]
7313: 80e103                 and      cl, 3
7316: f6d1                   not      cl
7318: 80c103                 add      cl, 3
731b: 8a36cf4a               mov      dh, byte ptr [0x4acf]
731f: d0e6                   shl      dh, 1
7321: d0d6                   rcl      dh, 1
7323: d0d6                   rcl      dh, 1
7325: 80fe02                 cmp      dh, 2
7328: 7203                   jb       0x732d
732a: 80cefc                 or       dh, 0xfc
732d: 8b3e504b               mov      di, word ptr [0x4b50]
7331: a1704b                 mov      ax, word ptr [0x4b70]
7334: 2b4506                 sub      ax, word ptr [di + 6]
7337: 2ae6                   sub      ah, dh
7339: 7902                   jns      0x733d
733b: f7d8                   neg      ax
733d: 80fc04                 cmp      ah, 4
7340: 720a                   jb       0x734c
7342: 80ec04                 sub      ah, 4
7345: eb05                   jmp      0x734c
7347: 90                     nop      
7348: d1e8                   shr      ax, 1
734a: fec9                   dec      cl
734c: 22e4                   and      ah, ah
734e: 75f8                   jne      0x7348
7350: f66508                 mul      byte ptr [di + 8]
7353: d1e8                   shr      ax, 1
7355: 22c9                   and      cl, cl
7357: 7907                   jns      0x7360
7359: f6d9                   neg      cl
735b: d3e0                   shl      ax, cl
735d: eb03                   jmp      0x7362
735f: 90                     nop      
7360: d3f8                   sar      ax, cl
7362: 88266b4b               mov      byte ptr [0x4b6b], ah
7366: d0e4                   shl      ah, 1
7368: 80c402                 add      ah, 2
736b: 3a26554b               cmp      ah, byte ptr [0x4b55]
736f: 7238                   jb       0x73a9
7371: 8a26da54               mov      ah, byte ptr [0x54da]
7375: 80fc01                 cmp      ah, 1
7378: 7405                   je       0x737f
737a: 80fc03                 cmp      ah, 3
737d: 752a                   jne      0x73a9
737f: 8a0ee04a               mov      cl, byte ptr [0x4ae0]
7383: 8a265b4b               mov      ah, byte ptr [0x4b5b]
7387: 22e4                   and      ah, ah
7389: 7906                   jns      0x7391
738b: e8df03                 call     0x776d
738e: eb04                   jmp      0x7394
7390: 90                     nop      
7391: e8c603                 call     0x775a
7394: 32ff                   xor      bh, bh
7396: 8aa7ad5a               mov      ah, byte ptr [bx + 0x5aad]
739a: 80e40f                 and      ah, 0xf
739d: 80fc04                 cmp      ah, 4
73a0: 7503                   jne      0x73a5
73a2: e98bfe                 jmp      0x7230
73a5: 880ee04a               mov      byte ptr [0x4ae0], cl
73a9: a26a4b                 mov      byte ptr [0x4b6a], al
73ac: e81b00                 call     0x73ca
73af: e8c104                 call     0x7873
73b2: 8b3e504b               mov      di, word ptr [0x4b50]
73b6: 8b4509                 mov      ax, word ptr [di + 9]
73b9: 2b06794b               sub      ax, word ptr [0x4b79]
73bd: 8026544bff             and      byte ptr [0x4b54], 0xff
73c2: 7902                   jns      0x73c6
73c4: f7d8                   neg      ax
73c6: a36e4b                 mov      word ptr [0x4b6e], ax
73c9: c3                     ret      
73ca: 8a16624b               mov      dl, byte ptr [0x4b62]
73ce: 80e207                 and      dl, 7
73d1: b103                   mov      cl, 3
73d3: 8a26634b               mov      ah, byte ptr [0x4b63]
73d7: 22e4                   and      ah, ah
73d9: 7912                   jns      0x73ed
73db: 80c404                 add      ah, 4
73de: fec1                   inc      cl
73e0: 80fc04                 cmp      ah, 4
73e3: 73f6                   jae      0x73db
73e5: eb0b                   jmp      0x73f2
73e7: 90                     nop      
73e8: 80ec04                 sub      ah, 4
73eb: fec9                   dec      cl
73ed: 80fc04                 cmp      ah, 4
73f0: 73f6                   jae      0x73e8
73f2: a0624b                 mov      al, byte ptr [0x4b62]
73f5: d1e8                   shr      ax, 1
73f7: d1e8                   shr      ax, 1
73f9: d0e8                   shr      al, 1
73fb: 8ad8                   mov      bl, al
73fd: 8a87d170               mov      al, byte ptr [bx + 0x70d1]
7401: 80fb7f                 cmp      bl, 0x7f
7404: 7502                   jne      0x7408
7406: 32c0                   xor      al, al
7408: 2a87d070               sub      al, byte ptr [bx + 0x70d0]
740c: f6e2                   mul      dl
740e: d0e8                   shr      al, 1
7410: d0e8                   shr      al, 1
7412: d0e8                   shr      al, 1
7414: 8ae7                   mov      ah, bh
7416: 12c7                   adc      al, bh
7418: 0287d070               add      al, byte ptr [bx + 0x70d0]
741c: 12a75062               adc      ah, byte ptr [bx + 0x6250]
7420: 22c9                   and      cl, cl
7422: 7907                   jns      0x742b
7424: f6d9                   neg      cl
7426: d3e0                   shl      ax, cl
7428: eb03                   jmp      0x742d
742a: 90                     nop      
742b: d3f8                   sar      ax, cl
742d: a3794b                 mov      word ptr [0x4b79], ax
7430: c3                     ret      
7431: 8b364e4b               mov      si, word ptr [0x4b4e]
7435: 8b3e804b               mov      di, word ptr [0x4b80]
7439: 8026594bff             and      byte ptr [0x4b59], 0xff
743e: 7929                   jns      0x7469
7440: 8bc3                   mov      ax, bx
7442: 24fe                   and      al, 0xfe
7444: 03f8                   add      di, ax
7446: 03f0                   add      si, ax
7448: f6c301                 test     bl, 1
744b: 750e                   jne      0x745b
744d: 8b04                   mov      ax, word ptr [si]
744f: 86c4                   xchg     ah, al
7451: 80e47f                 and      ah, 0x7f
7454: 0306e84a               add      ax, word ptr [0x4ae8]
7458: eb3d                   jmp      0x7497
745a: 90                     nop      
745b: 8b05                   mov      ax, word ptr [di]
745d: 86c4                   xchg     ah, al
745f: 80e47f                 and      ah, 0x7f
7462: 0306ea4a               add      ax, word ptr [0x4aea]
7466: eb2f                   jmp      0x7497
7468: 90                     nop      
7469: 8bc3                   mov      ax, bx
746b: d1e8                   shr      ax, 1
746d: 03f8                   add      di, ax
746f: 03f0                   add      si, ax
7471: f6c301                 test     bl, 1
7474: 7512                   jne      0x7488
7476: 8a04                   mov      al, byte ptr [si]
7478: 8ae0                   mov      ah, al
747a: d0e0                   shl      al, 1
747c: 24e0                   and      al, 0xe0
747e: 80e40f                 and      ah, 0xf
7481: 0306e84a               add      ax, word ptr [0x4ae8]
7485: eb10                   jmp      0x7497
7487: 90                     nop      
7488: 8a05                   mov      al, byte ptr [di]
748a: 8ae0                   mov      ah, al
748c: d0e0                   shl      al, 1
748e: 24e0                   and      al, 0xe0
7490: 80e40f                 and      ah, 0xf
7493: 0306ea4a               add      ax, word ptr [0x4aea]
7497: 8af4                   mov      dh, ah
7499: d1e0                   shl      ax, 1
749b: d1e0                   shl      ax, 1
749d: d1e0                   shl      ax, 1
749f: 8ac4                   mov      al, ah
74a1: 8ae6                   mov      ah, dh
74a3: c3                     ret      
74a4: a05b4b                 mov      al, byte ptr [0x4b5b]
74a7: 22c0                   and      al, al
74a9: 7806                   js       0x74b1
74ab: a16a4b                 mov      ax, word ptr [0x4b6a]
74ae: eb0b                   jmp      0x74bb
74b0: 90                     nop      
74b1: 8a26774b               mov      ah, byte ptr [0x4b77]
74b5: 32c0                   xor      al, al
74b7: 2b066a4b               sub      ax, word ptr [0x4b6a]
74bb: a37154                 mov      word ptr [0x5471], ax
74be: bb4000                 mov      bx, 0x40
74c1: 03c3                   add      ax, bx
74c3: a2444b                 mov      byte ptr [0x4b44], al
74c6: 8ac4                   mov      al, ah
74c8: 3a26774b               cmp      ah, byte ptr [0x4b77]
74cc: 7203                   jb       0x74d1
74ce: b80080                 mov      ax, 0x8000
74d1: 8826454b               mov      byte ptr [0x4b45], ah
74d5: fec0                   inc      al
74d7: d0e0                   shl      al, 1
74d9: a2d94a                 mov      byte ptr [0x4ad9], al
74dc: a05b4b                 mov      al, byte ptr [0x4b5b]
74df: 3206b754               xor      al, byte ptr [0x54b7]
74e3: 790f                   jns      0x74f4
74e5: a06a4b                 mov      al, byte ptr [0x4b6a]
74e8: f6d8                   neg      al
74ea: a0774b                 mov      al, byte ptr [0x4b77]
74ed: 1a066b4b               sbb      al, byte ptr [0x4b6b]
74f1: eb04                   jmp      0x74f7
74f3: 90                     nop      
74f4: a06b4b                 mov      al, byte ptr [0x4b6b]
74f7: b420                   mov      ah, 0x20
74f9: 2ae0                   sub      ah, al
74fb: a0454b                 mov      al, byte ptr [0x4b45]
74fe: 22c0                   and      al, al
7500: 7904                   jns      0x7506
7502: 0226774b               add      ah, byte ptr [0x4b77]
7506: 8826884b               mov      byte ptr [0x4b88], ah
750a: 8826894b               mov      byte ptr [0x4b89], ah
750e: c3                     ret      
750f: 8a1e8054               mov      bl, byte ptr [0x5480]
7513: 881ee04a               mov      byte ptr [0x4ae0], bl
7517: 32ff                   xor      bh, bh
7519: e873bc                 call     0x318f
751c: c606655400             mov      byte ptr [0x5465], 0
7521: b302                   mov      bl, 2
7523: 881e0e4b               mov      byte ptr [0x4b0e], bl
7527: a08054                 mov      al, byte ptr [0x5480]
752a: 3a06e04a               cmp      al, byte ptr [0x4ae0]
752e: 740c                   je       0x753c
7530: 8ad8                   mov      bl, al
7532: a2e04a                 mov      byte ptr [0x4ae0], al
7535: e857bc                 call     0x318f
7538: 8a1e0e4b               mov      bl, byte ptr [0x4b0e]
753c: 8aa73f53               mov      ah, byte ptr [bx + 0x533f]
7540: 8a873c53               mov      al, byte ptr [bx + 0x533c]
7544: 99                     cdq      
7545: d1e8                   shr      ax, 1
7547: d1e8                   shr      ax, 1
7549: d1e8                   shr      ax, 1
754b: d1e8                   shr      ax, 1
754d: 8ae2                   mov      ah, dl
754f: 03066e4b               add      ax, word ptr [0x4b6e]
7553: 3d8001                 cmp      ax, 0x180
7556: 7216                   jb       0x756e
7558: f9                     stc      
7559: d01eb354               rcr      byte ptr [0x54b3], 1
755d: a3b054                 mov      word ptr [0x54b0], ax
7560: 22e4                   and      ah, ah
7562: 7805                   js       0x7569
7564: b4ff                   mov      ah, 0xff
7566: eb26                   jmp      0x758e
7568: 90                     nop      
7569: 32e4                   xor      ah, ah
756b: eb21                   jmp      0x758e
756d: 90                     nop      
756e: 22e4                   and      ah, ah
7570: 7406                   je       0x7578
7572: b480                   mov      ah, 0x80
7574: 2ae0                   sub      ah, al
7576: 8ac4                   mov      al, ah
7578: 8ad4                   mov      dl, ah
757a: f626754b               mul      byte ptr [0x4b75]
757e: 22d2                   and      dl, dl
7580: 7402                   je       0x7584
7582: f7d8                   neg      ax
7584: 22c0                   and      al, al
7586: 7906                   jns      0x758e
7588: fec4                   inc      ah
758a: 7502                   jne      0x758e
758c: fecc                   dec      ah
758e: 8826104b               mov      byte ptr [0x4b10], ah
7592: a05b4b                 mov      al, byte ptr [0x4b5b]
7595: 22c0                   and      al, al
7597: 7902                   jns      0x759b
7599: f6d4                   not      ah
759b: 80fb02                 cmp      bl, 2
759e: 7504                   jne      0x75a4
75a0: 8826dd4a               mov      byte ptr [0x4add], ah
75a4: 8aa74553               mov      ah, byte ptr [bx + 0x5345]
75a8: 8a874253               mov      al, byte ptr [bx + 0x5342]
75ac: 99                     cdq      
75ad: d1e8                   shr      ax, 1
75af: d1e8                   shr      ax, 1
75b1: d1e8                   shr      ax, 1
75b3: d1e8                   shr      ax, 1
75b5: 98                     cwde     
75b6: 8a0e764b               mov      cl, byte ptr [0x4b76]
75ba: 32ed                   xor      ch, ch
75bc: 52                     push     dx
75bd: f7e9                   imul     cx
75bf: 5a                     pop      dx
75c0: d1e0                   shl      ax, 1
75c2: 02266a4b               add      ah, byte ptr [0x4b6a]
75c6: 8826044b               mov      byte ptr [0x4b04], ah
75ca: 12166b4b               adc      dl, byte ptr [0x4b6b]
75ce: 8816054b               mov      byte ptr [0x4b05], dl
75d2: d0e2                   shl      dl, 1
75d4: 8816784b               mov      byte ptr [0x4b78], dl
75d8: 7806                   js       0x75e0
75da: 3a161f4b               cmp      dl, byte ptr [0x4b1f]
75de: 7203                   jb       0x75e3
75e0: e8df00                 call     0x76c2
75e3: a05b4b                 mov      al, byte ptr [0x4b5b]
75e6: 22c0                   and      al, al
75e8: 7539                   jne      0x7623
75ea: 8a1e784b               mov      bl, byte ptr [0x4b78]
75ee: e840fe                 call     0x7431
75f1: d0ec                   shr      ah, 1
75f3: d0ec                   shr      ah, 1
75f5: d0ec                   shr      ah, 1
75f7: d0ec                   shr      ah, 1
75f9: d0ec                   shr      ah, 1
75fb: a3fa4a                 mov      word ptr [0x4afa], ax
75fe: fec3                   inc      bl
7600: e82efe                 call     0x7431
7603: a2fd4a                 mov      byte ptr [0x4afd], al
7606: fec3                   inc      bl
7608: e826fe                 call     0x7431
760b: d0ec                   shr      ah, 1
760d: d0ec                   shr      ah, 1
760f: d0ec                   shr      ah, 1
7611: d0ec                   shr      ah, 1
7613: d0ec                   shr      ah, 1
7615: a3fe4a                 mov      word ptr [0x4afe], ax
7618: fec3                   inc      bl
761a: e814fe                 call     0x7431
761d: a2004b                 mov      byte ptr [0x4b00], al
7620: eb3e                   jmp      0x7660
7622: 90                     nop      
7623: 8a1e554b               mov      bl, byte ptr [0x4b55]
7627: 2a1e784b               sub      bl, byte ptr [0x4b78]
762b: 80eb04                 sub      bl, 4
762e: e800fe                 call     0x7431
7631: a2004b                 mov      byte ptr [0x4b00], al
7634: fec3                   inc      bl
7636: e8f8fd                 call     0x7431
7639: d0ec                   shr      ah, 1
763b: d0ec                   shr      ah, 1
763d: d0ec                   shr      ah, 1
763f: d0ec                   shr      ah, 1
7641: d0ec                   shr      ah, 1
7643: a3fe4a                 mov      word ptr [0x4afe], ax
7646: fec3                   inc      bl
7648: e8e6fd                 call     0x7431
764b: a2fd4a                 mov      byte ptr [0x4afd], al
764e: fec3                   inc      bl
7650: e8defd                 call     0x7431
7653: d0ec                   shr      ah, 1
7655: d0ec                   shr      ah, 1
7657: d0ec                   shr      ah, 1
7659: d0ec                   shr      ah, 1
765b: d0ec                   shr      ah, 1
765d: a3fa4a                 mov      word ptr [0x4afa], ax
7660: 8a1e0e4b               mov      bl, byte ptr [0x4b0e]
7664: e8be01                 call     0x7825
7667: fecb                   dec      bl
7669: 7803                   js       0x766e
766b: e9b5fe                 jmp      0x7523
766e: c3                     ret      
766f: a0f34a                 mov      al, byte ptr [0x4af3]
7672: d0e0                   shl      al, 1
7674: 7225                   jb       0x769b
7676: 7811                   js       0x7689
7678: a14a4b                 mov      ax, word ptr [0x4b4a]
767b: f7d8                   neg      ax
767d: a30c4b                 mov      word ptr [0x4b0c], ax
7680: a14c4b                 mov      ax, word ptr [0x4b4c]
7683: f7d8                   neg      ax
7685: a30e4b                 mov      word ptr [0x4b0e], ax
7688: c3                     ret      
7689: a14c4b                 mov      ax, word ptr [0x4b4c]
768c: f7d8                   neg      ax
768e: a30c4b                 mov      word ptr [0x4b0c], ax
7691: a14a4b                 mov      ax, word ptr [0x4b4a]
7694: 80c408                 add      ah, 8
7697: a30e4b                 mov      word ptr [0x4b0e], ax
769a: c3                     ret      
769b: 7813                   js       0x76b0
769d: a14a4b                 mov      ax, word ptr [0x4b4a]
76a0: 80c408                 add      ah, 8
76a3: a30c4b                 mov      word ptr [0x4b0c], ax
76a6: a14c4b                 mov      ax, word ptr [0x4b4c]
76a9: 80c408                 add      ah, 8
76ac: a30e4b                 mov      word ptr [0x4b0e], ax
76af: c3                     ret      
76b0: a14c4b                 mov      ax, word ptr [0x4b4c]
76b3: 80c408                 add      ah, 8
76b6: a30c4b                 mov      word ptr [0x4b0c], ax
76b9: a14a4b                 mov      ax, word ptr [0x4b4a]
76bc: f7d8                   neg      ax
76be: a30e4b                 mov      word ptr [0x4b0e], ax
76c1: c3                     ret      
76c2: a0054b                 mov      al, byte ptr [0x4b05]
76c5: 22c0                   and      al, al
76c7: 7949                   jns      0x7712
76c9: a05b4b                 mov      al, byte ptr [0x4b5b]
76cc: 22c0                   and      al, al
76ce: 790f                   jns      0x76df
76d0: e88700                 call     0x775a
76d3: e8b9ba                 call     0x318f
76d6: a05b4b                 mov      al, byte ptr [0x4b5b]
76d9: 22c0                   and      al, al
76db: 790f                   jns      0x76ec
76dd: 782a                   js       0x7709
76df: e88b00                 call     0x776d
76e2: e8aaba                 call     0x318f
76e5: a05b4b                 mov      al, byte ptr [0x4b5b]
76e8: 22c0                   and      al, al
76ea: 791d                   jns      0x7709
76ec: a0044b                 mov      al, byte ptr [0x4b04]
76ef: f6d8                   neg      al
76f1: 7502                   jne      0x76f5
76f3: f6d0                   not      al
76f5: a2044b                 mov      byte ptr [0x4b04], al
76f8: a0104b                 mov      al, byte ptr [0x4b10]
76fb: f6d8                   neg      al
76fd: 7502                   jne      0x7701
76ff: f6d0                   not      al
7701: a2104b                 mov      byte ptr [0x4b10], al
7704: 883e784b               mov      byte ptr [0x4b78], bh
7708: c3                     ret      
7709: a0554b                 mov      al, byte ptr [0x4b55]
770c: 2c04                   sub      al, 4
770e: a2784b                 mov      byte ptr [0x4b78], al
7711: c3                     ret      
7712: a05b4b                 mov      al, byte ptr [0x4b5b]
7715: 22c0                   and      al, al
7717: 790f                   jns      0x7728
7719: e85100                 call     0x776d
771c: e870ba                 call     0x318f
771f: a05b4b                 mov      al, byte ptr [0x4b5b]
7722: 22c0                   and      al, al
7724: 790f                   jns      0x7735
7726: 7826                   js       0x774e
7728: e82f00                 call     0x775a
772b: e861ba                 call     0x318f
772e: a05b4b                 mov      al, byte ptr [0x4b5b]
7731: 22c0                   and      al, al
7733: 7919                   jns      0x774e
7735: f616044b               not      byte ptr [0x4b04]
7739: a0554b                 mov      al, byte ptr [0x4b55]
773c: 2c04                   sub      al, 4
773e: a2784b                 mov      byte ptr [0x4b78], al
7741: a0104b                 mov      al, byte ptr [0x4b10]
7744: f6d8                   neg      al
7746: 7502                   jne      0x774a
7748: f6d0                   not      al
774a: a2104b                 mov      byte ptr [0x4b10], al
774d: c3                     ret      
774e: 883e784b               mov      byte ptr [0x4b78], bh
7752: c3                     ret      
7753: 8026b754ff             and      byte ptr [0x54b7], 0xff
7758: 7813                   js       0x776d
775a: 8a1ee04a               mov      bl, byte ptr [0x4ae0]
775e: fec3                   inc      bl
7760: 3a1e7156               cmp      bl, byte ptr [0x5671]
7764: 7202                   jb       0x7768
7766: 32db                   xor      bl, bl
7768: 881ee04a               mov      byte ptr [0x4ae0], bl
776c: c3                     ret      
776d: 8a1ee04a               mov      bl, byte ptr [0x4ae0]
7771: fecb                   dec      bl
7773: 7906                   jns      0x777b
7775: 8a1e7156               mov      bl, byte ptr [0x5671]
7779: fecb                   dec      bl
777b: 881ee04a               mov      byte ptr [0x4ae0], bl
777f: c3                     ret      
7780: 8a16104b               mov      dl, byte ptr [0x4b10]
7784: 32f6                   xor      dh, dh
7786: a0fd4a                 mov      al, byte ptr [0x4afd]
7789: 2a06fa4a               sub      al, byte ptr [0x4afa]
778d: 98                     cwde     
778e: f7ea                   imul     dx
7790: 8826f64a               mov      byte ptr [0x4af6], ah
7794: 8af8                   mov      bh, al
7796: 8ac4                   mov      al, ah
7798: 98                     cwde     
7799: 0306fa4a               add      ax, word ptr [0x4afa]
779d: 8bc8                   mov      cx, ax
779f: 8a16104b               mov      dl, byte ptr [0x4b10]
77a3: 32f6                   xor      dh, dh
77a5: a0004b                 mov      al, byte ptr [0x4b00]
77a8: 2a06fe4a               sub      al, byte ptr [0x4afe]
77ac: 98                     cwde     
77ad: f7ea                   imul     dx
77af: 8826f64a               mov      byte ptr [0x4af6], ah
77b3: 8af0                   mov      dh, al
77b5: 8ac4                   mov      al, ah
77b7: 98                     cwde     
77b8: 0306fe4a               add      ax, word ptr [0x4afe]
77bc: 8b36044b               mov      si, word ptr [0x4b04]
77c0: 81e6ff00               and      si, 0xff
77c4: 2af7                   sub      dh, bh
77c6: 1bc1                   sbb      ax, cx
77c8: 7938                   jns      0x7802
77ca: 80fcff                 cmp      ah, 0xff
77cd: 7504                   jne      0x77d3
77cf: 22c0                   and      al, al
77d1: 7835                   js       0x7808
77d3: d1e8                   shr      ax, 1
77d5: d0de                   rcr      dh, 1
77d7: d1e8                   shr      ax, 1
77d9: d0de                   rcr      dh, 1
77db: d1e8                   shr      ax, 1
77dd: d0de                   rcr      dh, 1
77df: 8ae0                   mov      ah, al
77e1: 8ac6                   mov      al, dh
77e3: f7ee                   imul     si
77e5: 22c0                   and      al, al
77e7: 8ac4                   mov      al, ah
77e9: 8ae2                   mov      ah, dl
77eb: 7405                   je       0x77f2
77ed: 22f6                   and      dh, dh
77ef: 7901                   jns      0x77f2
77f1: 40                     inc      ax
77f2: 99                     cdq      
77f3: d1e0                   shl      ax, 1
77f5: d0d2                   rcl      dl, 1
77f7: d1e0                   shl      ax, 1
77f9: d0d2                   rcl      dl, 1
77fb: d1e0                   shl      ax, 1
77fd: d0d2                   rcl      dl, 1
77ff: eb1b                   jmp      0x781c
7801: 90                     nop      
7802: 75cf                   jne      0x77d3
7804: 22c0                   and      al, al
7806: 78cb                   js       0x77d3
7808: 8ae0                   mov      ah, al
780a: 8ac6                   mov      al, dh
780c: f7ee                   imul     si
780e: 22c0                   and      al, al
7810: 8ac4                   mov      al, ah
7812: 8ae2                   mov      ah, dl
7814: 7405                   je       0x781b
7816: 22f6                   and      dh, dh
7818: 7901                   jns      0x781b
781a: 40                     inc      ax
781b: 99                     cdq      
781c: 02c7                   add      al, bh
781e: 12e1                   adc      ah, cl
7820: 12d5                   adc      dl, ch
7822: 32ff                   xor      bh, bh
7824: c3                     ret      
7825: e858ff                 call     0x7780
7828: d026b354               shl      byte ptr [0x54b3], 1
782c: 7303                   jae      0x7831
782e: e82c01                 call     0x795d
7831: 8a369b53               mov      dh, byte ptr [0x539b]
7835: 80fe0a                 cmp      dh, 0xa
7838: 720d                   jb       0x7847
783a: 88874c54               mov      byte ptr [bx + 0x544c], al
783e: 88a74f54               mov      byte ptr [bx + 0x544f], ah
7842: 8897db54               mov      byte ptr [bx + 0x54db], dl
7846: c3                     ret      
7847: 8a363053               mov      dh, byte ptr [0x5330]
784b: 22f6                   and      dh, dh
784d: 7902                   jns      0x7851
784f: f6d6                   not      dh
7851: 80fe05                 cmp      dh, 5
7854: 73e4                   jae      0x783a
7856: 02874c54               add      al, byte ptr [bx + 0x544c]
785a: 12a74f54               adc      ah, byte ptr [bx + 0x544f]
785e: 1297db54               adc      dl, byte ptr [bx + 0x54db]
7862: d0da                   rcr      dl, 1
7864: d1d8                   rcr      ax, 1
7866: 88874c54               mov      byte ptr [bx + 0x544c], al
786a: 88a74f54               mov      byte ptr [bx + 0x544f], ah
786e: 8897db54               mov      byte ptr [bx + 0x54db], dl
7872: c3                     ret      
7873: a10c4b                 mov      ax, word ptr [0x4b0c]
7876: f7e8                   imul     ax
7878: a2fa4a                 mov      byte ptr [0x4afa], al
787b: 8826fd4a               mov      byte ptr [0x4afd], ah
787f: 8816fe4a               mov      byte ptr [0x4afe], dl
7883: a10e4b                 mov      ax, word ptr [0x4b0e]
7886: f7e8                   imul     ax
7888: 0006fa4a               add      byte ptr [0x4afa], al
788c: 1026fd4a               adc      byte ptr [0x4afd], ah
7890: 1016fe4a               adc      byte ptr [0x4afe], dl
7894: a1794b                 mov      ax, word ptr [0x4b79]
7897: f7e8                   imul     ax
7899: 8b3eda54               mov      di, word ptr [0x54da]
789d: 81e7ff00               and      di, 0xff
78a1: 8a8d01c5               mov      cl, byte ptr [di - 0x3aff]
78a5: 32ed                   xor      ch, ch
78a7: 8a36fa4a               mov      dh, byte ptr [0x4afa]
78ab: 2af0                   sub      dh, al
78ad: a0fd4a                 mov      al, byte ptr [0x4afd]
78b0: 1ac4                   sbb      al, ah
78b2: 8a26fe4a               mov      ah, byte ptr [0x4afe]
78b6: 1ae2                   sbb      ah, dl
78b8: f7e9                   imul     cx
78ba: 22c0                   and      al, al
78bc: 8ac4                   mov      al, ah
78be: 8ae2                   mov      ah, dl
78c0: 7405                   je       0x78c7
78c2: 22f6                   and      dh, dh
78c4: 7901                   jns      0x78c7
78c6: 40                     inc      ax
78c7: d1f8                   sar      ax, 1
78c9: d1f8                   sar      ax, 1
78cb: d1f8                   sar      ax, 1
78cd: d1f8                   sar      ax, 1
78cf: 0106794b               add      word ptr [0x4b79], ax
78d3: c3                     ret      
78d4: 8b2e504b               mov      bp, word ptr [0x4b50]
78d8: 8026f34aff             and      byte ptr [0x4af3], 0xff
78dd: 783c                   js       0x791b
78df: f606f34a40             test     byte ptr [0x4af3], 0x40
78e4: 7519                   jne      0x78ff
78e6: a14a4b                 mov      ax, word ptr [0x4b4a]
78e9: 3e0303                 add      ax, word ptr ds:[bp + di]
78ec: 83c702                 add      di, 2
78ef: a30c4b                 mov      word ptr [0x4b0c], ax
78f2: a14c4b                 mov      ax, word ptr [0x4b4c]
78f5: 3e0303                 add      ax, word ptr ds:[bp + di]
78f8: 83c702                 add      di, 2
78fb: a30e4b                 mov      word ptr [0x4b0e], ax
78fe: c3                     ret      
78ff: a14c4b                 mov      ax, word ptr [0x4b4c]
7902: 3e0303                 add      ax, word ptr ds:[bp + di]
7905: 83c702                 add      di, 2
7908: a30e4b                 mov      word ptr [0x4b0e], ax
790b: a14a4b                 mov      ax, word ptr [0x4b4a]
790e: 3e2b03                 sub      ax, word ptr ds:[bp + di]
7911: 83c702                 add      di, 2
7914: 80c408                 add      ah, 8
7917: a30c4b                 mov      word ptr [0x4b0c], ax
791a: c3                     ret      
791b: f606f34a40             test     byte ptr [0x4af3], 0x40
7920: 751f                   jne      0x7941
7922: a14a4b                 mov      ax, word ptr [0x4b4a]
7925: 3e2b03                 sub      ax, word ptr ds:[bp + di]
7928: 83c702                 add      di, 2
792b: 80c408                 add      ah, 8
792e: a30c4b                 mov      word ptr [0x4b0c], ax
7931: a14c4b                 mov      ax, word ptr [0x4b4c]
7934: 3e2b03                 sub      ax, word ptr ds:[bp + di]
7937: 83c702                 add      di, 2
793a: 80c408                 add      ah, 8
793d: a30e4b                 mov      word ptr [0x4b0e], ax
7940: c3                     ret      
7941: a14c4b                 mov      ax, word ptr [0x4b4c]
7944: 3e2b03                 sub      ax, word ptr ds:[bp + di]
7947: 83c702                 add      di, 2
794a: 80c408                 add      ah, 8
794d: a30e4b                 mov      word ptr [0x4b0e], ax
7950: a14a4b                 mov      ax, word ptr [0x4b4a]
7953: 3e0303                 add      ax, word ptr ds:[bp + di]
7956: 83c702                 add      di, 2
7959: a30c4b                 mov      word ptr [0x4b0c], ax
795c: c3                     ret      
795d: 8af2                   mov      dh, dl
795f: 8bc8                   mov      cx, ax
7961: a1b054                 mov      ax, word ptr [0x54b0]
7964: 22e4                   and      ah, ah
7966: 7903                   jns      0x796b
7968: eb08                   jmp      0x7972
796a: 90                     nop      
796b: b88001                 mov      ax, 0x180
796e: 2b06b054               sub      ax, word ptr [0x54b0]
7972: 7902                   jns      0x7976
7974: f7d8                   neg      ax
7976: 22e4                   and      ah, ah
7978: 7534                   jne      0x79ae
797a: d1e0                   shl      ax, 1
797c: d1e0                   shl      ax, 1
797e: d1e0                   shl      ax, 1
7980: d1e0                   shl      ax, 1
7982: 32d2                   xor      dl, dl
7984: 80fc03                 cmp      ah, 3
7987: 7325                   jae      0x79ae
7989: 2bc8                   sub      cx, ax
798b: 8bc1                   mov      ax, cx
798d: 1af2                   sbb      dh, dl
798f: 8ad6                   mov      dl, dh
7991: 7507                   jne      0x799a
7993: fecc                   dec      ah
7995: 80fc10                 cmp      ah, 0x10
7998: 7214                   jb       0x79ae
799a: 8a36b154               mov      dh, byte ptr [0x54b1]
799e: 32365b4b               xor      dh, byte ptr [0x4b5b]
79a2: 80e680                 and      dh, 0x80
79a5: 7802                   js       0x79a9
79a7: b640                   mov      dh, 0x40
79a9: 88361654               mov      byte ptr [0x5416], dh
79ad: c3                     ret      
79ae: 32d2                   xor      dl, dl
79b0: f9                     stc      
79b1: d01e6554               rcr      byte ptr [0x5465], 1
79b5: b80010                 mov      ax, 0x1000
79b8: c3                     ret      
79b9: 0000                   add      byte ptr [bx + si], al
79bb: 0000                   add      byte ptr [bx + si], al
79bd: 0000                   add      byte ptr [bx + si], al
79bf: 00c3                   add      bl, al
79c1: 80fcc0                 cmp      ah, 0xc0
79c4: 73fa                   jae      0x79c0
79c6: 80fc40                 cmp      ah, 0x40
79c9: 7302                   jae      0x79cd
79cb: b440                   mov      ah, 0x40
79cd: 8a360e4b               mov      dh, byte ptr [0x4b0e]
79d1: 8a160c4b               mov      dl, byte ptr [0x4b0c]
79d5: 8afe                   mov      bh, dh
79d7: d0ee                   shr      dh, 1
79d9: f6d6                   not      dh
79db: 3adc                   cmp      bl, ah
79dd: 7303                   jae      0x79e2
79df: e9b200                 jmp      0x7a94
79e2: 80fbc0                 cmp      bl, 0xc0
79e5: 720f                   jb       0x79f6
79e7: fecb                   dec      bl
79e9: 02f2                   add      dh, dl
79eb: 73f5                   jae      0x79e2
79ed: 2af7                   sub      dh, bh
79ef: fec8                   dec      al
79f1: 80fbc0                 cmp      bl, 0xc0
79f4: 73f1                   jae      0x79e7
79f6: 3c40                   cmp      al, 0x40
79f8: 72c6                   jb       0x79c0
79fa: 3cc0                   cmp      al, 0xc0
79fc: 7219                   jb       0x7a17
79fe: eb0d                   jmp      0x7a0d
7a00: 90                     nop      
7a01: 02f2                   add      dh, dl
7a03: 7308                   jae      0x7a0d
7a05: 2af7                   sub      dh, bh
7a07: fec8                   dec      al
7a09: 3cc0                   cmp      al, 0xc0
7a0b: 720a                   jb       0x7a17
7a0d: fecb                   dec      bl
7a0f: 3adc                   cmp      bl, ah
7a11: 73ee                   jae      0x7a01
7a13: eb7f                   jmp      0x7a94
7a15: 90                     nop      
7a16: c3                     ret      
7a17: 8acb                   mov      cl, bl
7a19: 32ed                   xor      ch, ch
7a1b: 2acc                   sub      cl, ah
7a1d: 41                     inc      cx
7a1e: 8bfb                   mov      di, bx
7a20: 81e7ff00               and      di, 0xff
7a24: d1e7                   shl      di, 1
7a26: 8bbd1048               mov      di, word ptr [di + 0x4810]
7a2a: 32e4                   xor      ah, ah
7a2c: 8bf0                   mov      si, ax
7a2e: 81c610c5               add      si, 0xc510
7a32: 2c40                   sub      al, 0x40
7a34: d0e8                   shr      al, 1
7a36: d0e8                   shr      al, 1
7a38: 83c704                 add      di, 4
7a3b: 03f8                   add      di, ax
7a3d: eb29                   jmp      0x7a68
7a3f: 90                     nop      
7a40: 02f2                   add      dh, dl
7a42: 7324                   jae      0x7a68
7a44: 2af7                   sub      dh, bh
7a46: 8bee                   mov      bp, si
7a48: 4e                     dec      si
7a49: 81e50300               and      bp, 3
7a4d: 7519                   jne      0x7a68
7a4f: 81fe50c5               cmp      si, 0xc550
7a53: 72c1                   jb       0x7a16
7a55: 4f                     dec      di
7a56: eb10                   jmp      0x7a68
7a58: 90                     nop      
7a59: 3a9c4003               cmp      bl, byte ptr [si + 0x340]
7a5d: 7629                   jbe      0x7a88
7a5f: 3a9c0000               cmp      bl, byte ptr [si]
7a63: 7219                   jb       0x7a7e
7a65: eb21                   jmp      0x7a88
7a67: 90                     nop      
7a68: 3a9c0000               cmp      bl, byte ptr [si]
7a6c: 731a                   jae      0x7a88
7a6e: 889c0000               mov      byte ptr [si], bl
7a72: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
7a76: 7306                   jae      0x7a7e
7a78: 3a9c4002               cmp      bl, byte ptr [si + 0x240]
7a7c: 730a                   jae      0x7a88
7a7e: 268a25                 mov      ah, byte ptr es:[di]
7a81: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
7a85: 268825                 mov      byte ptr es:[di], ah
7a88: 83ef28                 sub      di, 0x28
7a8b: fecb                   dec      bl
7a8d: e2b1                   loop     0x7a40
7a8f: 8bc6                   mov      ax, si
7a91: 2d10c5                 sub      ax, 0xc510
7a94: 80fb40                 cmp      bl, 0x40
7a97: 7336                   jae      0x7acf
7a99: 8a26084b               mov      ah, byte ptr [0x4b08]
7a9d: 3a26064b               cmp      ah, byte ptr [0x4b06]
7aa1: 7204                   jb       0x7aa7
7aa3: 8a26064b               mov      ah, byte ptr [0x4b06]
7aa7: 80fc40                 cmp      ah, 0x40
7aaa: 7302                   jae      0x7aae
7aac: b440                   mov      ah, 0x40
7aae: 3cc0                   cmp      al, 0xc0
7ab0: 7202                   jb       0x7ab4
7ab2: b0bf                   mov      al, 0xbf
7ab4: 3ac4                   cmp      al, ah
7ab6: 7217                   jb       0x7acf
7ab8: fecc                   dec      ah
7aba: 8ac8                   mov      cl, al
7abc: 32ed                   xor      ch, ch
7abe: 8bf1                   mov      si, cx
7ac0: 2acc                   sub      cl, ah
7ac2: 740b                   je       0x7acf
7ac4: b240                   mov      dl, 0x40
7ac6: 81c610c5               add      si, 0xc510
7aca: 8814                   mov      byte ptr [si], dl
7acc: 4e                     dec      si
7acd: e2fb                   loop     0x7aca
7acf: c3                     ret      
7ad0: 80fcc0                 cmp      ah, 0xc0
7ad3: 73fa                   jae      0x7acf
7ad5: 80fc40                 cmp      ah, 0x40
7ad8: 7302                   jae      0x7adc
7ada: b440                   mov      ah, 0x40
7adc: 8a360e4b               mov      dh, byte ptr [0x4b0e]
7ae0: 8a160c4b               mov      dl, byte ptr [0x4b0c]
7ae4: 8afe                   mov      bh, dh
7ae6: d0ee                   shr      dh, 1
7ae8: f6d6                   not      dh
7aea: 3adc                   cmp      bl, ah
7aec: 7303                   jae      0x7af1
7aee: e9af00                 jmp      0x7ba0
7af1: 80fbc0                 cmp      bl, 0xc0
7af4: 720f                   jb       0x7b05
7af6: fecb                   dec      bl
7af8: 02f2                   add      dh, dl
7afa: 73f5                   jae      0x7af1
7afc: 2af7                   sub      dh, bh
7afe: fec0                   inc      al
7b00: 80fbc0                 cmp      bl, 0xc0
7b03: 73f1                   jae      0x7af6
7b05: 3cc0                   cmp      al, 0xc0
7b07: 73c6                   jae      0x7acf
7b09: 3c40                   cmp      al, 0x40
7b0b: 7319                   jae      0x7b26
7b0d: eb0d                   jmp      0x7b1c
7b0f: 90                     nop      
7b10: 02f2                   add      dh, dl
7b12: 7308                   jae      0x7b1c
7b14: 2af7                   sub      dh, bh
7b16: fec0                   inc      al
7b18: 3c40                   cmp      al, 0x40
7b1a: 730a                   jae      0x7b26
7b1c: fecb                   dec      bl
7b1e: 3adc                   cmp      bl, ah
7b20: 73ee                   jae      0x7b10
7b22: eb7c                   jmp      0x7ba0
7b24: 90                     nop      
7b25: c3                     ret      
7b26: 8acb                   mov      cl, bl
7b28: 32ed                   xor      ch, ch
7b2a: 2acc                   sub      cl, ah
7b2c: 41                     inc      cx
7b2d: 8bfb                   mov      di, bx
7b2f: 81e7ff00               and      di, 0xff
7b33: d1e7                   shl      di, 1
7b35: 8bbd1048               mov      di, word ptr [di + 0x4810]
7b39: 8ae5                   mov      ah, ch
7b3b: 8bf0                   mov      si, ax
7b3d: 81c610c5               add      si, 0xc510
7b41: 2c40                   sub      al, 0x40
7b43: d0e8                   shr      al, 1
7b45: d0e8                   shr      al, 1
7b47: 83c704                 add      di, 4
7b4a: 03f8                   add      di, ax
7b4c: eb26                   jmp      0x7b74
7b4e: 90                     nop      
7b4f: 02f2                   add      dh, dl
7b51: 7321                   jae      0x7b74
7b53: 2af7                   sub      dh, bh
7b55: 46                     inc      si
7b56: f7c60300               test     si, 3
7b5a: 7518                   jne      0x7b74
7b5c: 47                     inc      di
7b5d: 81fed0c5               cmp      si, 0xc5d0
7b61: 7211                   jb       0x7b74
7b63: ebc0                   jmp      0x7b25
7b65: 3a9c4003               cmp      bl, byte ptr [si + 0x340]
7b69: 7629                   jbe      0x7b94
7b6b: 3a9c0000               cmp      bl, byte ptr [si]
7b6f: 7219                   jb       0x7b8a
7b71: eb21                   jmp      0x7b94
7b73: 90                     nop      
7b74: 3a9c0000               cmp      bl, byte ptr [si]
7b78: 731a                   jae      0x7b94
7b7a: 889c0000               mov      byte ptr [si], bl
7b7e: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
7b82: 7306                   jae      0x7b8a
7b84: 3a9c4002               cmp      bl, byte ptr [si + 0x240]
7b88: 730a                   jae      0x7b94
7b8a: 268a25                 mov      ah, byte ptr es:[di]
7b8d: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
7b91: 268825                 mov      byte ptr es:[di], ah
7b94: fecb                   dec      bl
7b96: 83ef28                 sub      di, 0x28
7b99: e2b4                   loop     0x7b4f
7b9b: 8bc6                   mov      ax, si
7b9d: 2d10c5                 sub      ax, 0xc510
7ba0: 80fb40                 cmp      bl, 0x40
7ba3: 7338                   jae      0x7bdd
7ba5: 8a26084b               mov      ah, byte ptr [0x4b08]
7ba9: 3a26064b               cmp      ah, byte ptr [0x4b06]
7bad: 7304                   jae      0x7bb3
7baf: 8a26064b               mov      ah, byte ptr [0x4b06]
7bb3: 80fcc0                 cmp      ah, 0xc0
7bb6: 7202                   jb       0x7bba
7bb8: b4bf                   mov      ah, 0xbf
7bba: 3c40                   cmp      al, 0x40
7bbc: 7302                   jae      0x7bc0
7bbe: b040                   mov      al, 0x40
7bc0: fec4                   inc      ah
7bc2: 3ac4                   cmp      al, ah
7bc4: 7317                   jae      0x7bdd
7bc6: 8ac8                   mov      cl, al
7bc8: 32ed                   xor      ch, ch
7bca: 8bf1                   mov      si, cx
7bcc: 8acc                   mov      cl, ah
7bce: 2ac8                   sub      cl, al
7bd0: 740b                   je       0x7bdd
7bd2: 81c610c5               add      si, 0xc510
7bd6: b640                   mov      dh, 0x40
7bd8: 8834                   mov      byte ptr [si], dh
7bda: 46                     inc      si
7bdb: e2fb                   loop     0x7bd8
7bdd: c3                     ret      
7bde: 80fcc0                 cmp      ah, 0xc0
7be1: 73fa                   jae      0x7bdd
7be3: 80fc40                 cmp      ah, 0x40
7be6: 7302                   jae      0x7bea
7be8: b440                   mov      ah, 0x40
7bea: 8a360c4b               mov      dh, byte ptr [0x4b0c]
7bee: 8a160e4b               mov      dl, byte ptr [0x4b0e]
7bf2: 8afe                   mov      bh, dh
7bf4: d0ee                   shr      dh, 1
7bf6: f6d6                   not      dh
7bf8: 3ac4                   cmp      al, ah
7bfa: 72e1                   jb       0x7bdd
7bfc: 3cc0                   cmp      al, 0xc0
7bfe: 720e                   jb       0x7c0e
7c00: fec8                   dec      al
7c02: 02f2                   add      dh, dl
7c04: 73f6                   jae      0x7bfc
7c06: 2af7                   sub      dh, bh
7c08: fecb                   dec      bl
7c0a: 3cc0                   cmp      al, 0xc0
7c0c: 73f2                   jae      0x7c00
7c0e: 80fb40                 cmp      bl, 0x40
7c11: 7303                   jae      0x7c16
7c13: e99e00                 jmp      0x7cb4
7c16: 80fbc0                 cmp      bl, 0xc0
7c19: 7218                   jb       0x7c33
7c1b: eb0e                   jmp      0x7c2b
7c1d: 90                     nop      
7c1e: 02f2                   add      dh, dl
7c20: 7309                   jae      0x7c2b
7c22: 2af7                   sub      dh, bh
7c24: fecb                   dec      bl
7c26: 80fbc0                 cmp      bl, 0xc0
7c29: 7208                   jb       0x7c33
7c2b: fec8                   dec      al
7c2d: 3ac4                   cmp      al, ah
7c2f: 73ed                   jae      0x7c1e
7c31: ebaa                   jmp      0x7bdd
7c33: 8ac8                   mov      cl, al
7c35: 32ed                   xor      ch, ch
7c37: 2acc                   sub      cl, ah
7c39: 41                     inc      cx
7c3a: 8bfb                   mov      di, bx
7c3c: 81e7ff00               and      di, 0xff
7c40: d1e7                   shl      di, 1
7c42: 8bbd1048               mov      di, word ptr [di + 0x4810]
7c46: 8be8                   mov      bp, ax
7c48: 32e4                   xor      ah, ah
7c4a: 8bf0                   mov      si, ax
7c4c: 81c610c5               add      si, 0xc510
7c50: 2c40                   sub      al, 0x40
7c52: d0e8                   shr      al, 1
7c54: d0e8                   shr      al, 1
7c56: 83c704                 add      di, 4
7c59: 03f8                   add      di, ax
7c5b: eb23                   jmp      0x7c80
7c5d: 90                     nop      
7c5e: 02f2                   add      dh, dl
7c60: 731e                   jae      0x7c80
7c62: 2af7                   sub      dh, bh
7c64: 83ef28                 sub      di, 0x28
7c67: fecb                   dec      bl
7c69: 80fb40                 cmp      bl, 0x40
7c6c: 7312                   jae      0x7c80
7c6e: eb3b                   jmp      0x7cab
7c70: 90                     nop      
7c71: 3a9c4003               cmp      bl, byte ptr [si + 0x340]
7c75: 7629                   jbe      0x7ca0
7c77: 3a9c0000               cmp      bl, byte ptr [si]
7c7b: 7219                   jb       0x7c96
7c7d: eb21                   jmp      0x7ca0
7c7f: 90                     nop      
7c80: 3a9c0000               cmp      bl, byte ptr [si]
7c84: 731a                   jae      0x7ca0
7c86: 889c0000               mov      byte ptr [si], bl
7c8a: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
7c8e: 7306                   jae      0x7c96
7c90: 3a9c4002               cmp      bl, byte ptr [si + 0x240]
7c94: 730a                   jae      0x7ca0
7c96: 268a25                 mov      ah, byte ptr es:[di]
7c99: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
7c9d: 268825                 mov      byte ptr es:[di], ah
7ca0: 8bc6                   mov      ax, si
7ca2: 4e                     dec      si
7ca3: 2403                   and      al, 3
7ca5: 7501                   jne      0x7ca8
7ca7: 4f                     dec      di
7ca8: e2b4                   loop     0x7c5e
7caa: c3                     ret      
7cab: 8bc6                   mov      ax, si
7cad: 2d10c5                 sub      ax, 0xc510
7cb0: 8bcd                   mov      cx, bp
7cb2: 8ae5                   mov      ah, ch
7cb4: e901fe                 jmp      0x7ab8
7cb7: c3                     ret      
7cb8: e90bff                 jmp      0x7bc6
7cbb: 80fc40                 cmp      ah, 0x40
7cbe: 72f7                   jb       0x7cb7
7cc0: 80fcc0                 cmp      ah, 0xc0
7cc3: 7202                   jb       0x7cc7
7cc5: b4bf                   mov      ah, 0xbf
7cc7: 8a360c4b               mov      dh, byte ptr [0x4b0c]
7ccb: 8a160e4b               mov      dl, byte ptr [0x4b0e]
7ccf: 8afe                   mov      bh, dh
7cd1: d0ee                   shr      dh, 1
7cd3: f6d6                   not      dh
7cd5: 3ac4                   cmp      al, ah
7cd7: 77de                   ja       0x7cb7
7cd9: 3c40                   cmp      al, 0x40
7cdb: 730e                   jae      0x7ceb
7cdd: fec0                   inc      al
7cdf: 02f2                   add      dh, dl
7ce1: 73f6                   jae      0x7cd9
7ce3: 2af7                   sub      dh, bh
7ce5: fecb                   dec      bl
7ce7: 3c40                   cmp      al, 0x40
7ce9: 72f2                   jb       0x7cdd
7ceb: 80fb40                 cmp      bl, 0x40
7cee: 72c8                   jb       0x7cb8
7cf0: 80fbc0                 cmp      bl, 0xc0
7cf3: 7218                   jb       0x7d0d
7cf5: eb0e                   jmp      0x7d05
7cf7: 90                     nop      
7cf8: 02f2                   add      dh, dl
7cfa: 7309                   jae      0x7d05
7cfc: 2af7                   sub      dh, bh
7cfe: fecb                   dec      bl
7d00: 80fbc0                 cmp      bl, 0xc0
7d03: 7208                   jb       0x7d0d
7d05: fec0                   inc      al
7d07: 3ac4                   cmp      al, ah
7d09: 76ed                   jbe      0x7cf8
7d0b: ebaa                   jmp      0x7cb7
7d0d: 8acc                   mov      cl, ah
7d0f: 32ed                   xor      ch, ch
7d11: 2ac8                   sub      cl, al
7d13: 41                     inc      cx
7d14: 8bfb                   mov      di, bx
7d16: 81e7ff00               and      di, 0xff
7d1a: d1e7                   shl      di, 1
7d1c: 8bbd1048               mov      di, word ptr [di + 0x4810]
7d20: 8be8                   mov      bp, ax
7d22: 32e4                   xor      ah, ah
7d24: 8bf0                   mov      si, ax
7d26: 81c610c5               add      si, 0xc510
7d2a: 2c40                   sub      al, 0x40
7d2c: d0e8                   shr      al, 1
7d2e: d0e8                   shr      al, 1
7d30: 83c704                 add      di, 4
7d33: 03f8                   add      di, ax
7d35: eb2b                   jmp      0x7d62
7d37: 90                     nop      
7d38: 46                     inc      si
7d39: f7c60300               test     si, 3
7d3d: 7501                   jne      0x7d40
7d3f: 47                     inc      di
7d40: 02f2                   add      dh, dl
7d42: 731e                   jae      0x7d62
7d44: 2af7                   sub      dh, bh
7d46: 83ef28                 sub      di, 0x28
7d49: fecb                   dec      bl
7d4b: 80fb40                 cmp      bl, 0x40
7d4e: 7312                   jae      0x7d62
7d50: eb33                   jmp      0x7d85
7d52: 90                     nop      
7d53: 3a9c4003               cmp      bl, byte ptr [si + 0x340]
7d57: 7629                   jbe      0x7d82
7d59: 3a9c0000               cmp      bl, byte ptr [si]
7d5d: 7219                   jb       0x7d78
7d5f: eb21                   jmp      0x7d82
7d61: 90                     nop      
7d62: 3a9c0000               cmp      bl, byte ptr [si]
7d66: 731a                   jae      0x7d82
7d68: 889c0000               mov      byte ptr [si], bl
7d6c: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
7d70: 7306                   jae      0x7d78
7d72: 3a9c4002               cmp      bl, byte ptr [si + 0x240]
7d76: 730a                   jae      0x7d82
7d78: 268a25                 mov      ah, byte ptr es:[di]
7d7b: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
7d7f: 268825                 mov      byte ptr es:[di], ah
7d82: e2b4                   loop     0x7d38
7d84: c3                     ret      
7d85: 8bc6                   mov      ax, si
7d87: 2d10c5                 sub      ax, 0xc510
7d8a: 8bcd                   mov      cx, bp
7d8c: 8ae5                   mov      ah, ch
7d8e: fec4                   inc      ah
7d90: e933fe                 jmp      0x7bc6
7d93: c3                     ret      
7d94: 33c0                   xor      ax, ax
7d96: a3424b                 mov      word ptr [0x4b42], ax
7d99: 8a858d57               mov      al, byte ptr [di + 0x578d]
7d9d: 8aa52558               mov      ah, byte ptr [di + 0x5825]
7da1: a3084b                 mov      word ptr [0x4b08], ax
7da4: 8bc8                   mov      cx, ax
7da6: 8a85d957               mov      al, byte ptr [di + 0x57d9]
7daa: 8aa57158               mov      ah, byte ptr [di + 0x5871]
7dae: a30a4b                 mov      word ptr [0x4b0a], ax
7db1: 8bd0                   mov      dx, ax
7db3: 22e4                   and      ah, ah
7db5: 7807                   js       0x7dbe
7db7: 751f                   jne      0x7dd8
7db9: 80fa40                 cmp      dl, 0x40
7dbc: 731a                   jae      0x7dd8
7dbe: 22ed                   and      ch, ch
7dc0: 7811                   js       0x7dd3
7dc2: 750a                   jne      0x7dce
7dc4: 8ac1                   mov      al, cl
7dc6: 3c40                   cmp      al, 0x40
7dc8: 7209                   jb       0x7dd3
7dca: 3cc0                   cmp      al, 0xc0
7dcc: 7207                   jb       0x7dd5
7dce: b0c0                   mov      al, 0xc0
7dd0: eb03                   jmp      0x7dd5
7dd2: 90                     nop      
7dd3: b03f                   mov      al, 0x3f
7dd5: a2424b                 mov      byte ptr [0x4b42], al
7dd8: 8a878d57               mov      al, byte ptr [bx + 0x578d]
7ddc: 8aa72558               mov      ah, byte ptr [bx + 0x5825]
7de0: a3064b                 mov      word ptr [0x4b06], ax
7de3: 8be8                   mov      bp, ax
7de5: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
7de9: 8aa77158               mov      ah, byte ptr [bx + 0x5871]
7ded: a3404b                 mov      word ptr [0x4b40], ax
7df0: 8bf0                   mov      si, ax
7df2: 22e4                   and      ah, ah
7df4: 7806                   js       0x7dfc
7df6: 7530                   jne      0x7e28
7df8: 3c40                   cmp      al, 0x40
7dfa: 732c                   jae      0x7e28
7dfc: 8bc5                   mov      ax, bp
7dfe: 22e4                   and      ah, ah
7e00: 780f                   js       0x7e11
7e02: 7508                   jne      0x7e0c
7e04: 3c40                   cmp      al, 0x40
7e06: 7209                   jb       0x7e11
7e08: 3cc0                   cmp      al, 0xc0
7e0a: 7207                   jb       0x7e13
7e0c: b0c0                   mov      al, 0xc0
7e0e: eb03                   jmp      0x7e13
7e10: 90                     nop      
7e11: b03f                   mov      al, 0x3f
7e13: a2434b                 mov      byte ptr [0x4b43], al
7e16: 8ae0                   mov      ah, al
7e18: a0424b                 mov      al, byte ptr [0x4b42]
7e1b: 22c0                   and      al, al
7e1d: 7409                   je       0x7e28
7e1f: 3ae0                   cmp      ah, al
7e21: 7202                   jb       0x7e25
7e23: 86e0                   xchg     al, ah
7e25: e97ffc                 jmp      0x7aa7
7e28: 32c0                   xor      al, al
7e2a: a22e4b                 mov      byte ptr [0x4b2e], al
7e2d: a22f4b                 mov      byte ptr [0x4b2f], al
7e30: 8bc5                   mov      ax, bp
7e32: 2bc1                   sub      ax, cx
7e34: a30c4b                 mov      word ptr [0x4b0c], ax
7e37: 7906                   jns      0x7e3f
7e39: fe0e2e4b               dec      byte ptr [0x4b2e]
7e3d: f7d8                   neg      ax
7e3f: a3324b                 mov      word ptr [0x4b32], ax
7e42: 8bc6                   mov      ax, si
7e44: 2bc2                   sub      ax, dx
7e46: a30e4b                 mov      word ptr [0x4b0e], ax
7e49: 7906                   jns      0x7e51
7e4b: fe0e2f4b               dec      byte ptr [0x4b2f]
7e4f: f7d8                   neg      ax
7e51: a2344b                 mov      byte ptr [0x4b34], al
7e54: 3a26334b               cmp      ah, byte ptr [0x4b33]
7e58: 7212                   jb       0x7e6c
7e5a: 7508                   jne      0x7e64
7e5c: 8ad8                   mov      bl, al
7e5e: 3a1e324b               cmp      bl, byte ptr [0x4b32]
7e62: 7208                   jb       0x7e6c
7e64: 8826334b               mov      byte ptr [0x4b33], ah
7e68: 881e324b               mov      byte ptr [0x4b32], bl
7e6c: a10c4b                 mov      ax, word ptr [0x4b0c]
7e6f: 8bc8                   mov      cx, ax
7e71: a10e4b                 mov      ax, word ptr [0x4b0e]
7e74: 8bd0                   mov      dx, ax
7e76: 33db                   xor      bx, bx
7e78: be0100                 mov      si, 1
7e7b: a1324b                 mov      ax, word ptr [0x4b32]
7e7e: 22e4                   and      ah, ah
7e80: 7507                   jne      0x7e89
7e82: 3c40                   cmp      al, 0x40
7e84: 7303                   jae      0x7e89
7e86: c3                     ret      
7e87: d0d8                   rcr      al, 1
7e89: d1e9                   shr      cx, 1
7e8b: d0df                   rcr      bh, 1
7e8d: d1ea                   shr      dx, 1
7e8f: d0db                   rcr      bl, 1
7e91: d1e6                   shl      si, 1
7e93: d0ec                   shr      ah, 1
7e95: 75f0                   jne      0x7e87
7e97: d0d8                   rcr      al, 1
7e99: 3c40                   cmp      al, 0x40
7e9b: 73ec                   jae      0x7e89
7e9d: 890e0c4b               mov      word ptr [0x4b0c], cx
7ea1: 89160e4b               mov      word ptr [0x4b0e], dx
7ea5: 32c0                   xor      al, al
7ea7: a3324b                 mov      word ptr [0x4b32], ax
7eaa: 883e304b               mov      byte ptr [0x4b30], bh
7eae: 881e314b               mov      byte ptr [0x4b31], bl
7eb2: 8bde                   mov      bx, si
7eb4: 881e374b               mov      byte ptr [0x4b37], bl
7eb8: 32c0                   xor      al, al
7eba: a2344b                 mov      byte ptr [0x4b34], al
7ebd: a00b4b                 mov      al, byte ptr [0x4b0b]
7ec0: eb58                   jmp      0x7f1a
7ec2: 90                     nop      
7ec3: a07354                 mov      al, byte ptr [0x5473]
7ec6: 22c0                   and      al, al
7ec8: 79bc                   jns      0x7e86
7eca: b03f                   mov      al, 0x3f
7ecc: b3c0                   mov      bl, 0xc0
7ece: 80262e4bff             and      byte ptr [0x4b2e], 0xff
7ed3: 790a                   jns      0x7edf
7ed5: 881e064b               mov      byte ptr [0x4b06], bl
7ed9: a2084b                 mov      byte ptr [0x4b08], al
7edc: e9a900                 jmp      0x7f88
7edf: 881e084b               mov      byte ptr [0x4b08], bl
7ee3: a2064b                 mov      byte ptr [0x4b06], al
7ee6: e99f00                 jmp      0x7f88
7ee9: a0304b                 mov      al, byte ptr [0x4b30]
7eec: 0006324b               add      byte ptr [0x4b32], al
7ef0: a00c4b                 mov      al, byte ptr [0x4b0c]
7ef3: 1006084b               adc      byte ptr [0x4b08], al
7ef7: a02e4b                 mov      al, byte ptr [0x4b2e]
7efa: 1006094b               adc      byte ptr [0x4b09], al
7efe: a0314b                 mov      al, byte ptr [0x4b31]
7f01: 0006344b               add      byte ptr [0x4b34], al
7f05: a00e4b                 mov      al, byte ptr [0x4b0e]
7f08: 10060a4b               adc      byte ptr [0x4b0a], al
7f0c: a02f4b                 mov      al, byte ptr [0x4b2f]
7f0f: 10060b4b               adc      byte ptr [0x4b0b], al
7f13: a00b4b                 mov      al, byte ptr [0x4b0b]
7f16: fecb                   dec      bl
7f18: 74a9                   je       0x7ec3
7f1a: 0a06094b               or       al, byte ptr [0x4b09]
7f1e: 75c9                   jne      0x7ee9
7f20: 32c0                   xor      al, al
7f22: a2324b                 mov      byte ptr [0x4b32], al
7f25: a2344b                 mov      byte ptr [0x4b34], al
7f28: a0414b                 mov      al, byte ptr [0x4b41]
7f2b: eb2f                   jmp      0x7f5c
7f2d: 90                     nop      
7f2e: a0304b                 mov      al, byte ptr [0x4b30]
7f31: 2806324b               sub      byte ptr [0x4b32], al
7f35: a00c4b                 mov      al, byte ptr [0x4b0c]
7f38: 8a262e4b               mov      ah, byte ptr [0x4b2e]
7f3c: 1906064b               sbb      word ptr [0x4b06], ax
7f40: a0314b                 mov      al, byte ptr [0x4b31]
7f43: 2806344b               sub      byte ptr [0x4b34], al
7f47: a00e4b                 mov      al, byte ptr [0x4b0e]
7f4a: 8a262f4b               mov      ah, byte ptr [0x4b2f]
7f4e: 1906404b               sbb      word ptr [0x4b40], ax
7f52: a0414b                 mov      al, byte ptr [0x4b41]
7f55: fecb                   dec      bl
7f57: 7503                   jne      0x7f5c
7f59: e967ff                 jmp      0x7ec3
7f5c: 0a06074b               or       al, byte ptr [0x4b07]
7f60: 75cc                   jne      0x7f2e
7f62: e82300                 call     0x7f88
7f65: a00a4b                 mov      al, byte ptr [0x4b0a]
7f68: 8a26404b               mov      ah, byte ptr [0x4b40]
7f6c: 3ac4                   cmp      al, ah
7f6e: 7315                   jae      0x7f85
7f70: a2404b                 mov      byte ptr [0x4b40], al
7f73: 88260a4b               mov      byte ptr [0x4b0a], ah
7f77: a0084b                 mov      al, byte ptr [0x4b08]
7f7a: 8a26064b               mov      ah, byte ptr [0x4b06]
7f7e: a2064b                 mov      byte ptr [0x4b06], al
7f81: 8826084b               mov      byte ptr [0x4b08], ah
7f85: e9b100                 jmp      0x8039
7f88: 8a26424b               mov      ah, byte ptr [0x4b42]
7f8c: 22e4                   and      ah, ah
7f8e: 740c                   je       0x7f9c
7f90: a0084b                 mov      al, byte ptr [0x4b08]
7f93: 3ae0                   cmp      ah, al
7f95: 7202                   jb       0x7f99
7f97: 86e0                   xchg     al, ah
7f99: e80bfb                 call     0x7aa7
7f9c: 8a26434b               mov      ah, byte ptr [0x4b43]
7fa0: 22e4                   and      ah, ah
7fa2: 740c                   je       0x7fb0
7fa4: a0064b                 mov      al, byte ptr [0x4b06]
7fa7: 3ae0                   cmp      ah, al
7fa9: 7202                   jb       0x7fad
7fab: 86e0                   xchg     al, ah
7fad: e9f7fa                 jmp      0x7aa7
7fb0: c3                     ret      
7fb1: 8a87bd58               mov      al, byte ptr [bx + 0x58bd]
7fb5: 0a85bd58               or       al, byte ptr [di + 0x58bd]
7fb9: 78f5                   js       0x7fb0
7fbb: 8a872558               mov      al, byte ptr [bx + 0x5825]
7fbf: 0a852558               or       al, byte ptr [di + 0x5825]
7fc3: 0a877158               or       al, byte ptr [bx + 0x5871]
7fc7: 0a857158               or       al, byte ptr [di + 0x5871]
7fcb: 742f                   je       0x7ffc
7fcd: e9c4fd                 jmp      0x7d94
7fd0: 8a878d57               mov      al, byte ptr [bx + 0x578d]
7fd4: 3a061d4b               cmp      al, byte ptr [0x4b1d]
7fd8: 7303                   jae      0x7fdd
7fda: a21d4b                 mov      byte ptr [0x4b1d], al
7fdd: 3a061e4b               cmp      al, byte ptr [0x4b1e]
7fe1: 7203                   jb       0x7fe6
7fe3: a21e4b                 mov      byte ptr [0x4b1e], al
7fe6: 8a858d57               mov      al, byte ptr [di + 0x578d]
7fea: 3a061d4b               cmp      al, byte ptr [0x4b1d]
7fee: 7303                   jae      0x7ff3
7ff0: a21d4b                 mov      byte ptr [0x4b1d], al
7ff3: 3a061e4b               cmp      al, byte ptr [0x4b1e]
7ff7: 7203                   jb       0x7ffc
7ff9: a21e4b                 mov      byte ptr [0x4b1e], al
7ffc: 8a87d957               mov      al, byte ptr [bx + 0x57d9]
8000: 3a85d957               cmp      al, byte ptr [di + 0x57d9]
8004: 721b                   jb       0x8021
8006: a20a4b                 mov      byte ptr [0x4b0a], al
8009: 8a85d957               mov      al, byte ptr [di + 0x57d9]
800d: a2404b                 mov      byte ptr [0x4b40], al
8010: 8a878d57               mov      al, byte ptr [bx + 0x578d]
8014: a2084b                 mov      byte ptr [0x4b08], al
8017: 8a858d57               mov      al, byte ptr [di + 0x578d]
801b: a2064b                 mov      byte ptr [0x4b06], al
801e: eb19                   jmp      0x8039
8020: 90                     nop      
8021: a2404b                 mov      byte ptr [0x4b40], al
8024: 8a85d957               mov      al, byte ptr [di + 0x57d9]
8028: a20a4b                 mov      byte ptr [0x4b0a], al
802b: 8a878d57               mov      al, byte ptr [bx + 0x578d]
802f: a2064b                 mov      byte ptr [0x4b06], al
8032: 8a858d57               mov      al, byte ptr [di + 0x578d]
8036: a2084b                 mov      byte ptr [0x4b08], al
8039: 8026ba54ff             and      byte ptr [0x54ba], 0xff
803e: 7944                   jns      0x8084
8040: a00a4b                 mov      al, byte ptr [0x4b0a]
8043: 3cc0                   cmp      al, 0xc0
8045: 7307                   jae      0x804e
8047: a0404b                 mov      al, byte ptr [0x4b40]
804a: 3cc0                   cmp      al, 0xc0
804c: 7236                   jb       0x8084
804e: 8a1e084b               mov      bl, byte ptr [0x4b08]
8052: 3a1e064b               cmp      bl, byte ptr [0x4b06]
8056: 7209                   jb       0x8061
8058: 8ac3                   mov      al, bl
805a: 8a1e064b               mov      bl, byte ptr [0x4b06]
805e: eb04                   jmp      0x8064
8060: 90                     nop      
8061: a0064b                 mov      al, byte ptr [0x4b06]
8064: 3cc0                   cmp      al, 0xc0
8066: 7202                   jb       0x806a
8068: b0bf                   mov      al, 0xbf
806a: fec0                   inc      al
806c: 80fb40                 cmp      bl, 0x40
806f: 7302                   jae      0x8073
8071: b340                   mov      bl, 0x40
8073: 8ae0                   mov      ah, al
8075: b0c0                   mov      al, 0xc0
8077: eb07                   jmp      0x8080
8079: 90                     nop      
807a: 888750c6               mov      byte ptr [bx - 0x39b0], al
807e: fec3                   inc      bl
8080: 3adc                   cmp      bl, ah
8082: 72f6                   jb       0x807a
8084: a00a4b                 mov      al, byte ptr [0x4b0a]
8087: 2a06404b               sub      al, byte ptr [0x4b40]
808b: a20e4b                 mov      byte ptr [0x4b0e], al
808e: a0084b                 mov      al, byte ptr [0x4b08]
8091: 8a1e0a4b               mov      bl, byte ptr [0x4b0a]
8095: 8a26064b               mov      ah, byte ptr [0x4b06]
8099: 2a26084b               sub      ah, byte ptr [0x4b08]
809d: 7218                   jb       0x80b7
809f: 88260c4b               mov      byte ptr [0x4b0c], ah
80a3: 3a260e4b               cmp      ah, byte ptr [0x4b0e]
80a7: 7207                   jb       0x80b0
80a9: 8a26064b               mov      ah, byte ptr [0x4b06]
80ad: e90bfc                 jmp      0x7cbb
80b0: 8a26404b               mov      ah, byte ptr [0x4b40]
80b4: e919fa                 jmp      0x7ad0
80b7: f6dc                   neg      ah
80b9: 88260c4b               mov      byte ptr [0x4b0c], ah
80bd: 3a260e4b               cmp      ah, byte ptr [0x4b0e]
80c1: 7207                   jb       0x80ca
80c3: 8a26064b               mov      ah, byte ptr [0x4b06]
80c7: e914fb                 jmp      0x7bde
80ca: 8a26404b               mov      ah, byte ptr [0x4b40]
80ce: e9f0f8                 jmp      0x79c1
80d1: c3                     ret      
80d2: 32ff                   xor      bh, bh
80d4: 881eb854               mov      byte ptr [0x54b8], bl
80d8: 8aa790c9               mov      ah, byte ptr [bx - 0x3670]
80dc: 80e40f                 and      ah, 0xf
80df: b002                   mov      al, 2
80e1: bac403                 mov      dx, 0x3c4
80e4: ef                     out      dx, ax
80e5: c3                     ret      
80e6: b810c5                 mov      ax, 0xc510
80e9: 2ea3c87a               mov      word ptr cs:[0x7ac8], ax
80ed: 2ea3d47b               mov      word ptr cs:[0x7bd4], ax
80f1: c606ba5400             mov      byte ptr [0x54ba], 0
80f6: be5f81                 mov      si, 0x815f
80f9: eb27                   jmp      0x8122
80fb: 90                     nop      
80fc: b850c7                 mov      ax, 0xc750
80ff: 2ea3c87a               mov      word ptr cs:[0x7ac8], ax
8103: 2ea3d47b               mov      word ptr cs:[0x7bd4], ax
8107: c606ba5480             mov      byte ptr [0x54ba], 0x80
810c: 8cc2                   mov      dx, es
810e: 8cd8                   mov      ax, ds
8110: 8ec0                   mov      es, ax
8112: be50c5                 mov      si, 0xc550
8115: bf90c7                 mov      di, 0xc790
8118: b94000                 mov      cx, 0x40
811b: f3a5                   rep movsw word ptr es:[di], word ptr [si]
811d: 8ec2                   mov      es, dx
811f: be7f81                 mov      si, 0x817f
8122: 8cc2                   mov      dx, es
8124: b80000                 mov      ax, 0
8127: 8ec0                   mov      es, ax
8129: 8ed8                   mov      ds, ax
812b: 8bc6                   mov      ax, si
812d: bf687a                 mov      di, 0x7a68
8130: b92000                 mov      cx, 0x20
8133: 90                     nop      
8134: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
8136: 8bf0                   mov      si, ax
8138: bf747b                 mov      di, 0x7b74
813b: b92000                 mov      cx, 0x20
813e: 90                     nop      
813f: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
8141: 8bf0                   mov      si, ax
8143: bf807c                 mov      di, 0x7c80
8146: b92000                 mov      cx, 0x20
8149: 90                     nop      
814a: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
814c: 8bf0                   mov      si, ax
814e: bf627d                 mov      di, 0x7d62
8151: b92000                 mov      cx, 0x20
8154: 90                     nop      
8155: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
8157: b8d809                 mov      ax, 0x9d8
815a: 8ed8                   mov      ds, ax
815c: 8ec2                   mov      es, dx
815e: c3                     ret      
815f: 3a9c0000               cmp      bl, byte ptr [si]
8163: 731a                   jae      0x817f
8165: 889c0000               mov      byte ptr [si], bl
8169: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
816d: 7306                   jae      0x8175
816f: 3a9c4002               cmp      bl, byte ptr [si + 0x240]
8173: 730a                   jae      0x817f
8175: 268a25                 mov      ah, byte ptr es:[di]
8178: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
817c: 268825                 mov      byte ptr es:[di], ah
817f: 3a9c4001               cmp      bl, byte ptr [si + 0x140]
8183: 7204                   jb       0x8189
8185: 889c4001               mov      byte ptr [si + 0x140], bl
8189: 3a9c0000               cmp      bl, byte ptr [si]
818d: 7310                   jae      0x819f
818f: 889c4002               mov      byte ptr [si + 0x240], bl
8193: 730a                   jae      0x819f
8195: 268a25                 mov      ah, byte ptr es:[di]
8198: 8aa4c003               mov      ah, byte ptr [si + 0x3c0]
819c: 268825                 mov      byte ptr es:[di], ah
819f: e81300                 call     0x81b5
81a2: b0e1                   mov      al, 0xe1
81a4: 2ea2777a               mov      byte ptr cs:[0x7a77], al
81a8: 2ea2837b               mov      byte ptr cs:[0x7b83], al
81ac: 2ea28f7c               mov      byte ptr cs:[0x7c8f], al
81b0: 2ea2717d               mov      byte ptr cs:[0x7d71], al
81b4: c3                     ret      
81b5: b84002                 mov      ax, 0x240
81b8: 2ea3747a               mov      word ptr cs:[0x7a74], ax
81bc: 2ea3807b               mov      word ptr cs:[0x7b80], ax
81c0: 2ea38c7c               mov      word ptr cs:[0x7c8c], ax
81c4: 2ea36e7d               mov      word ptr cs:[0x7d6e], ax
81c8: c3                     ret      
81c9: 8cc2                   mov      dx, es
81cb: 8cd8                   mov      ax, ds
81cd: 8ec0                   mov      es, ax
81cf: be90c6                 mov      si, 0xc690
81d2: bf90c8                 mov      di, 0xc890
81d5: b94000                 mov      cx, 0x40
81d8: f3a5                   rep movsw word ptr es:[di], word ptr [si]
81da: 8ec2                   mov      es, dx
81dc: c3                     ret      
81dd: 0000                   add      byte ptr [bx + si], al
81df: 00e8                   add      al, ch
81e1: 65d8e8                 fsubr    st(0)
81e4: 3800                   cmp      byte ptr [bx + si], al
81e6: e826f3                 call     0x750f
81e9: e8df01                 call     0x83cb
81ec: e8b5da                 call     0x5ca4
81ef: e81bd4                 call     0x560d
81f2: e8f7da                 call     0x5cec
81f5: e86002                 call     0x8458
81f8: a01354                 mov      al, byte ptr [0x5413]
81fb: 22c0                   and      al, al
81fd: 7415                   je       0x8214
81ff: e82d04                 call     0x862f
8202: e851d4                 call     0x5656
8205: e80fdb                 call     0x5d17
8208: e86305                 call     0x876e
820b: e88904                 call     0x8697
820e: e89f01                 call     0x83b0
8211: e849db                 call     0x5d5d
8214: e87e01                 call     0x8395
8217: e89c00                 call     0x82b6
821a: e9f4c5                 jmp      0x4811
821d: c3                     ret      
821e: a1474c                 mov      ax, word ptr [0x4c47]
8221: 8bd0                   mov      dx, ax
8223: a16f4c                 mov      ax, word ptr [0x4c6f]
8226: 86f0                   xchg     al, dh
8228: 8bc8                   mov      cx, ax
822a: 89160e4b               mov      word ptr [0x4b0e], dx
822e: a3344b                 mov      word ptr [0x4b34], ax
8231: a0444c                 mov      al, byte ptr [0x4c44]
8234: 8a266c4c               mov      ah, byte ptr [0x4c6c]
8238: 02063f4c               add      al, byte ptr [0x4c3f]
823c: 1226674c               adc      ah, byte ptr [0x4c67]
8240: d1f8                   sar      ax, 1
8242: a30c4b                 mov      word ptr [0x4b0c], ax
8245: a0414c                 mov      al, byte ptr [0x4c41]
8248: 8a26694c               mov      ah, byte ptr [0x4c69]
824c: 2a06464c               sub      al, byte ptr [0x4c46]
8250: 1a266e4c               sbb      ah, byte ptr [0x4c6e]
8254: d1f8                   sar      ax, 1
8256: a3324b                 mov      word ptr [0x4b32], ax
8259: f7da                   neg      dx
825b: f7d9                   neg      cx
825d: 88163e53               mov      byte ptr [0x533e], dl
8261: 88364153               mov      byte ptr [0x5341], dh
8265: 880e4453               mov      byte ptr [0x5344], cl
8269: 882e4753               mov      byte ptr [0x5347], ch
826d: a00e4b                 mov      al, byte ptr [0x4b0e]
8270: 8ae0                   mov      ah, al
8272: a33c53                 mov      word ptr [0x533c], ax
8275: a00f4b                 mov      al, byte ptr [0x4b0f]
8278: 8ae0                   mov      ah, al
827a: a33f53                 mov      word ptr [0x533f], ax
827d: a0344b                 mov      al, byte ptr [0x4b34]
8280: 8ae0                   mov      ah, al
8282: a34253                 mov      word ptr [0x5342], ax
8285: a0354b                 mov      al, byte ptr [0x4b35]
8288: 8ae0                   mov      ah, al
828a: a34553                 mov      word ptr [0x5345], ax
828d: a10c4b                 mov      ax, word ptr [0x4b0c]
8290: 8bc8                   mov      cx, ax
8292: 28063c53               sub      byte ptr [0x533c], al
8296: 18263f53               sbb      byte ptr [0x533f], ah
829a: a1324b                 mov      ax, word ptr [0x4b32]
829d: 28064253               sub      byte ptr [0x5342], al
82a1: 18264553               sbb      byte ptr [0x5345], ah
82a5: 00064353               add      byte ptr [0x5343], al
82a9: 10264653               adc      byte ptr [0x5346], ah
82ad: 000e3d53               add      byte ptr [0x533d], cl
82b1: 102e4053               adc      byte ptr [0x5340], ch
82b5: c3                     ret      
82b6: bb0200                 mov      bx, 2
82b9: 8a871553               mov      al, byte ptr [bx + 0x5315]
82bd: 8aa71b53               mov      ah, byte ptr [bx + 0x531b]
82c1: 99                     cdq      
82c2: b90200                 mov      cx, 2
82c5: 80fb01                 cmp      bl, 1
82c8: 7501                   jne      0x82cb
82ca: 49                     dec      cx
82cb: d0ea                   shr      dl, 1
82cd: d1d8                   rcr      ax, 1
82cf: e2fa                   loop     0x82cb
82d1: e891b9                 call     0x3c65
82d4: 99                     cdq      
82d5: 00870c53               add      byte ptr [bx + 0x530c], al
82d9: 10a70f53               adc      byte ptr [bx + 0x530f], ah
82dd: 10971253               adc      byte ptr [bx + 0x5312], dl
82e1: fecb                   dec      bl
82e3: 79d4                   jns      0x82b9
82e5: a01353                 mov      al, byte ptr [0x5313]
82e8: 22c0                   and      al, al
82ea: 7817                   js       0x8303
82ec: 3c03                   cmp      al, 3
82ee: 7213                   jb       0x8303
82f0: 7507                   jne      0x82f9
82f2: a01053                 mov      al, byte ptr [0x5310]
82f5: 3ce8                   cmp      al, 0xe8
82f7: 720a                   jb       0x8303
82f9: c6061053e7             mov      byte ptr [0x5310], 0xe7
82fe: c606135303             mov      byte ptr [0x5313], 3
8303: bb0200                 mov      bx, 2
8306: 8a877653               mov      al, byte ptr [bx + 0x5376]
830a: 8aa77953               mov      ah, byte ptr [bx + 0x5379]
830e: e854b9                 call     0x3c65
8311: 00872d53               add      byte ptr [bx + 0x532d], al
8315: 10a73053               adc      byte ptr [bx + 0x5330], ah
8319: 80fb01                 cmp      bl, 1
831c: 7445                   je       0x8363
831e: bad32c                 mov      dx, 0x2cd3
8321: a07f54                 mov      al, byte ptr [0x547f]
8324: 22c0                   and      al, al
8326: 790a                   jns      0x8332
8328: a06554                 mov      al, byte ptr [0x5465]
832b: 3ce0                   cmp      al, 0xe0
832d: 7503                   jne      0x8332
832f: baf50a                 mov      dx, 0xaf5
8332: 8a873053               mov      al, byte ptr [bx + 0x5330]
8336: 22c0                   and      al, al
8338: 780b                   js       0x8345
833a: 8ac6                   mov      al, dh
833c: 3a873053               cmp      al, byte ptr [bx + 0x5330]
8340: 7321                   jae      0x8363
8342: eb09                   jmp      0x834d
8344: 90                     nop      
8345: 8ac2                   mov      al, dl
8347: 3a873053               cmp      al, byte ptr [bx + 0x5330]
834b: 7216                   jb       0x8363
834d: 88873053               mov      byte ptr [bx + 0x5330], al
8351: 32871e53               xor      al, byte ptr [bx + 0x531e]
8355: 7808                   js       0x835f
8357: 88bf1e53               mov      byte ptr [bx + 0x531e], bh
835b: 88bf1853               mov      byte ptr [bx + 0x5318], bh
835f: 88bf2d53               mov      byte ptr [bx + 0x532d], bh
8363: fecb                   dec      bl
8365: 799f                   jns      0x8306
8367: a03253                 mov      al, byte ptr [0x5332]
836a: 22c0                   and      al, al
836c: 7902                   jns      0x8370
836e: f6d8                   neg      al
8370: 3c0f                   cmp      al, 0xf
8372: f5                     cmc      
8373: d01ee954               rcr      byte ptr [0x54e9], 1
8377: b90500                 mov      cx, 5
837a: a02d53                 mov      al, byte ptr [0x532d]
837d: 8a263053               mov      ah, byte ptr [0x5330]
8381: 99                     cdq      
8382: d0ea                   shr      dl, 1
8384: d1d8                   rcr      ax, 1
8386: e2fa                   loop     0x8382
8388: 8a16f24a               mov      dl, byte ptr [0x4af2]
838c: 32f6                   xor      dh, dh
838e: 2bd0                   sub      dx, ax
8390: 8916e64a               mov      word ptr [0x4ae6], dx
8394: c3                     ret      
8395: bb0200                 mov      bx, 2
8398: 8a872153               mov      al, byte ptr [bx + 0x5321]
839c: 8aa72753               mov      ah, byte ptr [bx + 0x5327]
83a0: e8c2b8                 call     0x3c65
83a3: 00871553               add      byte ptr [bx + 0x5315], al
83a7: 10a71b53               adc      byte ptr [bx + 0x531b], ah
83ab: fecb                   dec      bl
83ad: 79e9                   jns      0x8398
83af: c3                     ret      
83b0: bb0200                 mov      bx, 2
83b3: 8a872453               mov      al, byte ptr [bx + 0x5324]
83b7: 8aa72a53               mov      ah, byte ptr [bx + 0x532a]
83bb: e8a7b8                 call     0x3c65
83be: 00871853               add      byte ptr [bx + 0x5318], al
83c2: 10a71e53               adc      byte ptr [bx + 0x531e], ah
83c6: fecb                   dec      bl
83c8: 79e9                   jns      0x83b3
83ca: c3                     ret      
83cb: a02d53                 mov      al, byte ptr [0x532d]
83ce: 8a263053               mov      ah, byte ptr [0x5330]
83d2: e8f1d5                 call     0x59c6
83d5: a30c4b                 mov      word ptr [0x4b0c], ax
83d8: 99                     cdq      
83d9: 88162e4b               mov      byte ptr [0x4b2e], dl
83dd: a02f53                 mov      al, byte ptr [0x532f]
83e0: 8a263253               mov      ah, byte ptr [0x5332]
83e4: e8dfd5                 call     0x59c6
83e7: 99                     cdq      
83e8: 88162f4b               mov      byte ptr [0x4b2f], dl
83ec: d1f8                   sar      ax, 1
83ee: 8826f54a               mov      byte ptr [0x4af5], ah
83f2: a2144b                 mov      byte ptr [0x4b14], al
83f5: a00d53                 mov      al, byte ptr [0x530d]
83f8: 8a261053               mov      ah, byte ptr [0x5310]
83fc: 2b060c4b               sub      ax, word ptr [0x4b0c]
8400: a25454                 mov      byte ptr [0x5454], al
8403: 88265754               mov      byte ptr [0x5457], ah
8407: a01353                 mov      al, byte ptr [0x5313]
840a: 1a062e4b               sbb      al, byte ptr [0x4b2e]
840e: a2e054                 mov      byte ptr [0x54e0], al
8411: a00d53                 mov      al, byte ptr [0x530d]
8414: 8a261053               mov      ah, byte ptr [0x5310]
8418: 8a161353               mov      dl, byte ptr [0x5313]
841c: 03060c4b               add      ax, word ptr [0x4b0c]
8420: 12162e4b               adc      dl, byte ptr [0x4b2e]
8424: 8bc8                   mov      cx, ax
8426: 8af2                   mov      dh, dl
8428: 2a06144b               sub      al, byte ptr [0x4b14]
842c: a25354                 mov      byte ptr [0x5453], al
842f: 1a26f54a               sbb      ah, byte ptr [0x4af5]
8433: 88265654               mov      byte ptr [0x5456], ah
8437: 1a162f4b               sbb      dl, byte ptr [0x4b2f]
843b: 8816df54               mov      byte ptr [0x54df], dl
843f: 020e144b               add      cl, byte ptr [0x4b14]
8443: 880e5254               mov      byte ptr [0x5452], cl
8447: 122ef54a               adc      ch, byte ptr [0x4af5]
844b: 882e5554               mov      byte ptr [0x5455], ch
844f: 12362f4b               adc      dh, byte ptr [0x4b2f]
8453: 8836de54               mov      byte ptr [0x54de], dh
8457: c3                     ret      
8458: c606c95400             mov      byte ptr [0x54c9], 0
845d: c606685400             mov      byte ptr [0x5468], 0
8462: bb0200                 mov      bx, 2
8465: 8a874c54               mov      al, byte ptr [bx + 0x544c]
8469: 2a875254               sub      al, byte ptr [bx + 0x5452]
846d: 8887394b               mov      byte ptr [bx + 0x4b39], al
8471: 88878553               mov      byte ptr [bx + 0x5385], al
8475: 8ad0                   mov      dl, al
8477: 8a8f4f54               mov      cl, byte ptr [bx + 0x544f]
847b: 1a8f5554               sbb      cl, byte ptr [bx + 0x5455]
847f: 8aafdb54               mov      ch, byte ptr [bx + 0x54db]
8483: 1aafde54               sbb      ch, byte ptr [bx + 0x54de]
8487: 2a0ec04a               sub      cl, byte ptr [0x4ac0]
848b: 888f8853               mov      byte ptr [bx + 0x5388], cl
848f: 8ac5                   mov      al, ch
8491: 1ac7                   sbb      al, bh
8493: 8887e154               mov      byte ptr [bx + 0x54e1], al
8497: 741a                   je       0x84b3
8499: 791e                   jns      0x84b9
849b: 3cff                   cmp      al, 0xff
849d: 7506                   jne      0x84a5
849f: 8ac1                   mov      al, cl
84a1: 3cfd                   cmp      al, 0xfd
84a3: 7316                   jae      0x84bb
84a5: b800fd                 mov      ax, 0xfd00
84a8: 8887394b               mov      byte ptr [bx + 0x4b39], al
84ac: 88a73c4b               mov      byte ptr [bx + 0x4b3c], ah
84b0: e99e00                 jmp      0x8551
84b3: 8ac1                   mov      al, cl
84b5: 3c14                   cmp      al, 0x14
84b7: 7202                   jb       0x84bb
84b9: b014                   mov      al, 0x14
84bb: 88873c4b               mov      byte ptr [bx + 0x4b3c], al
84bf: 8ae0                   mov      ah, al
84c1: 51                     push     cx
84c2: 8aec                   mov      ch, ah
84c4: 8aca                   mov      cl, dl
84c6: 8ac2                   mov      al, dl
84c8: 2a874e53               sub      al, byte ptr [bx + 0x534e]
84cc: 1aa75153               sbb      ah, byte ptr [bx + 0x5351]
84d0: 52                     push     dx
84d1: e808d9                 call     0x5ddc
84d4: 5a                     pop      dx
84d5: 59                     pop      cx
84d6: 7879                   js       0x8551
84d8: 88875453               mov      byte ptr [bx + 0x5354], al
84dc: 8aec                   mov      ch, ah
84de: 8ac4                   mov      al, ah
84e0: 3c04                   cmp      al, 4
84e2: 720b                   jb       0x84ef
84e4: 80bf575302             cmp      byte ptr [bx + 0x5357], 2
84e9: 7304                   jae      0x84ef
84eb: fe06c954               inc      byte ptr [0x54c9]
84ef: 88875753               mov      byte ptr [bx + 0x5357], al
84f3: 2a060e60               sub      al, byte ptr [0x600e]
84f7: 7862                   js       0x855b
84f9: 3c07                   cmp      al, 7
84fb: 725e                   jb       0x855b
84fd: 3a066854               cmp      al, byte ptr [0x5468]
8501: 7203                   jb       0x8506
8503: a26854                 mov      byte ptr [0x5468], al
8506: 2c06                   sub      al, 6
8508: 8a26494b               mov      ah, byte ptr [0x4b49]
850c: 22c0                   and      al, al
850e: 782d                   js       0x853d
8510: 8a261ec0               mov      ah, byte ptr [0xc01e]
8514: fec4                   inc      ah
8516: 88261ec0               mov      byte ptr [0xc01e], ah
851a: 3a261dc0               cmp      ah, byte ptr [0xc01d]
851e: 731d                   jae      0x853d
8520: 3c80                   cmp      al, 0x80
8522: 7202                   jb       0x8526
8524: b07f                   mov      al, 0x7f
8526: 8ae0                   mov      ah, al
8528: d0e8                   shr      al, 1
852a: 02e0                   add      ah, al
852c: 02a7d054               add      ah, byte ptr [bx + 0x54d0]
8530: 7302                   jae      0x8534
8532: b4ff                   mov      ah, 0xff
8534: 88a7d054               mov      byte ptr [bx + 0x54d0], ah
8538: c6065e5480             mov      byte ptr [0x545e], 0x80
853d: 8ac5                   mov      al, ch
853f: 3c12                   cmp      al, 0x12
8541: 7207                   jb       0x854a
8543: c6875453ff             mov      byte ptr [bx + 0x5354], 0xff
8548: b011                   mov      al, 0x11
854a: 88875753               mov      byte ptr [bx + 0x5357], al
854e: eb10                   jmp      0x8560
8550: 90                     nop      
8551: 32c0                   xor      al, al
8553: 88875453               mov      byte ptr [bx + 0x5354], al
8557: 88875753               mov      byte ptr [bx + 0x5357], al
855b: 32c0                   xor      al, al
855d: a21ec0                 mov      byte ptr [0xc01e], al
8560: 8a87394b               mov      al, byte ptr [bx + 0x4b39]
8564: 88874e53               mov      byte ptr [bx + 0x534e], al
8568: 8a873c4b               mov      al, byte ptr [bx + 0x4b3c]
856c: 88875153               mov      byte ptr [bx + 0x5351], al
8570: fecb                   dec      bl
8572: 7803                   js       0x8577
8574: e9eefe                 jmp      0x8465
8577: a05453                 mov      al, byte ptr [0x5354]
857a: 02065553               add      al, byte ptr [0x5355]
857e: 8a265753               mov      ah, byte ptr [0x5357]
8582: 12265853               adc      ah, byte ptr [0x5358]
8586: d1f8                   sar      ax, 1
8588: a30c4b                 mov      word ptr [0x4b0c], ax
858b: 02065653               add      al, byte ptr [0x5356]
858f: 12265953               adc      ah, byte ptr [0x5359]
8593: d1f8                   sar      ax, 1
8595: a36c53                 mov      word ptr [0x536c], ax
8598: e88002                 call     0x881b
859b: a05453                 mov      al, byte ptr [0x5354]
859e: 2a065553               sub      al, byte ptr [0x5355]
85a2: 8a265753               mov      ah, byte ptr [0x5357]
85a6: 1a265853               sbb      ah, byte ptr [0x5358]
85aa: 8bd0                   mov      dx, ax
85ac: d1e0                   shl      ax, 1
85ae: 03c2                   add      ax, dx
85b0: 8af4                   mov      dh, ah
85b2: 7902                   jns      0x85b6
85b4: f7d8                   neg      ax
85b6: 80fc10                 cmp      ah, 0x10
85b9: 7203                   jb       0x85be
85bb: b80010                 mov      ax, 0x1000
85be: 22f6                   and      dh, dh
85c0: 7902                   jns      0x85c4
85c2: f7d8                   neg      ax
85c4: a37253                 mov      word ptr [0x5372], ax
85c7: a10c4b                 mov      ax, word ptr [0x4b0c]
85ca: 2a065653               sub      al, byte ptr [0x5356]
85ce: 1a265953               sbb      ah, byte ptr [0x5359]
85d2: a35a53                 mov      word ptr [0x535a], ax
85d5: a16c53                 mov      ax, word ptr [0x536c]
85d8: 0ac4                   or       al, ah
85da: a2264b                 mov      byte ptr [0x4b26], al
85dd: 7543                   jne      0x8622
85df: a0e14a                 mov      al, byte ptr [0x4ae1]
85e2: 22c0                   and      al, al
85e4: 753c                   jne      0x8622
85e6: b980ff                 mov      cx, 0xff80
85e9: a03053                 mov      al, byte ptr [0x5330]
85ec: 22c0                   and      al, al
85ee: 7914                   jns      0x8604
85f0: a08a56                 mov      al, byte ptr [0x568a]
85f3: 3c07                   cmp      al, 7
85f5: 7504                   jne      0x85fb
85f7: b1f0                   mov      cl, 0xf0
85f9: eb10                   jmp      0x860b
85fb: 3c04                   cmp      al, 4
85fd: 7523                   jne      0x8622
85ff: b1f8                   mov      cl, 0xf8
8601: eb08                   jmp      0x860b
8603: 90                     nop      
8604: 3c10                   cmp      al, 0x10
8606: 7203                   jb       0x860b
8608: b900ff                 mov      cx, 0xff00
860b: 8bc1                   mov      ax, cx
860d: 2b065a53               sub      ax, word ptr [0x535a]
8611: 790f                   jns      0x8622
8613: a01e53                 mov      al, byte ptr [0x531e]
8616: 22c0                   and      al, al
8618: 7904                   jns      0x861e
861a: 3cff                   cmp      al, 0xff
861c: 7204                   jb       0x8622
861e: 890e5a53               mov      word ptr [0x535a], cx
8622: e87ea2                 call     0x28a3
8625: a08153                 mov      al, byte ptr [0x5381]
8628: a21fc0                 mov      byte ptr [0xc01f], al
862b: e864dc                 call     0x6292
862e: c3                     ret      
862f: a04953                 mov      al, byte ptr [0x5349]
8632: 02067d53               add      al, byte ptr [0x537d]
8636: a26753                 mov      byte ptr [0x5367], al
8639: a04c53                 mov      al, byte ptr [0x534c]
863c: 12068053               adc      al, byte ptr [0x5380]
8640: a26a53                 mov      byte ptr [0x536a], al
8643: a15c53                 mov      ax, word ptr [0x535c]
8646: 0a266553               or       ah, byte ptr [0x5365]
864a: 7811                   js       0x865d
864c: 22c0                   and      al, al
864e: 740d                   je       0x865d
8650: 2a066553               sub      al, byte ptr [0x5365]
8654: a25c53                 mov      byte ptr [0x535c], al
8657: 7304                   jae      0x865d
8659: fe0e5d53               dec      byte ptr [0x535d]
865d: a15c53                 mov      ax, word ptr [0x535c]
8660: 8aec                   mov      ch, ah
8662: 22e4                   and      ah, ah
8664: 7902                   jns      0x8668
8666: f7d8                   neg      ax
8668: 8bd0                   mov      dx, ax
866a: e8e900                 call     0x8756
866d: 3bd0                   cmp      dx, ax
866f: 7209                   jb       0x867a
8671: 22ed                   and      ch, ch
8673: 7902                   jns      0x8677
8675: f7d8                   neg      ax
8677: a35c53                 mov      word ptr [0x535c], ax
867a: a15c53                 mov      ax, word ptr [0x535c]
867d: 02067e53               add      al, byte ptr [0x537e]
8681: 12268153               adc      ah, byte ptr [0x5381]
8685: 02064a53               add      al, byte ptr [0x534a]
8689: 12264d53               adc      ah, byte ptr [0x534d]
868d: a26853                 mov      byte ptr [0x5368], al
8690: 88266b53               mov      byte ptr [0x536b], ah
8694: eb62                   jmp      0x86f8
8696: 90                     nop      
8697: a01853                 mov      al, byte ptr [0x5318]
869a: 8a261e53               mov      ah, byte ptr [0x531e]
869e: d1f8                   sar      ax, 1
86a0: d1f8                   sar      ax, 1
86a2: d1f8                   sar      ax, 1
86a4: d1f8                   sar      ax, 1
86a6: 8b165a53               mov      dx, word ptr [0x535a]
86aa: 2bd0                   sub      dx, ax
86ac: 33c0                   xor      ax, ax
86ae: 8a1e264b               mov      bl, byte ptr [0x4b26]
86b2: 22db                   and      bl, bl
86b4: 741a                   je       0x86d0
86b6: a06853                 mov      al, byte ptr [0x5368]
86b9: 8a266b53               mov      ah, byte ptr [0x536b]
86bd: 22e4                   and      ah, ah
86bf: 7902                   jns      0x86c3
86c1: f7d8                   neg      ax
86c3: d1f8                   sar      ax, 1
86c5: d1f8                   sar      ax, 1
86c7: 80266b53ff             and      byte ptr [0x536b], 0xff
86cc: 7902                   jns      0x86d0
86ce: f7d8                   neg      ax
86d0: 03d0                   add      dx, ax
86d2: 88162453               mov      byte ptr [0x5324], dl
86d6: 88362a53               mov      byte ptr [0x532a], dh
86da: a01a53                 mov      al, byte ptr [0x531a]
86dd: 8a262053               mov      ah, byte ptr [0x5320]
86e1: d1f8                   sar      ax, 1
86e3: d1f8                   sar      ax, 1
86e5: d1f8                   sar      ax, 1
86e7: d1f8                   sar      ax, 1
86e9: 8b167253               mov      dx, word ptr [0x5372]
86ed: 2bd0                   sub      dx, ax
86ef: 88162653               mov      byte ptr [0x5326], dl
86f3: 88362c53               mov      byte ptr [0x532c], dh
86f7: c3                     ret      
86f8: a04853                 mov      al, byte ptr [0x5348]
86fb: 02067c53               add      al, byte ptr [0x537c]
86ff: 8a264b53               mov      ah, byte ptr [0x534b]
8703: 12267f53               adc      ah, byte ptr [0x537f]
8707: a30c4b                 mov      word ptr [0x4b0c], ax
870a: 2a066053               sub      al, byte ptr [0x5360]
870e: 1a266353               sbb      ah, byte ptr [0x5363]
8712: 7902                   jns      0x8716
8714: f7d8                   neg      ax
8716: 8bd0                   mov      dx, ax
8718: e83b00                 call     0x8756
871b: 3bd0                   cmp      dx, ax
871d: 721d                   jb       0x873c
871f: 80266353ff             and      byte ptr [0x5363], 0xff
8724: 7902                   jns      0x8728
8726: f7d8                   neg      ax
8728: 8b160c4b               mov      dx, word ptr [0x4b0c]
872c: 2bd0                   sub      dx, ax
872e: 88166653               mov      byte ptr [0x5366], dl
8732: 88366953               mov      byte ptr [0x5369], dh
8736: c606d35480             mov      byte ptr [0x54d3], 0x80
873b: c3                     ret      
873c: a07c53                 mov      al, byte ptr [0x537c]
873f: 2a066053               sub      al, byte ptr [0x5360]
8743: a26653                 mov      byte ptr [0x5366], al
8746: a07f53                 mov      al, byte ptr [0x537f]
8749: 1a066353               sbb      al, byte ptr [0x5363]
874d: a26953                 mov      byte ptr [0x5369], al
8750: c606d35400             mov      byte ptr [0x54d3], 0
8755: c3                     ret      
8756: a0264b                 mov      al, byte ptr [0x4b26]
8759: 22c0                   and      al, al
875b: 740e                   je       0x876b
875d: 8a268053               mov      ah, byte ptr [0x5380]
8761: 22e4                   and      ah, ah
8763: 7806                   js       0x876b
8765: a07d53                 mov      al, byte ptr [0x537d]
8768: d1e0                   shl      ax, 1
876a: c3                     ret      
876b: 33c0                   xor      ax, ax
876d: c3                     ret      
876e: bf0200                 mov      di, 2
8771: a0264b                 mov      al, byte ptr [0x4b26]
8774: 22c0                   and      al, al
8776: 741b                   je       0x8793
8778: a01fc0                 mov      al, byte ptr [0xc01f]
877b: 22c0                   and      al, al
877d: 7902                   jns      0x8781
877f: f6d0                   not      al
8781: 3c03                   cmp      al, 3
8783: 7318                   jae      0x879d
8785: 8026274bff             and      byte ptr [0x4b27], 0xff
878a: 7811                   js       0x879d
878c: a0c04a                 mov      al, byte ptr [0x4ac0]
878f: 22c0                   and      al, al
8791: 7507                   jne      0x879a
8793: a0e14a                 mov      al, byte ptr [0x4ae1]
8796: 22c0                   and      al, al
8798: 7408                   je       0x87a2
879a: bf0400                 mov      di, 4
879d: b0c0                   mov      al, 0xc0
879f: eb48                   jmp      0x87e9
87a1: 90                     nop      
87a2: bb0200                 mov      bx, 2
87a5: 8a876053               mov      al, byte ptr [bx + 0x5360]
87a9: 8aa76353               mov      ah, byte ptr [bx + 0x5363]
87ad: 22e4                   and      ah, ah
87af: 7902                   jns      0x87b3
87b1: f7d8                   neg      ax
87b3: d1e0                   shl      ax, 1
87b5: 88a7c74a               mov      byte ptr [bx + 0x4ac7], ah
87b9: fecb                   dec      bl
87bb: 79e8                   jns      0x87a5
87bd: bf0600                 mov      di, 6
87c0: a0c74a                 mov      al, byte ptr [0x4ac7]
87c3: 3a06c84a               cmp      al, byte ptr [0x4ac8]
87c7: 7303                   jae      0x87cc
87c9: a0c84a                 mov      al, byte ptr [0x4ac8]
87cc: 3a06c94a               cmp      al, byte ptr [0x4ac9]
87d0: 7303                   jae      0x87d5
87d2: a0c94a                 mov      al, byte ptr [0x4ac9]
87d5: 80261454ff             and      byte ptr [0x5414], 0xff
87da: 790d                   jns      0x87e9
87dc: 80267654ff             and      byte ptr [0x5476], 0xff
87e1: 7806                   js       0x87e9
87e3: 2c14                   sub      al, 0x14
87e5: 7302                   jae      0x87e9
87e7: 32c0                   xor      al, al
87e9: a25c54                 mov      byte ptr [0x545c], al
87ec: 8bcf                   mov      cx, di
87ee: bb0200                 mov      bx, 2
87f1: 32e4                   xor      ah, ah
87f3: 8bf0                   mov      si, ax
87f5: 8a871553               mov      al, byte ptr [bx + 0x5315]
87f9: 8aa71b53               mov      ah, byte ptr [bx + 0x531b]
87fd: f7ee                   imul     si
87ff: 22c0                   and      al, al
8801: 8ac4                   mov      al, ah
8803: 8ae2                   mov      ah, dl
8805: 7405                   je       0x880c
8807: 22f6                   and      dh, dh
8809: 7901                   jns      0x880c
880b: 40                     inc      ax
880c: d3f8                   sar      ax, cl
880e: 28872153               sub      byte ptr [bx + 0x5321], al
8812: 18a72753               sbb      byte ptr [bx + 0x5327], ah
8816: fecb                   dec      bl
8818: 79db                   jns      0x87f5
881a: c3                     ret      
881b: c606835300             mov      byte ptr [0x5383], 0
8820: bb0200                 mov      bx, 2
8823: d0afe154               shr      byte ptr [bx + 0x54e1], 1
8827: d09f8853               rcr      byte ptr [bx + 0x5388], 1
882b: d09f8553               rcr      byte ptr [bx + 0x5385], 1
882f: d0afe154               shr      byte ptr [bx + 0x54e1], 1
8833: d09f8853               rcr      byte ptr [bx + 0x5388], 1
8837: d09f8553               rcr      byte ptr [bx + 0x5385], 1
883b: d0afe154               shr      byte ptr [bx + 0x54e1], 1
883f: d09f8853               rcr      byte ptr [bx + 0x5388], 1
8843: d09f8553               rcr      byte ptr [bx + 0x5385], 1
8847: fecb                   dec      bl
8849: 79d8                   jns      0x8823
884b: a08553                 mov      al, byte ptr [0x5385]
884e: 8a268853               mov      ah, byte ptr [0x5388]
8852: 02068653               add      al, byte ptr [0x5386]
8856: 12268953               adc      ah, byte ptr [0x5389]
885a: d1f8                   sar      ax, 1
885c: 2a068753               sub      al, byte ptr [0x5387]
8860: 1a268a53               sbb      ah, byte ptr [0x538a]
8864: d1f8                   sar      ax, 1
8866: 80f480                 xor      ah, 0x80
8869: 88268453               mov      byte ptr [0x5384], ah
886d: 80f480                 xor      ah, 0x80
8870: e86300                 call     0x88d6
8873: a2f64a                 mov      byte ptr [0x4af6], al
8876: a0144b                 mov      al, byte ptr [0x4b14]
8879: a2484b                 mov      byte ptr [0x4b48], al
887c: a08553                 mov      al, byte ptr [0x5385]
887f: 8a268853               mov      ah, byte ptr [0x5388]
8883: 2a068653               sub      al, byte ptr [0x5386]
8887: 1a268953               sbb      ah, byte ptr [0x5389]
888b: 88268253               mov      byte ptr [0x5382], ah
888f: e84400                 call     0x88d6
8892: f626f64a               mul      byte ptr [0x4af6]
8896: 8826474b               mov      byte ptr [0x4b47], ah
889a: a0144b                 mov      al, byte ptr [0x4b14]
889d: f626f64a               mul      byte ptr [0x4af6]
88a1: 8826464b               mov      byte ptr [0x4b46], ah
88a5: b302                   mov      bl, 2
88a7: 8a87464b               mov      al, byte ptr [bx + 0x4b46]
88ab: 8ae7                   mov      ah, bh
88ad: 80a78253ff             and      byte ptr [bx + 0x5382], 0xff
88b2: 7902                   jns      0x88b6
88b4: f7d8                   neg      ax
88b6: 8b166c53               mov      dx, word ptr [0x536c]
88ba: f7ea                   imul     dx
88bc: 22c0                   and      al, al
88be: 8ac4                   mov      al, ah
88c0: 8ae2                   mov      ah, dl
88c2: 7405                   je       0x88c9
88c4: 22f6                   and      dh, dh
88c6: 7901                   jns      0x88c9
88c8: 40                     inc      ax
88c9: 88877c53               mov      byte ptr [bx + 0x537c], al
88cd: 88a77f53               mov      byte ptr [bx + 0x537f], ah
88d1: fecb                   dec      bl
88d3: 79d2                   jns      0x88a7
88d5: c3                     ret      
88d6: 22e4                   and      ah, ah
88d8: 7902                   jns      0x88dc
88da: f7d8                   neg      ax
88dc: b3ff                   mov      bl, 0xff
88de: 22e4                   and      ah, ah
88e0: 7502                   jne      0x88e4
88e2: 8ad8                   mov      bl, al
88e4: 881e144b               mov      byte ptr [0x4b14], bl
88e8: d0eb                   shr      bl, 1
88ea: 8a875071               mov      al, byte ptr [bx + 0x7150]
88ee: a2154b                 mov      byte ptr [0x4b15], al
88f1: c3                     ret      
88f2: 0000                   add      byte ptr [bx + si], al
88f4: 0000                   add      byte ptr [bx + si], al
88f6: 0000                   add      byte ptr [bx + si], al
88f8: 0000                   add      byte ptr [bx + si], al
88fa: 0000                   add      byte ptr [bx + si], al
88fc: 0000                   add      byte ptr [bx + si], al
88fe: 0000                   add      byte ptr [bx + si], al
8900: a10a00                 mov      ax, word ptr [0xa]
8903: 8ec0                   mov      es, ax
8905: a08847                 mov      al, byte ptr [0x4788]
8908: 98                     cwde     
8909: d1e0                   shl      ax, 1
890b: 8bf0                   mov      si, ax
890d: 8bb462cb               mov      si, word ptr [si - 0x349e]
8911: a0fb5f                 mov      al, byte ptr [0x5ffb]
8914: 2c32                   sub      al, 0x32
8916: 32e4                   xor      ah, ah
8918: bd9900                 mov      bp, 0x99
891b: 2be8                   sub      bp, ax
891d: 83fd25                 cmp      bp, 0x25
8920: 7603                   jbe      0x8925
8922: bd2500                 mov      bp, 0x25
8925: 8bf8                   mov      di, ax
8927: d1e7                   shl      di, 1
8929: 03c7                   add      ax, di
892b: 8bbd7048               mov      di, word ptr [di + 0x4870]
892f: 83c721                 add      di, 0x21
8932: 0585c9                 add      ax, 0xc985
8935: 8bd8                   mov      bx, ax
8937: e84a01                 call     0x8a84
893a: a08847                 mov      al, byte ptr [0x4788]
893d: 98                     cwde     
893e: d1e0                   shl      ax, 1
8940: 8bf0                   mov      si, ax
8942: 8bb468cb               mov      si, word ptr [si - 0x3498]
8946: a0fc5f                 mov      al, byte ptr [0x5ffc]
8949: 2c32                   sub      al, 0x32
894b: 32e4                   xor      ah, ah
894d: bd9900                 mov      bp, 0x99
8950: 2be8                   sub      bp, ax
8952: 83fd25                 cmp      bp, 0x25
8955: 7603                   jbe      0x895a
8957: bd2500                 mov      bp, 0x25
895a: 8bf8                   mov      di, ax
895c: d1e7                   shl      di, 1
895e: 03c7                   add      ax, di
8960: 8bbd7048               mov      di, word ptr [di + 0x4870]
8964: 83c704                 add      di, 4
8967: 05c2c8                 add      ax, 0xc8c2
896a: 8bd8                   mov      bx, ax
896c: e86a02                 call     0x8bd9
896f: a0364b                 mov      al, byte ptr [0x4b36]
8972: 22c0                   and      al, al
8974: 7803                   js       0x8979
8976: e9f900                 jmp      0x8a72
8979: b603                   mov      dh, 3
897b: b3c4                   mov      bl, 0xc4
897d: b7ce                   mov      bh, 0xce
897f: bd2500                 mov      bp, 0x25
8982: a06ecb                 mov      al, byte ptr [0xcb6e]
8985: 98                     cwde     
8986: 2c02                   sub      al, 2
8988: 7902                   jns      0x898c
898a: b004                   mov      al, 4
898c: a26ecb                 mov      byte ptr [0xcb6e], al
898f: 8bf0                   mov      si, ax
8991: 8bb4a0c9               mov      si, word ptr [si - 0x3660]
8995: 8b3c                   mov      di, word ptr [si]
8997: 83c602                 add      si, 2
899a: 56                     push     si
899b: 8b34                   mov      si, word ptr [si]
899d: b91500                 mov      cx, 0x15
89a0: b8020f                 mov      ax, 0xf02
89a3: 8ad3                   mov      dl, bl
89a5: ef                     out      dx, ax
89a6: 268a25                 mov      ah, byte ptr es:[di]
89a9: 8a24                   mov      ah, byte ptr [si]
89ab: 46                     inc      si
89ac: b008                   mov      al, 8
89ae: 8ad7                   mov      dl, bh
89b0: ef                     out      dx, ax
89b1: f6d4                   not      ah
89b3: 268825                 mov      byte ptr es:[di], ah
89b6: b8020e                 mov      ax, 0xe02
89b9: 8ad3                   mov      dl, bl
89bb: ef                     out      dx, ax
89bc: 268a25                 mov      ah, byte ptr es:[di]
89bf: 8a24                   mov      ah, byte ptr [si]
89c1: 46                     inc      si
89c2: 8ad7                   mov      dl, bh
89c4: b008                   mov      al, 8
89c6: ef                     out      dx, ax
89c7: 268825                 mov      byte ptr es:[di], ah
89ca: b80203                 mov      ax, 0x302
89cd: 8ad3                   mov      dl, bl
89cf: ef                     out      dx, ax
89d0: 268a25                 mov      ah, byte ptr es:[di]
89d3: 8a24                   mov      ah, byte ptr [si]
89d5: 46                     inc      si
89d6: 8ad7                   mov      dl, bh
89d8: b008                   mov      al, 8
89da: ef                     out      dx, ax
89db: 268825                 mov      byte ptr es:[di], ah
89de: 47                     inc      di
89df: b8020f                 mov      ax, 0xf02
89e2: 8ad3                   mov      dl, bl
89e4: ef                     out      dx, ax
89e5: 268a25                 mov      ah, byte ptr es:[di]
89e8: 8a24                   mov      ah, byte ptr [si]
89ea: 46                     inc      si
89eb: b008                   mov      al, 8
89ed: 8ad7                   mov      dl, bh
89ef: ef                     out      dx, ax
89f0: f6d4                   not      ah
89f2: 268825                 mov      byte ptr es:[di], ah
89f5: b8020e                 mov      ax, 0xe02
89f8: 8ad3                   mov      dl, bl
89fa: ef                     out      dx, ax
89fb: 268a25                 mov      ah, byte ptr es:[di]
89fe: 8a24                   mov      ah, byte ptr [si]
8a00: 46                     inc      si
8a01: 8ad7                   mov      dl, bh
8a03: b008                   mov      al, 8
8a05: ef                     out      dx, ax
8a06: 268825                 mov      byte ptr es:[di], ah
8a09: b80203                 mov      ax, 0x302
8a0c: 8ad3                   mov      dl, bl
8a0e: ef                     out      dx, ax
8a0f: 268a25                 mov      ah, byte ptr es:[di]
8a12: 8a24                   mov      ah, byte ptr [si]
8a14: 46                     inc      si
8a15: 8ad7                   mov      dl, bh
8a17: b008                   mov      al, 8
8a19: ef                     out      dx, ax
8a1a: 268825                 mov      byte ptr es:[di], ah
8a1d: 47                     inc      di
8a1e: b8020f                 mov      ax, 0xf02
8a21: 8ad3                   mov      dl, bl
8a23: ef                     out      dx, ax
8a24: 268a25                 mov      ah, byte ptr es:[di]
8a27: 8a24                   mov      ah, byte ptr [si]
8a29: 46                     inc      si
8a2a: b008                   mov      al, 8
8a2c: 8ad7                   mov      dl, bh
8a2e: ef                     out      dx, ax
8a2f: f6d4                   not      ah
8a31: 268825                 mov      byte ptr es:[di], ah
8a34: b8020e                 mov      ax, 0xe02
8a37: 8ad3                   mov      dl, bl
8a39: ef                     out      dx, ax
8a3a: 268a25                 mov      ah, byte ptr es:[di]
8a3d: 8a24                   mov      ah, byte ptr [si]
8a3f: 46                     inc      si
8a40: 8ad7                   mov      dl, bh
8a42: b008                   mov      al, 8
8a44: ef                     out      dx, ax
8a45: 268825                 mov      byte ptr es:[di], ah
8a48: b80203                 mov      ax, 0x302
8a4b: 8ad3                   mov      dl, bl
8a4d: ef                     out      dx, ax
8a4e: 268a25                 mov      ah, byte ptr es:[di]
8a51: 8a24                   mov      ah, byte ptr [si]
8a53: 46                     inc      si
8a54: 8ad7                   mov      dl, bh
8a56: b008                   mov      al, 8
8a58: ef                     out      dx, ax
8a59: 268825                 mov      byte ptr es:[di], ah
8a5c: 47                     inc      di
8a5d: 03fd                   add      di, bp
8a5f: 49                     dec      cx
8a60: e303                   jcxz     0x8a65
8a62: e93bff                 jmp      0x89a0
8a65: 5e                     pop      si
8a66: 83c602                 add      si, 2
8a69: 8b3c                   mov      di, word ptr [si]
8a6b: 23ff                   and      di, di
8a6d: 7403                   je       0x8a72
8a6f: e925ff                 jmp      0x8997
8a72: b808ff                 mov      ax, 0xff08
8a75: bace03                 mov      dx, 0x3ce
8a78: ef                     out      dx, ax
8a79: b8020f                 mov      ax, 0xf02
8a7c: b2c4                   mov      dl, 0xc4
8a7e: ef                     out      dx, ax
8a7f: 8cd8                   mov      ax, ds
8a81: 8ec0                   mov      es, ax
8a83: c3                     ret      
8a84: bac403                 mov      dx, 0x3c4
8a87: b8020f                 mov      ax, 0xf02
8a8a: ef                     out      dx, ax
8a8b: b90600                 mov      cx, 6
8a8e: b2ce                   mov      dl, 0xce
8a90: b80308                 mov      ax, 0x803
8a93: ef                     out      dx, ax
8a94: 47                     inc      di
8a95: 83c603                 add      si, 3
8a98: 43                     inc      bx
8a99: 268a05                 mov      al, byte ptr es:[di]
8a9c: 8a04                   mov      al, byte ptr [si]
8a9e: 2207                   and      al, byte ptr [bx]
8aa0: f6d0                   not      al
8aa2: 83c603                 add      si, 3
8aa5: aa                     stosb    byte ptr es:[di], al
8aa6: 268a05                 mov      al, byte ptr es:[di]
8aa9: 8a04                   mov      al, byte ptr [si]
8aab: f6d0                   not      al
8aad: 83c606                 add      si, 6
8ab0: 83c303                 add      bx, 3
8ab3: aa                     stosb    byte ptr es:[di], al
8ab4: 83c726                 add      di, 0x26
8ab7: e2e0                   loop     0x8a99
8ab9: b80310                 mov      ax, 0x1003
8abc: ef                     out      dx, ax
8abd: 83eb03                 sub      bx, 3
8ac0: b2c4                   mov      dl, 0xc4
8ac2: 83ee35                 sub      si, 0x35
8ac5: 81eff000               sub      di, 0xf0
8ac9: b90500                 mov      cx, 5
8acc: b80207                 mov      ax, 0x702
8acf: ef                     out      dx, ax
8ad0: 268a25                 mov      ah, byte ptr es:[di]
8ad3: 8a24                   mov      ah, byte ptr [si]
8ad5: 46                     inc      si
8ad6: 268825                 mov      byte ptr es:[di], ah
8ad9: b403                   mov      ah, 3
8adb: ef                     out      dx, ax
8adc: 8a04                   mov      al, byte ptr [si]
8ade: 83c602                 add      si, 2
8ae1: aa                     stosb    byte ptr es:[di], al
8ae2: b80207                 mov      ax, 0x702
8ae5: ef                     out      dx, ax
8ae6: 268a25                 mov      ah, byte ptr es:[di]
8ae9: ac                     lodsb    al, byte ptr [si]
8aea: 268805                 mov      byte ptr es:[di], al
8aed: b80203                 mov      ax, 0x302
8af0: ef                     out      dx, ax
8af1: 8a24                   mov      ah, byte ptr [si]
8af3: 83c605                 add      si, 5
8af6: 268825                 mov      byte ptr es:[di], ah
8af9: 83c727                 add      di, 0x27
8afc: e2ce                   loop     0x8acc
8afe: b80207                 mov      ax, 0x702
8b01: ef                     out      dx, ax
8b02: 268a25                 mov      ah, byte ptr es:[di]
8b05: ac                     lodsb    al, byte ptr [si]
8b06: 2207                   and      al, byte ptr [bx]
8b08: 268805                 mov      byte ptr es:[di], al
8b0b: b80203                 mov      ax, 0x302
8b0e: ef                     out      dx, ax
8b0f: 8a04                   mov      al, byte ptr [si]
8b11: 2207                   and      al, byte ptr [bx]
8b13: 83c602                 add      si, 2
8b16: aa                     stosb    byte ptr es:[di], al
8b17: b80207                 mov      ax, 0x702
8b1a: ef                     out      dx, ax
8b1b: 268a25                 mov      ah, byte ptr es:[di]
8b1e: 8a24                   mov      ah, byte ptr [si]
8b20: 46                     inc      si
8b21: 268825                 mov      byte ptr es:[di], ah
8b24: b403                   mov      ah, 3
8b26: ef                     out      dx, ax
8b27: 8a24                   mov      ah, byte ptr [si]
8b29: 83c602                 add      si, 2
8b2c: 268825                 mov      byte ptr es:[di], ah
8b2f: 83c726                 add      di, 0x26
8b32: 83c302                 add      bx, 2
8b35: b40f                   mov      ah, 0xf
8b37: ef                     out      dx, ax
8b38: b2ce                   mov      dl, 0xce
8b3a: b80308                 mov      ax, 0x803
8b3d: ef                     out      dx, ax
8b3e: 8bcd                   mov      cx, bp
8b40: 53                     push     bx
8b41: 56                     push     si
8b42: 57                     push     di
8b43: 4e                     dec      si
8b44: 32e4                   xor      ah, ah
8b46: 268a05                 mov      al, byte ptr es:[di]
8b49: 8a04                   mov      al, byte ptr [si]
8b4b: 2207                   and      al, byte ptr [bx]
8b4d: f6d0                   not      al
8b4f: aa                     stosb    byte ptr es:[di], al
8b50: 43                     inc      bx
8b51: 83c603                 add      si, 3
8b54: 268a05                 mov      al, byte ptr es:[di]
8b57: 8a04                   mov      al, byte ptr [si]
8b59: 83c606                 add      si, 6
8b5c: 2207                   and      al, byte ptr [bx]
8b5e: 43                     inc      bx
8b5f: f6d0                   not      al
8b61: aa                     stosb    byte ptr es:[di], al
8b62: 43                     inc      bx
8b63: 268825                 mov      byte ptr es:[di], ah
8b66: 83c726                 add      di, 0x26
8b69: e2db                   loop     0x8b46
8b6b: 5f                     pop      di
8b6c: 5e                     pop      si
8b6d: 5b                     pop      bx
8b6e: 8bcd                   mov      cx, bp
8b70: b80310                 mov      ax, 0x1003
8b73: ef                     out      dx, ax
8b74: b2c4                   mov      dl, 0xc4
8b76: 8a2f                   mov      ch, byte ptr [bx]
8b78: b80207                 mov      ax, 0x702
8b7b: ef                     out      dx, ax
8b7c: 268a25                 mov      ah, byte ptr es:[di]
8b7f: 8a24                   mov      ah, byte ptr [si]
8b81: 46                     inc      si
8b82: 22e5                   and      ah, ch
8b84: 268825                 mov      byte ptr es:[di], ah
8b87: b403                   mov      ah, 3
8b89: ef                     out      dx, ax
8b8a: 8a04                   mov      al, byte ptr [si]
8b8c: 83c602                 add      si, 2
8b8f: 22c5                   and      al, ch
8b91: aa                     stosb    byte ptr es:[di], al
8b92: 43                     inc      bx
8b93: 8a2f                   mov      ch, byte ptr [bx]
8b95: b80207                 mov      ax, 0x702
8b98: ef                     out      dx, ax
8b99: 268a25                 mov      ah, byte ptr es:[di]
8b9c: 8a24                   mov      ah, byte ptr [si]
8b9e: 46                     inc      si
8b9f: 22e5                   and      ah, ch
8ba1: 268825                 mov      byte ptr es:[di], ah
8ba4: b403                   mov      ah, 3
8ba6: ef                     out      dx, ax
8ba7: 8a04                   mov      al, byte ptr [si]
8ba9: 83c602                 add      si, 2
8bac: 22c5                   and      al, ch
8bae: aa                     stosb    byte ptr es:[di], al
8baf: 43                     inc      bx
8bb0: b80207                 mov      ax, 0x702
8bb3: ef                     out      dx, ax
8bb4: 268a25                 mov      ah, byte ptr es:[di]
8bb7: 8a24                   mov      ah, byte ptr [si]
8bb9: 46                     inc      si
8bba: 268825                 mov      byte ptr es:[di], ah
8bbd: b403                   mov      ah, 3
8bbf: ef                     out      dx, ax
8bc0: 8a04                   mov      al, byte ptr [si]
8bc2: 83c602                 add      si, 2
8bc5: aa                     stosb    byte ptr es:[di], al
8bc6: 43                     inc      bx
8bc7: 83c725                 add      di, 0x25
8bca: fec9                   dec      cl
8bcc: 75a8                   jne      0x8b76
8bce: b8020f                 mov      ax, 0xf02
8bd1: ef                     out      dx, ax
8bd2: b80300                 mov      ax, 3
8bd5: b2ce                   mov      dl, 0xce
8bd7: ef                     out      dx, ax
8bd8: c3                     ret      
8bd9: bac403                 mov      dx, 0x3c4
8bdc: b8020f                 mov      ax, 0xf02
8bdf: ef                     out      dx, ax
8be0: b90600                 mov      cx, 6
8be3: b2ce                   mov      dl, 0xce
8be5: b80308                 mov      ax, 0x803
8be8: ef                     out      dx, ax
8be9: 43                     inc      bx
8bea: 268a05                 mov      al, byte ptr es:[di]
8bed: 8a04                   mov      al, byte ptr [si]
8bef: f6d0                   not      al
8bf1: 83c603                 add      si, 3
8bf4: aa                     stosb    byte ptr es:[di], al
8bf5: 268a05                 mov      al, byte ptr es:[di]
8bf8: 8a04                   mov      al, byte ptr [si]
8bfa: 2207                   and      al, byte ptr [bx]
8bfc: f6d0                   not      al
8bfe: aa                     stosb    byte ptr es:[di], al
8bff: 83c606                 add      si, 6
8c02: 83c303                 add      bx, 3
8c05: 83c726                 add      di, 0x26
8c08: e2e0                   loop     0x8bea
8c0a: b80310                 mov      ax, 0x1003
8c0d: ef                     out      dx, ax
8c0e: b2c4                   mov      dl, 0xc4
8c10: 83eb03                 sub      bx, 3
8c13: 83ee35                 sub      si, 0x35
8c16: 81eff000               sub      di, 0xf0
8c1a: b90500                 mov      cx, 5
8c1d: b80207                 mov      ax, 0x702
8c20: ef                     out      dx, ax
8c21: 268a25                 mov      ah, byte ptr es:[di]
8c24: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c25: 4f                     dec      di
8c26: b80203                 mov      ax, 0x302
8c29: ef                     out      dx, ax
8c2a: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c2b: 46                     inc      si
8c2c: b80207                 mov      ax, 0x702
8c2f: ef                     out      dx, ax
8c30: 268a25                 mov      ah, byte ptr es:[di]
8c33: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c34: 4f                     dec      di
8c35: b80203                 mov      ax, 0x302
8c38: ef                     out      dx, ax
8c39: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c3a: 46                     inc      si
8c3b: 83c603                 add      si, 3
8c3e: 83c726                 add      di, 0x26
8c41: e2da                   loop     0x8c1d
8c43: b80207                 mov      ax, 0x702
8c46: ef                     out      dx, ax
8c47: 268a25                 mov      ah, byte ptr es:[di]
8c4a: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c4b: 4f                     dec      di
8c4c: b80203                 mov      ax, 0x302
8c4f: ef                     out      dx, ax
8c50: a4                     movsb    byte ptr es:[di], byte ptr [si]
8c51: 46                     inc      si
8c52: b80207                 mov      ax, 0x702
8c55: ef                     out      dx, ax
8c56: 268a25                 mov      ah, byte ptr es:[di]
8c59: ac                     lodsb    al, byte ptr [si]
8c5a: 2207                   and      al, byte ptr [bx]
8c5c: 268805                 mov      byte ptr es:[di], al
8c5f: b80203                 mov      ax, 0x302
8c62: ef                     out      dx, ax
8c63: 8a04                   mov      al, byte ptr [si]
8c65: 2207                   and      al, byte ptr [bx]
8c67: aa                     stosb    byte ptr es:[di], al
8c68: 83c605                 add      si, 5
8c6b: 83c726                 add      di, 0x26
8c6e: 83c302                 add      bx, 2
8c71: b8020f                 mov      ax, 0xf02
8c74: ef                     out      dx, ax
8c75: b2ce                   mov      dl, 0xce
8c77: b80308                 mov      ax, 0x803
8c7a: ef                     out      dx, ax
8c7b: 8bcd                   mov      cx, bp
8c7d: 53                     push     bx
8c7e: 56                     push     si
8c7f: 57                     push     di
8c80: 83c602                 add      si, 2
8c83: 32e4                   xor      ah, ah
8c85: 43                     inc      bx
8c86: 268825                 mov      byte ptr es:[di], ah
8c89: 47                     inc      di
8c8a: 268a05                 mov      al, byte ptr es:[di]
8c8d: 8a04                   mov      al, byte ptr [si]
8c8f: 83c603                 add      si, 3
8c92: 2207                   and      al, byte ptr [bx]
8c94: 43                     inc      bx
8c95: f6d0                   not      al
8c97: aa                     stosb    byte ptr es:[di], al
8c98: 268a05                 mov      al, byte ptr es:[di]
8c9b: 8a04                   mov      al, byte ptr [si]
8c9d: 83c606                 add      si, 6
8ca0: 2207                   and      al, byte ptr [bx]
8ca2: 43                     inc      bx
8ca3: f6d0                   not      al
8ca5: aa                     stosb    byte ptr es:[di], al
8ca6: 83c725                 add      di, 0x25
8ca9: e2da                   loop     0x8c85
8cab: 5f                     pop      di
8cac: 5e                     pop      si
8cad: 5b                     pop      bx
8cae: 8bcd                   mov      cx, bp
8cb0: b80310                 mov      ax, 0x1003
8cb3: ef                     out      dx, ax
8cb4: b2c4                   mov      dl, 0xc4
8cb6: b80207                 mov      ax, 0x702
8cb9: ef                     out      dx, ax
8cba: 268a25                 mov      ah, byte ptr es:[di]
8cbd: 8a24                   mov      ah, byte ptr [si]
8cbf: 46                     inc      si
8cc0: 268825                 mov      byte ptr es:[di], ah
8cc3: b403                   mov      ah, 3
8cc5: ef                     out      dx, ax
8cc6: 8a04                   mov      al, byte ptr [si]
8cc8: 83c602                 add      si, 2
8ccb: aa                     stosb    byte ptr es:[di], al
8ccc: 43                     inc      bx
8ccd: 8a2f                   mov      ch, byte ptr [bx]
8ccf: b80207                 mov      ax, 0x702
8cd2: ef                     out      dx, ax
8cd3: 268a25                 mov      ah, byte ptr es:[di]
8cd6: 8a24                   mov      ah, byte ptr [si]
8cd8: 46                     inc      si
8cd9: 22e5                   and      ah, ch
8cdb: 268825                 mov      byte ptr es:[di], ah
8cde: b403                   mov      ah, 3
8ce0: ef                     out      dx, ax
8ce1: 8a04                   mov      al, byte ptr [si]
8ce3: 83c602                 add      si, 2
8ce6: 22c5                   and      al, ch
8ce8: aa                     stosb    byte ptr es:[di], al
8ce9: 43                     inc      bx
8cea: 8a2f                   mov      ch, byte ptr [bx]
8cec: b80207                 mov      ax, 0x702
8cef: ef                     out      dx, ax
8cf0: 268a25                 mov      ah, byte ptr es:[di]
8cf3: 8a24                   mov      ah, byte ptr [si]
8cf5: 46                     inc      si
8cf6: 22e5                   and      ah, ch
8cf8: 268825                 mov      byte ptr es:[di], ah
8cfb: b403                   mov      ah, 3
8cfd: ef                     out      dx, ax
8cfe: 8a04                   mov      al, byte ptr [si]
8d00: 83c602                 add      si, 2
8d03: 22c5                   and      al, ch
8d05: 268805                 mov      byte ptr es:[di], al
8d08: 43                     inc      bx
8d09: 83c726                 add      di, 0x26
8d0c: fec9                   dec      cl
8d0e: 75a6                   jne      0x8cb6
8d10: b8020f                 mov      ax, 0xf02
8d13: ef                     out      dx, ax
8d14: b80300                 mov      ax, 3
8d17: b2ce                   mov      dl, 0xce
8d19: ef                     out      dx, ax
8d1a: c3                     ret      
8d1b: 0000                   add      byte ptr [bx + si], al
8d1d: 0000                   add      byte ptr [bx + si], al
8d1f: 001ec5b4               add      byte ptr [0xb4c5], bl
8d23: 60                     pushaw   
8d24: dd33                   fnsave   dword ptr [bp + di]
8d26: ed                     in       ax, dx
8d27: bac403                 mov      dx, 0x3c4
8d2a: b80208                 mov      ax, 0x802
8d2d: ef                     out      dx, ax
8d2e: 36a30200               mov      word ptr ss:[2], ax
8d32: ad                     lodsw    ax, word ptr [si]
8d33: 8bf8                   mov      di, ax
8d35: ad                     lodsw    ax, word ptr [si]
8d36: b8401f                 mov      ax, 0x1f40
8d39: 36a30000               mov      word ptr ss:[0], ax
8d3d: 03fe                   add      di, si
8d3f: 56                     push     si
8d40: 33c0                   xor      ax, ax
8d42: 8aec                   mov      ch, ah
8d44: 5e                     pop      si
8d45: 56                     push     si
8d46: 8b15                   mov      dx, word ptr [di]
8d48: 86f2                   xchg     dl, dh
8d4a: 8a4d02                 mov      cl, byte ptr [di + 2]
8d4d: b307                   mov      bl, 7
8d4f: 2ad8                   sub      bl, al
8d51: 32ff                   xor      bh, bh
8d53: d1e3                   shl      bx, 1
8d55: d1e3                   shl      bx, 1
8d57: 81c35d8d               add      bx, 0x8d5d
8d5b: ffe3                   jmp      bx
8d5d: d0e1                   shl      cl, 1
8d5f: d1d2                   rcl      dx, 1
8d61: d0e1                   shl      cl, 1
8d63: d1d2                   rcl      dx, 1
8d65: d0e1                   shl      cl, 1
8d67: d1d2                   rcl      dx, 1
8d69: d0e1                   shl      cl, 1
8d6b: d1d2                   rcl      dx, 1
8d6d: d0e1                   shl      cl, 1
8d6f: d1d2                   rcl      dx, 1
8d71: d0e1                   shl      cl, 1
8d73: d1d2                   rcl      dx, 1
8d75: d0e1                   shl      cl, 1
8d77: d1d2                   rcl      dx, 1
8d79: 8bca                   mov      cx, dx
8d7b: bb0600                 mov      bx, 6
8d7e: eb04                   jmp      0x8d84
8d80: 03f3                   add      si, bx
8d82: 8bd1                   mov      dx, cx
8d84: 235402                 and      dx, word ptr [si + 2]
8d87: 3b14                   cmp      dx, word ptr [si]
8d89: 75f5                   jne      0x8d80
8d8b: 8a4405                 mov      al, byte ptr [si + 5]
8d8e: 26884600               mov      byte ptr es:[bp], al
8d92: 45                     inc      bp
8d93: 36ff0e0000             dec      word ptr ss:[0]
8d98: 7416                   je       0x8db0
8d9a: 8ac4                   mov      al, ah
8d9c: 024404                 add      al, byte ptr [si + 4]
8d9f: 98                     cwde     
8da0: 8bd0                   mov      dx, ax
8da2: d1ea                   shr      dx, 1
8da4: d1ea                   shr      dx, 1
8da6: d1ea                   shr      dx, 1
8da8: 03fa                   add      di, dx
8daa: 2407                   and      al, 7
8dac: 8ae0                   mov      ah, al
8dae: eb94                   jmp      0x8d44
8db0: 50                     push     ax
8db1: 36a10200               mov      ax, word ptr ss:[2]
8db5: bac403                 mov      dx, 0x3c4
8db8: d0ec                   shr      ah, 1
8dba: 7211                   jb       0x8dcd
8dbc: ef                     out      dx, ax
8dbd: 36a30200               mov      word ptr ss:[2], ax
8dc1: 58                     pop      ax
8dc2: 36c7060000401f         mov      word ptr ss:[0], 0x1f40
8dc9: 33ed                   xor      bp, bp
8dcb: ebcd                   jmp      0x8d9a
8dcd: 58                     pop      ax
8dce: 5e                     pop      si
8dcf: 1f                     pop      ds
8dd0: c3                     ret      
8dd1: 0000                   add      byte ptr [bx + si], al
8dd3: 0000                   add      byte ptr [bx + si], al
8dd5: 0000                   add      byte ptr [bx + si], al
8dd7: 0000                   add      byte ptr [bx + si], al
8dd9: 0000                   add      byte ptr [bx + si], al
8ddb: 0000                   add      byte ptr [bx + si], al
8ddd: 0000                   add      byte ptr [bx + si], al
8ddf: 00b080a2               add      byte ptr [bx + si - 0x5d80], dh
8de3: a9dd32                 test     ax, 0x32dd
8de6: c0a2aaddb3             shl      byte ptr [bp + si - 0x2256], 0xb3
8deb: 10b401e8               adc      byte ptr [si - 0x17ff], dh
8def: 45                     inc      bp
8df0: 9d                     popf     
8df1: 22c0                   and      al, al
8df3: 7516                   jne      0x8e0b
8df5: e8609c                 call     0x2a58
8df8: eb22                   jmp      0x8e1c
8dfa: 32c0                   xor      al, al
8dfc: b401                   mov      ah, 1
8dfe: b314                   mov      bl, 0x14
8e00: e8339d                 call     0x2b36
8e03: 22c0                   and      al, al
8e05: 750e                   jne      0x8e15
8e07: fe06aadd               inc      byte ptr [0xddaa]
8e0b: e84a9c                 call     0x2a58
8e0e: a0aadd                 mov      al, byte ptr [0xddaa]
8e11: 3c07                   cmp      al, 7
8e13: 72e5                   jb       0x8dfa
8e15: a0aadd                 mov      al, byte ptr [0xddaa]
8e18: 22c0                   and      al, al
8e1a: 74de                   je       0x8dfa
8e1c: 32c0                   xor      al, al
8e1e: a2a9dd                 mov      byte ptr [0xdda9], al
8e21: c3                     ret      
8e22: e80f97                 call     0x2534
8e25: c70636dffe00           mov      word ptr [0xdf36], 0xfe
8e2b: c60638df10             mov      byte ptr [0xdf38], 0x10
8e30: c60626de0e             mov      byte ptr [0xde26], 0xe
8e35: a00753                 mov      al, byte ptr [0x5307]
8e38: 2206aedd               and      al, byte ptr [0xddae]
8e3c: 7803                   js       0x8e41
8e3e: e98200                 jmp      0x8ec3
8e41: e8a18a                 call     0x18e5
8e44: b30b                   mov      bl, 0xb
8e46: b409                   mov      ah, 9
8e48: e8fe9b                 call     0x2a49
8e4b: c606bd02ff             mov      byte ptr [0x2bd], 0xff
8e50: 33db                   xor      bx, bx
8e52: e80701                 call     0x8f5c
8e55: a0aadd                 mov      al, byte ptr [0xddaa]
8e58: 3c05                   cmp      al, 5
8e5a: 7203                   jb       0x8e5f
8e5c: e8f889                 call     0x1857
8e5f: 8a1eaadd               mov      bl, byte ptr [0xddaa]
8e63: 8a8782dd               mov      al, byte ptr [bx - 0x227e]
8e67: 8ae0                   mov      ah, al
8e69: 0402                   add      al, 2
8e6b: a238df                 mov      byte ptr [0xdf38], al
8e6e: 50                     push     ax
8e6f: 32e4                   xor      ah, ah
8e71: d1e0                   shl      ax, 1
8e73: d1e0                   shl      ax, 1
8e75: d1e0                   shl      ax, 1
8e77: d1e0                   shl      ax, 1
8e79: 2d0200                 sub      ax, 2
8e7c: a336df                 mov      word ptr [0xdf36], ax
8e7f: 58                     pop      ax
8e80: c606bd02ee             mov      byte ptr [0x2bd], 0xee
8e85: e8a700                 call     0x8f2f
8e88: e82802                 call     0x90b3
8e8b: a0aadd                 mov      al, byte ptr [0xddaa]
8e8e: 3c06                   cmp      al, 6
8e90: 7407                   je       0x8e99
8e92: 3c05                   cmp      al, 5
8e94: 7403                   je       0x8e99
8e96: e88f87                 call     0x1628
8e99: 8a1eaadd               mov      bl, byte ptr [0xddaa]
8e9d: 8a878add               mov      al, byte ptr [bx - 0x2276]
8ea1: a226de                 mov      byte ptr [0xde26], al
8ea4: 0402                   add      al, 2
8ea6: 80fb07                 cmp      bl, 7
8ea9: 7502                   jne      0x8ead
8eab: fec8                   dec      al
8ead: a238df                 mov      byte ptr [0xdf38], al
8eb0: 32e4                   xor      ah, ah
8eb2: d1e0                   shl      ax, 1
8eb4: d1e0                   shl      ax, 1
8eb6: d1e0                   shl      ax, 1
8eb8: d1e0                   shl      ax, 1
8eba: 2d0200                 sub      ax, 2
8ebd: a336df                 mov      word ptr [0xdf36], ax
8ec0: eb31                   jmp      0x8ef3
8ec2: 90                     nop      
8ec3: e8e185                 call     0x14a7
8ec6: a00753                 mov      al, byte ptr [0x5307]
8ec9: 22c0                   and      al, al
8ecb: 7821                   js       0x8eee
8ecd: c606bd02ff             mov      byte ptr [0x2bd], 0xff
8ed2: bb8600                 mov      bx, 0x86
8ed5: e8be85                 call     0x1496
8ed8: a05856                 mov      al, byte ptr [0x5658]
8edb: 3c07                   cmp      al, 7
8edd: 721f                   jb       0x8efe
8edf: e87589                 call     0x1857
8ee2: bb1300                 mov      bx, 0x13
8ee5: e87400                 call     0x8f5c
8ee8: e83d87                 call     0x1628
8eeb: eb11                   jmp      0x8efe
8eed: 90                     nop      
8eee: b40b                   mov      ah, 0xb
8ef0: e83c00                 call     0x8f2f
8ef3: c606bd02ff             mov      byte ptr [0x2bd], 0xff
8ef8: bb7100                 mov      bx, 0x71
8efb: e8b884                 call     0x13b6
8efe: 8b3e36df               mov      di, word ptr [0xdf36]
8f02: be7777                 mov      si, 0x7777
8f05: a0aadd                 mov      al, byte ptr [0xddaa]
8f08: 0402                   add      al, 2
8f0a: 98                     cwde     
8f0b: d1e0                   shl      ax, 1
8f0d: d1e0                   shl      ax, 1
8f0f: d1e0                   shl      ax, 1
8f11: 48                     dec      ax
8f12: 8be8                   mov      bp, ax
8f14: e8c588                 call     0x17dc
8f17: c606bd0200             mov      byte ptr [0x2bd], 0
8f1c: 8a2638df               mov      ah, byte ptr [0xdf38]
8f20: b305                   mov      bl, 5
8f22: e8249b                 call     0x2a49
8f25: fec4                   inc      ah
8f27: 50                     push     ax
8f28: e83b86                 call     0x1566
8f2b: 58                     pop      ax
8f2c: 75f2                   jne      0x8f20
8f2e: c3                     ret      
8f2f: b306                   mov      bl, 6
8f31: e8159b                 call     0x2a49
8f34: bb9300                 mov      bx, 0x93
8f37: e87c84                 call     0x13b6
8f3a: 8a1e8a56               mov      bl, byte ptr [0x568a]
8f3e: b0ee                   mov      al, 0xee
8f40: e82489                 call     0x1867
8f43: a0aadd                 mov      al, byte ptr [0xddaa]
8f46: 22c0                   and      al, al
8f48: 740c                   je       0x8f56
8f4a: a02756                 mov      al, byte ptr [0x5627]
8f4d: 22c0                   and      al, al
8f4f: 7405                   je       0x8f56
8f51: b363                   mov      bl, 0x63
8f53: e86084                 call     0x13b6
8f56: c3                     ret      
8f57: e8a673                 call     0x10300
8f5a: fec3                   inc      bl
8f5c: 8a87aade               mov      al, byte ptr [bx - 0x2156]
8f60: 3cff                   cmp      al, 0xff
8f62: 75f3                   jne      0x8f57
8f64: c3                     ret      
8f65: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
8f69: 3c09                   cmp      al, 9
8f6b: 7325                   jae      0x8f92
8f6d: 8ae0                   mov      ah, al
8f6f: 0a87c94c               or       al, byte ptr [bx + 0x4cc9]
8f73: 741d                   je       0x8f92
8f75: 8ac4                   mov      al, ah
8f77: e8558f                 call     0x1ecf
8f7a: b03a                   mov      al, 0x3a
8f7c: e88173                 call     0x10300
8f7f: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
8f83: e83c00                 call     0x8fc2
8f86: b02e                   mov      al, 0x2e
8f88: e87573                 call     0x10300
8f8b: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
8f8f: eb31                   jmp      0x8fc2
8f91: 90                     nop      
8f92: b02d                   mov      al, 0x2d
8f94: e86973                 call     0x10300
8f97: e86673                 call     0x10300
8f9a: e86373                 call     0x10300
8f9d: e86073                 call     0x10300
8fa0: e85d73                 call     0x10300
8fa3: e85a73                 call     0x10300
8fa6: e95773                 jmp      0x10300
8fa9: 50                     push     ax
8faa: e8df00                 call     0x908c
8fad: 58                     pop      ax
8fae: eb04                   jmp      0x8fb4
8fb0: 3c0a                   cmp      al, 0xa
8fb2: 721d                   jb       0x8fd1
8fb4: 3c0a                   cmp      al, 0xa
8fb6: 7307                   jae      0x8fbf
8fb8: 50                     push     ax
8fb9: e8d500                 call     0x9091
8fbc: eb10                   jmp      0x8fce
8fbe: 90                     nop      
8fbf: e85001                 call     0x9112
8fc2: 50                     push     ax
8fc3: d0e8                   shr      al, 1
8fc5: d0e8                   shr      al, 1
8fc7: d0e8                   shr      al, 1
8fc9: d0e8                   shr      al, 1
8fcb: e8018f                 call     0x1ecf
8fce: 58                     pop      ax
8fcf: 240f                   and      al, 0xf
8fd1: e9fb8e                 jmp      0x1ecf
8fd4: 8a87b14c               mov      al, byte ptr [bx + 0x4cb1]
8fd8: 0285b14c               add      al, byte ptr [di + 0x4cb1]
8fdc: 27                     daa      
8fdd: 8885b14c               mov      byte ptr [di + 0x4cb1], al
8fe1: 8a87c94c               mov      al, byte ptr [bx + 0x4cc9]
8fe5: 1285c94c               adc      al, byte ptr [di + 0x4cc9]
8fe9: 27                     daa      
8fea: 7205                   jb       0x8ff1
8fec: 3c60                   cmp      al, 0x60
8fee: f5                     cmc      
8fef: 7304                   jae      0x8ff5
8ff1: 2c60                   sub      al, 0x60
8ff3: 2f                     das      
8ff4: f9                     stc      
8ff5: 8885c94c               mov      byte ptr [di + 0x4cc9], al
8ff9: 8a87e14c               mov      al, byte ptr [bx + 0x4ce1]
8ffd: 1285e14c               adc      al, byte ptr [di + 0x4ce1]
9001: 27                     daa      
9002: 8885e14c               mov      byte ptr [di + 0x4ce1], al
9006: c3                     ret      
9007: bb0600                 mov      bx, 6
900a: a0aadd                 mov      al, byte ptr [0xddaa]
900d: 22c0                   and      al, al
900f: 746c                   je       0x907d
9011: b301                   mov      bl, 1
9013: 881eabdd               mov      byte ptr [0xddab], bl
9017: 8af3                   mov      dh, bl
9019: 8ac3                   mov      al, bl
901b: 8b3e2556               mov      di, word ptr [0x5625]
901f: 81e7ff00               and      di, 0xff
9023: 7414                   je       0x9039
9025: e8d0bb                 call     0x4bf8
9028: 2401                   and      al, 1
902a: fec0                   inc      al
902c: 0206b2dd               add      al, byte ptr [0xddb2]
9030: 3c03                   cmp      al, 3
9032: 7202                   jb       0x9036
9034: 2c03                   sub      al, 3
9036: a2b2dd                 mov      byte ptr [0xddb2], al
9039: 02850048               add      al, byte ptr [di + 0x4800]
903d: 32e4                   xor      ah, ah
903f: 8bf8                   mov      di, ax
9041: 888739df               mov      byte ptr [bx - 0x20c7], al
9045: 8a85e552               mov      al, byte ptr [di + 0x52e5]
9049: 8887b06f               mov      byte ptr [bx + 0x6fb0], al
904d: d0e3                   shl      bl, 1
904f: d1e7                   shl      di, 1
9051: d0e3                   shl      bl, 1
9053: d1e7                   shl      di, 1
9055: d0e3                   shl      bl, 1
9057: d1e7                   shl      di, 1
9059: d0e3                   shl      bl, 1
905b: d1e7                   shl      di, 1
905d: 81e7ff00               and      di, 0xff
9061: b91000                 mov      cx, 0x10
9064: 8a850552               mov      al, byte ptr [di + 0x5205]
9068: 8887d06e               mov      byte ptr [bx + 0x6ed0], al
906c: fec3                   inc      bl
906e: 47                     inc      di
906f: e2f3                   loop     0x9064
9071: 8ade                   mov      bl, dh
9073: fecb                   dec      bl
9075: 79a0                   jns      0x9017
9077: 8a1eaadd               mov      bl, byte ptr [0xddaa]
907b: fec3                   inc      bl
907d: 881eacdd               mov      byte ptr [0xddac], bl
9081: 32c0                   xor      al, al
9083: a2afdd                 mov      byte ptr [0xddaf], al
9086: c3                     ret      
9087: b020                   mov      al, 0x20
9089: e87472                 call     0x10300
908c: b020                   mov      al, 0x20
908e: e86f72                 call     0x10300
9091: b020                   mov      al, 0x20
9093: e96a72                 jmp      0x10300
9096: b080                   mov      al, 0x80
9098: a2aedd                 mov      byte ptr [0xddae], al
909b: e80800                 call     0x90a6
909e: e8a984                 call     0x154a
90a1: d026aedd               shl      byte ptr [0xddae], 1
90a5: c3                     ret      
90a6: b080                   mov      al, 0x80
90a8: a20753                 mov      byte ptr [0x5307], al
90ab: e89c84                 call     0x154a
90ae: d0260753               shl      byte ptr [0x5307], 1
90b2: c3                     ret      
90b3: 8b3e36df               mov      di, word ptr [0xdf36]
90b7: be4444                 mov      si, 0x4444
90ba: bd1700                 mov      bp, 0x17
90bd: e81c87                 call     0x17dc
90c0: c606bd0200             mov      byte ptr [0x2bd], 0
90c5: b305                   mov      bl, 5
90c7: 8a2638df               mov      ah, byte ptr [0xdf38]
90cb: e87b99                 call     0x2a49
90ce: bb2300                 mov      bx, 0x23
90d1: e888fe                 call     0x8f5c
90d4: 8a1e7b56               mov      bl, byte ptr [0x567b]
90d8: 22db                   and      bl, bl
90da: 740d                   je       0x90e9
90dc: fe873556               inc      byte ptr [bx + 0x5635]
90e0: e87b87                 call     0x185e
90e3: bbe900                 mov      bx, 0xe9
90e6: e8ad83                 call     0x1496
90e9: b305                   mov      bl, 5
90eb: 8a2638df               mov      ah, byte ptr [0xdf38]
90ef: fec4                   inc      ah
90f1: e85599                 call     0x2a49
90f4: bb2f00                 mov      bx, 0x2f
90f7: e862fe                 call     0x8f5c
90fa: 8a1e7a56               mov      bl, byte ptr [0x567a]
90fe: 22db                   and      bl, bl
9100: 740d                   je       0x910f
9102: fe874156               inc      byte ptr [bx + 0x5641]
9106: e85587                 call     0x185e
9109: bbef00                 mov      bx, 0xef
910c: e88783                 call     0x1496
910f: e92294                 jmp      0x2534
9112: 8ac8                   mov      cl, al
9114: 32c0                   xor      al, al
9116: 8ae8                   mov      ch, al
9118: 0401                   add      al, 1
911a: 27                     daa      
911b: e2fb                   loop     0x9118
911d: c3                     ret      
911e: c606bd0200             mov      byte ptr [0x2bd], 0
9123: a00853                 mov      al, byte ptr [0x5308]
9126: 22c0                   and      al, al
9128: 74f3                   je       0x911d
912a: bbb800                 mov      bx, 0xb8
912d: be2222                 mov      si, 0x2222
9130: bf5e01                 mov      di, 0x15e
9133: b416                   mov      ah, 0x16
9135: 50                     push     ax
9136: 2401                   and      al, 1
9138: 7428                   je       0x9162
913a: bbe300                 mov      bx, 0xe3
913d: beeeee                 mov      si, 0xeeee
9140: bf0e01                 mov      di, 0x10e
9143: 58                     pop      ax
9144: b411                   mov      ah, 0x11
9146: c606bd02ff             mov      byte ptr [0x2bd], 0xff
914b: 50                     push     ax
914c: 56                     push     si
914d: 57                     push     di
914e: e86582                 call     0x13b6
9151: a00853                 mov      al, byte ptr [0x5308]
9154: 24c0                   and      al, 0xc0
9156: 3cc0                   cmp      al, 0xc0
9158: 7506                   jne      0x9160
915a: bb6f00                 mov      bx, 0x6f
915d: e85682                 call     0x13b6
9160: 5f                     pop      di
9161: 5e                     pop      si
9162: bd1700                 mov      bp, 0x17
9165: e87486                 call     0x17dc
9168: c606bd0200             mov      byte ptr [0x2bd], 0
916d: a00853                 mov      al, byte ptr [0x5308]
9170: d0e0                   shl      al, 1
9172: 731c                   jae      0x9190
9174: 58                     pop      ax
9175: 50                     push     ax
9176: b305                   mov      bl, 5
9178: e8ce98                 call     0x2a49
917b: bb2300                 mov      bx, 0x23
917e: e8dbfd                 call     0x8f5c
9181: bbd600                 mov      bx, 0xd6
9184: e82f82                 call     0x13b6
9187: e807ff                 call     0x9091
918a: bb0f00                 mov      bx, 0xf
918d: e8d5fd                 call     0x8f65
9190: 58                     pop      ax
9191: a00853                 mov      al, byte ptr [0x5308]
9194: 2440                   and      al, 0x40
9196: 741b                   je       0x91b3
9198: b305                   mov      bl, 5
919a: fec4                   inc      ah
919c: e8aa98                 call     0x2a49
919f: bb2f00                 mov      bx, 0x2f
91a2: e8b7fd                 call     0x8f5c
91a5: bbc900                 mov      bx, 0xc9
91a8: e80b82                 call     0x13b6
91ab: e8e3fe                 call     0x9091
91ae: b30e                   mov      bl, 0xe
91b0: e9b2fd                 jmp      0x8f65
91b3: c3                     ret      
91b4: bf0c00                 mov      di, 0xc
91b7: e8d48a                 call     0x1c8e
91ba: 7306                   jae      0x91c2
91bc: a0addd                 mov      al, byte ptr [0xddad]
91bf: a27a56                 mov      byte ptr [0x567a], al
91c2: bf0e00                 mov      di, 0xe
91c5: e8c68a                 call     0x1c8e
91c8: 730d                   jae      0x91d7
91ca: bfc900                 mov      di, 0xc9
91cd: e84500                 call     0x9215
91d0: 800e085341             or       byte ptr [0x5308], 0x41
91d5: 33db                   xor      bx, bx
91d7: 8b3eaddd               mov      di, word ptr [0xddad]
91db: 81e7ff00               and      di, 0xff
91df: e8ac8a                 call     0x1c8e
91e2: 83c70c                 add      di, 0xc
91e5: e8ecfd                 call     0x8fd4
91e8: a08554                 mov      al, byte ptr [0x5485]
91eb: 3c04                   cmp      al, 4
91ed: 7523                   jne      0x9212
91ef: 8bdf                   mov      bx, di
91f1: bf0d00                 mov      di, 0xd
91f4: e8978a                 call     0x1c8e
91f7: 7306                   jae      0x91ff
91f9: a0addd                 mov      al, byte ptr [0xddad]
91fc: a27b56                 mov      byte ptr [0x567b], al
91ff: bf0f00                 mov      di, 0xf
9202: e8898a                 call     0x1c8e
9205: 730b                   jae      0x9212
9207: bfd600                 mov      di, 0xd6
920a: e80800                 call     0x9215
920d: 800e085381             or       byte ptr [0x5308], 0x81
9212: 33db                   xor      bx, bx
9214: c3                     ret      
9215: a0addd                 mov      al, byte ptr [0xddad]
9218: d0e0                   shl      al, 1
921a: d0e0                   shl      al, 1
921c: d0e0                   shl      al, 1
921e: d0e0                   shl      al, 1
9220: 8ad8                   mov      bl, al
9222: b90600                 mov      cx, 6
9225: 8b87d16e               mov      ax, word ptr [bx + 0x6ed1]
9229: 8985b3dd               mov      word ptr [di - 0x224d], ax
922d: 80c302                 add      bl, 2
9230: 83c702                 add      di, 2
9233: e2f0                   loop     0x9225
9235: c3                     ret      
9236: 8ae0                   mov      ah, al
9238: 8a1e8a56               mov      bl, byte ptr [0x568a]
923c: a02756                 mov      al, byte ptr [0x5627]
923f: 22c0                   and      al, al
9241: 8a870b43               mov      al, byte ptr [bx + 0x430b]
9245: 7402                   je       0x9249
9247: 0408                   add      al, 8
9249: d0e0                   shl      al, 1
924b: d0e0                   shl      al, 1
924d: d0e0                   shl      al, 1
924f: d0e0                   shl      al, 1
9251: 8ad8                   mov      bl, al
9253: 33ff                   xor      di, di
9255: 22e4                   and      ah, ah
9257: 783d                   js       0x9296
9259: b90600                 mov      cx, 6
925c: 8b857cde               mov      ax, word ptr [di - 0x2184]
9260: 8987054d               mov      word ptr [bx + 0x4d05], ax
9264: 8b8589de               mov      ax, word ptr [di - 0x2177]
9268: 8987054e               mov      word ptr [bx + 0x4e05], ax
926c: 80c302                 add      bl, 2
926f: 83c702                 add      di, 2
9272: e2e8                   loop     0x925c
9274: a1ef4c                 mov      ax, word ptr [0x4cef]
9277: 8887054d               mov      byte ptr [bx + 0x4d05], al
927b: 88a7054e               mov      byte ptr [bx + 0x4e05], ah
927f: a1d74c                 mov      ax, word ptr [0x4cd7]
9282: 8887064d               mov      byte ptr [bx + 0x4d06], al
9286: 88a7064e               mov      byte ptr [bx + 0x4e06], ah
928a: a1bf4c                 mov      ax, word ptr [0x4cbf]
928d: 8887074d               mov      byte ptr [bx + 0x4d07], al
9291: 88a7074e               mov      byte ptr [bx + 0x4e07], ah
9295: c3                     ret      
9296: b90600                 mov      cx, 6
9299: 8b87054d               mov      ax, word ptr [bx + 0x4d05]
929d: 89857cde               mov      word ptr [di - 0x2184], ax
92a1: 8b87054e               mov      ax, word ptr [bx + 0x4e05]
92a5: 898589de               mov      word ptr [di - 0x2177], ax
92a9: 80c302                 add      bl, 2
92ac: 83c702                 add      di, 2
92af: e2e8                   loop     0x9299
92b1: 8a87054d               mov      al, byte ptr [bx + 0x4d05]
92b5: 8aa7054e               mov      ah, byte ptr [bx + 0x4e05]
92b9: a3ef4c                 mov      word ptr [0x4cef], ax
92bc: 8a87064d               mov      al, byte ptr [bx + 0x4d06]
92c0: 8aa7064e               mov      ah, byte ptr [bx + 0x4e06]
92c4: a3d74c                 mov      word ptr [0x4cd7], ax
92c7: 8a87074d               mov      al, byte ptr [bx + 0x4d07]
92cb: 8aa7074e               mov      ah, byte ptr [bx + 0x4e07]
92cf: a3bf4c                 mov      word ptr [0x4cbf], ax
92d2: c3                     ret      
92d3: c606a9dd80             mov      byte ptr [0xdda9], 0x80
92d8: d02eb1dd               shr      byte ptr [0xddb1], 1
92dc: 7212                   jb       0x92f0
92de: b403                   mov      ah, 3
92e0: a02556                 mov      al, byte ptr [0x5625]
92e3: 3403                   xor      al, 3
92e5: bb1800                 mov      bx, 0x18
92e8: e84b98                 call     0x2b36
92eb: 3403                   xor      al, 3
92ed: a2b0dd                 mov      byte ptr [0xddb0], al
92f0: d02ea9dd               shr      byte ptr [0xdda9], 1
92f4: b402                   mov      ah, 2
92f6: a07956                 mov      al, byte ptr [0x5679]
92f9: 2401                   and      al, 1
92fb: bb1c00                 mov      bx, 0x1c
92fe: e83598                 call     0x2b36
9301: c606a9dd00             mov      byte ptr [0xdda9], 0
9306: c3                     ret      
9307: bad403                 mov      dx, 0x3d4
930a: b80c00                 mov      ax, 0xc
930d: ef                     out      dx, ax
930e: e836b2                 call     0x4547
9311: a0704a                 mov      al, byte ptr [0x4a70]
9314: 50                     push     ax
9315: c606704a45             mov      byte ptr [0x4a70], 0x45
931a: 06                     push     es
931b: b800a0                 mov      ax, 0xa000
931e: 8ec0                   mov      es, ax
9320: be1800                 mov      si, 0x18
9323: e8faf9                 call     0x8d20
9326: e8e3b1                 call     0x450c
9329: bad403                 mov      dx, 0x3d4
932c: b80c00                 mov      ax, 0xc
932f: ef                     out      dx, ax
9330: c606bd02ff             mov      byte ptr [0x2bd], 0xff
9335: be7f00                 mov      si, 0x7f
9338: 8bfe                   mov      di, si
933a: a02756                 mov      al, byte ptr [0x5627]
933d: 22c0                   and      al, al
933f: 7403                   je       0x9344
9341: bfff00                 mov      di, 0xff
9344: 8a85054d               mov      al, byte ptr [di + 0x4d05]
9348: 8884ad5a               mov      byte ptr [si + 0x5aad], al
934c: 8a85054e               mov      al, byte ptr [di + 0x4e05]
9350: 88842d5b               mov      byte ptr [si + 0x5b2d], al
9354: 4f                     dec      di
9355: 4e                     dec      si
9356: 79ec                   jns      0x9344
9358: b001                   mov      al, 1
935a: e8fc71                 call     0x10559
935d: b002                   mov      al, 2
935f: a20553                 mov      byte ptr [0x5305], al
9362: a02756                 mov      al, byte ptr [0x5627]
9365: 22c0                   and      al, al
9367: 740b                   je       0x9374
9369: c606bd02ee             mov      byte ptr [0x2bd], 0xee
936e: bb4b00                 mov      bx, 0x4b
9371: e8e8fb                 call     0x8f5c
9374: c606bd0200             mov      byte ptr [0x2bd], 0
9379: bb5b00                 mov      bx, 0x5b
937c: e8ddfb                 call     0x8f5c
937f: c606cb4a07             mov      byte ptr [0x4acb], 7
9384: b007                   mov      al, 7
9386: 2a06cb4a               sub      al, byte ptr [0x4acb]
938a: d0e0                   shl      al, 1
938c: 0409                   add      al, 9
938e: 8ae0                   mov      ah, al
9390: 32db                   xor      bl, bl
9392: e8b496                 call     0x2a49
9395: 8a1ecb4a               mov      bl, byte ptr [0x4acb]
9399: d0e3                   shl      bl, 1
939b: 32ff                   xor      bh, bh
939d: c606055301             mov      byte ptr [0x5305], 1
93a2: c606bd02ff             mov      byte ptr [0x2bd], 0xff
93a7: 8a873ddf               mov      al, byte ptr [bx - 0x20c3]
93ab: e8526f                 call     0x10300
93ae: 8a873edf               mov      al, byte ptr [bx - 0x20c2]
93b2: e84b6f                 call     0x10300
93b5: e8d9fc                 call     0x9091
93b8: c606055304             mov      byte ptr [0x5305], 4
93bd: c606ba4a00             mov      byte ptr [0x4aba], 0
93c2: a0cb4a                 mov      al, byte ptr [0x4acb]
93c5: d0e0                   shl      al, 1
93c7: d0e0                   shl      al, 1
93c9: d0e0                   shl      al, 1
93cb: d0e0                   shl      al, 1
93cd: 0a06ba4a               or       al, byte ptr [0x4aba]
93d1: 8ad8                   mov      bl, al
93d3: c606bd02ee             mov      byte ptr [0x2bd], 0xee
93d8: b90c00                 mov      cx, 0xc
93db: 51                     push     cx
93dc: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
93e0: e81d6f                 call     0x10300
93e3: fec3                   inc      bl
93e5: 59                     pop      cx
93e6: e2f3                   loop     0x93db
93e8: c606bd02ff             mov      byte ptr [0x2bd], 0xff
93ed: e8a1fc                 call     0x9091
93f0: fe0e0553               dec      byte ptr [0x5305]
93f4: 8a87ad5a               mov      al, byte ptr [bx + 0x5aad]
93f8: a2e14c                 mov      byte ptr [0x4ce1], al
93fb: 8a87ae5a               mov      al, byte ptr [bx + 0x5aae]
93ff: a2c94c                 mov      byte ptr [0x4cc9], al
9402: 8a87af5a               mov      al, byte ptr [bx + 0x5aaf]
9406: a2b14c                 mov      byte ptr [0x4cb1], al
9409: 33db                   xor      bx, bx
940b: e857fb                 call     0x8f65
940e: 8036ba4a80             xor      byte ptr [0x4aba], 0x80
9413: 790a                   jns      0x941f
9415: e874fc                 call     0x908c
9418: c606055302             mov      byte ptr [0x5305], 2
941d: eba3                   jmp      0x93c2
941f: fe0ecb4a               dec      byte ptr [0x4acb]
9423: 7803                   js       0x9428
9425: e95cff                 jmp      0x9384
9428: c606055300             mov      byte ptr [0x5305], 0
942d: e8ff81                 call     0x162f
9430: 07                     pop      es
9431: 58                     pop      ax
9432: a2704a                 mov      byte ptr [0x4a70], al
9435: e910ad                 jmp      0x4148
9438: 8ad0                   mov      dl, al
943a: 06                     push     es
943b: 8cd8                   mov      ax, ds
943d: 8ec0                   mov      es, ax
943f: a0addd                 mov      al, byte ptr [0xddad]
9442: 2c04                   sub      al, 4
9444: 8ae0                   mov      ah, al
9446: d0e0                   shl      al, 1
9448: d0e0                   shl      al, 1
944a: 02c4                   add      al, ah
944c: 32e4                   xor      ah, ah
944e: d1e0                   shl      ax, 1
9450: 8bf8                   mov      di, ax
9452: 81c718e2               add      di, 0xe218
9456: beb308                 mov      si, 0x8b3
9459: b90500                 mov      cx, 5
945c: 22d2                   and      dl, dl
945e: 7902                   jns      0x9462
9460: 87f7                   xchg     di, si
9462: f3a5                   rep movsw word ptr es:[di], word ptr [si]
9464: 22d2                   and      dl, dl
9466: 7840                   js       0x94a8
9468: a1c508                 mov      ax, word ptr [0x8c5]
946b: 3de406                 cmp      ax, 0x6e4
946e: 7406                   je       0x9476
9470: 8944f6                 mov      word ptr [si - 0xa], ax
9473: eb50                   jmp      0x94c5
9475: 90                     nop      
9476: be68e2                 mov      si, 0xe268
9479: a06148                 mov      al, byte ptr [0x4861]
947c: 22c0                   and      al, al
947e: 740c                   je       0x948c
9480: 3c01                   cmp      al, 1
9482: 7415                   je       0x9499
9484: be72e2                 mov      si, 0xe272
9487: b8e206                 mov      ax, 0x6e2
948a: eb03                   jmp      0x948f
948c: b8e406                 mov      ax, 0x6e4
948f: bfb308                 mov      di, 0x8b3
9492: b90500                 mov      cx, 5
9495: f3a5                   rep movsw word ptr es:[di], word ptr [si]
9497: eb03                   jmp      0x949c
9499: b83d07                 mov      ax, 0x73d
949c: fa                     cli      
949d: a3c508                 mov      word ptr [0x8c5], ax
94a0: fb                     sti      
94a1: eb22                   jmp      0x94c5
94a3: b8e406                 mov      ax, 0x6e4
94a6: eb18                   jmp      0x94c0
94a8: 8b44f6                 mov      ax, word ptr [si - 0xa]
94ab: 3d3d07                 cmp      ax, 0x73d
94ae: 7410                   je       0x94c0
94b0: 3de206                 cmp      ax, 0x6e2
94b3: 75ee                   jne      0x94a3
94b5: bfb308                 mov      di, 0x8b3
94b8: be72e2                 mov      si, 0xe272
94bb: b90500                 mov      cx, 5
94be: f3a5                   rep movsw word ptr es:[di], word ptr [si]
94c0: fa                     cli      
94c1: a3c508                 mov      word ptr [0x8c5], ax
94c4: fb                     sti      
94c5: 07                     pop      es
94c6: c3                     ret      
94c7: 80266b08ff             and      byte ptr [0x86b], 0xff
94cc: 79f8                   jns      0x94c6
94ce: 80266b087f             and      byte ptr [0x86b], 0x7f
94d3: c606a8ddff             mov      byte ptr [0xdda8], 0xff
94d8: a06148                 mov      al, byte ptr [0x4861]
94db: 22c0                   and      al, al
94dd: 7444                   je       0x9523
94df: be3b47                 mov      si, 0x473b
94e2: e8528d                 call     0x2237
94e5: e833d2                 call     0x671b
94e8: e8c46f                 call     0x104af
94eb: 3c6e                   cmp      al, 0x6e
94ed: 7434                   je       0x9523
94ef: 3c4e                   cmp      al, 0x4e
94f1: 7430                   je       0x9523
94f3: 3c79                   cmp      al, 0x79
94f5: 7404                   je       0x94fb
94f7: 3c59                   cmp      al, 0x59
94f9: 75ed                   jne      0x94e8
94fb: a06148                 mov      al, byte ptr [0x4861]
94fe: 22c0                   and      al, al
9500: 3c01                   cmp      al, 1
9502: b83d07                 mov      ax, 0x73d
9505: 7414                   je       0x951b
9507: be72e2                 mov      si, 0xe272
950a: bfb308                 mov      di, 0x8b3
950d: b90500                 mov      cx, 5
9510: 06                     push     es
9511: 8cd8                   mov      ax, ds
9513: 8ec0                   mov      es, ax
9515: f3a5                   rep movsw word ptr es:[di], word ptr [si]
9517: 07                     pop      es
9518: b8e206                 mov      ax, 0x6e2
951b: fa                     cli      
951c: a3c508                 mov      word ptr [0x8c5], ax
951f: fb                     sti      
9520: e99700                 jmp      0x95ba
9523: fa                     cli      
9524: c706c508e406           mov      word ptr [0x8c5], 0x6e4
952a: fb                     sti      
952b: be1745                 mov      si, 0x4517
952e: c606a7dd01             mov      byte ptr [0xdda7], 1
9533: e8018d                 call     0x2237
9536: e8e2d1                 call     0x671b
9539: bf1e00                 mov      di, 0x1e
953c: e86497                 call     0x2ca3
953f: bb0400                 mov      bx, 4
9542: 881ea6dd               mov      byte ptr [0xdda6], bl
9546: d1e3                   shl      bx, 1
9548: 8bb792dd               mov      si, word ptr [bx - 0x226e]
954c: e8e88c                 call     0x2237
954f: e8c9d1                 call     0x671b
9552: bb3008                 mov      bx, 0x830
9555: b95400                 mov      cx, 0x54
9558: 8027ff                 and      byte ptr [bx], 0xff
955b: 7805                   js       0x9562
955d: 43                     inc      bx
955e: e2f8                   loop     0x9558
9560: ebf0                   jmp      0x9552
9562: 81eb3008               sub      bx, 0x830
9566: 8bc3                   mov      ax, bx
9568: 32e4                   xor      ah, ah
956a: 8a1ea6dd               mov      bl, byte ptr [0xdda6]
956e: 8afc                   mov      bh, ah
9570: 053008                 add      ax, 0x830
9573: d1e3                   shl      bx, 1
9575: 8b9f9cdd               mov      bx, word ptr [bx - 0x2264]
9579: 8026a7ddff             and      byte ptr [0xdda7], 0xff
957e: 7515                   jne      0x9595
9580: 3907                   cmp      word ptr [bx], ax
9582: 7413                   je       0x9597
9584: bef246                 mov      si, 0x46f2
9587: e8ad8c                 call     0x2237
958a: e88ed1                 call     0x671b
958d: bf2800                 mov      di, 0x28
9590: e81097                 call     0x2ca3
9593: eb96                   jmp      0x952b
9595: 8907                   mov      word ptr [bx], ax
9597: 8bd8                   mov      bx, ax
9599: 8027ff                 and      byte ptr [bx], 0xff
959c: 78fb                   js       0x9599
959e: bf0300                 mov      di, 3
95a1: e8ff96                 call     0x2ca3
95a4: 8a1ea6dd               mov      bl, byte ptr [0xdda6]
95a8: 32ff                   xor      bh, bh
95aa: fecb                   dec      bl
95ac: 7994                   jns      0x9542
95ae: fe0ea7dd               dec      byte ptr [0xdda7]
95b2: 7806                   js       0x95ba
95b4: bea946                 mov      si, 0x46a9
95b7: e979ff                 jmp      0x9533
95ba: 32ff                   xor      bh, bh
95bc: bef244                 mov      si, 0x44f2
95bf: e8758c                 call     0x2237
95c2: e856d1                 call     0x671b
95c5: c606a8dd00             mov      byte ptr [0xdda8], 0
95ca: 802649087f             and      byte ptr [0x849], 0x7f
95cf: c3                     ret      
95d0: e874af                 call     0x4547
95d3: 06                     push     es
95d4: b800a2                 mov      ax, 0xa200
95d7: 8ec0                   mov      es, ax
95d9: bad403                 mov      dx, 0x3d4
95dc: b80c00                 mov      ax, 0xc
95df: ef                     out      dx, ax
95e0: be0400                 mov      si, 4
95e3: e83af7                 call     0x8d20
95e6: 33ed                   xor      bp, bp
95e8: 3e8a861956             mov      al, byte ptr ds:[bp + 0x5619]
95ed: 55                     push     bp
95ee: e83e00                 call     0x962f
95f1: 5d                     pop      bp
95f2: 45                     inc      bp
95f3: 83fd0c                 cmp      bp, 0xc
95f6: 72f0                   jb       0x95e8
95f8: b800a0                 mov      ax, 0xa000
95fb: 8ec0                   mov      es, ax
95fd: b800a2                 mov      ax, 0xa200
9600: 8ed8                   mov      ds, ax
9602: bace03                 mov      dx, 0x3ce
9605: b80501                 mov      ax, 0x105
9608: ef                     out      dx, ax
9609: 33f6                   xor      si, si
960b: 8bfe                   mov      di, si
960d: b9e001                 mov      cx, 0x1e0
9610: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
9612: bea81b                 mov      si, 0x1ba8
9615: 8bfe                   mov      di, si
9617: b99803                 mov      cx, 0x398
961a: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
961c: b80500                 mov      ax, 5
961f: ef                     out      dx, ax
9620: b8d809                 mov      ax, 0x9d8
9623: 8ed8                   mov      ds, ax
9625: e825af                 call     0x454d
9628: e80480                 call     0x162f
962b: 07                     pop      es
962c: e919ab                 jmp      0x4148
962f: 06                     push     es
9630: 32e4                   xor      ah, ah
9632: a282df                 mov      byte ptr [0xdf82], al
9635: 8026aaddff             and      byte ptr [0xddaa], 0xff
963a: 741a                   je       0x9656
963c: 802685dfff             and      byte ptr [0xdf85], 0xff
9641: 7404                   je       0x9647
9643: b00b                   mov      al, 0xb
9645: eb0f                   jmp      0x9656
9647: 3a06addd               cmp      al, byte ptr [0xddad]
964b: 74f6                   je       0x9643
964d: 250100                 and      ax, 1
9650: 8bd8                   mov      bx, ax
9652: 8a8739df               mov      al, byte ptr [bx - 0x20c7]
9656: 3c0c                   cmp      al, 0xc
9658: 7203                   jb       0x965d
965a: e98400                 jmp      0x96e1
965d: 83fd13                 cmp      bp, 0x13
9660: 73f8                   jae      0x965a
9662: a24ddf                 mov      byte ptr [0xdf4d], al
9665: 8bd8                   mov      bx, ax
9667: 8a8775df               mov      al, byte ptr [bx - 0x208b]
966b: 8bd8                   mov      bx, ax
966d: d1e5                   shl      bp, 1
966f: d1e3                   shl      bx, 1
9671: 8bb74fdf               mov      si, word ptr [bx - 0x20b1]
9675: 3e8bbe4fdf             mov      di, word ptr ds:[bp - 0x20b1]
967a: 893e83df               mov      word ptr [0xdf83], di
967e: a081df                 mov      al, byte ptr [0xdf81]
9681: 22c0                   and      al, al
9683: 7405                   je       0x968a
9685: e8e402                 call     0x996c
9688: eb4d                   jmp      0x96d7
968a: a0aadd                 mov      al, byte ptr [0xddaa]
968d: 22c0                   and      al, al
968f: 7413                   je       0x96a4
9691: 803e4ddf0b             cmp      byte ptr [0xdf4d], 0xb
9696: 750c                   jne      0x96a4
9698: a082df                 mov      al, byte ptr [0xdf82]
969b: bb0be2                 mov      bx, 0xe20b
969e: d7                     xlatb    
969f: e84600                 call     0x96e8
96a2: 32ff                   xor      bh, bh
96a4: b800a2                 mov      ax, 0xa200
96a7: 8ed8                   mov      ds, ax
96a9: b800a0                 mov      ax, 0xa000
96ac: 8ec0                   mov      es, ax
96ae: bac403                 mov      dx, 0x3c4
96b1: b8020f                 mov      ax, 0xf02
96b4: ef                     out      dx, ax
96b5: bace03                 mov      dx, 0x3ce
96b8: b80501                 mov      ax, 0x105
96bb: ef                     out      dx, ax
96bc: bb3700                 mov      bx, 0x37
96bf: bd1e00                 mov      bp, 0x1e
96c2: b90a00                 mov      cx, 0xa
96c5: f3a4                   rep movsb byte ptr es:[di], byte ptr [si]
96c7: 03f5                   add      si, bp
96c9: 03fd                   add      di, bp
96cb: 4b                     dec      bx
96cc: 75f4                   jne      0x96c2
96ce: b80500                 mov      ax, 5
96d1: ef                     out      dx, ax
96d2: b8d809                 mov      ax, 0x9d8
96d5: 8ed8                   mov      ds, ax
96d7: 803e4ddf0b             cmp      byte ptr [0xdf4d], 0xb
96dc: 7503                   jne      0x96e1
96de: e83304                 call     0x9b14
96e1: b8d809                 mov      ax, 0x9d8
96e4: 8ed8                   mov      ds, ax
96e6: 07                     pop      es
96e7: c3                     ret      
96e8: 57                     push     di
96e9: 56                     push     si
96ea: 8bfe                   mov      di, si
96ec: 8af8                   mov      bh, al
96ee: b800a2                 mov      ax, 0xa200
96f1: 8ec0                   mov      es, ax
96f3: bac403                 mov      dx, 0x3c4
96f6: b8020f                 mov      ax, 0xf02
96f9: ef                     out      dx, ax
96fa: bace03                 mov      dx, 0x3ce
96fd: b80308                 mov      ax, 0x803
9700: ef                     out      dx, ax
9701: be67e0                 mov      si, 0xe067
9704: bd2a00                 mov      bp, 0x2a
9707: 83c728                 add      di, 0x28
970a: b90500                 mov      cx, 5
970d: 268a05                 mov      al, byte ptr es:[di]
9710: 8a4401                 mov      al, byte ptr [si + 1]
9713: aa                     stosb    byte ptr es:[di], al
9714: 268a05                 mov      al, byte ptr es:[di]
9717: a4                     movsb    byte ptr es:[di], byte ptr [si]
9718: 46                     inc      si
9719: e2f2                   loop     0x970d
971b: 83c71e                 add      di, 0x1e
971e: 4d                     dec      bp
971f: 75e9                   jne      0x970a
9721: 5f                     pop      di
9722: 57                     push     di
9723: 83c728                 add      di, 0x28
9726: bd2a00                 mov      bp, 0x2a
9729: b80310                 mov      ax, 0x1003
972c: ef                     out      dx, ax
972d: bac403                 mov      dx, 0x3c4
9730: b002                   mov      al, 2
9732: 8ae7                   mov      ah, bh
9734: ef                     out      dx, ax
9735: be67e0                 mov      si, 0xe067
9738: b90500                 mov      cx, 5
973b: 268a05                 mov      al, byte ptr es:[di]
973e: 8a4401                 mov      al, byte ptr [si + 1]
9741: f6d0                   not      al
9743: aa                     stosb    byte ptr es:[di], al
9744: 268a05                 mov      al, byte ptr es:[di]
9747: ac                     lodsb    al, byte ptr [si]
9748: f6d0                   not      al
974a: aa                     stosb    byte ptr es:[di], al
974b: 46                     inc      si
974c: e2ed                   loop     0x973b
974e: 83c71e                 add      di, 0x1e
9751: 4d                     dec      bp
9752: 75e4                   jne      0x9738
9754: bace03                 mov      dx, 0x3ce
9757: b80300                 mov      ax, 3
975a: ef                     out      dx, ax
975b: 5e                     pop      si
975c: 5f                     pop      di
975d: c3                     ret      
975e: e8fc8c                 call     0x245d
9761: a07e56                 mov      al, byte ptr [0x567e]
9764: bd0c00                 mov      bp, 0xc
9767: e8c5fe                 call     0x962f
976a: a07f56                 mov      al, byte ptr [0x567f]
976d: bd0d00                 mov      bp, 0xd
9770: e9bcfe                 jmp      0x962f
9773: a20f42                 mov      byte ptr [0x420f], al
9776: c606bd02ff             mov      byte ptr [0x2bd], 0xff
977b: bb0d00                 mov      bx, 0xd
977e: e8157d                 call     0x11496
9781: a0afdd                 mov      al, byte ptr [0xddaf]
9784: fec0                   inc      al
9786: e827f8                 call     0x8fb0
9789: bbf400                 mov      bx, 0xf4
978c: e8077d                 call     0x11496
978f: a0aadd                 mov      al, byte ptr [0xddaa]
9792: 22c0                   and      al, al
9794: a0acdd                 mov      al, byte ptr [0xddac]
9797: 7402                   je       0x979b
9799: d0e0                   shl      al, 1
979b: e912f8                 jmp      0x8fb0
979e: 06                     push     es
979f: b800a2                 mov      ax, 0xa200
97a2: 8ec0                   mov      es, ax
97a4: bad403                 mov      dx, 0x3d4
97a7: b80c00                 mov      ax, 0xc
97aa: ef                     out      dx, ax
97ab: be0400                 mov      si, 4
97ae: e86ff5                 call     0x8d20
97b1: a07e54                 mov      al, byte ptr [0x547e]
97b4: 22c0                   and      al, al
97b6: 7829                   js       0x97e1
97b8: e86d7e                 call     0x11628
97bb: b00b                   mov      al, 0xb
97bd: e8b3ff                 call     0x9773
97c0: 33db                   xor      bx, bx
97c2: e86900                 call     0x982e
97c5: e896ff                 call     0x975e
97c8: c606bd02ee             mov      byte ptr [0x2bd], 0xee
97cd: e8587e                 call     0x11628
97d0: b414                   mov      ah, 0x14
97d2: e85af7                 call     0x8f2f
97d5: b080                   mov      al, 0x80
97d7: e85cfa                 call     0x9236
97da: e841f9                 call     0x911e
97dd: 07                     pop      es
97de: e9447e                 jmp      0x11625
97e1: e87380                 call     0x1857
97e4: b00a                   mov      al, 0xa
97e6: e88aff                 call     0x9773
97e9: e8718c                 call     0x245d
97ec: bfbe00                 mov      di, 0xbe
97ef: c606cb4a0c             mov      byte ptr [0x4acb], 0xc
97f4: e8607e                 call     0x11657
97f7: e82e7e                 call     0x11628
97fa: c606bd02ff             mov      byte ptr [0x2bd], 0xff
97ff: bb6000                 mov      bx, 0x60
9802: e8917c                 call     0x11496
9805: e84f80                 call     0x1857
9808: c606bd02ff             mov      byte ptr [0x2bd], 0xff
980d: bb0500                 mov      bx, 5
9810: e81b00                 call     0x982e
9813: a07c56                 mov      al, byte ptr [0x567c]
9816: bd0e00                 mov      bp, 0xe
9819: e813fe                 call     0x962f
981c: a07d56                 mov      al, byte ptr [0x567d]
981f: bd0f00                 mov      bp, 0xf
9822: e80afe                 call     0x962f
9825: 07                     pop      es
9826: e9fc7d                 jmp      0x11625
9829: e8d46a                 call     0x10300
982c: fec3                   inc      bl
982e: 8a878fdf               mov      al, byte ptr [bx - 0x2071]
9832: 3cff                   cmp      al, 0xff
9834: 75f3                   jne      0x9829
9836: c3                     ret      
9837: b8d809                 mov      ax, 0x9d8
983a: 8ed8                   mov      ds, ax
983c: 8b367d4b               mov      si, word ptr [0x4b7d]
9840: 81e6ff00               and      si, 0xff
9844: 81c66556               add      si, 0x5665
9848: ac                     lodsb    al, byte ptr [si]
9849: 56                     push     si
984a: bd1000                 mov      bp, 0x10
984d: c60681df06             mov      byte ptr [0xdf81], 6
9852: e8dafd                 call     0x962f
9855: 5e                     pop      si
9856: ac                     lodsb    al, byte ptr [si]
9857: 56                     push     si
9858: bd1100                 mov      bp, 0x11
985b: c60681df01             mov      byte ptr [0xdf81], 1
9860: e8ccfd                 call     0x962f
9863: 5e                     pop      si
9864: ac                     lodsb    al, byte ptr [si]
9865: bd1200                 mov      bp, 0x12
9868: c60681df04             mov      byte ptr [0xdf81], 4
986d: e8bffd                 call     0x962f
9870: e8e47f                 call     0x11857
9873: c606bd02ff             mov      byte ptr [0x2bd], 0xff
9878: c606055304             mov      byte ptr [0x5305], 4
987d: bb4900                 mov      bx, 0x49
9880: e8abff                 call     0x982e
9883: c606055300             mov      byte ptr [0x5305], 0
9888: c606bd02ee             mov      byte ptr [0x2bd], 0xee
988d: c60680dd04             mov      byte ptr [0xdd80], 4
9892: 8b367d4b               mov      si, word ptr [0x4b7d]
9896: 81e6ff00               and      si, 0xff
989a: 81c66556               add      si, 0x5665
989e: 8a04                   mov      al, byte ptr [si]
98a0: a27c4b                 mov      byte ptr [0x4b7c], al
98a3: c606bd02ee             mov      byte ptr [0x2bd], 0xee
98a8: 8a1e80dd               mov      bl, byte ptr [0xdd80]
98ac: b413                   mov      ah, 0x13
98ae: e89891                 call     0x2a49
98b1: e8a37f                 call     0x11857
98b4: bb2500                 mov      bx, 0x25
98b7: e874ff                 call     0x982e
98ba: c606bd02ff             mov      byte ptr [0x2bd], 0xff
98bf: a07c4b                 mov      al, byte ptr [0x4b7c]
98c2: 32e4                   xor      ah, ah
98c4: be4d56                 mov      si, 0x564d
98c7: 03f0                   add      si, ax
98c9: 8a04                   mov      al, byte ptr [si]
98cb: e8e6f6                 call     0x8fb4
98ce: c606bd02ee             mov      byte ptr [0x2bd], 0xee
98d3: 8a1e80dd               mov      bl, byte ptr [0xdd80]
98d7: b415                   mov      ah, 0x15
98d9: e86d91                 call     0x2a49
98dc: e8497d                 call     0x11628
98df: bb2e00                 mov      bx, 0x2e
98e2: e849ff                 call     0x982e
98e5: c606bd02ff             mov      byte ptr [0x2bd], 0xff
98ea: a07c4b                 mov      al, byte ptr [0x4b7c]
98ed: 32e4                   xor      ah, ah
98ef: be3556                 mov      si, 0x5635
98f2: 03f0                   add      si, ax
98f4: 8a04                   mov      al, byte ptr [si]
98f6: e8bbf6                 call     0x8fb4
98f9: c606bd02ee             mov      byte ptr [0x2bd], 0xee
98fe: 8a1e80dd               mov      bl, byte ptr [0xdd80]
9902: b416                   mov      ah, 0x16
9904: e84291                 call     0x2a49
9907: e84d7f                 call     0x11857
990a: bb3700                 mov      bx, 0x37
990d: e81eff                 call     0x982e
9910: c606bd02ff             mov      byte ptr [0x2bd], 0xff
9915: a07c4b                 mov      al, byte ptr [0x4b7c]
9918: 32e4                   xor      ah, ah
991a: be4156                 mov      si, 0x5641
991d: 03f0                   add      si, ax
991f: 8a04                   mov      al, byte ptr [si]
9921: e890f6                 call     0x8fb4
9924: c606bd02ee             mov      byte ptr [0x2bd], 0xee
9929: 8a1e80dd               mov      bl, byte ptr [0xdd80]
992d: b418                   mov      ah, 0x18
992f: e81791                 call     0x2a49
9932: e8f37c                 call     0x11628
9935: bb4000                 mov      bx, 0x40
9938: e8f3fe                 call     0x982e
993b: c606bd02ff             mov      byte ptr [0x2bd], 0xff
9940: a07c4b                 mov      al, byte ptr [0x4b7c]
9943: 32e4                   xor      ah, ah
9945: be5956                 mov      si, 0x5659
9948: 03f0                   add      si, ax
994a: 8a04                   mov      al, byte ptr [si]
994c: e865f6                 call     0x8fb4
994f: 800680dd0b             add      byte ptr [0xdd80], 0xb
9954: fe067d4b               inc      byte ptr [0x4b7d]
9958: a07d4b                 mov      al, byte ptr [0x4b7d]
995b: 3a06404b               cmp      al, byte ptr [0x4b40]
995f: 7403                   je       0x9964
9961: e92eff                 jmp      0x9892
9964: c60681df00             mov      byte ptr [0xdf81], 0
9969: e9b97c                 jmp      0x11625
996c: 8ac8                   mov      cl, al
996e: b537                   mov      ch, 0x37
9970: b800a0                 mov      ax, 0xa000
9973: 8ec0                   mov      es, ax
9975: bb2700                 mov      bx, 0x27
9978: bac403                 mov      dx, 0x3c4
997b: b8020f                 mov      ax, 0xf02
997e: ef                     out      dx, ax
997f: bace03                 mov      dx, 0x3ce
9982: b80308                 mov      ax, 0x803
9985: ef                     out      dx, ax
9986: b80500                 mov      ax, 5
9989: ef                     out      dx, ax
998a: b480                   mov      ah, 0x80
998c: d2fc                   sar      ah, cl
998e: 8bd7                   mov      dx, di
9990: 8be9                   mov      bp, cx
9992: 268a05                 mov      al, byte ptr es:[di]
9995: 8ac4                   mov      al, ah
9997: aa                     stosb    byte ptr es:[di], al
9998: 03fb                   add      di, bx
999a: fecd                   dec      ch
999c: 75f4                   jne      0x9992
999e: 8bfa                   mov      di, dx
99a0: 83c70a                 add      di, 0xa
99a3: 8bcd                   mov      cx, bp
99a5: 80e904                 sub      cl, 4
99a8: 7303                   jae      0x99ad
99aa: b105                   mov      cl, 5
99ac: 4f                     dec      di
99ad: b4ff                   mov      ah, 0xff
99af: d2ec                   shr      ah, cl
99b1: 268a05                 mov      al, byte ptr es:[di]
99b4: 8ac4                   mov      al, ah
99b6: aa                     stosb    byte ptr es:[di], al
99b7: 03fb                   add      di, bx
99b9: fecd                   dec      ch
99bb: 75f4                   jne      0x99b1
99bd: 8bfa                   mov      di, dx
99bf: bb1f00                 mov      bx, 0x1f
99c2: 80f905                 cmp      cl, 5
99c5: 7501                   jne      0x99c8
99c7: 43                     inc      bx
99c8: bace03                 mov      dx, 0x3ce
99cb: b80300                 mov      ax, 3
99ce: ef                     out      dx, ax
99cf: 8bd7                   mov      dx, di
99d1: 47                     inc      di
99d2: 8bc5                   mov      ax, bp
99d4: 8aec                   mov      ch, ah
99d6: 33c0                   xor      ax, ax
99d8: ab                     stosw    word ptr es:[di], ax
99d9: ab                     stosw    word ptr es:[di], ax
99da: ab                     stosw    word ptr es:[di], ax
99db: ab                     stosw    word ptr es:[di], ax
99dc: 80f905                 cmp      cl, 5
99df: 7401                   je       0x99e2
99e1: aa                     stosb    byte ptr es:[di], al
99e2: 03fb                   add      di, bx
99e4: fecd                   dec      ch
99e6: 75f0                   jne      0x99d8
99e8: 8a0e81df               mov      cl, byte ptr [0xdf81]
99ec: b537                   mov      ch, 0x37
99ee: 8be9                   mov      bp, cx
99f0: b800a2                 mov      ax, 0xa200
99f3: 8ed8                   mov      ds, ax
99f5: 8bfa                   mov      di, dx
99f7: bace03                 mov      dx, 0x3ce
99fa: b80310                 mov      ax, 0x1003
99fd: ef                     out      dx, ax
99fe: bb1d00                 mov      bx, 0x1d
9a01: b90403                 mov      cx, 0x304
9a04: b80208                 mov      ax, 0x802
9a07: bac403                 mov      dx, 0x3c4
9a0a: ef                     out      dx, ax
9a0b: 50                     push     ax
9a0c: 51                     push     cx
9a0d: 57                     push     di
9a0e: 56                     push     si
9a0f: bace03                 mov      dx, 0x3ce
9a12: 8bc1                   mov      ax, cx
9a14: ef                     out      dx, ax
9a15: 8bcd                   mov      cx, bp
9a17: 32e4                   xor      ah, ah
9a19: ac                     lodsb    al, byte ptr [si]
9a1a: 243f                   and      al, 0x3f
9a1c: 268a15                 mov      dl, byte ptr es:[di]
9a1f: d3c8                   ror      ax, cl
9a21: aa                     stosb    byte ptr es:[di], al
9a22: 80f107                 xor      cl, 7
9a25: fec1                   inc      cl
9a27: d3e8                   shr      ax, cl
9a29: fec9                   dec      cl
9a2b: 80f107                 xor      cl, 7
9a2e: ac                     lodsb    al, byte ptr [si]
9a2f: 268a15                 mov      dl, byte ptr es:[di]
9a32: d3c8                   ror      ax, cl
9a34: aa                     stosb    byte ptr es:[di], al
9a35: 80f107                 xor      cl, 7
9a38: fec1                   inc      cl
9a3a: d3e8                   shr      ax, cl
9a3c: fec9                   dec      cl
9a3e: 80f107                 xor      cl, 7
9a41: ac                     lodsb    al, byte ptr [si]
9a42: 268a15                 mov      dl, byte ptr es:[di]
9a45: d3c8                   ror      ax, cl
9a47: aa                     stosb    byte ptr es:[di], al
9a48: 80f107                 xor      cl, 7
9a4b: fec1                   inc      cl
9a4d: d3e8                   shr      ax, cl
9a4f: fec9                   dec      cl
9a51: 80f107                 xor      cl, 7
9a54: ac                     lodsb    al, byte ptr [si]
9a55: 268a15                 mov      dl, byte ptr es:[di]
9a58: d3c8                   ror      ax, cl
9a5a: aa                     stosb    byte ptr es:[di], al
9a5b: 80f107                 xor      cl, 7
9a5e: fec1                   inc      cl
9a60: d3e8                   shr      ax, cl
9a62: fec9                   dec      cl
9a64: 80f107                 xor      cl, 7
9a67: ac                     lodsb    al, byte ptr [si]
9a68: 268a15                 mov      dl, byte ptr es:[di]
9a6b: d3c8                   ror      ax, cl
9a6d: aa                     stosb    byte ptr es:[di], al
9a6e: 80f107                 xor      cl, 7
9a71: fec1                   inc      cl
9a73: d3e8                   shr      ax, cl
9a75: fec9                   dec      cl
9a77: 80f107                 xor      cl, 7
9a7a: ac                     lodsb    al, byte ptr [si]
9a7b: 268a15                 mov      dl, byte ptr es:[di]
9a7e: d3c8                   ror      ax, cl
9a80: aa                     stosb    byte ptr es:[di], al
9a81: 80f107                 xor      cl, 7
9a84: fec1                   inc      cl
9a86: d3e8                   shr      ax, cl
9a88: fec9                   dec      cl
9a8a: 80f107                 xor      cl, 7
9a8d: ac                     lodsb    al, byte ptr [si]
9a8e: 268a15                 mov      dl, byte ptr es:[di]
9a91: d3c8                   ror      ax, cl
9a93: aa                     stosb    byte ptr es:[di], al
9a94: 80f107                 xor      cl, 7
9a97: fec1                   inc      cl
9a99: d3e8                   shr      ax, cl
9a9b: fec9                   dec      cl
9a9d: 80f107                 xor      cl, 7
9aa0: ac                     lodsb    al, byte ptr [si]
9aa1: 268a15                 mov      dl, byte ptr es:[di]
9aa4: d3c8                   ror      ax, cl
9aa6: aa                     stosb    byte ptr es:[di], al
9aa7: 80f107                 xor      cl, 7
9aaa: fec1                   inc      cl
9aac: d3e8                   shr      ax, cl
9aae: fec9                   dec      cl
9ab0: 80f107                 xor      cl, 7
9ab3: ac                     lodsb    al, byte ptr [si]
9ab4: 268a15                 mov      dl, byte ptr es:[di]
9ab7: d3c8                   ror      ax, cl
9ab9: aa                     stosb    byte ptr es:[di], al
9aba: 80f107                 xor      cl, 7
9abd: fec1                   inc      cl
9abf: d3e8                   shr      ax, cl
9ac1: fec9                   dec      cl
9ac3: 80f107                 xor      cl, 7
9ac6: ac                     lodsb    al, byte ptr [si]
9ac7: 24f0                   and      al, 0xf0
9ac9: 268a15                 mov      dl, byte ptr es:[di]
9acc: d3c8                   ror      ax, cl
9ace: aa                     stosb    byte ptr es:[di], al
9acf: 80f107                 xor      cl, 7
9ad2: fec1                   inc      cl
9ad4: d3e8                   shr      ax, cl
9ad6: fec9                   dec      cl
9ad8: 80f107                 xor      cl, 7
9adb: 268a05                 mov      al, byte ptr es:[di]
9ade: 32c0                   xor      al, al
9ae0: d3c8                   ror      ax, cl
9ae2: aa                     stosb    byte ptr es:[di], al
9ae3: 46                     inc      si
9ae4: 03fb                   add      di, bx
9ae6: 03f3                   add      si, bx
9ae8: fecd                   dec      ch
9aea: 7403                   je       0x9aef
9aec: e928ff                 jmp      0x9a17
9aef: 5e                     pop      si
9af0: 5f                     pop      di
9af1: 59                     pop      cx
9af2: 58                     pop      ax
9af3: fecd                   dec      ch
9af5: d0ec                   shr      ah, 1
9af7: 7203                   jb       0x9afc
9af9: e90bff                 jmp      0x9a07
9afc: b8020f                 mov      ax, 0xf02
9aff: bac403                 mov      dx, 0x3c4
9b02: ef                     out      dx, ax
9b03: bace03                 mov      dx, 0x3ce
9b06: b80300                 mov      ax, 3
9b09: ef                     out      dx, ax
9b0a: b80402                 mov      ax, 0x204
9b0d: ef                     out      dx, ax
9b0e: b8d809                 mov      ax, 0x9d8
9b11: 8ed8                   mov      ds, ax
9b13: c3                     ret      
9b14: 8b3e83df               mov      di, word ptr [0xdf83]
9b18: 81c75807               add      di, 0x758
9b1c: a081df                 mov      al, byte ptr [0xdf81]
9b1f: 98                     cwde     
9b20: 050300                 add      ax, 3
9b23: 8bc8                   mov      cx, ax
9b25: 250700                 and      ax, 7
9b28: a20553                 mov      byte ptr [0x5305], al
9b2b: d1e9                   shr      cx, 1
9b2d: d1e9                   shr      cx, 1
9b2f: d1e9                   shr      cx, 1
9b31: 03f9                   add      di, cx
9b33: 893e83df               mov      word ptr [0xdf83], di
9b37: c60617e280             mov      byte ptr [0xe217], 0x80
9b3c: a082df                 mov      al, byte ptr [0xdf82]
9b3f: 32e4                   xor      ah, ah
9b41: d1e0                   shl      ax, 1
9b43: d1e0                   shl      ax, 1
9b45: d1e0                   shl      ax, 1
9b47: d1e0                   shl      ax, 1
9b49: bed06e                 mov      si, 0x6ed0
9b4c: 03f0                   add      si, ax
9b4e: 33db                   xor      bx, bx
9b50: b90c00                 mov      cx, 0xc
9b53: 03f1                   add      si, cx
9b55: 803c20                 cmp      byte ptr [si], 0x20
9b58: 7504                   jne      0x9b5e
9b5a: 4e                     dec      si
9b5b: 43                     inc      bx
9b5c: e2f7                   loop     0x9b55
9b5e: d1eb                   shr      bx, 1
9b60: 32e4                   xor      ah, ah
9b62: e8e48e                 call     0x2a49
9b65: c606bd02ff             mov      byte ptr [0x2bd], 0xff
9b6a: e8bb7a                 call     0x11628
9b6d: a082df                 mov      al, byte ptr [0xdf82]
9b70: 32e4                   xor      ah, ah
9b72: d1e0                   shl      ax, 1
9b74: d1e0                   shl      ax, 1
9b76: d1e0                   shl      ax, 1
9b78: d1e0                   shl      ax, 1
9b7a: bed06e                 mov      si, 0x6ed0
9b7d: 03f0                   add      si, ax
9b7f: b90c00                 mov      cx, 0xc
9b82: 46                     inc      si
9b83: ac                     lodsb    al, byte ptr [si]
9b84: 56                     push     si
9b85: 51                     push     cx
9b86: e87767                 call     0x10300
9b89: 59                     pop      cx
9b8a: 5e                     pop      si
9b8b: e2f6                   loop     0x9b83
9b8d: c606055300             mov      byte ptr [0x5305], 0
9b92: c60617e200             mov      byte ptr [0xe217], 0
9b97: c3                     ret      
9b98: 32068856               xor      al, byte ptr [0x5688]
9b9c: 7529                   jne      0x9bc7
9b9e: a03248                 mov      al, byte ptr [0x4832]
9ba1: 3c02                   cmp      al, 2
9ba3: 7422                   je       0x9bc7
9ba5: 22c0                   and      al, al
9ba7: 7403                   je       0x9bac
9ba9: e95b01                 jmp      0x9d07
9bac: a08856                 mov      al, byte ptr [0x5688]
9baf: 22c0                   and      al, al
9bb1: 7415                   je       0x9bc8
9bb3: 06                     push     es
9bb4: 8cd8                   mov      ax, ds
9bb6: 8ec0                   mov      es, ax
9bb8: be054d                 mov      si, 0x4d05
9bbb: bf054f                 mov      di, 0x4f05
9bbe: b90001                 mov      cx, 0x100
9bc1: f3a5                   rep movsw word ptr es:[di], word ptr [si]
9bc3: 07                     pop      es
9bc4: e82d01                 call     0x9cf4
9bc7: c3                     ret      
9bc8: e83201                 call     0x9cfd
9bcb: 72fa                   jb       0x9bc7
9bcd: 33db                   xor      bx, bx
9bcf: 8a87134f               mov      al, byte ptr [bx + 0x4f13]
9bd3: 2a87134d               sub      al, byte ptr [bx + 0x4d13]
9bd7: 2f                     das      
9bd8: 8a87124f               mov      al, byte ptr [bx + 0x4f12]
9bdc: 1a87124d               sbb      al, byte ptr [bx + 0x4d12]
9be0: 2f                     das      
9be1: 8a87114f               mov      al, byte ptr [bx + 0x4f11]
9be5: 1a87114d               sbb      al, byte ptr [bx + 0x4d11]
9be9: 2f                     das      
9bea: 7311                   jae      0x9bfd
9bec: b91000                 mov      cx, 0x10
9bef: 8a87054f               mov      al, byte ptr [bx + 0x4f05]
9bf3: 8887054d               mov      byte ptr [bx + 0x4d05], al
9bf7: fec3                   inc      bl
9bf9: e2f4                   loop     0x9bef
9bfb: eb03                   jmp      0x9c00
9bfd: 80c310                 add      bl, 0x10
9c00: 22db                   and      bl, bl
9c02: 75cb                   jne      0x9bcf
9c04: 8a871350               mov      al, byte ptr [bx + 0x5013]
9c08: 2a87134e               sub      al, byte ptr [bx + 0x4e13]
9c0c: 2f                     das      
9c0d: 8a871250               mov      al, byte ptr [bx + 0x5012]
9c11: 1a87124e               sbb      al, byte ptr [bx + 0x4e12]
9c15: 2f                     das      
9c16: 8a871150               mov      al, byte ptr [bx + 0x5011]
9c1a: 1a87114e               sbb      al, byte ptr [bx + 0x4e11]
9c1e: 2f                     das      
9c1f: 7311                   jae      0x9c32
9c21: b91000                 mov      cx, 0x10
9c24: 8a870550               mov      al, byte ptr [bx + 0x5005]
9c28: 8887054e               mov      byte ptr [bx + 0x4e05], al
9c2c: fec3                   inc      bl
9c2e: e2f4                   loop     0x9c24
9c30: eb03                   jmp      0x9c35
9c32: 80c310                 add      bl, 0x10
9c35: 22db                   and      bl, bl
9c37: 75cb                   jne      0x9c04
9c39: eb8c                   jmp      0x9bc7
9c3b: a17ee2                 mov      ax, word ptr [0xe27e]
9c3e: d1e0                   shl      ax, 1
9c40: d1e0                   shl      ax, 1
9c42: 03067ee2               add      ax, word ptr [0xe27e]
9c46: a37ee2                 mov      word ptr [0xe27e], ax
9c49: d1e8                   shr      ax, 1
9c4b: d1e8                   shr      ax, 1
9c4d: c3                     ret      
9c4e: 32c0                   xor      al, al
9c50: eb02                   jmp      0x9c54
9c52: b080                   mov      al, 0x80
9c54: a2cb4a                 mov      byte ptr [0x4acb], al
9c57: bf054f                 mov      di, 0x4f05
9c5a: c7067ee23b68           mov      word ptr [0xe27e], 0x683b
9c60: be0551                 mov      si, 0x5105
9c63: b90001                 mov      cx, 0x100
9c66: e8d2ff                 call     0x9c3b
9c69: 8804                   mov      byte ptr [si], al
9c6b: 46                     inc      si
9c6c: e2f8                   loop     0x9c66
9c6e: bb0f00                 mov      bx, 0xf
9c71: a0cb4a                 mov      al, byte ptr [0x4acb]
9c74: 22c0                   and      al, al
9c76: 7808                   js       0x9c80
9c78: a07ce2                 mov      al, byte ptr [0xe27c]
9c7b: 8801                   mov      byte ptr [bx + di], al
9c7d: eb06                   jmp      0x9c85
9c7f: 90                     nop      
9c80: 8a01                   mov      al, byte ptr [bx + di]
9c82: a27ce2                 mov      byte ptr [0xe27c], al
9c85: 33db                   xor      bx, bx
9c87: a0cb4a                 mov      al, byte ptr [0x4acb]
9c8a: 22c0                   and      al, al
9c8c: 780b                   js       0x9c99
9c8e: 889def00               mov      byte ptr [di + 0xef], bl
9c92: 885d1f                 mov      byte ptr [di + 0x1f], bl
9c95: 889dff00               mov      byte ptr [di + 0xff], bl
9c99: 33f6                   xor      si, si
9c9b: 8a21                   mov      ah, byte ptr [bx + di]
9c9d: 8bd6                   mov      dx, si
9c9f: 8b367ce2               mov      si, word ptr [0xe27c]
9ca3: 8a840551               mov      al, byte ptr [si + 0x5105]
9ca7: fe067ce2               inc      byte ptr [0xe27c]
9cab: 8bf2                   mov      si, dx
9cad: 46                     inc      si
9cae: 81e6ff00               and      si, 0xff
9cb2: 8026cb4aff             and      byte ptr [0x4acb], 0xff
9cb7: 7908                   jns      0x9cc1
9cb9: 8bd6                   mov      dx, si
9cbb: 3ad4                   cmp      dl, ah
9cbd: 7408                   je       0x9cc7
9cbf: 75da                   jne      0x9c9b
9cc1: 3ac4                   cmp      al, ah
9cc3: 75d6                   jne      0x9c9b
9cc5: 8bc6                   mov      ax, si
9cc7: 8801                   mov      byte ptr [bx + di], al
9cc9: a07ce2                 mov      al, byte ptr [0xe27c]
9ccc: 02840551               add      al, byte ptr [si + 0x5105]
9cd0: a27ce2                 mov      byte ptr [0xe27c], al
9cd3: 83fb0e                 cmp      bx, 0xe
9cd6: 7502                   jne      0x9cda
9cd8: fec3                   inc      bl
9cda: fec3                   inc      bl
9cdc: 75bb                   jne      0x9c99
9cde: 8026cb4aff             and      byte ptr [0x4acb], 0xff
9ce3: 790e                   jns      0x9cf3
9ce5: 8a85ef00               mov      al, byte ptr [di + 0xef]
9ce9: 0a85ff00               or       al, byte ptr [di + 0xff]
9ced: 0a451f                 or       al, byte ptr [di + 0x1f]
9cf0: 7401                   je       0x9cf3
9cf2: f9                     stc      
9cf3: c3                     ret      
9cf4: e857ff                 call     0x9c4e
9cf7: 81c70001               add      di, 0x100
9cfb: eb88                   jmp      0x9c85
9cfd: e852ff                 call     0x9c52
9d00: 81c70001               add      di, 0x100
9d04: e97eff                 jmp      0x9c85
9d07: a08856                 mov      al, byte ptr [0x5688]
9d0a: 22c0                   and      al, al
9d0c: 7432                   je       0x9d40
9d0e: bb7f00                 mov      bx, 0x7f
9d11: 8a87106f               mov      al, byte ptr [bx + 0x6f10]
9d15: 8887254f               mov      byte ptr [bx + 0x4f25], al
9d19: 80fb3c                 cmp      bl, 0x3c
9d1c: 7308                   jae      0x9d26
9d1e: 8a873556               mov      al, byte ptr [bx + 0x5635]
9d22: 8887a54f               mov      byte ptr [bx + 0x4fa5], al
9d26: 80fb0c                 cmp      bl, 0xc
9d29: 7308                   jae      0x9d33
9d2b: 8a87f94c               mov      al, byte ptr [bx + 0x4cf9]
9d2f: 8887e54f               mov      byte ptr [bx + 0x4fe5], al
9d33: fecb                   dec      bl
9d35: 79da                   jns      0x9d11
9d37: a0aadd                 mov      al, byte ptr [0xddaa]
9d3a: a2e14f                 mov      byte ptr [0x4fe1], al
9d3d: e90eff                 jmp      0x9c4e
9d40: e80fff                 call     0x9c52
9d43: 722f                   jb       0x9d74
9d45: bb7f00                 mov      bx, 0x7f
9d48: 8a87254f               mov      al, byte ptr [bx + 0x4f25]
9d4c: 8887106f               mov      byte ptr [bx + 0x6f10], al
9d50: 80fb3c                 cmp      bl, 0x3c
9d53: 7308                   jae      0x9d5d
9d55: 8a87a54f               mov      al, byte ptr [bx + 0x4fa5]
9d59: 88873556               mov      byte ptr [bx + 0x5635], al
9d5d: 80fb0c                 cmp      bl, 0xc
9d60: 7308                   jae      0x9d6a
9d62: 8a87e54f               mov      al, byte ptr [bx + 0x4fe5]
9d66: 8887f94c               mov      byte ptr [bx + 0x4cf9], al
9d6a: fecb                   dec      bl
9d6c: 79da                   jns      0x9d48
9d6e: a0e14f                 mov      al, byte ptr [0x4fe1]
9d71: a2aadd                 mov      byte ptr [0xddaa], al
9d74: c3                     ret      
9d75: 0000                   add      byte ptr [bx + si], al
9d77: 0000                   add      byte ptr [bx + si], al
9d79: 0000                   add      byte ptr [bx + si], al
9d7b: 0000                   add      byte ptr [bx + si], al
9d7d: 0000                   add      byte ptr [bx + si], al
9d7f: 00                     .byte    0x00
