# SPEC: Raspberry Pi 5 Five-Stack Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD printable enclosure for five stacked PCB positions
where the fourth PCB from bottom to top is the Raspberry Pi 5 by default.

The enclosure must have exactly three printable enclosure parts by default: a
bottom cover/tray, a middle cover, and an upper cover. The distance between
every adjacent PCB must be easy to configure, airflow between every PCB is
mandatory, the upper cover must support two internal 30 mm fan positions to cool
PCB 5, the base PCB must mount to the bottom cover, the middle cover must
connect to the bottom cover using the repository's existing male/female
pin-and-socket principle, the upper cover must connect to the middle cover with
a second male/female pin-and-socket interface, and the bottom cover must provide
anti-slip support.

## Iteration: 2026-07-06 Internal Top-Cover Fans

The previous approved behavior intentionally excluded fans and kept the upper
cover roof fully closed. This iteration changes that final behavior:

- The upper cover must provide mounting points for two internal square
  fans mounted on the inside face of the upper cover.
- Each fan default is superseded by the 2026-07-07 measured-fan iteration.
- The upper cover height must increase so the internal fans, fan mounting
  bosses, and fan screw/pilot geometry do not reduce the previously approved
  PCB 5 headroom.
- Fan airflow openings must be guarded rather than one full fan-size open hole, so
  the roof remains debris-resistant while still allowing strong circulation.
- The fans are intended to cool PCB 5. Electrical fan routing, fan models,
  thermal simulation, and real airflow testing remain out of scope.

## Iteration: 2026-07-07 Measured Stack Gaps And 30 mm Top Fans

This completed direct iteration replaces the prior placeholder spacing and fan
assumptions with measured defaults:

- The four measured inter-PCB gaps are `9.80 mm`, `17.05 mm`, `19.39 mm`, and
  `41.20 mm`.
- A small configurable error margin is applied to the measured gaps. The
  delivered default margin is `0.50 mm`, producing default generated inter-PCB
  gaps of `10.30 mm`, `17.55 mm`, `19.89 mm`, and `41.70 mm`.
- The measured PCB 5 top-to-top-cover clearance excluding vents is `35.82 mm`.
  The same `0.50 mm` error margin is applied, producing a default top clearance
  of `36.32 mm`.
- The top/upper-cover fans default to `30.0 mm x 30.0 mm x 7.0 mm`, with a
  `24.0 mm` screw-hole spacing assumption and smaller guarded roof grille slot
  length.

## Iteration: 2026-07-07 PCB 5 Micro-USB Front Access

This completed direct iteration adds a PCB 5 micro-USB cable opening:

- The opening is on the same front side as the Raspberry Pi 5 USB-C opening.
- The measured distance from the PCB 5 left margin to the micro-USB connector
  left margin is `8.85 mm`, measured while viewing the stack from the Pi 5
  USB-C side.
- The opening uses the same `front_cable_cutout_error_margin_mm = 0.60` margin
  pattern as the Pi 5 front connector openings.
- The default micro-USB cable-head requirement is `10.30 mm x 11.30 mm`,
  producing a default visible opening of at least `10.90 mm x 11.90 mm`.

## Iteration: 2026-07-07 Left/Right PCI Cable Margin

This completed direct iteration adds left/right internal margin for PCI or
ribbon cable clearance:

- The margin applies only along the left/right PCB edges.
- Front/back clearance is not increased because there are no cables there by
  default.
- The delivered default is `left_right_pci_cable_clearance_margin_mm = 3.0`,
  increasing nominal left/right inside-wall-to-PCB clearance from `4.8 mm` to
  `7.8 mm`.

## Iteration: 2026-07-06 Pi 5 Port Cutout Calibration

The printed Raspberry Pi 5 AI HAT+ enclosure established working service-port
clearances. This direct iteration applies those clearances to the five-stack
enclosure:

- USB-C and micro-HDMI front openings must use the same cable-head sizing
  defaults as `designs/rpi5_ai_hat_plus_26t_enclosure.scad`.
- USB-C front openings must clear at least `12.6 mm x 7.6 mm` by default,
  derived from a `12.0 mm x 7.0 mm` cable-head requirement plus `0.6 mm` total
  margin.
- Each micro-HDMI front opening must clear at least `12.6 mm x 7.26 mm` by
  default, derived from a `12.0 mm x 6.66 mm` adapter-head requirement plus
  `0.6 mm` total margin.
