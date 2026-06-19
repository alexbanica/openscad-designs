# SPEC: Raspberry Pi 5 AI HAT+ 26T Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD printable enclosure for the Raspberry Pi 5 plus `designs/rpi5_ai_hat_plus_26t.scad` stack.

The enclosure must protect the stack while keeping all Raspberry Pi 5 ports accessible, preserving fan airflow, and using a top-cover plus bottom-tray construction with a male/female connection method similar to the existing Pi Zero USB Grove IR enclosure.

## Problem Statement

The repository has a Raspberry Pi 5 reference model in `designs/rpi5.scad` and an AI HAT+ 26T stack reference in `designs/rpi5_ai_hat_plus_26t.scad`, but it does not yet have a printable enclosure for that assembly.

The new enclosure must use the Raspberry Pi 5 coordinate system and port definitions instead of duplicating fixed connector positions. It also needs adjustable cutouts and ventilation because the stack includes a Raspberry Pi 5 active cooler and an AI HAT+ cooler/fan assembly.

## Scope

- Add a new editable OpenSCAD enclosure source for the Raspberry Pi 5 plus AI HAT+ 26T stack.
- Use `designs/rpi5.scad` as the coordinate and connector source for Raspberry Pi 5 board dimensions, mounting-hole positions, GPIO placement, microSD placement, USB, Ethernet, USB-C power, micro-HDMI, camera/display connectors, and PCIe connector positions.
- Use `designs/rpi5_ai_hat_plus_26t.scad` as the stack reference for AI HAT+ board size, stack height, GPIO/header stack, AI HAT+ cooler, PCIe guidance, and clearance envelopes.
- Provide a bottom tray and removable top cover.
- Use a male/female top-cover-to-bottom-tray connection method based on the existing `designs/pi_zero_usb_grove_ir_enclosure.scad` cover-pin/tray-socket pattern:
  - male cylindrical plug pins owned by the removable top cover,
  - matching female socket holes owned by the bottom tray,
  - adjustable pin diameter, insertion length, socket clearance, socket depth, and pin positions,
  - visible/pass-through or easy-to-inspect receiving holes where practical.
- Keep all modeled Raspberry Pi 5 ports accessible through enclosure cutouts or service openings.
- Add adjustable lateral ventilation patterns on the enclosure side walls for fan airflow.
- Add top ventilation over the AI HAT+ cooler/fan area where it does not conflict with cover strength or required access.
- Include printable render modes for bottom tray, top cover, assembled enclosure, electronics/reference preview, and separated printable layout.
- Update `README.md` with the new design file, assumptions, parameters, render modes, port-access behavior, airflow guidance, and validation commands.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- Vendor-certified mechanical reproduction of the Raspberry Pi 5, AI HAT+ 26T, cooler hardware, fan blades, fasteners, labels, or traces.
- Electrical, thermal, PCIe, Hailo runtime, camera, display, or operating-system validation.
- A weatherproof or dustproof enclosure.
- A snap-fit or latch design beyond the approved male/female plug-pin and socket interface.
- Changes to `designs/rpi5.scad`, `designs/rpi5_ai_hat_plus_26t.scad`, or `designs/rpi5_active_cooler.scad` behavior unless a minimal helper/accessor addition is required and explicitly documented by the implementation plan.
- Physical test-print validation unless separately requested.

## Definitions

- Raspberry Pi 5 coordinate system: the board coordinate basis used by `designs/rpi5.scad`, with connector origins and sizes defined in that source.
- AI HAT+ stack: the Raspberry Pi 5 with active cooler plus AI HAT+ 26T assembly represented by `designs/rpi5_ai_hat_plus_26t.scad`.
- Bottom tray: the lower printable enclosure body that holds the board stack and owns the female sockets for the cover pins.
- Top cover: the removable upper printable enclosure body that closes the enclosure and owns the male plug pins.
- Male/female connection method: cylindrical male pins extending from one printed part into matching female cylindrical socket holes in another printed part, following the existing Pi Zero enclosure cover-pin/tray-socket pattern.
- Lateral ventilation: side-wall openings intended to allow air exchange across the Raspberry Pi 5 active cooler and AI HAT+ cooler/fan zones.
- Port access: an opening large enough to visually expose and physically plug into the modeled connector envelope, with adjustable clearance.

