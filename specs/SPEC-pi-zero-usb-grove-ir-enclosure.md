# SPEC: Pi Zero USB Grove IR Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD design for a printable enclosed case that houses a Raspberry Pi Zero v1.3 stacked with a Waveshare ETH/USB HUB HAT and a Seeed Grove Base Hat for Raspberry Pi Zero, plus an internally mounted Grove Infrared Emitter module.

The case will keep the board stack fixed, expose required external connectors and the IR LED, keep the Grove cable inside the enclosure, allow the top to be removed for future Grove modules or additional HAT work, and remain practical to print on a Bambu Lab P2S.

## Problem Statement

The repository has reusable reference models for the Pi Zero, Waveshare ETH/USB HUB HAT, Seeed Grove Base Hat, and Grove Infrared Emitter, but no current source file for a complete case around the user's stack. The README references `designs/pi_zero_usb_grove_ir_enclosure.scad`, but that file is not present in the current repository state and there is no matching approved spec artifact.

The requested assembly needs a deterministic printable enclosure that provides port access, internal cable routing, a secure IR emitter mount, anti-slide features, removable upper access, and enough internal height for the approximately 35 mm board stack plus Grove cable and emitter clearance.

## Scope

- Add or update one editable OpenSCAD source file for the Pi Zero USB Grove IR enclosure.
- Use existing local reference models instead of duplicating board and module models:
  - `designs/pi_zero.scad`,
  - `designs/waveshare_eth_usb_hub_hat.scad`,
  - `designs/seeed_grove_base_hat_zero.scad`,
  - `designs/grove_infrared_emitter.scad`.
- Model a printable bottom tray with:
  - side walls,
  - bottom floor,
  - Pi Zero mounting standoffs aligned to the Pi Zero mounting holes,
  - internal mounting location for the Grove IR emitter PCB,
  - screw holes or bosses for the Grove IR emitter PCB,
  - anti-slide feet or pad recesses,
  - cover attachment bosses.
- Model a removable upper case section or top cover that can be removed to add Grove elements or inspect/add an additional HAT.
- Provide access openings for:
  - Raspberry Pi Zero microSD,
  - Raspberry Pi Zero mini-HDMI,
  - Raspberry Pi Zero Micro USB power and data ports,
  - Raspberry Pi Zero camera connector access,
  - Waveshare HAT RJ45,
  - Waveshare HAT front USB-A,
  - Waveshare HAT left and right USB-A.
- Keep the wireless USB dongle outside the case by allowing it to remain connected through a Waveshare HAT USB-A opening.
- Provide a front or side IR aperture that exposes the Grove IR emitter LED outside the case while keeping the emitter PCB inside.
- Keep the Grove cable path internal between the Grove Base Hat and the IR emitter PCB.
- Include adjustable clearance parameters for stack height, port openings, wall thickness, tolerances, fasteners, IR emitter placement, Grove cable channel, and anti-slide features.
- Include independent adjustable board-to-board spacing parameters for:
  - Pi Zero PCB bottom to Waveshare ETH/USB HUB HAT PCB bottom,
  - Waveshare ETH/USB HUB HAT PCB bottom to Seeed Grove Base Hat PCB bottom.
- Derive board preview Z positions, Waveshare port opening Z positions, Grove Hat connector/cable clearance Z positions, and case height from the board-to-board spacing parameters so the electronics preview and case openings remain aligned when the stack spacing is tuned.
- Mount the Grove IR emitter board at an adjustable internal position associated with a selected Grove Base Hat connector area, and derive its case cutouts and mounting holes from the same IR emitter placement values.
- Include render modes for:
  - full assembly preview,
  - bottom tray printable part,
  - removable top cover printable part,
  - printable layout,
  - electronics-only fit reference if useful.