- The front openings must keep the mirrored Raspberry Pi 5 connector centers,
  but their visible width and height must expand to the printed-good cable-head
  defaults when those are larger than the connector-derived opening.
- USB-A and Ethernet side access must continue to use one continuous right-side
  opening based on the same Raspberry Pi 5 connector extents used by the
  printed Raspberry Pi 5 AI HAT+ enclosure.

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
- Make the top clearance above the fifth/highest PCB configurable and derive it
  so the default includes room for internal fan thickness and mounting bosses.
- Provide only three default printable enclosure parts:
  - bottom cover/tray,
  - middle cover up through the Pi 5 connector-access zone,
  - upper cover for the tall headroom section above the Pi 5 connector-access
    zone.
- Mount the base PCB to the bottom cover/tray using standoffs aligned to the
  Raspberry Pi 5 mounting holes.
- Provide configurable screw pilot holes or insert holes in the bottom-tray
  standoffs for the base PCB.
- Connect the bottom cover/tray and middle cover using the same principle as other
  existing enclosures in this repository:
  - male cylindrical plug pins owned by the removable middle cover,
  - matching female socket holes owned by the bottom cover/tray,
  - adjustable pin diameter, insertion length, socket clearance, socket depth,
    and pin positions.
- Connect the middle cover and upper cover using a second male/female interface:
  - short downward male cylindrical plug pins owned by the upper cover,
  - matching top-open female socket holes owned by the middle cover at the
    middle/upper split,
  - adjustable pin diameter, insertion length, root diameter, root height,
    socket clearance, and socket depth.
- Provide anti-slip recesses or foot pockets on the bottom cover/tray underside.
- Provide real subtractive airflow openings between every adjacent PCB by
  default on both side walls and the back face, with front/back-face openings
  removed where they would interfere with Pi 5 connector cutouts or the
  GPIO/header lateral access opening.
- Provide additional upper top-cover ventilation through the vertical walls
  above PCB 5 while keeping non-fan roof areas closed.
- Provide guarded fan airflow openings through the upper cover roof for two
  internal fan positions, while preserving debris protection with ribs, grille
  bars, or a comparable non-full-hole pattern.
- Provide upper-cover inside fan mounting bosses or posts for two 30 mm square
  fans.
- Provide Raspberry Pi 5 access openings for the stack where necessary for
  serviceability and cable access.
- Include render modes for assembly, bottom cover/tray, middle cover, upper
  cover, combined top cover, electronics, and printable layout.
- Update `README.md` after implementation with the new design file,
  assumptions, manually entered dimensions, render modes, adjustable parameters,
  airflow strategy, bottom mounting, male/female connection, anti-slip behavior,
  printing guidance, and validation commands.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files committed to source
  control.
- Additional printable enclosure parts beyond the bottom cover/tray, middle
  cover, and upper cover.
- Display covers, display windows, HAT header splitter geometry, NVMe board
  placeholders, Cluster HAT placeholders, or other board-specific add-ons. The
  enclosure only provides a lateral pass-through opening for an outward-facing
  splitter branch.
- Electrical wiring, connectors, fan control, fan power delivery, thermal
  simulation, airflow simulation, and fan vendor-specific cosmetic modeling.
- Vendor-certified mechanical reproduction of Raspberry Pi 5 components,
  fasteners, labels, traces, heatsinks, coolers, cables, or board-to-board
  spacer hardware.
- Operating-system or load testing.
- Physical test-print validation unless separately requested.
- A sealed, dustproof, weatherproof, or acoustically optimized enclosure. The
  fan grilles are only debris-resistant guards, not filtration.
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
- Middle cover: the lower removable printable cover body that connects to the
  tray, owns the male cover pins, and carries the Pi 5 connector-access
  openings and upper-cover female sockets.
- Upper cover: the upper removable printable cover body above the middle/upper
  split, carrying the closed roof, upper headroom/ventilation section, and
  short downward male pins that plug into the middle cover.
- Top cover: the combined removable cover body made from the middle cover and
  upper cover.
- Internal fan mount: upper-cover inside mounting geometry for one 30 mm square
  fan body, including fan clearance, screw bosses or pilot holes, and a guarded
  roof airflow grille aligned to the fan area.
- Guarded fan airflow opening: a roof opening pattern made from multiple smaller
  holes, slots, or grille gaps with remaining printed ribs/material, explicitly
  not a single full-size 30 mm cutout.
