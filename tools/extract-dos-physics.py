#!/usr/bin/env python3
"""Package original DOS code and its complete data segment for headless physics.

No recompiled/reimplemented physics, downloaded game code, or Amiga bytes are
inputs. Run tools/inspect-dos.py first to decode the supplied filesystem.
"""
import hashlib
import json
import struct
import shutil
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "analysis/dos"
DEST = OUT / "physics"
CODE_SIZE = 0x9d80
DATA_SIZE = 0x10000

ENTRY_POINTS = {
    "deriveCalibration": 0x01aa,
    "decodeTrack": 0x25de,
    "initializeTrackMap": 0x5f85,
    "initializeRace": 0x41c1,
    "recover": 0x3980,
    "controls": 0x42df,
    "physics": 0x81e0,
    "locate": 0x65a0,
    "bridge": 0x13bf,
    "timerDivider": 0x1c10,
    "rollTables": 0x4811,
    "steering": 0x5656,
    "suspension": 0x8458,
    "integrate": 0x3c65,
    "suspensionChange": 0x5ddc,
}
ENTRY_ENDS = {
    "deriveCalibration": 0x0248, "decodeTrack": 0x2851,
    "initializeTrackMap": 0x5fa9, "initializeRace": 0x42b6,
    "recover": 0x3a96, "controls": 0x4354, "physics": 0x821e,
    "locate": 0x6642, "bridge": 0x1490, "timerDivider": 0x1c23,
    "rollTables": 0x48da, "steering": 0x57c9, "suspension": 0x862f,
    "integrate": 0x3c7b, "suspensionChange": 0x5df6,
}


def main():
    manifest = json.loads((OUT / "manifest.json").read_text())
    image = (OUT / "CAR-decoded.exe").read_bytes()
    assert hashlib.sha256(image).hexdigest() == manifest["decoded"]["sha256"]
    header_bytes = struct.unpack_from("<H", image, 8)[0] * 16
    module = image[header_bytes:header_bytes + CODE_SIZE + DATA_SIZE]
    relocations = []
    count, table = struct.unpack_from("<H", image, 6)[0], struct.unpack_from("<H", image, 24)[0]
    for i in range(count):
        off, seg = struct.unpack_from("<HH", image, table + i * 4)
        address = seg * 16 + off
        assert address + 2 <= len(module), "Relocation beyond packaged memory"
        relocations.append(address)
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "physics.bin").write_bytes(module)
    package = {"format": "scr-dos-physics-v1", "sourceImage": manifest["image"],
               "decodedExeSha256": manifest["decoded"]["sha256"],
               "payload": {"file": "physics.bin", "bytes": len(module),
                           "sha256": hashlib.sha256(module).hexdigest(),
                           "sourceFileOffset": header_bytes, "sourceBytesUnchanged": True},
               "cpu": "16-bit x86 real mode", "codeBytes": CODE_SIZE,
               "dataSegmentParagraphs": CODE_SIZE >> 4, "dataBytes": DATA_SIZE,
               "relocationWordOffsets": relocations, "entryPoints": ENTRY_POINTS,
               "stops": {"locate": [0x6629, 0x66dd], "timerDivider": [0x1c23]},
               "calibrationRange": [0x646f, 0xffff],
               "state": {
                   "position": {"bytePlanes": [0x530c, 0x530f, 0x5312], "axes": ["x", "y", "z"],
                                "signedBits": 24, "rawUnitsPerWorldUnit": [512, 1024, 512]},
                   "velocity": {"bytePlanes": [0x5315, 0x531b], "signedBits": 16},
                   "angles": {"bytePlanes": [0x532d, 0x5330], "axes": ["pitch", "yaw", "roll"],
                              "signedBits": 16, "unitsPerTurn": 65536},
                   "angularVelocity": {"bytePlanes": [0x5318, 0x531e], "signedBits": 16},
                   "section": 0x5480, "chains": 0x4ae1, "contact": 0x4b26,
                   "offRoad": 0x4b27, "boostBCD": 0x5677,
                   "savedRecoverySection": 0x5415, "input": 0x8b2},
               "scope": "Native player physics, controls, tracks, crane, bridge, finite boost and timer divider; headless hardware adapter. Full DOS race/hardware equivalence is unverified."}
    (DEST / "manifest.json").write_text(json.dumps(package, indent=2) + "\n")
    # The browser executes the same cropped module. Damage logic additionally
    # consults the four original EGA cockpit bitplanes (CS:4181..41b1).
    public = ROOT / "public/assets"
    cockpit_offset = header_bytes + 0x185e0
    cockpit = image[cockpit_offset:cockpit_offset + 32000]
    assert len(cockpit) == 32000
    (public / "dos-physics.bin").write_bytes(module)
    (public / "dos-cockpit.bin").write_bytes(cockpit)
    browser_package = {**package, "cockpit": {
        "file": "dos-cockpit.bin", "bytes": len(cockpit),
        "sha256": hashlib.sha256(cockpit).hexdigest(),
        "sourceFileOffset": cockpit_offset, "sourceBytesUnchanged": True}}
    (public / "dos-physics.json").write_text(json.dumps(browser_package, indent=2) + "\n")
    for filename in ("dos_cpu.py", "dos_physics.py", "dos_physics_demo.py"):
        shutil.copyfile(ROOT / "tools" / filename, DEST / filename)
    (DEST / "requirements.txt").write_text("unicorn==2.1.4\n")
    documentation = OUT / "PHYSICS.md"
    if documentation.exists():
        shutil.copyfile(documentation, DEST / "README.md")
    # Reuse the supplied-byte listing, adding named routine entry points.
    listing = OUT / "game-x86.asm"
    if listing.exists():
        labels = {address: name for name, address in ENTRY_POINTS.items()}
        lines = []
        for line in listing.read_text().splitlines():
            try:
                address = int(line.split(":")[0], 16)
            except ValueError:
                address = -1
            if address in labels:
                lines.append("\n; ENTRY " + labels[address])
            lines.append(line)
        (DEST / "physics-x86.asm").write_text("\n".join(lines) + "\n")
    try:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_16
        md = Cs(CS_ARCH_X86, CS_MODE_16)
        focused = ["; Exact entry-point decoding of selected original DOS physics routines.",
                   "; Addresses are CS-relative. Calls/branches can leave each displayed range.",
                   "; Runtime stop boundaries are recorded separately in manifest.json."]
        for name, start in ENTRY_POINTS.items():
            focused.append(f"\n{name}: ; CS:{start:04x}")
            focused.extend(f"{i.address:04x}: {i.bytes.hex():22} {i.mnemonic:8} {i.op_str}"
                           for i in md.disasm(module[start:ENTRY_ENDS[name]], start))
        (DEST / "entrypoints-x86.asm").write_text("\n".join(focused) + "\n")
    except ImportError:
        pass
    portable = ["physics.bin", "manifest.json", "physics-x86.asm", "entrypoints-x86.asm", "dos_cpu.py",
                "dos_physics.py", "dos_physics_demo.py", "requirements.txt", "README.md", "verification.json"]
    with zipfile.ZipFile(OUT / "dos-physics.zip", "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for name in portable:
            if (DEST / name).exists():
                archive.write(DEST / name, name)
    print(json.dumps({"payloadBytes": len(module), "sha256": package["payload"]["sha256"],
                      "relocations": len(relocations), "directory": str(DEST)}, indent=2))


if __name__ == "__main__":
    main()
