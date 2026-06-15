# SPEC: Waveshare ETH/USB HUB HAT OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD design for the Waveshare ETH/USB HUB HAT, including the included Micro USB bridge adapter used with Raspberry Pi Zero-class boards.

The design will provide a reusable mechanical reference and printable clearance aid for planning enclosures, stacked assemblies, and port access around the ETH/USB HUB HAT.

## Problem Statement

The repository currently has Raspberry Pi reference models but no standalone Waveshare ETH/USB HUB HAT reference source. Future designs that use this HAT need a deterministic, adjustable `.scad` source that models the board outline, mounting holes, major connectors, GPIO interface, and Micro USB bridge adapter clearance without relying on external OpenSCAD libraries or generated mesh artifacts.

The current Waveshare reference now exists, but several measured-fit bugs need correction before dependent enclosure work can rely on it:

- the HAT GPIO header reference is not aligned to the Pi Zero GPIO header coordinate pattern,
- the side USB-A connector previews do not keep the long USB-A component dimension aligned along the left and right board-side margins,
- RJ45 and USB-A connector sizes do not match the measured component dimensions supplied by the user,
- the RJ45 preview sits only above the board instead of passing through the board,
- the RJ45 lower-side clearance relative to the board is not represented,
- the front-edge spacing between the RJ45 component margin and USB component margin is not represented.

Iteration 2026-06-15 side USB orientation correction: the side USB-A connector previews must place each port mouth on the corresponding board side face while keeping the long USB-A component dimension along the PCB side margin. The inward-over-PCB depth for side USB-A connectors is the short `5.7 mm` dimension along X, and the long `13.2 mm` dimension runs along Y on the board side margin.

Iteration 2026-06-15 side USB edge-center correction: the side USB-A connector previews must keep each USB-A component center aligned to the corresponding left or right PCB side edge line. The `5.7 mm` X dimension remains the short cross-edge depth and the `13.2 mm` Y dimension remains the long side-margin length, but the component center X must sit on the board side edge instead of being offset inward by half the connector depth.

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
- Correct the existing Waveshare reference model defaults so the GPIO header follows the Pi Zero header coordinate pattern, the measured RJ45 and USB-A connector dimensions are represented, the side USB-A ports face outward from the left and right board faces with the side USB-A component centers aligned to those side edge lines and the long connector dimension along the side margin, and front RJ45/USB placement follows the measured inter-component margin constraint.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every electronic component.
- An enclosure for the HAT.
- Changes to existing Raspberry Pi reference models except where README cross-references need to mention the new design.
- External OpenSCAD library dependencies.
- Generated OpenSCAD mesh/export artifacts committed to source control.

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
- The Micro USB bridge adapter does not have a published catalog dimension table in the researched product page or wiki. Its default dimensions must be derived from the official Waveshare STEP resource as adjustable references:
  - actual solid adapter envelope from `0304-06.stp` vertex coordinates: 8.6 mm x 9.0 mm x 12.2 mm,
  - bridge body: 8.6 mm wide x 1.0 mm deep x 12.2 mm high,
  - two Micro USB plug shells: about 6.5 mm wide x 8.0 mm deep x 1.46 mm high each,
  - plug center spacing: about 8.70 mm.
- USB Micro-B plug shell geometry should remain adjustable and should include enough extra clearance for printed enclosure fit checks.
- Connector and component models may be simplified rectangular or rounded clearance volumes when exact cosmetic shape is unnecessary for fit-checking.
- User-supplied measured connector dimensions must be used for the default corrected Waveshare reference:
  - RJ45 component footprint size: 14.7 mm along X and 11.7 mm along Y,
  - front USB-A component footprint size: 13.2 mm along X and 5.7 mm along Y,
  - side USB-A component footprint size: 5.7 mm along X inward depth and 13.2 mm along Y side-margin length.