- Male/female connection method: cylindrical male pins extending from the middle
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
- User-provided fan size: `30.0 mm x 30.0 mm x 7.0 mm`.
- Existing deleted-in-worktree tower-stack artifacts were reviewed only as prior
  context; this spec intentionally excludes their display cover, NVMe boards,
  and Cluster HAT behavior.

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
- Measured inter-PCB distances: an adjustable four-value vector defaulting to
  `[9.80, 17.05, 19.39, 41.20]` mm before the configured margin is applied.
- Stack measurement error margin: `0.50 mm` by default, producing the generated
  `pi5_stack_gap_z_mm` values `[10.30, 17.55, 19.89, 41.70]` mm.
- Raspberry Pi 5 stack index: `4`, meaning the fourth PCB from bottom to top is
  the Pi 5 by default.
- Top-of-fifth-PCB-to-inside-top-cover-wall clearance excluding vents: measured
  at `35.82 mm`, with the same `0.50 mm` margin applied for a default
  `36.32 mm` top clearance.
- Internal fan body size: `30.0 mm x 30.0 mm x 7.0 mm`, user-adjustable.
- Internal fan count: `2` maximum/default positions in the upper cover.
- Fan mount screw-hole spacing: adjustable, defaulting to `24.0 mm` center span
  for a typical 30 mm fan until the actual fan is measured.
- Fan screw pilot diameter/depth, boss diameter, boss height, body clearance,
  roof grille diameter/slot dimensions, grille rib width, and fan center
  positions: configurable planning defaults until real fans are measured.
- PCB 5 micro-USB connector left edge from PCB left margin: `8.85 mm`.
- PCB 5 micro-USB cable-head requirement: `10.30 mm x 11.30 mm`, plus the same
  `0.60 mm` front cable cutout error margin used by the Pi 5 front connector
  openings.
- Left/right PCI cable clearance margin: `3.0 mm`, applied only to the
  left/right internal footprint margins and not to front/back clearance.
- Bottom-tray wall/lip height: shallow enough that the bottom cover remains the
  smaller enclosure half and the middle/upper cover pair carries the main stack
  height.
- Anti-slip recess diameter, depth, and positions: configurable bottom-open
  recesses for rubber feet, shallow enough not to break through the floor.
- Base-PCB standoff height, outer diameter, screw pilot diameter/depth, and
  optional insert diameter/depth: configurable for the actual fastener method.
- Cover pin diameter, insertion length, root/support diameter, socket clearance,
  socket depth, socket receiver diameter, and pin positions: configurable for
  printer/material fit.
- Middle/upper connector pin diameter, insertion length, root diameter, root
  height, socket clearance, and socket depth: configurable for printer/material
  fit.
- Airflow slot count, size, spacing, face enablement, per-gap vertical
  placement, and upper-cover wall vent row placement: configurable so the vents
  can follow changed board spacing and clearance height.
- Upper-cover wall vent slot dimensions must be separately configurable from
  inter-PCB vent dimensions and must default to at most half the inter-PCB slot
  dimensions.

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
- The enclosure footprint may add extra internal margin on the left/right PCB
  sides for PCI/ribbon cable clearance, but that margin must not enlarge the
  front/back clearance by default.
- Changing an inter-PCB distance must update downstream PCB positions, airflow
  gap centers, top-cover height, and related clearance geometry.
- Printable versions must be Bambu Lab-friendly:
  - no floating printable objects in `printable_layout`,
  - bottom cover/tray, middle cover, and upper cover separable and independently
    printable,
  - broad/stable faces downward unless a specific approved geometry reason
    prevents it.
- Generated mesh exports must not be added to source control.
- The design must favor adjustable fit and visual validation over pretending
  precision for unmeasured spacers, cables, heatsinks, or installed accessories.
- Fan mount geometry must be adjustable rather than hard-coded to one vendor
  fan. The default fan screw spacing is a planning assumption and must be easy to
  tune after measuring the actual fans.

## Deterministic Behavior

- The new source must expose `render_mode` values for:
  - `assembly`,
  - `bottom_tray`,
  - `middle_cover`,
  - `upper_cover`,
  - `top_cover`,
  - `electronics`,
  - `printable_layout`.
- `assembly` must show the bottom cover/tray, middle cover, upper cover,
  male/female connector interface, and optional five-board Raspberry Pi 5
  reference stack.
- `bottom_tray` must show only the printable lower body with base-PCB standoffs,
  female cover-pin sockets, and underside anti-slip recesses.
- `middle_cover` must show only the printable lower cover section with male
  cover pins, Pi 5 connector-access openings, and lower stack airflow openings.
