# SPEC: Voomy Power S7 Cable-Management Case

Status: Approved

## Iteration: Calibrated Hook-Only Top-Cover Clamps (2026-08-16)

### Purpose And Physical Evidence

Correct the newly printed top cover so its four clamps align with and hook
directly into the receiver holes of the already-good printed base. The supplied
photos show the current cap-side clamp structures displaced along the capsule
perimeter, vertically below or outside the usable receiver opening, and loading
the base wall outward instead of presenting only a hook head through the hole.
The complete base remains authoritative and immutable.

### Corrected Cause And Calculated Offsets

- The current cap uses a `2.4 mm`-thick cantilever body in the base wall volume,
  a separate outward release-pad projection in the receiver opening, and a hook
  ledge below the opening against an internal catch. This complicated stack
  pushes the printed base wall outward and prevents the cap from settling at
  the intended receiver positions.
- The existing source places the installed hook retention ledge at
  `Z 187.8 mm`. The immutable receiver opening spans `Z 190.2..195.8 mm`.
  Placing the new hook ledge `0.3 mm` below the receiver top gives target
  `Z 195.5 mm`, an exact upward correction of `7.7 mm`.
- In the clearest straight-face photo, the visible tangential displacement is
  approximately `19%` of the fixed `12.6 mm` receiver width. This yields
  `12.6 * 0.19 = 2.394 mm`, rounded to the source's one-decimal design precision
  as an exact `2.4 mm` physical-print compensation.
- Apply that `2.4 mm` compensation consistently in one perimeter direction.
  On the front/USB face the clamp moves left, as physically observed. Continuing
  in the same direction around the capsule moves the left-end clamp rearward
  and both rear-face clamps rightward.
- The calculated installed tangential coordinates therefore become:
  front/USB-face X `35.6 mm` instead of `38.0 mm`; left-end Y `2.4 mm` instead
  of `0.0 mm`; rear-left X `-39.6 mm` instead of `-42.0 mm`; and rear-right X
  `22.4 mm` instead of `20.0 mm`.

### Required Hook-Only Clamp Behavior

- Keep exactly four top-cover clamps and preserve their existing `12.0 mm`
  width. Do not make the clamps wider or narrower.
- Replace each current clamp assembly with one simple straight cantilever arm
  and one hook head. Remove the cap-side release pad, press projection, wall-
  loading clamp body placement, skirt pocket bypass, and any other cap-side
  protrusion that presses the base wall.
- Place each straight arm completely inside the base interior with at least
  `0.3 mm` normal clearance from the unchanged inner wall. The arm must not
  occupy, intersect, preload, or push the base wall in the nominal assembly.
- Allow only the hook head to project outward from the arm into its receiver
  opening. Preserve the current `0.8 mm` hook projection and do not increase the
  hook size or interference.
- Place the installed hook retention ledge at exact `Z 195.5 mm`. With the
  existing `0.8 mm` hook-head ramp height, the complete head spans
  `Z 194.7..195.5 mm` inside the unchanged `5.6 mm`-high receiver opening.
- Derive the simplified source hook ledge at `Z 14.5 mm` and hook tip at
  `Z 15.3 mm` before the rigid `180 deg` installed flip. The straight arm reach
  from the `3.0 mm` roof underside to the hook tip is therefore `12.3 mm`.
- Apply the exact `2.4 mm` signed tangential compensation to all four hook-only
  clamps using receiver-local coordinates, so the correction follows the
  capsule perimeter rather than treating every wall as the same global axis.
- Keep the prior `0.3 mm` radial alignment correction. The new tangential
  compensation is independent of the wall-normal arm clearance.
- Keep the immutable base receiver holes at exactly `12.6 x 5.6 mm`, including
  their positions, vertical spans, wall bridges, and existing internal catches.
  The new cap hooks catch the receiver opening's upper edge; they do not rely on
  or modify the existing internal catches.
- Add assertions for all four compensated installed coordinates, exact vertical
  hook span, arm-to-inner-wall clearance, hook-only wall penetration, unchanged
  width and hook size, and complete absence of nominal arm/wall interference.

### Preserved Behavior And Out Of Scope

- Do not modify the case body, bottom structure, receiver holes, receiver
  catches, exterior envelope, walls, floor, cable passages, USB opening,
  ventilation, or any other base geometry.
- Keep the cap roof, ventilation field, alignment skirt, installed orientation,
  printable orientation, and overall exterior envelope unchanged.
- USB-cap fit remains governed by the separately approved
  `specs/SPEC-voomy-usb-cap-fit.md`.
- Keep `render_mode = "printable_layout"`, OpenSCAD 2021.01 compatibility,
  Bambu Lab P2S/AMS 2 Pro compatibility, and generated exports outside Git.

### Validation And Delivery Boundary

- Unit tests and conventional test-first work remain prohibited and not
  applicable.
- Run `git diff --check`, source/assertion evaluation, and bounded
  reference-free `assembly` and `printable_layout` OpenSCAD renders or exports.
- Inspect the cap-only diff, all four receiver-local `2.4 mm` tangential
  compensations, exact `7.7 mm` upward hook correction, hook-head containment in
  the receiver openings, arm clearance, cap seating, connectivity, and unchanged
  base geometry.
