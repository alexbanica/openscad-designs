# SPEC: Voomy Power S7 Cable-Management Case

Status: Approved

## Purpose

Create an editable, ventilated OpenSCAD cable-management case for the Voomy
Power S7 power strip. The case hides the power strip, connected Schuko plug
heads, and excess cable while routing the connected device cables through the
visual right wall, the power strip's own mains lead through the rear wall, and
the USB cables through a removable passthrough in the left-hand portion of the
front wall.

## Problem

The power strip and its connected cables need a defined enclosure that remains
serviceable without threading Schuko plug heads through cable-sized holes. The
top cap must therefore be removable, both mains-cable passages must open at the
top of their walls, and the USB bank must remain accessible independently from
the cap. The large case panels also need ventilation and a deliberate grid
appearance without weakening the cap retention features. The four vertical
body-wall exteriors must use pronounced raised horizontal stripes, while the
removable top cap remains plain.

## Scope

- Add one coherent OpenSCAD design containing:
  - the case body,
  - one removable top cap,
  - one removable USB passthrough clip,
  - an optional simplified Voomy Power S7 fit reference,
  - assembly, individual-part, and printable-layout views.
- Provide a fixed default assembled exterior envelope of
  `210.0 mm x 210.0 mm x 110.0 mm`.
- Use a capsule-shaped horizontal footprint with straight front and rear wall
  runs joined by semicircular left and right ends.
- Orient the installed power strip with its USB port group toward the front
  wall and align that group with the left-hand portion of the front wall.
- Provide top-open Schuko lay-in passages in the visual right and rear walls.
- Provide a decorative ventilation grid with structural keepouts.
- Texture the front, rear, left, and right body-wall exteriors with long raised
  horizontal stripes.
- Keep the removable top cap exterior flat and plain.
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
- **USB passthrough clip:** a removable, clip-retained bezel in the left-hand
  portion of the front wall. It surrounds one shared opening for the complete
  USB port group and has no separators between individual USB ports.
- **Grid:** a repeated staggered hexagonal through-pattern that provides both
  decoration and ventilation.
- **Horizontal wall stripe:** a raised rib on a vertical body-wall exterior
  that runs parallel to the floor. The stripes share matching Z elevations
  across all four walls so the texture visually wraps around the case.
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
| Capsule side radius at the outer stripe peaks | `55.0 mm` | Half of fixed case depth |
| Straight front/rear wall length | `100.0 mm` | `210.0 - 2 * 55.0 mm` |
| Voomy body width | `80.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Voomy body depth | `80.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Voomy body height | `88.0 mm` | Published `8 x 8 x 8.8 cm` envelope |
| Nominal wall, floor, and cap thickness | `3.0 mm` | Provisional printable default |
| Per-side Voomy fit clearance | `1.5 mm` | Provisional printed-fit allowance |
| Top-open lay-in passage width | `20.0 mm` | User supplied |
| Maximum routed cable diameter | `12.0 mm` | Provisional definition of a fat cable |
| Right-side routed cable count | `4` | User supplied |
| Front-wall USB wall cutout | `60.0 x 36.0 mm` | Provisional group-only service envelope |
| USB clip clear opening | `56.0 x 32.0 mm` | Provisional shared access opening |
| USB clip wall overlap | `3.0 mm` per edge | Provisional retention allowance |
| Wall stripe outward projection | `1.0 mm` | Provisional visible texture |
| Wall stripe vertical height | `4.0 mm` | Provisional printable band height |
| Wall stripe vertical pitch | `9.0 mm` | Provisional center-to-center spacing |
| Wall stripe top/bottom margin | `10.0 mm` | Provisional solid edge margin |

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
  and USB clip must print on their broad exterior faces. The cap's plain
  exterior provides continuous build-plate contact in that orientation.
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
- The peaks of the outward wall stripes define the maximum assembled width and
  depth. The underlying smooth wall surfaces are inset by the stripe projection
  so the texture remains inside the fixed `210.0 x 110.0 mm` footprint.
- With the default `1.0 mm` stripe projection, the smooth wall datum uses a
  `54.0 mm` side radius and a `208.0 x 108.0 mm` maximum outline; the stripe
  peaks restore the required `55.0 mm` radius and `210.0 x 110.0 mm` envelope.
- A simplified `80.0 x 80.0 x 88.0 mm` Voomy reference is toggleable and never
  part of printable output.