- Update `README.md` to document the new design, parameters, render modes, print notes, and manual inspection checklist.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- Vendor-certified cosmetic board, connector, cable, or dongle geometry.
- Electrical validation, IR protocol validation, Raspberry Pi software configuration, or Grove signal testing.
- A sealed waterproof or dustproof enclosure.
- Active cooling, fan mounts, or thermal performance guarantees.
- A wireless USB dongle model, beyond clearance and port access for the dongle to plug in externally.
- A precise enclosure fit before the user physically measures and test-fits the hardware stack.
- External OpenSCAD libraries.
- Local OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

## Definitions

- Board stack: Raspberry Pi Zero v1.3 on the bottom, Waveshare ETH/USB HUB HAT above it, and Seeed Grove Base Hat for Raspberry Pi Zero above the Waveshare HAT.
- Removable upper case section: the top cover or upper shell that can be removed without removing the Pi Zero from the bottom tray.
- Port access opening: an enclosure cutout sized with adjustable clearance around a connector so the connector remains externally usable.
- IR aperture: the case opening through which the Grove IR emitter LED protrudes or transmits outward.
- Internal Grove cable path: printed clearance volume inside the enclosure for the Grove cable between the Grove Base Hat connector and the IR emitter module.
- Anti-slide feature: printed recesses or feet features intended to accept rubber pads or increase contact stability on a flat surface.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and planning, not a certified vendor mechanical model.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- The default board stack must be Raspberry Pi Zero v1.3 + Waveshare ETH/USB HUB HAT + Seeed Grove Base Hat for Raspberry Pi Zero.
- The board stack vertical order must be:
  1. Raspberry Pi Zero v1.3,
  2. Waveshare ETH/USB HUB HAT,
  3. Seeed Grove Base Hat for Raspberry Pi Zero.
- The default board footprint planning size must use the existing 65.0 mm x 30.0 mm Pi Zero/HAT reference dimensions.
- The user-provided total height from the Pi Zero to the upper part of the Grove HAT plus Grove male connector is approximately 35.0 mm, including existing spacers between HATs.
- The enclosure must add adjustable upward headroom above the 35.0 mm stack for the Grove cable, Grove connector handling clearance, and IR emitter placement. The default extra upward headroom must be a conservative adjustable value, initially 8.0 mm.
- The existing enclosure source already exposes board spacing parameters named `pi_zero_to_waveshare_hat_z_offset_mm` and `waveshare_to_grove_hat_z_offset_mm`, currently defaulting to 11.2 mm and 10.5 mm respectively. The implementation must preserve independent adjustment of these distances or replace them with equivalently clear parameters.
- Changing either board spacing parameter must move the corresponding board reference model and all dependent case openings or cable guides for that board tier.
- Waveshare ETH/USB HUB HAT port cutouts must be positioned relative to the Waveshare HAT Z position, not as unrelated fixed absolute Z coordinates.
- Grove Base Hat connector/cable clearance guides must be positioned relative to the Grove Base Hat Z position, not as unrelated fixed absolute Z coordinates.
- The enclosure must expose all Pi Zero and Waveshare HAT ports listed in Scope while preserving enough surrounding material for printable wall strength.
- The wireless USB dongle must be treated as external; the case must not try to enclose it.
- The IR emitter PCB must be inside the case.
- Only the IR LED should be exposed outside the case by default.
- The IR emitter mount must include adjustable screw hole/boss geometry based on the existing Grove IR emitter mounting-hole reference.
- The IR LED aperture must be adjustable for LED diameter, wall clearance, and LED protrusion or flush alignment.
- The Grove cable must remain fully inside the case by default and must not require an external cable loop.
- The Grove IR emitter board must be mounted above or near the selected Grove Base Hat connector area inside the enclosure, with enough adjustable clearance for the Grove plug and cable bend between the HAT socket and IR emitter connector.
- The top cover must be removable independently from the Pi Zero mounting screws.
- The bottom tray must provide a way to screw the Pi Zero and its attached HAT stack into place through the Pi Zero mounting-hole pattern.
- The case must provide anti-slide capability using either printed rubber-foot recesses or printed feet with adjustable dimensions. The default must use rubber-foot recesses because they are more reliable for non-slip behavior on common surfaces.
- Printable wall thicknesses, screw bosses, standoffs, and clearances must be adjustable and plausible for Bambu Lab P2S printing.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major printable parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the complete case with optional electronics/reference stack.
- `render_mode = "bottom_tray"` displays only the printable bottom tray.
- `render_mode = "top_cover"` displays only the removable printable upper case section.
- `render_mode = "printable_layout"` displays printable parts arranged side-by-side for inspection and export.
- `render_mode = "electronics"` displays the imported electronics/reference stack and IR emitter placement without printable case geometry.
- `show_electronics` controls the Pi Zero, HAT, and IR emitter reference models without hiding printable case geometry.
- `show_cutout_guides` controls visible port, IR aperture, cable, and clearance guides without changing the printable solids.
- The bottom tray must contain four Pi Zero stack standoffs aligned to the Pi Zero mounting-hole pattern.
- The Pi Zero stack standoffs must include adjustable screw clearance holes or pilot holes compatible with M2.5-class mounting hardware by default.
- The top cover must attach to the tray through separate cover bosses or screw points that do not share the Pi Zero stack mounting screws by default.
- The upper cover removal path must not require disconnecting the wireless USB dongle, IR emitter LED, or Grove cable, aside from normal clearance around the removable part.
- The case must include port cutouts for the Pi Zero microSD, mini-HDMI, both Micro USB ports, camera connector access, Waveshare RJ45, Waveshare front USB-A, and both Waveshare side USB-A connectors.
- Port cutout dimensions and positions must be adjustable independently where connector placement may need physical calibration.
- Board-tier port cutout Z positions must be derived from board-tier Z positions plus adjustable per-port local offsets. In particular:
  - Pi Zero port cutout centers must derive from the Pi Zero PCB bottom Z position,
  - Waveshare port cutout centers must derive from the Waveshare HAT PCB bottom Z position,
  - any future Grove Hat connector access or cable guides must derive from the Grove HAT PCB bottom Z position.
