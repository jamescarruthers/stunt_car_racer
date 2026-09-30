#!/usr/bin/env python3
"""Extract and inspect the supplied DOS image without mounting or booting it.

Game bytes come exclusively from original/Stunt.img. Capstone is optional and
only produces a provisional linear listing (embedded data is not all code).
"""
import argparse
import hashlib
import json
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def sha(data):
    return hashlib.sha256(data).hexdigest()


def mz(data):
    fields = ("magic", "lastPageBytes", "pages", "relocations", "headerParagraphs",
              "minExtraParagraphs", "maxExtraParagraphs", "ss", "sp", "checksum",
              "ip", "cs", "relocationOffset", "overlay")
    h = dict(zip(fields, struct.unpack_from("<14H", data)))
    assert data[:2] == b"MZ", "Expected a decoded DOS MZ executable"
    h["declaredBytes"] = (h["pages"] - 1) * 512 + (h["lastPageBytes"] or 512)
    h["entryFileOffset"] = h["headerParagraphs"] * 16 + h["cs"] * 16 + h["ip"]
    assert h["declaredBytes"] == len(data)
    return h


def extract_fat16(disk):
    assert disk[510:512] == b"\x55\xaa"
    entry = disk[446:462]
    lba, sectors = struct.unpack_from("<II", entry, 8)
    base = lba * 512
    bps, spc, reserved, fats, roots, total16, media, spf = struct.unpack_from("<HBHBHHBH", disk, base + 11)
    total = total16 or struct.unpack_from("<I", disk, base + 32)[0]
    root_sectors = (roots * 32 + bps - 1) // bps
    data_sector = reserved + fats * spf + root_sectors
    cluster_count = (total - data_sector) // spc
    assert 4085 <= cluster_count < 65525, "Only FAT16 is supported by this inspector"
    assert bps == 512 and base + total * bps <= len(disk)
    fat = disk[base + reserved * bps:base + (reserved + spf) * bps]
    for copy in range(1, fats):
        start = base + (reserved + copy * spf) * bps
        assert fat == disk[start:start + len(fat)], "FAT copies disagree"
    root = base + (reserved + fats * spf) * bps
    cluster_bytes = bps * spc

    def chain(first):
        seen, content = set(), bytearray()
        while first < 0xfff8:
            assert 2 <= first < cluster_count + 2 and first not in seen, "Invalid FAT chain"
            seen.add(first)
            p = base + data_sector * bps + (first - 2) * cluster_bytes
            content.extend(disk[p:p + cluster_bytes])
            first = struct.unpack_from("<H", fat, first * 2)[0]
        return bytes(content)

    files = {}

    def directory(data, parent=""):
        for p in range(0, len(data), 32):
            e = data[p:p + 32]
            if not e or e[0] == 0:
                break
            if e[0] == 0xe5 or e[11] & 8 or e[11] == 0x0f:
                continue
            stem, ext = e[:8].decode("cp437").rstrip(), e[8:11].decode("cp437").rstrip()
            if stem in (".", ".."):
                continue
            name = stem + ("." + ext if ext else "")
            assert "/" not in name and "\\" not in name
            path = parent + name
            first = struct.unpack_from("<H", e, 26)[0]
            size = struct.unpack_from("<I", e, 28)[0]
            if e[11] & 16:
                directory(chain(first), path + "/")
            else:
                data_bytes = chain(first) if first else b""
                assert len(data_bytes) >= size
                files[path] = data_bytes[:size]

    directory(disk[root:root + roots * 32])
    return files, {"partitionType": entry[4], "startSector": lba, "sectors": sectors,
                   "bytesPerSector": bps, "sectorsPerCluster": spc, "fatCopies": fats,
                   "fatCopiesEqual": True, "clusterCount": cluster_count}


def decode(data, filename=b"CAR.EGA"):
    # CAR.EXE module offsets $0049–$0057 seed DI with the filename's byte sum.
    # $0086–$0092 XOR each byte with DI's high byte, then DI = 5*DI + 1.
    state = sum(filename)
    result = bytearray(data)
    for i in range(len(result)):
        result[i] ^= state >> 8
        state = (state * 5 + 1) & 0xffff
    return bytes(result)


def listing(path, data, ranges):
    try:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_16
    except ImportError:
        return False
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    md.skipdata = True
    lines = ["; Module-relative 16-bit x86 offsets. Linear listing: includes embedded data.",
             "; Relative branch targets printed above 0xffff wrap to 16 bits."]
    for start, end in ranges:
        lines.append(f"\n; Range {start:04x}–{end - 1:04x}")
        lines.extend(f"{i.address:04x}: {i.bytes.hex():22} {i.mnemonic:8} {i.op_str}"
                     for i in md.disasm(data[start:end], start))
    path.write_text("\n".join(lines) + "\n")
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--image", type=Path, default=ROOT / "original/Stunt.img")
    parser.add_argument("--output", type=Path, default=ROOT / "analysis/dos")
    args = parser.parse_args()
    disk = args.image.read_bytes()
    files, volume = extract_fat16(disk)
    out = args.output
    out.mkdir(parents=True, exist_ok=True)
    for name, data in files.items():
        path = out / "files" / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
    loader = files["CAR.EXE"]
    payload = decode(files["CAR.EGA"])
    assert decode(payload) == files["CAR.EGA"], "Encoding round trip failed"
    header = mz(payload)
    (out / "CAR-decoded.exe").write_bytes(payload)
    manifest = {"image": {"file": args.image.name, "bytes": len(disk), "sha256": sha(disk)},
                "volume": volume,
                "files": [{"name": name, "bytes": len(data), "sha256": sha(data)}
                          for name, data in sorted(files.items())],
                "loaderMZ": mz(loader),
                "decoded": {"file": "CAR-decoded.exe", "bytes": len(payload),
                            "sha256": sha(payload), "mz": header},
                "amigaMatches": []}
    asset_manifest = ROOT / "public/assets/manifest.json"
    if asset_manifest.exists():
        am = json.loads(asset_manifest.read_text())
        source = (ROOT / "original" / am["disk"]["file"]).read_bytes()
        assert sha(source) == am["disk"]["sha256"]
        start = am["payload"]["offset"] + 0x10882
        shared = source[start:start + 0xf00]
        p = payload.find(shared)
        manifest["amigaMatches"].append({"asset": "geometry-tracks-and-league-values",
                                          "bytes": len(shared), "sha256": sha(shared),
                                          "identical": p >= 0,
                                          "dosFileOffset": p if p >= 0 else None})
        for record in am["assets"]:
            if not record["file"].startswith(("track-", "recovery-template")):
                continue
            start, length = record["diskOffset"], record["sourceBytes"]
            data = source[start:start + length]
            assert sha(data) == record["sha256"]
            p = payload.find(data)
            manifest["amigaMatches"].append({"asset": record["file"], "bytes": length,
                                              "sha256": sha(data), "identical": p >= 0,
                                              "dosFileOffset": p if p >= 0 else None})
    listing(out / "loader-x86.asm", loader[mz(loader)["headerParagraphs"] * 16:], [(0, 2), (0x38, 0xef)])
    # CS:0000 starts at file $200; DS is module+$9d80 in this executable.
    manifest["disassembly"] = listing(out / "game-x86.asm", payload[header["headerParagraphs"] * 16:], [(0, 0x9d80)])
    (out / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(json.dumps({"image": manifest["image"], "files": [r["name"] for r in manifest["files"]],
                      "decoded": manifest["decoded"], "amigaMatches": manifest["amigaMatches"]}, indent=2))


if __name__ == "__main__":
    main()
