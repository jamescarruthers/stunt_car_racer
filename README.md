# Stunt Car Racer — browser reconstruction

A playable Three.js/WebGL reconstruction using your supplied Amiga disk and DOS `original/Stunt.img`. The **PHYSICS** selector chooses original Amiga 68000 or DOS x86 player code running in WebAssembly. Three.js renders interpolated views between native updates. The artwork and track renderer use assets decoded from `original/Stunt_Car_Racer_1989_MicroStyle_cr_QTX.adf`; the DOS track data agrees with the Amiga geometry. The browser integration and extraction tools were written for this project. External remakes and disassemblies were consulted as format guides; their source, compiled games, track files, and artwork are not part of this game's build.

## Run

```sh
npm install
npm run dev
```

Open **http://127.0.0.1:5173**. `npm run build` produces a standalone static site in `dist/`; `npm run preview` serves that build. The game has no CDN or external service dependency. WebAssembly, WebGL2 and Web Audio are required. Rendering follows the display refresh rate, including 120 Hz on a compatible display; each physics version retains its native timestep (Amiga: 0.12 seconds; DOS: 0.054921875 seconds at the selected original calibration).

### GitHub Pages

Play at **https://jamescarruthers.github.io/stunt_car_racer/**.

The [Pages workflow](.github/workflows/pages.yml) installs locked dependencies with Node.js 22, runs the test suite, builds with the `/stunt_car_racer/` base path, and deploys `dist/` after each push to `main`. Pull requests run the tests and build. You can also run the workflow manually from the repository's Actions tab. The repository's **Settings → Pages → Source** is **GitHub Actions**.

To check the same deployment path locally:

```sh
npm run build -- --base=/stunt_car_racer/
node tools/browser-check.mjs --production --base-path=/stunt_car_racer/ --boost-only
```

