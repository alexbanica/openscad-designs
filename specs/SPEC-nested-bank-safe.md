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


## Amendment 1 — 2026-10-09 — Complete-set printable batch

- Amendment ID: SPEC-nested-bank-safe-A1
- Previous version: original approved specification, SHA-256
  `b5bf72858bd4955f877c39256ba8bc61ea4ca403e9df23692479d05c4dd614eb`.
- Approval: Explicitly approved by the user with "approve" on 2026-10-09.
- Request and purpose: User explicitly invoked `$iterate and give the ability
  to do that` after asking to print all five safes together. The user then
  selected `Complete set, split into plates if needed (Recommended)` on
  2026-10-09. Provide one complete-set preparation option, with separately
  selectable physical plates when the entire inventory needs several plates.
  This selection resolves the scope choice; it is not specification approval.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| Common construction: printable selection | One safe/group or individual item per printable invocation | Add opt-in `print_scope="complete_set"` within `render_mode="printable_layout"`; retain `print_scope="selected_group"` as the source default | Prepare the complete five-safe inventory without manually selecting twenty groups |
| Printable inventory | Full set reachable through existing safe/group selections | Complete-set mode includes every quantity from all five existing inventories, currently 47/24/24/24/32 = 151 printed parts | No missing pins, clips, message plaques or duplicated inventory |
| Printable plate selection | No complete-set plate count or selector | New `plate_index` default 1; positive indices select one generated plate; 0 shows a separated overview of all generated plates | Export physical plates individually while seeing the whole batch |
| Plate fit and orientation | Independently validated groups on a P2S plate | Deterministically allocate the complete inventory across as many plates as needed; preserve every part's existing geometry and manufacturing orientation | Multiple plates are permitted; a single-plate or minimum-plate-count promise is excluded |
| Documentation and acceptance | Per-safe/group usage and validation | Add complete-set activation, total plate count, overview, plate export instructions, full-inventory reconciliation and per-plate validation | Make the batch usable and verify coverage beyond the old group matrix |

### Confirmed behavior, definitions and constraints

1. A **complete-set batch** is the union of all quantities from Safes 1--5,
   using the same existing printed parts. A **plate** is one physical P2S
   256 x 256 mm XY build area. Batch preparation may require multiple print
   runs and manual plate changes; it does not mean automatic unattended
   printer operation or one simultaneous print of several physical plates.
2. Keep `render_mode="printable_layout"`, `safe_index=1`, `print_group="body"`
   and `part_id=""` as the existing source defaults. Add
   `print_scope="selected_group"` and `plate_index=1`. The complete-set scope
   is an explicit override. The printing-specific scope/plate controls do not
   change assembly or individual-part mode behavior.
3. In selected-group scope, current safe/group and single-copy `part_id`
   outputs remain unchanged; `plate_index` has no filtering effect there.
   In complete-set scope, valid `safe_index` and `print_group` values do not
   filter the batch. Retain their legacy value validation, and require
   `part_id=""`; reject a nonempty part filter rather than silently omitting
   parts. Reject an unsupported printing scope.
4. Complete-set placement is deterministic for identical source parameters.
   Identify each inventory occurrence by safe number, part ID and copy number.
   Each occurrence appears on exactly one plate. Preserve all geometry,
   dimensions, clearances, separability, installed fit, and current stable
   manufacturing orientations; translate parts on the plate without scaling
   or modifying them. Component identity remains available for the existing
   AMS colour-assignment guidance; no new colour palette is required.
5. Use a 5 mm nominal physical plate edge margin (the inner 246 x 246 mm area,
   XY 5..251 mm) and at least 3 mm clear separation between conservative XY
   footprints of printable objects. Every selected physical plate has no
   overlapping objects, no floating parts, every part resting at Z=0, and no
   geometry outside that margin. Oversized parts fail an assertion rather
   than shrinking, clipping or dropping inventory. The existing selected-group
   positions and validation bounds remain unchanged.
6. Compute and report a finite total plate count N and enough plate/inventory
   information to select indices 1..N without guessing. The packing need not
   minimize N. In complete-set scope, accept only integer `plate_index` values
   in 0..N; reject negative, fractional or out-of-range selections. Index 1
   must be a populated printable physical plate, not the all-plates overview.
7. Index 0 is an explicit inspection-only overview: show all populated plate
   layouts separated in XY, with each plate's actual part placement unchanged
   relative to its own origin. All printable objects remain Z=0, distinct and
   unscaled; no plate frames, labels or extra geometry become printed inventory.
   Its combined XY bounds may exceed one physical plate. This is the narrow
   exception to single-plate extent checking for overview only; every positive
   plate selection still must satisfy its physical plate bounds. README must
   clearly instruct the maker to select/export positive plate indices for
   printing and not print the overview as a single plate.
