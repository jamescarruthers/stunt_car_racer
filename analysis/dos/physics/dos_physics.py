"""Headless execution of the supplied DOS game's original player physics.

Inputs: 1 accelerate, 2 brake/reverse, 4 right, 8 left, 16 boost/fire.
Each step is one original update. World conversion only reads the native state;
Python does not calculate forces or overwrite a simulated car pose.
"""
import math
from dos_cpu import Machine, DATA, signed


class DosPhysics(Machine):
    def __init__(self, track=0, super_league=False, calibration=0x646f, source="extracted"):
        if not 0 <= track < 8:
            raise ValueError("track must be 0..7")
        if not 0x646f <= calibration <= 0xffff:
            raise ValueError("calibration must remain within the original 0x646f..0xffff range")
        super().__init__(source=source)
        self.track = track
        self.ticks = 0
        self.calibration = calibration
        self.calibrate(calibration)
        self.put(0x5627, 11 if super_league else 0)
        self.put(0x568a, track)
        self.call(0x25de, bx=track)
        self.call(0x5f85)
        # Native race clearing, league values, PRNG setup, initial boost and
        # roll lookup generation. The latter is essential for body transforms.
        self.call(0x41c1)
        self.put(0x5481, 255)
        self.put(0x5679, 0)
        self.put(0x4a70, 0x80)
        self.call(0x13bf)
        self.recover(self.get(0x5672))
        # $3ff5 primes contacts/transforms once more before $400e enables
        # forces. Recovery inside an existing race retains the enabled flag.
        self.call(0x81e0)
        self.locate()
        self.put(0x5413, 0x80)

    def recover(self, section):
        if not 0 <= section < self.get(0x5671):
            raise ValueError("invalid recovery section")
        self.call(0x3980, bx=section)
        self.locate()

    def locate(self):
        # Includes adjacent-map lookup, road coordinates, off-road flags and
        # saved recovery section. Stop before opponent AI and world drawing.
        self.call(0x65a0, stop=(0x6629, 0x66dd))

    def step(self, controls=0):
        if controls & ~31:
            raise ValueError("controls must be a five-bit original input mask")
        self.put(0x8b2, controls)
        # Inputs are supplied as the original joystick bit layout; bypass the
        # keyboard-specific accelerate/fire remapping by selecting that mode.
        self.put(0x8c5, 0, 2)
        self.call(0x42df)
        self.call(0x81e0)
        self.locate()
        self.call(0x13bf)
        self.call(0x1c10, stop=0x1c23)
        self.ticks += 1
        return self.state()

    def state(self):
        def vector(low, step=3, width=2):
            return [signed(sum(self.get(low + i + step * j) << (8 * j)
                               for j in range(width)), width * 8) for i in range(3)]
        raw = {"tick": self.ticks, "position": vector(0x530c, width=3),
                "velocity": vector(0x5315, step=6), "angles": vector(0x532d),
                "angularVelocity": vector(0x5318, step=6),
                "speed": signed(self.get(0x5362) | (self.get(0x5365) << 8)),
                "section": self.get(0x5480), "chains": self.get(0x4ae1),
                "contact": bool(self.get(0x4b26)), "offRoad": self.get(0x4b27),
                "boostBCD": self.get(0x5677)}
        raw["world"] = {"x": raw["position"][0] / 512, "y": raw["position"][1] / 1024,
                        "z": raw["position"][2] / 512,
                        **{k: v * math.tau / 65536 for k, v in zip(("pitch", "yaw", "roll"), raw["angles"])}}
        return raw

    def raw_state(self):
        """Snapshot all 64 KiB of original DS, including tables and native state."""
        return bytes(self.u.mem_read(DATA, 65536))

    @property
    def nominal_tick_seconds(self):
        # Original BCD game-clock increment and fractional hundredths at DS:22.
        bcd = self.get(0x22)
        return ((bcd >> 4) * 10 + (bcd & 15) + self.get(0x23) / 256) / 100
