#!/usr/bin/env python3
"""Verify the extracted DOS core against execution from the full DOS image.

Both sides execute original x86 instructions. This establishes extraction
integrity for the tested harness; it is not independent full-DOS race parity.
"""
import hashlib
import json
import tempfile
import shutil
import subprocess
import sys
from pathlib import Path
from dos_cpu import OUT, PACKAGE, BASE, DATA, EXE, signed
from dos_physics import DosPhysics


def run():
    records, comparisons = [], 0
    recover_sections = [34, 20, 38, 34, 32, 54, 45, 40]
    for calibration in (0x646f, 0xee00):
        for league in (False, True):
            for track in range(8):
                full = DosPhysics(track, league, calibration, source="executable")
                core = DosPhysics(track, league, calibration, source="extracted")
                assert full.raw_state() == core.raw_state(), (track, league, "initialization")
                samples = []

                def step(controls, phase):
                    nonlocal comparisons
                    a, b = full.step(controls), core.step(controls)
                    assert a == b, (track, league, calibration, core.ticks, "pose")
                    ra, rb = full.raw_state(), core.raw_state()
                    assert ra == rb, (track, league, calibration, core.ticks, "raw DS")
                    # Original code has 45 segment relocations, but neither
                    # harness patches physics instructions or routine returns.
                    assert full.u.mem_read(BASE, 0x9d80) == core.u.mem_read(BASE, 0x9d80)
                    assert 0 <= a["section"] < core.get(0x5671)
                    assert all(-8388608 <= v <= 8388607 for v in a["position"])
                    comparisons += 1
                    samples.append({"phase": phase, "controls": controls,
                                    "dataSha256": hashlib.sha256(rb).hexdigest(), **b})
                    return b

                for i in range(1500):
                    state = step(16, "initial-drop")
                    if not state["chains"] and state["contact"]:
                        break
                else:
                    raise AssertionError((track, league, calibration, "crane failed to land", state))
                initial_drop_ticks = core.ticks
                for count, controls, phase in [(25, 0, "settle"), (55, 1, "accelerate"),
                                               (25, 9, "left"), (25, 5, "right"),
                                               (55, 17, "boost"), (65, 2, "brake-reverse")]:
                    for i in range(count):
                        step(controls, phase)
                requested = recover_sections[track]
                full.recover(requested)
                core.recover(requested)
                selected = core.state()["section"]
                assert full.raw_state() == core.raw_state()
                for i in range(240):
                    state = step(0, "hold-crane")
                    assert state["chains"], (track, league, calibration, "manual crane released without fire")
                for i in range(1500):
                    state = step(16, "manual-release")
                    if not state["chains"] and state["contact"]:
                        break
                else:
                    raise AssertionError((track, league, calibration, "manual recovery failed", state))
                for i in range(round(5 / core.nominal_tick_seconds)):
                    step(2, "reverse-run-up")
                for i in range(round(7 / core.nominal_tick_seconds)):
                    step(17, "boosted-run-up")
                records.append({"track": track, "superLeague": league, "calibration": calibration,
                                "nominalTickSeconds": core.nominal_tick_seconds,
                                "initialDropTicks": initial_drop_ticks,
                                "recoveryRequested": requested, "recoverySelected": selected,
                                "samples": samples})
                print(f"DOS track {track}, {'super' if league else 'standard'}, calibration {calibration:04x}: {len(samples)} native ticks agree", flush=True)
    result = {"sourceSha256": hashlib.sha256(EXE).hexdigest(), "scope": "Headless full executable vs extracted code/data, same Unicorn CPU",
              "comparedBytesPerTick": 65536 + 0x9d80, "comparedTicks": comparisons,
              "cases": records}
    (OUT / "physics/gameplay-traces.json").write_text(json.dumps(result, separators=(",", ":")) + "\n")
    # The exported folder must also work without Stunt.img or CAR-decoded.exe.
    with tempfile.TemporaryDirectory(prefix="scr-dos-core-") as directory:
        destination = Path(directory)
        for name in ("physics.bin", "manifest.json", "dos_cpu.py", "dos_physics.py", "dos_physics_demo.py"):
            shutil.copyfile(PACKAGE / name, destination / name)
        demo = subprocess.run([sys.executable, str(destination / "dos_physics_demo.py"), "--ticks", "400"],
                              cwd=directory, check=True, capture_output=True, text=True)
        demo_result = json.loads(demo.stdout)
        assert demo_result["last"]["tick"] == 400
        assert demo_result["last"]["position"] != demo_result["first"]["position"]
        result["standalonePackagePassed"] = True
    (OUT / "physics/verification.json").write_text(json.dumps({k: v for k, v in result.items() if k != "cases"}, indent=2) + "\n")
    print(f"DOS extraction verified: {comparisons} native updates across {len(records)} cases", flush=True)
    return result


if __name__ == "__main__":
    run()
