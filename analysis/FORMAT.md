# Disk decoding and implementation notes

The decoder is `tools/extract_original.py`. Nothing under an external reference directory is a build input.

## Browser execution of the original physics

The current game executes the supplied 68000 payload with **musashi-wasm 0.1.31**, using its universal browser WASM artifact and 68000 CPU mode. `src/original-machine.js` maps 16 MiB, loads the unchanged payload at `$E700`, and calls the native routines. `src/original-car.js` exposes snapshots and provides browser race bookkeeping. No JavaScript engine, spring, steering, gravity, collision-force or angular-response solver runs in gameplay.

| Boundary | Executed original addresses / handling |
| --- | --- |
| Track setup | `$5AE46`, `$64304`; original eleven-byte standard/super league values and league-offset flag |
| Runtime boot guard | Value at `$5C962` installed at `$64AEC`, matching original `$5CEFA` |
| Player controls / movement | `$5D8A2`, `$6185C`; unchanged instructions and integer arithmetic |
| Road lookup | `$64E4C` through `$64F4A` or `$64F80`, stopping before original rendering/AI; includes adjacent-square lookup, road-centre flags and saved recovery section |
| Crane | `$605B6`, with native swing/lift/release called from physics; manual release uses fire; first drop auto-supplies fire for the browser start flow |
| Bridge | `$5A794`; Three.js reads the mutated original height tables, including original occupied-section freeze logic |
| Boost / timer divider | `$5DB34` through `$5DB58`, preserving carry and byte counters; native BCD reserve and league consumption rate |
| Damage | `$1BACE` decompresses cockpit bitplanes into scratch memory, `$5DFB4` runs original crack/damage/wreck logic; visible HUD remains a browser drawing |
| Rival contact | Adapted rival road coordinates supplied to `$6076C` / `$636C0`; native `$63CE4` / `$63E2E` calculate and apply impulses. Rival driving policy remains adapted. |
| Hardware boundaries | Only `$60BAE` (input poll), `$F362` (audio) and `$594C6` (bitmap text) receive RTS replacements. Browser code supplies inputs and plays extracted samples. |

Each call has a bounded instruction-cycle budget and checked return/stop address. The payload asset is verified against its extracted SHA-256 before loading. Original far-view bridge writes and damage bitplanes use separate scratch buffers; this is not a hardware emulator. Normal race initialization and the complete original race loop are not being executed. Automatic recovery uses the original off-road/ground-contact state and grace counter; browser laps, records, season flow and opponent policy remain adaptations. Initial permanent damage holes are not carried across browser races.

### Rendering and coordinates

`SimulationClock` advances exactly **0.12 seconds** per physics update. `requestAnimationFrame` displays interpolated positions and shortest-path angles at the monitor's refresh rate (including 120 Hz). GPU bridge vertices interpolate too; native collision tables always retain their current tick values. Recovery teleports collapse the two presentation snapshots. Pausing preserves the clock remainder and freezes the rendered pose. The renderer never writes interpolated poses or vertices into the emulated CPU.

Original X/Z are divided by 131072, Y by 262144. Angles use `2π / 65536`; original roll is negated when converting to the Three.js car frame. A bank regression checks that the resulting camera up vector follows the actual road normal. The CPU's roll is unmodified. Camera placement, perspective and graphics remain browser presentation choices. Interpolation keeps an earlier and current state, with the usual one-tick presentation delay; it does not increase input sampling to 120 Hz.

### Independent verification

`tools/probe-original.py --runtime-only` runs the disk with **Unicorn's M68000 emulator**, independently of Musashi. `analysis/original-runtime-traces.json` records 350 updates for each of eight tracks in both leagues (5,600 updates), including acceleration, each steering direction, boost/reverse, recovery from prohibited sections, release and subsequent run-up. The test compares exact bytes for linear/angular state, suspension history, contact/off-road flags, boost, crane and damage state, plus mutable bridge profiles. All recorded states agree byte for byte with the browser WASM artifact. Pose conversions additionally agree within floating-point conversion rounding.