## Research Sources

- Local Raspberry Pi 5 source of truth: `designs/rpi5.scad`.
- Local Raspberry Pi 5 active-cooler helper: `designs/rpi5_active_cooler.scad`.
- Local AI HAT+ 26T stack reference: `designs/rpi5_ai_hat_plus_26t.scad`.
- Existing top-cover/bottom-tray enclosure and male/female connection reference: `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Existing repository documentation: `README.md`.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external library dependencies.
- Generated mesh exports must not be committed.
- The enclosure source must be one coherent editable `.scad` file unless the approved implementation plan justifies a small helper.
- The default enclosed stack must use:
  - Raspberry Pi 5 board length `85.0 mm`, width `56.0 mm`, thickness `1.6 mm`, and corner radius `3.0 mm` from `designs/rpi5.scad`,
  - Raspberry Pi 5 mounting-hole coordinates from `designs/rpi5.scad`,
  - AI HAT+ board length `65.0 mm`, width `56.5 mm`, thickness `1.6 mm`, default Pi-to-HAT PCB spacing `20.0 mm`, and AI module pin/socket stack height `23.0 mm` from `designs/rpi5_ai_hat_plus_26t.scad`,
  - Raspberry Pi 5 active-cooler envelope from `designs/rpi5_active_cooler.scad`.
- The enclosure must expose user-adjustable parameters near the top of the file, grouped by purpose.
- Derived values must live in a separate `Derived Values` section.
- Linear dimensions must use `_mm`; angles must use `_deg`.
- The design must include named modules for major printable parts, previews, cutout volumes, ventilation patterns, and repeated helper geometry.
- Printable parts must be Bambu Lab-friendly:
  - no floating printable objects in `printable_layout`,
  - bottom tray and top cover separated for independent printing,
  - broadest, most stable face downward unless a specific approved geometry reason prevents it.
- The design must remain usable as a child design reference through `use <...>` and named module calls.
- The default design must favor adjustability over pretending precision where the AI HAT+ cooler and cable details are approximate.

## Deterministic Behavior

- The new source must default to a separated printable layout or another repository-consistent default that does not hide the printable parts.
- `render_mode = "assembly"` displays the bottom tray, top cover, male/female connector interface, and optional electronics/reference stack in assembled positions.
- `render_mode = "bottom_tray"` displays only the printable bottom tray with female cover-pin sockets and board-stack mounting/support geometry.
- `render_mode = "top_cover"` displays only the printable top cover with male cover pins, port/top cutouts, and ventilation openings.
- `render_mode = "electronics"` displays the Raspberry Pi 5 and AI HAT+ stack reference without printable enclosure bodies.
- `render_mode = "printable_layout"` displays the bottom tray and top cover separated on the print plane with no floating printable geometry.
- Visibility toggles must independently control:
  - Raspberry Pi 5 reference,
  - Raspberry Pi 5 active cooler,
  - AI HAT+ reference,
  - AI HAT+ cooler,
  - clearance guides,
  - labels if labels are implemented.
- The bottom tray must include Raspberry Pi 5 mounting/support features aligned to the Raspberry Pi 5 mounting-hole positions from `designs/rpi5.scad`.
- The top cover must use male cover pins by default, and the bottom tray must subtract matching female sockets by default.
- The male/female interface must expose adjustable defaults comparable to the existing Pi Zero enclosure:
  - cover pin diameter,
  - cover pin insertion length,
  - socket clearance,
  - socket depth,
  - cover pin count,
  - cover pin X/Y offsets or explicit centers.
- The default pin/socket placement must avoid modeled Raspberry Pi 5 ports, mounting holes, active-cooler envelope, AI HAT+ cooler envelope, and major port cutout volumes.
- The enclosure must include cutouts for the modeled Raspberry Pi 5 connector set:
  - two USB-A ports,
  - Ethernet port,
  - USB-C power port,
  - two micro-HDMI ports,
  - camera/display connector A,
  - camera/display connector B,
  - PCIe connector/cable guidance area,
  - microSD slot/card access.
- Port cutout centers and sizes must derive from the current `designs/rpi5.scad` connector origin and size variables, plus adjustable enclosure clearance values.
- If OpenSCAD `use` visibility prevents directly reading a source variable, the implementation may mirror the current value in the enclosure only when the mirrored value is clearly named as a local copy of the `rpi5.scad` source and README documents the relationship.
- Port cutouts must remain adjustable individually or by grouped clearance controls so later physical fitting can tune them without rewriting modules.
- The enclosure must include lateral ventilation on both long side walls by default.
- Lateral ventilation must be adjustable by side, count, opening size, spacing, and vertical position.
- Lateral ventilation must be placed to support airflow around the Raspberry Pi 5 active cooler and AI HAT+ cooler/fan zones without cutting through the male/female cover pins or tray sockets by default.
- The top cover must include adjustable top ventilation above the AI HAT+ cooler/fan zone by default unless it conflicts with the male/female connector interface.
- Ventilation cutouts must be real subtractive openings, not only visual markings.
- The design must include enough internal clearance above the AI HAT+ cooler/fan and header stack to avoid modeled intersection with the top cover.
- The enclosure must include adjustable wall, floor, roof, port clearance, component clearance, and fit-clearance values.
- The design must not change existing Pi Zero, Grove, Waveshare, Raspberry Pi 5 reference, or AI HAT+ reference behavior.

## Assumptions

- The requested `rpi5_ai_hat_plus_26t.scad` means the existing local `designs/rpi5_ai_hat_plus_26t.scad` reference model.
- "All rpi5 ports" means every connector or service-access feature currently modeled in `designs/rpi5.scad`, including the microSD card and camera/display/PCIe connector areas, not only the external shell-edge ports.
- Camera/display and PCIe access may be represented as cable/service openings because the exact ribbon cable route is hardware- and installation-dependent.
- The enclosure may prioritize airflow and service access over sealed side walls.
- The male/female connection method should reuse the top-cover-male, bottom-tray-female direction from the existing Pi Zero enclosure unless the user explicitly reverses it before implementation.
- A simplified rectangular/rounded enclosure with functional cutouts and vents is preferred over cosmetic reproduction.

## Impact And Regression Considerations

- The new enclosure should be isolated to a new `.scad` source and README/spec/plan documentation updates.
- Existing reference models must continue to render as before unless a minimal helper/accessor change is approved in the implementation plan.
- Port cutouts tied to local copies of `rpi5.scad` values can drift if the Raspberry Pi 5 reference changes; README and code comments must make those copied relationships easy to audit.
- Side-wall ventilation can weaken the enclosure if it intersects pin/socket or support features, so default vent placement must preserve enough material around connector pins, sockets, corners, and mounting supports.
- Top ventilation improves airflow but may reduce cover stiffness; default hole count/diameter/spacing must leave continuous material around cover pins and the cover perimeter.
- Physical fit remains unvalidated until measured against real hardware and a test print.

## Acceptance Criteria

- A new Raspberry Pi 5 AI HAT+ 26T enclosure OpenSCAD source exists under `designs/`.
- The source has grouped `Adjustable Parameters` and `Derived Values` sections near the top.
- The source uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The source uses or references `designs/rpi5.scad` and `designs/rpi5_ai_hat_plus_26t.scad` for electronics/reference geometry.
- Render modes include `assembly`, `bottom_tray`, `top_cover`, `electronics`, and `printable_layout`.
- The bottom tray and top cover are separately printable in `printable_layout` with no floating printable objects.
- The top cover owns male plug pins by default.
- The bottom tray owns matching female socket holes by default.
- The male/female connection parameters are adjustable and documented.
- The pin/socket interface is visibly similar in concept to the existing Pi Zero enclosure cover-pin/tray-socket interface.
- The bottom tray includes Raspberry Pi 5 mounting/support geometry aligned to `designs/rpi5.scad` mounting-hole positions.
- Cutouts or service openings exist for all Raspberry Pi 5 connector/service features modeled in `designs/rpi5.scad`: USB-A, Ethernet, USB-C power, two micro-HDMI ports, two camera/display connectors, PCIe connector/guidance area, and microSD.
- Port cutout dimensions and positions derive from `rpi5.scad` values or clearly documented local mirrors plus adjustable clearance values.
- Both lateral side walls include adjustable real ventilation openings by default.
- The top cover includes adjustable real ventilation openings over the AI HAT+ cooler/fan area by default.
- Default ventilation does not intersect default cover pins, tray sockets, mounting supports, or major port cutout volumes.
- The assembled default geometry does not visibly intersect the Raspberry Pi 5 active cooler, AI HAT+ cooler, GPIO/header stack, or port connector envelopes.
- Visibility toggles allow electronics/reference geometry to be shown for fit checks and hidden for printable part renders.
- README documents the new design file, assumptions, render modes, adjustable parameters, male/female connection method, port-access strategy, ventilation strategy, and validation commands.
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
  - assembly,
  - bottom tray,
  - top cover,
  - electronics/reference preview,
  - printable layout.
- Visually inspect generated OpenSCAD outputs for:
  - all modeled Raspberry Pi 5 port openings present,
  - port openings aligned to Raspberry Pi 5 connector envelopes,
  - bottom tray and top cover separated and on the print plane in printable layout,
  - male pins visible on the top cover,
  - matching female sockets visible or inspectable in the bottom tray,
  - no default pin/socket collision with ports, mounting supports, or vents,
  - lateral ventilation is open through the side walls,
  - top ventilation is open through the cover,
  - no visible intersection with the active cooler, AI HAT+ cooler, GPIO/header stack, or microSD access.

## Documentation Requirements

- Update `README.md` to list the new enclosure source.
- Document that the enclosure targets the Raspberry Pi 5 plus AI HAT+ 26T stack.
- Document that `designs/rpi5.scad` is the coordinate and port source for the enclosure.
- Document any local mirrored Raspberry Pi 5 connector dimensions if OpenSCAD source visibility requires them.
- Document render modes and common adjustable parameters.
- Document the top-cover-male, bottom-tray-female connection method and its adjustable parameters.
- Document the port-access strategy for edge ports, camera/display connectors, PCIe connector/guidance, and microSD.
- Document lateral and top ventilation behavior and tuning parameters.
- Document that OpenSCAD render inspection is visual validation only and physical fit requires measurement and test printing.

## Super-Agent Update: Front Cable Fit

Status: Approved

### Purpose

Adjust the Raspberry Pi 5 AI HAT+ 26T enclosure front-wall USB-C and micro-HDMI openings so the user's measured adapter cable heads can pass through.

### Requested Behavior

- The two micro-HDMI front-wall openings must fit a measured adapter head with a 12.0 mm length and 6.66 mm width.
- The USB-C power front-wall opening must fit a 12.0 mm x 7.0 mm cable head.
- The openings must include a small printable error margin.

### Scope

- Update `designs/rpi5_ai_hat_plus_26t_enclosure.scad` front-wall cable cutout sizing only.
- Update README documentation for the new tuning parameters and default effective opening sizes.
- Preserve the existing Raspberry Pi 5 mirrored connector centers and all unrelated enclosure behavior.

### Out Of Scope

- Physical test-print validation.
- Generated mesh exports committed to source control.
- Changes to Raspberry Pi 5 reference models or AI HAT+ reference models.
- Side USB-A, Ethernet, camera/display, PCIe, microSD, ventilation, mounting, cover-pin, or socket behavior changes.

### Inputs And Constraints

- Micro-HDMI adapter required face: 12.0 mm x 6.66 mm.
- USB-C cable required face: 12.0 mm x 7.0 mm.
- Small total cable-fit margin: 0.6 mm.
- OpenSCAD source must remain OpenSCAD 2021.01-compatible.
- The front openings must remain centered on the mirrored Raspberry Pi 5 connector origins.

### Deterministic Behavior Delivered

- `front_cable_cutout_error_margin_mm = 0.6` controls the additional total cable-head margin for front cable openings.
- `micro_hdmi_adapter_head_required_size_mm = [12.0, 6.66]` sets the measured micro-HDMI adapter head requirement.
- `usb_c_cable_head_required_size_mm = [12.0, 7.0]` sets the USB-C cable head requirement.
- The derived micro-HDMI effective minimum opening is 12.6 mm x 7.26 mm.
- The derived USB-C effective minimum opening is 12.6 mm x 7.6 mm.
- Each front cutout uses the larger of the existing connector-derived opening and the cable-head effective minimum, so existing connector clearances are not reduced.

### Assumptions

- "Length" maps to the front-wall horizontal opening dimension along X.
- "Width" maps to the front-wall vertical opening dimension along Z.
- "Small error margin" is a 0.6 mm total margin, consistent with prior small cable-fit margins in this repository.

### Impact And Regression Considerations

- Larger front-wall openings reduce front-wall material around USB-C and micro-HDMI ports, but preserve connector centers and avoid changing the enclosure envelope.
- Physical cable fit is still unvalidated until checked against the actual cable heads and a printed part.

### Validation Performed

- `git diff --check`
- Targeted source/documentation searches for the new cable-fit parameters and effective opening documentation.

### Validation Skipped

- OpenSCAD render/export inspection was skipped because the `super-agent` workflow limits validation to commands expected to complete within 10 seconds.
- Physical fit and test-print validation were skipped.

### Documentation Changes

- README now documents the cable-head parameters, default measured values, default effective minimum openings, and the need to inspect USB-C and micro-HDMI front openings.

## Super-Agent Update: Combined Right-Side USB/Ethernet Cutout

Status: Approved

### Purpose

Remove the unnecessary enclosure wall split between the Raspberry Pi 5 right-side USB-A ports and Ethernet port.

### Requested Behavior

- The right-side USB-A and Ethernet access must be one continuous side-wall cutout.
- The enclosure must not leave a divider or split between the two USB-A openings and the Ethernet opening.

### Scope

- Update `designs/rpi5_ai_hat_plus_26t_enclosure.scad` right-side USB/Ethernet cutout behavior only.
- Update README documentation for the continuous right-side port opening.
- Preserve all front USB-C, micro-HDMI, camera/display, PCIe, microSD, ventilation, mounting, cover-pin, socket, and enclosure-envelope behavior.

### Out Of Scope

- Physical test-print validation.
- Generated mesh exports committed to source control.
- Changes to Raspberry Pi 5 reference models or AI HAT+ reference models.
- Changing the mirrored Raspberry Pi 5 connector dimensions.

### Inputs And Constraints

- The combined cutout must derive from the existing mirrored Raspberry Pi 5 USB-A and Ethernet connector origins and sizes.
- OpenSCAD source must remain OpenSCAD 2021.01-compatible.
- The shared side-wall opening must keep the existing grouped `edge_port_clearance_mm` behavior.

### Deterministic Behavior Delivered

- `right_usb_ethernet_cutout_origin_mm` derives the minimum source-space origin across the two USB-A connector envelopes and the Ethernet connector envelope.
- `right_usb_ethernet_cutout_size_mm` derives the union size across those same connector envelopes.
- `port_cutouts_mm` now contains one `right_usb_ethernet` right-side cutout entry instead of separate `usb_lower`, `usb_upper`, and `ethernet` right-side entries.
- The existing right-side cutout volume logic subtracts one continuous opening for the grouped USB-A and Ethernet access.

### Assumptions

- "Split in enclosure between the USB ports and the ETH port" refers to the right-side wall material left between individually modeled USB-A and Ethernet access openings.
- A single continuous opening across the full USB-A/Ethernet group is preferred over preserving separate USB-A openings.

### Impact And Regression Considerations

- Removing the divider reduces right-side wall material around the USB-A/Ethernet group.
- The change improves plug access but may reduce local side-wall stiffness.
- Port alignment still depends on the mirrored Raspberry Pi 5 connector values.

### Validation Performed

- `git diff --check`
- Targeted source/documentation searches for the combined `right_usb_ethernet` cutout and stale separate right-side port entries.
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`

