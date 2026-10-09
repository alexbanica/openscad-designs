# Nested All-Printed Bank Safe / Vault Toy

Status: Approved

Approval: The user approved the complete handheld specification with
"approve, do the plan" on 2026-10-05. This approval authorizes PLAN authoring.

Size decision: The user accepted a handheld outer maximum of 100 mm high x
85 mm wide x 75 mm deep, including handle and hinges, in this conversation.
This replaces the original approximately 180 mm height request. Approval of
this size decision is not approval of the complete specification.

## Purpose and scope

Create `designs/nested_bank_safe.scad`, an editable OpenSCAD 2021.01 design
for a convincing miniature bank-vault toy.  The completed set consists solely
of separately 3D-printed parts: Safe 1 contains removable Safe 2, which
contains Safe 3, Safe 4, and finally Safe 5.  Each safe has an independently
operable opening and preserves the user's escalating curiosity-and-joke
sequence.

The design targets a Bambu Lab P2S-class 256 x 256 mm build plate, a 0.4 mm
nozzle, and PLA/PETG-compatible FDM geometry.  It supports AMS-friendly
component separation, not mandatory multi-colour printing in a single part.
Update `README.md` with durable parameters, assembly, print orientation,
colour-assignment, and validation guidance.

This new work does not alter the approved wardrobe-rod design or its
specification and plan.  It adds one new coherent design and its durable
documentation only.

## Definitions and non-negotiable material boundary

- **Completed object** means every component installed in, on, or retaining
  any safe, including pins, axles, hinge members, latch members, bolt members,
  text plaques, handles, dials, secret-compartment closure, and decorative
  details.
- **100% printed** means completed-object components are all filament-printed
  from this design.  No screws, magnets, springs, bearings, metal hinge pins,
  rubber bands, glue, purchased hardware, or non-printed retainers are used or
  required.
- **Safe envelope** is its complete closed overall width x height x depth,
  including hinges, pin heads, handles, dials, plaques, feet, and trim. Depth
  extends from the rearmost to the foremost installed feature. No decorative
  or mechanical protrusion may be excluded from the nesting calculation.
- **Nest clearance** is the nominal per-side/layer clearance between a
  removable safe's envelope and its containing cavity, excluding intentional
  finger-access/retrieval features.  It is not permission to make any safe a
  friction fit.

## Confirmed behavior

### Common construction, fit, and presentation rules

- Model bodies, doors, handles, dials, hinge barrels, separately printed
  pins, latches, bolts, text inserts, and the Safe 5 secret compartment as
  printable parts.  Assembly may use only modeled snaps, captive geometry,
  printed pins, printed slides, printed catches, or equivalent printed
  interfaces.
- Keep each safe removable after its parent door is open.  Provide positive,
  intentional finger/retrieval access that does not depend on forcing a close
  nesting clearance: a visible front pull lip/tab or a pair of accessible
  side/floor reliefs integral to the containing cavity is required at every
  nesting level.
- The child's complete envelope must pass through the parent's open-door
  throat as well as fit its cavity. Retract the latch fully and swing the door
  clear of this straight extraction path. A nominal 0.5 mm nesting gap is not
  finger space: reserve an accessible grasp area at the child's front, with
  at least a 12 mm wide x 6 mm deep finger recess behind a rigid pull lip.
  Keep extraction loads on the shell-mounted lip rather than on a rotating
  handle or its latch. Its projection counts in the child's envelope.
- Use nominal 0.5 mm nest clearance and 0.3--0.4 mm clearance for moving
  printed interfaces unless a named interface needs a documented different
  value.  Use walls and roofs/floors of at least 1.6--2.0 mm where structurally
  practical; the default design values must be no thinner than 2.0 mm for
  primary safe shells.
- Make all components separately placeable with a stable broad face on the
  build plate. Prefer shell bodies rear-face-down with their door openings
  facing upward, flat doors with separate decorative parts, and separately
  printed pins on a stable modeled flat or broad head. Avoid spanning a
  complete cavity with a printed roof. Avoid floating print objects, excessive bridges,
  and unsupported horizontal overhangs; use chamfered lead-ins and
  self-supporting geometry where needed.
- Put user-adjustable values near the source top in labelled adjustable
  sections, put computed envelope/cavity/placement values in a separate
  derived-values section, use descriptive `snake_case` names and `_mm`/
  `_deg` units, and assert supported modes and critical positive dimensions.