The original isolated traces remain checked: all acceleration/braking/corner/free-fall/run-up samples, 1,134 steering probes, 35 suspension probes and 45 traction probes. Display cadence tests at 30, 60, 120 and 144 Hz produce identical native end states. Integration tests verify native recovery, rival impact, correct bank sign, render-only interpolation and bridge geometry. These checks establish parity for the exercised routines and inputs; they do not assert complete game or hardware equivalence.

Reproduce the runtime fixture (requires the optional development-only Unicorn installation):

```sh
PYTHONPATH=/tmp/scr-m68k python3 -u tools/probe-original.py --runtime-only --output analysis/original-runtime-traces.json
npm test
npm run build
node tools/browser-check.mjs --production
```

The continuous solver and its earlier audit below are retained as historical comparison material in `tools/reference-physics.js`. They are not the current game physics.

## Payload map

All offsets below are relative to the 408,540-byte payload at ADF offset `0xDC00`. Machine addresses equal payload offset + `0xE700`.

| Payload offset | Content |
| --- | --- |
| `0x00000` | 68000 startup; begins `20 7C 00 00 E7 30` |
| `0x0CFCA` | Eight 16-byte Paula sample parameter records |
| `0x105AA` | Eleven driver names, 16-byte stride |
| `0x106AA` | Eight 16-byte track names |
| `0x10882` | Embedded geometry database and little-endian pointer tables |
| `0x109A2` | Eight packed track pointers |
| `0x11782` | 7×8 primary font; first punctuation slots also contain special glyphs |
| `0x11A84 / 0x11AA4` | Cockpit palette / compressed image |
| `0x15532 / 0x15552` | Menu palette / word-interleaved image |
| `0x18BC2` | 6×8 font stored in the menu image's first bitplane |
| `0x1D274 / 0x1D294` | Track preview palette / compressed image |
| `0x224D0 / 0x224F0` | Standings palette / compressed image |
| `0x27376 / 0x27396` | Driver portraits palette / word-interleaved image |
| `0x2F0B6, 0x3607C, 0x3C83E, 0x4274C` | Wreck, won, lost, promotion blocks |
| `0x5315C` | Original physics dispatcher, machine address `0x6185C` |
| `0x561C2` | Division track pairs, low division first |
| `0x5B09E` | Mountain silhouette templates |
| `0x5B2B8` | Mountain template/parameter pointer pairs |
| `0x5B388` | Horizon placement count and angle/shape pairs |

The linear disassembly includes embedded data and protection code. The selected routines used by the CPU probe below execute from this disk without physics instruction patches; for example, `0x6190C` contains a valid rear-wheel negation (`44 79 00 01 BD 06`). This does not constitute a complete Amiga boot; the execution boundaries are documented above.

## Track bytecode

Pointers are little-endian words despite the host 68000 being big-endian. A pointer resolves to `geometryDatabase + word - 0xB100`. The first 16 pointers select section templates; the following 128 select height profiles. Track pointers start 288 bytes into the database.

A packed track begins with section count, spawn section, finish section, halfway section, and a little-endian starting elevation. Each section describes a quadrant rotation, direction reversal, template, grid square and height profile IDs. Template nibble 15 encodes repetitions along the current cardinal direction. Bit 5 shares the left/right height profile; templates 12 and 13 encode common bank transitions. Height shifts accumulate from one section to the next to keep joins continuous.

An ordinary height byte decodes as `((v & 15) << 8) | ((v << 1) & 224)`. Wide profiles use big-endian words masked by `0x7FFF`. Horizontal template coordinates are little-endian 16-bit values. Reversed sections reverse the vertex order and swap left/right edges. A six-byte trailer contains two AI parameters, standard/super boost amounts, an AI override count and a crane exclusion count. Each AI override takes two bytes; the following crane exclusion list takes one byte per section. The renderer does not substitute spline tracks for these original polygons.

## Crane recovery: verified against this disk

The supplied executable's routine at machine address `0x605B6` selects the restart section. At `0x605C2–0x605DC` it reads the geometry template nibble and tests bit 7 of the table at `0x1F0C2` (payload offset `0x109C2`). At `0x605E0–0x605FE` it also rejects sections listed in the current track's exclusion table. Both failures branch to `0x605B0`, which calls `0x5C538`: decrement the section index and wrap zero to the final section. The search therefore goes **backwards**, stopping at the first section that passes both checks.