8. Preserve the one editable OpenSCAD 2021.01 source and no external-library
   dependency. No slicer integration, automatic multi-plate 3MF creation,
   checked-in STL/STEP/3MF files, new hardware, or printer control is added.
   This amendment defines complete-set layout selection, not an export script.

### Preserved behavior and impact

The original five safe envelopes, nesting allowance, primary walls, hinge and
closure mechanisms, finger recesses, messages, secret pocket/slide, all printed
inventories and current calibrated nonprimary capture/retainer stock remain
unchanged. Source at researched base `5f05c05f5489464c567f5d05df836d0a4d257e00`
is authoritative for preserved geometry: SHA-256
`a242ccb95a43674dbe24f57d8adf6543907bccfe75804ae9627e10f9e10c0205`.
Do not restore earlier development geometry or repeat solved fit adjustments.
Existing single-safe assembly, nested assembly/extraction, selected print groups,
individual-part selectors and colour component separation are preserved.
Bambu Lab P2S / AMS 2 Pro compatibility, 0.4 mm nozzle guidance, no-nonprinted
hardware boundary and all original physical/slicer validation exclusions remain.

Direct dependencies are existing inventory, manufacturing transforms, footprint
records, printable dispatch and README instructions in this repository only.
Current code exposes only one safe/group, so historical twenty-group checks do
not validate a new complete-set allocation. Credible regressions are omitted or
duplicated parts, selector conflicts, changes to old layouts, plate overflow,
XY overlaps, floating objects, and unintentional changes to component geometry.
The counterpart PLAN remains byte-identical while this SPEC amendment awaits
approval; a separately proposed PLAN amendment must follow approved SPEC A1.
No implementation, commit, push, worktree or printing authority is granted by
this pending planning amendment.

### Acceptance, regression, validation and documentation

- At nominal parameters, reconcile the batch manifest across all selected
  plates against the existing inventory: exactly 151 occurrences and the
  47/24/24/24/32 per-safe counts, with no missing or repeated occurrence.
- Verify deterministic allocation/plate count and that all 1..N selections
  are populated. Check every plate's generated object bounds, stable bed
  contact, object separation and quantity against its manifest. Inspect actual
  printable-layout artifacts and the all-plates overview; arithmetic alone
  does not establish the new complete layout's correctness.
- Verify unsupported scope, nonempty complete-set `part_id`, negative,
  fractional and out-of-range plate indices, and oversized items assert.
  Verify existing selected-group/part behavior and assembly selectors remain
  compatible, with printing-only controls ineffective outside printable mode.
- Continue only allowed `printable_layout` and reference-free `assembly`
  OpenSCAD validation, hard-limited to 15 seconds per render, temporary outputs
  under /tmp. If a complete plate mesh exceeds that bound, validation may use
  unchanged-coordinate actual-part subdivisions with explicit completeness
  and equivalence evidence; no timeout is success, no manufacturing solidness,
  quantity, placement or bed-contact criterion is removed. The subsequent PLAN
  must specify those mechanics and required independent assurance.
- Run `git diff --check`. Unit tests and conventional test-first work remain
  prohibited and inapplicable. Slicer output, actual printing, print tolerances,
  materials and cycle endurance remain outside modeled acceptance.
- README documents activation, unchanged defaults, ignored legacy filters in
  complete scope, empty `part_id` requirement, total plate count, index 0
  overview warning, sequential positive-index exports and manual plate changes,
  AMS component colouring, margins/spacing and slicer/test-print limitations.

### Approval record

The user explicitly approved the complete effective SPEC with "approve" on
2026-10-09: the preserved original body plus SPEC-nested-bank-safe-A1.
Reviewed proposal SHA-256:
`d42786455ac599fdd08904795e55c8a7599593dde00ab73b309bc41c323042a3`.
This approval is specific to the SPEC; PLAN A2 requires separate manual approval.
It does not start implementation or authorize Git delivery during iteration.


## Amendment 2 — 2026-10-10 — Simplified five-safe construction

- Amendment ID: SPEC-nested-bank-safe-A2
- Previous version: original approved specification plus SPEC-nested-bank-safe-A1;
  complete preceding file SHA-256
  `49993eff109e8005a0577c6bb7a9d264d53f80ec784c7f88595417c5f9959272`.
- Approval: Explicitly approved by the user with "approve" on 2026-10-10;
  complete effective SPEC (original plus A1 plus A2).