The workflow follows the [Vite deployment guide](https://vite.dev/guide/static-deploy.html#github-pages) and [GitHub Pages workflow documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages). The deployed site contains the game and dependency licence files; the repository also contains the original disks, extraction tools and physics verification fixtures.

## Playing

**DOS is the default** when no physics preference is saved. Use **PHYSICS → AMIGA / DOS** in the header to change version. The choice persists after reload, including existing Amiga selections. Switching during a race restarts that same track with the selected physics; lap records are separate for each version. The graphics option is independent.

Choose **Practice**, select one of the eight tracks, then start. **Start a season** shows the original driver portraits and current division lineup before racing rivals across four divisions. **Drivers / Divisions** also opens this page from the main menu. A season awards two points for winning and one for the fastest lap, with promotion/relegation after four player races. Progress and lap records are saved in this browser.

| Control | Action |
| --- | --- |
| Arrow keys / WASD | Accelerate, brake/reverse, steer |
| Space / Shift | Boost / release the crane |
| R | Crane recovery |
| G / 3D button | Switch between original pixelation and full-resolution 3D |
| P | Pause/resume |
| Escape | Return to menu |
| M / F | Mute / fullscreen |
| Enter / arrow keys | Select / navigate menus |

The throttle stays open until braking, as in the original. Touch controls appear on devices with a coarse pointer. A standard gamepad uses its left stick, right/left triggers, and A button. Switching away from the window pauses the race.

After recovery, **press Space to release the crane**. The original lift, swing and drop are now simulated. At **Little Ramp**, reverse for a run-up before accelerating with boost. About five seconds holding Down, then Up + Space, clears the jump in the recovery regression. The original also needs a run-up from this drop point. Space can boost braking/reversing when held with Down.

## Fidelity

**Directly extracted:** all eight track bytecode streams, section templates, horizontal coordinates, height profiles, banking, track names, boost allowances, division track assignments, 11 driver names, nine bitmap screens, both bitmap fonts, the expanded Amiga palette, the horizon geometry, and eight PCM samples. Track vertices retain the original coordinate values; the renderer converts X/Z by 1/32 and Y by 1/128. All 445 section joins agree within one original coordinate unit. The display is 320×200 with a 4:3 presentation, nearest pixel scaling and flat polygon colours.

**Executed from your disk:** player controls and latched throttle, standard/super engine forces, boost consumption, three wheel suspension, grip, steering, all linear/angular integration, jumps and landings, track lookup, crane selection and motion, drawbridge heights, collision impulses and damage/crack calculations. The browser loads the unchanged 408,540-byte payload at its original address into a Musashi 68000 emulator. Only Amiga input polling, audio output and bitmap text output are replaced with browser boundaries. Physics instructions and fixed-point arithmetic are unchanged.

**DOS execution:** the browser verifies and loads the unchanged 105,856-byte code/data extract from `CAR.EGA`, applies the executable’s 45 original MZ relocations and calls its x86 routines. Native steering, suspension, integration, controls, boost, track lookup, bridge and crane routines match the extracted reference traces. DOS collision, automatic recovery and damage routines are also connected; the damage calculation reads and writes private EGA planes initialized with 32,000 original cockpit bytes. Three.js continues to display the Amiga artwork.

**Browser presentation and race flow:** Three.js rendering, camera placement, visible instruments and effects, menus, lap/season bookkeeping, rival driving policy and sound playback remain browser implementations. Rival positions are converted into original road coordinates for the native collision routines. Original damage logic retains offscreen cockpit bitplanes. The first crane drop releases automatically; later recoveries wait for Space. Manual recovery and automatic recovery use the native restart routine. This is a player-physics execution port, not a complete Amiga/DOS machine emulator or full race-loop emulation.

The **3D** button (or **G**, including in fullscreen) switches between the original 320×200 rendering and full-resolution 3D at the display's pixel density. The choice is saved locally and can be changed during a race. Original cockpit and menu bitmap artwork retains its pixel detail in either mode.

The cockpit displays the original animated front-wheel sprites, with independent heights driven by each native engine's suspension state. Off-road ground contact produces the original eight dust-cloud sprites. Artwork, wheel-height lookup, dust frame order and sprite offsets come from the supplied Amiga disk; wheel rotation timing and particle animation are browser presentation adaptations. Both physics modes use these effects, which freeze while paused and clear during crane recovery.

**Timing:** Amiga physics executes once every six PAL frames (0.12 seconds). DOS uses the original calibration routine with coefficient `0x646f` and its native clock increment of `0.054921875` seconds (about 18.2 updates/second). DOS originally adapts to CPU speed; this chooses its original minimum coefficient consistently across browsers. Car/camera poses, the rival and moving bridge vertices interpolate between completed states on `requestAnimationFrame`. Interpolation does not change CPU memory or collision geometry, and pause freezes both simulation and interpolation. This keeps the original input/physics cadence and adds up to one original tick of presentation latency. Full-resolution 3D remains independently selectable.

**Amiga verification:** the same WebAssembly binary shipped to the browser reproduces the independent Unicorn recordings: all acceleration/braking/free-fall/jump samples, 1,134 steering cases, suspension and grip probes, plus **5,600 gameplay updates across all eight tracks and both leagues with byte-for-byte agreement in the recorded physics state**. That includes finite boost, damage, crane phases, recovery and mutable bridge profiles. Tests at 30/60/120/144 display updates per second reach identical native states. Additional checks cover bank orientation, interpolation, recovery and native rival contact.

**DOS verification:** all **25,424 recorded updates** across all eight tracks, both leagues and two original CPU calibrations agree byte for byte over the entire 64 KiB data segment with the independent native Unicorn recordings. Integration checks cover settled suspension, both steering directions, banking, bridge geometry, native recovery, the Little Ramp reverse run-up, rival collisions, crack/wreck logic, and identical simulation at 30/60/120/144 Hz rendering. The production browser check exercises switching both ways, persistence, both resolutions, all tracks, both race modes, pause and interpolation.

Full Amiga/DOS boot/hardware, the original AI and complete race-loop parity remain unverified. Serial multiplayer, original disk saves and the crack intro are not implemented. See the [current execution audit](analysis/FORMAT.md#browser-execution-of-the-original-physics) for the exact boundaries. The former continuous JavaScript solver is archived in `tools/reference-physics.js` solely for historical regression comparisons; it is not imported into gameplay.

## Reproduce the extraction

```sh
python3 -m pip install -r requirements.txt
npm run extract
npm test
npm run build
```

`tools/extract_original.py` reads only the supplied disk. It identifies the Quartex plaintext payload at disk offset `0xDC00`, validates its entry signature, and extracts 408,540 bytes with original load address `0xE700`. Unsupported disk variants fail rather than silently producing substitute content.

- `public/assets/manifest.json`: disk/payload SHA-256 and asset source ranges with hashes.
- `analysis/original.bin` and `public/assets/original-code.bin`: identical, unmodified extracted payloads. The browser verifies the latter against the manifest before executing it.
- `analysis/original-68000.asm`: Capstone linear disassembly of executable regions, generated from that payload. It includes data and unresolved protection placeholders; it is not a fully annotated or reassemblable source recovery.
- `analysis/FORMAT.md`: decoded data formats and known implementation differences.
- `analysis/dos/REPORT.md`: inspection of the supplied `original/Stunt.img`, including the decoded DOS executable, shared track data, native recovery checks and CPU calibration findings. Reproduce with `python3 tools/inspect-dos.py` and the optional Unicorn harness `tools/probe-dos.py`.
- `analysis/dos/PHYSICS.md` and `analysis/dos/dos-physics.zip`: runnable DOS player-physics extraction, native code/data, API, disassembly and verification. Build with `python3 tools/extract-dos-physics.py` before running the DOS probes. The extraction script also publishes `public/assets/dos-physics.bin`, `dos-physics.json` and `dos-cockpit.bin` for the browser.
- `tools/probe-original.py`, `analysis/original-physics-traces.json` and `analysis/original-runtime-traces.json`: independent Unicorn measurements from the disk. Use `--runtime-only --output analysis/original-runtime-traces.json` to reproduce the extended gameplay fixtures.
- `src/original-machine.js`, `src/dos-machine.js`, `src/original-car.js`: the two native CPU adapters and shared race bookkeeping.
- `src/simulation-clock.js`: fixed native tick and render interpolation.
- `src/cockpit-effects.js`, `public/assets/cockpit-sprites.png` and `cockpit-effects.json`: original wheel/dust artwork and presentation data. Check both physics modes with `node tools/browser-check.mjs --production --presentation-only`.
- `tests/emulated-physics.test.js`, `tests/dos-physics.test.js`: current original-code parity and integration checks. Other test files retain the preceding continuous-solver audit, alongside asset/track/season checks.
- `tools/browser-check.mjs`: Chrome smoke check and screenshots; run against the dev server with `node tools/browser-check.mjs`. Use `node tools/browser-check.mjs --production` to serve and test the packaged `dist/` build. Set `CHROME_PATH` if Chrome is installed elsewhere.

Format guides: [Vesuri's Amiga disassembly](https://github.com/Vesuri/stuntcarracer), [StuntCarRemake reference material](https://github.com/ptitSeb/stuntcarremake). Browser engine: [Three.js](https://threejs.org/). Generic CPU dependency: [Musashi WebAssembly](https://github.com/mblsha/musashi-wasm), pinned to `musashi-wasm@0.1.31`; it supplies no game code or data. Its [copyright notice](public/licenses/MUSASHI.txt) is included in the static build.

DOS CPU dependency: [Unicorn.js](https://github.com/AlexAltea/unicorn.js) / [Unicorn 2.1.4](https://github.com/unicorn-engine/unicorn/tree/2.1.4), built with Emscripten 4.0.15. The upstream browser helper adapter leaked temporary TCG registers and crashed on long x86 blocks. Our build frees those temporary registers after emitting each helper call; game instructions are untouched. The [GPLv2 licence](public/licenses/UNICORN.txt) and [complete corresponding patched source and rebuild instructions](public/licenses/unicorn-source.tar.gz) ship with the static site. `src/vendor/unicorn-x86.mjs` is loaded only when DOS is selected.

Original game and its assets: Geoff Crammond / MicroStyle, 1989; rights remain with their respective owners. Three.js, Musashi, Unicorn and the development dependencies retain their own licences.
