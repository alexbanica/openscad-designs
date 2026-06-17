# SPEC: Grove Infrared Emitter OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD reference model for the Seeed Studio Grove - Infrared Emitter module.

The design will provide a reusable mechanical fit and clearance reference for enclosure planning, Grove cable access, board stacking, and IR LED sightline checks.

## Problem Statement

The repository contains editable OpenSCAD references for Raspberry Pi boards and selected HATs, but it does not include a standalone Grove IR emitter module reference. Future designs that mount or enclose the module need a deterministic `.scad` source that models the PCB, Grove connector, IR LED extension, mounting holes, and component clearance without generated mesh files or external OpenSCAD libraries.

## Scope

- Add one editable OpenSCAD source file for the Grove - Infrared Emitter reference design.
- Model the module PCB outline, thickness, corner radius, mounting holes, Grove connector body and perpendicular cable clearance, IR emitter LED body, LED forward extension, major component clearance blocks, and simple label/reference markers.
- Use the 2026-06-17 user-measured mechanical defaults:
  - PCB width: 20.25 mm,
  - PCB length: 23.75 mm,
  - PCB thickness: 1.6 mm,
  - total top envelope with the Grove male connector installed: 9.65 mm from the PCB bottom,
  - bottom pin protrusion below the PCB: up to 2.0 mm,
  - two screw holes centered on the left and right PCB margins along the board length.
- Preserve the current IR LED behavior: the LED exits the PCB in the existing positive-Y direction and keeps a separate adjustable forward extension beyond the PCB.
- Include adjustable parameters that allow later physical calibration of PCB dimensions, mounting holes, connector placement, IR LED placement, LED extension, component clearances, and visual labels.
- Include render modes for:
  - full assembly/reference preview,
  - PCB-only reference preview,
  - connector and LED clearance preview,
  - printable or separated fit-check layout for visual inspection.
- Include independent visibility controls for electronics/components, Grove connector, IR LED, labels, and clearance/sightline guides.
- Keep all user-adjustable dimensions near the top of the file in grouped `Adjustable Parameters`.
- Keep derived values in a separate `Derived Values` section.
- Update `README.md` with the design file, assumptions, parameters, render modes, source references, fit notes, and validation checklist entries.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every trace, silkscreen detail, resistor, capacitor, or molded plastic connector feature.
- A printable enclosure, holder, bracket, or case for the module.
- Electrical behavior, firmware, IR protocol behavior, Arduino/Raspberry Pi software setup, or signal validation.
- A Grove receiver model.
- Sub-millimeter enclosure validation before physical measurement.
- Changes to existing Raspberry Pi, HAT, or other OpenSCAD reference source files.
- External OpenSCAD library dependencies.
- OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

## Definitions

- Grove IR emitter: Seeed Studio Grove - Infrared Emitter module.
- Grove connector: the 4-pin Grove cable socket represented as an adjustable clearance volume for the connector body and plug/cable access.
- Perpendicular Grove cable clearance: the Grove cable/plug access volume that rises out of the top-mounted connector along the positive Z axis, perpendicular to the PCB plane.
- IR LED extension: the portion of the infrared emitting LED that extends beyond the PCB edge, defaulting to 7.5 mm beyond the PCB.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and enclosure planning, not a certified vendor mechanical model.
- Module coordinate system: origin at the board center on the PCB bottom face, X across the board width, Y along the board length, and Z upward from the PCB bottom face. The IR LED points toward the positive Y direction by default.

## Research Sources

- Seeed Studio wiki page: https://wiki.seeedstudio.com/Grove-Infrared_Emitter/
- RobotShop-hosted Grove - Infrared Emitter PDF mirror with detailed mechanical note: https://cdn.robotshop.com/media/s/see/rb-see-184/pdf/grove-infrared-emitter-wls12148p.pdf

## Iteration: 2026-06-17 Measured PCB And Screw-Hole Correction

The user clarified the physical Grove Infrared Emitter module dimensions and mounting-hole count:

- The PCB has exactly two screw holes, not four.
- The two screw holes are located at the centers of the left and right PCB margins along the board length.
- The PCB length is 23.75 mm.
- The PCB width is 20.25 mm.
- The PCB thickness is 1.6 mm.
- The existing LED direction and off-board extension behavior are correct and must be preserved.
- The top envelope from the PCB bottom to the top of the Grove male connector is 9.65 mm total.
- Small pins protrude from the PCB bottom by up to 2.0 mm.

This iteration replaces the earlier public-source default of 20.0 mm x 24.0 mm and the earlier four-hole Grove 20 mm-class mounting-hole assumption. The older public source notes remain useful historical context, but the implementation defaults and README must treat the measured 23.75 mm x 20.25 mm PCB and two-hole layout as authoritative.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- Default module dimensions must use the 2026-06-17 user-measured values:
  - PCB width: 20.25 mm,
  - PCB length: 23.75 mm,
  - PCB thickness: 1.6 mm,
  - total top envelope with the Grove male connector installed: 9.65 mm from the PCB bottom,
  - bottom pin protrusion below the PCB: up to 2.0 mm.