- Waveshare USB-A cutouts must allow an external wireless USB dongle to remain plugged into at least one accessible USB-A port.
- The IR emitter PCB must mount on internal bosses or posts at a fixed adjustable location in the tray, with its LED aligned to the IR aperture.
- The IR emitter PCB screw hole spacing must default to the imported Grove IR emitter reference mounting-hole assumptions and remain adjustable.
- The IR emitter mount holes, IR emitter reference model, IR LED aperture, and any IR-specific case cutouts must all derive from the same adjustable IR emitter placement values.
- The IR aperture must expose the LED path while keeping the PCB body and Grove connector inside the enclosure.
- The internal Grove cable path must provide adjustable clearance from the selected Grove Base Hat connector area to the IR emitter board, including the Grove connector/plug clearance above both ends of the cable.
- The default enclosure internal height must be derived from the 35.0 mm measured stack height plus the extra upward headroom parameter.
- The derived enclosure height must remain at least high enough for:
  - Pi Zero standoff height,
  - the Grove HAT PCB bottom Z position,
  - Grove HAT top-side connector/cable clearance,
  - IR emitter PCB and cable/plug clearance,
  - extra upward headroom.
- Anti-slide recesses or feet must be present on the bottom exterior, with adjustable count, diameter/size, depth, and placement.
- Printable parts must be separable without requiring generated mesh files in source control.

## Assumptions

