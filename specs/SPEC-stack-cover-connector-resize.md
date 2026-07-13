# SPEC: Stack Cover Connector Resize

Status: Approved

## Purpose

Document the completed direct update that makes the Raspberry Pi 5 AI HAT+ enclosure and Pi Zero USB Grove IR enclosure use larger, less fragile top-cover male pins and tray-side female sockets similar to the proven Pi 5 five-stack cover interface.

## Requested Behavior

- Update `designs/rpi5_ai_hat_plus_26t_enclosure.scad` to use five-stack-style connector sizing for the top-cover-to-tray interface.
- Update `designs/pi_zero_usb_grove_ir_enclosure.scad` to use similar larger connector sizing.
- Preserve enough internal room for the PCB stacks.

## Scope

- Change only the top-cover male pin and tray female socket sizing defaults needed for the requested fit improvement.
- Keep the existing connector count, render modes, board stack placement, PCB dimensions, port openings, ventilation, and IR PCB mount behavior.
- Update README documentation for the changed defaults.

## Out Of Scope

- Generated mesh exports.
- Physical test-print validation.
- Slicer validation.
- A new latch, snap-fit, screw, or non-round connector design.
- Relocating the PCB stacks or changing component/cable clearances beyond what is needed to preserve PCB room after enlarging the connector interface.

## Inputs And Constraints

- The proven Pi 5 five-stack interface uses:
  - `cover_pin_diameter_mm = 5.0`
  - `cover_pin_insertion_length_mm = 5.2`
  - `cover_pin_root_diameter_mm = 7.6`
  - `tray_socket_clearance_mm = 0.35`
  - `tray_socket_depth_mm = 5.6`
  - `tray_socket_receiver_diameter_mm = 8.0`
- The Raspberry Pi 5 AI HAT+ enclosure already places connector centers in corner receiver-boss regions outside the default PCB clearance envelope.
- The Pi Zero enclosure uses wall-integrated sockets rather than separate receiver bosses, so its wall thickness must provide enough material around the enlarged socket holes without shrinking the internal PCB envelope.

## Deterministic Behavior Delivered

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad` now defaults to:
  - `cover_pin_diameter_mm = 5.0`
  - `cover_pin_insertion_length_mm = 5.2`
  - `cover_pin_root_diameter_mm = 7.6`
  - `tray_socket_clearance_mm = 0.35`
  - `tray_socket_depth_mm = 5.6`
  - `tray_socket_receiver_diameter_mm = 8.0`
- `designs/pi_zero_usb_grove_ir_enclosure.scad` now defaults to:
  - `wall_thickness_mm = 8.0`
  - `cover_pin_diameter_mm = 5.0`
  - `cover_pin_insertion_length_mm = 5.2`
  - `cover_pin_offset_x_mm = 41.5`
  - `cover_pin_offset_y_mm = 30.9`
  - `tray_socket_clearance_mm = 0.35`
  - `tray_socket_depth_mm = 5.6`
  - `tray_socket_hole_diameter_mm = cover_pin_diameter_mm + 2 * tray_socket_clearance_mm`
- The Pi Zero internal PCB clearance dimensions remain derived from `board_length_mm`, `board_width_mm`, bridge clearance, and board clearances. Increasing `wall_thickness_mm` grows the outside envelope instead of reducing internal PCB room.

## Assumptions

- "rpi5 ei enclosure" refers to `designs/rpi5_ai_hat_plus_26t_enclosure.scad`.
- "Similar male and female connector sizes" means matching the five-stack connector proportions closely enough to reuse the 5.0 mm pin, 5.2 mm insertion, 0.35 mm radial clearance, and 5.6 mm socket-depth defaults.

## Impact

- The AI HAT+ enclosure connector interface is stronger and closer to the printed-good five-stack interface.
- The Pi Zero enclosure has a larger outside footprint because the wall grows from 6.0 mm to 8.0 mm to keep the larger sockets supported while preserving internal PCB clearance.
- Existing generated meshes, if any exist outside source control, should be regenerated from the updated SCAD sources before printing.

## Validation Performed

- Source inspection of the changed connector defaults.
- `git diff --check`.

## Validation Skipped

- OpenSCAD render/export validation was skipped because the `super-agent` workflow only runs validation expected to complete within 10 seconds, and render timing is uncertain for these enclosure models.
- Slicer inspection, physical fit validation, and test prints were not performed.

## Documentation Changes

- Updated `README.md` to document the enlarged AI HAT+ connector defaults.
- Updated `README.md` to document the enlarged Pi Zero connector defaults and wall-thickness rationale.