The exclusion list is loaded at `0x5B18E–0x5B1B4`, after the six-byte trailer and two-byte AI overrides. The original race recovery path at `0x5D602` passes its saved road section to this restart routine. These addresses are present in `analysis/original-68000.asm`, generated from the supplied ADF; external annotations were used to find the routines, not as asset or code inputs.

Examples (zero-based original section indices):

| Track | Forbidden section(s) | Restart section |
| --- | --- | --- |
| Little Ramp | 34, the low stretch between ramps | 33, the preceding raised ramp |
| Draw Bridge | 51–54 | 50 |
| High Jump | 30–45 (per-track list plus disallowed templates 35–36) | 29 |

The original first positions the car at the selected map square's centre (`0x60654–0x6067A`), chooses its direction, and then performs a sideways crane swing and lift. The current browser runs this routine and the original lift/swing/drop physics directly. The earlier continuous solver placed the car at a section midpoint and used an adapted lowering animation; that code is no longer used for gameplay. In particular, original recovery selection does not guarantee a successful jump from rest without backing up for a run-up.

## Historical continuous-solver audit: Little Ramp

`tools/probe-original.py` uses Unicorn's M68000 CPU to run this disk's track decoder (`0x5AE46`), map lookup initializer (`0x64304`), recovery (`0x605B6`), controls (`0x5D8A2`) and physics dispatcher (`0x6185C`). It replaces only input polling, sound output and text output with `RTS`. Track lookup is updated between physics calls. This is an isolated routine harness: it seeds the previous wheel heights, supplies inputs directly, keeps boost available and omits opponents, Amiga hardware and the full race loop. It does not run downloaded game code. It also initializes the boot-time steering guard at `0x64AEC` using the original immediate at `0x5C962`, as installed by the original instruction at `0x5CEFA`. Without that runtime data, the intact steering routine deliberately disables itself. Earlier straight-line traces did not reveal this missing initialization; the expanded steering audit does.

The reproducible output is `analysis/original-physics-traces.json`. On Little Ramp, recovery from section 34 selects section 33. Pressing fire to release the chains, then accelerating with boost at first wheel contact, fails to clear the jump. Reversing for about five seconds (42 original updates, 5.04 seconds), then accelerating with boost, reaches section 36. A six-second reverse run-up also clears it. Thus the original recovery location itself requires a run-up in this scenario.

The browser's previous gravity was 18 world units/s² and reverse force was 5 units/s². The following conversion gives approximately **9.29054** and **7.03384**, respectively. The browser now uses these values, original engine/boost ratios, the forward speed loss/cut and normal quadratic drag:

| Evidence in this disk | Browser conversion |
| --- | --- |
| Six PAL video frames per update, set at `0x5DADC` | `rate = 50 / 6` updates/s |
| Both velocity (`0x61ADC`) and position (`0x61950`) multiply by `238/256` | `h = rate * 238 / 256` |
| World X/Z fixed point divided by 131072; Y divided by 262144 | One raw speed unit moves `238/256/2048` world units per update on all three axes |
| Gravity magnitude 317 at `0x61338–0x61340` | `317 * h² / 2048` |
| Standard/super engine 240/320 in league values at `0x1FE6C`; braking sets −240 at `0x5D95A` | `240/320 * h² / 2048`; brake/reverse magnitude uses 240 in either league |
| Boost doubles engine force at `0x60908`, including braking/reversing | Multiply requested force by two while boost is available |
| Forward loss at `0x620CA`; speed high byte cut at `0x5D90A` | Continuous approximation `h * speed / 256`; cut at `30720 * h / 2048` |
| Normal drag multiply/shift at `0x62246–0x622D4` | Straight-line drag approximately `speed * abs(speed) / 1024` |

The recorded free fall reaches vertical speed −16.7583 after 1.8 seconds. The browser's vertical velocity stays within 0.05 world units/s of that recording. Normal, boosted, reverse and boosted-reverse acceleration stay within 1.25 world units/s of the original flat-road traces over 3.6 seconds. Position comparison accounts for the different Euler integration intervals. These tolerances measure selected motions, not complete physics parity.

