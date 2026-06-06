# SPEC: Waveshare ETH/USB HUB HAT OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD design for the Waveshare ETH/USB HUB HAT, including the included Micro USB bridge adapter used with Raspberry Pi Zero-class boards.

The design will provide a reusable mechanical reference and printable clearance aid for planning enclosures, stacked assemblies, and port access around the ETH/USB HUB HAT.

## Problem Statement

The repository currently has Raspberry Pi reference models but no standalone Waveshare ETH/USB HUB HAT reference source. Future designs that use this HAT need a deterministic, adjustable `.scad` source that models the board outline, mounting holes, major connectors, GPIO interface, and Micro USB bridge adapter clearance without relying on external OpenSCAD libraries or generated mesh artifacts.

## Scope

- Add one editable OpenSCAD source file for the Waveshare ETH/USB HUB HAT reference design.
- Model the HAT board outline, corner radius, thickness, mounting holes, GPIO interface position, RJ45 connector, three USB-A connector positions, bottom Micro USB HAT interface, visible LEDs, and major IC/component clearance blocks.
- Include a Micro USB bridge adapter reference model that can be shown or hidden independently.
- Include render modes for:
  - full assembly/reference preview,
  - HAT-only reference preview,
  - Micro USB bridge adapter-only preview,
  - printable or fit-check layout when useful for visual inspection.
- Keep all user-adjustable dimensions near the top of the file in grouped `Adjustable Parameters`.
- Keep derived values in a separate `Derived Values` section.
- Update `README.md` with the new design, parameters, render modes, assumptions, and validation checklist entries.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every electronic component.
- An enclosure for the HAT.
- Changes to existing Raspberry Pi reference models except where README cross-references need to mention the new design.
- External OpenSCAD library dependencies.
- OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

## Definitions

- HAT: Waveshare SKU 16595, part number `ETH/USB HUB HAT`.
- Micro USB bridge adapter: the small included Micro USB connector used to connect the Raspberry Pi Zero USB interface to the HAT bottom USB HUB interface.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and port planning, not a certified vendor mechanical model.
- HAT coordinate system: the OpenSCAD source should document its origin and orientation. The recommended origin is board center on the PCB bottom face, matching the existing Pi Zero reference style.

## Research Sources

- Waveshare product page for SKU 16595: https://www.waveshare.com/eth-usb-hub-hat.htm
- Waveshare wiki page for the HAT and resource links: https://www.waveshare.com/wiki/ETH/USB_HUB_HAT
- Waveshare dimension image: https://www.waveshare.com/img/devkit/accBoard/ETH-USB-HUB-HAT/ETH-USB-HUB-HAT-size.jpg
- Waveshare official 3D drawing ZIP linked from the wiki: https://files.waveshare.com/upload/3/3e/ETH_USB_HUB_HAT_3D_Drawing.zip

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- Default HAT dimensions must use Waveshare's published dimensions:
  - board length: 65.0 mm,
  - board width: 30.0 mm,
  - mounting hole diameter: 3.0 mm.
- Default board mounting-hole center offsets must use the published dimension image:
  - hole centers 3.5 mm from the board edges,
  - hole-center span 58.0 mm lengthwise and 23.0 mm widthwise,
  - board corner radius shown as 1.5 mm on the HAT drawing.
- The official package contents include the Micro USB connector and Micro USB cable. The model must include the Micro USB bridge adapter, but not the loose cable.
- The Micro USB bridge adapter does not have a published catalog dimension table in the researched product page or wiki. Its default clearance envelope must be derived from the official Waveshare STEP resource as an adjustable reference:
  - approximate adapter envelope: 13.3 mm x 9.0 mm x 14.8 mm.
