# SPEC: Seeed Grove Base Hat for Raspberry Pi Zero OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD reference model for the Seeed Studio Grove Base Hat for Raspberry Pi Zero.

The design will provide a reusable mechanical fit and clearance reference for stacked Raspberry Pi Zero assemblies, enclosures, and connector clearance planning.

## Problem Statement

The repository has reusable Raspberry Pi reference models and a Waveshare HAT reference, but the Seeed Grove Base Hat for Raspberry Pi Zero reference has been removed from the current worktree. Existing and future Pi Zero enclosure designs that include this HAT need a deterministic `.scad` source for the board outline, mounting holes, GPIO passthrough, Grove sockets, SWD/debug header, and component clearance without relying on generated mesh files or external OpenSCAD libraries.

The default Grove connector layout must reflect the user's image-derived coordinate estimates rather than the older over-modeled layout.

## Scope

- Add one editable OpenSCAD source file for the Seeed Grove Base Hat for Raspberry Pi Zero reference design.
- Model the HAT board outline, thickness, rounded corners, four Pi Zero-compatible mounting holes, 40-pin GPIO passthrough/header reference, underside GPIO socket/receptacle clearance block, Grove socket clearance blocks, SWD/debug header reference, component clearance blocks, and simple silkscreen/label reference markers.
- Use the user's estimated Grove connector coordinate table as the default visible Grove layout:
  - `UART`: `(9.4, 12.6)`,
  - `A3/A4`: `(17.8, 12.6)`,
  - `I2C`: `(9.6, 28.6)`,
  - `A2`: `(17.8, 28.3)`,
  - `D16`: `(9.6, 44.7)`,
  - `D26`: `(17.8, 44.1)`,
  - `D5`: `(9.6, 59.9)`,
  - `D6`: `(17.8, 59.1)`.
- Include adjustable parameters that allow later physical calibration of connector centers, connector body dimensions, board dimensions, mounting holes, GPIO position, SWD/debug position, and component clearances.
- Include a Pi Zero-style 40-pin GPIO passthrough/header reference placed similarly to `designs/pi_zero.scad`.
- Include an underside GPIO receptacle/socket clearance block where the Raspberry Pi Zero HAT pins enter the Grove HAT.
- Include render modes for:
  - full assembly/reference preview,
  - HAT-only reference preview,
  - connector/component clearance preview,
  - printable or separated fit-check layout for visual inspection.
- Include independent visibility controls for electronics/components, GPIO header/reference, Grove connector labels, and optional Pi Zero reference geometry.
- Use `designs/pi_zero.scad` as the optional Raspberry Pi Zero fit reference rather than duplicating the Pi Zero model.
- Keep all user-adjustable dimensions near the top of the file in grouped `Adjustable Parameters`.
- Keep derived values in a separate `Derived Values` section.
- Update `README.md` with the design file, assumptions, parameters, render modes, source references, coordinate basis, fit notes, and validation checklist entries.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every trace, silkscreen detail, chip package, or plastic connector feature.
- A precise PCB manufacturing model.
- Sub-millimeter enclosure validation before physical measurement.
- An enclosure for the HAT.
- Electrical behavior, software setup, firmware flashing, or Grove module compatibility validation.
- Changes to `designs/pi_zero.scad` except using it from the new child design.
- External OpenSCAD library dependencies.
- OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

## Definitions

- HAT: Seeed Studio Grove Base Hat for Raspberry Pi Zero, SKU `103030276`.
- Grove socket: a 4-pin Grove connector represented as an adjustable clearance volume for the connector body.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and enclosure planning, not a certified vendor mechanical model.
- User connector coordinate system: image-derived 2D coordinate table where X and Y are in millimeters from the bottom-left PCB corner, the board is 30 mm wide along X and 65 mm tall along Y, and `UART` is at `(9.4, 12.6)`.
- HAT coordinate system: origin at the board center on the PCB bottom face, X along the 30 mm board width, Y along the 65 mm board length, and Z upward from the PCB bottom face.

## Research Sources

- Seeed Studio wiki page: https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi_Zero/
- Seeed Studio product page: https://www.seeedstudio.com/Grove-Base-Hat-for-Raspberry-Pi-Zero.html
- User-provided image-derived Grove connector estimates in this planning thread.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- Default HAT dimensions must use published/product-derived Pi Zero HAT assumptions:
  - board length: 65.0 mm,
  - board width: 30.0 mm,
  - overall height envelope: 20.0 mm.
- Default board thickness must be an adjustable 1.6 mm common PCB reference unless a measured value is approved later.
- Default mounting hole positions must use Raspberry Pi Zero-compatible positions from `designs/pi_zero.scad`:
  - hole centers 3.5 mm from board edges,
  - hole-center span 58.0 mm lengthwise and 23.0 mm widthwise.
