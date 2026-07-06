# SPEC: Raspberry Pi 5 Five-Stack Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD printable enclosure for five stacked PCB positions
where the fourth PCB from bottom to top is the Raspberry Pi 5 by default.

The enclosure must have exactly two printable enclosure parts by default: a
bottom cover/tray and a top cover. The distance between every adjacent PCB must
be easy to configure, airflow between every PCB is mandatory, the base PCB must
mount to the bottom cover, the top cover must connect to the bottom cover using
the repository's existing male/female pin-and-socket principle, and the bottom
cover must provide anti-slip support.

## Problem Statement

The repository already has a Raspberry Pi 5 reference model and existing
enclosure patterns for removable top covers, bottom trays, male cover pins,
female tray sockets, anti-slide recesses, and adjustable stack spacing.

It does not have a focused enclosure for a simple five-board stack where every
board position shares the same footprint, the fourth board is the Raspberry Pi
5 by default, and the main fit variable is the configurable vertical distance
between boards.

## Scope

- Add a new editable OpenSCAD source for a five-board Raspberry Pi 5 stack
  enclosure.
- Use `designs/rpi5.scad` as the fit and clearance reference for Raspberry Pi 5
  board dimensions, mounting-hole positions, connector positions, GPIO/header
  position, microSD position, and optional active-cooler preview geometry.
- Model five same-footprint PCB positions by default, with PCB 4 as the
  Raspberry Pi 5 reference and service-access level.
- Make each of the four distances between adjacent PCBs independently
  configurable.
- Make the top clearance above the fifth/highest PCB configurable.
- Provide only two default printable enclosure parts:
  - bottom cover/tray,
  - top cover.
- Mount the base PCB to the bottom cover/tray using standoffs aligned to the
  Raspberry Pi 5 mounting holes.
- Provide configurable screw pilot holes or insert holes in the bottom-tray
  standoffs for the base PCB.
- Connect the bottom cover/tray and top cover using the same principle as other
  existing enclosures in this repository:
  - male cylindrical plug pins owned by the removable top cover,
  - matching female socket holes owned by the bottom cover/tray,
  - adjustable pin diameter, insertion length, socket clearance, socket depth,
    and pin positions.
- Provide anti-slip recesses or foot pockets on the bottom cover/tray underside.
- Provide real subtractive airflow openings between every adjacent PCB by
  default.
- Provide Raspberry Pi 5 access openings for the stack where necessary for
  serviceability and cable access.
- Include render modes for assembly, bottom cover/tray, top cover, electronics,
  and printable layout.
- Update `README.md` after implementation with the new design file,
  assumptions, manually entered dimensions, render modes, adjustable parameters,
  airflow strategy, bottom mounting, male/female connection, anti-slip behavior,
  printing guidance, and validation commands.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files committed to source
  control.
- Additional printable enclosure parts beyond the bottom cover/tray and top
  cover.
- Fans, fan mounts, display covers, display windows, header splitters, NVMe
  board placeholders, Cluster HAT placeholders, or other board-specific add-ons.
- Vendor-certified mechanical reproduction of Raspberry Pi 5 components,
  fasteners, labels, traces, heatsinks, coolers, cables, or board-to-board
  spacer hardware.
- Electrical, thermal, airflow simulation, operating-system, or load testing.
- Physical test-print validation unless separately requested.
- A sealed, dustproof, weatherproof, or acoustically optimized enclosure.
- Changes to existing Raspberry Pi 5 reference behavior unless an approved plan
  explicitly allows a minimal helper/accessor change.

## Definitions

- Five-stack enclosure: a printed enclosure for five PCB positions stacked
  vertically in one shared footprint, with one configurable Raspberry Pi 5
  reference/access position.
- PCB index: a 1-based board number from bottom to top. PCB 1 is the base PCB,
  and PCB 5 is the highest PCB.
- Inter-PCB distance: the configurable vertical distance from one PCB top face
  to the next PCB bottom face.
- Bottom cover/tray: the lower printable enclosure body that provides the floor,
  shallow side wall or locating lip, base-PCB mounting standoffs, female cover
  sockets, and underside anti-slip features.
- Top cover: the removable upper printable enclosure body that encloses the
  stack height and owns the male cover pins.
- Male/female connection method: cylindrical male pins extending from the top
  cover into matching female cylindrical socket holes in the bottom cover/tray,
  following the existing Pi Zero USB Grove IR enclosure and Raspberry Pi 5 AI
  HAT+ enclosure principle.
- Airflow between PCBs: real openings through the enclosure side walls aligned
  to each of the four gaps between adjacent PCBs so air can move laterally
  through every inter-board space.

## Research Sources

