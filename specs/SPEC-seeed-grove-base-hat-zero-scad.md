# SPEC: Seeed Grove Base Hat for Raspberry Pi Zero OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD reference model for the Seeed Studio Grove Base Hat for Raspberry Pi Zero.

The design will provide a reusable mechanical fit and clearance reference for stacked Raspberry Pi Zero assemblies, enclosures, Grove cable access, and connector clearance planning.

## Problem Statement

The repository has reusable Raspberry Pi reference models and a Waveshare HAT reference, but it does not have a standalone Seeed Grove Base Hat for Raspberry Pi Zero reference. Existing and future Pi Zero enclosure designs that include this HAT need a deterministic `.scad` source for the board outline, mounting holes, GPIO passthrough, Grove sockets, SWD/debug header, controller clearance, and cable-side envelopes without relying on generated mesh files or external OpenSCAD libraries.

## Scope

- Add one editable OpenSCAD source file for the Seeed Grove Base Hat for Raspberry Pi Zero reference design.
- Model the HAT board outline, thickness, rounded corners, four Pi Zero-compatible mounting holes, 40-pin GPIO passthrough/header reference, Grove socket clearance blocks, SWD/debug header reference, controller/component clearance blocks, and simple silkscreen/label reference markers.
- Include render modes for:
  - full assembly/reference preview,
  - HAT-only reference preview,
  - connector/component clearance preview,
  - printable or separated fit-check layout for visual inspection.
- Include independent visibility controls for electronics/components, GPIO header/reference, Grove connector labels, and optional Pi Zero reference geometry.
- Use `designs/pi_zero.scad` as the optional Raspberry Pi Zero fit reference rather than duplicating the Pi Zero model.
- Keep all user-adjustable dimensions near the top of the file in grouped `Adjustable Parameters`.
- Keep derived values in a separate `Derived Values` section.
- Update `README.md` with the new design file, assumptions, parameters, render modes, source references, fit notes, and validation checklist entries.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every trace, silkscreen detail, chip package, or plastic connector feature.
- An enclosure for the HAT.
- Electrical behavior, software setup, firmware flashing, or Grove module compatibility validation.
- Changes to `designs/pi_zero.scad` except using it from the new child design.
- External OpenSCAD library dependencies.
- OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

## Definitions

- HAT: Seeed Studio Grove Base Hat for Raspberry Pi Zero, SKU `103030276`.
- Grove socket: a 4-pin Grove connector represented as an adjustable clearance volume for the connector body and cable exit.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and enclosure planning, not a certified vendor mechanical model.
- HAT coordinate system: origin at the board center on the PCB bottom face, X along the 65 mm board length, Y along the 30 mm board width, and Z upward from the PCB bottom face.

## Research Sources

- Seeed Studio product page: https://www.seeedstudio.com/Grove-Base-Hat-for-Raspberry-Pi-Zero.html
- Seeed Studio wiki page: https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi_Zero/
- The Pi Hut product page for published physical dimensions: https://thepihut.com/products/grove-base-hat-for-raspberry-pi-zero
- RobotShop product page for published physical dimensions and resource listing: https://ca.robotshop.com/products/grove-base-hat-raspberry-pi-zero

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- Default HAT dimensions must use published product dimensions:
  - board length: 65.0 mm,
  - board width: 30.0 mm,
  - overall height envelope: 20.0 mm.
- Default board thickness must be an adjustable 1.6 mm common PCB reference unless the implementation has an approved local measured value.
- Default mounting hole positions must use Raspberry Pi Zero-compatible positions from `designs/pi_zero.scad`:
  - hole centers 3.5 mm from board edges,
  - hole-center span 58.0 mm lengthwise and 23.0 mm widthwise.
- Default mounting hole diameter must be adjustable and compatible with common Pi Zero M2.5 mounting hardware.
- The HAT must expose a 40-pin GPIO passthrough/header reference compatible with the Raspberry Pi pin pattern.
- Published product and wiki facts to model as simplified, adjustable clearance features:
  - 24-pin GPIO maintained according to the product title,
  - Grove interfaces for I2C, UART, Digital, Analog, and PWM,
  - SWD/debug interface,
  - built-in MCU/controller,
  - 3.3 V Grove operation note for documentation.