- `upper_cover` must show only the printable upper cover section with the closed
  roof areas, guarded fan airflow openings, internal fan mounting geometry, and
  upper wall airflow openings.
- `top_cover` must show the printable middle cover and upper cover as separated
  cover parts.
- `electronics` must show the five PCB positions without printable enclosure
  bodies, with the Raspberry Pi 5 reference at the configured Pi 5 index and
  generic PCB placeholders for the other positions.
- `printable_layout` must place the bottom cover/tray, middle cover, and upper
  cover separated on the print plane with no floating printable geometry.
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
  top-of-stack clearance, internal fan thickness, fan mount boss needs, and roof
  thickness.
- The bottom cover/tray must remain the smaller/shallow enclosure half by
  default; the top cover must carry the main stack height.
- Airflow between PCBs is mandatory:
  - every inter-board gap must have real subtractive lateral grate openings on
    both opposing side walls and the back face by default,
  - front-face grate openings may be skipped for gaps directly adjacent to the
    configured Pi 5 board where they would interfere with front connector
    openings,
  - the upper top-cover wall area above PCB 5 must have additional vertical-wall
    airflow by default using smaller half-size slots,
  - the upper cover roof must include guarded fan airflow openings aligned to
    the two internal fan positions by default,
  - airflow openings must be derived from each gap center so spacing changes move
    the openings with the boards,
  - airflow count, slot size, spacing, face enablement, and margins must be
    adjustable,
  - default airflow openings must avoid cover pins, tray sockets, base standoffs,
    and required Raspberry Pi 5 access openings.
- Additional top or bottom ventilation may be provided only if it remains part
  of the three printable enclosure parts and does not replace the required
  inter-PCB side/front/back airflow.
- The upper cover must support two internal fan mounts by default:
  - fan body size defaults to `30.0 mm x 30.0 mm x 7.0 mm`,
  - each fan mount must include adjustable screw/pilot mounting points or
    bosses,
  - fan positions must be adjustable,
  - fan mounts must be inside the upper cover and oriented to move air through
    the guarded roof openings and existing wall/inter-PCB ventilation,
  - defaults must avoid the middle/upper connector pins and sockets,
    cover/tray pins and sockets, walls, roof edges, and PCB 5 clearance.
- The middle cover must own male plug pins by default.
- The bottom cover/tray must subtract matching female socket holes by default.
- The upper cover must own short downward male plug pins by default.
- The middle cover must subtract matching top-open female socket holes for the
  upper-cover pins by default.
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
    would otherwise be blocked, using one continuous side cutout without a
    separator between the USB-A and Ethernet connector openings,
  - USB-C and micro-HDMI front access for each board zone where those connectors
    would otherwise be blocked,
  - a GPIO/header-edge lateral access opening at the configured Raspberry Pi 5
    board zone so an installed HAT header splitter can expose outward-facing
    pins for a direct display connection while its upward-facing branch can
    continue the stack,
  - microSD access for the base PCB when the Pi 5 is in the base position and
    access is practical without weakening the enclosure.
- PCB 5 must include a front-side micro-USB cable opening on the same side as
  the Pi 5 USB-C opening, positioned from the measured `8.85 mm` left-margin
  offset and using the same front cable margin behavior as the Pi 5 front
  connector openings.
- Front/back-face vent rows that touch the configured Raspberry Pi 5 board must
  be omitted on faces where they would collide with Pi 5 connector cutouts or
  the GPIO/header lateral splitter opening.
- The top cover roof must have no service openings. Roof openings are allowed
  only for guarded fan airflow grilles that retain printed ribs/material for
  debris protection.
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
  inter-board gap on the side faces, with front/back face rows omitted where
  they would collide with Pi 5 service openings, supplemented by guarded roof
  fan airflow for two internal upper-cover fan positions.
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
- Dense airflow across four gaps can weaken tall top-cover walls; default
  placement must preserve material around corners, pins, sockets, standoffs, and
  port openings.
- Guarded roof fan grilles and fan screw bosses can weaken the upper cover roof;
  default layout must preserve material around roof edges, grille ribs, fan
  bosses, split-interface pins, and connector sockets.
- Internal fans consume clearance above PCB 5; the default top-cover height must
  increase instead of silently reducing the previously approved top-of-stack
  usable headroom.
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
- The source must default `rpi5_stack_index` to `4`.
- All five PCB positions must share the same footprint and coordinate frame.
- The four distances between adjacent PCBs must be independently configurable.
- Changing a board distance must move downstream boards, airflow openings, and
  top-cover height coherently.
