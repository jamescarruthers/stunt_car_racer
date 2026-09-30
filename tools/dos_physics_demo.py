#!/usr/bin/env python3
"""Run the extracted DOS car core; optionally save every original tick as JSON."""
import argparse
import json
from pathlib import Path
from dos_physics import DosPhysics


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--track", type=int, default=0, choices=range(8))
    parser.add_argument("--super", action="store_true", dest="super_league")
    parser.add_argument("--calibration", type=lambda s: int(s, 0), default=0x646f)
    parser.add_argument("--ticks", type=int, default=500)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.ticks < 0:
        parser.error("--ticks must be nonnegative")
    physics = DosPhysics(args.track, args.super_league, args.calibration)
    states = [physics.state()]
    landed = False
    for _ in range(args.ticks):
        if not states[-1]["chains"] and states[-1]["contact"]:
            landed = True
        states.append(physics.step(17 if landed else 16))
    result = {"track": args.track, "superLeague": args.super_league,
              "calibration": args.calibration, "nominalTickSeconds": physics.nominal_tick_seconds,
              "states": states}
    if args.output:
        args.output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"ticks": args.ticks, "nominalTickSeconds": physics.nominal_tick_seconds,
                      "first": states[0], "last": states[-1], "output": str(args.output) if args.output else None}, indent=2))


if __name__ == "__main__":
    main()