- Default `render_mode` to `"printable_layout"`.  Also provide a reference-free
  `"assembly"` preview and explicit per-safe/per-part inspection modes needed
  to inspect the mechanisms.  The default layout must separate parts and keep
  them plate-supported; it may use multiple named print groups when the full
  set cannot fit one 256 x 256 mm plate.
- Treat printed lettering as separately printable thin positive inserts or
  plaques seated in shallow recesses, so AMS colour assignment can be applied
  per component.  The text remains entirely printed and mechanically retained;
  it is never glued or painted.

### Nominal nested envelope chain

The following manually selected design dimensions establish the initial fit
budget.  They are CAD defaults, not measurements of purchased hardware.
Each parent cavity includes 0.5 mm nominal clearance on every enclosing side
of its child, while the retrieval relief provides the required finger access.
These are envelope and space reservations, not demonstrated mechanism fit.

| Safe | Closed outer envelope (W x H x D, mm) | Minimum containing cavity for next safe (W x H x D, mm) | Primary visual role |
| --- | --- | --- | --- |
| 1 | 85 x 100 x 75 | 72 x 91 x 55 | Full miniature bank vault |
| 2 | 71 x 90 x 54 | 60 x 82 x 40 | Simplified but substantial safe |
| 3 | 59 x 81 x 39 | 50 x 74 x 28 | Compact intermediate safe |
| 4 | 49 x 73 x 27 | 41 x 66 x 18 | Valuable, mysterious inner safe |
| 5 | 40 x 65 x 17 | N/A | Gold-looking prize safe |

For Safes 1--4 the remaining total width/height/depth budgets are respectively
13/9/20, 11/8/14, 9/7/11, and 8/7/9 mm. These totals must accommodate all shell,
frame, hinge, door, moving-mechanism, and exterior-detail allocations outside
the reserved child chamber. With a 2 mm rear wall, the corresponding total
front depth allocations are 18, 12, 9, and 7 mm, including exterior handles
and interior latch travel. Do not treat these totals as extra space available
on both sides. The throat must provide at least the cavity's tabulated width
and height with the door fully open.

Safe 5 reserves a clear 34 x 55 mm message area and a concealed pocket at
least 30 x 40 x 3 mm behind the first message. The shallow pocket is for the
second reveal; no useful payload capacity is required. Use multiple lines for
both messages, retaining exact wording and punctuation. Target at least 4 mm
letter cap height, 0.8 mm positive strokes, and 0.6 mm relief, with connected
backing plaques rather than loose tiny letters. Verify actual glyph bounds
and stroke geometry rather than shrinking text automatically to fit.

The envelopes intentionally decline by shell and door allowance rather than
being a uniformly scaled copy.  The implementation must derive actual inner
cavities from wall, floor, roof, door, and clearance parameters, then assert
that the next closed safe envelope fits its parent at the stated nominal
clearance.  If the implementation finds that a functional mechanism cannot
fit an envelope while meeting the wall and clearance constraints, it must stop
for a specification amendment rather than silently reducing walls or changing
the nesting chain.

### Safe 1 -- outer vault

- Make Safe 1 100 mm tall within its complete 85 x 100 x 75 mm envelope, black body
  with separately printable silver-toned details suggested in documentation.
  It must read as a credible miniature bank safe: thick framed door, robust
  printed hinge barrels and separately printed hinge pins, large three-spoke
  rotating front handle, rotating combination dial, decorative locking bolts,
  stepped frame, and restrained industrial panel/rib detailing.
- The front door physically opens on its printed hinges.  The handle rotates
  on a printed axle/interface independently of the dial.
- The handle must drive a simple robust printed locking action: its rotation
  translates or swings at least two visible printed bolt elements between a
  clearly retracted door-open position and an extended frame-engaging
  door-closed position.  A printed latch/stop must hold the closed state; no
  combination security claim or real security resistance is required.
- Put the exact text `PRIVATE — DO NOT OPEN` on a separate mechanically
  retained front-door plaque/insert.  The dial is tactile/rotating presentation
  hardware, not a required combination lock.
- Opening the door makes Safe 2 visible and removable by the specified
  retrieval feature.

### Safe 2

- Safe 2 fits wholly within Safe 1 and is designed as a red body with black
  separately printable details.  Give it its own opening front door, printed
  hinge/pin arrangement, and a smaller rotating handle that actuates one
  simple printed latch or bolt.  The mechanism must change between latched and
  unlatched states, but need not replicate Safe 1's multiple-bolt theatre.