- The power strip installs and removes vertically while the cap is absent.
- Its USB face points toward the front wall. Its body rests on internal floor
  supports and is located by rounded stops with `1.5 mm` nominal clearance on
  each constrained side.
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
  `20.0 mm` of tangential arc length at the outer stripe-peak radius and is
  centered on the arc's visual-right midpoint.
- The passage is continuous from the wall's top edge down to the interior
  floor, so it is fully accessible when the cap is removed.
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

### Front-Wall USB Passthrough

- The USB passthrough is in the left-hand portion of the front wall. It is not
  on the case's left side wall.
- The front-wall cutout serves the USB port group only. It must not
  intentionally expose an adjacent AC socket or the power switch.
- The default wall cutout is `60.0 x 36.0 mm`; its position is derived from the
  installed power-strip datum and adjustable USB-group offsets.
- The cutout remains within the `100.0 mm` straight front-wall run. Its
  provisional center is `38.0 mm` from the left front-to-arc tangent, placing
  the `60.0 mm` opening `8.0 mm` from that tangent and biasing it toward visual
  left.
- One independently printable snap-in clip surrounds the cutout. Its clear
  opening is at least `56.0 x 32.0 mm`, with no individual-port dividers.
- With the clip installed, a user can insert or remove one USB-A or USB-C plug
  while other USB cables remain connected.
- The clip can be removed and reinstalled from outside without removing the
  case cap or moving the power strip.
- Clip lead-ins and clearances must not scrape USB cable insulation or apply
  retention force to USB connectors.
- The USB cutout position remains explicitly measurement-sensitive; render
  alignment alone does not prove physical port access.

### Top Cap And Durable Retention Clips

- The top cap seats vertically and remains flush within the fixed exterior
  width, height, and depth.
- The cap, roof, perimeter, and alignment skirt follow the same capsule outline
  as the body, including the semicircular left and right ends.
- The visible top-cap exterior is one plain, flat surface apart from its
  perimeter edge treatment. It contains no raised stripes, engraved stripes,
  hexagonal grid, or other decorative texture.
- A continuous alignment skirt locates the cap before the hooks engage, using
  `0.3 mm` nominal clearance per side and at least `6.0 mm` engagement depth.
- Four tool-less cantilever retention clips secure the cap: one in the
  available front-right straight region, one on the left semicircular end, and
  two on the rear straight region split to either side of the rear passage.
  All remain clear of both lay-in passages and the USB passthrough.
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
  must flex the defined beams rather than thin wall or grid remnants.
- Clip roots, catches, release paths, and matching windows remain inside solid
  structural keepouts. The decorative grid must not intersect them.
- The geometry must expose clip dimensions and interference as adjustable
  parameters because render inspection cannot establish release force,
  fatigue life, or material-dependent durability.

### Decorative Ventilation Grid And Wall Texture

- A staggered hexagonal through-grid appears on the unobstructed upper
  front-wall region. Additional grid fields may appear on uninterrupted side
  and rear-wall regions only when all structural keepouts remain satisfied.
- The top cap contains no ventilation grid and remains plain.
- Default hexagons are `12.0 mm` across flats with ribs at least `3.0 mm` wide.
- Grid fields retain at least `12.0 mm` of solid border at exterior edges and
  around the cap skirt, cap clips, USB clip, lay-in passages, power-strip
  supports, and wall junctions.
- Grid cells that would violate a keepout are omitted rather than clipped into
  thin partial ribs.
- The grid provides airflow but does not make the printed case electrically or
  thermally certified.
- Raised horizontal stripes appear on the exterior solid regions of all four
  body-wall regions. Front and rear stripes follow the straight X runs; left
  and right stripes follow the semicircular side arcs.
- All four walls use the same stripe center elevations so adjacent wall stripes
  align tangentially as continuous visual bands around the capsule perimeter.
- Each default stripe is `4.0 mm` high in Z, projects `1.0 mm` outward from the
  adjacent smooth wall surface, and repeats on `9.0 mm` vertical
  center-to-center pitch.
- Stripe fields retain `10.0 mm` solid top and bottom margins. Their peaks stay
  flush with the fixed exterior width/depth envelope and the cap perimeter.
- Each projecting stripe uses rounded exposed edges and a self-supporting lower
  transition no steeper than `45 deg` for upright body printing.