- Local Raspberry Pi 5 source of truth: `designs/rpi5.scad`.
- Existing Raspberry Pi 5 enclosure style and mirrored-geometry precedent:
  `designs/rpi5_ai_hat_plus_26t_enclosure.scad`.
- Existing top-cover/bottom-tray male/female connection reference:
  `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Existing repository documentation: `README.md`.
- Existing deleted-in-worktree tower-stack artifacts were reviewed only as prior
  context; this spec intentionally excludes their fans, display cover, NVMe
  boards, and Cluster HAT behavior.

## Manually Entered Dimension Assumptions

The following dimensions are planning defaults until the real hardware stack is
measured. They must be user-adjustable and documented in README after
implementation:

- Raspberry Pi 5 board length: `85.0 mm`.
- Raspberry Pi 5 board width: `56.0 mm`.
- Raspberry Pi 5 board thickness: `1.6 mm`.
- Raspberry Pi 5 board corner radius: `3.0 mm`.
- Raspberry Pi 5 mounting-hole positions: copied from `designs/rpi5.scad`.
- Raspberry Pi 5 mounting-hole diameter: `2.75 mm`.
- Stack PCB count: `5`.
- Initial inter-PCB distances: an adjustable four-value vector defaulting to
  `15.0 mm` for every adjacent PCB gap.
- Raspberry Pi 5 stack index: `4`, meaning the fourth PCB from bottom to top is
  the Pi 5 by default.
- Top-of-fifth-PCB-to-top-cover clearance: an adjustable value.
- Bottom-tray wall/lip height: shallow enough that the bottom cover remains the
  smaller enclosure half and the top cover carries the main stack height.
- Anti-slip recess diameter, depth, and positions: configurable bottom-open
  recesses for rubber feet, shallow enough not to break through the floor.
- Base-PCB standoff height, outer diameter, screw pilot diameter/depth, and
  optional insert diameter/depth: configurable for the actual fastener method.
- Cover pin diameter, insertion length, root/support diameter, socket clearance,
  socket depth, socket receiver diameter, and pin positions: configurable for
  printer/material fit.
- Airflow slot count, size, spacing, side enablement, and per-gap vertical
  placement: configurable so the vents can follow changed board spacing.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The design must not require external library dependencies.
- The design should be one coherent editable `.scad` file unless an approved
  implementation plan justifies a small helper.
- User-adjustable variables must be near the top in a clearly labeled
  `Adjustable Parameters` section, grouped by purpose.
- Derived values must live in a separate `Derived Values` section.
- Linear dimensions must use `_mm`; angles must use `_deg`.
- The Raspberry Pi 5 reference must use `designs/rpi5.scad` for reference
  rendering and should mirror Raspberry Pi 5 source values only when OpenSCAD
  `use` visibility prevents direct variable access.
- Any mirrored Raspberry Pi 5 values must be clearly named and documented as
  local mirrors of `designs/rpi5.scad`.
- All five PCBs must share one board-origin convention and one enclosure
  footprint, with Raspberry Pi 5 connector/service geometry applied to the
  configured Pi 5 PCB index.
- Changing an inter-PCB distance must update downstream PCB positions, airflow
  gap centers, top-cover height, and related clearance geometry.
- Printable versions must be Bambu Lab-friendly:
  - no floating printable objects in `printable_layout`,
  - bottom cover/tray and top cover separable and independently printable,
  - broad/stable faces downward unless a specific approved geometry reason
    prevents it.
- Generated mesh exports must not be added to source control.
- The design must favor adjustable fit and visual validation over pretending
  precision for unmeasured spacers, cables, heatsinks, or installed accessories.

## Deterministic Behavior

- The new source must expose `render_mode` values for:
  - `assembly`,
  - `bottom_tray`,
  - `top_cover`,
  - `electronics`,
  - `printable_layout`.
- `assembly` must show the bottom cover/tray, top cover, male/female connector
  interface, and optional five-board Raspberry Pi 5 reference stack.
- `bottom_tray` must show only the printable lower body with base-PCB standoffs,
  female cover-pin sockets, and underside anti-slip recesses.
- `top_cover` must show only the printable top cover with male cover pins and
  stack airflow openings.
- `electronics` must show the five PCB positions without printable enclosure
  bodies, with the Raspberry Pi 5 reference at the configured Pi 5 index and
  generic PCB placeholders for the other positions.
- `printable_layout` must place the bottom cover/tray and top cover separated on
  the print plane with no floating printable geometry.
- Visibility toggles must independently control:
  - five-board Raspberry Pi 5 reference stack,
  - optional Raspberry Pi 5 active-cooler previews if used,
  - GPIO/header and microSD reference visibility when exposed by the reference,
  - clearance/cutout guides.
- The default stack must contain exactly five PCB positions.
- PCB 4 must be the Raspberry Pi 5 reference/service-access position by default.
- PCB 1, the base PCB, must be supported by bottom-tray standoffs aligned to the
  Raspberry Pi 5 mounting-hole pattern.
- The bottom-tray standoffs must include configurable screw pilot holes or insert
  holes for fastening PCB 1 to the bottom cover.
- PCBs 2 through 5 may be represented as Raspberry Pi 5 reference previews only;
  the printed enclosure is not required to include separate spacer hardware for
  every board unless the approved plan adds it.
- Four inter-PCB distances must be controlled by an obvious adjustable vector or
  equivalent grouped parameters.
- The top cover height must derive from PCB 5 top Z plus the configurable
  top-of-stack clearance and roof thickness.
- The bottom cover/tray must remain the smaller/shallow enclosure half by
  default; the top cover must carry the main stack height.
- Airflow between PCBs is mandatory:
  - every inter-board gap must have real subtractive lateral grate openings on
    at least two opposing side walls by default,
  - airflow openings must be derived from each gap center so spacing changes move
    the openings with the boards,
  - airflow count, slot size, spacing, side enablement, and margins must be
    adjustable,
  - default airflow openings must avoid cover pins, tray sockets, base standoffs,
    and required Raspberry Pi 5 access openings.
- Additional top or bottom ventilation may be provided only if it remains part
  of the two printable enclosure parts and does not replace the required
  inter-PCB side airflow.
- The top cover must own male plug pins by default.
- The bottom cover/tray must subtract matching female socket holes by default.
- The male/female interface must expose adjustable defaults comparable to the
  existing enclosures:
  - cover pin diameter,
  - cover pin insertion length,
  - socket clearance,
  - socket depth,
  - cover pin count,
  - cover pin positions.
- Default pin/socket placement must avoid Raspberry Pi 5 boards, mounting
  standoffs, airflow slots, and major port/service openings.
- The bottom cover/tray underside must include configurable anti-slip recesses
  or foot pockets by default.
- Raspberry Pi 5 access openings must include at minimum:
  - USB-A and Ethernet side access for each board zone where those connectors
    would otherwise be blocked,
  - USB-C and micro-HDMI front access for each board zone where those connectors
    would otherwise be blocked,
  - microSD access for at least the base PCB and any additional PCB zones where
    access is practical without weakening the enclosure,
  - service openings or open relief for GPIO/header, camera/display, and PCIe
    connector zones when those features would otherwise conflict with the top
    cover or airflow strategy.
- Raspberry Pi 5 cutouts must derive from `designs/rpi5.scad` source values or
  clearly documented local mirror values plus adjustable clearance parameters.
- Existing design files must keep their current behavior.

## Assumptions

- "5 stacked pi5 pcb" now means five same-footprint PCB positions where the
  fourth position is the Raspberry Pi 5 by default; the other positions may be
  represented as generic PCB placeholders until specific board hardware is
  approved.
- Only PCB 1 is mechanically fastened directly to the bottom cover/tray by this
  enclosure. Physical board-to-board spacers between PCBs are assumed to be
  external hardware unless a later approved spec expands the printed support
  system.
- Airflow between PCBs means lateral airflow through the enclosure at every
  inter-board gap; this spec does not require fan mounts.
- The exact installed headers, heatsinks, coolers, cables, and spacers are not
  known, so their clearance must remain tunable through parameters and visual
  OpenSCAD inspection.
- A functional rectangular/rounded tower enclosure with strong service openings
  and adjustable ventilation is preferred over cosmetic reproduction.

## Impact And Regression Considerations

- The new enclosure should be isolated to a new `.scad` source and README, spec,
  and plan documentation updates.
- Existing Raspberry Pi 5 reference files and existing enclosures must continue
  to render as before unless a minimal helper/accessor change is explicitly
  approved later.
- Mirrored Raspberry Pi 5 source values can drift if `designs/rpi5.scad`
  changes; code and README must make those mirrored values easy to audit.
- Dense side airflow across four gaps can weaken tall top-cover walls; default
  placement must preserve material around corners, pins, sockets, standoffs, and
  port openings.
- A five-board stack can become tall and flexible; physical fit and stability
  remain unvalidated until the real hardware is measured, sliced, and test
  printed.
- Port openings repeated across five board levels may weaken the enclosure; the
  implementation must balance access with wall continuity and document any
  access limits.

## Acceptance Criteria

- A proposed implementation plan can target a new OpenSCAD source under
  `designs/` for the Raspberry Pi 5 five-stack enclosure.
- The approved implementation must create grouped `Adjustable Parameters` and
  `Derived Values` sections near the top of the source.
- The source must use OpenSCAD 2021.01-compatible syntax and no external library
  dependencies.
- The source must use `designs/rpi5.scad` for Raspberry Pi 5 reference geometry.
- The source must model exactly five PCB positions by default.
- The source must default `rpi5_stack_index_from_top` to `4`, deriving the
  bottom-up Pi 5 stack index from that top-down position.
- All five PCB positions must share the same footprint and coordinate frame.
- The four distances between adjacent PCBs must be independently configurable.
- Changing a board distance must move downstream boards, airflow openings, and
  top-cover height coherently.
- The distance from the top of PCB 5 to the top cover must be controlled by an
  obvious adjustable parameter.
- The default printable enclosure must be exactly two parts: bottom cover/tray
  and top cover.
- `printable_layout` must contain only the bottom cover/tray and top cover,
  separated on the print plane with no floating printable objects.
- PCB 1 must mount to bottom-tray standoffs aligned to Raspberry Pi 5 mounting
  holes.
- Bottom-tray standoffs must include configurable screw pilot holes or insert
  holes.
- The top cover must own male plug pins by default.
- The bottom cover/tray must own matching female socket holes by default.
- The pin/socket interface must be adjustable and visibly similar in concept to
  the existing repository cover-pin/tray-socket interface.
- The bottom cover/tray must include configurable anti-slip recesses or foot
  pockets by default.
- Every inter-PCB gap must have real subtractive lateral airflow openings on at
  least two opposing side walls by default.
- Airflow openings must derive from inter-PCB gap centers and remain adjustable.
- Default airflow openings must avoid pin/socket, standoff, and major access
  geometry.
- Raspberry Pi 5 USB-A, Ethernet, USB-C, micro-HDMI, microSD, GPIO/header,
  camera/display, and PCIe service zones must have openings or documented relief
  where they would otherwise be blocked by the enclosure.
- Render modes must include `assembly`, `bottom_tray`, `top_cover`,
  `electronics`, and `printable_layout`.
- README must document the new design file, assumptions, manually entered
  dimensions, render modes, adjustable parameters, per-gap stack spacing,
  top-cover clearance, base-PCB mounting, anti-slip behavior, male/female
  connection method, airflow strategy, printing guidance, and validation
  commands.
- `git diff --check` must pass after implementation.

## Validation Plan

- Review the OpenSCAD source for repository style compliance:
  - OpenSCAD 2021.01-compatible syntax,
  - no external library dependencies,
  - grouped adjustable parameters,
  - derived values separated from user-adjustable values,
  - descriptive `snake_case` names,
  - `_mm` and `_deg` suffixes where applicable,
  - named modules for major parts, previews, cutouts, ventilation, pin/socket
    geometry, anti-slip recesses, and repeated helpers.
- Run `git diff --check`.
- Run local OpenSCAD renders or exports to `/tmp` for:
  - `assembly`,
  - `bottom_tray`,
  - `top_cover`,
  - `electronics`,
  - `printable_layout`.
- Stop any OpenSCAD render that takes more than 15 seconds, per repository
  guidance.
- Visually inspect generated OpenSCAD outputs for:
  - five PCB positions with the Raspberry Pi 5 reference at PCB 4 by default,
  - coherent board spacing changes,
  - top-cover height derived from stack height and top clearance,
  - base PCB mounted to bottom-tray standoffs,
  - bottom tray remains shallow and top cover carries the main height,
  - top cover has male pins,
  - bottom tray has matching female sockets,
  - anti-slip recesses exist on the tray underside,
  - every inter-PCB gap has real side airflow openings,
  - airflow openings move with changed gap spacing,
  - airflow openings avoid default pin/socket and standoff geometry,
  - required Raspberry Pi 5 service/access openings exist,
  - bottom tray and top cover are separated and grounded in printable layout,
  - no generated mesh exports are tracked by git.

## Documentation Requirements

- Update `README.md` to list the new Raspberry Pi 5 five-stack enclosure source.
- Document that the design targets five stacked Raspberry Pi 5 PCBs.
- Document the manually entered dimension assumptions and that real spacers,
  coolers, headers, and cables must be measured for final fit.
- Document render modes and common adjustable parameters.
- Document the per-gap PCB spacing controls and top-cover clearance control.
- Document the base-PCB mounting strategy.
- Document the top-cover-male and bottom-tray-female connection method.
- Document bottom anti-slip recesses or foot pockets.
- Document the mandatory inter-PCB side airflow strategy.
- Document Raspberry Pi 5 access/opening strategy and any intentionally limited
  access areas.
- Document Bambu Lab-friendly printability expectations.
- Document that OpenSCAD render inspection is visual validation only and
  physical fit requires measurement, slicer inspection, and test printing.
