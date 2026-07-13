# SPEC: Rotating Kitchen Jar Tray

Status: Approved

## Purpose

Create an editable OpenSCAD design for a fully 3D-printed rotating kitchen tray for jars.

## Requested Behavior

The user requested a new design for a rotating kitchen tray for jars with:

- 240 mm diameter,
- 30 mm total exterior wall height,
- a rotating mechanism described as a giro,
- all parts 3D printed.

## Scope

- Add one standalone OpenSCAD source file for the tray.
- Model the tray bowl, rotating base, individually retained printed rollers, center pivot, and retaining cap.
- Keep all user-adjustable variables near the top of the file.
- Add render modes for assembly, individual printable parts, and printable layout.
- Update `README.md` with design behavior, render modes, assumptions, and print notes.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- Purchased bearings, screws, washers, metal axles, or other non-printed hardware.
- Dishwasher, food-contact, or load-rating certification.
- Physical print testing or slicer validation.
- Changes to existing Raspberry Pi, HAT, or enclosure designs.

## Definitions

- Giro: interpreted as a fully printed lazy-susan style rotating mechanism.
- Printed thrust bearing: a base race, loose printed rollers, and an underside tray race that support rotation around a vertical axis.
- Tray wall height: the exterior bowl wall height above the tray floor, not including the underside bearing race.

## Inputs And Constraints

- Tray outside diameter: 240.0 mm.
- Tray exterior wall height: 30.0 mm.
- All rotating-mechanism parts must be printable geometry.
- OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- No external OpenSCAD library dependencies.
- Keep generated mesh exports out of source control.
- Maintain Bambu Lab-friendly printable orientation by default.

## Deterministic Behavior Delivered

- `designs/rotating_kitchen_jar_tray.scad` defines a 240.0 mm diameter tray bowl by default.
- `tray_wall_height_mm` defaults to 30.0 mm.
- The rotating mechanism is a printed giro/lazy-susan thrust-bearing stack:
  - base ring with 12 individual radial roller cradles by default,
  - one loose printed cylindrical roller retained in each cradle,
  - underside race integrated into the tray,
  - full-height printed center post joined to the base floor,
  - printed retaining cap.
- The base roller cradles prevent the rollers from drifting circumferentially around the base while allowing them to rotate about their radial axes.
- The base inner recess does not subtract the center post; the post and base floor form one printable part.
- The top tray, rollers, and retaining cap geometry remain unchanged by the base-ring correction.
- No non-printed hardware is modeled or required by the default design.
- `render_mode = "assembly"` shows the assembled stack.
- `render_mode = "top_tray"` shows the top tray printable part oriented on the print plane.
- `render_mode = "base_ring"` shows the base ring printable part.
- `render_mode = "roller"` shows one loose roller printable part.
- `render_mode = "retaining_cap"` shows the center cap printable part.
- `render_mode = "printable_layout"` separates the tray, base ring, retaining cap, and rollers on the print plane.
- Unsupported render modes fail with an assertion rather than silently falling back.
- The README documents the file, assumptions, parameters, render modes, fit notes, and inspection checklist.

## Assumptions

- The user's term "giro" means a rotating lazy-susan style mechanism rather than an electronic gyroscope.
- A printed roller thrust bearing is an acceptable fully 3D-printed rotating mechanism.
- The 30 mm height requirement applies to the tray's exterior bowl wall; the underside race adds additional part height below the tray floor.
- The tray is intended for jars and kitchen storage loads, not for standing loads, heavy appliances, or high-speed rotation.
- Roller-cradle clearance, roller smoothness, and retaining-cap fit will require physical tuning after test printing.

## Impact

- Adds one new design source file.
- Updates README discoverability and usage notes.
- Does not alter existing designs.
- Does not add generated mesh files.

## Validation Performed

- `git diff --check`
- bounded OpenSCAD renders for `base_ring`, `top_tray`, `roller`, `retaining_cap`, `assembly`, and `printable_layout`, each reporting `Simple: yes`
- Corrected `base_ring` STL render completed in 1.079 seconds and reported `Simple: yes`
- `git diff --check` after the base-ring correction

## Validation Skipped

- Slicer inspection and physical test printing were not performed.
- QA and code review phases were skipped by the requested `super-agent` workflow.

## Documentation Changes

- `README.md` now lists and documents `designs/rotating_kitchen_jar_tray.scad`.
