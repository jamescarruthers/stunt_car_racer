#!/usr/bin/env python3
"""Execute selected routines from the supplied DOS disk with Unicorn x86.

This is an isolated routine harness, not a DOS/EGA/PIT hardware emulator.
Run inspect-dos.py first. No instructions in the game executable are patched.
"""
import hashlib
import json
import struct
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR
from unicorn.x86_const import *

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "analysis/dos"
from dos_cpu import EXE, BASE, DATA, Machine, relocated


def loader_check():
    """Run CAR.EXE's actual decoding, relocation and far-jump instructions."""
    loader = (OUT / "files/CAR.EXE").read_bytes()
    encoded = (OUT / "files/CAR.EGA").read_bytes()
    u = Uc(UC_ARCH_X86, UC_MODE_16)
    u.mem_map(0, 0x100000)
    u.mem_write(BASE, loader[512:])
    for name, value in [("CS", 0x1000), ("DS", 0xff0), ("ES", 0xff0),
                        ("SS", 0x100f), ("SP", 0x100), ("EFLAGS", 0x202)]:
        u.reg_write(globals()["UC_X86_REG_" + name], value)
    cursor, reads = 0, []

    def dos(u, number, _):
        nonlocal cursor
        assert number == 0x21, f"Unexpected interrupt {number:x}"
        ax = u.reg_read(UC_X86_REG_AX)
        service = ax >> 8
        pointer = u.reg_read(UC_X86_REG_DS) * 16 + u.reg_read(UC_X86_REG_DX)
        if service == 9:  # Print string: output deliberately omitted.
            pass
        elif service == 0x3d:
            assert bytes(u.mem_read(pointer, 8)) == b"CAR.EGA\0"
            u.reg_write(UC_X86_REG_AX, 5)
        elif service == 0x3f:
            count = u.reg_read(UC_X86_REG_CX)
            block = encoded[cursor:cursor + count]
            if block:
                u.mem_write(pointer, block)
            cursor += len(block)
            reads.append(len(block))
            u.reg_write(UC_X86_REG_AX, len(block))
        elif service in (0x3e, 0x1a):
            pass
        else:
            raise AssertionError(f"Unexpected DOS service {service:x}")
        u.reg_write(UC_X86_REG_EFLAGS, u.reg_read(UC_X86_REG_EFLAGS) & ~1)

    u.hook_add(UC_HOOK_INTR, dos)
    # Loader CS + $64 paragraphs file buffer + $20 paragraphs MZ header.
    entry = 0x10840
    u.emu_start(BASE, entry, count=4000000)
    assert u.reg_read(UC_X86_REG_CS) * 16 + u.reg_read(UC_X86_REG_IP) == entry
    expected = bytearray(EXE[:512] + relocated(EXE, entry >> 4))
    # The loader pushes CS:IP on the executable's own stack before RETF.
    # This stack is inside the loaded image; the four bytes remain afterwards.
    ss, sp = struct.unpack_from("<HH", EXE, 14)
    stack_offset = 512 + ss * 16 + sp - 4
    struct.pack_into("<HH", expected, stack_offset, 0, entry >> 4)
    actual = bytes(u.mem_read(0x10640, len(expected)))
    assert actual == expected, ("Native loader disagrees with extracted/relocated executable", [
        (hex(i), a, b) for i, (a, b) in enumerate(zip(actual, expected)) if a != b][:20])
    return {"bytesCompared": len(expected), "byteExact": True, "readSizes": reads,
            "entryPhysicalAddress": entry, "farReturnStackFileOffset": stack_offset,
            "instructionsPatched": 0}


def signed(value):
    return value - 65536 if value >= 32768 else value


def main():
    result = {"sourceSha256": hashlib.sha256(EXE).hexdigest(), "loader": loader_check(),
              "calibration": [], "integration": [], "suspension": [], "recovery": []}
    print("Native loader verified", flush=True)
    m = Machine()
    for loop_count in (64, 256, 1024, 4096, 8192):
        m.call(0x184, bx=loop_count)
        result["calibration"].append({"seededLoopCount": loop_count,
            "coefficient": m.get(0x20, 2), "integrationMultiplier": m.get(0x25, 2),
            "suspensionMultiplier": m.get(0x27, 2)})
    for coefficient in (0x646f, 0x8000, 0xee00, 0xffff):
        m.calibrate(coefficient)
        for value in (-16384, -2048, -317, -1, 0, 1, 317, 2048, 16384):
            native = signed(m.call(0x3c65, ax=value))
            product = value * (coefficient >> 1)
            # $3c6d AND AX,AX clears CF before RCL AX at $3c71. Therefore
            # the low-half carry is discarded; a floating-point scale misses
            # this executable's integer quantization.
            expected = signed(((product >> 16) * 2 +
                               int(product < 0 and ((product << 1) & 65535) != 0)) & 65535)
            assert native == expected, ("integration", coefficient, value, native, expected, m.get(0x25, 2))
            result["integration"].append({"coefficient": coefficient, "input": value, "output": native,
                                           "idealTruncatedScale": int(product / 32768)})
        for depth in (0, 128, 317, 1024):
            for change in (-256, 0, 256):
                native = signed(m.call(0x5ddc, ax=change, cx=depth))
                expected = depth + int(change * m.get(0x27, 2) / 64)
                assert native == expected, ("suspension", coefficient, depth, change, native, expected)
                result["suspension"].append({"coefficient": coefficient, "depth": depth,
                                              "change": change, "output": native})
    tracks = json.loads((ROOT / "public/assets/tracks.json").read_text())
    for track in tracks:
        m = Machine()
        m.put(0x568a, track["id"])
        # Run the DOS track decoder through its complete trailer/exclusion load;
        # stop before random opponent setup and presentation initialization.
        m.call(0x25de, stop=0x27c4, bx=track["id"])
        assert m.get(0x5671) == len(track["pieces"])
        count = m.get(0x5686)
        excluded = list(m.u.mem_read(DATA + 0x539c, count)) if count else []
        assert excluded == track["recoveryForbidden"]
        choices = []
        for i, piece in enumerate(track["pieces"]):
            assert m.get(0x5aad + i) == piece["code"]
            assert m.get(0x5afb + i) == piece["grid"]
            # Entire native backward selection, stopping before placement/lift.
            m.call(0x3980, stop=0x39b0, bx=i)
            selected = m.get(0x5480)
            expected = i
            while not track["pieces"][expected]["recoveryAllowed"]:
                expected = (expected - 1) % len(track["pieces"])
            assert selected == expected, (track["name"], i, selected, expected)
            choices.append(selected)
        result["recovery"].append({"track": track["name"], "sections": len(choices),
                                    "forbidden": excluded, "selectedBySection": choices})
    (OUT / "routine-traces.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"loader": result["loader"], "calibration": result["calibration"],
                      "integrationCases": len(result["integration"]),
                      "suspensionCases": len(result["suspension"]),
                      "recoverySections": sum(r["sections"] for r in result["recovery"])}, indent=2))


if __name__ == "__main__":
    main()
    from verify_dos_physics import run
    run()