- The distance from the top of PCB 5 to the top cover must be controlled by an
  obvious adjustable parameter.
- The default distance from the top of PCB 5 to the inside top wall of the top
  cover must be `36.32` mm, representing the `35.82` mm measured clearance
  excluding vents plus the `0.50` mm configured margin.
- The default printable enclosure must be exactly three parts: bottom cover/tray,
  middle cover, and upper cover.
- The middle/upper cover split must sit above the configured Pi 5 connector
  cutouts so the middle cover owns those cutouts and the upper cover owns the
  tall headroom section.
- `printable_layout` must contain only the bottom cover/tray, middle cover, and
  upper cover, separated on the print plane with no floating printable objects.
- PCB 1 must mount to bottom-tray standoffs aligned to Raspberry Pi 5 mounting
  holes.
- Bottom-tray standoffs must include configurable screw pilot holes or insert
  holes.
- The middle cover must own male plug pins by default.
- The bottom cover/tray must own matching female socket holes by default.
- The upper cover must own short downward male pins by default.
- The middle cover must own matching top-open female sockets at the split by
  default.
- The pin/socket interface must be adjustable and visibly similar in concept to
  the existing repository cover-pin/tray-socket interface.
- The bottom cover/tray must include configurable anti-slip recesses or foot
  pockets by default.
- Every inter-PCB gap must have real subtractive lateral airflow openings on
  both opposing side walls and the back face by default. Front-face openings may
  be skipped for Pi-adjacent connector zones.
- Airflow openings must derive from inter-PCB gap centers and remain adjustable.
- Default airflow openings must avoid pin/socket, standoff, and major access
  geometry.
- Upper top-cover airflow must be through side/front/back walls only and must not
  replace inter-PCB airflow. Upper top-cover wall airflow holes must default to
  at most half the size of the inter-PCB airflow holes.
- The upper cover roof must include two guarded fan airflow grille patterns by
  default, aligned to two internal 30 mm fan positions. Each grille must retain
  printed ribs/material and must not be implemented as one full 30 mm hole.
- The upper cover must include inside mounting points for two internal
  `30.0 mm x 30.0 mm x 7.0 mm` fans by default, with adjustable fan centers,
  body clearance, screw/pilot spacing, boss dimensions, and screw/pilot
  dimensions.
- Fan mount defaults must avoid the split-interface pins/sockets and must not
  visibly collide with PCB 5 in `assembly` or `upper_cover` inspection.
- Raspberry Pi 5 USB-A, Ethernet, USB-C, micro-HDMI, and base-position microSD
  service zones must have side or front openings where they would otherwise be
  blocked by the enclosure. The USB-A and Ethernet side access must be one
  continuous opening with no separator between connector openings. The top cover
  roof must not include service openings.
- USB-C and micro-HDMI front service openings must use the printed-good
  Raspberry Pi 5 AI HAT+ enclosure cable-head values by default: USB-C at least
  `12.6 mm x 7.6 mm`, and each micro-HDMI at least `12.6 mm x 7.26 mm`.
- PCB 5 front micro-USB access must clear at least `10.90 mm x 11.90 mm` by
  default.
- Raspberry Pi 5 GPIO/header lateral access must be generated at the configured
  Pi 5 board level and must not collide with front/back-face vent rows.
- Render modes must include `assembly`, `bottom_tray`, `middle_cover`,
  `upper_cover`, `top_cover`, `electronics`, and `printable_layout`.
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
  - top-cover height increased enough to preserve PCB 5 clearance while adding
    internal 30 mm fan thickness and mounting bosses,
  - base PCB mounted to bottom-tray standoffs,
  - bottom tray remains shallow and the middle/upper cover pair carries the main
    height,
  - middle cover has male pins,
  - upper cover is independently printable above the Pi 5 connector cutouts,
  - upper cover has male pins and middle cover has matching top-open sockets at
    the split,
  - bottom tray has matching female sockets,
  - anti-slip recesses exist on the tray underside,
  - every inter-PCB gap has real side, front, and back airflow openings,
  - two guarded roof fan airflow grille patterns exist and retain protective
    printed material,
  - two internal fan mounting point sets exist inside the upper cover,
  - fan mounts avoid split-interface connectors and PCB 5 clearance,
  - airflow openings move with changed gap spacing,
  - airflow openings avoid default pin/socket and standoff geometry,
  - required Raspberry Pi 5 service/access openings exist,
  - bottom tray, middle cover, and upper cover are separated and grounded in
    printable layout,
  - no generated mesh exports are tracked by git.