- The default front-edge spacing between the RJ45 component margin and the USB-A component margin must be 3.75 mm.
- The default RJ45 component must pass through the HAT PCB.
- The default distance between the lower side of the HAT PCB and the RJ45 component lower extent must be 1.3 mm.
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
- The GPIO header reference must derive its pin centers from the same Pi Zero coordinate pattern as `designs/pi_zero.scad`:
  - X centers start at `-(19 * 1.27 mm)` and advance by `2.54 mm` for 20 columns,
  - Y centers use the board mounting-hole Y coordinate minus `1.27 mm`, plus `2.54 mm` for the second row.
- The Waveshare GPIO header block must be centered on the resulting 20 x 2 pin grid, not independently positioned through unrelated hard-coded center values.
- The corrected RJ45 footprint must default to 14.7 mm x 11.7 mm in X/Y.
- The corrected front USB-A footprint must default to 13.2 mm x 5.7 mm in X/Y.
- The corrected side USB-A footprints must default to 5.7 mm x 13.2 mm in X/Y, with the 5.7 mm dimension running inward across X and the 13.2 mm dimension running along the side board margin across Y.
- The side USB-A connector previews must be oriented as side-entry ports with their component center X positions aligned to the corresponding PCB side edge lines:
  - left USB-A center X = `-hat_board_half_length_mm`,
  - right USB-A center X = `hat_board_half_length_mm`,
  - the left connector body short depth straddles the left board side edge line, with half the `5.7 mm` depth inward toward +X over the PCB,
  - the right connector body short depth straddles the right board side edge line, with half the `5.7 mm` depth inward toward -X over the PCB,
  - the long 13.2 mm side USB-A dimension lies along the corresponding board side margin in Y,
  - the component center is not offset inward by half the connector depth.
- The RJ45 and front USB-A centers must be derived from their X sizes and the 3.75 mm margin-to-margin spacing so the default distance between the RJ45 right margin and USB-A left margin is 3.75 mm.
- The RJ45 component must be represented by geometry that passes through the board: its lower extent must be 1.3 mm below the PCB bottom face, and its upper extent must preserve the configured RJ45 component height envelope.
- The adapter reference must align to the HAT bottom Micro USB interface in assembly mode and must be visually distinct from the HAT connectors.
- The adapter bridge body must sit outside the board edge like an external plug body, while both adapter plug shells extend inward from the board edge into the HAT/Pi Zero Micro USB socket positions.
- The source must expose dimensions and offsets for adjusting connector placement after physical measurement.
- The model must remain usable as a child design reference through `use <...>` and named module calls.

## Assumptions

- The HAT is intended to align with Raspberry Pi Zero-class board dimensions and mounting-hole positions because Waveshare states the board is designed to fit Zero / Zero 2W / Zero W / Zero WH.
- The official STEP-derived Micro USB adapter solid-vertex dimensions are sufficient as the default adapter reference until the user's physical adapter is measured.
- Connector bodies can be simplified as clearance volumes while preserving board-side position, size, height, and port access intent.
- The model should be a standalone HAT reference file rather than modifying `designs/pi_zero.scad`, because repository instructions say future dependent designs should use `designs/pi_zero.scad` as the Pi fit reference instead of duplicating Pi geometry.
- The user-supplied front connector dimensions are physical component footprint dimensions in the Waveshare model coordinate system, where X follows board length and Y follows board width.
- "Left and right USB entries are oriented wrong" means the side USB-A reference must represent outward-facing side ports whose component center line is aligned to the corresponding board side edge, with the short connector depth crossing the PCB edge and the long connector dimension sitting along the PCB side margin rather than pointing inward.
- The supplied 1.3 mm RJ45 lower-side distance means the RJ45 component extends 1.3 mm below the PCB bottom face.

## Impact And Regression Considerations