- USB Micro-B plug shell geometry should remain adjustable and should include enough extra clearance for printed enclosure fit checks.
- Connector and component models may be simplified rectangular or rounded clearance volumes when exact cosmetic shape is unnecessary for fit-checking.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the HAT reference with the Micro USB bridge adapter and optional connector/component previews.
- `render_mode = "hat"` displays only the HAT reference model.
- `render_mode = "micro_usb_adapter"` displays only the Micro USB bridge adapter reference.
- `render_mode = "printable_layout"` displays the HAT reference and adapter separated for visual inspection; it must not imply generated printable parts are being committed.
- `show_electronics` controls connector and component previews without hiding the PCB and mounting holes.
- `show_micro_usb_adapter` controls the Micro USB bridge adapter independently from the HAT.
- `show_gpio_header` controls the GPIO header/reference pins independently from the PCB.
- The board outline must render as a 65 mm x 30 mm PCB with rounded corners and four 3.0 mm mounting holes at the published Zero-style positions.
- The reference must show:
  - the RJ45 connector on the front/top edge as shown by the Waveshare product photos and dimension image,
  - one USB-A connector on the same front/top edge,
  - one USB-A connector on each long side,
  - a bottom Micro USB interface/clearance volume for the HAT's USB HUB connection,
  - LEDs labelled or positioned as visual reference blocks for PWR, ACT, and D1-D3,
  - major IC/component clearance blocks sufficient to see the likely top-side height envelope.
- The adapter reference must align to the HAT bottom Micro USB interface in assembly mode and must be visually distinct from the HAT connectors.
- The source must expose dimensions and offsets for adjusting connector placement after physical measurement.
- The model must remain usable as a child design reference through `use <...>` and named module calls.

## Assumptions

- The HAT is intended to align with Raspberry Pi Zero-class board dimensions and mounting-hole positions because Waveshare states the board is designed to fit Zero / Zero 2W / Zero W / Zero WH.
- The official STEP-derived Micro USB adapter envelope is sufficient as the default adapter clearance model until the user's physical adapter is measured.
- Connector bodies can be simplified as clearance volumes while preserving board-side position, size, height, and port access intent.
- The model should be a standalone HAT reference file rather than modifying `designs/pi_zero.scad`, because repository instructions say future dependent designs should use `designs/pi_zero.scad` as the Pi fit reference instead of duplicating Pi geometry.

## Impact And Regression Considerations

- The new `.scad` file must not change existing Pi Zero or Raspberry Pi 5 reference behavior.
- README validation examples must not instruct agents to run OpenSCAD locally as required validation; they may list optional commands for users with OpenSCAD installed, consistent with the current README style.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro print guidance by using printable-friendly clearances and avoiding generated mesh files.
- The dirty worktree has unrelated changes and deleted spec/plan files; implementation must avoid reverting or committing unrelated changes.

## Acceptance Criteria

- A new `designs/waveshare_eth_usb_hub_hat.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file provides named modules for the full reference, HAT board, connector/component previews, GPIO reference, Micro USB adapter, and helper geometry.
- Default board dimensions match the researched Waveshare values: 65.0 mm x 30.0 mm board, 3.0 mm mounting holes, 3.5 mm hole edge offsets, 58.0 mm x 23.0 mm hole center span, and 1.5 mm corner radius.
- Default adapter dimensions include an adjustable 13.3 mm x 9.0 mm x 14.8 mm envelope derived from the official 3D drawing.
- Render modes include `assembly`, `hat`, `micro_usb_adapter`, and `printable_layout`.
- README documents the new design file, assumptions, render modes, common adjustable parameters, optional OpenSCAD commands, and manual inspection checklist.
- `git diff --check` passes.
- No generated mesh/export artifacts are added.

## Validation Plan

- Do not run OpenSCAD commands locally.
- Run `git diff --check`.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies,
  - the board outline and holes match researched dimensions,
  - the Micro USB adapter can be toggled and has adjustable fit-clearance dimensions,
  - README entries match the implemented behavior.

## Documentation Requirements

- Update `README.md` to add `designs/waveshare_eth_usb_hub_hat.scad` under design files.
- Add a Waveshare ETH/USB HUB HAT section with component assumptions, adjustable parameters, render modes, and print/fit notes.
- Add optional OpenSCAD commands for the new render modes to the validation checklist.
- Add manual inspection checklist items for the HAT and Micro USB adapter.