## Historical continuous-solver audit: broader handling

The reduced gravity exposed an inconsistent suspension: spring strength was still 95 and damping 13. The original height-difference routine at `0x6180E` calculates `depth + (depth - previousDepth) * 276/256`. In browser units this gives spring strength `1024 * h² / 2048 ≈ 30.0111` and damping `spring * 276/256 / (50/6) ≈ 3.8827`. Forces cap at `0x11FF` original units. These now replace the unrelated previous values. Browser ride height retains a gravity preload; the chassis origin consequently differs from the original.

The original averages the front two forces, then averages that result with the rear force (`0x61F54–0x61F70`). The three support weights are therefore **¼, ¼, ½**, not equal thirds. `0x61FC0–0x61FCC` sets contact when the combined force is nonzero. Steering's check at `0x61206` therefore accepts a single supporting wheel. Both rules now apply in the browser, including steering while the centre has crossed the edge but a wheel remains supported.

The original steering routine at `0x61012` uses each template's steering byte, read at `0x5FF88`. Straight templates use 32, tight curves 62, and wider curves 50. `tools/extract_original.py` now preserves the steering byte and geometry type in every section. With no steering input the original already turns into a bend. Steering into it adds 45 (`0x610FA`); steering away subtracts 35 (`0x61116`). Heading error supplies a bounded correction, and the curve angle receives ±217 original angle units (`0x6125A`). At the last segment it consults the next section. The browser now implements those rules, using interpolated polygon tangents rather than the original integer road-angle calculation.

Further reviewed interactions:

| Area | Original evidence | Browser change / remaining difference |
| --- | --- | --- |
| Tyre grip | `0x6217A–0x621F2`: small lateral slip cancels directly; larger corrections cap at twice supporting force | Uses the original bounded lateral correction and limits engine/brake force by the same load. World/body coordinate conversion and contact normal handling remain browser approximations. |
| Airborne yaw | `0x61210` disables angular acceleration, not existing angular speed; `0x619D2` continues integrating rotation | Retains yaw momentum without accepting airborne steering input. The flight path keeps its world direction as the body rotates. |
| Airborne pitch | `0x61FE0–0x62042`: torque −128/−256 above horizontal, special cases for Ski Jump and Roller Coaster; `0x62138` damps angular speed | Evaluates torque at the original 0.12-second cadence while rendering/integrating at 120 Hz. |
| Drag | `0x622A4–0x622D4` acts on world X, Y and Z velocities | Airborne drag now applies to all velocity components; it no longer steers the trajectory through a changing body basis. |
| Grounded roll | `0x61F7C` and `0x62162` derive torque from contact-force differences | Removed the invented steering-dependent outward lean. Ground orientation still uses the browser's road-plane response. |
| Braking | `0x5D95A` uses −240; `0x60908` doubles it with boost | Recorded normal/boosted stops and reversals now have reference comparisons. |
| Impacts / recovery | Original height-difference forces, damage counters and chain phases | Spring force cap is sourced; swept landing, damage accumulation and crane animation remain browser adaptations. |

Verification now includes:

- **1,134 original steering samples** across all eight tracks, forward/reverse motion and both steering directions: error below 0.008 radians/s.
- **35 original spring/damper samples**: force error below 0.03 world units/s², allowing integer rounding.
- **45 original lateral-grip samples**, including zero support: converted responses agree within floating-point rounding.
- Original normal and boosted braking traces: speed error below 1.25 world units/s over 3.6 seconds.
- Original free-fall pitch trace: angle error below 0.01 radians.
- **76 complete browser corner runs**: all 38 contiguous bend groups, including approach and exit, at entry speeds of 50 and 70 world units/s. The test driver only presses left/right; it does not modify position, speed, contacts or steering forces during the run. These are browser regression scenarios, not original race replays.
- Existing banking, all-track recovery, Little Ramp jump/landing and five-second reverse run-up regressions; explicit checks for one-wheel steering, airborne momentum, and being able to drive off the edge.