- The Waveshare `.scad` file changes must not change existing Pi Zero or Raspberry Pi 5 reference behavior.
- Dependent enclosures that import `waveshare_eth_usb_hub_hat.scad` may render the corrected connector locations, side USB-A X/Y dimensions, and side-port approach direction differently; this is intended because the current defaults are measured-fit bugs.
- README documentation must be updated to avoid documenting obsolete connector sizes, side-USB placement, or RJ45 placement behavior.
- README validation examples must not instruct agents to run OpenSCAD locally as required validation; they may list optional commands for users with OpenSCAD installed, consistent with the current README style.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro print guidance by using printable-friendly clearances and avoiding generated mesh files.
- The dirty worktree has unrelated changes and deleted spec/plan files; implementation must avoid reverting or committing unrelated changes.

## Acceptance Criteria

- `designs/waveshare_eth_usb_hub_hat.scad` exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file provides named modules for the full reference, HAT board, connector/component previews, GPIO reference, Micro USB adapter, and helper geometry.
- Default board dimensions match the researched Waveshare values: 65.0 mm x 30.0 mm board, 3.0 mm mounting holes, 3.5 mm hole edge offsets, 58.0 mm x 23.0 mm hole center span, and 1.5 mm corner radius.
- Default adapter dimensions include an adjustable 8.6 mm x 9.0 mm x 12.2 mm solid envelope derived from the official 3D drawing vertices, with separate body and two plug-shell blocks.
- Default GPIO header pin centers match the Pi Zero reference model's 20 x 2 header coordinate pattern.
- Default Waveshare GPIO header block position is derived from the corrected pin grid.
- Default RJ45 X/Y footprint is 14.7 mm x 11.7 mm.
- Default front USB-A X/Y footprint is 13.2 mm x 5.7 mm.
- Default side USB-A X/Y footprint is 5.7 mm x 13.2 mm.
- Default side USB-A component center X positions align to the board left and right X side edge lines, with each connector short depth straddling that edge line and each long dimension lying along the side board margin.
- Default front RJ45-to-USB-A margin spacing is 3.75 mm.
- Default RJ45 geometry passes through the PCB and extends 1.3 mm below the PCB bottom face.
- The Micro USB bridge adapter body is outside the board outline by default, and the plug-shell blocks extend from the board edge toward the board interior so they behave like plugs inserted into the board-side Micro USB sockets.
- Render modes include `assembly`, `hat`, `micro_usb_adapter`, and `printable_layout`.
- README documents the new design file, assumptions, render modes, common adjustable parameters, optional OpenSCAD commands, and manual inspection checklist.
- `git diff --check` passes.
- No generated mesh/export artifacts are added.

## Validation Plan

- Run `git diff --check`.
- Run OpenSCAD render/export to a temporary `/tmp` artifact when useful for visual inspection of the corrected Waveshare geometry.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies,
  - the board outline and holes match researched dimensions,
  - the GPIO header pin centers match the Pi Zero coordinate pattern,
  - RJ45 and front USB-A defaults match the corrected measured dimensions,
  - side USB-A defaults use 5.7 mm X depth and 13.2 mm Y length,
  - side USB-A component centers align to the left/right board side edge lines,
  - side USB-A connector short depths straddle those edge lines,
  - front RJ45-to-USB-A margin spacing is 3.75 mm,
  - RJ45 geometry passes through the PCB and extends 1.3 mm below the PCB bottom face,
  - the Micro USB adapter can be toggled and has adjustable fit-clearance dimensions,
  - README entries match the implemented behavior.

## Documentation Requirements

- Update `README.md` to add `designs/waveshare_eth_usb_hub_hat.scad` under design files.
- Add or update the Waveshare ETH/USB HUB HAT section with component assumptions, corrected measured connector dimensions, adjusted placement behavior, adjustable parameters, render modes, and print/fit notes.
- Add optional OpenSCAD commands for the new render modes to the validation checklist.
- Add manual inspection checklist items for the HAT and Micro USB adapter.
