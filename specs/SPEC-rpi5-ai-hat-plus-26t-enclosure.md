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
