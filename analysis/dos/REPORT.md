# Inspection of the supplied DOS version

## Findings

**Runnable extraction:** the original DOS player movement core is now packaged in [`physics/`](physics/) and [`dos-physics.zip`](dos-physics.zip), with a headless API and all-track extraction comparisons. See [the extraction documentation](PHYSICS.md) for the current execution boundaries. The initial isolated inspection below remains useful evidence; complete DOS boot/race parity remains unverified.

The supplied `original/Stunt.img` contains the DOS EGA version. Its loader and selected x86 game routines have been executed with Unicorn. All game bytes used here come from that image; no outside game executable, source code or assets are inputs.

- The entire **3,840-byte geometry, track and league parameter block** is identical to the supplied Amiga version. This includes all eight packed tracks, their per-track crane exclusions, the template recovery flags, and the standard/super league values.
- The original DOS track decoder and recovery selector were executed for **all 445 track sections**. Every selected recovery section agrees with the Amiga-derived track rules.
- DOS has a **startup CPU-speed calibration** whose output changes movement integration, suspension damping and several counters. It is not safe to assume the Amiga's fixed `0.12 s` interval describes DOS execution.
- DOS preserves related handling rules, including steering additions of 45 into a bend and subtraction of 35 against it, and the quarter/quarter/half wheel-support weighting. Its integration helper also has instruction-specific rounding that differs from a simple real-number multiplication.

This investigation adds analysis tools and artifacts. The browser's selected runtime remains the Amiga 68000 physics with interpolated rendering. No full DOS race, real hardware cadence, or complete DOS/Amiga physics equivalence has been established.

## Image and files

Image size: 3,145,728 bytes. SHA-256:

```text
0b2a521c3459d42e11bb2398d2062ea203f5e41856bea2e7c6e917c88f48ac95
```

The image has an MBR partition at sector 8, containing FAT16 with 512-byte sectors and clusters. Both FAT copies agree. The root directory contains:

| File | Bytes | Interpretation |
| --- | ---: | --- |
| `CAR.EXE` | 1,008 | DOS MZ loader; module entry at file offset `0x200` |
| `CAR.EGA` | 264,742 | Encoded MZ executable containing the game and assets |
| `BREAKIT!.ICE` | 1,332 | Distribution text |
| `FASTEST.FIN` | 80 | Distribution text |
| `FILE_ID.DIZ` | 18 | Game description |

There are no DOS system files in this filesystem. It can be supplied as a game disk to a DOS environment; the game files alone are not a complete DOS boot environment. Directory timestamps span 1989–1997, so these bytes do not establish that the package is a pristine release disk.

The decoded executable is saved as `CAR-decoded.exe`. It has a 512-byte header, 45 relocations, and entry point `0000:0000`. Its SHA-256 is:

```text
e26ba7f00fe4f37cb256087518f31dd7fa6ca3250b511c37c3eae3b9eb27015e
```

The original loader seeds a 16-bit state with the ASCII sum of `CAR.EGA`. For each encoded byte it XORs with the state's high byte, then computes `state = (5*state + 1) & 65535`. The native loader reads in 32 KiB blocks, applies MZ relocations and transfers control to the game's entry point.

`probe-dos.py` executes those actual loader instructions with a small DOS file-service adapter. All 264,742 bytes match the independently decoded image after accounting for relocations and the loader's four-byte far-return stack write inside the loaded image. No loader/game instructions are patched. The probe stops before the game's hardware startup.

## Address map

Code addresses below are **module-relative CS offsets**, not executable file offsets. For this executable, add `0x200` to locate code in the decoded file. The initial data segment is module-relative `0x09D8`, so `DS:offset` resides at decoded file offset `0x9F80 + offset`.

| DOS address | Observed role |
| --- | --- |
| `CS:005A–0065` | Programs PIT channel 0, mode 3, with a zero divisor word |
| `CS:0126–0247` | Startup measurement and derivation of calibration values |
| `CS:0248` | Temporary calibration interrupt handler |
| `CS:065A` | Runtime timer interrupt: sound/input service and ready flag |
| `CS:25DE–27C4` | Track decoding through complete trailer and crane exclusion load |
| `CS:3980–39B0` | Crane section selection; rejected sections call `CS:776D` to move backwards |
| `CS:39B0–3A95` | Subsequent crane placement/setup; not included in the selector probe |
| `CS:3C65` | Calibrated signed integration helper |
| `CS:42DF` | Player input/control handling |
| `CS:43ED` | Presentation work followed by waiting for the timer-ready latch |
| `CS:5656` | Steering logic; adjustments appear at `CS:56F4` and `CS:5706` |
| `CS:5DDC` | Calibrated suspension height-change helper |
| `CS:81E0` | Player physics dispatcher |
| `CS:8458` | Three-wheel suspension calculation; weighting at `CS:8577–8595` |
| `DS:B100` | Shared geometry database, decoded file `0x15080` |
| `DS:B220` | Eight packed-track pointers |
| `DS:B240` | Recovery template flags |
| `DS:BFEA` | Two eleven-byte league parameter records |

