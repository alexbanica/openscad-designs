# SPEC: Raspberry Pi Tower Stack Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD printable enclosure for a vertical Raspberry Pi-size
tower stack with five PCBs, a Raspberry Pi 5 as the fourth PCB, top-cover fan
mounting for two small square fans, strong Raspberry Pi 5 airflow, and a covered
perpendicular display assembly that leaves only the display face exposed.

The design must preserve later tuning of PCB spacing, the top-cover clearance
above the stack, fan dimensions, fan placement, and display/window dimensions
through user-adjustable parameters.

## Iteration 2026-07-06: Alignment, Two-Fan Airflow, Under-Pi5 Cooling, And Screen Cover

Physical/visual review of the first tower model showed several issues that the
final design contract must make explicit:

- PCB references must share one Raspberry Pi-size coordinate frame. The
  Raspberry Pi 5 fourth-board reference must sit inside the same tower footprint
  and enclosure envelope as the other PCB references, not outside the case.
- The top cover must provide two usable internal fan mounts by default. The
  fans mount on the inside face of the top cover, the top cover must include
  real through-cover air openings or grilles for both fans, and the default
  airflow intent is one intake fan and one exhaust fan.
- The Pi 5 zone needs under-board airflow for NVMe modules with heatsinks and a
  PCI splitter beneath the Raspberry Pi 5 PCB. The design must provide
  adjustable bottom/side air passages under the Pi 5 board, not only top-cover
  or side vents above the Pi 5.
- The perpendicular screen/display assembly attached through the Pi 5 HAT
  splitter must have an actual cover shown in assembly and available through the
  display-cover/printable-layout render paths. The cover must hide the display
  body/PCB while exposing only the screen face/window.

## Problem Statement

The repository has reusable Raspberry Pi 5 reference geometry and existing
top-cover/bottom-tray enclosure patterns, but it does not yet have a generic
five-PCB Raspberry Pi-size tower enclosure.

The requested tower needs to model most PCBs as simplified Raspberry Pi-size
boards with headers, while using the existing Raspberry Pi 5 model for the
fourth board so Raspberry Pi 5 holes, ports, service areas, and airflow needs
remain accessible. The top cover must support internal fan mounting for two
small square fans, with one fan configured as intake and the other as exhaust.
The design also needs a perpendicular display enclosure connected through a
Raspberry Pi 5 HAT header splitter that provides both vertical and lateral
header paths.

## Scope

- Add a new editable OpenSCAD design for the Raspberry Pi tower stack enclosure.
- Model a five-PCB vertical stack using Raspberry Pi-size board outlines.
- Use `designs/rpi5.scad` as the fit and clearance reference for the fourth PCB,
  including Raspberry Pi 5 board shape, mounting holes, port/service positions,
  GPIO/header position, microSD access, and optional active-cooler reference.
- Model the other four PCBs as simplified Raspberry Pi-size placeholder boards
  with adjustable board dimensions, thickness, mounting-hole geometry, and
  header preview geometry.
- Make PCB-to-PCB vertical spacing configurable for each gap, not only as one
  global stack height.
- Make the distance from the top of the highest PCB to the top cover easily
  configurable.
- Provide a bottom cover/tray and top cover using the same principle as other
  cover designs in this repository:
  - male cylindrical plug pins owned by the removable top cover,
  - matching female socket holes owned by the bottom tray,
  - adjustable pin diameter, insertion length, socket clearance, socket depth,
    and pin positions.
- Provide accessible Raspberry Pi 5 holes and service openings for the fourth
  PCB.
- Provide extra air holes around the Raspberry Pi 5 board zone, with emphasis on
  side and/or top airflow paths near the Pi 5 active-cooler/SoC area.
- Provide under-board air passages beneath the Raspberry Pi 5 PCB for NVMe
  modules with heatsinks and the PCI splitter.
- Provide internal top-cover mounting support for two small square fans matching
  the supplied fan style, with both fan slots physically usable by default.
- Provide air openings/grilles through the top cover for both fans and document
  the default intake/exhaust direction intent.
- Model the fan mounts as configurable square fan footprints with adjustable
  body size, thickness/envelope, hole spacing, hole diameter, screw boss size,
  and mounting position.
- Provide a perpendicular display cover connected to the Pi 5 HAT lateral header
  path, covering the display PCB/body while leaving only the active display face
  exposed through a window.
- Model the Pi 5 HAT header splitter as simplified vertical and lateral header
  preview geometry:
  - one splitter leg plugs into the Pi 5 GPIO/header area,
  - one vertical header leg supports another PCB above the Pi 5,
  - one lateral header leg supports the perpendicular display assembly.
