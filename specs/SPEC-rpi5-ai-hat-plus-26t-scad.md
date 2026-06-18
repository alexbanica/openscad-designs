# SPEC: Raspberry Pi AI HAT+ 26T OpenSCAD Reference Design

Status: Approved

## Purpose

Create an editable OpenSCAD reference model for the Raspberry Pi AI HAT+ 26 TOPS board stacked on Raspberry Pi 5.

The design will provide a reusable fit and clearance reference for Raspberry Pi 5 assemblies that include the AI HAT+ 26T, its taller GPIO/header stack, the AI accelerator cooling assembly, and the Raspberry Pi 5 active cooler envelope.

## Problem Statement

The repository has a reusable Raspberry Pi 5 reference model in `designs/rpi5.scad`, including an approximate Raspberry Pi 5 active cooler preview, but it does not have a current AI HAT+ 26T reference source. README references to an older `rpi5_ai_hat_dual_heatsink_vision_case.scad` file are stale because that source file is not present in the current worktree.

Future Raspberry Pi 5 enclosure and stack planning needs a deterministic `.scad` source that models the AI HAT+ 26T board outline, HAT+ mounting relationship, GPIO/header stack height, PCIe cable/connector clearance, NPU package, and an AI-module cooling assembly that follows the same cooling-mechanism style as the Raspberry Pi 5 active cooler modeled in `designs/rpi5.scad`.

## Iteration: Correct PCIe Connector Location

The previous implementation rendered a hanging PCIe guidance feature at the AI HAT+ PCB level. That off-board hanging device is incorrect and must be removed.

The AI HAT+ PCIe connector must instead be represented as a connector on the left part of the AI HAT+ PCB. The model may keep a small on-board connector clearance block and an optional low-profile cable/routing hint that starts from that left-side connector, but it must not render a separate unsupported vertical or dangling device outside the AI PCB edge.

## Iteration: Center PCIe Port On PCB Side Margin

The left-side AI HAT+ PCIe port must be positioned so its connector centerline sits in the middle of the PCB side margin by default.

The default centerline must derive from the AI HAT+ board width rather than a fixed Y offset, so board-width tuning keeps the PCIe port centered on the side margin.

## Scope

- Add an editable OpenSCAD reference model for Raspberry Pi AI HAT+ 26T.
- Model the AI HAT+ board outline, thickness, rounded corners, four mounting holes, GPIO header/socket stack, 26 TOPS Hailo-8 accelerator package, component clearance blocks, left-side on-board PCIe FPC connector/cable guidance, spacer/stack-height guidance, and AI-module cooler preview.
- Use `designs/rpi5.scad` as the source of truth for Raspberry Pi 5 PCB dimensions, Raspberry Pi 5 mounting holes, Raspberry Pi 5 GPIO placement, Raspberry Pi 5 component clearance context, and Raspberry Pi 5 active-cooler envelope unless explicitly overridden by this spec.
- Preserve the existing `designs/rpi5.scad` Raspberry Pi 5 reference behavior while allowing the Raspberry Pi 5 active cooler geometry to be shared with the AI HAT+ design.
- The AI HAT+ model may use a separate reusable Raspberry Pi 5 active-cooler helper source so both `designs/rpi5.scad` and the new AI HAT+ source can call the same cooler geometry.
- Include render modes for:
  - full assembly/reference preview with Raspberry Pi 5, active cooler, AI HAT+, AI cooler, and stack/header guidance,
  - AI HAT+ board-only preview,
  - cooling/clearance preview,
  - separated printable or fit-check layout for visual inspection.
