; Module-relative 16-bit x86 offsets. Linear listing: includes embedded data.
; Relative branch targets printed above 0xffff wrap to 16 bits.

; Range 0000–0001
0000: eb36                   jmp      0x38

; Range 0038–00ee
0038: 0e                     push     cs
0039: 1f                     pop      ds
003a: ba0300                 mov      dx, 3
003d: b409                   mov      ah, 9
003f: cd21                   int      0x21
0041: be3000                 mov      si, 0x30
0044: eb01                   jmp      0x47
0046: 90                     nop      
0047: 0e                     push     cs
0048: 1f                     pop      ds
0049: 33ff                   xor      di, di
004b: 32e4                   xor      ah, ah
004d: 56                     push     si
004e: ac                     lodsb    al, byte ptr [si]
004f: 0ac0                   or       al, al
0051: 7404                   je       0x57
0053: 03f8                   add      di, ax
0055: ebf7                   jmp      0x4e
0057: 5e                     pop      si
0058: b43d                   mov      ah, 0x3d
005a: b000                   mov      al, 0
005c: 8bd6                   mov      dx, si
005e: cd21                   int      0x21
0060: 7304                   jae      0x66
0062: b44c                   mov      ah, 0x4c
0064: cd21                   int      0x21
0066: 8bd8                   mov      bx, ax
0068: 8cce                   mov      si, cs
006a: 83c664                 add      si, 0x64
006d: 8bee                   mov      bp, si
006f: 8ede                   mov      ds, si
0071: b43f                   mov      ah, 0x3f
0073: b90080                 mov      cx, 0x8000
0076: ba0000                 mov      dx, 0
0079: cd21                   int      0x21
007b: 72e5                   jb       0x62
007d: 0bc0                   or       ax, ax
007f: 741d                   je       0x9e
0081: 33f6                   xor      si, si
0083: b90080                 mov      cx, 0x8000
0086: 8bc7                   mov      ax, di
0088: 3024                   xor      byte ptr [si], ah
008a: 46                     inc      si
008b: d1e0                   shl      ax, 1
008d: d1e0                   shl      ax, 1
008f: 03f8                   add      di, ax
0091: 47                     inc      di
0092: e2f2                   loop     0x86
0094: 8cde                   mov      si, ds
0096: 81c60008               add      si, 0x800
009a: 8ede                   mov      ds, si
009c: ebd3                   jmp      0x71
009e: b43e                   mov      ah, 0x3e
00a0: cd21                   int      0x21
00a2: 72be                   jb       0x62
00a4: 8edd                   mov      ds, bp
00a6: 813e00004d5a           cmp      word ptr [0], 0x5a4d
00ac: 75b4                   jne      0x62
00ae: 032e0800               add      bp, word ptr [8]
00b2: 8b0e0600               mov      cx, word ptr [6]
00b6: 8b361800               mov      si, word ptr [0x18]
00ba: e30d                   jcxz     0xc9
00bc: ad                     lodsw    ax, word ptr [si]
00bd: 8bf8                   mov      di, ax
00bf: ad                     lodsw    ax, word ptr [si]
00c0: 03c5                   add      ax, bp
00c2: 8ec0                   mov      es, ax
00c4: 26012d                 add      word ptr es:[di], bp
00c7: e2f3                   loop     0xbc
00c9: a10e00                 mov      ax, word ptr [0xe]
00cc: 03c5                   add      ax, bp
00ce: 8ed0                   mov      ss, ax
00d0: 8b261000               mov      sp, word ptr [0x10]
00d4: a11600                 mov      ax, word ptr [0x16]
00d7: 03c5                   add      ax, bp
00d9: 50                     push     ax
00da: ff361400               push     word ptr [0x14]
00de: 8bd5                   mov      dx, bp
00e0: 83ea0a                 sub      dx, 0xa
00e3: 8eda                   mov      ds, dx
00e5: 8ec2                   mov      es, dx
00e7: b41a                   mov      ah, 0x1a
00e9: cd21                   int      0x21
00eb: 90                     nop      
00ec: 90                     nop      
00ed: 90                     nop      
00ee: cb                     retf     