- Put the exact text `NOT YOURS` on a separate mechanically retained exterior
  plaque/insert.  Opening Safe 2 exposes removable Safe 3.

### Safe 3

- Safe 3 fits wholly within Safe 2 and is visually distinct (dark grey body
  with a contrasting separately printed text element is the documented colour
  suggestion).  Its front door must physically open using printed hinge/pin
  geometry.
- Use a mechanically obvious but smaller mechanism: a rotating knob or
  quarter-turn printed latch that blocks and releases the door.  Put the exact
  text `SERIOUSLY?` on an exterior plaque/insert.  Opening it exposes removable
  Safe 4.

### Safe 4

- Safe 4 fits wholly within Safe 3.  Its black body with gold separately
  printable details should look increasingly valuable and mysterious through
  restrained premium frame, medallion, or panel detailing; it remains a safe,
  not a cartoon object.
- Its own front door opens on printed hinge/pin geometry and has a simpler
  physical latch/quarter-turn closure.  Put the exact text `LAST WARNING` on
  an exterior plaque/insert.  Opening it exposes removable Safe 5.

### Safe 5 -- prize and concealed final compartment

- Safe 5 fits wholly within Safe 4 and is designed for a gold/yellow-filament
  body.  Its exterior contains no text.  It has an independently opening
  printed door/lid, hinge/pin interface, and the smallest practical printed
  catch or quarter-turn closure.
- Opening the obvious Safe 5 door/lid first reveals the exact printed message
  `FUCKING NOSY, AREN'T YOU?` on its interior message plaque.  That message is
  intentionally a plausible apparent ending.
- Behind or below that plaque, include a second, discrete all-printed secret
  compartment.  Use a flush, mechanically retained printed slide, cover, or
  catch whose release is subtle but discoverable through an intentionally
  modeled finger notch, seam, or other non-text cue.  It must be operable
  without tools or non-printed parts, and must reveal the exact printed message
  `UNBELIEVABLE.` inside.  The secret closure is not decorative-only.

## Explicit exclusions

- No real burglary resistance, keyed security, working numerical combination,
  electronics, lighting, sound, currency storage claim, or child-safety claim.
- No mesh exports (STL, STEP, 3MF, or similar) in source control.
- No external OpenSCAD libraries, purchased components, adhesives, hardware,
  or post-processing requirement for function.
- No physical-fit, retention-cycle, thermal, slicer, or material-strength
  guarantee from modeling alone.

## Acceptance and validation

- One editable `.scad` source defines every completed-object part and uses no
  external library dependency.  The source and README enumerate every printed
  component needed for each mechanism and make the no-nonprinted-hardware
  assembly boundary explicit.
- Source assertions verify supported render modes, positive shell/clearance
  values, plate-fit of each named printable group, and every parent/child
  nesting relationship against its 0.5 mm nominal clearance budget.
- `printable_layout` and reference-free `assembly` render successfully through
  local OpenSCAD commands limited to 15 seconds each, with temporary `/tmp`
  artifacts; stop any render exceeding that limit. Only those two modes are
  used for repository render validation, with selectors for print groups,
  safe number, and door/latch/secret-slide states as needed. Geometry
  inspection covers door clearance, hinge-pin alignment, Safe 1 handle/bolt
  travel, smaller latch travel, text-plaque separation, secret-compartment
  opening, and non-overlap of the nested arrangement.
- Inspect the complete closed envelope, open-door extraction throat, and
  moving-part sweeps at each level. Check the two message plaques for actual
  readable-sized glyph geometry and the hidden pocket for its reserved clear
  depth. Dimension arithmetic alone does not establish these outcomes.
- Run `git diff --check`.  Unit tests and conventional test-first phases are
  not applicable and must not be created or run in this repository.
- README records Bambu/P2S 0.4 mm nozzle-oriented print grouping, stable
  orientation for each part, PLA/PETG material caveats, nominal clearances,
  AMS component colour suggestions, printed-only assembly sequence, and the
  limits of CAD/render validation.  It must direct the maker to slicer-inspect
  and test-print mechanisms before relying on fit or repeated operation.

## Regression boundary

Existing designs, specifications, plans, and their documented behavior remain
unchanged.  This specification authorizes planning only; it does not authorize
implementation, commits, pushes, mesh exports, or physical printing.