`game-x86.asm` is a provisional linear disassembly and includes embedded data. A printed relative branch target above `0xFFFF` wraps to a 16-bit offset. Selected boundaries were verified by executing them; the entire listing has not been classified into code and data.

## Recovery comparison

The DOS decoder reads its own original packed data. The probe then calls the original selector separately for every section and stops before placement/lift begins. It does not substitute a JavaScript/Python recovery algorithm for DOS execution; the existing decoded track rules are the comparison oracle.

| Track | Sections checked | Example original section → recovery section |
| --- | ---: | --- |
| Little Ramp | 44 | 34 → 33 |
| Stepping Stones | 56 | All sections checked |
| Hump Back | 53 | All sections checked |
| Big Ramp | 44 | All sections checked |
| Ski Jump | 40 | All sections checked |
| Draw Bridge | 78 | 54 → 50 |
| High Jump | 52 | 45 → 29 |
| Roller Coaster | 78 | All sections checked |

The DOS version therefore selects the same section for the reported Little Ramp recovery. This does **not** establish an identical lift, drop, available run-up, or successful jump: those require complete DOS gameplay initialization and coupled physics traces.

## Timing and arithmetic

The calibration value at `DS:0020` is bounded between `0x646F` and `0xFFFF`. Startup derives `DS:0025` as half that word. `CS:3C65` reads it when advancing velocity, position and angles. The reciprocal-related word at `DS:0027` feeds `CS:5DDC`, so suspension's height-change response adjusts with calibration too. Other derived values affect timers/counters.

The runtime interrupt sets `DS:08CC`, and `CS:43ED` waits for and clears it. The race loop calls physics at `CS:4024` and this wait at `CS:4091`. This is a timer-ready latch, not a 120 Hz simulation accumulator; missed interrupts are not queued as separate physics updates. The calibration probe seeds measurement counts and executes the subsequent arithmetic. It does not measure a real DOS machine or emulate PIT/EGA timing.

| Seeded calibration loop count | Result `DS:0020` | Integration word `DS:0025` | Suspension word `DS:0027` |
| ---: | ---: | ---: | ---: |
| 64 | 65,535 | 32,767 | 64 |
| 256 | 65,535 | 32,767 | 64 |
| 1,024 | 65,535 | 32,767 | 64 |
| 4,096 | 34,316 | 17,158 | 122 |
| 8,192 | 25,711 | 12,855 | 163 |

The probe also exercises four explicit calibration values: `0x646F`, `0x8000`, `0xEE00`, and `0xFFFF`, covering 36 integration and 48 suspension cases. These four settings are probe inputs, not a claim that a particular historical PC selected them.

At `0xEE00`, the nominal movement scale is `238/256`, as in the Amiga routine, and the suspension word is 69, giving a height-change multiplier of `276/256`. At the minimum DOS calibration it is 163, giving `652/256`. This is evidence of related formulas with a variable integration scale.

Exact rounding matters: `CS:3C6D` performs `AND AX,AX`, clearing carry between a shift and `RCL AX`. With coefficient `0x646F` and input −317, the original helper returns −125; simply multiplying by `12855/32768` and truncating returns −124. The probe verifies the instruction result. Shared formulas do not justify calling the two CPU implementations byte-equivalent.

For a future DOS browser runtime, execution should retain DOS initialization, selected calibration, integer state and update order, with rendering interpolated separately. Merely calling the DOS physics 120 times per second would change its relationship to time.

## Reproduce

```sh
python3 tools/inspect-dos.py
PYTHONPATH=/tmp/scr-m68k python3 -u tools/probe-dos.py
```

Extraction uses Python's standard library. Capstone is optional for the disassemblies. The execution probe uses the existing optional Unicorn installation; it requires JIT execution permission on this machine.

- `manifest.json`: image/executable/file hashes and exact shared-data matches.
- `routine-traces.json`: native loader check, calibration results, arithmetic cases and all recovery choices.
- `files/`: unchanged extracted filesystem entries.
- `CAR-decoded.exe`: decoded original executable, before relocation.
- `loader-x86.asm`, `game-x86.asm`: disassembly from those bytes.

The subsequent extraction reproduces startup-generated roll tables, native crane movement and coupled player physics. Remaining full-game parity work includes rival AI, the complete damage/wreck pipeline, EGA/PIT/input hardware, race bookkeeping and full DOS race recordings. See [the runnable extraction](PHYSICS.md).