- The IR LED must continue to exit the PCB as in the existing design, pointing toward positive Y by default and retaining a separately adjustable extension beyond the PCB edge.
- The Seeed wiki lists the module size as 20.0 mm x 20.0 mm, and the previous detailed mechanical source was interpreted as 20.0 mm x 24.0 mm plus LED extension. The implementation and README must document that the 2026-06-17 measured 20.25 mm x 23.75 mm PCB with two screw holes supersedes those earlier defaults.
- Default board thickness must be adjustable and set to the measured 1.6 mm value.
- Default board corner radius must be adjustable.
- Mounting holes must be included as exactly two adjustable fit references by default:
  - left screw hole on the left PCB margin,
  - right screw hole on the right PCB margin,
  - both holes centered along the PCB length by default.
- Screw-hole diameter and X edge inset must remain adjustable planning values because the user supplied hole count and centerline placement but did not provide exact hole diameter or edge-inset measurements.
- The Grove connector body must be represented as a simplified adjustable clearance volume near one PCB edge, with separate adjustable cable/plug clearance guidance.
- The Grove connector top envelope must default to a total 9.65 mm height from the PCB bottom, including the 1.6 mm PCB thickness. The connector body height or derived top clearance must be adjusted so the visible connector/reference envelope reaches that total height.
- Bottom-side pin protrusions must be represented as an optional adjustable underside clearance guide extending up to 2.0 mm below the PCB bottom. This guide must be independently controllable with other clearance guides and must not alter the PCB origin definition.
- The Grove cable/plug clearance guide must model the actual cable exit direction as perpendicular to the PCB plane:
  - centered in X/Y on the Grove connector by default,
  - extending upward along positive Z from above the connector body,
  - represented as a simplified adjustable rectangular clearance volume,
  - not represented as a horizontal off-board side-exit clearance unless a future approved spec explicitly adds an alternate cable-routing mode.
- The IR LED must be represented as a simplified LED body with:
  - adjustable diameter,
  - adjustable body length,
  - adjustable center height,
  - adjustable forward extension beyond the PCB edge,
  - optional sightline or beam guide using the public half-intensity angle as a visual reference only.
- The public Seeed wiki lists peak wavelength as 940 nm and half-intensity angle as plus/minus 17 degrees. These facts may be documented and represented only as non-electrical visual context; the model must remain mechanical.
- Connector and component models may be simplified rectangular or cylindrical clearance volumes when exact cosmetic shape is unnecessary for fit-checking.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the full module reference with PCB, mounting holes, Grove connector, IR LED, component clearance blocks, labels, and optional clearance/sightline guides according to visibility toggles.
- `render_mode = "pcb"` displays only the PCB and mounting holes.
- `render_mode = "clearance"` displays the module with Grove connector, perpendicular cable clearance, IR LED extension, component blocks, and sightline/clearance guides emphasized for enclosure planning.
- `render_mode = "printable_layout"` displays the reference and clearance guides separated for visual inspection; it must not imply generated printable parts are being committed.
- `show_electronics` controls component clearance blocks without hiding the PCB or mounting holes.
- `show_grove_connector` controls the Grove connector body and cable/plug clearance guidance independently from other component previews.
- `show_ir_led` controls the IR LED body and forward extension independently from other component previews.
- `show_labels` controls simple text labels independently from connector and LED bodies.
- `show_clearance_guides` controls IR sightline, LED extension envelope, Grove perpendicular cable/plug clearance guides, and bottom pin protrusion clearance guides independently from solid component bodies.
- The board outline must render as a 20.25 mm x 23.75 mm PCB by default.
- The PCB thickness must render as 1.6 mm by default.
- The two screw holes must render on the PCB length centerline, one on the left PCB margin and one on the right PCB margin, using adjustable X edge inset and diameter values.
- The IR LED must point out from the positive Y board edge by default and preserve the existing adjustable extension behavior beyond that edge.
- The full default mechanical envelope must account for the PCB length plus the IR LED extension in positive Y, while keeping PCB dimensions distinct from extension dimensions.
- The Grove connector must be positioned on the board as an adjustable clearance block suitable for cable access planning.
- The Grove connector/reference envelope must reach 9.65 mm above the PCB bottom by default.
- The default Grove cable/plug clearance guide must be a vertical clearance volume over the connector, with its bottom at or above the top of the connector body and its height adjustable.
- The optional bottom pin clearance guide must extend downward from the PCB bottom by up to 2.0 mm by default.
- Mounting-hole diameter and X edge inset must be adjustable, and the source must document that those two values remain planning assumptions until physically measured.
- The model must remain usable as a child design reference through `use <...>` and named module calls.