- Request and purpose: User explicitly invoked `$iterate and simplify it`
  after discussing the 151-part assembly. The user then selected
  `Simplify fully: fixed decorative dial and removable secret-message cover`.
  Preserve five nested safes and the surprise sequence while substantially
  reducing printed hardware and assembly operations. This selection resolves
  behavior choices; it is not approval of this complete specification.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| Common construction; original Safe 1–5 hinges | Separate door-side hinge leaves, four attachment pins/clips per safe, and retained hinge axle | Body-side and door-side hinge barrels integral to their respective body/door; one removable printed axle with positive printed retention per safe | Eliminate hinge attachment hardware |
| Original Safe 1 locking action and PLAN-derived drive | Three-spoke handle drives two sliding bolts through rotor, guide, spacers, catch and multiple retainers | Retain the three-spoke handle, directly driving a single quarter-turn frame-engaging cam; no separate sliding bolts, rotor guide or manual catch | Replace the largest mechanism assembly with one obvious latch |
| Original Safe 1 rotating dial | Independently rotating dial and retainer | Fixed decorative dial relief integral to the door | Preserve vault appearance without another moving assembly |
| Original Safes 2–5 closures | Separately keyed cam/axle/knob/clip assemblies | One simple quarter-turn cam per safe, with handle/knob and axle combined where practical and positive printed axial retention | Reduce repeated hardware while keeping a working closure |
| Common text/colour boundary and original exterior plaques | Separate mechanically retained plaques and trim with mounting pins/clips | Exact exterior lettering and restrained trim integral to the door; no separate exterior plaque/trim mounting hardware | Reduce assembly and loose parts |
| Safe 5 secret closure; previously delivered captive slide | Captive first-message slide, detachable cleats, cleat pins/clips and transverse end stop; separate fixed second plaque | One removable first-message cover retained by integral body rails; second-message lettering integral to the fixed pocket backing/body | Keep the second reveal with one loose cover and no separate rail/end-stop hardware |
| A1 preserved geometry/inventory and acceptance counts | Preserve all manufacturing geometry; exactly 151 occurrences and counts 47/24/24/24/32 | Redesign only the nested safe's named mechanisms and decoration within preserved envelopes; no more than 50 completed-object printed occurrences across all five | Make part reduction an explicit acceptance criterion |
| A1 batch acceptance and plate count | Nominal inventory 151 on three plates, 42/53/56 | Recompute inventory and deterministic plate allocation for the simplified parts; no promised plate count | Preserve complete-set functionality without retaining obsolete quantities |
| Legacy operating/part selectors | Catch, dial rotation, removable guide and captive slide controls/part IDs | Remove obsolete controls/parts; document replacements; retain the general render, group, safe, latch, door and batch interfaces | Keep the interface consistent with the actual mechanism |

### Confirmed behavior, dimensions and constraints

1. **S1 — Scope and part budget.** Keep five independently opening and removable
   safes in the same order. Count every separately manufactured completed-object
   item, including all repeated pins and retainers, toward a hard maximum of
   50 printed occurrences for the full set. Do not count an integral feature as
   another part, omit installed hardware, merge disconnected printable objects
   into a fictitious part, or trade tool-free assembly for the count target.
   A conceptual allocation of body, door, hinge axle, hinge retainer,
   handle/axle, cam and cam retainer gives seven parts per safe, plus one
   removable secret cover: 36 total. This is a design allocation, not proven
   geometry or a promise that all interfaces fit; the final fully enumerated
   inventory must satisfy the 50-part cap.
2. **S2 — Hinges.** Integral body and door hinge barrels share one axis and
   permit the same door travel and clear child extraction. One removable printed
   pin and positive printed retention hold each door; no separately attached
   hinge leaves or leaf mounting pins/clips remain. Friction-only pin retention,
   living hinges, and flexing primary shell panels are excluded. Any localized
   snap retainer remains a separate named, inspectable printed interface; its
   material behavior is not proven by CAD. Disassembly is intentional and
   tool-free, with accessible retainers and an explicit assembly order.
3. **S3 — Latches and appearance.** Every safe has one physical quarter-turn
   cam that positively blocks the door in the latched state and clears the
   frame/throat in the released state. The handle/knob directly drives it,
   with travel stops and positive axle retention. No springs, purchased parts,
   separate manual catch or linked sliding-bolt drive are required. Safe 1
   retains a large three-spoke operating handle, a thick framed door, fixed
   decorative dial and restrained industrial relief. Safes 2–5 use progressively
   smaller knobs. The dial is purely static decoration. This explicitly
   replaces the original two moving visible bolts and independent rotating
   dial requirement; no combination-lock or security claim is added.