- Reprint only the top cover and fit it to the existing base. Confirm all four
  hooks enter their openings without forcing or wall deflection, the cap seats
  flush, each hook catches the opening's upper edge, the cap remains removable,
  and at least 20 engagement/release cycles cause no whitening, cracking,
  delamination, excessive force, wall damage, or loss of retention.
- Delivery remains DRAFT until that physical fit and cycle validation passes.

## Iteration: Top-Cover Clamp-To-Receiver Alignment (2026-08-14)

This iteration's centerline correction remains preserved, but its conclusion
that exact centerline coincidence was sufficient for physical fit is superseded
by the 2026-08-16 physical-fit iteration above.

### Purpose And Reported Defect

Correct the top cover because its four retention clamps do not align with the
four closed receiver holes in the already-good case base and prevent the cover
from fitting. The case base is authoritative printed geometry and must not be
modified.

### Confirmed Discrepancy

- The body receiver sites are located on the `52.0 mm` interior body-wall
  radius.
- The corresponding top-cover clamp and skirt-pocket sites are located on the
  `51.7 mm` cap-skirt outer radius because they reuse the skirt's `0.3 mm`
  per-side seating clearance.
- After the approved rigid `180 deg` installed flip, each cover-side retention
  site is therefore `0.3 mm` radially inboard of its matching body receiver
  centerline. Tangential X placement, installed orientation, and vertical
  release-pad placement otherwise match.
- The current source assertion verifies that `0.3 mm` offset instead of
  requiring coincident installed clamp and receiver centerlines.

### Required Behavior

- Move only the four top-cover clamp sites and their associated skirt-pocket and
  bypass clearance geometry radially outward by exactly `0.3 mm` so their
  installed centerlines coincide with the existing body receiver centerlines.
- Preserve the existing tangential locations: front-right X `38.0 mm`, rear-left
  X `-42.0 mm`, and rear-right X `20.0 mm`; preserve the left-end site's
  tangential Y center at `0.0 mm`.
- Preserve all clip dimensions, hook geometry, press-pad geometry, vertical
  engagement, interference, release travel, and material guidance.
- Keep the continuous alignment skirt at its current `51.7 mm` outer radius and
  retain its `0.3 mm` per-side body-fit clearance. Clamp alignment must no longer
  be derived from the inset skirt radius.
- Replace the offset-accepting assertion with installed-coordinate assertions
  proving that all four clamp centerlines and orientations match their body
  receiver transforms after the rigid cap flip.

### Preserved Behavior And Out Of Scope

- Do not modify the case body, its four receiver holes or catches, the exterior
  envelope, wall or floor geometry, cable passages, USB interface, top-cap
  ventilation, printable layout, or any other design.
- Do not enlarge, relocate, or reshape the base holes to compensate for the
  cover defect.
- Keep exactly four closed `12.6 x 5.6 mm` receiver holes with continuous body
  wall above and below them.
- Keep `render_mode = "printable_layout"`, OpenSCAD 2021.01 compatibility,
  Bambu Lab P2S/AMS 2 Pro print compatibility, and generated exports outside
  source control.

### Assumptions, Impact, And Validation Boundary

- The user's physical observation that the existing base is good is
  authoritative; only the top cover needs reprinting after implementation.
- The source-visible `0.3 mm` radial discrepancy is treated as the reported
  alignment defect. No additional physical offset is inferred without a new
  measurement.
- Implementation changes only the Voomy OpenSCAD source, the Voomy README
  retention/fit guidance, and these matching spec and plan artifacts.
- Unit tests and conventional test-first work are prohibited and not applicable.
- Run `git diff --check`, OpenSCAD assertions, and bounded reference-free
  `assembly` and `printable_layout` renders or exports. Inspect installed clamp
  centerlines, pocket clearance, cap seating, connectivity, and unchanged base
  geometry.
- Reprint only the corrected top cover and fit it to the existing base. Verify
  all four clamps enter their receiver holes without collision, the skirt seats
  fully, the cap remains flush, and at least 20 engagement/release cycles do not
  cause whitening, cracking, delamination, excessive force, or loss of
  retention.
- Delivery remains DRAFT until that physical top-cover-to-existing-base fit and
  cycle validation is completed.

## Super-Agent Update: Midpoint Vertical USB Interface (2026-08-10)

### Purpose And Requested Behavior

Use `103.5 mm` as the default USB-opening center and rotate the rectangular USB
interface by `90 deg`, changing it from a horizontal `60.0 x 36.0 mm` opening to
a vertical `36.0 x 60.0 mm` opening. The matching solid removable cover changes
orientation and size with the opening.

### Scope

- Change the USB cutout and solid-cover defaults to `36.0 mm` wide by `60.0 mm`
  high at center Z `103.5 mm`.
- Preserve the existing left-biased X center and `3.0 mm` cover overlap.
- Reorient the cover in `printable_layout` so the three parts remain separate
  and fit the nominal `256 x 256 mm` plate envelope.
- Update the Voomy README section and these approved completed-work artifacts.

### Out Of Scope