- Include render modes for assembly, bottom tray, top cover, electronics/stack
  references, display cover, and printable layout.
- Update `README.md` after implementation with design assumptions, manually
  entered dimensions, render modes, adjustable parameters, printing guidance,
  and validation commands.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files committed to source
  control.
- Vendor-certified mechanical reproduction of the fan, fan cable/connector,
  display module, header splitter, or non-Pi PCBs.
- Electrical, thermal, airflow simulation, fan performance, display operation,
  GPIO signal, or cable strain validation.
- Physical test-print validation unless separately requested.
- A sealed, dustproof, weatherproof, or acoustically optimized enclosure.
- Tool-less fan retention; fan support may use screw holes/bosses.
- Changes to existing Raspberry Pi 5 reference behavior unless an approved plan
  explicitly allows a minimal helper/accessor change.

## Definitions

- Tower stack: five Raspberry Pi-size PCBs arranged vertically with configurable
  spacing between adjacent PCBs.
- Fourth PCB: the Raspberry Pi 5 board in the stack, counted from bottom to top.
- Simplified PCB: a placeholder Raspberry Pi-size board body with mounting holes
  and header preview geometry but no detailed electronics.
- Top-cover clearance: the configurable vertical distance from the top face of
  the highest PCB body to the inside/top-cover target envelope, plus roof
  thickness where needed for the exterior top.
- Fan mount: top-cover internal screw/boss and airflow opening geometry for a
  small square fan matching the supplied image style.
- Intake fan slot: the fan mount documented and positioned to push air into the
  enclosure through its top-cover opening.
- Exhaust fan slot: the fan mount documented and positioned to pull air out of
  the enclosure through its top-cover opening.
- Under-Pi5 airflow path: adjustable bottom and/or lower-side ventilation
  openings and internal clearance under the Raspberry Pi 5 PCB so air can move
  across NVMe heatsinks and the PCI splitter beneath the Pi 5.
- Display cover: the printed enclosure extension around the perpendicular
  display module, with a window/opening that exposes only the active display
  face.
- Header splitter: simplified fit geometry for the Pi 5 HAT header split that
  provides both vertical and lateral 40-pin header paths.

## Research Sources

- Local Raspberry Pi 5 source of truth: `designs/rpi5.scad`.
- Existing Raspberry Pi 5 enclosure style and mirrored-geometry precedent:
  `designs/rpi5_ai_hat_plus_26t_enclosure.scad`.