- Default mounting hole diameter must be adjustable and compatible with common Pi Zero M2.5 mounting hardware.
- The HAT must expose a 40-pin GPIO passthrough/header reference compatible with the Raspberry Pi pin pattern and placed similarly to the `designs/pi_zero.scad` reference:
  - 20 columns by 2 rows,
  - 2.54 mm pitch,
  - X positions centered across the same 40-pin span used by `pi_zero_gpio_pin_x_mm`,
  - Y positions aligned to the Pi Zero GPIO header edge using the same mounting-hole-derived relationship as `pi_zero_gpio_pin_y_mm`,
  - adjustable pad/hole/pin dimensions,
  - adjustable option to show pins above the HAT board, below the HAT board, or hidden.
- The HAT must include an underside GPIO receptacle/socket clearance block:
  - aligned to the same Pi Zero-style 40-pin header grid,
  - positioned below the HAT PCB where the Pi Zero header pins enter the HAT,
  - adjustable in X/Y/Z size and Z offset,
  - independently visible as part of the GPIO reference,
  - shaped as a simplified rectangular clearance volume unless future measurement justifies a more detailed socket model.
- Public product/wiki facts to model as simplified, adjustable clearance features:
  - Grove interfaces for I2C, UART, Digital, Analog, and PWM-class expansion where visible or user-estimated,
  - SWD/debug interface,
  - 3.3 V Grove operation note for documentation.
- Because the researched public page does not provide exact Grove socket center coordinates, all Grove socket positions must be adjustable defaults based on the user's image-derived estimates.
- The default Grove socket coordinate table must use the user's estimated centers:
  - `UART`: `(9.4, 12.6)`,
  - `A3/A4`: `(17.8, 12.6)`,
  - `I2C`: `(9.6, 28.6)`,
  - `A2`: `(17.8, 28.3)`,
  - `D16`: `(9.6, 44.7)`,
  - `D26`: `(17.8, 44.1)`,
  - `D5`: `(9.6, 59.9)`,
  - `D6`: `(17.8, 59.1)`.
- Default Grove connector body dimensions must be adjustable and initially use:
  - body width: 8.0 mm,
  - body length: 10.0 mm,
  - body height: 8.0 mm.
- The default `UART` connector center note must be documented as approximately `(9.4, 12.6)` in the user connector coordinate system.
- The default UART cutout guidance for printed-case planning must be documented as an adjustable 11.0 mm x 9.0 mm clearance around the connector center.
- The OpenSCAD implementation must transform the user connector coordinate table into the HAT coordinate system through adjustable origin/offset parameters, so the table remains readable and calibratable.
- Connector and component models may be simplified rectangular or rounded clearance volumes when exact cosmetic shape is unnecessary for fit-checking.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the HAT reference with optional Pi Zero reference, Grove sockets, GPIO header/reference, SWD/debug header, component blocks, and labels according to the visibility toggles.
- `render_mode = "hat"` displays only the HAT PCB and mounting/reference holes with optional GPIO reference.
- `render_mode = "connectors"` displays the HAT with Grove/socket/component clearance features emphasized for enclosure planning.
- `render_mode = "printable_layout"` displays the HAT reference and optional Pi Zero reference separated for visual inspection; it must not imply generated printable parts are being committed.
- `show_electronics` controls Grove sockets, SWD/debug header, component blocks, LEDs, and other component previews without hiding the PCB or mounting holes.
- `show_gpio_header` controls the GPIO passthrough/header reference independently from other component previews, including whether the pin preview is above the board, below the board, or hidden.
- `show_gpio_socket_clearance` controls the underside GPIO receptacle/socket clearance block independently from the Grove and component previews.
- `show_grove_labels` controls simple text labels for Grove socket groups independently from connector bodies.
- `show_pi_zero_reference` controls importing and showing the reusable Pi Zero reference model for stack/fit context.
- The board outline must render as a 65 mm x 30 mm PCB with rounded corners and four Pi Zero-compatible mounting holes.
- The GPIO passthrough/header area must be visible as a Pi Zero-aligned 20 x 2 row of metallic through-hole/pad references along the appropriate long edge.
- The underside GPIO socket/receptacle clearance block must be shown below the HAT PCB by default, aligned with the GPIO header grid, so enclosure stack clearance can account for where the Pi Zero header enters the HAT.
- The Grove connector reference must show exactly the eight default user-estimated sockets:
  - bottom row: `UART`, `A3/A4`,
  - row 2: `I2C`, `A2`,
  - row 3: `D16`, `D26`,
  - top row: `D5`, `D6`.
- The default Grove connector grid must preserve the calibrated user-estimated pitch range:
  - about 8.2 mm to 8.4 mm horizontal center-to-center spacing between columns,
  - about 15.5 mm to 16.0 mm vertical center-to-center spacing between adjacent rows.
- Grove socket bodies must be adjustable independently, so physical measurements can be applied without changing module code.
- The source must document that the default socket centers are image-derived estimates and should be tuned after direct physical measurement for precise enclosure work.
- The model must remain usable as a child design reference through `use <...>` and named module calls.