- The user's "pizero 1.3" means Raspberry Pi Zero v1.3 with manually inserted GPIO headers or equivalent stack headers.
- The user's "waveshare usb hat" means the existing repository `designs/waveshare_eth_usb_hub_hat.scad` reference for the Waveshare ETH/USB HUB HAT.
- The user's "groove base hat" and "groove infrared emitter" mean Seeed Grove Base Hat for Raspberry Pi Zero and Seeed Grove Infrared Emitter.
- The requested deliverable is an editable `.scad` source and README documentation, not committed generated print exports.
- The Grove Base Hat's exact connector used for the IR emitter is not specified. The enclosure will provide an internal cable clearance route from the Grove connector area rather than requiring a single hard-coded connector to be the only usable option.
- The default Grove IR emitter placement will use the existing Grove connector coordinate assumptions as a planning reference and remain adjustable after physical measurement.
- Rubber-foot recesses are the default anti-slide method; actual rubber feet or pads are external purchased parts and are not modeled as required printed artifacts.
- A screw-fastened removable top cover is acceptable as the default removable upper section because it is more robust than a snap fit for a tall stacked electronics enclosure.
- The first implementation may use simplified rectangular connector and cable cutout volumes while preserving adjustable positions and clearances.

## Impact And Regression Considerations

- The enclosure source must not change behavior of existing reference models.
- Existing reference model files should be imported with `use` and called from the enclosure source rather than copied or redefined.
- README currently documents a missing `designs/pi_zero_usb_grove_ir_enclosure.scad`; implementation must either align the new design with that documented filename or update README consistently.
- README validation examples must remain optional for users with OpenSCAD installed and must not instruct agents to run OpenSCAD locally as required validation.
- The design must remain compatible with Bambu Lab P2S and AMS 2 Pro print guidance by avoiding unsupported geometry assumptions and keeping generated meshes out of source control.
- Existing render modes and user-facing behavior must be preserved while correcting board spacing, cutout alignment, and Grove IR emitter placement behavior.

## Iteration: Adjustable Stack Spacing And Grove IR Placement

Requested changes:

- Confirm whether board spacing is already adjustable, and document the values users should tune.
- Fix the height between the Waveshare ETH/USB HUB HAT and the Grove Base Hat so their reference models no longer collide in the enclosure drawing.
- Ensure stack height adjustments also move dependent case holes and cutouts.
- Reposition the Grove IR emitter board so it is associated with the Grove Base Hat connector/cable area instead of an unrelated tray location.
- Account for Grove cable and plug clearance between the Grove Base Hat and the Grove IR emitter.
- Keep or add case holes/cutouts that follow the corrected Grove IR emitter placement.
- Provide mounting holes for the Grove IR emitter board.

Updated deterministic behavior:

- The design must expose independent, user-adjustable board spacing values for Pi Zero-to-Waveshare and Waveshare-to-Grove distances.
- Current implementation defaults, if retained, are:
  - `pi_zero_to_waveshare_hat_z_offset_mm = 11.2`,
  - `waveshare_to_grove_hat_z_offset_mm = 10.5`.
- The implementation must review and, if needed, increase the default Waveshare-to-Grove spacing so the Waveshare ETH/USB HUB HAT and Seeed Grove Base Hat reference models do not visibly collide in `assembly` or `electronics` render modes.
- The implementation must derive board-tier Z positions from those spacing values and then derive related case openings from the board-tier Z positions. Fixed absolute Z values for Waveshare port openings or Grove cable guides are not acceptable when they should follow board spacing.
- The Grove IR emitter board placement must be adjustable by X/Y/Z and rotation, but its default must place it near the selected Grove Base Hat connector/cable area and high enough for the Grove cable/plug to route internally without colliding with the Waveshare HAT or Grove HAT preview volumes.
- The Grove IR emitter PCB reference model, emitter mounting bosses, emitter mounting holes, LED aperture, and cable path/cutout guides must all use the same derived IR emitter placement so changing the emitter position updates the printed case features consistently.
- The IR emitter board must have screw/pilot holes in the case mount using adjustable Grove 20 mm-class mounting-hole planning assumptions.
- README documentation must state the board spacing parameters and explain that adjusting them moves the electronics preview and dependent case openings.