- Because the fetched public pages do not provide exact Grove socket center coordinates, all Grove socket positions and cable-exit envelopes must be adjustable defaults based on visible product layout and Pi Zero board constraints. The source and README must state that the defaults should be tuned after physical measurement.
- Connector and component models may be simplified rectangular or rounded clearance volumes when exact cosmetic shape is unnecessary for fit-checking.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the HAT reference with optional Pi Zero reference, Grove sockets, GPIO header/reference, SWD/debug header, component blocks, and labels according to the visibility toggles.
- `render_mode = "hat"` displays only the HAT PCB and mounting/reference holes with optional GPIO reference.
- `render_mode = "connectors"` displays the HAT with Grove/socket/component clearance features emphasized for enclosure planning.
- `render_mode = "printable_layout"` displays the HAT reference and optional Pi Zero reference separated for visual inspection; it must not imply generated printable parts are being committed.
- `show_electronics` controls Grove sockets, SWD/debug header, controller/component blocks, and other component previews without hiding the PCB or mounting holes.
- `show_gpio_header` controls the GPIO passthrough/header reference independently from other component previews.
- `show_grove_labels` controls simple text labels for Grove socket groups independently from connector bodies.
- `show_pi_zero_reference` controls importing and showing the reusable Pi Zero reference model for stack/fit context.
- The board outline must render as a 65 mm x 30 mm PCB with rounded corners and four Pi Zero-compatible mounting holes.
- The reference must show grouped Grove socket clearance blocks for Digital, Analog, I2C, PWM, and UART ports, plus an SWD/debug header reference and main controller/component clearance blocks.
- Grove socket bodies and their cable-exit clearance envelopes must be adjustable independently, so physical measurements can be applied without changing module code.
- The model must remain usable as a child design reference through `use <...>` and named module calls.

## Assumptions

- The HAT uses the Raspberry Pi Zero board footprint because published reseller dimensions are 65 mm x 30 mm and the product is explicitly for Raspberry Pi Zero-class use.
- The Pi Zero mounting-hole positions in `designs/pi_zero.scad` are the repository authority for this HAT's default fit reference.
- A simplified rectangular connector/component clearance model is acceptable for enclosure and stack planning.
- Published pages are internally inconsistent about analog Grove count: the Seeed product title says 4x Analog, while the fetched wiki specification table says 3 Analog. The reference model will include adjustable Grove socket groups and document the source discrepancy instead of treating the modeled sockets as an electrical guarantee.
- The new design should be standalone rather than folded into the existing Pi Zero reference because repository instructions reserve `designs/pi_zero.scad` as a reusable base reference for child designs.

## Impact And Regression Considerations

- The new `.scad` file must not change existing Pi Zero, Raspberry Pi 5, Waveshare HAT, or enclosure design behavior.
- README validation examples must not instruct agents to run OpenSCAD locally as required validation; they may list optional commands for users with OpenSCAD installed, consistent with the current README style.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro print guidance by using printable-friendly clearances and avoiding generated mesh files.

## Acceptance Criteria

- A new `designs/seeed_grove_base_hat_zero.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file uses `use <pi_zero.scad>` when showing an optional Pi Zero reference.
- The file provides named modules for the full reference, HAT board, GPIO reference, Grove connector previews, component previews, labels, optional Pi Zero stack preview, printable/fit-check layout, and helper geometry.
- Default board dimensions match the researched values: 65.0 mm x 30.0 mm board footprint and 20.0 mm overall height envelope.
- Default mounting-hole positions match Pi Zero-compatible positions from the repository reference: 3.5 mm edge offsets and 58.0 mm x 23.0 mm hole-center span.
- Render modes include `assembly`, `hat`, `connectors`, and `printable_layout`.
- Visibility toggles independently control electronics/components, GPIO header/reference, Grove labels, and optional Pi Zero reference.
- README documents the new design file, assumptions, source dimensions, source discrepancy around analog port count, render modes, common adjustable parameters, optional OpenSCAD commands, and manual inspection checklist.
- `git diff --check` passes.
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
  - visibility toggles control the intended groups,
  - README entries match the implemented behavior.

## Documentation Requirements

- Update `README.md` to add `designs/seeed_grove_base_hat_zero.scad` under design files.
- Add a Seeed Grove Base Hat for Raspberry Pi Zero section with component assumptions, adjustable parameters, render modes, source notes, and print/fit notes.
- Add optional OpenSCAD commands for the new render modes to the validation checklist.
- Add manual inspection checklist items for the HAT footprint, Grove socket clearances, and optional Pi Zero stack reference.