- Changes to the cap, ventilation grid, cable passages, body envelope, power
  strip reference, cap retention, or any other design.
- Generated mesh or preview artifacts in source control.

### Definitions, Inputs, And Constraints

- Rotating the rectangle by `90 deg` means swapping its width and height while
  retaining its center and front-wall plane.
- The `103.5 mm` center is the exact midpoint of the `207.0 mm` body wall.
- The vertical opening spans Z `73.5..133.5 mm`; this is valid body geometry but
  remains measurement-sensitive against the provisional floor-standing
  `80 x 80 x 88 mm` Voomy reference.
- OpenSCAD 2021.01 compatibility, the fixed exterior envelope, and Bambu Lab P2S
  printable orientation remain required.

### Deterministic Behavior Delivered

- `usb_cutout_width_mm = 36.0`, `usb_cutout_height_mm = 60.0`, and
  `usb_cutout_center_z_mm = 103.5` are the source defaults.
- The installed opening and solid cover share the unchanged left-biased X center
  and exact midpoint Z center.
- The solid cover is `42.0 x 66.0 mm`, providing `3.0 mm` overlap on every edge.
- The printable cover remains broad-face-down, is no longer rotated around Z in
  `printable_layout`, stays separate from the body and cap, and keeps the nominal
  layout within `256 x 256 mm`.

### Assumptions And Impact

- "The rectangle" refers to the USB wall opening and its matching removable
  cover, not another rectangular feature.
- Physical USB-group alignment is not inferred from the provisional reference;
  the actual device must still be measured.
- Only the Voomy source, Voomy README section, and matching approved artifacts
  change.

### Validation Performed And Skipped

- `git diff --check` passed.
- Short reference-free OpenSCAD CSG evaluations passed for `printable_layout`
  and `assembly` with the new defaults.
- Unit tests are prohibited and not applicable. Super-agent QA and code review
  were intentionally skipped.
- Bambu Studio inspection, test printing, physical USB alignment, cover fit and
  cycle testing, airflow, and thermal/electrical checks remain unvalidated;
  delivery remains DRAFT.

### Documentation Changes

- The README now documents the vertical `36.0 x 60.0 mm` interface, `103.5 mm`
  midpoint default, `73.5..133.5 mm` span, and measurement-sensitive fit.

## Previous Iteration: Adjustable USB Height And Top-Cap Ventilation (2026-08-10)

The USB placement and orientation values in this previous iteration are
superseded by the approved midpoint vertical-interface update above.

This iteration changes only the following approved behavior:

- keep the USB access opening in the left-hand portion of the front wall but
  raise its adjustable default center from `50.0 mm` to `73.0 mm` above the
  body bottom;
- allow `usb_cutout_center_z_mm` to be changed to `103.5 mm` or any other value
  that keeps the complete opening within the front body wall;
- remove every hexagonal ventilation opening from the front body wall; and
- place the staggered hexagonal ventilation field in the top cap instead.

The `73.0 mm` default is the highest center that keeps the complete default
`60.0 x 36.0 mm` opening within the provisional `88.0 mm` Voomy reference face
when that reference rests on the `3.0 mm` interior floor. The `103.5 mm`
override is the exact vertical midpoint of the `207.0 mm` body wall, but it is
measurement-sensitive because it places most of the opening above that
provisional floor-standing reference.

All previously approved plain-wall, smooth-floor, solid USB-cover, minimal
clamp-hole, cable-passage, fixed-envelope, render-mode, printer, validation, and
safety behavior remains in force unless this final-state specification says
otherwise.

## Super-Agent Update: Remove Right Curved-Wall Membrane (2026-08-10)

### Purpose And Requested Behavior

Remove the thin curved-wall layer covering the visual-right cable opening. The
right-hand passage must be see-through through the body wall like the rear cable
passage, with no crescent-shaped exterior membrane remaining.

### Scope

- Extend the existing visual-right passage profile beyond the complete curved
  exterior wall at both its bottom and full-height sections.
- Preserve the passage's approved inner width, arc-centered position, edge
  treatment, floor termination, cable references, and full-height geometry.
- Update the Voomy README section and these approved completed-work artifacts.

### Out Of Scope

- The rear mains-lead passage, cap, USB cover, ventilation, retention, overall
  envelope, power-strip placement, and every other design.
- Generated mesh or preview artifacts in source control.

### Deterministic Behavior Delivered

- No body-wall membrane remains across the visual-right cable passage.
- Both outer passage chords terminate beyond the capsule's rightmost exterior X
  coordinate, so the curved surface cannot leave a thin crescent between the
  subtractor and the exterior.
- The cap, body floor, inner passage envelope, and rear passage remain unchanged.

### Inputs, Constraints, And Assumptions

- The reported thin layer is the curved-wall crescent left because a straight
  outer subtraction chord was placed on the capsule radius instead of beyond the
  capsule's rightmost tangent plane.
- Matching the rear passage means the right body opening is fully see-through;
  it does not require a new cap opening or a floor notch.
- OpenSCAD 2021.01 compatibility, the fixed exterior envelope, Bambu Lab P2S
  orientation, and all other approved design constraints remain unchanged.