- Include independent visibility controls for the Raspberry Pi 5 reference, Raspberry Pi 5 active cooler, AI HAT+ electronics, AI HAT+ cooling assembly, GPIO/header stack, PCIe cable guidance, labels, and clearance envelopes.
- Keep all user-adjustable dimensions near the top of the file in grouped `Adjustable Parameters`.
- Keep derived values in a separate `Derived Values` section.
- Update `README.md` with the new design file, assumptions, parameters, render modes, source references, fit notes, and validation checklist entries.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- A vendor-certified cosmetic reproduction of every trace, silkscreen detail, chip package, screw, spring clip, or plastic connector feature.
- A precise PCB manufacturing model or production mechanical drawing.
- Electrical behavior, PCIe/software setup, Hailo runtime setup, camera integration, or operating-system validation.
- An enclosure or case for the Raspberry Pi 5 and AI HAT+ stack.
- Physical validation against a real AI HAT+ board, unless added by a later approved iteration.
- External OpenSCAD library dependencies.
- Changes to Raspberry Pi 5 board dimensions, mounting-hole coordinates, GPIO coordinates, or existing component positions except to move the active-cooler preview into a reusable helper without changing the rendered geometry.

## Definitions

- AI HAT+ 26T: Raspberry Pi AI HAT+ 26 TOPS variant using the Hailo-8 accelerator.
- HAT+: Raspberry Pi HAT+ add-on board form factor used by the AI HAT+ product.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and stack planning, not a certified vendor mechanical model.
- Raspberry Pi 5 coordinate system: the coordinate system and board geometry already exposed by `designs/rpi5.scad`.
- AI HAT+ coordinate system: origin at the AI HAT+ PCB bottom face, aligned to the Raspberry Pi 5 mounting-hole and GPIO coordinate basis when shown in stack assembly.
- Stack distance: the vertical distance between the Raspberry Pi 5 PCB and AI HAT+ PCB. For this design, the current distance between the two PCBs is `20.0 mm`.
- AI module header pins: the taller AI HAT+ header/pin envelope that extends `23.0 mm` from the AI HAT+ PCB.
- Cooling mechanism: the simplified heatsink/fan/thermal-pad/push-pin/cable style already represented by the Raspberry Pi 5 active cooler in `designs/rpi5.scad`.

## Research Sources

- Raspberry Pi AI HAT+ product page: https://www.raspberrypi.com/products/ai-hat/
- Raspberry Pi AI HAT+ product brief: https://datasheets.raspberrypi.com/ai-hat-plus/raspberry-pi-ai-hat-plus-product-brief.pdf
- Raspberry Pi AI HAT+ documentation: https://www.raspberrypi.com/documentation/accessories/ai-hat-plus.html
- Local source-of-truth Raspberry Pi 5 reference: `designs/rpi5.scad`
- Existing local HAT modeling patterns: `designs/seeed_grove_base_hat_zero.scad` and `designs/waveshare_eth_usb_hub_hat.scad`

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- The AI HAT+ 26T model must represent the 26 TOPS Hailo-8 variant, not the 13 TOPS Hailo-8L variant and not the newer AI HAT+ 2.
- The AI HAT+ reference must document that official Raspberry Pi mechanical dimensions are approximate, reference-only, and subject to tolerances.
- Default AI HAT+ board dimensions must use the official product brief physical-specification values where readable:
  - board length: `65.0 mm`,
  - board width: `56.5 mm`.