4. **S4 — Lettering and colour.** Safes 1–4 retain exact exterior strings
   `PRIVATE — DO NOT OPEN`, `NOT YOURS`, `SERIOUSLY?`, and `LAST WARNING`.
   Lettering and trim are connected integral door geometry, with no loose
   letters or exterior plaque fasteners. Safe 5 exterior stays text-free.
   Keep the original glyph-size, stroke, relief and wording requirements;
   verify actual glyph bounds rather than shrinking automatically. Suggested
   body/door colours remain black/silver, red/black, dark grey/contrast,
   black/gold, and gold/yellow. Bodies, doors and operating components remain
   separately printable/colourable. Individual lettering and trim cease to be
   separate AMS objects; optional slicer painting or height colour changes
   are maker workflows, not a supplied slicer integration or guaranteed
   automatic multicolour result.
5. **S5 — Secret cover.** Opening Safe 5's door first exposes the exact
   `FUCKING NOSY, AREN'T YOU?` message on a connected backed cover. The cover
   slides along integral body rails and can be fully removed through the open
   front access using a subtle modeled finger notch; no captive end stop,
   detachable cleats or extra rail mounting hardware remains. The cover is
   positively retained by the rail geometry when seated, and ordinary handling
   must not reveal the second message accidentally. Its release is tool-free
   and intentional. Removing it reveals exact `UNBELIEVABLE.` lettering on
   the fixed pocket backing, integral to the body. The cover can be reinstalled.
   Preserve the two distinct reveal stages and conceal the second message
   until intentional cover removal. Preserve the 34 x 55 mm first-message
   reservation and at least 30 x 40 x 3 mm clear secret pocket measured above
   the second-message relief. No useful payload capacity is added. Retained
   slide engagement/travel and end-stop requirements of the former captive
   mechanism are replaced by removable-cover retention and removal access.
6. **S6 — Hard dimensional boundaries.** Manually selected complete W/H/D
   remain 85/100/75, 71/90/54, 59/81/39, 49/73/27 and 40/65/17 mm. These are
   CAD dimensions, not hardware measurements. Preserve the nominal 0.5 mm
   child nesting clearance, complete-envelope accounting, original minimum
   chambers/throats, at least 2 mm primary shell walls, and shell-mounted
   retrieval lips with at least 12 x 6 mm finger access. Changing hinge, cam,
   decoration or secret retention geometry within these envelopes is in
   scope; enlarging safes, reducing shell walls or narrowing child extraction
   is not. Moving-interface defaults remain 0.35 mm per mating surface within
   the original 0.3–0.4 mm range. Preserve existing calibrated exception values
   only for retained interfaces; document and validate any new named exception
   instead of applying an old tolerance to a different mechanism silently.
7. **S7 — Manufacturing and source.** Keep one editable OpenSCAD
   2021.01-compatible source with no external library. Parts are independently
   separable, stable at Z=0, and oriented with a broad stable face down;
   integral barrels/decoration cannot introduce floating islands or require
   unsupported shelves. Preserve Bambu Lab P2S / AMS 2 Pro and 0.4 mm nozzle
   guidance, printed-only construction, and no glue/tools/nonprinted hardware.
8. **S8 — Interface and batch behavior.** Retain `render_mode` modes
   `printable_layout`, `assembly`, and explicit `individual_part`, with source
   default `printable_layout`. Preserve `safe_index=1`, `print_group="body"`,
   `part_id=""`, `print_scope="selected_group"` and `plate_index=1` defaults,
   safe/group validation, complete-set empty part filter, deterministic
   translation-only packing, 5 mm margins, 3 mm footprint separation,
   positive populated plate indices and inspection-only overview index 0.
   Inventory/footprints/part IDs describe the new parts; old removed part IDs
   fail visibly rather than exporting different parts under old names.
   Keep group names body/door/mechanism/details; explicitly document any empty
   details groups after integration. Keep single/nested assembly, door travel
   0–110 degrees, latch 0 latched/90 released, and extraction of the immediate
   child subtree after the parent door fully clears. Replace `secret_slide_mm`
   with `secret_cover_removed=false`; the true assembly state places the same
   manufactured cover aside and shows the pocket, permitted only with active
   Safe 5's door open. The general assembly/extraction rules remain unchanged.
   Remove catch, guide-inspection and dial-rotation controls from the documented
   source interface. No backwards compatibility for obsolete moving assemblies
   or old STL parts is promised; this is a coordinated replacement complete set.

