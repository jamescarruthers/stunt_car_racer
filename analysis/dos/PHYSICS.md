# Extracted DOS player physics

The `physics/` folder is a runnable extraction of the supplied DOS game's player movement code and data. `dos-physics.zip` contains the standalone package. Its source is exclusively `original/Stunt.img` → `CAR.EGA` → the decoded original x86 executable.

## Contents

| File | Purpose |
| --- | --- |
| `physics.bin` | 105,856 unchanged bytes: original 40,320-byte code region and complete 65,536-byte data segment |
| `manifest.json` | Source hashes, 45 relocation locations, routine entry points, memory layout and execution boundaries |
| `physics-x86.asm` | Original-byte disassembly with named entry points; includes embedded data and non-physics code |
| `entrypoints-x86.asm` | Selected routines decoded directly from their exact entry addresses |
| `dos_cpu.py` | Unicorn real-mode CPU, loading, relocation, bounded calls and hardware boundary handling |
| `dos_physics.py` | Native initialization and `step`, `recover`, `state`, `raw_state` API |
| `dos_physics_demo.py` | Command-line driving example and optional JSON trace output |
| `requirements.txt` | Pinned generic CPU emulator dependency |
| `verification.json` | Results and scope of the extraction checks |

The package deliberately retains the complete original code region and data segment so internal pointers and dependencies remain intact. It is not a reconstructed C/Python implementation of the force formulas, and the disassembly is not recovered high-level source. No physics instructions are patched. The only changes when loading `physics.bin` into the CPU are the executable's original 45 segment relocations.

The Python code supplies input, invokes the original routines, and converts output for inspection. The original x86 performs acceleration, braking/reverse, finite boost, suspension, tyre grip, steering, body transforms, linear/angular integration, airborne response, road/wheel lookup, crane selection and movement, and moving-bridge collision height updates.

## Run the standalone package

From the extracted folder, using an environment with Python and Unicorn:

```sh
python3 -m pip install -r requirements.txt
python3 dos_physics_demo.py --track 0 --ticks 500
python3 dos_physics_demo.py --track 5 --super --calibration 0xee00 --output bridge.json
```

The standalone runtime requires neither `Stunt.img` nor `CAR-decoded.exe`. It verifies its packaged binary's SHA-256 before execution. The demo supplies fire until the car lands, then accelerates with boost. It does not supply a steering driver or automatically rescue the car.

In this repository, the existing optional Unicorn installation can be used:

```sh
PYTHONPATH=/tmp/scr-m68k python3 analysis/dos/physics/dos_physics_demo.py --track 0
```

Some sandbox configurations prevent Unicorn's JIT execution; the recorded probes were run with the required local execution permission.

## API

```python
from dos_physics import DosPhysics

car = DosPhysics(track=0, super_league=False, calibration=0x646f)

state = car.step(0x10)  # One original update: fire/release.
state = car.step(0x11)  # Accelerate and boost.
car.recover(34)         # Native backward selection, then crane placement/setup.

pose = car.state()      # Read-only converted snapshot.
memory = car.raw_state()  # All 65,536 bytes of the original data segment.
```

### Controls

Controls use the original five-bit joystick layout. OR bits together:

| Bit | Meaning |
| ---: | --- |
| `0x01` | Accelerate |
| `0x02` | Brake/reverse |
| `0x04` | Right |
| `0x08` | Left |
| `0x10` | Boost/fire/crane release |

Throttle latching is performed by the original code, so a zero input mask does not necessarily close the throttle. The first race drop follows the original initial-crane flag; later recoveries wait for fire when ready. Holding fire during the swing does not bypass the original crane phases.

### State and units

The snapshot includes raw 24-bit position, raw 16-bit velocity, pitch/yaw/roll, angular velocity, forward speed, section, chain phase, contact, off-road flags and BCD boost reserve. `world` converts X/Z by 512 and Y by 1024, matching the track coordinates used by the browser. Its angles are **native DOS angles expressed in radians**; a renderer must apply the appropriate axis/sign conventions.

`raw_state()` is an immutable copy for hashing, replay comparisons and inspection. Reading state does not advance the CPU. Inputs and transforms for display never overwrite the car's native pose.