- Default AI HAT+ PCB thickness must be an adjustable `1.6 mm` common PCB reference unless a measured value is approved later.
- Default AI HAT+ mounting-hole positions must align to the Raspberry Pi 5 mounting-hole pattern from `designs/rpi5.scad` so stack hardware lines up with the Pi 5.
- Default AI HAT+ mounting-hole diameter must be adjustable and compatible with common Raspberry Pi M2.5 mounting hardware.
- The default vertical distance between the Raspberry Pi 5 PCB and the AI HAT+ PCB must be `20.0 mm`.
- The default AI module header/pin height from the AI HAT+ PCB must be `23.0 mm`.
- The model must include the official product relationship that the AI HAT+ is supplied with a stacking header, spacers, and screws for Raspberry Pi 5 with the Raspberry Pi Active Cooler in place.
- The model must include a visible clearance/envelope check for the Raspberry Pi 5 active cooler below the AI HAT+ PCB.
- The AI HAT+ cooling preview must use the same simplified cooling-mechanism language as the Raspberry Pi 5 active cooler: base/heatsink, fins, fan body/opening/hub, thermal pad/contact area, fastener/push-pin markers, and fan-cable guidance.
- AI HAT+ cooler dimensions and placement must be adjustable, because the official public product page and brief do not provide enough detailed cooler geometry for production-grade mechanical reproduction.
- The default Hailo-8 / NPU package footprint must be an adjustable `17.0 mm x 17.0 mm` package, placed as a simplified clearance feature based on the product-brief physical-specification callout.
- The model must include adjustable top-side component clearance blocks for major non-cooler components visible enough for enclosure planning, without attempting a trace-accurate board reproduction.
- The model must include adjustable PCIe FPC connector and cable-guidance geometry because the AI HAT+ communicates with Raspberry Pi 5 over PCIe.
- The PCIe FPC connector must be positioned on the left part of the AI HAT+ PCB by default.
- The PCIe FPC connector centerline must default to the middle of the AI HAT+ PCB side margin along board width.
- The PCIe FPC connector centerline must derive from the current AI HAT+ board width so side-margin centering is preserved when the board width is tuned.
- PCIe guidance must not create a hanging, unsupported, vertical, or separate device at the AI HAT+ PCB level.
- The model must remain usable as a child design reference through `use <...>` and named module calls.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the Raspberry Pi 5 reference, Raspberry Pi 5 active cooler, AI HAT+ PCB, AI HAT+ electronics, AI HAT+ cooler, GPIO/header stack, left-side on-board PCIe cable guidance, and clearance envelopes according to visibility toggles.
- `render_mode = "hat"` displays only the AI HAT+ PCB, mounting holes, GPIO/header reference, and optional board electronics according to visibility toggles.
- `render_mode = "cooling"` emphasizes Raspberry Pi 5 active-cooler clearance below the HAT and AI HAT+ cooler clearance above the HAT.
- `render_mode = "printable_layout"` displays separated reference/fit-check groups for visual inspection; it must not imply generated printable parts are being committed.
- `show_rpi5_reference` controls the Raspberry Pi 5 board/components reference independently from the AI HAT+.
- `show_rpi5_active_cooler` controls the Raspberry Pi 5 active cooler independently from the Raspberry Pi 5 board reference.
- `show_ai_hat_electronics` controls the Hailo-8 package, component clearance blocks, and other board electronics without hiding the AI HAT+ PCB or mounting holes.
- `show_pcie_guidance` controls the left-side on-board PCIe connector/routing guidance independently.
- `show_ai_hat_cooler` controls the AI HAT+ cooling assembly independently from other AI HAT+ electronics.
- `show_gpio_stack` controls the GPIO/header/socket stack preview independently from board and electronics previews.
- `show_clearance_guides` controls translucent stack-height, active-cooler, header-pin, and top-cooling clearance envelopes.
- The AI HAT+ PCB must render as a `65.0 mm x 56.5 mm` board by default.
- The AI HAT+ mounting holes must align with the Raspberry Pi 5 mounting holes from `designs/rpi5.scad`.
- In assembly mode, the AI HAT+ PCB must sit `20.0 mm` above the Raspberry Pi 5 PCB by default.
- In assembly mode, the AI module header/pin envelope must extend `23.0 mm` from the AI HAT+ PCB by default and must visibly exceed the nominal `20.0 mm` PCB-to-PCB stack distance.
- The Raspberry Pi 5 active cooler preview must render in the same location and with the same dimensions as the current `designs/rpi5.scad` active cooler preview after any helper extraction.
- The AI HAT+ cooler must render above the AI HAT+ NPU package and visibly use the same simplified base/fins/fan/pad/fastener/cable visual grammar as the Raspberry Pi 5 active cooler.
- The Hailo-8 package must be shown as a simplified adjustable package footprint and must be visibly associated with the AI HAT+ cooler contact area.
- The PCIe FPC connector/cable guidance must be visible in assembly and cooling/clearance modes by default, because the AI HAT+ communicates using the Raspberry Pi 5 PCIe interface.
- The default PCIe connector/guidance must sit on the left part of the AI HAT+ PCB, centered on the middle of the PCB side margin, and must not appear as a hanging object at the AI PCB level.
- The model must make manual calibration straightforward by exposing the AI HAT+ board size, stack distance, header height, NPU package size/position, cooler size/position, PCIe connector/cable dimensions, and component clearance blocks as adjustable parameters.