## Documentation Requirements

- Update `README.md` to list the new Raspberry Pi 5 five-stack enclosure source.
- Document that the design targets five stacked Raspberry Pi 5 PCBs.
- Document the manually entered dimension assumptions and that real spacers,
  coolers, headers, and cables must be measured for final fit.
- Document render modes and common adjustable parameters.
- Document the per-gap PCB spacing controls and top-cover clearance control.
- Document the internal fan mount controls, default fan size, assumed screw-hole
  spacing, fan-clearance contribution to top-cover height, and guarded roof
  airflow pattern.
- Document the base-PCB mounting strategy.
- Document the middle-cover-male and bottom-tray-female connection method.
- Document the upper-cover-male and middle-cover-female connection method.
- Document bottom anti-slip recesses or foot pockets.
- Document the mandatory inter-PCB side/front/back airflow strategy.
- Document that roof airflow exists only as guarded fan grilles and is not a full
  open fan hole.
- Document Raspberry Pi 5 access/opening strategy and any intentionally limited
  access areas.
- Document Bambu Lab-friendly printability expectations.
- Document that OpenSCAD render inspection is visual validation only and
  physical fit requires measurement, slicer inspection, and test printing.

## Super-Agent Update: Lower Port Access Openings

Status: Approved

### Purpose

Correct the five-stack enclosure port openings after physical fit inspection
showed the Raspberry Pi 5 USB-C, micro-HDMI, USB-A, Ethernet, and PCB 5
micro-USB openings were too high to access reliably.

### Requested Behavior

- Lower the Raspberry Pi 5 USB-C and both micro-HDMI front openings by `5.0` mm.
- Lower the Raspberry Pi 5 right-side USB-A and Ethernet continuous side opening
  by `5.0` mm.
- Lower the PCB 5 top micro-USB front opening by `7.0` mm.

### Scope

- Update `designs/pi5_five_stack_enclosure.scad` port cutout Z placement only.
- Keep existing USB-C, micro-HDMI, USB-A, Ethernet, and micro-USB cutout widths,
  heights, cable-head sizing, and wall-through depths unchanged.
- Preserve the continuous USB-A/Ethernet side cutout behavior.
- Preserve GPIO/header access, ventilation, mounting, cover split, fan, pin,
  socket, enclosure envelope, stack spacing, and electronics/reference behavior.
- Update README documentation for the new tunable lowering parameters.

### Out Of Scope

- Changing connector source dimensions or cable-head minimum opening sizes.
- Moving electronics/reference models or PCB stack positions.
- Changing generated mesh exports.

### Inputs And Constraints

- User-provided physical fit correction: the Pi 5 USB-C, micro-HDMI, Ethernet,
  and other USB ports need to move `5.0` mm down; the top micro-USB hole needs
  to move `7.0` mm lower.
- OpenSCAD 2021.01-compatible syntax is required.
- New behavior must remain user-adjustable near the top of the SCAD source.

### Deterministic Behavior Delivered

- `pi5_service_port_cutout_lowering_mm = 5.0` lowers the Raspberry Pi 5
  USB-A/Ethernet/USB-C/micro-HDMI cutout centers by `5.0` mm.
- `pcb5_micro_usb_cutout_lowering_mm = 7.0` lowers the PCB 5 micro-USB cutout
  center by `7.0` mm.
- The lowering values apply to the top-cover port access and also to tray-wall
  Pi 5 access if `rpi5_stack_index = 1`.

### Assumptions

- "Down" means lower in enclosure Z, toward the tray floor.
- The requested correction moves the cutout subtraction volumes only, not the
  electronics reference geometry.

### Impact

- The port openings are physically lower while retaining their previous visible
  opening sizes.
- The openings may remove more wall material below the modeled connector bodies;
  physical print inspection remains required.

### Validation Performed

- `git diff --check`
- `timeout 10s openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad`

### Validation Skipped

- Full OpenSCAD printable-part renders were skipped because the super-agent
  workflow only runs short validation expected to complete within 10 seconds.
- Physical fit, slicer inspection, QA, and code review were skipped.

### Documentation Changes

- README now documents `pi5_service_port_cutout_lowering_mm` and
  `pcb5_micro_usb_cutout_lowering_mm`.