### Preserved behavior and impact

This amendment explicitly supersedes the original mechanism/colour clauses and
A1's manufacturing-geometry preservation, exact 151-item inventory and calibrated
interface assumptions only where the named redesign requires it. A1's complete-set
selection, packing, physical plate bounds and validation standards remain intact.
Current source at `bc3e9ecc7cb472b6aa6791160e800f5e24ee0e6a`, SHA-256
`bc7bea006b66e5a770e5fbb6c916b218df12bbc278c94c3212640ee7159a95bf`,
is the starting reference; historical mechanisms are not restored as calibration
truth. This is a new matched five-safe set, not a retrofit promise for existing
printed doors/bases. Unrelated designs and predecessor artifacts remain untouched.

Direct dependencies are the single source, its inventory/footprints/manufacturing
transforms/assembly dispatch, complete-set allocator and README. Credible risks
are hinge print orientation, pin retention, single-cam engagement/sweeps, blocked
extraction, integral text clearance/readability, inadvertent secret disclosure,
cover removal/reinsertion access, and stale parts/selectors/batch quantities.
Static exploration confirms existing inventories and hardware complexity only;
no redesigned hinge, latch, cover fit, revised count or plate layout has been
rendered or physically validated during this iteration.

The counterpart `specs/PLAN-nested-bank-safe.md` remains byte-for-byte unchanged
until this complete effective SPEC receives explicit approval. Subsequent planning
must append PLAN-A3 against approved SPEC-A2, preserving prior PLAN content and
approval history; implementation remains separately gated.

### Acceptance, regression, validation and documentation

- **V1 — Inventory:** enumerate each completed-object occurrence and per-safe
  quantities; prove the full set contains no more than 50 printed parts and that
  complete-set manifests include every new identity/quantity exactly once.
- **V2 — Mechanisms:** generated geometry and independent inspection establish
  integral hinge connectivity/coaxiality, positive retained axles, assembly and
  reverse disassembly access, each latch's engagement/release/stops, and door
  clearance throughout travel. Inspect actual geometry and moving sweeps, not
  scalar budgets alone. No original sliding-bolt/catch/dial-motion claim remains.
- **V3 — Nesting:** inspect all five closed envelopes, four cavity/throat and
  straight extraction transitions, retrieval access and surrounding sweeps;
  preserve the original clearances and walls. Confirm full door clearance.
- **V4 — Presentation/reveal:** inspect integral text and actual glyph dimensions,
  all exact strings, blank Safe 5 exterior, first reveal with seated cover,
  intentional cover removal, concealed/revealed second message, reinstatement,
  rail retention, removal path and clear pocket above text relief.
- **V5 — Printing/batch:** inspect actual per-part mesh solidness, connected
  components and contact, every nonempty group, all revised physical plates and
  overview. Establish footprint containment, finite populated plates,
  separation, margins, counts and deterministic allocation. Test required
  selector assertion diagnostics through direct parameter invocations; verify
  batch controls remain ineffective outside printable layout. No fixed three-
  plate or 151-item regression comparison is applicable to the redesigned set.
- **V6 — Allowed evidence:** use only printable_layout/reference-free assembly
  OpenSCAD validation, hard-limited to 15 seconds per render, temporary artifacts
  under /tmp. Preserve the approved subdivision route with complete placement,
  quantity, actual mesh topology and production-equivalence evidence whenever
  whole renders time out. Timeouts are missing evidence until coverage is
  supplied. Run git diff --check; unit tests/test-first remain prohibited.
  Slicing, physical printing, tolerance/material behavior, clip fatigue and
  cycle endurance remain outside modeled acceptance and unverified.
- **V7 — Documentation:** README must explain reduced inventory, new assembly
  order/disassembly, simplified closures, fixed dial, integral text colour
  tradeoff, removable secret cover, replaced controls/obsolete parts, revised
  plate count/index workflow, dimensions/clearances, AMS guidance and slicer/
  test-print limitations. No generated meshes enter source control.

### Approval record

The user explicitly approved the complete effective SPEC with "approve" on
2026-10-10: preserved original body plus approved A1 plus SPEC-nested-bank-safe-A2.
Reviewed proposal SHA-256:
`ee78f532e661d35ce86d57864d3a9b6861682b9fb1245d33cb9c39fde773ec29`.
Document Status and all earlier content/approval history remain unchanged.
This approval authorizes the corresponding PLAN amendment preparation only;
PLAN-A3 requires separate manual approval. Implementation and Git delivery do
not start during iteration.
