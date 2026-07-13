# PLAN: Stack Cover Connector Resize

Status: Approved

## Spec Reference

- `specs/SPEC-stack-cover-connector-resize.md`

## Affected Files

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`
- `specs/SPEC-stack-cover-connector-resize.md`
- `specs/PLAN-stack-cover-connector-resize.md`

## Implementation Steps Performed

1. Loaded the `super-agent` skill and proceeded directly after the user explicitly requested `$super-agent`.
2. Loaded workspace and repository instructions from the current prompt and `/home/alexbanica/workspace.md`.
3. Inspected branch and worktree state.
4. Located the proven Pi 5 five-stack cover connector defaults in `designs/pi5_five_stack_enclosure.scad`.
5. Updated `designs/rpi5_ai_hat_plus_26t_enclosure.scad` from smaller 3.2 mm pins and 7.0 mm receivers to five-stack-style 5.0 mm pins, 5.2 mm insertion, 7.6 mm roots, 0.35 mm socket clearance, 5.6 mm socket depth, and 8.0 mm receiver bosses.
6. Updated `designs/pi_zero_usb_grove_ir_enclosure.scad` from smaller 3.0 mm pins to 5.0 mm pins and changed socket diameter derivation to use 0.35 mm radial clearance.
7. Increased the Pi Zero enclosure wall thickness from 6.0 mm to 8.0 mm and moved the pin/socket centers to the new wall centers so the larger sockets preserve internal PCB clearance while retaining surrounding wall material.
8. Updated `README.md` with the new connector defaults and Pi Zero wall-thickness rationale.
9. Added these auto-approved completed-work artifacts.

## Validation Run

- Targeted `rg` source checks for the enlarged connector defaults and socket diameter derivation.
- `git diff --check`.

## Validation Skipped

- OpenSCAD render/export validation was skipped because the direct `super-agent` workflow limits validation to commands expected to complete within 10 seconds.
- Slicer inspection, physical fit validation, and test prints were not performed.
- QA phase skipped by `super-agent` design.
- Code-review phase skipped by `super-agent` design.

## Documentation Updates

- `README.md` now documents the AI HAT+ five-stack-style connector sizing defaults.
- `README.md` now documents the Pi Zero 5.0 mm pin defaults, 5.7 mm socket holes, and 8.0 mm wall thickness used to preserve PCB room.

## Commit Status

- Not committed.

## Push Status

- Not pushed.

## Residual Risk

- Physical friction fit still depends on printer, filament, slicer settings, and part orientation.
- The larger Pi Zero outside envelope may affect tight external mounting spaces, although internal PCB clearance is preserved.
- Final confidence still requires OpenSCAD visual inspection, slicer review, and a test print.