- Stripes stop cleanly at the USB clip, both lay-in passages, cap-release press
  pads, ventilation-grid openings, structural corners, and other keepouts.
  Interrupted stripes remain anchored at both ends and never form isolated or
  floating fragments.

### Render Modes And Printable Layout

- Supported modes are exactly `assembly`, `case_body`, `top_cap`,
  `usb_passthrough_clip`, and `printable_layout`.
- Unsupported render modes fail through an assertion.
- `assembly` shows the case closed by default with the non-printable Voomy
  reference disabled; an explicit override may show the reference for fit
  inspection.
- Individual-part modes place the requested part on the print plane in its
  intended orientation.
- The `top_cap` and `printable_layout` modes place the cap exterior downward,
  with its plain exterior surface touching the print plane.
- `printable_layout` includes exactly one body, one cap, and one USB clip as
  separate build-plate-supported objects with no intersection or floating
  geometry.
- The default layout should fit nominally inside `256 x 256 mm`; if the USB
  clip or required slicer margins prevent that, the parts remain correctly
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
  attached cable segments are lowered into them while the cap is absent.
  Schuko heads do not pass through the `20.0 mm` slot widths.
- Four fat cables means four jackets no larger than the provisional `12.0 mm`
  circular envelope stacked vertically in the right-side opening. It does not
  mean four Schuko heads pass through the right-side slot.
- The published `80 x 80 x 88 mm` product envelope is adequate for a provisional
  reference, but the USB offsets, attached-cord exit, plug-head dimensions, and
  connected assembly envelope are not supplied by the product listing.
- PETG or another material suitable for repeated flexing is preferred for the
  clips. Geometry alone cannot guarantee that a brittle material, poor layer
  orientation, or incorrect print settings will resist tearing.
- Horizontal means parallel to the floor on every wall: visual left-to-right
  on the straight front and rear runs, continuing around the semicircular left
  and right wall arcs at the same Z elevations.
- The case is used indoors in a dry location and does not override the power
  strip manufacturer's operating and load requirements.

## Regression Impact

- The design is additive and does not change existing OpenSCAD sources,
  dimensions, render modes, or printable parts.
- The README gains one new design section and retains existing design guidance.
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
  - `20.0 mm` tangential arc width and midpoint placement of the right passage,
  - `12.0 mm` cable clearance and four-cable vertical stacking,
  - USB clip seating and unobstructed shared access,
  - cap seating, clip alignment, engagement, and release clearance,
  - grid continuity, minimum ribs, and structural keepouts,
  - raised wall-stripe direction, projection, vertical pitch, aligned corner
    elevations, and keepout terminations,
  - a plain cap exterior with continuous build-plate contact,
  - wall and floor continuity around the full-height slots.
- Do not commit temporary render or mesh outputs.

### Slicer And Physical Validation

- Confirm all print groups, bed margins, layer orientation, bridges, and
  unsupported overhangs in Bambu Studio for the P2S.
- Confirm the upright body orientation produces self-supporting wall stripes
  without support material and that the exterior-down plain cap has continuous
  first-layer contact.
- Measure the actual power strip, USB group, attached-cord exit, intended
  Schuko heads, and cable jackets before relying on the defaults.
- Test that each cable segment can be lowered into the right passage without
  passing its attached Schuko head through the slot, and that all four
  connected cables can occupy the passage together at distinct heights.
- Test that the power strip's own cable can be lowered into the rear passage
  while its Schuko head remains outside and that the cable is not pinched by
  the cap.
- Verify that the USB clip can be removed and reinstalled and that another USB
  cable can be inserted while other USB cables remain connected.
- Fit and release the cap repeatedly, including at least 20 complete clip
  cycles, checking for whitening, cracking, delamination, excessive force, and
  loss of retention.
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
  adjustable parameters, render modes, printable parts, grid behavior, cap and
  USB clip operation, raised wall-stripe dimensions and directions, the plain
  cap requirement, and Bambu P2S print grouping.
- Document that both mains passages require cap removal so attached cable
  segments can be lowered into their open tops without passing Schuko heads
  through the `20.0 mm` slot widths.
- Document that the USB opening is in the left-hand portion of the front wall
  and serves only the USB group.
- Document the measurement checklist, material-dependent clip risk, ventilation
  limitations, electrical and thermal non-certification, and DRAFT physical-fit
  boundary.