## Assumptions

- The user-requested "Raspberry Pi AI HAT+ (26T)" means the 26 TOPS Raspberry Pi AI HAT+ variant built around Hailo-8.
- "Use similar PCB as the raspberry pi hat has" means use the Raspberry Pi HAT+ full-size board footprint from the AI HAT+ product brief rather than a Pi Zero HAT footprint.
- `designs/rpi5.scad` is the repository authority for Raspberry Pi 5 PCB dimensions, mounting holes, GPIO coordinates, active-cooler location, and active-cooler shape.
- "fantop" means the top envelope and fan/cooling geometry of the Raspberry Pi 5 active-cooler preview in `designs/rpi5.scad`.
- A simplified rectangular/rounded clearance model is acceptable for components, PCIe connector, cable path, and cooler details until the physical AI HAT+ is measured.
- The official AI HAT+ product brief dimensions are good defaults for this reference model but are not production data.
- The design should be a standalone AI HAT+ reference file rather than folded into `designs/rpi5.scad`, because repository instructions make Raspberry Pi references reusable base models for child designs.

## Impact And Regression Considerations

- The implementation may introduce a reusable Raspberry Pi 5 active-cooler helper source and update `designs/rpi5.scad` to call it, but the Raspberry Pi 5 rendered active-cooler geometry must remain equivalent to the current `designs/rpi5.scad` output.
- Existing Pi Zero, Grove, Waveshare, and enclosure designs must not change behavior.
- README currently references a missing `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`; documentation must be corrected or replaced so it does not point users at a nonexistent design file.
- Dependent future enclosure designs may rely on the new AI HAT+ model's stack distance, header height, active-cooler envelope, and AI cooler envelope for clearance planning.
- Because the AI HAT+ cooler detail is approximate, README must warn that direct measurement or vendor CAD is needed before precision enclosure work.
- The design must preserve repository compatibility with Bambu Lab P2S and AMS 2 Pro fit-check workflows by avoiding committed generated mesh files and keeping printable/fit-check layouts non-floating when any printable helper geometry is added.

## Acceptance Criteria