## Assumptions

- The HAT uses the Raspberry Pi Zero board footprint because the product is explicitly for Raspberry Pi Zero-class use.
- The Pi Zero mounting-hole positions in `designs/pi_zero.scad` are the repository authority for this HAT's default fit reference.
- A simplified rectangular connector/component clearance model is acceptable for enclosure and stack planning.
- The user's image-derived connector table is more relevant to this requested model than the older committed Seeed model's default socket layout.
- The `A3/A4`, `D26`, and `D6` labels are accepted as the intended visible labels for this default coordinate table, even if public Seeed text or prior repository docs used different label sets.
- The new design should be standalone rather than folded into the existing Pi Zero reference because repository instructions reserve `designs/pi_zero.scad` as a reusable base reference for child designs.

## Impact And Regression Considerations

- The new `.scad` file must not change existing Pi Zero, Raspberry Pi 5, Waveshare HAT, or enclosure design behavior.
- The current worktree has staged deletions for the previous Seeed design/spec/plan. Planning must create/update only the requested spec until approval gates are satisfied, and implementation must not revert unrelated user changes.
- README validation examples must not instruct agents to run OpenSCAD locally as required validation; they may list optional commands for users with OpenSCAD installed, consistent with the current README style.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro print guidance by using printable-friendly clearances and avoiding generated mesh files.

## Acceptance Criteria

- A new `designs/seeed_grove_base_hat_zero.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file uses `use <pi_zero.scad>` when showing an optional Pi Zero reference.
- The file provides named modules for the full reference, HAT board, GPIO reference, Grove connector previews, component previews, labels, optional Pi Zero stack preview, printable/fit-check layout, and helper geometry.
- Default board dimensions match the required values: 65.0 mm x 30.0 mm board footprint and 20.0 mm overall height envelope.
- Default mounting-hole positions match Pi Zero-compatible positions from the repository reference: 3.5 mm edge offsets and 58.0 mm x 23.0 mm hole-center span.
- Render modes include `assembly`, `hat`, `connectors`, and `printable_layout`.
- Visibility toggles independently control electronics/components, GPIO header/reference, Grove labels, and optional Pi Zero reference.
- GPIO passthrough/header placement matches the Pi Zero reference pin grid and edge relationship, while remaining adjustable for physical calibration.
- Underside GPIO socket/receptacle clearance is present, aligned to the GPIO grid, and adjustable independently from the visible header pins.
- Default Grove connector centers are represented through an adjustable table matching:
  - `UART`: `(9.4, 12.6)`,
  - `A3/A4`: `(17.8, 12.6)`,
  - `I2C`: `(9.6, 28.6)`,
  - `A2`: `(17.8, 28.3)`,
  - `D16`: `(9.6, 44.7)`,
  - `D26`: `(17.8, 44.1)`,
  - `D5`: `(9.6, 59.9)`,
  - `D6`: `(17.8, 59.1)`.
- Default Grove connector bodies use adjustable 8.0 mm x 10.0 mm x 8.0 mm dimensions.
- Default UART printed-case cutout guidance uses an adjustable 11.0 mm x 9.0 mm clearance centered at `(9.4, 12.6)`.
- README documents the new design file, assumptions, source dimensions, coordinate table, render modes, common adjustable parameters, optional OpenSCAD commands, and manual inspection checklist.
- `git diff --check` passes after implementation.
- No generated mesh/export artifacts are added.

## Validation Plan

- Do not run OpenSCAD commands locally.
- Run `git diff --check`.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies,
  - the board outline and holes match researched and repository-reference dimensions,
  - Grove socket groups, cable clearances, SWD/debug header, GPIO reference, and component blocks are independently adjustable,
  - GPIO header/passthrough placement matches the Pi Zero reference pattern and edge relationship,
  - underside GPIO socket/receptacle clearance is present below the board and aligned with the GPIO reference,
  - default Grove socket labels and centers match the approved user-provided coordinate table,
  - the implementation documents the coordinate transform from user connector coordinates to board-centered OpenSCAD coordinates,
  - visibility toggles control the intended groups,
  - README entries match the implemented behavior.

## Documentation Requirements

- Update `README.md` to add `designs/seeed_grove_base_hat_zero.scad` under design files.
- Add a Seeed Grove Base Hat for Raspberry Pi Zero section with component assumptions, adjustable parameters, render modes, source notes, and print/fit notes.
- Document that the default Grove connector coordinates are image-derived estimates and should be physically measured before precision enclosure use.
- Document the default coordinate table and UART printed-case cutout estimate.
- Add optional OpenSCAD commands for the new render modes to the validation checklist.
- Add manual inspection checklist items for the HAT footprint, Grove socket clearances, coordinate transform, and optional Pi Zero stack reference.
- Add manual inspection checklist items for Pi Zero-style GPIO header alignment, above-board and below-board pin preview modes, and underside GPIO socket/receptacle clearance alignment.