### Validation Skipped

- Full OpenSCAD assembly and electronics exports were skipped to stay within the bounded `super-agent` validation scope.
- Physical fit and test-print validation were skipped.

### Documentation Changes

- README now documents the continuous right-side USB-A/Ethernet access opening and corresponding manual inspection expectation.

## Super-Agent Update: Top Cover Inner Roof Height

Status: Approved

### Purpose

Raise the Raspberry Pi 5 AI HAT+ 26T enclosure top-cover inner roof target height to match the user's requested 55.0 mm clearance above the Raspberry Pi PCB bottom.

### Requested Behavior

- Set `ai_hat_pcb_top_to_cover_top_height_mm` to `31.8`.
- The resulting target inner roof position is based on:
  - Raspberry Pi PCB bottom Z: 7.4 mm,
  - target inner roof Z: 7.4 mm + 55.0 mm = 62.4 mm,
  - AI HAT+ PCB top Z: 30.6 mm,
  - required AI HAT+ PCB top to inner roof height: 62.4 mm - 30.6 mm = 31.8 mm.

### Scope

- Update `designs/rpi5_ai_hat_plus_26t_enclosure.scad` top-cover height parameter only.
- Update README documentation for the new default height.
- Preserve all enclosure cutout, ventilation, mounting, cover-pin, socket, and reference-model behavior.