- Existing top-cover/bottom-tray male/female connection reference:
  `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Existing repository documentation: `README.md`.
- User-supplied fan image for the fan style and mounting intent.

## Manually Entered Dimension Assumptions

The following dimensions are planning defaults until the real hardware is
measured. They must be user-adjustable and documented in README after
implementation:

- Generic Raspberry Pi-size placeholder PCB: `85.0 mm x 56.0 mm x 1.6 mm`.
- Generic Raspberry Pi-size placeholder mounting-hole positions: match the
  Raspberry Pi 5 mounting-hole coordinate pattern from `designs/rpi5.scad` by
  default.
- Stack PCB count: `5`.
- Raspberry Pi 5 stack index: `4`.
- Initial per-gap PCB spacing: use an adjustable vector with conservative
  defaults rather than a hard-coded single height.
- Top-of-PCB-to-top-cover clearance: use an adjustable value with a conservative
  default that can be increased for wiring, fans, display/header splitter
  clearance, and airflow.
- Fan footprint: a configurable square fan, initially assumed to be a small
  `30.0 mm x 30.0 mm` class fan until measured.
- Fan thickness/envelope: configurable, initially assumed `7.0 mm`.
- Fan mounting-hole spacing: configurable, initially assumed `24.0 mm` square
  hole-center spacing until measured.
- Fan mounting-hole diameter: configurable, initially assumed `3.0 mm`.
- Fan airflow direction labels/parameters: two default fan slots, one intake and
  one exhaust, with direction documented as assembly intent rather than
  simulated airflow.
- Under-Pi5 NVMe/heatsink/PCI splitter envelope: configurable placeholder
  clearance dimensions until the real modules and splitter are measured.
- Display PCB/body size, active display window size, and display offset from the
  lateral header: configurable placeholder dimensions until the real display is
  measured.
- Header splitter vertical and lateral envelope sizes: configurable simplified
  clearance blocks, not precision hardware models.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The design must not require external library dependencies.
- The design should be one coherent editable `.scad` file unless an approved
  implementation plan justifies a small helper.
- The design must keep user-adjustable variables near the top in a clearly
  labeled `Adjustable Parameters` section, grouped by purpose.
- Derived values must live in a separate `Derived Values` section.
- Linear dimensions must use `_mm`; angles must use `_deg`.
- The Raspberry Pi 5 board must use `designs/rpi5.scad` for reference rendering
  and should mirror Raspberry Pi 5 source values only when OpenSCAD `use`
  visibility prevents direct variable access.
- The Raspberry Pi 5 reference and all placeholder PCB references must be
  transformed through the same board-origin convention so the Pi 5 PCB remains
  inside the tower footprint, inside the tray/cover envelope, and aligned with
  stack supports and cutouts.
- Any mirrored Raspberry Pi 5 values must be clearly named and documented as
  local mirrors of `designs/rpi5.scad`.
- Printable versions must be Bambu Lab-friendly:
  - no floating printable objects in `printable_layout`,
  - each printable object separable and independently printable,
  - broad/stable faces downward unless a specific approved geometry reason
    prevents it.
- Generated mesh exports must not be added to source control.
- The design must favor adjustable fit and serviceability over pretending exact
  precision for unmeasured fan, display, and splitter hardware.

## Deterministic Behavior

- The new source must expose `render_mode` values for:
  - `assembly`,
  - `bottom_tray`,
  - `top_cover`,
  - `display_cover`,
  - `electronics`,
  - `printable_layout`.
- `assembly` must show the assembled enclosure with optional tower stack,
  Raspberry Pi 5 reference, fan preview geometry, header splitter preview, and
  display assembly preview.
- `bottom_tray` must show only the printable lower enclosure body with female
  cover-pin sockets and stack support/mounting features.
- `top_cover` must show only the printable top cover with male cover pins, fan
  mounts, fan airflow openings, and top/side ventilation features owned by the
  cover.
- `display_cover` must show only the printable display cover/extension when it
  is separable; if the approved implementation keeps it integrated with another
  printable part, this render mode must isolate that printable region for visual
  inspection.
- `electronics` must show the five-board stack references without printable
  enclosure bodies.
- `printable_layout` must place all printable enclosure parts separated on the
  print plane with no floating printable geometry.
- Visibility toggles must independently control:
  - simplified PCB placeholders,
  - Raspberry Pi 5 reference,
  - Raspberry Pi 5 active cooler if rendered through the reference,
  - headers/header splitter,
  - fan previews,
  - display preview,
  - clearance/cutout guides.
- The five PCBs must be positioned from bottom to top using a configurable
  spacing list/vector so each inter-board gap can be tuned independently.
- The fourth PCB must be the Raspberry Pi 5 reference by default.
- The fourth-board Raspberry Pi 5 reference must align to the same enclosure
  coordinate frame as the placeholder PCBs. The board outline, mounting holes,
  GPIO/header area, and mirrored cutout references must be checked together so
  the Pi 5 is not translated outside the shell.
- The other four PCBs must render as simplified Raspberry Pi-size boards with
  mounting holes and header previews.
- The bottom tray must include support/standoff or clearance features aligned to
  the Raspberry Pi-size mounting-hole pattern.
- The Raspberry Pi 5 service/access openings must include, at minimum:
  - mounting-hole access or visible/usable hole alignment for the fourth PCB,
  - USB-A access,
  - Ethernet access,
  - USB-C power access,
  - dual micro-HDMI access,
  - camera/display connector access or service opening,
  - PCIe connector/cable guidance access or service opening,
  - microSD access.
- Raspberry Pi 5 cutouts must derive from `designs/rpi5.scad` source values or
  clearly documented local mirror values plus adjustable clearance parameters.
- Raspberry Pi 5 airflow must include extra real subtractive air holes near the
  fourth-board Pi 5 zone. These holes must be adjustable by count, size,
  spacing, side/face enablement, and position.
- Raspberry Pi 5 under-board airflow must include real subtractive lower
  side-wall and/or bottom-tray air passages beneath the fourth PCB. These
  passages must be adjustable by count, size, spacing, enablement, and position,
  and must preserve tray strength around standoffs, sockets, and mounting
  supports.
- The top cover must provide two internal fan mounting positions by default.
- Each fan mount must include:
  - a real airflow opening or grille through the top cover,
  - screw holes or screw bosses aligned to configurable fan-hole spacing,
  - adjustable fan body/envelope preview,
  - enough independent parameters to tune for the measured fan.
- Both fan mounts must be internally mountable and physically usable by default.
- One default fan mount must be documented as intake and the other as exhaust.
- The two fan mounts must not intersect each other by default and must avoid the
  cover pin/socket interface, top-cover walls, and display-cover geometry by
  default.
- The design may remain printable if one fan is omitted, but the default design
  target is a two-fan intake/exhaust build.
- The top-cover clearance above the stack must be controlled by an obvious
  user-adjustable parameter, with derived enclosure height values based on it.
- The display cover must position a perpendicular display assembly off the Pi 5
  lateral header path.
- The display cover must be present in the assembly view, isolated by the
  `display_cover` render mode, and included in `printable_layout` unless a later
  approved implementation explicitly integrates it into another printable part.
- The display cover must subtract a display-window opening sized to the active
  display face plus adjustable clearance.
- The default display cover must hide/cover the display PCB/body while leaving
  only the active display face/window exposed.
- The display/header splitter model must include simplified vertical and lateral
  header clearance previews so collisions with the fifth PCB, top cover, fan
  mounts, and display cover can be visually checked.
- The male/female top-cover-to-bottom-tray interface must follow the existing
  repository principle:
  - top cover owns male pins by default,
  - bottom tray owns matching female socket holes by default,
  - pin/socket sizes and positions are adjustable.
- Default pin/socket placement must avoid modeled Raspberry Pi 5 ports,
  ventilation holes, fan mounts, display cover geometry, and board supports.
- Existing design files must keep their current behavior.

## Assumptions

- "Raspberry Pi size" means the Raspberry Pi 5 board outline by default:
  `85.0 mm x 56.0 mm`.
- "5 pcb raspberry pi size" means five stacked boards using the same footprint,
  with the fourth board replaced by the detailed Raspberry Pi 5 reference.
- "Pi5 holes accessible" means the fourth-board mounting holes and relevant Pi 5
  service/port areas must not be buried behind solid printed walls by default.
- "Air holes specially for the Pi 5 pcb" means extra ventilation is required
  near the fourth-board Pi 5 area in addition to any fan/top ventilation, and
  this now includes under-board airflow for NVMe heatsinks and a PCI splitter
  beneath the Pi 5.
- The supplied fan image is treated as a small square axial fan with four corner
  screw holes and a wire pigtail; exact size must be measured and tuned through
  parameters.
- The display module dimensions are not yet known, so the first implementation
  must use clearly documented adjustable placeholder dimensions.
- The display is mounted perpendicular to the tower through the lateral header
  side of the Pi 5 HAT header splitter.
- The vertical header branch of the splitter supports another PCB above the Pi 5
  within the five-board stack.
- The screen/display cover is required printable geometry, not only a preview
  placeholder.
- A functional rectangular/rounded tower enclosure with service openings,
  airflow, fan mounts, and adjustable display cover is preferred over cosmetic
  reproduction.

## Impact And Regression Considerations

- The new tower stack should be isolated to a new `.scad` source and README,
  spec, and plan documentation updates.
- Existing Raspberry Pi 5 reference files must continue to render as before
  unless a minimal helper/accessor change is explicitly approved later.
- Mirrored Raspberry Pi 5 source values can drift if `designs/rpi5.scad`
  changes; code and README must make those mirrored values easy to audit.
- Unknown fan and display measurements create physical-fit risk until the real
  hardware is measured and test printed.
- Dense ventilation and fan openings can weaken the top cover and side walls;
  default placement must preserve material around cover pins, tray sockets,
  corners, board supports, and fan screw bosses.
- Dense under-Pi5 ventilation can weaken the bottom tray near standoffs and
  socket receivers; default placement must preserve structural material while
  still creating an airflow path across the NVMe/heatsink/PCI splitter area.
- The perpendicular display cover adds a side projection that may affect
  printability, stability, and support needs; printable layout must keep parts
  separable and Bambu Lab-friendly.
- Airflow holes and display/header openings must not hide or block the Pi 5
  service openings required for cabling and maintenance.

## Acceptance Criteria

- A proposed implementation plan can target the OpenSCAD source under `designs/`
  for the Raspberry Pi tower stack enclosure.
- The approved implementation must create grouped `Adjustable Parameters` and
  `Derived Values` sections near the top of the source.
- The source must use OpenSCAD 2021.01-compatible syntax and no external library
  dependencies.
- The source must use `designs/rpi5.scad` for the fourth-board Raspberry Pi 5
  reference.
- The source must model five configurable Raspberry Pi-size PCB positions.
- The Raspberry Pi 5 PCB reference must be visibly aligned inside the enclosure
  and inside the same tower footprint as the placeholder PCBs.
- PCB-to-PCB spacing must be configurable per inter-board gap.
- The fourth PCB must default to the Raspberry Pi 5 reference.
- The other four PCBs must default to simplified Raspberry Pi-size board models
  with headers.
- The distance from the top of the highest PCB to the top cover must be
  controlled by an obvious adjustable parameter.
- The bottom tray/top cover must use a top-cover-male and bottom-tray-female
  pin/socket connection method similar in principle to the existing repository
  cover designs.
- Raspberry Pi 5 mounting holes, ports, microSD, camera/display, and PCIe
  service areas must have openings or access paths by default.
- Extra adjustable ventilation openings must exist near the Raspberry Pi 5 zone.
- Extra adjustable under-Pi5 airflow openings/passages must exist for NVMe
  heatsinks and the PCI splitter beneath the Pi 5 board.
- The top cover must support two configurable internal fan mounts that are both
  usable by default.
- The top cover must include real air openings/grilles for both fan mounts.
- The fan mounts must document one intake fan and one exhaust fan by default.
- The design may remain usable when only one fan is installed, but the default
  target is two-fan intake/exhaust airflow.
- Fan dimensions, fan-hole spacing, screw-hole diameter, and fan positions must
  be adjustable.
- The display cover must enclose the perpendicular display body/PCB and expose
  only the active display face through a window by default.
- The display/screen cover must appear in assembly and printable-layout render
  paths, and `display_cover` must isolate it for inspection.
- Display body size, active display window size, and display offset must be
  adjustable.
- The header splitter must be represented by simplified vertical and lateral
  header clearance geometry.
- Render modes must include `assembly`, `bottom_tray`, `top_cover`,
  `display_cover`, `electronics`, and `printable_layout`.
- `printable_layout` must contain only separable printable parts on the print
  plane with no floating printable objects.
- README must document the tower design file, assumptions, manually entered
  dimensions, render modes, adjustable parameters, fan/display tuning, Pi 5
  access, ventilation, printing guidance, and validation commands.
- `git diff --check` must pass after implementation.

## Validation Plan

- Review the OpenSCAD source for repository style compliance:
  - OpenSCAD 2021.01-compatible syntax,
  - no external library dependencies,
  - grouped adjustable parameters,
  - derived values separated from user-adjustable values,
  - descriptive `snake_case` names,
  - `_mm` and `_deg` suffixes where applicable,
  - named modules for major parts, previews, fan mounts, display cover, cutouts,
    ventilation, and repeated helpers.
- Run `git diff --check`.
- Run local OpenSCAD renders or exports to `/tmp` for:
  - `assembly`,
  - `bottom_tray`,
  - `top_cover`,
  - `display_cover`,
  - `electronics`,
  - `printable_layout`.
- Visually inspect generated OpenSCAD outputs for:
  - five-board stack positioning,
  - fourth-board Raspberry Pi 5 placement,
  - configurable board spacing behavior,
  - top-cover clearance behavior,
  - Raspberry Pi 5 service and port openings,
  - extra Pi 5-zone ventilation holes,
  - under-Pi5 airflow passages for the NVMe/heatsink/PCI splitter area,
  - two internal fan mounts with usable screw-hole/boss layout and through-cover
    air openings,
  - one fan documented as intake and the other documented as exhaust,
  - no default fan-mount collision with cover pins or walls,
  - perpendicular display cover and display window behavior,
  - header splitter vertical/lateral clearance geometry,
  - bottom tray and top cover pin/socket alignment,
  - all printable parts separated and grounded in printable layout,
  - no generated mesh exports tracked by git.

## Documentation Requirements

- Update `README.md` to list the new tower stack enclosure source.
- Document the five-PCB stack model and that the fourth PCB is the Raspberry
  Pi 5 reference by default.
- Document the manually entered dimension assumptions and that fan/display
  dimensions must be measured for final fit.
- Document render modes and common adjustable parameters.
- Document per-gap PCB spacing and top-cover clearance controls.
- Document the top-cover-male and bottom-tray-female connection method.
- Document Raspberry Pi 5 access/opening strategy.
- Document Pi 5-zone ventilation and top fan support strategy.
- Document under-Pi5 airflow support for NVMe heatsinks and the PCI splitter.
- Document how to tune the two fan mounts and the default intake/exhaust airflow
  intent.
- Document the perpendicular display cover, display-window sizing, and header
  splitter assumptions.
- Document that OpenSCAD render inspection is visual validation only and physical
  fit requires measurement, slicer inspection, and test printing.
