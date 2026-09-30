"""16-bit real-mode CPU adapter for the supplied Stunt Car Racer executable."""
import hashlib
import json
import struct
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INSN, UC_HOOK_INTR, UC_HOOK_CODE
from unicorn.x86_const import *

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
PACKAGE = HERE if (HERE / "physics.bin").is_file() else ROOT / "analysis/dos/physics"
OUT = PACKAGE.parent
EXE = (OUT / "CAR-decoded.exe").read_bytes() if (OUT / "CAR-decoded.exe").is_file() else b""
BASE = 0x10000
DATA = BASE + 0x9d80


def relocated(exe, segment):
    paragraphs = struct.unpack_from("<H", exe, 8)[0]
    count = struct.unpack_from("<H", exe, 6)[0]
    table = struct.unpack_from("<H", exe, 24)[0]
    body = bytearray(exe[paragraphs * 16:])
    for i in range(count):
        off, seg = struct.unpack_from("<HH", exe, table + i * 4)
        address = seg * 16 + off
        value = struct.unpack_from("<H", body, address)[0]
        struct.pack_into("<H", body, address, (value + segment) & 0xffff)
    return bytes(body)


class Machine:
    def __init__(self, source="executable"):
        self.u = Uc(UC_ARCH_X86, UC_MODE_16)
        self.u.mem_map(0, 0x100000)
        if source == "executable":
            manifest = json.loads((OUT / "manifest.json").read_text())
            assert hashlib.sha256(EXE).hexdigest() == manifest["decoded"]["sha256"]
            payload = relocated(EXE, BASE >> 4)
        elif source == "extracted":
            package = json.loads((PACKAGE / "manifest.json").read_text())
            assert package["format"] == "scr-dos-physics-v1"
            raw = (PACKAGE / "physics.bin").read_bytes()
            assert hashlib.sha256(raw).hexdigest() == package["payload"]["sha256"]
            assert len(raw) == package["payload"]["bytes"] == 0x19d80
            payload = bytearray(raw)
            for address in package["relocationWordOffsets"]:
                value = struct.unpack_from("<H", payload, address)[0]
                struct.pack_into("<H", payload, address, (value + (BASE >> 4)) & 65535)
            payload = bytes(payload)
        else:
            raise ValueError("source must be 'executable' or 'extracted'")
        self.u.mem_write(BASE, payload)
        for name, value in [("CS", BASE >> 4), ("DS", DATA >> 4), ("ES", DATA >> 4),
                            ("SS", 0x7000), ("EFLAGS", 0x202)]:
            self.u.reg_write(globals()["UC_X86_REG_" + name], value)
        self.io = set()
        self.u.hook_add(UC_HOOK_INSN, self._input, None, 1, 0, UC_X86_INS_IN)
        self.u.hook_add(UC_HOOK_INSN, self._output, None, 1, 0, UC_X86_INS_OUT)
        self.u.hook_add(UC_HOOK_INTR, self._interrupt)

    def _input(self, u, port, size, _):
        if port != 0x61:
            raise RuntimeError(f"Unsupported hardware read {port:04x}")
        self.io.add(("in", port, size))
        return 0

    def _output(self, u, port, size, value, _):
        if port not in (0x61, 0x3c4, 0x3ce):
            raise RuntimeError(f"Unsupported hardware write {port:04x}")
        self.io.add(("out", port, size))

    def _interrupt(self, u, number, _):
        raise RuntimeError(f"Unexpected interrupt {number:x} at {u.reg_read(UC_X86_REG_IP):04x}")

    def get(self, address, size=1):
        return int.from_bytes(self.u.mem_read(DATA + address, size), "little")

    def put(self, address, value, size=1):
        self.u.mem_write(DATA + address, (value & ((1 << (size * 8)) - 1)).to_bytes(size, "little"))

    def call(self, address, stop=0xfff0, **registers):
        self.u.reg_write(UC_X86_REG_SP, 0xfffc)
        self.u.mem_write(0x7fffc, b"\xf0\xff")
        for name, value in registers.items():
            self.u.reg_write(globals()["UC_X86_REG_" + name.upper()], value & 65535)
        stops = (stop,) if isinstance(stop, int) else stop
        hooks = []
        try:
            if len(stops) > 1:
                hooks = [self.u.hook_add(UC_HOOK_CODE, lambda u, a, s, d: u.emu_stop(),
                                         begin=BASE + pc, end=BASE + pc) for pc in stops]
            self.u.emu_start(BASE + address, BASE + stops[0], count=2000000)
            assert self.u.reg_read(UC_X86_REG_IP) in stops, f"Instruction limit at {self.u.reg_read(UC_X86_REG_IP):04x}, called {address:04x}"
        finally:
            for hook in hooks:
                self.u.hook_del(hook)
        return self.u.reg_read(UC_X86_REG_AX)

    def calibrate(self, coefficient):
        self.put(0x20, coefficient, 2)
        self.call(0x1aa)


def signed(value, bits=16):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value