### Out Of Scope

- Physical test-print validation.
- Generated mesh exports committed to source control.
- Changes to Raspberry Pi 5 reference models or AI HAT+ reference models.

### Inputs And Constraints

- User-provided target inner roof clearance above Raspberry Pi PCB bottom: 55.0 mm.
- User-provided Raspberry Pi PCB bottom Z: 7.4 mm.
- User-provided AI HAT+ PCB top Z: 30.6 mm.
- OpenSCAD source must remain OpenSCAD 2021.01-compatible.

### Deterministic Behavior Delivered

- `ai_hat_pcb_top_to_cover_top_height_mm` is now `31.8`.
- The effective top-cover height calculation continues to clamp this value against the header-stack requirement using `ai_hat_pcb_top_to_cover_top_effective_height_mm`.

### Assumptions

- The user's provided Z positions are the source of truth for this height adjustment.
- No other enclosure dimensions need to change for this requested parameter update.

### Impact And Regression Considerations

- The default top cover becomes taller by 3.3 mm relative to the previous 28.5 mm parameter.
- Increased height may improve internal clearance but changes the printed cover height and assembled enclosure height.
- Physical fit remains unvalidated until checked against the real hardware and a printed part.

### Validation Performed

- `git diff --check`
- Targeted source/documentation searches for `ai_hat_pcb_top_to_cover_top_height_mm` and `31.8`.

### Validation Skipped

- OpenSCAD render/export inspection was skipped because the `super-agent` workflow limits validation to commands expected to complete within 10 seconds.
- Physical fit and test-print validation were skipped.

### Documentation Changes

- README now documents the 31.8 mm default and the target inner roof calculation inputs.