- A new Raspberry Pi AI HAT+ 26T OpenSCAD reference source exists under `designs/`.
- The new source has grouped `Adjustable Parameters` and `Derived Values` sections near the top.
- The new source uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The new source uses `designs/rpi5.scad` as the optional Raspberry Pi 5 stack reference.
- The new source provides named modules for the full AI HAT+ reference, AI HAT+ board, GPIO/header stack, Hailo-8 package/component previews, AI HAT+ cooler, PCIe cable guidance, clearance guides, render-mode dispatch, printable/fit-check layout, and helper geometry.
- If the Raspberry Pi 5 active cooler is split into a reusable helper source, `designs/rpi5.scad` still exposes the same public Raspberry Pi 5 reference controls and renders the active cooler in the same default location with the same default dimensions.
- Default AI HAT+ board dimensions are `65.0 mm x 56.5 mm x 1.6 mm`.
- Default AI HAT+ mounting-hole positions align to `designs/rpi5.scad` Raspberry Pi 5 mounting-hole coordinates.
- Default Raspberry Pi 5-to-AI-HAT+ PCB spacing is `20.0 mm`.
- Default AI module header/pin height from the AI HAT+ PCB is `23.0 mm`.
- The model includes a visible Raspberry Pi 5 active-cooler clearance relationship under the AI HAT+.
- The model includes a visible AI HAT+ cooling assembly above the Hailo-8 package using the same simplified cooling-mechanism style as the Raspberry Pi 5 active cooler.
- The default Hailo-8 package footprint is adjustable and defaults to `17.0 mm x 17.0 mm`.
- The model includes adjustable left-side on-board PCIe FPC connector and cable guidance.
- The default PCIe FPC connector centerline derives from the AI HAT+ board width and sits at the middle of the PCB side margin.
- The model does not render a hanging PCIe guide or unsupported device at the AI HAT+ PCB level.
- Render modes include `assembly`, `hat`, `cooling`, and `printable_layout`.
- Visibility toggles independently control Raspberry Pi 5 reference, Raspberry Pi 5 active cooler, AI HAT+ electronics, AI HAT+ cooler, GPIO/header stack, PCIe guidance, labels, and clearance guides.
- README documents the new design file, assumptions, render modes, common adjustable parameters, optional OpenSCAD commands, and manual inspection checklist.
- README no longer presents the missing `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad` as an available current design file unless that file is intentionally restored by the approved plan.
- `git diff --check` passes.

## Validation Plan

- Review the OpenSCAD source for repository style compliance:
  - OpenSCAD 2021.01-compatible syntax,
  - no external library dependencies,
  - grouped adjustable parameters,
  - derived values separated from user-adjustable values,
  - descriptive `snake_case` names,
  - `_mm` and `_deg` suffixes where applicable,
  - named modules for major parts and repeated helpers.
- Run `git diff --check`.
- Run local OpenSCAD renders or exports to `/tmp` for:
  - AI HAT+ assembly mode,
  - AI HAT+ board/hat mode,
  - cooling/clearance mode,
  - printable/fit-check layout,
  - Raspberry Pi 5 reference mode after any active-cooler helper extraction.
- Visually inspect the temporary OpenSCAD outputs for:
  - AI HAT+ mounting-hole alignment with Raspberry Pi 5,
  - `20.0 mm` PCB-to-PCB stack relationship,
  - `23.0 mm` AI module header/pin envelope from the AI HAT+ PCB,
  - Raspberry Pi 5 active cooler clearance under the AI HAT+,
  - AI HAT+ cooler placement over the Hailo-8 package,
  - PCIe connector/guidance located on the left part of the AI HAT+ PCB, centered on the PCB side margin, with no hanging off-board device at PCB level,
  - non-floating separated fit-check layout,
  - absence of obvious disconnected or inverted geometry.

## Documentation Requirements

- Update `README.md` to list the new AI HAT+ 26T design source.
- Document that the AI HAT+ 26T is the Hailo-8 26 TOPS variant.
- Document that AI HAT+ board dimensions and physical callouts are approximate reference values from Raspberry Pi public materials, not production data.
- Document the default `65.0 mm x 56.5 mm x 1.6 mm` board, `20.0 mm` PCB-to-PCB stack distance, `23.0 mm` AI module header/pin height, and adjustable `17.0 mm x 17.0 mm` Hailo-8 package default.
- Document use of `designs/rpi5.scad` as the Raspberry Pi 5 fit reference.
- Document the reusable active-cooler relationship if a helper source is introduced.
- Document render modes, key visibility toggles, fit notes, optional OpenSCAD validation commands, and manual inspection checklist.
- Document that PCIe guidance is a left-side on-board connector/routing reference, centered on the PCB side margin, and not a separate hanging device.
- Remove or correct stale README references to missing AI HAT/case source files unless the approved implementation intentionally restores those files.