The audit measures components and selected complete manoeuvres. Full coupled original physics is still unverified: exact fixed-point overflow, ground angular response, body/road coordinate transforms, sharp vertical-face collisions, damage, opponents and full-race hardware timing remain differences. Passing the corner scenarios does not establish that every possible speed or input sequence matches the original.

To regenerate the traces (Unicorn is a development-only dependency):

```sh
python3 -m pip install --target /tmp/scr-m68k unicorn==2.1.4
PYTHONPATH=/tmp/scr-m68k python3 -u tools/probe-original.py --output analysis/original-physics-traces.json
npm test
```

## Graphics and audio

Images are 320×200, four bitplanes. Uncompressed screens interleave four 16-bit words per group of 16 pixels. Compressed images use ByteRun-style packets independently for each 40-byte bitplane row: 0…127 copy `n+1` bytes, 129…255 repeat the following byte `257-n` times, and 128 is a no-op. The palette's three-bit channel values are expanded with the game's shift-and-set-low-bit operation to `[0,51,85,119,153,187,221,255]`.

### Cockpit wheels, ground dust and driver portraits

The uncompressed graphics-object atlas at payload offset `0x5BEB6` uses the cockpit palette at `0x11A84`, with colour index 1 transparent. `cockpit-sprites.png` retains its original pixels. The 52 sixteen-byte records at `0x5BA6C` specify source rectangles and destination positions: objects 0–5 are three tyre frames per side; objects 29–36 are eight dust clouds. `cockpit-effects.json` also preserves the eight dust X offsets and sixteen-entry frame sequence at `0x5289C`.

The native Amiga wheel drawing routine at machine address `0x5E778` converts suspension values through the sine lookup at payload offset `0xE342`. Its screen-height conversion is `135 - (lookup[255 - (clamp(suspension + 256, 0, 2047) >> 3)] >> 11)`, with left/right X positions 32/256 and the image cropped at screen Y 159. The browser comparison executes this original drawing routine across compressed and extended suspension values. Amiga suspension is read from machine addresses `0x1BD14/0x1BD16`; DOS uses the split low/high byte arrays at data-segment offsets `0x4B39/0x4B3C`.

Native off-road flags (Amiga `0x1BB9C`, DOS `0x4B27`, bit 7) plus wheel contact trigger dust. The browser follows the original sixteen-particle layout, outward/upward launch and integer gravity, using the extracted shapes and frame sequence. Its separate random sequence, speed conversion and wheel rotation timing are presentation adaptations, not execution of the original graphics loop. These effects never write native physics state.

Portrait source positions and driver mapping come from payload offsets `0x4A3A4` and `0x4A420`. The driver screen rearranges the original twelve 80×55 tiles to show the current browser league roster beneath the original division headers, marking the player's helmet portrait **YOU**. It appears before entering a season and through the main menu's **Drivers / Divisions** item.

Sample records contain an absolute address, byte length, Paula period and volume. WAV files preserve every signed 8-bit sample, translated to unsigned WAV PCM by XOR with `0x80`. Sample rate is rounded from `3546895 / period`; the rounding is a container conversion, not a claim of cycle-exact audio.

Mountain shapes consist of coordinate words and edge/polygon records. Negative coordinate words are placeholders read from a secondary parameter stream. Faces refer to edge indices; extraction walks those edges into vertex cycles. The Three.js horizon uses these polygons and azimuths with a distant perspective placement; the original screen projection differs.

## Browser adaptations and remaining parity work

The renderer uses a depth buffer, unlike the original polygon sorting and Amiga bitplane drawing. The physics solver samples the decoded polygon surfaces with three wheel contacts. Contact forces depend on velocity relative to the sloping road; a nonpenetration constraint prevents high-speed landings passing through a thin road. Gravity, drive, suspension, grip and steering rules are converted from the original as detailed above. Integration, ground angular response, contact resolution and damage remain browser logic. The player remains free to leave the track.

Strict parity would require completing the boot/protection environment, recording full races under an Amiga emulator, porting or executing each physics/input/AI routine with its original integer widths and overflow, and comparing those race recordings. Only the isolated original physics traces above have been measured. The tests establish integrity, playable browser behaviour and those selected comparisons, not complete original-game parity.