## Acceptance Criteria

- A new `designs/pi_zero_usb_grove_ir_enclosure.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file uses existing local reference models for the Pi Zero, Waveshare HAT, Seeed Grove Base Hat, and Grove IR emitter.
- The file provides named modules for the assembly, bottom tray, top cover, electronics preview, stack standoffs, IR emitter mount, IR aperture, internal Grove cable path, port cutouts, anti-slide features, and helper geometry.
- Default stack height planning uses an adjustable 35.0 mm measured stack height plus adjustable extra upward headroom.
- Independent board spacing values are adjustable and documented.
- The Waveshare HAT and Grove HAT reference models do not collide in the default `assembly` or `electronics` previews by visual code review of their derived Z placements and clearance envelopes.
- Waveshare port cutout Z centers derive from the Waveshare HAT Z position plus adjustable local offsets.
- Grove cable path Z placement derives from the Grove HAT and/or IR emitter placement values plus adjustable local offsets.
- Changing the Waveshare-to-Grove spacing changes the Grove HAT preview position and all dependent Grove cable/case guide positions.
- Changing the IR emitter position changes the IR emitter reference, mount bosses, mount holes, LED aperture, and related case cutouts together.
- The board stack renders in the correct vertical order when `show_electronics = true`.
- The bottom tray includes Pi Zero-aligned mounting standoffs and adjustable M2.5-class screw clearance.
- The Grove IR emitter PCB has an internal mounting location with screw holes/bosses.
- The IR LED is aligned with an adjustable exterior aperture, and only the LED is exposed outside the case by default.
- The Grove cable path remains inside the enclosure.
- The top cover is removable and independently attached from the board stack mounting screws.
- The case includes access openings for all Pi Zero and Waveshare HAT ports listed in Scope.
- At least one Waveshare USB-A opening supports an externally attached wireless USB dongle.
- Anti-slide recesses or feet are present on the bottom exterior.
- Render modes include `assembly`, `bottom_tray`, `top_cover`, `printable_layout`, and `electronics`.
- README documents the new design behavior, assumptions, parameters, render modes, print notes, and manual inspection checklist.
- `git diff --check` passes.
- No generated mesh/export artifacts are added.

## Validation Plan

- Do not run OpenSCAD commands locally.
- Run `git diff --check`.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies and printable parts,
  - reference models are imported instead of duplicated,
  - the stack order and vertical clearances match the approved defaults,
  - board spacing parameters are independently adjustable and documented,
  - Waveshare and Grove HAT previews do not collide at default spacing,
  - dependent Waveshare port holes and Grove cable/case guide positions derive from board spacing,
  - all required Pi Zero and Waveshare port cutouts exist and are independently adjustable where needed,
  - the wireless dongle remains outside the case through an accessible USB-A cutout,
  - the IR emitter PCB mount, screw holes, LED aperture, and internal cable path are present,
  - only the IR LED is exposed outside the case by default,
  - the removable top cover does not depend on board mounting screws,
  - anti-slide features are present,
  - printable parts have plausible flat orientations and Bambu P2S-friendly dimensions,
  - README entries match the implemented behavior,
  - no generated mesh/export artifacts are present.

## Documentation Requirements

- Update `README.md` to document `designs/pi_zero_usb_grove_ir_enclosure.scad` consistently with the actual source.
- Document component assumptions, including the user-provided 35.0 mm stack height and default extra upward headroom.
- Document the independent board spacing parameters users should tune, including the current/default Pi Zero-to-Waveshare and Waveshare-to-Grove values.
- Document that board spacing changes move the electronics preview and dependent case openings/cable guides together.
- Document adjustable parameter groups, render modes, optional OpenSCAD commands for users with OpenSCAD installed, assembly notes, and Bambu Lab print notes.
- Document that physical measurement and test fitting are still required before relying on final tolerances.
