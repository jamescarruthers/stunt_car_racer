; Exact entry-point decoding of selected original DOS physics routines.
; Addresses are CS-relative. Calls/branches can leave each displayed range.
; Runtime stop boundaries are recorded separately in manifest.json.

deriveCalibration: ; CS:01aa
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

decodeTrack: ; CS:25de
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

initializeTrackMap: ; CS:5f85
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

initializeRace: ; CS:41c1
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

recover: ; CS:3980
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

controls: ; CS:42df
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

physics: ; CS:81e0
81e0: e865d8                 call     0x5a48
81e3: e83800                 call     0x821e
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

locate: ; CS:65a0
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

bridge: ; CS:13bf
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

timerDivider: ; CS:1c10
1c10: 32ed                   xor      ch, ch
1c12: a12500                 mov      ax, word ptr [0x25]
1c15: d1e0                   shl      ax, 1
1c17: 0106734b               add      word ptr [0x4b73], ax
1c1b: 7202                   jb       0x1c1f
1c1d: fecd                   dec      ch
1c1f: 882e494b               mov      byte ptr [0x4b49], ch

rollTables: ; CS:4811
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

steering: ; CS:5656
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

suspension: ; CS:8458
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

integrate: ; CS:3c65
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

suspensionChange: ; CS:5ddc
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