### Timing

Each `step()` advances one native update. The supported calibration range is the original `0x646F..0xFFFF`; values outside that range are rejected. The default is the original minimum `0x646F`, supplied explicitly by the harness rather than measured by emulating a historical PC's speed test.

`nominal_tick_seconds` decodes the original BCD game-clock increment and fractional hundredths derived at startup. At `0x646F` it is 0.054921875 seconds. This describes the selected game's clock scale; it is not a measurement of hardware frame timing. Native PIT interrupts, EGA retrace and DOS scheduling are not emulated.

The calibration also changes suspension damping, other movement increments and counters. Calling `step()` 120 times per second is not a verified way to preserve the original behaviour. A browser adapter can interpolate completed snapshots at 120 Hz while preserving the chosen native cadence.

## Initialization and native execution

All addresses are module-relative CS offsets, with DS at module-relative paragraph `0x09D8`.

1. Load and relocate the original code/data; initialize registers and a separate stack.
2. Derive the calibration parameters at `0x01AA`.
3. Run track decoding at `0x25DE` and map initialization at `0x5F85`.
4. Run race initialization at `0x41C1`, including league parameters, finite boost, PRNG setup and roll lookup generation. Those generated tables are essential: calling movement against an uninitialized data segment gives incorrect forces.
5. Perform original crane recovery at `0x3980`, road lookup, and the pre-race physics priming call from the original startup order, then enable forces at `DS:5413`.
6. Per update: original controls `0x42DF`, coupled physics `0x81E0`, road lookup `0x65A0` through `0x6629` or `0x66DD`, bridge update `0x13BF`, and timer-divider prefix `0x1C10..0x1C23`.

Input is supplied at the original joystick snapshot byte. The keyboard-specific accelerate/fire remapping and hardware interrupt polling are bypassed through the supplied input-mode state. Presentation port writes to `0x3C4/0x3CE` are discarded, and the speaker port `0x61` is stubbed. Unsupported I/O and CPU interrupts raise errors. Routine calls have checked stops and an instruction budget.

## Verification and limits

`tools/verify_dos_physics.py` runs the **full decoded executable and the extracted package** with the same initialized harness and Unicorn CPU. On every recorded update it compares the entire 64 KiB data segment and code region, plus the exposed snapshot. Cases cover every track, both leagues and two native calibration values, including:

- Initial crane swing/lift/drop and landing.
- Acceleration, steering in each direction, boost, braking and reverse.
- Recovery from selected prohibited sections.
- Holding the manual crane without fire, then releasing and landing.
- A reverse run-up followed by boosted acceleration.

The trace is saved outside the portable archive as `physics/gameplay-traces.json`. `physics/verification.json` records the final comparison count. The standalone check copies only the package's required files into an otherwise empty temporary directory and runs 400 updates without access to either source game file.

The completed verification recorded **25,424 matching updates across 32 scenarios**. The earlier loader, all-445-section recovery selector, 36 integration and 48 suspension arithmetic probes also pass.

This demonstrates integrity of the extraction for those scenarios. Both sides use the same CPU emulator and headless initialization; it does **not** establish equivalence to a complete DOS boot and recorded race on hardware or in a full DOS emulator.

The movement core produces native impact/contact state, but the full crack rendering/damage/wreck pipeline is not scheduled by this adapter. Rival driving/proximity setup, race/lap bookkeeping, automatic recovery scheduling, sound and graphics remain integration work. `recover()` exposes the original recovery routine for a host to call. The original bridge runs with an absent-opponent sentinel. The binary retains the other original routines, but that alone does not establish their initialized gameplay behaviour.

The current Three.js game continues to use its verified Amiga 68000 backend. This DOS extraction is a separate, runnable engine package ready for further comparison and a browser CPU adapter.

## Rebuild and verify from the supplied disk

Run from the repository root:

```sh
python3 tools/inspect-dos.py
python3 tools/extract-dos-physics.py
PYTHONPATH=/tmp/scr-m68k python3 -u tools/probe-dos.py
python3 tools/extract-dos-physics.py
```

The final extraction command copies the verification summary into the portable ZIP. No downloaded game source, data or executable is involved.