### Impact And Documentation

- Only the Voomy source, Voomy README section, and matching approved artifacts
  change.
- The README now documents the fully open curved-wall passage.

### Validation Performed And Skipped

- Short source/assertion evaluation and `git diff --check` are required for this
  direct correction.
- Unit tests and conventional test-first work are prohibited and not applicable.
- Super-agent code review and QA phases are intentionally skipped.
- Slicer inspection, test printing, physical cable fit, and confirmation that the
  opened wall passage prints cleanly remain unvalidated; delivery remains DRAFT.

## Iteration: Plain Body And Closure Corrections (2026-08-10)

This iteration changes only the following approved behavior:

- remove the raised horizontal wall stripes while retaining the hexagonal
  ventilation grid;
- replace the see-through USB passthrough bezel with a solid removable cover;
- replace the large cap-receiver wall gaps with four small, closed clamp holes;
- remove the internal floor supports and locating pins so the interior floor is
  flat and smooth.

All other approved dimensions, cable passages, cap geometry, render modes,
printer compatibility, validation boundaries, and safety limitations remain in
force unless this final-state specification says otherwise.

## Purpose

Create an editable, ventilated OpenSCAD cable-management case for the Voomy
Power S7 power strip. The case hides the power strip, connected Schuko plug
heads, and excess cable while routing the connected device cables through the
visual right wall and the power strip's own mains lead through the rear wall.
The USB group remains independently serviceable behind a solid removable cover
in the left-hand portion of the front wall.

## Problem

The power strip and its connected cables need a defined enclosure that remains
serviceable without threading Schuko plug heads through cable-sized holes. The
top cap must therefore be removable, both mains-cable passages must open at the
top of their walls, and the USB bank must remain accessible independently from
the cap by removing its dedicated solid cover. The top cap carries the
hexagonal ventilation grid without weakening the cap retention features. The
front and remaining body-wall exterior surfaces are plain apart from required
functional openings, and the body interior floor remains smooth and
unobstructed.

## Scope

- Add one coherent OpenSCAD design containing:
  - the case body,
  - one removable top cap,
  - one removable solid USB access cover,
  - an optional simplified Voomy Power S7 fit reference,
  - assembly, individual-part, and printable-layout views.
- Provide a fixed default assembled exterior envelope of
  `210.0 mm x 210.0 mm x 110.0 mm`.
- Use a capsule-shaped horizontal footprint with straight front and rear wall
  runs joined by semicircular left and right ends.
- Orient the installed power strip with its USB port group toward the front
  wall and align that group with the left-hand portion of the front wall.
- Provide top-open Schuko lay-in passages in the visual right and rear walls.
- Provide a decorative hexagonal ventilation grid through the top cap with
  structural keepouts.
- Keep the front, rear, left, and right body-wall exteriors plain except for
  required functional openings; the front wall contains no ventilation grid.
- Keep the removable top cap exterior flat and plain outside its approved
  hexagonal through-grid.
- Keep the interior floor flat and smooth, with no supports, pins, stops, or
  other raised locating geometry.
- Update the repository documentation when the design is implemented.

## Out Of Scope

- Modification, disassembly, rewiring, or certification of the Voomy power
  strip.
- Mains-voltage components, sockets, switches, strain relief, or extension
  wiring printed as part of the case.
- Electrical, fire, thermal, ingress-protection, load, or child-safety
  certification.
- A sealed, weatherproof, or liquid-resistant enclosure.
- Wall-mounting or furniture-mounting hardware.
- Generated STL, STEP, 3MF, OFF, or other mesh/export files in source control.
- Guaranteed fit without physical measurement, slicer inspection, and a test
  print.
- Changes to existing OpenSCAD designs.

## Definitions And Orientation

- **Front:** the viewing direction toward the case. The physical front wall is
  the centered `100.0 mm x 210.0 mm` straight portion of the capsule; the
  complete front-view silhouette remains `210.0 mm x 210.0 mm` because the
  curved side ends extend beyond it.
- **Visual right / left:** the user's right and left while looking at the
  front face.
- **Top cap:** the independently printed horizontal cover removed upward from
  the assembled case.
- **Top-open lay-in passage:** a continuous wall opening that is accessible
  from the wall's top edge while the cap is removed. A cable segment with an
  attached Schuko head is lowered into the open top; the plug head itself does
  not pass through the slot width.
- **USB access cover:** a removable, clip-retained solid panel in the left-hand
  portion of the front wall. When installed it closes the complete USB-group
  wall opening; it is removed from outside to access or route USB plugs.
- **Grid:** a repeated staggered hexagonal through-pattern that provides both
  decoration and ventilation.
- **Capsule footprint:** the `210.0 x 110.0 mm` overall horizontal outline made
  from `100.0 mm` straight front and rear runs joined tangentially to `55.0 mm`
  radius semicircular left and right ends. The semicircle centers are
  `100.0 mm` apart on X.
- Source axes use positive X toward visual right, positive Y from front to
  rear, and positive Z from bottom to top.

## Product And Manually Entered Dimensions

The following dimensions must be explicit adjustable parameters or documented
derived values. Values described as provisional are design allowances, not
physical measurements.