## Assumptions

- The user's phrase "IR groove emitter" means the Seeed Studio Grove - Infrared Emitter module.
- The requested deliverable is a `.scad` OpenSCAD source file, not a generated mesh export.
- The requested design is a mechanical reference model, not a printable enclosure or holder.
- The 2026-06-17 user-measured dimensions are authoritative for defaults: 20.25 mm x 23.75 mm PCB, 1.6 mm PCB thickness, 9.65 mm total top envelope with the Grove male connector, up to 2.0 mm bottom pin protrusion, and two screw holes on the left/right PCB margins.
- A simplified PCB, connector, LED, and component clearance model is acceptable for enclosure and stack planning.
- Exact screw-hole diameter and edge inset are not treated as certified dimensions unless physically measured later; defaults must remain adjustable and documented as fit-planning assumptions.

## Impact And Regression Considerations

- The new `.scad` file must not change existing Raspberry Pi, HAT, or enclosure design behavior.
- README validation examples must not instruct agents to run OpenSCAD locally as required validation; they may list optional commands for users with OpenSCAD installed, consistent with the current README style.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro print guidance by using printable-friendly clearances and avoiding generated mesh files.
- The repository currently permits direct work on `main` when otherwise unspecified, but implementation must still avoid reverting or committing unrelated worktree changes.

## Acceptance Criteria

- A new `designs/grove_infrared_emitter.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file provides named modules for the full reference, PCB board, mounting holes, Grove connector preview, IR LED preview, component previews, labels, clearance/sightline guides, printable/fit-check layout, and helper geometry.
- Default PCB dimensions are adjustable and set to 20.25 mm x 23.75 mm.
- Default IR LED extension beyond the PCB remains adjustable and preserves the existing design behavior.
- Default board thickness is adjustable and set to 1.6 mm.
- Default total top envelope with the Grove male connector is adjustable and set to 9.65 mm from the PCB bottom.
- Default bottom pin protrusion/clearance is adjustable and set to 2.0 mm maximum below the PCB bottom.
- Render modes include `assembly`, `pcb`, `clearance`, and `printable_layout`.
- Visibility toggles independently control electronics/components, Grove connector, IR LED, labels, and clearance/sightline guides.
- The source documents that the 2026-06-17 measured default supersedes the earlier public-source dimensional defaults.
- The source renders exactly two screw holes by default, centered on the left and right PCB margins along the PCB length.
- Screw-hole diameter and edge inset are adjustable and documented as assumptions until measured.
- Grove connector body, perpendicular cable clearance, IR LED body, IR LED extension, and major component clearance blocks are adjustable.
- Grove connector/reference envelope reaches 9.65 mm above the PCB bottom by default.
- Bottom pin protrusion clearance is represented below the PCB and controlled with clearance guides.
- README documents the new design file, assumptions, source dimensions, render modes, common adjustable parameters, optional OpenSCAD commands, fit notes, and manual inspection checklist.
- `git diff --check` passes after implementation.
- No generated mesh/export artifacts are added.

## Validation Plan

- Do not run OpenSCAD commands locally.
- Run `git diff --check`.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies,
  - the PCB dimensions, PCB thickness, two-hole layout, connector top envelope, bottom pin protrusion, and IR LED extension behavior match the approved defaults,
  - the Grove connector, perpendicular cable clearance, bottom pin protrusion guide, IR LED, component blocks, labels, and clearance guides are independently adjustable and toggleable,
  - the implementation documents source conflicts and physical-measurement caveats,
  - README entries match the implemented behavior,
  - no generated mesh/export artifacts are present.

## Documentation Requirements

- Update `README.md` to add `designs/grove_infrared_emitter.scad` under design files.
- Add a Grove Infrared Emitter section with component assumptions, adjustable parameters, render modes, source notes, and print/fit notes.
- Document the selected default dimensions: 20.25 mm x 23.75 mm PCB, 1.6 mm PCB thickness, 9.65 mm total top envelope with the Grove male connector, and up to 2.0 mm bottom pin protrusion.
- Document that the IR LED exits the PCB as in the existing design and keeps adjustable off-board extension behavior.
- Document that the PCB has two screw holes centered on the left/right PCB margins along the board length, while screw-hole diameter and edge inset remain adjustable until measured.
- Document that the 2026-06-17 measured dimensions supersede the earlier public-source defaults.
- Add optional OpenSCAD commands for the new render modes.
- Add manual inspection checklist items for the PCB footprint, two-hole layout, connector top envelope, bottom pin protrusion clearance, perpendicular Grove connector cable clearance, IR LED extension behavior, and no generated mesh exports.