| Dimension | Default | Basis |
| --- | ---: | --- |
| Assembled case width | `210.0 mm` | User supplied |
| Assembled case height, including cap | `210.0 mm` | User supplied |
| Assembled case depth | `110.0 mm` | User supplied |
| Capsule side radius at the smooth exterior wall | `55.0 mm` | Half of fixed case depth |
| Straight front/rear wall length | `100.0 mm` | `210.0 - 2 * 55.0 mm` |
| Voomy body width | `80.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Voomy body depth | `80.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Voomy body height | `88.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Nominal wall, floor, and cap thickness | `3.0 mm` | Provisional printable default |
| Per-side Voomy fit clearance | `1.5 mm` | Provisional printed-fit allowance |
| Top-open lay-in passage width | `20.0 mm` | User supplied |
| Maximum routed cable diameter | `12.0 mm` | Provisional definition of a fat cable |
| Right-side routed cable count | `4` | User supplied |
| Front-wall USB wall cutout | `36.0 x 60.0 mm` | User-requested `90 deg` rotation of the provisional group-only service envelope |
| Default USB cutout center Z | `103.5 mm` | Half of the `207.0 mm` body-wall height |
| Solid USB cover wall overlap | `3.0 mm` per edge | Provisional retention allowance |
| Cap receiver-hole width | `12.6 mm` | `12.0 mm` clip width plus `0.3 mm` clearance per side |
| Cap receiver-hole height | `5.6 mm` | `5.0 mm` release-pad height plus `0.3 mm` clearance per side |

Before claiming physical fit, the implementation defaults must be compared
with measurements of the actual power strip, the connected Schuko heads, the
four cable jackets, the USB port-group bounds and offsets, and the power
strip's attached-cord exit. The fixed exterior case dimensions must not grow
automatically when a measured value conflicts with the available interior
space.

## Inputs And Constraints

- Target OpenSCAD 2021.01-compatible syntax without external libraries.
- Keep user-adjustable values near the top of the source in grouped
  `Adjustable Parameters` sections and derived values separately.
- Use descriptive `snake_case` identifiers, `_mm` for linear dimensions, and
  `_deg` for angles.
- Set the source default to `render_mode = "printable_layout"`.
- Keep the complete assembled outer envelope within
  `210.0 mm x 210.0 mm x 110.0 mm`, including the seated cap and all retention
  features.
- Preserve exact tangency between each `100.0 mm` straight wall run and the two
  `55.0 mm` semicircular side ends; do not approximate the side walls as flat
  facets in final geometry.
- The design must remain compatible with the Bambu Lab P2S build volume and
  AMS 2 Pro workflow.
- Every printable object must be independent, free of floating geometry, and
  oriented with a broad stable face on the build plate.
- The body must print upright on its `210.0 mm x 110.0 mm` bottom face. The cap
  and solid USB cover must print on their broad exterior faces. The cap's solid
  perimeter and grid ribs provide broad build-plate contact in that orientation.
- Generated mesh files remain temporary and outside source control.
- Unit tests and conventional test-first work are not applicable and are
  prohibited by repository guidance.

## Deterministic Behavior

### Case Body And Power-Strip Placement

- The assembled exterior dimensions are exactly `210.0 mm` wide,
  `210.0 mm` high, and `110.0 mm` deep with the cap fully seated.
- In plan view, the assembled body and cap use the same capsule outline:
  `100.0 mm` straight front and rear runs with `55.0 mm` radius left and right
  semicircular ends.
- The default shell uses `3.0 mm` walls, floor, and cap roof. Thickness remains
  adjustable without changing the fixed exterior dimensions.
- The smooth exterior body wall uses the full `55.0 mm` side radius and
  `210.0 x 110.0 mm` maximum outline. No decorative rib, stripe, band, embossing,
  or other raised texture projects from the body wall.
- A simplified `80.0 x 80.0 x 88.0 mm` Voomy reference is toggleable and never
  part of printable output.
- The power strip installs and removes vertically while the cap is absent.
- Its USB face points toward the front wall. Its body rests directly on the
  smooth `3.0 mm` floor. The interior floor contains no support pads, locating
  pins, rounded stops, ridges, or other raised geometry, and the case does not
  positively locate or retain the power strip on the floor.
- The default placement aligns the USB port group with the front-wall cutout
  toward visual left and leaves the larger free interior span toward visual
  right for connected mains plugs and cable routing.
- Retention must not cover the power strip's ventilation, sockets, switch, USB
  ports, attached-cord exit, or removal path.
- If the real connected plug envelope cannot fit the fixed case depth or
  conflicts with another interface, implementation must report the conflict;
  it must not silently change the `210 x 210 x 110 mm` contract.

### Right-Side Schuko And Cable Passage

- The visual right wall contains one shared `20.0 mm`-wide lay-in passage.
- The right wall is the right semicircular end. Passage width is measured as
  `20.0 mm` of tangential arc length at the smooth outer wall radius and is
  centered `30.0 deg` rearward from the arc's visual-right midpoint by default,
  as required by the superseding approved
  `SPEC-voomy-right-cable-passage-30-degree-rearward.md` contract. `0 deg` is
  exact visual right and positive angles rotate toward rear `+Y`.
- The passage is continuous from the wall's top edge down to the interior floor.
  Its outer subtraction extends beyond the complete curved wall, leaving the
  opening see-through without a thin exterior crescent.
- A cable segment is lowered into the passage from above while its attached
  Schuko head remains inside or outside the case; the head is not required to
  pass through the `20.0 mm` width.
- After installation, the same passage must hold four cable jackets up to
  `12.0 mm` diameter stacked at distinct heights without nominal overlap. Each
  cable has `4.0 mm` nominal lateral clearance per side.
- The passage is centered along the case depth by default and has rounded or
  chamfered cable-contact edges of at least `2.0 mm`.
- The cap bridges the top of the wall when seated but does not project into the
  cable bundle or pinch cables resting in the passage.

### Rear Main-Power Passage

- The rear wall contains one top-open `20.0 mm`-wide lay-in passage for the
  power strip's attached mains lead.
- It is continuous from the rear wall's top edge down to the interior floor and
  uses the same cable lay-in behavior and edge treatment as the right-side
  passage. The attached cable is lowered into the slot while its Schuko head
  remains outside the case.
- The rear passage is horizontally aligned with the power strip's attached
  lead by an adjustable center position.
- The cap bridges the rear wall without trapping or sharply bending the main
  lead.

### Front-Wall Solid USB Access Cover

- The USB access opening is in the left-hand portion of the front wall. It is not
  on the case's left side wall.
- The front-wall cutout serves the USB port group only. It must not
  intentionally expose an adjacent AC socket or the power switch.
- The default wall cutout is a vertical `36.0 x 60.0 mm`; its position is derived from the
  installed power-strip datum and adjustable USB-group offsets.
- The cutout remains within the `100.0 mm` straight front-wall run. Its
  provisional center is `38.0 mm` from the left front-to-arc tangent, preserving
  the approved left-biased placement.
- `usb_cutout_center_z_mm` is an adjustable parameter with a default of
  `103.5 mm`, which vertically centers the `60.0 mm`-high opening on the
  `207.0 mm` body wall. The opening spans `73.5..133.5 mm`; this remains valid
  body geometry but is not assumed to align with the provisional floor-standing
  device reference.
- Any adjusted effective center must keep the complete cutout between the
  interior floor surface and the body top edge. Changing the vertical center
  does not alter the approved left-biased X position.
- One independently printable snap-in cover completely fills the cutout. Its
  visible panel is solid and opaque, with no through-opening, port divider,
  grille, or see-through region.
- The cover overlaps the body cutout by `3.0 mm` on every edge and remains
  removable and reinstallable from outside without removing the case cap or
  moving the power strip.
- USB ports and USB cable routing are available only while the solid cover is
  removed. The cover is not installed over connected USB cables.
- Cover lead-ins, tabs, and clearances must not scrape the power strip, the wall
  opening, or USB cable insulation during removal and installation.
- The USB cutout position remains explicitly measurement-sensitive; render
  alignment alone does not prove physical port access.

### Top Cap And Durable Retention Clips

- The top cap seats vertically and remains flush within the fixed exterior
  width, height, and depth.
- The cap, roof, perimeter, and alignment skirt follow the same capsule outline
  as the body, including the semicircular left and right ends.
- The visible top-cap exterior is flat and plain outside its approved
  hexagonal through-grid. It contains no raised stripes, engraved stripes, or
  other decorative texture.
- A continuous alignment skirt locates the cap before the hooks engage, using
  `0.3 mm` nominal clearance per side and at least `6.0 mm` engagement depth.
- The skirt clearance must not offset the clamp locations. After the installed
  cap transform, every clamp centerline and orientation coincides with its
  corresponding body receiver centerline and orientation.
- Four tool-less cantilever retention clips secure the cap: one in the
  available front-right straight region, one on the left semicircular end, and
  two on the rear straight region split to either side of the rear passage.
  All remain clear of both lay-in passages and the USB access cover.
- Each default cap clip has at least:
  - `20.0 mm` flexible length,
  - `12.0 mm` width,
  - `2.4 mm` thickness,
  - `2.0 mm` root fillet radius,
  - a self-supporting lead-in no steeper than `45 deg`,
  - `0.8 mm` hook engagement,
  - no more than `0.6 mm` nominal interference,
  - no more than `1.2 mm` required release travel.
- Externally reachable press pads identify where the clips flex. Pressing them
  through the receiver holes must flex the defined beams rather than thin wall
  or grid remnants.
- Each body receiver is a closed hole bounded by solid wall on all four sides;
  no receiver opening reaches the body top edge. At the default clip dimensions,
  each hole is exactly `12.6 mm` wide and `5.6 mm` high, providing `0.3 mm`
  clearance per side around the `12.0 x 5.0 mm` release-pad envelope.
- Clip roots, catches, release paths, and the four minimal receiver holes remain
  inside solid structural keepouts. The body wall outside those holes is filled
  continuously to the top rim, and the decorative grid must not intersect them.
- The geometry must expose clip dimensions and interference as adjustable
  parameters because render inspection cannot establish release force,
  fatigue life, or material-dependent durability.

### Decorative Ventilation Grid And Plain Walls

- The front body wall contains no hexagonal ventilation openings and remains
  plain apart from the USB cover and clamp receiver holes. The other body walls
  remain plain apart from their approved cable passages.
- One staggered hexagonal through-grid appears in the unobstructed central
  region of the top-cap roof.
- Default hexagons are `12.0 mm` across flats with ribs at least `3.0 mm` wide.
- Grid fields retain at least `12.0 mm` of solid border at exterior edges and
  around the cap perimeter, alignment skirt, clip roots, flexure paths, and
  other retention geometry.
- Grid cells that would violate a keepout are omitted rather than clipped into
  thin partial ribs.
- The grid provides airflow but does not make the printed case electrically or
  thermally certified.
- Except for required USB, cable, and clamp openings, the front, rear, left,
  and right body walls are smooth and plain.
  They contain no raised stripes, ribs, bands, embossing, engraving, or other
  decorative surface texture.

### Render Modes And Printable Layout

- Supported modes are exactly `assembly`, `case_body`, `top_cap`,
  `usb_passthrough_clip`, and `printable_layout`.
- The existing `usb_passthrough_clip` render-mode identifier is retained for
  compatibility, but it renders the revised solid USB access cover.
- Unsupported render modes fail through an assertion.
- `assembly` shows the case closed by default with the non-printable Voomy
  reference disabled; an explicit override may show the reference for fit
  inspection.
- Individual-part modes place the requested part on the print plane in its
  intended orientation.
- The `top_cap` and `printable_layout` modes place the cap exterior downward,
  with its solid perimeter and connected grid ribs touching the print plane.
- `printable_layout` includes exactly one body, one cap, and one solid USB
  cover as separate build-plate-supported objects with no intersection or
  floating geometry.
- The default layout should fit nominally inside `256 x 256 mm`; if the solid
  USB cover or required slicer margins prevent that, the parts remain correctly
  oriented and separated into documented print groups rather than being
  rotated into a weaker orientation.

## Assumptions

- The user's latest statement means the USB ports are on the left-hand side of
  the power strip's front wall. The power strip's USB face therefore points
  toward the case front, with the group aligned toward visual left; it does not
  mean the passthrough belongs in the case's left side wall.
- Oval-shaped left and right walls means the horizontal case footprint is a
  capsule. It does not mean the walls bow vertically or that the front and rear
  walls become elliptical.
- `210 x 210 x 110 mm` describes the complete assembled exterior, not the
  interior cavity or only the body below the cap.
- The right-side and rear openings are full-height, top-open lay-in passages;
  attached cable segments are lowered into them while the cap is absent. The
  right opening is see-through through its curved body wall like the rear opening
  is through its flat wall. Schuko heads do not pass through the `20.0 mm` slot
  widths. The right opening retains its separately approved adjustable
  `30.0 deg` rearward default center angle.
- Four fat cables means four jackets no larger than the provisional `12.0 mm`
  circular envelope stacked vertically in the right-side opening. It does not
  mean four Schuko heads pass through the right-side slot.
- Plain exterior walls means the raised horizontal stripes and front-wall
  hexagonal grid are removed; the approved grid moves to the top cap.
- Middle and left means the USB opening preserves its approved left-biased X
  center while its Z center is adjustable. The default is `103.5 mm`, centered
  on the body wall, but it may not align with the provisional floor-standing
  device. The rectangle is vertical at `36.0 x 60.0 mm`.
- The solid USB cover is installed only when the USB opening is intended to be
  closed. USB plugs and cables use the group opening with the cover removed.
- A smooth interior floor means the power strip has no printed locating or
  retention features and must be positioned manually.
- The published `80 x 80 x 88 mm` product envelope is adequate for a provisional
  reference, but the USB offsets, attached-cord exit, plug-head dimensions, and
  connected assembly envelope are not supplied by the product listing.
- PETG or another material suitable for repeated flexing is preferred for the
  clips. Geometry alone cannot guarantee that a brittle material, poor layer
  orientation, or incorrect print settings will resist tearing.
- The case is used indoors in a dry location and does not override the power
  strip manufacturer's operating and load requirements.

## Regression Impact

- The existing Voomy OpenSCAD source changes from striped to smooth body walls,
  while retaining its fixed envelope.
- The hexagonal grid moves from the front wall to the top cap, changing the cap
  from fully solid to a flat, perimeter-supported ventilated roof.
- The USB opening and solid cover use a `103.5 mm` body-midpoint default and
  rotate from horizontal `60.0 x 36.0 mm` to vertical `36.0 x 60.0 mm` without
  changing their X position.
- The USB printable part changes from an open bezel to a solid removable cover;
  the existing `usb_passthrough_clip` render-mode identifier remains supported.
- The body receiver gaps shrink to four closed clamp holes, and all internal
  power-strip supports and locating stops are removed.
- The four top-cover clamp sites and their local skirt-pocket clearances move
  `0.3 mm` radially outward to align with the unchanged body receiver
  centerlines; the base and continuous alignment skirt remain unchanged.
- The visual-right passage retains its separately approved `30.0 deg` rearward
  default center angle and cuts beyond the curved exterior wall without
  changing the cap, body floor, rear passage, or inner cable envelope.
- The README Voomy section changes to match the revised operation and geometry.
- No other OpenSCAD design changes.
- No existing generated artifact becomes tracked.

## Validation Plan

### Static And OpenSCAD Validation

- Run `git diff --check`.
- Evaluate OpenSCAD assertions using OpenSCAD 2021.01.
- Run bounded renders or exports for only `printable_layout` and reference-free
  `assembly`, stopping any render that exceeds 15 seconds.
- Inspect the resulting geometry for:
  - exact assembled exterior dimensions,
  - exact capsule radius, straight-run length, and tangent continuity,
  - matching capsule outlines and seating between body and cap,
  - three separate printable objects,
  - build-plate contact and non-intersection,
  - continuous top-open right and rear passages,
  - `20.0 mm` tangential arc width and `30.0 deg` rearward default placement of
    the right passage, including its rearward-positive adjustable angle,
  - `12.0 mm` cable clearance and four-cable vertical stacking,
  - solid USB-cover seating, full closure, removal, and reinstallation for the
    vertical `36.0 x 60.0 mm` opening at the `103.5 mm` default center,
  - cap seating, clip alignment, engagement, release clearance, and exactly four
    closed `12.6 x 5.6 mm` receiver holes with continuous wall above them,
  - coincident installed clamp/receiver centerlines at all four sites while the
    alignment skirt retains `0.3 mm` per-side seating clearance,
  - no hexagonal openings in the front wall,
  - top-cap grid continuity, minimum ribs, perimeter/skirt/clip keepouts, and
    broad print-plane support,
  - smooth plain wall continuity with no raised stripe geometry,
  - a flat interior floor with no support pads, pins, stops, or raised features,
  - a flat top-cap exterior with grid-rib and perimeter build-plate contact,
  - no curved exterior wall membrane across the right passage and unchanged
    floor termination at both passages.
- Do not commit temporary render or mesh outputs.

### Slicer And Physical Validation

- Confirm all print groups, bed margins, layer orientation, bridges, and
  unsupported overhangs in Bambu Studio for the P2S.
- Confirm the upright smooth-walled body and exterior-down ventilated cap have
  stable first-layer contact on the cap perimeter and grid ribs and require no
  unintended support material.
- Measure the actual power strip, USB group, attached-cord exit, intended
  Schuko heads, and cable jackets before relying on the defaults.
- Test that each cable segment can be lowered into the right passage without
  passing its attached Schuko head through the slot, and that all four
  connected cables can occupy the passage together at distinct heights.
- Confirm the printed right body passage is fully see-through like the rear
  passage, without a skin, brim, support, or curved-wall crescent closing it.
- Test that the power strip's own cable can be lowered into the rear passage
  while its Schuko head remains outside and that the cable is not pinched by
  the cap.
- Verify that the solid USB cover fully closes the opening, can be removed and
  reinstalled externally, and leaves the complete USB group accessible while
  removed.
- Verify USB alignment at the `103.5 mm` default; if another height is used,
  measure the actual device and confirm the complete opening still serves only
  the USB group.
- Verify that the power strip rests stably on the smooth floor without printed
  supports or locating pins and can still be aligned with the USB opening.
- Fit and release the cap repeatedly, including at least 20 complete clip
  cycles, checking for whitening, cracking, delamination, excessive force, and
  loss of retention.
- Reuse the existing case base and reprint only the corrected top cover for the
  clamp-alignment fit and cycle checks.
- Check the case under the intended real operating load according to the power
  strip manufacturer's requirements. Stop use if the printed case deforms,
  traps unsafe heat, damages cable insulation, or obstructs the power strip's
  protective features.
- Delivery remains `DRAFT` until slicer inspection, test printing, physical
  cable and plug fit, clip cycling, USB access, and intended-load thermal
  behavior are verified.

## Documentation Needs

- Add a README section covering the design purpose, fixed exterior dimensions,
  manually entered and provisional measurements, installed orientation,
  adjustable parameters, render modes, printable parts, front-wall grid removal,
  top-cap grid behavior, smooth plain walls and floor, cap and solid USB-cover
  operation, minimal clamp holes, and Bambu P2S print grouping.
- Document that both mains passages require cap removal so attached cable
  segments can be lowered into their open tops without passing Schuko heads
  through the `20.0 mm` slot widths.
- Document that the right passage cuts fully through the curved body wall while
  both body passages continue to stop at the interior floor.
- Document that the USB opening is in the left-hand portion of the front wall
  and serves only the USB group; it is a vertical `36.0 x 60.0 mm` rectangle at
  the measurement-sensitive `103.5 mm` default center, and the solid cover must
  be removed for USB access or cable routing.
- Document the measurement checklist, material-dependent clip risk, ventilation
  limitations, electrical and thermal non-certification, and DRAFT physical-fit
  boundary.
- Document that the clamp alignment correction is top-cover-only and that the
  existing base and its receiver holes remain unchanged.
