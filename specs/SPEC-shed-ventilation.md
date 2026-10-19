# Shed ventilation with downward-opening access door

Status: Approved

Date: 2026-10-12

Revision: Specification revised for a single print with no assembly.

## Purpose and scope

Replace the photographed fixed shed ventilation grille with a printable mounting
frame and a full-width louvered door. The entire louvered panel opens outward
and downward about a horizontal bottom hinge for temporary cable access. Close
the door after removing the cable. Preserve passive ventilation when closed.
Print the complete vent mechanism in one job, with its hinge already captive
and operational without assembling any parts.

This is a new design, proposed as `designs/shed_ventilation.scad`, with durable
instructions in `README.md`. Existing designs and their approved SPEC/PLAN
artifacts remain unchanged, including the nested-bank-safe work in progress.
Planning does not authorize implementation or delivery.

## User decisions and evidence

- User supplied four photographs of a mounted metal grille with measuring tape.
- User confirmed: "Stay open during use; close after cable removal".
- User clarified: "the whole ventilation cap needs to be opened".
- User authorized: "Use adjustable photo estimates pending a fit check".
- User required on 2026-10-12: "everything needs to be printable, including the
  hindge in one go. There should not be any assembly".
- Visible arrangement: four corner screws and two columns of four downward-facing
  louvers. The wood opening behind the grille is not visible.
- No dimensions were physically measured by the agent. Tape placement,
  perspective, and obscured edges prevent precise dimension recovery.

## Dimensions and provenance

All dimensions below are manually entered design inputs in millimetres. Photo
estimates are provisional; selected design defaults are not measurements of the
existing vent. Expose mounting and clearance dimensions for adjustment.

| Input | Initial value | Provenance / limitation |
| --- | --- | --- |
| Mounting plate width | 125 | Approximate tape reading from photos 2–4 |
| Mounting plate height | 85 | Approximate tape reading from photo 1 |
| Horizontal screw centre spacing | 110 | Rounded photo-derived starting estimate; confirm all four positions |
| Vertical screw centre spacing | 70 | Rounded photo-derived starting estimate; confirm all four positions |
| Screw clearance diameter | 4.5 | Selected design default; actual screw shank unknown |
| Screw head clearance diameter | 9 | Selected design default; actual screw head unknown |
| Frame border width | 10 | Selected design default |
| Frame clear opening | 105 × 65 | Derived from plate size minus two borders; not the measured wood opening |
| Frame thickness | 3 | Selected design default |
| Door nominal panel thickness | 2.4 | Selected design default, excluding louvers and hinge |
| Door overlap onto frame | 3 per edge | Selected design default around the clear opening |
| Moving-part clearance | 0.4 per mating side | Selected starting print-fit allowance, adjustable |
| Captive hinge journal diameter | 3 | Selected provisional design default, adjustable; not a separate pin |
| Louver outward projection | 5 | Selected design default; original projection unknown |
| Louver rows × columns | 4 × 2 | Visible photograph arrangement |

The 125 × 85 mm dimension describes the mounting plate, not the overall envelope
including projecting hinge, catch, and louvers. Do not label those projections as
matching the existing metal plate. The actual available passage is the overlap of
the frame opening and the existing wall opening; no connector fit is established.

## Operation and geometry

1. Mount the fixed frame over the existing opening using four accessible corner
   screw holes. Keep its rear mounting face flat, with no insert that presumes a
   particular wall thickness or hidden aperture. Existing hole reuse is the
   intended installation, subject to measuring and adjusting the parameters.
2. Make the entire louvered panel one moving door. Any division between the two
   louver columns moves with the door; no fixed centre bar, mesh, or crosspiece
   obstructs the cable opening.
3. Use a captive print-in-place hinge with printed bearing and retention
   features. The frame, door, hinge, catch, and stop print together in one job;
   no pin insertion, separate retainers, joining, or hinge hardware is required.
   Put the horizontal axis below and outward of the opening so the
   door clears the frame and can swing through at least 90 degrees from closed.
   At 90 degrees the open door must clear the projected frame passage. Provide
   a positive stop at that position; the door is not a cable-support shelf.
4. Use a finger-releasable printed top catch and finger grip. The closed door
   remains retained without a cable present. Release the catch and lower the
   door to use the opening; remove the cable before closing. No cable notch,
   closing-around-cable function, lock, magnets, or additional metal hinge is
   included.
5. Keep real airflow passages behind the eight louvers when closed. Louvers
   face downward in the installed orientation. Overlap the door and frame to
   reduce direct rain entry at the seam, and avoid blind water traps at the
   lower hinge. This is a ventilated cover, with no watertightness, insect-proofing,
   certified airflow, or weather-performance claim.
6. Round or chamfer exposed passage edges and keep latch/hinge features outside
   the clear passage. The opening provides access, not cable strain relief.
7. Parameter combinations must reject invalid dimensions, collapsed airflow
   openings, intersecting screw/hinge/catch regions, and nonpositive clearances.
   Dimension changes must retain the full-panel operation and corner fastening.

## Source, print-in-place operation, and printing

- One editable OpenSCAD 2021.01-compatible source without external libraries.
  Follow repository adjustable/derived parameter and named-module conventions.
- Default `render_mode = "printable_layout"`. Produce the complete captive vent
  mechanism on one plate in one print job. This user-required captive design is
  an explicit exception to the repository preference for independently
  separable printable parts. Preserve stable bed contact and no floating bodies:
  both frame and moving door must grow from bed-supported geometry, including
  any integral hinge journals. Coordinate the door underside, overlap, and hinge
  rather than suspending the door above the frame across a clearance gap.
- Keep the mechanism in its operational hinge range in the print configuration;
  do not depend on assembly or bypassing the permanent stop to move from its
  printed configuration into normal use. Internal moving clearances must not
  require inaccessible support removal. Exterior removable slicer supports are
  permitted where needed, with access documented.
- No separate parts need fitting, snapping together, gluing, pin insertion, or
  fastening to make the vent mechanism work. Removing the print from the bed,
  accessible support cleanup, and gently freeing printed moving clearances are
  permitted preparation, not assembly. Mounting the completed vent to the shed
  with the existing screws remains the installation step.
- Provide `assembly` as an installed-position inspection mode with an adjustable
  door angle, including closed and 90-degree-open configurations. This mode name
  does not imply a physical assembly step. Inspection renders remain limited to
  assembly and printable_layout under repository rules.
- Preserve Bambu Lab P2S and AMS 2 Pro compatibility. No multicolour requirement.
  README must describe suitable outdoor-material selection and slicer review;
  no particular material's weather life or hinge endurance is established here.
- Captive retention must remain effective throughout the opening range after
  freeing the hinge. Preserve mounting-screw access and finger catch release.
  Do not claim that the provisional clearances guarantee an unfused hinge on
  every printer/material combination.

## Acceptance and validation

- Source defaults match the dimension table and preserve the distinction between
  photo estimates, selected defaults, and derived values.
- Closed assembly shows a retained, overlapping louvered panel with eight real
  vent passages. Open assembly shows the entire panel lowered, a functioning
  hinge/stop, and a continuous unobstructed 105 × 65 mm nominal frame passage.
- Inspect hinge sweep and interference at intermediate angles as well as both
  endpoints. Confirm screw-head and mounting-tool access and separation from
  moving parts in modeled geometry.
- Inspect printable_layout for the complete captive mechanism in one print,
  stable bed contact of every moving body, louver overhangs, bearing clearances,
  integral retention, catch and stop geometry, and accessible support cleanup.
  Confirm there are no loose required components or post-print assembly steps.
  Geometry inspection alone does not prove that the hinge will print unfused.
- Use bounded OpenSCAD assertions and renders in permitted modes. Stop each
  render exceeding 15 seconds; keep temporary artifacts in `/tmp`. Record any
  uncompleted inspection honestly. Unit tests and conventional test-first work
  are not applicable and must not be performed.
- Run `git diff --check`. Keep generated mesh exports out of source control.
- Physical fit is explicitly pending under the user's photo-estimate choice.
  Before printing for installation, measure the wood opening, four screw
  positions, shanks and heads; adjust the model and inspect the sliced parts.
  Before routine use, confirm mounting coverage, connector passage, door swing
  against the real siding, catch retention, and captive hinge operation after
  freeing the print without assembling components.
- CAD validation does not establish physical fit, endurance, weather resistance,
  slicer results, or cable safety. These are user checks, not claims required to
  complete the modeled design using the authorized provisional dimensions.

## Documentation and exclusions

README must record the dimension/provenance table, adjustable parameters,
print-in-place preparation and render usage, printing orientation/support
considerations, hinge clearance tuning,
installation measurement checks, and the open-use/remove-cable/close sequence.

Exclude modification of the shed, enlargement of the wall opening, electronics,
fixed insect screens, sealed cable glands, connector-specific fit guarantees,
airflow ratings, physical test results, and changes to other repository designs.
No original vent slot depth or hidden wall dimensions may be presented as
measured from these photographs.

## Revision against the previous proposal

The 2026-10-12 user correction replaces the separate removable hinge pin and
independent-parts layout with one captive print-in-place mechanism requiring
no assembly. Validation and documentation now cover bed-supported moving bodies,
printed clearances, captive retention, and initial freeing instead of pin fitting.
The mounting estimates, full-panel downward opening, 90-degree stop, louvered
ventilation, top catch, and cable-removal-before-closing behavior are preserved.
The earlier proposal was not approved; the complete revised specification was
approved on 2026-10-12.

## Approval

Approved on 2026-10-12 by the user reply "approve" to the complete revised
specification requiring one print with a captive hinge and no assembly. This
approval authorizes PLAN drafting; implementation requires separate PLAN approval
and valid implementation entry.

## Amendment 1 — 2026-10-12 — screw-access corner relief

- Amendment ID: SPEC-shed-ventilation-A1
- Previous version: original approved 2026-10-12 body
- Approval: Automatically authorized by originating implement request; planning assurance pending
- Request and purpose: implement invocation on 2026-10-12; integrated review found the 9 mm screw-head envelope conflicts with continuous 3 mm corner overlap at the approved 110 × 70 mm spacing.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| Dimensions; Operation 1 and 5 | 3 mm overlap per edge without a corner exception | Preserve 3 mm overlap along the straight edges; permit four local circular corner reliefs for screw heads/tools, radius screw_head_diameter_mm/2 + moving_clearance_mm. Restrict relief to geometry at or above the frame top; preserve the recessed door core below that plane. | Head radius 4.5 mm plus 0.4 mm clearance exceeds the 3.536 mm distance from screw centre to aperture corner; continuous corner overlap conflicts with accessible unchanged screw defaults. |
| Acceptance closed overlap | Continuous perimeter implied | Overlapping straight edges with explicitly interrupted screw-access corners; inspect relief and document increased local rain-entry exposure. | Make the unavoidable modeled exception explicit rather than claim uninterrupted overlap. |

### Preserved behavior and impact

All mounting/photo inputs, full nominal 105 × 65 mm open passage, eight louvers, captive one-print hinge, no assembly, downward opening, top catch, 90-degree stop, print and physical-validation boundaries remain unchanged. No other design changes. README describes corner relief and weather limits. PLAN-shed-ventilation-A1 carries correction and assurance.

### Approval record

The complete effective SPEC including SPEC-shed-ventilation-A1 is automatically authorized on 2026-10-12 by the originating `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md` request under active implement amendment rules. Independent explorer/architect planning assurance must finish before resumed source correction. Original status and approval are preserved.

## Amendment 2 — 2026-10-12 — swept screw clearance

- Amendment ID: SPEC-shed-ventilation-A2
- Previous version: SPEC-shed-ventilation-A1, automatically authorized but not implementable after architecture assurance
- Approval: Automatically authorized by originating implement request; planning assurance pending
- Request and purpose: architect assurance of A1 found retained core intersects a 9 mm head at 0.5 degrees; complete the original accessible-fastener and unobstructed-motion criteria.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A1 relief/core boundary | Cut only above frame top; preserve entire recessed core | Permit four local relief cuts through the complete moving door, including recessed core, where screw clearance requires; document four small additional closed corner ventilation gaps and increased local rain exposure. Preserve 3 mm straight-edge overlap and the complete fixed 105 × 65 mm open passage. | Frame-top-only cuts leave material that rises into screw heads during initial opening. |
| Screw envelope provenance | Head diameter 9 mm; height unspecified | Add adjustable screw_head_height_mm = 4 mm as a manually entered provisional design default, not a measured fastener. Validate against cylinder diameter9, Z=frame_thickness_mm through frame_thickness_mm+head_height. Measure actual heads before printing. Tool access is required at mounting/inspection poses, not with a tool present during motion. | Bounded modeled envelope is needed to distinguish actual head clearance from an indefinitely tall screwdriver keepout. |
| Sweep evidence | Original sampled0/30/60/90 views | Additionally inspect 0–3 degrees analytically against head envelope and assess full sweep, enlarging local clearance cuts if necessary without changing mounting defaults. | Sampled endpoints miss initial corner motion. |

### Preserved behavior and impact

All original and A1 requirements/ownership/assurance remain except explicit replacements above. No physical fastener measurement or weather claim. Original two bodies, captive hinge, no assembly, eight louvers, downward swing, catch, stop, printer compatibility and full open frame passage remain required. U2 developer applies consolidated guards and swept local relief; U3 independent QA checks head envelopes and original criteria; U4 README records selected head height, corner gaps, measurements and weather limits; U5 parent delivers four paths to main/origin/main. The corresponding PLAN-shed-ventilation-A2 defines the same complete effective boundary.

### Approval record

Complete effective SPEC, including ordered A1 and these overriding A2 changes, is automatically authorized on 2026-10-12 by the originating `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md` request under active implement amendment rules. A1 assurance: explorer verified numerical corner conflicts and gates; architect identified 0.5-degree core/head collision. This A2 disposes that supported finding and retains all remaining A1 corrections. Independent explorer/architect assurance of A2 is pending before correction resumes. Earlier bodies and approval records remain unchanged.

### A2 planning assurance and effective-revision confirmation

On 2026-10-12 independent explorer verified artifact hashes, base and source evidence; independent architect confirmed the initial 0.5-degree head collision and found A2 coherent without a blocking finding. The parent accepted their dispositions: A2 supersedes every A1 core-preservation statement/trace; U2 explicitly uses full-depth local relief and positive adjustable head height, guards actual screw shank/head/catch/hinge envelopes and journal/bridge connection. U3 explicitly evaluates 9 mm diameter, 4 mm default height heads at Z=3..7, initial 0..3-degree motion and full sweep, retains connected core/door apart from authorized corner gaps, and runs all original QA criteria. Tools are inspected at mounting poses only. No unsupported lower-head collision is claimed. Documentation carries the new provisional input and local-weather exception.

The parent confirms automatic approval of the complete effective revision including A1 as overridden by A2 under the originating implement request, after required planning assurance. Implementation resumes in the same session. Original artifact contents/status and prior approvals are preserved.

## Amendment 3 — 2026-10-12 — modest durability reinforcement

- Amendment ID: SPEC-shed-ventilation-A3
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A2
- Approval: Approved by user on 2026-10-12
- Request and purpose: user explicitly invoked iterate: "make the elements a little bit thicker, specially the elements which are movable and which support the fix in place", then clarified "reason is durability". Increase selected structural sections of the complete vent, prioritizing moving hinge features and the fixed features that retain/support them.

### Changes against the previous version

All proposed values are manually entered design selections, not measured hardware or validated strength results. Current hard-coded feature sizes become named adjustable inputs where appropriate; bearing/hinge connection and stop-contact dimensions may be derived to preserve the specified behavior.

| Section / feature | Before: current delivered source | After: proposed default / requirement | Reason |
| --- | --- | --- | --- |
| Mounting frame thickness | 3 mm | 3.6 mm | Modest increase in fixed mounting/support section |
| Moving door panel and overlap thickness | 2.4 mm | 3.0 mm | Increase moving-panel section |
| Moving perimeter connecting wall | 1.0 mm | 1.2 mm | Reinforce the connection from bed-contact core to overlap |
| Integral journal diameter | 3.0 mm | 3.6 mm | Increase hinge journal section |
| Hinge arm / bridge width | 2.0 mm | 2.4 mm | Reinforce moving hinge connection |
| Captive head axial thickness | 1.6 mm | 2.0 mm | Reinforce printed axial retention |
| Bed-reaching captive-head toe width | 0.6 mm | 0.8 mm | Reinforce the slender retained toe while maintaining bed support |
| Bearing outer material around chamber and roof | Approximately 1.6 mm selected roof/side allowance at defaults | At least 2.0 mm minimum external wall/roof material, excluding intentional journal throats and drainage opening | Reinforce fixed journal support; enlarge its exterior rather than consume moving gaps |
| Moving stop lug X/Z section | 1.0 × 1.0 mm | 1.4 × 1.4 mm | Reinforce the small stop feature |
| Fixed stop height / Y contact depth | 1.0 / 1.4 mm | 1.4 / 1.8 mm | Reinforce fixed stop support; recalculate moving radial reach so contact remains at 90 degrees |
| Louver roof nominal thickness | 1.2 mm | 1.6 mm | Reinforce exposed moving-door louver edges while retaining eight real passages |
| Catch rigid anchor, hook and finger grip | Catch width12 mm, hook thickness1.2 mm; grip width10 mm and height2 mm | Local fixed anchor width14 mm, rigid hook thickness1.6 mm, grip width12 mm and height2.4 mm; preserve accessible finger release | Strengthen retention attachments and handling features |
| Catch flexible beam | 1.2 mm section, approximately4.6 mm exposed length at current defaults | Preserve 1.2 mm flexure section and 12 mm flexure width; provide at least the previous effective free length and retain the required outward release displacement through clearanced geometry | Blind thickening would increase release stiffness; durability must retain finger operation |
| Claimed outcome | No strength/endurance proof | Increased modeled material sections intended for durability; no quantified strength, endurance or material-elasticity claim | CAD thickness alone does not establish durability |

### Preserved behavior and impact

Preserve plate footprint125×85 mm, screw centres110×70 mm, shank clearance4.5 mm and selected head diameter/height9×4 mm, border10 mm and nominal rounded105×65 mm unobstructed open passage. Preserve eight downward-facing airflow passages, louver projection5 mm, 3 mm straight-edge seam overlap and the authorized four local full-depth screw-access reliefs/weather limitations. Keep moving clearances at0.4 mm per mating side; strengthen solid features rather than reduce those clearances. Preserve one print with two captive bed-supported bodies, no loose parts or assembly, flat rear mounting face, full-panel outward/downward0–90-degree operation, retained closed pose, finger catch/grip and positive90-degree stop. Preserve screw/tool access and all existing cable-use/removal instructions.

The thicker frame/panel/journals/retainers require coordinated derived hinge-axis placement, chamber dimensions, bridge connections, catch placement and stop-contact reach. Implementation planning must allocate their numeric envelopes before approval; simply replacing thickness literals is insufficient. Local reinforcement must stay outside the clear passage and screw keepouts. Overall projecting envelope may grow modestly; recompute it and retain Bambu Lab P2S/AMS2 Pro compatibility. No edits to other designs or nested-bank-safe artifacts; no hidden wall dimensions, hardware measurements or physical results are introduced.

Acceptance adds explicit before/after section inspection for the reinforced frame, panel/perimeter, hinge arms/journals/heads/toes/bearing walls, stop, louver roofs, rigid catch anchor/hook and grip. Revalidate two connected bed-supported bodies, positive as-printed separation, captive retention, early0–3-degree screw-head clearance and full sweep, unobstructed passage, finger-release envelope, exact90-degree stop, eight noncollapsed passages, drainage and accessible support cleanup. Bounded allowed-mode OpenSCAD assertions, layout and0/30/60/90-degree previews, mesh/geometry inspection and git diff --check remain required; no unit tests. Physical fit, slicer results, actual unfused print, catch elasticity, wear, retention cycles, weather and endurance remain pending user checks. Record any changed required release deflection and exterior footprint without claiming successful physical operation.

README must update dimension provenance, new adjustment inputs, reinforced-feature dimensions, printing/support/clearance guidance, catch release and renewed physical durability checks. PLAN amendment is not yet drafted: the existing approved PLAN applies only through A2 and cannot authorize A3 implementation until separately revised and approved.

### Evidence and limitations

Read-only native explorer traced current source and README: panel2.4, journal3, arms2, head1.6, toe0.6, stops1 and flexible catch1.2 are slender selected sections. It identified dependencies between thickness, captive chambers, connection overlap, sweep, screw keepouts and stop timing, and warned against indiscriminate flexure thickening. Parent selected the concrete proposed increases above within the user's modest reinforcement request. No render, material calculation, slicer work or physical test was performed for this amendment; proposal values are not validated durability evidence.

### Approval record

Approved on 2026-10-12 by user reply "approve the new iteration" following presentation of SPEC-shed-ventilation-A3 and confirmation that the current panel opens outside/downward. Approval covers the complete effective SPEC through A3, including the proposed dimensions and preserved outward-opening/one-print boundaries. The reviewed proposal SHA-256 was 20c5be1ddcb2776dba87a516de9e09ecbb21c1b93ed4a6236ad9af585e6c14a2. Original document status, original body and A1/A2 approval history remain unchanged. Separate PLAN amendment approval and valid implement entry remain required; this approval authorizes no source implementation, commit or push at this stage.


## Amendment 4 — 2026-10-12 — full-length 180-degree hinge and rigid lift-and-slide latch

- Amendment ID: SPEC-shed-ventilation-A4
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A3
- Approval: Approved by user on 2026-10-12
- Request and purpose: user explicitly invoked iterate with a continuous barrel-hinge reference, requested a full-length hinge and 180-degree cap opening, and reported that the existing catch snapped during release. After comparing latch variants, the user selected variant A with "do A": a captive lift-and-slide gravity bolt. Selection records the design choice; it does not approve this newly drafted complete effective specification.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| Operation 3; hinge distribution | Two discrete captive journal/bearing stations | A continuous-hinge arrangement of alternating fixed and moving knuckles distributed across the full bottom edge of the door, on one horizontal axis. Full length means the nominal 111 mm door width at current defaults, with only functional mating/end clearances; do not retain two isolated hinge stations or substitute a flexible living hinge. Use integral captive printed pivot/retention geometry without an inserted pin. The photograph establishes the barrel/knuckle arrangement, not hardware, dimensions or separate screw-on leaves. | Spread the attachment along the door edge and match the requested hinge form while preserving no assembly. |
| Opening range and stop | Outward/downward 0–90 degrees, positive stop at 90 | Outward/downward 0–180 degrees, where 0 is closed, 90 projects outward, and 180 hangs below the hinge with the door parallel to the mounting plane. Replace the 90-degree stop with a positive 180-degree stop; do not use the shed wall or louvers as the stop. No mandatory intermediate stop or hold-open detent. | Permit the complete cap to fold down clear of the access opening. |
| Operation 4; finger catch | Flexing top catch with approximately 1.614 mm required release movement over a 4.6 mm free span | Replace the flexible beam/hook with variant A: one rigid captive bolt in a guide integral to the fixed frame, engaging a receiver integral to the upper door edge, entirely outside the clear passage. In the installed orientation gravity lowers the bolt into a locking pocket that blocks lateral withdrawal. Unlock by lifting the accessible handle in installed +Y, then sliding laterally until the bolt clears its receiver. Retain the bolt safely in the released position without continuous finger pressure while opening or closing the cap; use a second gravity-seated end pocket or equivalent positive rigid shoulder requiring deliberate lift to leave the released position, not an elastic detent. The frame-mounted guide keeps gravity orientation constant while the door swings. Close with the bolt retracted, then manually slide into engagement and lower into the locking pocket. No automatic snap closure. | Release must not depend on bending printed PLA/PETG parts, prying the mechanism away, or overcoming a friction-only lock. |
| Retention semantics | Finger catch retains the closed door; locks excluded | The bolt is a manually operated closure latch, not a keyed or security-rated lock. A lowered locked bolt blocks cap opening and lateral unlocking by geometric engagement; deliberate lift-and-slide releases it. Travel stops and capture prevent loss of the bolt in either position or anywhere along its release path. | Define the requested locking mechanism without adding a security requirement. |
| Printed topology | Exactly two captive connected bodies: frame and door | Exactly three connected bodies: fixed frame, complete moving door with integral hinge features, and one captive rigid bolt. All print together in one job, already captured, with stable bed-supported growth and positive moving gaps. No loose pin, clip, spring, magnet, hardware, assembly, snap fitting or glued component. | A separate rigid moving latch replaces the integral flexure while preserving the single-print requirement. |
| Hinge/catch allocations from A3 | Specific two-bearing arms, head/toe geometry, 90-degree stop allocations and catch flexure/anchor parameters | Replace obsolete two-station hinge, stop and catch allocations with coordinated full-length knuckle, integral pivot/capture, 180-degree stop, bolt, guide, receiver and finger-access allocations. Their exact numeric sections, clearances and swept envelopes must be established in the subsequent PLAN before its approval. Preserve the reinforced frame/door/louver sections and the 0.4 mm default moving-fit allowance; do not obtain strength by consuming moving gaps. | A change in mechanism requires new geometric allocations rather than retaining incompatible old constants. |
| Render inspection | Assembly angle 0–90; closed printable pose | Assembly supports the complete 0–180 range and explicit locked, lifted and retracted latch inspection states. Reject a locked/engaged bolt with an open door. Keep render modes printable_layout and assembly, default printable_layout, and a coordinated closed one-print pose with the bolt fully retracted and all three bodies bed-supported; printed clearances remain positive and moving the freed bolt into engagement requires no assembly. | Make the new motion and preparation inspectable without additional render modes. |

### Preserved behavior and impact

Preserve the 125 × 85 mm mounting plate, 110 × 70 mm screw centres, 4.5 mm shank clearance, provisional 9 × 4 mm screw-head envelope, 10 mm border and nominal rounded 105 × 65 mm passage. Preserve frame thickness 3.6 mm, door thickness 3.0 mm, perimeter connecting wall 1.2 mm, eight downward-facing louver passages, 5 mm louver projection and 1.6 mm louver roofs. Keep the 3 mm straight-edge overlap and the authorized full-depth corner screw reliefs, including their documented local rain-entry exposure. The whole louvered cap remains one moving door with no fixed centre obstruction. Preserve a flat rear mounting face, four accessible mounting screws, finger operation, drainage, and the open-use/remove-cable/close sequence.

This revision changes the frame-side hinge and latch features as well as the door: it describes a replacement complete printed vent, not a retrofit cap guaranteed to mate with the previously printed frame. Existing shed hole locations and the nominal frame passage remain unchanged. Do not modify the shed or unrelated designs. The overall projecting envelope and axis position may change to provide the required hinge, latch and sweep clearances; compute and document them and retain Bambu Lab P2S/AMS 2 Pro compatibility.

No intentional flexing is permitted for latch release, re-locking, captive-part assembly or normal hinge operation. Normal elastic deformation under load is not a release mechanism or a validated strength claim. Gravity-assisted locking assumes the specified vertical shed installation, +Y upward; arbitrary mounting orientations are not promised. Keep the handle, receiver and guides outside the cable passage and accessible from the exterior with the cap closed. The released bolt must remain clear throughout cap travel and must not fall out or unintentionally block closure.

The hinge axis and adjacent geometry must keep the entire moving assembly, including louvers, grip, bolt where applicable and captive retention features, clear of the modeled wall plane Z=0 through 0–180 degrees. Provide at least the configured moving-clearance allowance between moving geometry and that plane, except intended fixed mounting contact. Also preserve moving separation from the frame and selected screw-head envelopes. Actual siding relief is unmeasured and remains a physical fit check; a flat-plane CAD check does not establish site clearance. The positive stop limits motion to 180 degrees without relying on siding contact; the door is not a load-bearing shelf or cable support.

All retained numeric values are existing manually entered photo estimates or selected design defaults, not new measurements. The 111 mm nominal hinge span is derived from the existing 105 mm opening plus two 3 mm overlaps; 180 degrees is the user's requested travel. New mechanism dimensions are design allocations for the PLAN, which must close all section, guide, travel, engagement, capture, support and clearance allocations before approval. No external materials or hardware dependency is added.

### Acceptance, validation and documentation delta

1. Inspect a full-width sequence of alternating attached hinge knuckles, integral pivot/capture and positive 180-degree stop. Prove captive retention and absence of interference over the entire 0–180 sweep, including the initial 0–3-degree screw-head region. Inspect assembly poses at 0, 30, 60, 90, 120, 150 and 180 degrees, supplemented by continuous-sweep geometric bounds or equivalent geometric analysis; sampled images alone are insufficient. At 90 and 180 degrees the projected nominal frame passage must remain unobstructed.
2. Inspect the complete rigid latch sequence: locked/lowered, lifted but still engaged, fully retracted, cap opening/closing with bolt clear, and manual re-engagement/lowering. Verify positive locked engagement, lift-before-slide constraint, released-position retention, finger access, capture through all travel and no intended deformation or friction-only retention. The new mechanism's physical release force and durability remain unproven until printed.
3. Inspect printable_layout for exactly three separate connected captive bodies with stable bed contact, positive as-printed gaps, no floating components, no required assembly and accessible cleanup. Exclude inaccessible support inside captive moving clearances. Gently freeing printed gaps and removing accessible supports remain preparation; forced flexing or snapping parts together does not. Verify all three bodies remain captive after preparation and throughout normal operation.
4. Retain corner screw/tool-access, straight-edge overlap, eight real airflow openings, lower-hinge drainage, mounting/passage dimensions and reinforced unaffected-section checks. Reject incompatible parameter combinations, nonpositive clearances, lost capture, invalid latch states, collapsed vents and collisions. Recompute the overall printing/installed envelope and plate margins.
5. Use permitted-mode OpenSCAD assertions, geometry inspection and bounded previews/exports; terminate renders exceeding 15 seconds and keep temporary generated artifacts under /tmp. Unit tests and conventional test-first work remain prohibited. Run git diff --check. Record missing or timed-out evidence accurately.
6. README must replace the old flex-catch release and 90-degree-stop instructions with the rigid lift/slide/open and close/slide/lower sequence; explain the three-body one-print preparation, full-length hinge, 180-degree clearance, revised parameters and provenance, print/support/clearance tuning, replacement-complete-vent scope, envelope, gravity-dependent mounting and renewed slicer/physical checks. Do not claim PLA/PETG endurance, an unfused print, weather resistance, security, cable safety or actual siding/fastener fit from CAD alone.

Physical dimensions/fit, slicer results, successful print-in-place freeing, release force, repeated latch/hinge cycles, wear, strength and outdoor service life remain physical checks, not claimed modeled results. The user's reported broken catch is the motivation for replacing the release principle, not proof of a particular fracture cause. Planning and implementation must not simply thicken that flexure or relabel its bending action as variant A.

### Evidence and counterpart status

Read-only source/README inspection and native explorer evidence establish two discrete hinge stations, the current 90-degree assertion/stop, and the approximately 1.614 mm catch release over a 4.6 mm free span. The user selected A after the parent presented the three variants. No new mechanism has been implemented, rendered, sliced or physically validated during this iteration.

PLAN-shed-ventilation-A4 remains unchanged and describes the previous implementation, not this new SPEC amendment. After approval of the complete effective SPEC through this amendment, a separately drafted and approved PLAN amendment must define the final mechanism allocations and delivery work. Preserve every earlier SPEC/PLAN body, amendment and approval record, and the unrelated nested-bank-safe edits.

### Approval record

Approved on 2026-10-12 by the user reply "approve" to the presented complete specification through SPEC-shed-ventilation-A4. Approval covers the full-length captive 180-degree hinge, rigid frame-mounted lift-and-slide bolt, three-body one-print/no-assembly mechanism, replacement-complete-vent scope, preserved mounting/ventilation, and stated acceptance/validation boundaries. Reviewed proposal SHA-256: 81c9a15391d3a1bec5edb5858e605b2c9f5a6bc4733b8d91419885fd305f45ad. The earlier "do A" reply selected the variant; this separate decision approves the complete effective SPEC through A4. Original document status and all previous bodies and approval records remain unchanged. Approval authorizes PLAN drafting only; separate PLAN approval and valid implementation entry remain required.


## Amendment 5 — 2026-10-12 — reconcile bed contact with wall-plane clearance

- Amendment ID: SPEC-shed-ventilation-A5
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A4
- Approval: Approved by user on 2026-10-12
- Request and purpose: while preparing the PLAN after the user's approval of A4, the parent identified an overly strict wall-clearance requirement introduced in A4. Preserve the existing rear-face-down, closed-pose printing arrangement and the selected full-length hinge/lift-and-slide latch while reconciling its direct bed contact with installed motion. This is a proposed correction, not an approval inherited from A4.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A4 preserved behavior; wall-plane criterion | Every moving point must stay at least the configured 0.4 mm above wall Z=0 throughout 0–180 degrees, except fixed mounting contact. | Retain the shared rear mounting/printing plane Z=0 and rear-face-down closed printing pose. No moving geometry may penetrate Z<0 throughout door rotation or any latch travel. Permit zero clearance and clearances below 0.4 mm for the rear geometry needed to provide direct bed contact, including its adjoining geometry during continuous departure from that plane. Identify and bound those regions explicitly in the PLAN and validate them over the full motion. All other moving-to-wall geometry retains the configured minimum clearance. | Direct bed contact places moving geometry at Z=0; it cannot simultaneously have a positive 0.4 mm gap from that plane. An exception only at exactly 0 degrees would also fail during continuous initial motion, and the frame-mounted bolt retains its rear Z coordinate throughout lift/slide travel. |
| A4 wall clearance at fully open endpoint | Included only in universal 0.4 mm criterion | At 180 degrees require the complete moving door, including hinge features, louvers, grip and receiver, to clear the flat wall plane by at least the configured 0.4 mm. The captive frame-mounted bolt retains its identified rear bed-contact exception throughout latch travel. | Preserve a positive fully-open wall gap and prevent the wall from becoming the door stop. |
| Acceptance and documentation | Universal positive wall gap implied no modeled rear contact | Prove nonpenetration over the entire continuous door/latch motion, separately report the rear-contact exception and minimum fully-open door gap, and document that possible rear rubbing on actual siding must be assessed before installation/use. | Make the permitted modeled contact explicit without claiming physical fit or free movement against rough siding. |

### Preserved behavior and impact

Preserve every A4 choice: full-door-width alternating captive hinge knuckles, outward/downward 0–180-degree motion, independent positive 180-degree stop, frame-mounted rigid lift-and-slide bolt with positive retained locked/retracted positions, three captive bed-supported bodies, no assembly, and no intentional flexing. Preserve the 0.4 mm default moving-part mating gaps, separation from the frame and selected screw-head envelopes, closed print pose with bolt retracted, mounting dimensions, ventilation, documentation and all other acceptance criteria. This exception applies to the wall/print plane only, not to contact between separately printed moving bodies or inaccessible support requirements.

The PLAN must identify the complete rear-contact geometry of both moving bodies and account for its continuous sweep. Bed contact alone does not imply nonpenetration: rotating hinge feet extending behind the axis can cross the wall plane during initial movement and must be shaped/positioned to avoid that. No supports, feet or wall spacers requiring removal, assembly or a changed installation are authorized by this correction. Actual wall/siding geometry and friction remain unmeasured physical-fit checks.

README must retain the rear-face-down one-print instructions and distinguish modeled nonpenetration from positive physical running clearance against siding. Original validation requirements, including independent full-motion assessment, permitted-mode bounded renders, three-body bed support, no unit tests, git diff --check and honest physical limitations, remain in force. No source or PLAN changes have been performed; a PLAN may be finalized only against a consistent approved effective SPEC.

### Evidence and counterpart status

At approved A4 SHA-256 94bca503eacdc24e0b06e52f3c23a72845efdb456a490c43f77ca87ae115a6ae, the parent and an independent read-only architect identified the conflict between A4's universal positive wall gap and the existing rear-face-down printing semantics. Current README explicitly uses the same rear plane for mounting and printing; the source builds the moving door core from Z=0 and uses the closed assembly pose for printable_layout. The new bolt must also have direct bed contact and moves in X/Y. The architect confirmed that an exact-closed-angle exception alone is insufficient. A different print orientation would require a different support/geometry arrangement; this correction preserves the existing orientation instead.

The architect performed specification/source analysis only; no new design, render, slicer result or physical check is claimed. PLAN-shed-ventilation-A4 still describes the prior delivered geometry and remains unchanged. A4's approval remains recorded for that historical effective revision; the newly proposed complete effective SPEC through A5 is pending.

### Approval record

Approved on 2026-10-12 by the user reply "approve" to the presented A5 correction. Approval covers the complete effective SPEC through SPEC-shed-ventilation-A5: retain rear-face-down one-print bed contact, identify necessary rear-plane exceptions, prohibit wall-plane penetration throughout motion, preserve moving-part gaps and at least 0.4 mm door clearance at 180 degrees, and retain all other A4 behavior. Reviewed proposal SHA-256: 182447172f24419536a66513eefb7efa9c273e54ae1d28abe4f6a0ce05c5f400. Earlier bodies, document status and approval history remain unchanged. This decision authorizes PLAN drafting; separate PLAN approval and valid implementation entry remain required before implementation or Git delivery.

## Amendment 6 — 2026-10-12 — certify the rigid latch's reachable capture envelope

- Amendment ID: SPEC-shed-ventilation-A6
- Previous version: complete effective specification through SPEC-shed-ventilation-A5
- Approval: Automatically approved under the originating implementation request on 2026-10-12
- Request and purpose: the user invoked `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md`. Independent implementation QA could establish A5 nominal translation but not compound-orientation capture and operating clearance. This amendment preserves the requested mechanism and closes that mandatory assurance gap with a wider captive flange and coordinated guide/tongue allocation. No reachable escape was demonstrated in A5; its earlier conditional tilt calculation was insufficient evidence.

### Changes against the previous version

All new dimensions are manually entered design selections, not hardware measurements or successful-print evidence.

| Boundary | Before | After | Reason |
| --- | --- | --- | --- |
| Captive flange | Selected PLAN allocation 12 × 8 × 3 mm | 16 × 16 × 3 mm; preserve the 12 × 3 mm offset bed foot | Provide opposed flange sections on solid roof and bottom rails throughout a provable reachable inclination envelope |
| Installed latch centres | Seated Y49, lifted Y52 mm; X0/-16 mm endpoints | Seated Y53, lifted Y56 mm; preserve X0/-16, 3 mm lift and 16 mm withdrawal | Preserve guide front clearance while accommodating the larger flange |
| Tongue | Seated Y36.5..50.5 mm, width6, Z9..12 mm | Seated Y37.5..54.5 mm, width6, Z9..12 mm; receiver remains X±5,Y33..41.6,Z5.6..8.6 | Maintain positive engagement and retracted clearance throughout the bounded orientation/play envelope |
| Supported moving-fit allowance | Default0.4 mm, unsupported combinations rejected by geometry guards | Default0.4 mm; supported mechanism proof domain 0 < moving_clearance_mm <= 0.4 mm, with other geometry-derived guards | Larger clearances require a new allocation/proof rather than relying on the A5 conditional tilt assertion |
| Print guidance | Smaller flange overhangs and5.5 mm guide roof cantilever | Nominal flange Y overhangs5.5/7.5 mm and X overhang2 mm; guide first roof includes9.5 mm one-sided cantilever; exterior tongue support endsY41.8 with9.7 mm span to stem | Disclose actual modeled growth and renewed slicer/physical risks; never place inaccessible support in captive spaces |
| Envelope | A5 planned125 ×120.679 ×15 mm | Expected125 ×128.679 ×15 mm, to verify from final geometry | Larger guide; retain P2S/AMS2 Pro compatibility |

### Preserved behavior and impact

Preserve the complete replacement vent, mounting estimates125×85 and screw110×70, shank/head4.5/9×4, opening105×65, reinforced unaffected frame/door/perimeter/louver sections, eight passages, straight-edge overlap and local corner reliefs. Preserve the full-width integral111 mm/eleven-knuckle hinge, outward/downward0..180 motion and independent positive stops. Preserve exactly three captive bed-supported bodies, one print, no assembly/hardware/intentional flex, fixed gravity orientation, positive endpoint pockets, finger operation and open-use/remove-cable/close sequence. The receiver geometry is unchanged; this remains a replacement complete vent rather than an old-frame retrofit.

Capture must be established for the complete reachable rigid orientation/translation envelope with the vent off the wall. Positive locked/lifted receiver obstruction and retracted continuous door clearance must cover that envelope. The source and PLAN must preserve the inequalities supporting the proof and reject unsupported combinations. Installed wall contact clips inward normal play of the named rear-contact regions; nominal X/Y latch motion remains nonpenetrating. Off-wall capture does not claim that an absent wall independently clamps normal play at Z0. Preserve A5 modeled door nonpenetration and fully-open gap, rough-siding limitations and all physical checks.

The new cantilevers/bridges have connected modeled growth; success without sag, fusion or damage is unverified until sliced and printed. Internal supports remain prohibited. Exterior support removal must remain accessible without assembling or moving trapped bodies. No physical strength, fit, wear, unfused print, security, weather or cable-safety result is introduced.

### Approval record

Automatically approved on 2026-10-12 under the originating explicit implement request and the implement skill's automatic-amendment rule after valid approved entry. Approval covers the complete effective SPEC through SPEC-shed-ventilation-A6, including the revised manually entered latch allocation, supported clearance domain and preserved boundaries above. This is automatic implementation authorization, not a claim that the user manually reviewed this amendment. Original status, bodies and earlier approval records remain unchanged. Required final-state PLAN assurance, source implementation, independent review and QA, documentation and verified main/origin/main delivery remain obligations.

## Amendment 7 — 2026-10-12 — larger first-layer feet and independent island validation

- Amendment ID: SPEC-shed-ventilation-A7
- Previous version: complete effective specification through SPEC-shed-ventilation-A6
- Approval: Approved on 2026-10-12 by the user’s explicit “approve” reply
- Request and purpose: the user confirmed spaghetti occurs on the actual first layer against the plate, then explicitly requested `$iterate` to fix this and add an AGENTS.md rule preventing connected geometry and overall stability from being mistaken for first-layer adhesion robustness. This user-invoked iteration retains separate manual SPEC and PLAN approval gates. It does not authorize implementation through an automatic amendment.

### Evidence, scope and definitions

Current source is designs/shed_ventilation.scad at commit0d2763e69590053f524c0e942003666d8002bb59, SHA-2566700b9868b581ab85150410c0dd005bfc51cbfdb446f6be2150339c0413add32. The invoking checkout was clean before drafting this amendment. The current source-derived bed layout has nine separate contact patches before optional slicer supports: fixed frame, door core, six moving hinge feet and one bolt foot. The six hinge feet and door core belong to one final connected moving body, but they do not form one connected first-layer island. Their elevated bridges start at Z4. Each hinge foot contacts the bed over approximately9.727273×3 mm, area29.181818 mm²; the bolt foot is12×3 mm, area36 mm². Successful final-body connectivity and global COM/support-polygon checks therefore do not establish the early islands' independent stability or adhesion robustness.

The user has printed PLA successfully and reports correctly configured Bambu Studio slicing. The first patch that failed, sliced toolpaths, plate/profile settings and a failure photograph have not been inspected. Small isolated contact patches are a credible design vulnerability, not a proven exclusive cause of the reported failure. No printer-setting fault or successful revised print is asserted. Elevated flange/bridge/roof/tongue features are later-layer risks and cannot explain extrusion failing while literal layer1 is being deposited.

The requested correction is limited to enlarging the existing seven small first-layer soles, the corresponding bolt-foot clearance opening and capture/parameter checks, durable README guidance, and a new first-layer validation section in repository AGENTS.md. The allowed future implementation paths are designs/shed_ventilation.scad, README.md's shed section, AGENTS.md, and this existing SPEC/PLAN pair. Unrelated designs, previous artifact bodies/status/approval records and other README sections remain unchanged. First-layer robustness means improved modeled footprints and independent early-island validation; actual plate adhesion remains a separate slicer/physical outcome.

### Changes against the previous version

Every dimension below is a manually entered selected design default or a value derived from it. They are not new physical measurements, empirical adhesion limits or successful-print results.

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| Moving hinge bed feet | Six forward-only feet, each axial length9.727273 and forward depth3 mm at defaults | Preserve six feet in their moving-knuckle X bands; increase forward depth to8 mm. Each default sole is approximately9.727273×8 mm, area77.818182 mm² | Increase each independent starting footprint by approximately2.67 times without crossing the moving gaps or adding assembly |
| Captive bolt bed foot | Width12, depth3, localY-2.5..0.5,Z0..2.8 mm; bed area36 mm² | Width15, depth4, localY-2.5..1.5,Z0..2.8 mm; bed area60 mm² | Increase contact by approximately1.67 times while retaining direct bed support and positive flange overlap |
| Guide rear foot opening | WorldY50.1..56.9 at defaults; width6.8 mm | WorldY50.1..57.9; width7.8 mm, derived from the revised foot and the same3 mm lift/0.4 side gaps | Admit the wider foot throughout lift/slide while preserving opposed retaining sections; renew the full capture proof rather than changing only a cube size |
| First-layer parameter acceptance | Positive dimensions, final three-body contact/COM and capture guards | The seven isolated hinge/latch soles must each have modeled Z0 contact area at least60 mm² and rectangular sole short dimension at least4 mm throughout supported dimensional choices; retain all other guards | Establish explicit provisional design floors for these vulnerable feet. These floors address this model, not all repository parts or guaranteed adhesion |
| Geometry validation | Final connected geometry, actual Z0 body contacts, global COM and connected growth | Additionally identify and evaluate every independent bed-contact island, its own footprint/initial growth and stability until substantial connections form | A global convex support hull can conceal fragile separately printed islands |
| Repository instructions | No explicit per-island first-layer assurance requirement | Add the exact proposed First-Layer Robustness section below to AGENTS.md | Carry the lesson into future geometry changes without claiming that CAD prevents every adhesion failure |
| Documentation and outcome | General slicer/physical limits and tiny-foot dimensions | Current enlarged feet, independent island evidence, joining heights, revised bridge/overhangs and separate CAD/slicer/physical status | Explain what was improved and what remains unverified |

The mandatory135 mm plate-width/120 mm screw-spacing variation remains supported. Its hinge segment length is approximately10.636364 mm, giving approximately85.090909 mm² per8 mm-deep sole. Other parameter combinations must be rejected when they violate the selected small-sole floors, continuous motion, capture or moving-clearance requirements; do not bypass assertions to force an unsupported print.

### Preserved behavior and geometry boundaries

Preserve the full replacement vent,125×85 mounting plate,110×70 screw centres,4.5 shank/9×4 head allowances,105×65 nominal passage, reinforced frame/door/perimeter/louver sections, eight passages, straight-edge overlap and existing local screw reliefs. Preserve one print with exactly three captive permanent bodies, no inserted parts, hardware, assembly or intentional moving-part flexure, eleven full-width knuckles/111 mm default span, outward/downward0..180 travel and two independent positive180 stops. Preserve3 mm lift/16 mm withdrawal, seated/lifted centresY53/56,16×16×3 flange, guide roof/sidewalls, stem/tongue/pad and unchanged receiver geometry; only the bolt-foot sole and its rear opening/retaining-rail boundary change. Preserve the0.4 default mating gap and supported0<g<=0.4 domain.

The enlarged hinge feet remain forward-only, directly bed-supported and confined to the existing moving X bands. Their additional material must not crossZ<0 during the full sweep, obstruct the passage, strike screws/frame/ribs, contact stops early or require a different print pose. The broader bolt sole remains inside the flange XY footprint, with positive volumetric flange overlap. The revised rear opening must retain the complete A6 first-contact/capture and operating-clearance proof; no wall-dependent retention, forced snapping or weakened assurance is allowed.

Nine bed-contact islands are expected to remain. This revision makes their seven small soles broader; it does not claim that all first-layer geometry becomes connected. Do not fuse first-layer islands or captive moving gaps with automatic brim, bridges or supports. No sacrificial connectors, feet requiring removal, altered wall mounting or additional preparation/assembly steps are introduced. Exterior supports and their accessible removal remain as already specified. Retain the rear-down closed/retracted/seated printable pose, only printable_layout and assembly modes, OpenSCAD2021.01 syntax, one editable source and Bambu P2S/AMS2 Pro compatibility. Expected outer bounds are unchanged, but must be recomputed from final geometry.

### Bounded advisory geometry evidence

A read-only architect independently assessed the selected defaults against current source/approved artifacts. At the default axisY-54/Z8, the enlarged hinge foot radius bound is sqrt(8²+8²)=11.313708; the nearest lower-frame radius is12.313001, leaving approximately0.999293 mm conservative radial separation, above0.4. Added forward material hasu>=0,v>=-8; its endpoint heights and continuousZ(theta)=8+u*sin(theta)+v*cos(theta) are nonnegative. Its swept angular sector remains outside the fixed rear stop support sector beginning190degrees. The A6 opposed-section Y bounds49.959631/59.040369 remain outside the revised rear opening50.1..57.9, with approximately1.140369 mm rear-section margin. Nominal bolt-foot X-end clearance is0.9 mm; enlarged-sole flange overhangs become0.5 mm per X side and5.5/6.5 mm in Y. AtZ4 the hinge-foot extension is expected to shorten the first unsupported door-bridge span from approximately18.479 to14.272 mm.

These are source-derived feasibility bounds, not new renders, complete implementation QA, sliced-toolpath inspection or physical adhesion evidence. Fresh independent source and geometry assurance remains necessary; no prior render or global-COM report substitutes for per-island first-layer analysis. The still-unprinted guide roof/cantilevers, shaft spans and exterior tongue support remain later-layer obligations and limitations; this first-layer correction does not certify their physical success.

### Acceptance, regression and validation delta

1. At default and135/120 dimensions, independently establish all bed-contact islands from the revised geometry; report each footprint's shape, area, characteristic width and thin necks. Confirm all seven isolated soles meet the selected60 mm²/4 mm design floors and increased footprints, with positive gaps and no new floating or unintended contacting island.
2. Inspect the first-layer geometry and each island's initial growth until it joins substantial connected geometry. Evaluate each small island's modeled support/COM against its own support polygon where applicable, using geometry clipped before its joining height rather than the completed body's global COM. Explicitly identify the hinge feet's bridge connection height and the bolt's flange growth. Record modeled sample heights and limitations; do not invent a user's slicer layer height or profile. Full-body and per-island evidence are separate acceptance items.
3. Revalidate exactly three finite closed connected permanent bodies, bed contacts/positive material unions, complete hinge/wall/frame/head/stop motion, unobstructed90/180 passage, revised latch-foot/rail travel and the full A6 reachable capture/engagement/retracted-clearance envelope. Verify the supported clearance/width variation and negative guards, including loss of the small-sole floors. Any unsupported geometry or proof failure blocks modeled acceptance.
4. Inspect current printable/assembly previews, necessary first-layer sections and bounded mesh/geometry outputs. Preserve the15-second OpenSCAD limit, permitted modes, temporary outputs and prohibition on repository unit tests/test-first phases. Run git diff --check. Update actual bridge/overhang/support guidance and retain no internal support or brim joining captive gaps.
5. Apply the exact repository rule below and update only the shed README section with current dimensions/provenance, individual footprint/growth evidence, print orientation, supported parameter limits and slicer/physical status. Distinguish robust-looking modeled footprints, a reviewed slicer first layer and a physically successful first layer.
6. No new physical print or actual Bambu Studio profile/toolpath result exists at this planning stage. Where unavailable, these remain explicitly pending and are not fabricated as CAD acceptance evidence. A modeled correction may be delivered after its approved model/review/QA lifecycle; describing the user's actual spaghetti problem as resolved requires an observed successful first-layer print. Neither these selected footprint floors nor AGENTS guidance guarantees adhesion on every printer/plate/material/profile.

### Exact proposed AGENTS.md addition

Insert this new section after OpenSCAD Rules and before Validation. Preserve all other instructions, including approval/delegation/delivery rules, permitted renders and the no-unit-tests prohibition:

```markdown
## First-Layer Robustness

When creating or changing printable geometry, assess each independently printed
first-layer island, even when those islands belong to one connected completed
part. Connected final geometry and overall stability do not establish
first-layer adhesion robustness.

- Identify every separate bed-contact island in the printable pose. Report its
  modeled footprint shape, contact area, characteristic/narrow dimensions and
  thin necks; identify the height where it joins substantial geometry.
- Inspect initial growth and assess each small island's modeled stability
  against its own contact/support polygon until those connections form. Do not
  substitute the completed body's total bed area or global centre of mass for
  independently printed islands. Document the analyzed heights and limitations.
- Prefer broader, stable starting footprints. Resolve fragile small/narrow
  contacts through scoped geometry changes or a documented, accessible printing
  strategy while preserving fit, motion and captive clearances. Do not add
  indiscriminate brim, support or connections that fuse moving bodies or gaps.
- Report CAD geometry/initial-island checks, slicer first-layer/toolpath review
  and physical adhesion/print results separately. Inspect slicer evidence when
  available; if unavailable, state that it is pending. CAD connectivity, Z0
  contact, renders and COM checks do not prove adhesion or a successful print.
- Do not claim an actual first-layer failure is fixed without a successful
  physical first-layer result. Record any remaining printer, plate, filament,
  profile or later-layer risks without inventing a cause or evidence.

Use the repository's permitted bounded geometry/render validation. Unit tests
and conventional test-first phases remain prohibited. This rule adds no
unrelated audit, printer operation or requirement to fabricate unavailable
slicer/physical evidence as a condition of modeled delivery.
```

### Approval record

Manually approved on 2026-10-12 by the user’s exact reply “approve” to the complete SPEC A7 proposal (reviewed proposal SHA-25625314230a155cf13e70204928af43080766c8b75215ba775f5efec1f8cfea3c8). Approval covers the complete effective SPEC through SPEC-shed-ventilation-A7, including the selected sole dimensions/floors, rear-opening revision, preserved mechanism, validation boundaries, README scope and exact AGENTS addition. Document-level Status: Approved and all earlier bodies and approvals remain unchanged. A separately drafted and independently assured PLAN A7 requires separate manual approval; implementation requires valid implement entry. This iterate turn performs no source, README or AGENTS implementation, worktree creation, commit or push.

## Amendment 8 — 2026-10-16 — quarter-turn closure and self-supporting vent blades

- Amendment ID: SPEC-shed-ventilation-A8
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A7; A7 is present in current source at commit 089c6be.
- Approval: Approved by user on 2026-10-16
- Request and purpose: user invoked iterate to replace the disliked closure and remodel the eight sloping vent blades so removing printed supports cannot break them. User selected “quarter-turn latch is good”, clarified that the affected shafts are the “Eight sloping vent blades”, and accepted steeper roofs, permanent side cheeks and reinforcing ribs with approximately 9 mm projection instead of 5 mm and slightly reduced airflow area. These selections resolve design direction; they are not approval of this complete amendment.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A4–A7 closure and release sequence | Rigid captive bolt; lift 3 mm, withdraw 16 mm, lower into an end pocket; dedicated tongue, guide and door receiver | Replace the bolt mechanism with one rigid captive quarter-turn latch. A finger-operated tab rotates 90 degrees between positively retained locked and released positions. The locked blocker mechanically overlaps a door retaining surface; the released blocker clears the full door sweep and stays released without continuous finger pressure. No intentional flexure, friction-only retention, magnets or added hardware. | Simpler operation without returning to the previously broken flex catch. |
| Latch capture and operation | A6 bolt-specific flange/rail/foot geometry and capture proof | A permanently captured printed pivot and blocker, usable from outside with the door closed. Capture must hold throughout reachable rotation and permitted play without relying on the shed wall. Locked/released parking must resist gravity-driven release in the installed orientation. If axial lift is needed to index a rigid positive pocket, it must remain captive and finger-accessible; the user motion is release the positive index, quarter-turn, reseat. No separate inserted parts, snapping together or support inside moving clearances. | Preserve positive retention, external access and no-assembly behavior while replacing the old allocation. |
| Louver roofs | Eight top-connected roofs, 1.6 mm selected thickness, 5 mm projection; source polygon underside approximately 26 degrees to the print bed; no side cheeks or intermediate ribs | Keep eight downward-facing hood groups in four rows and two columns. Set selected default outward projection to 9 mm, preserve at least the existing 1.6 mm roof section, strengthen root connections and add permanent side cheeks and narrow reinforcing ribs. Grow undersides from anchored material at 45 degrees or steeper to the bed, avoiding unsupported broad roof starts. | Improve blade attachment and eliminate removable support beneath/against blades. |
| Meaning of eight passages | Eight undivided slot/roof groups | Eight hood groups remain; permanent ribs may subdivide individual mouths into smaller connected airflow channels. Every hood must retain a real through-air path and a downward-facing outlet; no blind cavities or water traps. Some free-area reduction from reinforcement is accepted; no numerical airflow rating is claimed. | Make accepted reinforcement compatible with the eight-hood arrangement. |
| Support and preparation | Exterior removable supports permitted, including old latch tongue/receiver; louver overhangs require slicer review | Vent blades, their roots, cheeks and ribs must print in the default rear-down pose without removable supports contacting them. Permanent reinforcement remains part of the door and must not require breaking away. Old bolt support instructions disappear with the old mechanism. Any new latch support requirement must be exterior, removable without touching blades or entering moving gaps, and explicitly described in the PLAN/README. | Address the user's blade breakage concern without claiming the entire mechanism is support-free. |
| Prior fixed latch/sole allocations | A6/A7 selected bolt dimensions, lift/slide guards, 60 mm² bolt sole floor and nine-island/three-body arrangement | Retire only bolt-specific dimensions, assertions, proofs and island expectations with the removed bolt. Retain three permanent captive bodies: frame, hinged door and quarter-turn latch. Identify all actual new first-layer islands and validate their initial growth. Preserve the six A7 hinge soles, including 8 mm depth, 60 mm² minimum area and 4 mm minimum short dimension. A separate small latch starting sole must meet those same provisional floors; attachment to a broader latch base is permitted. | Replace obsolete geometry checks rather than carry incompatible bolt constraints into the new latch. |

All new numeric values above are manually entered design selections, not physical measurements. The 9 mm projection is the selected default, measured outward from the door face; roof angles are relative to the print bed in printable_layout. Detailed pivot, pocket, overlap, rib and clearance allocations belong to the separately approved PLAN and must demonstrate these behavioral requirements before implementation.

### Preserved behavior and impact

Preserve all effective requirements through A7 except the explicit replacements above: provisional 125 × 85 mm mounting plate, 110 × 70 mm screw centres, 4.5 mm shank and 9 × 4 mm head envelopes, 105 × 65 mm unobstructed nominal open frame passage, accessible corner screws and existing screw reliefs; reinforced frame/door, straight-edge overlap, full-panel downward opening through 0..180 degrees, captive full-width hinge and two positive 180-degree stops. No fixed divider or new obstruction may enter the open cable passage. Preserve the mandatory 135 mm plate-width/120 mm screw-spacing variation and supported moving-clearance domain 0 < g <= 0.4 mm, rejecting incompatible combinations.

Preserve one print job with no physical assembly, unchanged rear mounting plane, no Z<0 penetration during operation, no intentional moving-part flexure, no cables trapped by closure, and mounting with existing screws. Keep printable_layout as source default, assembly as the only other mode, OpenSCAD 2021.01 compatibility, one source file, no external libraries and Bambu P2S/AMS 2 Pro compatibility. New projections must clear the wall, frame, screw heads and latch throughout the full sweep; endpoint plausibility alone is insufficient. No promise of preserving the previous overall projection envelope is made: the accepted deeper hoods change it and final bounds must be documented.

Allowed eventual implementation paths are designs/shed_ventilation.scad, README.md's shed section and this existing SPEC/PLAN pair. AGENTS.md and unrelated designs remain unchanged. The corresponding PLAN is unchanged at this stage; its A7 approval does not authorize A8 implementation.

### Acceptance, regression, validation and documentation

1. Demonstrate positive locked engagement, externally accessible release, quarter-turn travel, stable released parking and permanent pivot capture across reachable play. Inspect intermediate latch positions, closed-door release and door motion with the latch released. Reject unsafe dimensional combinations. Renew the capture argument for the new mechanism rather than reuse the removed bolt proof.
2. Confirm eight hood groups with connected roots, side cheeks and reinforcing ribs, positive-volume unions and real downward-facing through-air paths. Document roof angles, projection, minimum sections, rib/channel widths and remaining open area. Check initial roof growth layer by layer analytically and with available sliced toolpaths; cheeks/ribs or final connectivity alone do not prove support-free growth.
3. The blade design must not require removable supports against blades or reinforcement in printable_layout. CAD delivery must show continuously supported roof growth or explicitly bounded bridges and identify any residual bridging risk. Actual slicer evidence and a physical support-free blade print are reported separately and remain pending when unavailable; do not claim the user's breakage issue is resolved without a successful physical result.
4. Revalidate three finite closed permanent bodies, all bed-contact islands and their initial growth/stability, the preserved hinge sole floors, new latch starting footprint, full continuous hinge/latch/frame/head/wall clearance and stop behavior, open passage and mounting access. Cover default and mandatory width variation. Do not fuse captive gaps with supports, brim or sacrificial connections.
5. Use bounded OpenSCAD assertions, geometry inspection and viewed printable_layout/assembly renders, stopping each render exceeding 15 seconds; temporary artifacts remain in /tmp. Run git diff --check. Unit tests and conventional test-first phases remain prohibited. No generated mesh exports enter source control.
6. Update only the shed README section for the new closure sequence, latch capture/indexing, 9 mm blade projection and provenance, reinforcement/airflow tradeoff, dimensions/parameters, first-layer evidence, support exclusions and any accessible new latch support. Remove obsolete bolt instructions. Retain measurement/fit, material, weather, endurance, adhesion, slicing and cable-safety limitations. CAD acceptance does not establish those physical outcomes.

### Approval record

Approved on 2026-10-16 by the user's exact reply “approve” to the complete effective SPEC through SPEC-shed-ventilation-A8. Approval covers the quarter-turn closure, positive indexing/capture, reinforced 9 mm projecting support-free blade design, accepted airflow tradeoff, preserved behavior and validation/documentation boundaries in this amendment. Earlier document status, bodies and approvals are preserved. This approval permits PLAN drafting; it does not authorize source changes, PLAN approval, implementation, commit or push.

## Amendment 9 — 2026-10-16 — replaceable PETG flip-over clasp

- Amendment ID: SPEC-shed-ventilation-A9
- Previous version: complete approved effective A8, implemented at 49076eb42a01a106bebaf0c50e952f058f9ee048.
- Approval: Approved under the explicit user instruction recorded below.
- Request and purpose: the user reports the quarter-turn closure could not rotate and broke when forced; fusion is a plausible explanation, not an established diagnosis. The user selected the pictured hinged box-clasp style, accepted modest flex, specified everything is PETG, allowed one complete reprint and instructed “update the spec and plan and approve them”.

### Changes against the previous version

| Requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A9-C1 closure | A8 captive quarter-turn rotor/housing | Separate flip-over clasp on an inserted retained pivot pin; distal hook engages a shallow door catch. Finger-release hook, swing clasp clear, then open door. | Avoid printing the new latch pivot trapped in its bearing. |
| A9-C2 assembly and replacement | Three captive bodies, no assembly | Preserve captive frame/door hinge. Independently print and assemble clasp, pin and retainer; retain them throughout normal use. Deliberate retainer removal permits clasp replacement without reprinting frame/door. | No loose operational bolt or repeated full-cap replacement. |
| A9-C3 elasticity | No moving-part flexure | Modest PETG flex accepted for hook engagement/release; broad mounts, rounded roots, stout main body and a longer compliant region. Accessible finger release without prying the door. | User-selected reference and durability preference. |
| A9-C4 installation | A8 rotor housing/receiver | Replace local closure mounts/catch; one complete revised vent print accepted. Preserve existing shed mounting holes; no new shed drilling. No retrofit or old/new interchangeability promise. | Resolve attachment without unverified retrofit. |
| A9-C5 material/printing | Filament-dependent general guidance | Everything PETG, including pin/retainer; no metal, glue or magnets. Independent latch parts have accessible mating surfaces and stable print poses, with no removable support in bearing or hook contact surfaces. | User material choice and fusion concern. |

New dimensions in the paired PLAN are manually selected provisional design values, not measurements or PETG strength data. The image is a style reference, not performance evidence.

### Preserved behavior and impact

A9-P1 preserves A8 eight hood groups, 9 mm projection, cheeks/ribs and support-free blade intent; nominal 125 × 85 mm plate, 110 × 70 mm screw centres, 105 × 65 mm passage, screw/head reliefs, mandatory 135/120 variation, full-panel 0–180-degree downward opening, captive full-width hinge/positive stops, A7 hinge sole floors, cable removal before closing, rear plane and no Z<0 operation. Preserve OpenSCAD 2021.01, one source, no libraries, P2S/AMS 2 Pro compatibility and printable_layout default plus assembly mode. New latch envelope may grow and must be documented. The existing print-in-place door hinge still requires physical freedom verification; A9 changes only the closure.

### Acceptance, validation and documentation

- A9-V1: demonstrate positive hook engagement, accessible release, separate pivot assembly, captive pin/clasp throughout normal motion, and deliberate independent replacement. Document engagement overlap and release displacement; no CAD claim of elastic force or fatigue life.
- A9-V2: inspect broad positive-volume mount/root unions, fillets, flex-region dimensions/orientation and geometrically displaced release pose. Physical PETG flex, retention and repeated operation remain pending until observed.
- A9-V3: inspect complete door sweep with clasp parked clear, clasp/catch/frame/wall/head clearances, mounting access and passage preservation, including default and mandatory width variation. Remove obsolete rotor proofs/bodies instead of preserving three-body assumptions.
- A9-V4: inspect actual material bodies, every first-layer island, footprint areas/narrow dimensions, initial growth and preconnection stability, including separate clasp/pin/retainer. Preserve hinge sole floors; inspect pivot-hole growth, bridges and support access. Every object must be independently printable in a stable pose.
- A9-V5: bounded OpenSCAD assertions, geometry checks and viewed printable_layout/assembly previews; stop renders over 15 seconds, keep outputs in /tmp, run git diff --check. No unit tests/test-first or tracked mesh exports.
- A9-V6: update README shed guidance for all-PETG parts, dimensions/provenance, assembly, retained pin, replacement, release, print poses/support exclusions and envelope. Separate CAD, slicer/toolpath and physical evidence; unavailable physical adhesion, pivot freedom, flex/retention/endurance and weather outcomes remain pending.

Eventual ownership is limited to designs/shed_ventilation.scad, README.md's shed section and this existing SPEC/PLAN pair. AGENTS.md and unrelated designs remain unchanged.

### Approval record

Approved on 2026-10-16 under the user's exact instruction “update the spec and plan and approve them”, following acceptance of the reference style, modest flex, all-PETG construction and one complete reprint. This explicitly authorizes approval of the generated complete effective A9 SPEC and paired A9 PLAN without another prompt; it does not claim the user inspected the generated wording. Preserve original status, earlier amendments and historical evidence. This turn updates planning artifacts only; implementation requires a separate request and valid entry.

## Amendment 10 — 2026-10-16 — retain the clasp across pivot play

- Amendment ID: SPEC-shed-ventilation-A10
- Previous version: complete approved effective SPEC through A9.
- Approval: Automatically approved during the active implementation requested by `$implement specs/PLAN-shed-ventilation.md`.
- Request and purpose: correct implementation-discovered A9 retention and parking interference while preserving the selected replaceable all-PETG clasp. A rigid +X0.30 mm / yaw0.7° pose clears the A9 hook without flex; the original parking gusset also intersects the parked toe. Evidence is recorded with the paired PLAN.

### Changes against the previous version

| Requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A9-C1/V1 engagement | 0.6 mm nominal hook overlap, 5.8 mm bearing envelope and 25.2 mm hub | 1.8 mm nominal overlap, 5.2 mm bearing envelope around the unchanged 5 mm pin, 25.8 mm hub between unchanged ears; demonstrate positive retained overlap across reachable play and at least 0.4 mm lip clearance after a derived release no greater than 4 mm | The original interface admits release without intentional flex |
| A9-C3/V2 root | 24 mm free flex length with radius2 root | 24 mm nominal beam allocation including a 2 mm radius root transition; at least 22 mm straight compliant region | Make the required fillet geometrically explicit; PETG force/fatigue remains unproved |
| A9-C1/V3/V4 parking | Rear support at Y93.6 and low gusset | Support begins Y96.7; base ends Y100.1; remove intersecting low gusset and connect the parking lip to the rear support through an upper bridge. Inspect and disclose the complete 6.7 mm unsupported inward cantilever | Clear toe and retaining-wall sweep without support on hook contacts |

### Preserved behavior and impact

Preserve all A9 behavior and A9-P1 except these explicit interface, flex-region and envelope replacements. All parts remain PETG; frame and door remain captive, and clasp, pin and retainer remain independently replaceable. Keep mounting holes, open passage, full door motion/stops, louvers, hinge soles, default/wide/gap domains, supported render modes, stable independent print poses and no removable support on bearing/hook contacts. A10 does not claim physical fit at the provisional 0.1 mm radial bearing allowance. Accessible separate mating surfaces permit inspection and ordinary cleanup; calibration remains pending.

Acceptance adds an explicit full-play retention/release certificate and parking support/sweep inspection to A9-V1–V5. Report the cantilever and small pin-end first-layer island separately from slicer and physical outcomes. README must describe changed dimensions, nominal versus straight beam length, complete envelope, assembly/cleanup and pending fit, flex, adhesion and support-free outcomes. No physical success or repair is inferred from CAD.

### Approval record

On 2026-10-16 the complete effective SPEC through A10 is automatically approved under the originating implementation request and the implement skill's implementation-required amendment procedure. This is automatic implementation authority, not a claim that the user manually inspected this generated revision. Earlier bodies, document status and approvals remain unchanged. The paired PLAN-A10 must receive planning assurance and automatic approval before affected source work resumes.

## Amendment 11 — 2026-10-16 — long-arm serviceable pin retainer

- Amendment ID: SPEC-shed-ventilation-A11
- Previous version: complete approved effective SPEC through A10.
- Approval: Automatically approved under the active `$implement specs/PLAN-shed-ventilation.md` request and implementation-required amendment procedure.
- Request and purpose: preserve the selected minimum12 mm retainer flex length and verify capture without relying on a freely rotated long clip staying upright. The first clip's central ring braces its arms, leaving only4.536 mm free; this is a source conformance finding, not physical strength evidence.

### Changes against the previous version

| Requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A9-C2/C5 retainer | Ring-braced C clip | Independently printed PETG open retainer with two12 mm straight compliant arms, inward retaining teeth and a fixed central stop;2 mm arms/thickness,3 mm throat,4 mm groove core,0.5 mm nominal engagement | Meet the existing long-arm requirement instead of equating overall rail length with free flex length |
| Retainer pose/capture | Nominal clip orientation, unconstrained rotation | Upward-facing long root bar within a fixed open-top guide; guide is part of the revised closure mount. Finger windows expose the bar for deliberate removal. Inspect independent clip rotation/tilt, release and capture | Keep clip, pin and clasp retained in use, clear of the wall, while preserving independent replacement |
| A9-V3/V4/V6 guide/envelope | No guide | Manual selected guide dimensions are given in PLAN-A11; guide height30 mm, new plate clearance openings7.4 mm. Recompute bounds and inspect guide growth, bearing preservation and assembly access | A nominal pose alone does not prove all-reachable capture or no-Z<0 operation |

### Preserved behavior and impact

Preserve A10 clasp/pivot/catch/parking dimensions, mounting holes, full hinge/louver behavior, five permanent material bodies, PETG-only construction and independent pin/clip/clasp replacement. Preserve no removable support on bearing/hook contacts, render modes/default, dimensional domains and all evidence boundaries. The guide is united with the fixed frame, never an added loose part. New clip arms may be shown geometrically spread0.6 mm each for deliberate extraction, providing a4.2 mm throat around the4 mm core; elastic force, recovery and fatigue remain unproved. Tool-free finger access is required in the model, not claimed physically demonstrated.

A11 acceptance requires actual12 mm unbraced arm regions and finite tooth/post shoulder contact; independent clip seating, rotation/tilt and guide/window capture; deliberate insertion/removal trajectory; pin head/groove/ear non-crossing and A10 axial-witness closure. Assess guide bore growth, stable clip footprint and minimum8 mm layout spacing. Update README for the revised retainer, upward orientation, pinch/spread/pull sequence and dimensions, with slicer/physical outcomes pending. Nothing authorizes a wall, hinge, louver or shed-hole change.

### Approval record

On2026-10-16, complete effective SPEC through A11 is automatically approved under the originating implementation request and implement skill. This is automatic approval of a required implementation correction, not manual user inspection. Earlier document bodies/status/approvals remain unchanged. Paired PLAN-A11 requires independent planning assurance and automatic approval before source changes.


## Amendment 12 — 2026-10-16 — recessed replaceable spring catch within the original outline

- Amendment ID: SPEC-shed-ventilation-A12
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A11, delivered at 76014ac35fa7c34bd4a53c8ffcc91029e339647d.
- Approval: Approved by explicit user decision on 2026-10-16.
- Request and purpose: during explicit `$iterate`, the user rejected the current cap/closure complexity, requested dimensions fitting the original shed vent with nothing on top or extra, selected the recessed spring catch (“let\'s do the spring catch”), and instructed “create the ammendament”. This creates a proposed specification delta only; selection and authoring are not approval or implementation authority.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A12-C1 closure; replaces A9-C1/C2 and A10/A11 clasp interfaces | Flip-over clasp, pivot pin, service clip, projecting ears, parking support and tall retainer guide; five material bodies | One separately printed, replaceable PETG spring tongue retained in an integral frame socket, engaging a door catch. Three material bodies: fixed frame, captive hinged door and spring tongue. No separate pin, retainer, clasp pivot, guide tower or parked clasp. | Remove the chain of assembled closure interfaces. |
| A12-C2 normal operation | Hold tongue release through the clasp's swing, park clasp, then open door | Press an exposed release tab through a finger recess within the vent outline, start opening the door, then release the tab. Closing the cable-free door engages a lead-in and seats the hook automatically. No separate locking swing or sustained finger pressure through the full door travel. | Simple press-to-open, push-to-close operation. |
| A12-C3 retention and service | Retained clasp/pin/clip, spread-and-withdraw clip service sequence | Positive hook shoulder overlap blocks ordinary door opening; deliberate modest spring flex clears the hook. The seated tongue is substantially relaxed rather than relying on continuous large deflection or friction alone. Its socket retains it throughout normal release/closing, and permits deliberate accessible replacement without replacing frame/door, tools, glue or an extra retaining part. Service release may use modest PETG flex. | Retain independent replacement while eliminating pin and clip. |
| A12-C4 closed outline; replaces previous permission for closure-envelope growth | Nominal plate125×85 mm but actual mounted-closed frame bounds125×161.9785×30 mm, including protruding mechanisms | The COMPLETE mounted, closed vent, including hinge, stops, catch, socket, operating tab and every fixed feature, must fit within X±plate_width_mm/2 and Y±plate_height_mm/2. No tab, housing, tower, hinge or support may extend above, below or beside that rectangle. A finger recess provides access without an external handle. | The user wants the original vent size, without added extensions. |
| A12-C5 hinge allocation; replaces inherited immutable external hinge coordinates/geometry only where necessary | Hinge axisY=−plate_height_mm/2−11.5 (−54 mm at defaults), with external knuckles, soles and stops below the plate | Reposition/reallocate the captive bottom hinge and its stops within the closed outline. Preserve full-panel outward/downward0–180-degree opening and positive fully-open stops, rear-plane clearance, captive retention and cable passage. Exact old axis, arm/foot locations and segment allocation are no longer immutable where incompatible with the required outline. Do not merely hide or crop the protruding geometry. | The current hinge already violates the requested footprint; replacing only the clasp would not comply. |
| A12-C6 depth and operating envelope | Closure guide reaches30 mm and parked clasp projects beyond nominal plate | Remove the projecting closure structures. New catch/socket/release features must not project farther outward than the retained closed door/louver envelope. Preserve the existing9 mm louver projection; this revision is an outline constraint, not a flush-grille redesign. The rotating door may leave the rectangle while open, and the printable loose tongue may be laid out beside the vent. | Avoid adding closure bulk while preserving ventilation and opening function. |
| A12-C7 obsolete controls/proofs | Clasp angle/release, pin-flat, clip spread/withdrawal controls and A10/A11 capture certificates | Retire removed-mechanism parameters, guards, render selectors, dimensional allocations and proofs. Expose only the new catch inspection/service controls needed by the selected mechanism, with printable_layout as the source default and assembly as an explicit override. Replace obsolete evidence with actual socket/hook/release/hinge evidence. | No residual clasp assumptions or unsupported five-body claims. |

### Definitions, dimensions and provenance

“Original outline” means the rectangular outside width and height of the original shed vent, represented by the existing plate parameters. Retain the current manually entered default125×85 mm and110×70 mm screw centres as provisional photo-derived design targets. They have NOT been confirmed as physical measurements by this conversation. Retain the mandatory135 mm width/120 mm horizontal screw-spacing variation, with85 mm height; it is an alternate geometry check, not evidence of the original vent's size. Each variant's entire closed assembly must fit its own plate rectangle.

Keep4.5 mm screw shank clearance,9×4 mm head allowance,10 mm nominal border,3.6 mm frame thickness and nominal105×65 mm passage at default width (115×65 mm in the wide variant). These are existing selected or derived dimensions, not newly measured hardware values. No new mounting hole, shed drilling or enlarged installation opening is authorized. Physical installation fit remains unverified until compared with the actual original vent and shed opening; CAD acceptance must not be described as measured original-size fit.

New spring/socket/catch dimensions must be explicitly allocated and identified as manually selected provisional PETG inputs in the paired PLAN after this specification is approved. Do not invent force, fatigue, tolerance or measurement evidence. This specification defines functional boundaries; it does not select unresearched numeric spring geometry. The prior clasp's2 mm beam/24 mm length/3.90 mm release are retired, not inherited spring dimensions.

### Preserved behavior and impact

Preserve all-PETG construction, no metal/glue/magnets, stable independent printable poses, independently replaceable closure and no loose operational part. One complete revised vent reprint is permitted; old/new frame interchangeability is not promised. Preserve the existing four mounting-hole centres and hardware allowances, full nominal frame passage, eight louver groups with9 mm projection and permanent cheeks/ribs, support-free blade intent, full downward opening, cable removal before closing, positive fully-open stops and no modeled motion behind the mounting planeZ=0. Local hinge connections, door reliefs and catch interfaces may change only as needed to meet these constraints; they must not reduce the passage or remove ventilation groups to conceal an interference.

Preserve first-layer robustness as a requirement, not the old sole coordinates. Where independent small hinge starting soles remain, retain at least60 square mm contact and4 mm minimum short dimension; if their topology changes, identify every actual new island and assess its own growth/support rather than reuse old counts or completed-part COM. Keep rounded load-bearing roots, broad positive material unions and a long compliant spring region rather than a short stiff hook. These are geometry objectives, not demonstrated strength or endurance.

Preserve OpenSCAD2021.01 compatibility, one editable SCAD source, no external libraries, Bambu Lab P2S/AMS2 Pro compatibility, printable_layout default and assembly inspection. Only the existing SCAD, README shed section and existing SPEC/PLAN pair are within eventual ownership; AGENTS.md and unrelated designs remain unchanged.

### Acceptance, regression, validation and documentation

1. Demonstrate exactly three independently printable finite material bodies and a retained assembled tongue. Inspect positive hook engagement, actual release clearance, initial door movement after tab release, snap-closing lead-in and a deliberate replacement path distinct from ordinary use. Check hand access geometrically without claiming measured comfort or force.
2. Report the actual complete mounted-closed XYZ bounds in both width variants; every material vertex must meet the plate XY rectangle, including hinge/stops/socket. Inspect new closure depth against the retained louver envelope. Printable layout bounds and open-door swept bounds must be reported separately.
3. Assess coupled spring/door motion and relevant socket play, positive retention, full hinge travel/capture/stops, wallZ0, screw-head clearance, unchanged hole centres and unobstructed nominal passage. Preserve ventilation groups and inspect their connections after any necessary hinge/interface revision. Failure to satisfy these simultaneous constraints blocks planning/implementation acceptance; it is not authority to relax them silently.
4. Assess each actual first-layer island's footprint area, narrow dimensions/necks, initial growth and own support until joining substantial geometry. Inspect socket/hinge roofs, catch overhangs and accessible cleanup. No removable support or brim may fuse motion gaps or mating surfaces. Broad connected final geometry alone is insufficient evidence.
5. Use bounded OpenSCAD printable_layout/assembly inspection only, temporary artifacts under /tmp and each command below15 seconds, including any kill grace. Run git diff --check. Unit tests and conventional test-first phases remain prohibited. Do not track generated meshes. Retain default/wide and supported-clearance regression coverage, renewed where the hinge allocation changes.
6. Update README dimensions/provenance, complete closed envelope, spring assembly/replacement, release/closing operation, render controls, print poses, island risks and clearance limits. Explicitly distinguish modeled checks from pending slicer first-layer/toolpath review, physical adhesion, hinge freedom, measured fit, spring force/recovery/fatigue, retention cycles and environmental performance. Do not claim the earlier breakage or first-layer failures physically fixed.

The existing PLAN-shed-ventilation.md remains byte-unchanged and describes the delivered A9–A11 mechanism. It is not an implementation plan for A12. After separate approval of the complete effective SPEC through A12, append the corresponding PLAN amendment with final interface allocations and required independent explorer/architect planning assurance; then obtain separate PLAN approval before any implementation.

### Approval record

Approved on 2026-10-16 by the user’s exact reply “approve” to the presented complete effective SPEC through SPEC-shed-ventilation-A12. Approval covers the recessed replaceable PETG spring catch, complete closed plate-outline constraint, required hinge reallocation, preserved behavior and provisional dimension/physical-evidence boundaries. Original document status and all earlier bodies, deltas and approvals remain unchanged. This approval permits paired PLAN drafting only; PLAN approval, implementation, commit and push are not inferred.

## Amendment 13 — 2026-10-18 — rounded stud and flexible-jaw closure without size growth

- Amendment ID: SPEC-shed-ventilation-A13
- Previous version: complete approved effective SPEC through SPEC-shed-ventilation-A12; current delivered geometry at 4a41612e82f3d772894b195117f548b62344efd1, with implementation details recorded through PLAN-shed-ventilation-A21.
- Approval: Approved by explicit user decision on 2026-10-18.
- Request and purpose: during explicit `$iterate`, the user reported that the opening/closing pin broke, confirmed the vent size is perfect, selected a rounded stud and flexible jaws, and instructed “continue with the rounded stud and flexible jaws, take into account the goal and don't increase the size of the print.” The goal is easy deliberate release and resistance to breakage. Selection authorizes drafting this amendment, not approval of unseen artifacts or source implementation.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A13-C1 closure, replacing A12-C1/C3 hook engagement | Replaceable spring tongue and door hook/catch | One integral rounded male stud on the moving door, with a short broad stem and rounded reinforced root; two opposed flexible jaws capture the stud on the fixed frame. The jaws form an open split socket, not a fully enclosed ball joint or a replacement hinge. | Rounded entry and exit surfaces permit reversible snap engagement. |
| A13-C2 operation, replacing A12-C2 | Press release tab, hold while initially opening, then relax; push to close | Push the cable-free door closed to spread the jaws and seat the stud; deliberately pull at a nearby accessible finger grip to spread the jaws and open. No separate release-tab press, locking turn, tool, or loose operational part. The existing bottom hinge remains captive. | Simple opening and closing without levering a thin pin or bending the panel. |
| A13-C3 compliance and service | One long main spring and a separate service flexure | Two long compliant jaw regions with rounded roots and modest required spread. Preserve an independently replaceable closure cartridge retained in the fixed frame; the cartridge contains both jaws and cannot withdraw during ordinary opening. Exactly three material bodies remain: frame, captive door with integral stud, and jaw cartridge. No added service pin or retaining clip. | Concentrate compliance in replaceable jaws while keeping the stud sturdy. |
| A13-C4 size, tightening A12-C4/C6 | Closed plate outline and retained louver depth; loose spring laid beside vent | No increase over the current closed or complete printable-layout bounding dimensions in either supported width variant. All new stud, jaw, mount and grip geometry must fit those limits. Preserve current hinge geometry; a failure to fit is a blocker, not permission to enlarge or reallocate the hinge. | Preserve the size the user has accepted. |
| A13-C5 controls and evidence | Hook-release and old tongue-service poses and proofs | Retire obsolete hook/tongue interfaces, controls and proofs; expose only useful jaw engagement and cartridge-service inspection poses. Preserve existing supported render modes and printable part selection intent, documenting any renamed catch controls. | Model the actual replacement mechanism rather than inherit obsolete evidence. |

### Definitions, dimensions and provenance

The current README and source are the baseline, not older superseded clasp or hinge allocations. Retain the default closed envelope of 125 × 85 × 12 mm and the wide envelope of 135 × 85 × 12 mm. Complete printable layouts must not exceed the current 143 × 85 × 12 mm and 153 × 85 × 12 mm bounds respectively, with stable poses and positive part separation. These are modeled bounding dimensions, not measured printer or installed-hardware evidence. Preserve the existing plate position and rear plane Z=0; a smaller bounding box must not conceal a translated mounting interface. Report open-door sweeps and deliberate cartridge-service travel separately; normal door travel is not restricted to the closed rectangle.

Retain the manually entered 125/135 mm plate widths, 85 mm height, 110/120 × 70 mm screw centres, 4.5 mm screw clearance and 9 × 4 mm head envelopes. Preserve the 105/115 × 65 mm nominal passage, 3.6 mm frame, 3 mm door, 3 mm nominal overlap and eight hood groups with 9 mm projection, including current local reliefs. These existing inputs remain provisional design/photo-derived values, not newly measured dimensions.

“Easy release” means deliberate tool-free finger pull at the designated grip, without separately pressing a latch or intentionally flexing the panel. “Retained closed” means geometric capture behind the rounded stud head until the jaws spread; friction alone is insufficient. Retention must not require continuously holding the jaws substantially spread after seating. Wind-load rating, numerical opening force and fatigue life are not established by this request or by CAD. Do not invent such values or claim physical success. Numeric head/stem, jaw length/section/root radii, throat, seated clearance, interference, spread, cartridge retention and grip access must be researched and explicitly allocated as manually selected provisional PETG dimensions in the subsequent PLAN.

### Preserved behavior and impact

This is a closure-only change. Preserve the current bottom hinge allocation, captive retention, 0–180-degree outward/downward travel, opposed fully-open stops, rear-plane clearance, screw access, mounting holes, unobstructed open cable passage, louver geometry and existing fit reliefs outside the closure interface. Remove the cable before closing. The vent is not a shelf or cable strain relief. Local frame socket and door catch/grip changes are permitted only within these boundaries. A complete revised vent reprint is allowed; compatibility with an already printed frame or door is not promised.

Preserve all-PETG construction, no metal/glue/magnets, independently replaceable closure, one editable SCAD source, OpenSCAD 2021.01 compatibility, no external libraries, Bambu Lab P2S/AMS 2 Pro compatibility, printable_layout default and explicit assembly inspection. Preserve broad stable print poses and applicable first-layer sole floors. Eventual source/document ownership remains designs/shed_ventilation.scad and the README shed section, plus amendments to the existing SPEC/PLAN pair; no AGENTS.md or unrelated-design changes.

### Acceptance, regression, validation and documentation

1. Establish the three finite material bodies, integral reinforced stud and two genuinely compliant jaw regions; report actual free flex lengths, root sections, maximum required spread and seated clearance. Inspect engagement/release along the hinged door's curved trajectory, not only a straight insertion sketch. Show that the stud releases before the door, mount or hinge must distort.
2. Inspect relaxed, entering, peak-spread, seated and exiting poses; positive stud capture; cartridge retention under both closing and opening loads and relevant socket play; accessible finger pull; and a distinct deliberate cartridge replacement path with the door open. Do not substitute a rigid interference render for evidence of a traversable modeled snap path. Geometry and strain estimates do not establish PETG force, recovery or fatigue performance.
3. Verify complete closed and printable-layout bounds against the limits above for default/wide variants and supported clearance regressions. Preserve current hinge geometry and operation, stops, mounting coordinates, screw-head access/clearance, louvers, passage and no normal operation behind Z=0. Do not shrink the passage, ventilation groups or operating clearance to hide an oversized catch.
4. Identify every actual independent first-layer island in each printable pose; report footprint shape/area, narrow dimensions/necks, initial growth and each island's own support until substantial union. Inspect jaw/stud overhangs, mating-face quality, cartridge print orientation and cleanup access. No brim, support or connection may fuse motion gaps or mating surfaces. Existing whole-body areas are not evidence for new isolated jaw contacts.
5. Use only permitted bounded OpenSCAD printable_layout/assembly checks, temporary outputs under /tmp and command limits below 15 seconds including kill grace; inspect assertion diagnostics and run git diff --check. Unit tests and conventional test-first phases remain prohibited; generated meshes remain untracked. No source geometry validation is claimed by this planning-only amendment.
6. Update README operation, dimensions/provenance, replacement procedure, controls, print poses, layout bounds and first-layer risks during implementation. Keep CAD results separate from slicer/toolpath and physical evidence. Physical checks must assess one-handed release/closing, jaw recovery, stud/root integrity, closed retention and repeated use; no fixed force or cycle rating is claimed. Slicer, adhesion, installed fit, weather/environmental performance and physical durability remain unverified until evidence is available. Do not claim the reported breakage is fixed without physical results.

The existing PLAN remains unchanged through A21 and is not approval to implement this mechanism. After separate approval of the complete effective SPEC through A13, append the paired PLAN amendment with concrete interface allocations and required explorer/architect planning assurance, then request separate PLAN approval.

### Approval record

Approved on 2026-10-18 by the user's exact reply “approve” to the presented complete effective SPEC through SPEC-shed-ventilation-A13. Approval covers the rounded reinforced door stud, replaceable two-jaw cartridge, direct push-close/pull-open operation, unchanged hinge and mounting/ventilation geometry, closed and printable-layout size limits, and validation/documentation boundaries. Original document status and all earlier bodies, deltas and approvals remain unchanged. This permits paired PLAN drafting only; PLAN approval, source implementation, commit and push are not inferred.

## Amendment 14 — 2026-10-19 — distinguish nominal dimensions from inherited hinge play

- Amendment ID: SPEC-shed-ventilation-A14
- Previous version: complete approved effective SPEC through A13.
- Approval: Automatically approved under the originating implementation request and the user's explicit size clarification below; not a claim of manual artifact inspection.
- Request and purpose: during active `$implement specs/PLAN-shed-ventilation.md`, a source-derived, independently reviewed continuous0..0.3mm hingeY displacement at closed angle produced actual collar/stop material atY-42.6 while the frame reachesY42.5. This85.1mm played envelope comes from unchanged hinge geometry. Asked whether85mm should govern nominal closed/print dimensions with existing hinge play reported separately, or every played position with added closure restraints, the user answered exactly: “I don't quite understand, apply recommended”. The first recommended option was: “Keep the current hinge; apply85mm to nominal closed/print dimensions and report hinge-play extents separately.” The parent explained that the printed model remains85mm and existing clearance permits that small movement.

### Changes against the previous version

| Requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A13-C4/size definitions and acceptance3 | Nominal125/135×85×12 closed and143/153×85×12 layout limits; later effective PLAN interpreted85mm as an absolute limit for every reachable closed hinge-play position | Keep those exact limits for the nominal closed assembly and complete printable layout. Report rigid motion within the unchanged hinge's existing clearance separately; the demonstrated85.1mm played height is not an increase to the printed model's nominal85mm dimension. No additional closure restraint is required solely to suppress that inherited hinge displacement. | Apply the user's recommended choice while preserving the accepted hinge and print dimensions. |

### Preserved behavior and impact

Preserve A13 in all other respects: closure-only work, current hinge/stop/mount/passage/hood geometry, three PETG bodies, rounded reinforced stud and flexible replaceable jaws, intended direct push/pull operation, independent print poses, all supported widths/clearances, and bounded validation/documentation/delivery obligations. This grants no intentional enlargement of nominal source geometry, no print-layout increase and no hinge revision. The cartridge's selected normal retention, finite play constraints and new-material depth/clearance checks remain required. Relevant hinge/socket play still belongs in engagement, reversible cam, collision, capture and service assessment; reporting it separately from nominal dimensions does not declare those checks passed or exclude them. Slicer and physical outcomes remain pending.

### Approval record

On2026-10-19 the parent automatically approves the COMPLETE effective SPEC through SPEC-shed-ventilation-A14 under the originating implement request, active implementation-required amendment procedure and the explicit clarification quoted above. This is automatic artifact authorization, not new manual user inspection. Original document status, A13 and all earlier bodies/approvals remain unchanged. Paired PLAN must record this interpretation and the independently assured remaining implementation delta before further affected source changes; complete review, QA, documentation and verified main/origin/main delivery remain required.

## Amendment 15 — 2026-10-19 — integral frame clip and rounded door peg

- Amendment ID: SPEC-shed-ventilation-A15
- Previous version: complete approved effective SPEC through A14; delivered source at e305c0a1609f869585e397ecf86e60e6596c127a, with implementation recorded through PLAN A30.
- Approval: Approved by explicit user decision on 2026-10-19.
- Request and purpose: user explicitly invoked `$iterate change it to a single element print`, then clarified concern that small-scale fit could cause breakage and requested something simpler, “a clem on the main frame + a male pin on the other”. Interpret this as one frame-integral flexible retaining clip and a door-integral rounded male peg. The concern motivates removing precision cartridge interfaces; it is not a measured diagnosis of a physical failure in the delivered design.

### Changes against the previous version

| Requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A13-C1/C3 closure topology | Two opposed flexible jaws in an independently replaceable cartridge, plus integral rounded door stud; three material bodies | One long compliant clip/tongue with a rounded retaining lip integral to the main frame, engaging one short broad rounded male peg integral to the hinged door. Exactly two independently moving material bodies: frame/clip and door/peg. | Reduce closure parts and mating interfaces. Put intended compliance in the frame clip rather than a slender male pin. |
| A13-C2 operation | Direct push-close/pull-open through two jaws | Preserve direct push-close/pull-open: the peg cams the single clip aside on entry and exit; the clip lip retains behind the rounded peg in the closed state. No separate release-tab press or locking action. | Keep deliberate finger operation simple. |
| A13-C3 service and replacement | Cartridge retention, service flexure/pad/tooth, depression/slide/lift replacement sequence | Remove the separate cartridge, socket retention fit, service arm/lock and cartridge installation/removal. The clip is not independently replaceable; clip damage requires replacing the frame or complete print-in-place vent as practical. | Remove the fine-fit service mechanism and assembly step, accepting the loss of cartridge replacement. |
| A13-C4/C5 print and controls | Captive frame/door print plus separate flat cartridge; all/vent/catch selectors and cartridge-service poses | One complete print-in-place vent ready for hinge/latch operation after ordinary accessible support/cleanup removal, without installing a closure part. Keep printable_layout default and explicit assembly inspection. Remove obsolete cartridge selectors/service controls; expose only useful door/clip inspection poses. | “Single element print” means one ready-to-use printed assembly, not fusing the door to the frame or requiring one connected material solid. |
| Fit and evidence | Demanding0.03/0.05mm cartridge interface allowances and two-jaw pose/retention proofs | Do not carry over cartridge fit allowances or obsolete contact/service proofs. Allocate a simpler accessible open clip/peg interface with explicit nonfused printing clearance, rounded entry/exit, positive retention and a generous flexing length. Re-establish the actual curved contact path and printing evidence. | Minimize dependence on precision mating interfaces without pretending that a snap clip needs no tolerance or material validation. |

### Definitions, dimensions and decisions

The concept is a frame-rooted spring tongue ending in a rounded retaining lip, with a short, thick, broadly rooted rounded peg on the moving door. Closing pushes the peg past the lip; deliberate pull at the existing nearby grip cams it back out. Geometric closed retention must come from the lip catching behind the peg, not friction alone. The clip supplies the modeled compliance; operation must not depend on bending the door, hinge or male peg, or maintaining a manual release press. Actual spring recovery, force, friction, wear and fracture resistance require physical evidence.

The complete print must require no separately printed closure part, installation, glue, metal, magnet, pin or clip. Accessible local removable supports may be specified if required by the modeled print geometry; they must not fuse hinge/latch gaps, trap a moving body or require latch assembly after removal. Simplicity is not evidence that unsupported raised clip stock will print: the PLAN must allocate a positive integral root, supported initial growth and accessible cleanup, rather than merely union the old elevated cartridge to the frame.

Keep manually entered default125×85mm and wide135×85mm plates;110/120×70mm screw centres;4.5mm shank clearance;9×4mm maximum screw heads;105/115×65mm nominal passage;3.6mm frame;3mm door;3mm nominal overlap outside authorized local reliefs; eight reinforced hoods with9mm projection. Preserve the nominal closed125/135×85×12mm limits and existing143/153×85×12mm printable-layout caps. The single complete unit must fit inside those bounds without moving mounting interfaces. A14's distinction between nominal dimensions and inherited hinge play remains unchanged. These dimensions remain provisional/photo-derived design inputs, not new hardware measurements. The subsequent PLAN must allocate actual clip length/width/thickness/root radius, peg/head/root dimensions, lip overlap, running/interference clearance, required flexure and print-support geometry as selected provisional PETG dimensions; old cartridge fit values are not defaults for the new interface.

### Preserved behavior and impact

Preserve the delivered bottom hinge geometry and its captive0–180degree outward/downward travel/stops, rear mounting planeZ0, mounting holes and screw access, fixed cable passage, louvers, nominal size, all-PETG construction, one editable SCAD source, OpenSCAD2021.01 compatibility, no external libraries and Bambu Lab P2S/AMS2Pro design support. Closure-side frame and door geometry may change locally within these constraints. Do not restore an older thin pin/hook or its dimensions merely because it used fewer parts. A complete revised vent reprint is allowed; compatibility with an already printed frame/door is not promised. Remove cables before closing; no shelf or strain-relief function is added. Earlier approved bodies/status/approval records remain intact.

This supersedes the A13/A14 requirements for exactly three bodies, two opposed jaws, independently replaceable cartridge, cartridge service/retention interfaces, separate cartridge print pose and corresponding controls/evidence. Other A13/A14 behavior and acceptance remain effective. The existing PLAN through A30 is unchanged and describes the delivered mechanism; it is not authority for this new clip topology.

### Acceptance, regression, validation and documentation

1. Demonstrate exactly two finite operational material bodies in one print-in-place layout, positive integral clip/frame and peg/door unions, stable printing poses, accessible cleanup and no closure-part assembly. Identify actual clip free flex length, root section and peg root; do not substitute apparent visual simplicity for these checks.
2. Establish geometric closed capture and deliberate push-close/pull-open along the hinge's curved trajectory, with relaxed, entering, peak-flexure, seated and exiting poses. Account for relevant hinge play, rounded entry/exit contact, required clip travel, neighboring-body clearance and reverse motion. No separate press or distortion of the door/hinge/peg may be required. Retire cartridge-specific service and jaw proofs.
3. Check complete nominal closed/layout bounds for both supported widths and supported moving-clearance regressions, preserving hinge/stop, mounting, screw, passage and louver interfaces. Report actuated/open sweeps separately. Do not shrink the passage or change the hinge to fit the clip.
4. Identify every independently printed bed-contact island and local initial growth of clip and peg, including narrow footprints, positive unions, overhangs/support access and each island's own support until substantial connections. Neither the former flat cartridge footprint nor completed-body connectivity proves the new clip's printability. No support or brim may fuse motion or mating gaps.
5. Use only repository-permitted assembly/printable_layout diagnostics, temporary artifacts under/tmp, render limits below15seconds including kill grace, assertion-log inspection and git diff --check. Unit tests and conventional test-first remain prohibited; generated meshes remain untracked. Planning establishes no new geometry/render/print evidence.
6. Update README with the two-body no-assembly print, single clip/peg operation, removal of cartridge-service controls, dimensions/provenance, changed print/support/first-layer risks and loss of independent clip replacement. Keep CAD evidence separate from pending slicer/toolpath, physical fit, adhesion, force/recovery, strength, durability, retention cycles, weather/environment and cable safety. Do not claim breakage or fit concerns solved without physical results.

### Approval record

Approved on2026-10-19 by the user's exact reply “appeove” to the explicit question asking approval of SPEC A15 for PLAN drafting, understood as the evident typo for “approve”. Approval covers the COMPLETE effective SPEC through SPEC-shed-ventilation-A15: integral single frame clip and rounded door peg, one no-assembly print-in-place unit with two independently moving material bodies, removal of the replaceable cartridge/service mechanism, preserved hinge/mounting/ventilation/nominal-size constraints and stated validation/physical-evidence boundaries. Original document status and all preceding bodies/deltas/approvals remain unchanged. This permits paired PLAN drafting and independent explorer/architect plan assurance only; it does not approve the subsequent PLAN or authorize source implementation, commit or push.

## Amendment 16 — 2026-10-19 — broader closure stock and safer support cleanup

- Amendment ID: SPEC-shed-ventilation-A16
- Previous version: complete approved effective SPEC through A15; implemented at `48f78cf808ee28c3c361f55756ed68078b884e20` under PLAN A31.
- Approval: Pending approval of the complete effective SPEC through A16; original document status and all preceding content/approvals remain unchanged.
- Request and purpose: after viewing the delivered model, the user asked whether the small rod could be made full size to resist breakage, expressed concern about removing tree supports, and asked whether the round male pin could instead be square or another shape. Asked whether to extend the long clip, broaden the male, or strengthen both, the user selected exactly “Strengthen both parts”. The objective is better printing, support-cleanup and handling robustness of both closure features, not a request for greater holding force. No physical fracture, removal force or material diagnosis has been established.

### Changes against the previous version

| Requirement | Before | Proposed complete effective behavior | Reason |
| --- | --- | --- | --- |
| A15 clip allocation | Elevated narrow 2 mm lateral × 1.4 mm vertical tongue with 28.2 mm free span and provisional external supports beneath it | Replace the elevated rod-like section with a taller, broad flat frame-integral leaf/body growing from the print bed over its free span wherever the retained motion and mating clearances permit. Preserve compliance through a free-standing clearance slot and a rounded root, not by filling the gap underneath and bonding the free span to the fixed frame. Use local contact relief where needed; “full size” does not mean a solid block that cannot flex or collides with the peg. | Broaden initial stock and its root; reduce reliance on supports beneath a delicate raised tongue. |
| A15 male contact shape | Convex hull of a spherical head and two ellipsoidal feet, with a raised spine/bridge | Replace the spherical stud with a short, broad, integrally rooted rectangular lug or paddle having chamfered or rounded entry AND exit cam faces and eased edges. Its contact profile must retain positive geometric capture while allowing direct push-close/pull-open; sharp square corners or a square undercut that requires a separate release are excluded. | Provide a broader supported load path while retaining the cam action currently supplied by the sphere. |
| A15 print/support strategy | Raised clip stock and male undersides require local support/overhang assessment; main/tip support envelopes were specific to A31 | Redesign both features together to prefer bed-grown stock and assessed self-supporting ramps or short bridges. The closure must not depend on tree supports attached to the flexible tongue or its male cam/contact faces. If other local temporary closure supports remain necessary, allocate accessible support interfaces on substantial carrier/root stock and a removal path that does not require pulling, twisting or levering the compliant tongue, male lug, hinge or door. | Make support removal part of the design rather than relying on careful extraction around a delicate feature. |
| A15 robustness and operating behavior | Modeled 2.4 mm clip inspection capacity and the A31 contact/strain/support evidence | Reallocate clip breadth, bending thickness, length, root, male section and required flex together. Prioritize resistance to cleanup/handling damage without deliberately increasing retention/opening force; retain intended finger operation, clip-only compliance and no release-tab press. Re-establish the contact, section and printing evidence for the new geometry. | A thicker bending section can substantially increase stiffness and transfer load to the male or door; larger stock alone does not prove a safer mechanism. |

### Definitions, dimensions and provenance

The proposed direction is one frame-integral, bed-growing tall leaf with a broad root, and one door-integral broad chamfered rectangular male. They remain exactly two independently moving operational material bodies in one complete print-in-place vent. The free leaf must remain clear of fixed frame stock along its flexing span, including at initial layers. Its larger vertical breadth must not be confused with an indiscriminate increase in lateral bending thickness. Required shape, clearance, section and root dimensions are selected design inputs to be allocated in the paired PLAN, together with actual cam faces, closed seat/capture, curved entry/release and the remaining printing strategy. No new numerical fit, PETG allowable or physical force value is asserted here.

Permit scoped clearance slots/reliefs in the right closure-side frame border and local door closure stock to accommodate the larger features. Preserve the central cable-passage boundaries, mounting holes, screw access and overall outline; do not thin or cut the hinge, stops, louvers or their dependencies to make room. The PLAN must demonstrate a compatible allocation within these boundaries before approval; an incompatible candidate is not authority to enlarge the vent, obstruct the passage, revise the hinge or promise independent part installation.

Preserve all manually entered/photo-derived existing mounting inputs: default 125 × 85 mm and wide 135 × 85 mm plates; 110/120 × 70 mm screw centres; 4.5 mm shank clearance; maximum 9 × 4 mm screw heads; 105/115 × 65 mm nominal central passage; 3.6 mm frame; 3 mm door; nominal 3 mm overlap outside authorized local reliefs; eight hoods with 9 mm projection. Preserve nominal closed 125/135 × 85 × 12 mm and printable-layout 143/153 × 85 × 12 mm caps, and A14's distinction between nominal size and inherited hinge play. These remain provisional design/photo inputs, not newly measured hardware. The old 2 × 1.4 mm clip, 28.2 mm span, 2.4 mm inspection travel, spherical male and A31 support coordinates describe the preceding geometry, not mandatory defaults or proof for the new closure.

### Preserved behavior and impact

Keep the captured bottom hinge and 0–180 degree downward/outward travel/stops; rear mounting plane and stable rear-down complete print pose; existing mounting and ventilation interfaces; two-body no-installation operation; all-PETG construction; one editable OpenSCAD 2021.01-compatible source with no external libraries; printable_layout source default and explicit assembly inspection; Bambu Lab P2S/AMS 2 Pro design targets; removal of cables before closing; no shelf or strain-relief claim; and loss of independent clip replacement. A complete revised vent reprint is allowed; compatibility with an already printed vent is not promised. Existing hinge printing risks remain separately documented rather than covered by a promise that the entire vent needs no supports.

This changes A15's specific narrow elevated tongue and spherical male shape, and replaces the corresponding A31 clip/peg/support allocations and certificates. Retain A15's positive capture, direct push/pull and evidence boundaries. The spherical male is no longer a preserved interface. Earlier approval records remain unchanged; PLAN A31 continues to describe the delivered version until a separately approved PLAN amendment exists. No source, README, mesh or implementation change is authorized by this proposed SPEC alone.

### Acceptance, regression, validation and documentation

1. Show exactly two finite operational bodies, positive frame/leaf and door/lug unions, a broad root and actual flexing span, within both width variants and the existing nominal bounds. Demonstrate that added full-height stock does not fuse the free leaf to the frame or peg and does not alter mounting/passage/hinge/louver interfaces.
2. Establish actual positive closed capture, relaxed nominal seating, continuous curved push-close/pull-open and reverse motion with the relevant finite hinge play. Inspect entry, peak required flex, seated and exiting states, finite caps/contact births and full 0–180 degree sweep. Both male cam directions must work without sharp-corner trapping, a separate release action or bending the male, door or hinge. Do not carry forward the former spherical contact proof.
3. Allocate and inspect actual clip and male load sections/root transitions and required travel. Distinguish increased breadth from increased bending thickness, quantify any idealized stiffness/strain screen with its boundary conditions, and identify where removal/operating loads enter each part. No stiffness/size comparison is a measured PETG strength, opening-force, recovery or fatigue result.
4. Identify every actual independent first-layer island, footprint, narrow neck and union height in the printable pose; assess initial growth against its own support polygon. Assess leaf clearance slots, broad male/root starts, overhangs and short bridges separately from global bed area. Demonstrate the closure-specific support strategy and complete accessible removal paths where supports remain; no tree-support attachment to the compliant tongue/male contact faces, fused motion gaps or extraction that depends on flexing those parts. Slicer toolpaths and successful physical removal remain separate pending evidence.
5. Use only permitted assembly/printable_layout diagnostics without electronics, temporary outputs under `/tmp`, native renders below 15 seconds including kill grace, assertion-log inspection and `git diff --check`. Unit tests and conventional test-first remain prohibited. No generated mesh becomes a tracked output by this amendment.
6. Update README for the broader leaf, chamfered male, actual controls/dimensions/provenance, local slots/reliefs, print/support/cleanup strategy and remaining limits. Keep CAD checks, slicer first-layer/toolpaths and physical adhesion/removal/fit/force/friction/recovery/strength/durability/cycling/weather/cable-safety evidence separate. Do not claim that support removal cannot break the print, or that the user's breakage concern is fixed without physical results.

### Approval record

Pending separate explicit approval of the COMPLETE effective SPEC through SPEC-shed-ventilation-A16. The user's “Strengthen both parts” resolves the affected-feature scope; it is not approval of this subsequently drafted revision. No PLAN amendment, source change, render/prototype, commit or push is performed by this planning stage.

## Amendment 17 — 2026-10-19 — top-hinged upward opening with gravity-biased closure

- Amendment ID: SPEC-shed-ventilation-A17
- Previous version: proposed complete effective SPEC through A16, which remains unapproved; latest approved predecessor is A15, delivered at `48f78cf808ee28c3c361f55756ed68078b884e20` under PLAN A31.
- Approval: Approved by explicit user decision on 2026-10-19 for the COMPLETE effective SPEC through A17, including A16; preserve original document status and preceding content/approval history.
- Request and purpose: the user added “also reorient the opening of the clip on the other side - currently it opens down, I want it to open upwards so that the gravitational force will keep it shut.” Asked to distinguish flipping only the latch mouth from moving the whole vent hinge, the user selected exactly “Move the hinge to the top; the whole door opens upward”. This selects whole-door top-hinged operation, not a cosmetic latch-mouth flip. It is not approval of this subsequently drafted revision or a physical gravity/retention result.

### Changes against the previous version

| Requirement | Before | Proposed complete effective behavior | Reason |
| --- | --- | --- | --- |
| A15/A16 preserved hinge/motion | Retain delivered bottom hinge and 0–180 degree outward/downward travel/stops | Put the captured hinge at the installed TOP edge. The entire louvered door opens outward and upward through the retained 0–180 degree operating range. Reallocate hinge axis, bearing/retainer geometry, integral stops, roots and local screw relief as required, while retaining captivity and the mounting/ventilation/nominal-size boundaries below. | Apply the user's explicit choice of whole-door upward opening. The delivered bottom hinge geometry is no longer an unchanged interface. |
| Gravity objective | No new gravity-closing requirement; bottom-hinge gravity behavior and A31 proofs belonged to that geometry | In the normal installed orientation, gravity must bias the seated closed state and a nonzero initial outward-opening interval back toward closed. Demonstrate that bias from the actual modeled door mass distribution, axis location and signed gravitational moment/potential. A top-edge label or a flipped latch opening alone is insufficient. | Orient the real mechanism so gravity assists closed retention rather than asserting it from appearance. |
| Closure location and direction | A16 broader frame leaf and chamfered male constrained primarily to the right closure border and the old bottom-hinge contact path | Retain A16's stronger-printing/cleanup direction, one compliant frame leaf and broad chamfered door lug. Permit relocating/reorienting the closure and grip at the lower free edge or suitable side border to suit upward hinged motion, within the unchanged envelope and interfaces. Re-establish bidirectional cam action, capture and release along the new curved trajectory. | Do not preserve the old latch direction or dependency certificates when the hinge moves to the opposite edge. |
| Open use with cables | Earlier user requirement: “Stay open during use; close after cable removal”; delivered bottom-hinged door had a fully-open resting position | Preserve a stable, deliberate fully-open position for cable access, without using the cable as a prop. Allocate an integral two-body hold-open/resting feature or a demonstrated stable open stop/over-center arrangement; the user must deliberately leave that position before closing. Closed gravity bias is not a requirement that it automatically fall from the intentionally retained fully-open pose. | Avoid converting the cable-access door into a falling load on cables while reversing its swing. |
| Louver and mounting orientation | Closed louvers face downward; existing mounting interfaces and cable passage retained | Keep louvers facing DOWNWARD in the installed CLOSED pose, with existing hood projection and ventilation interfaces. Rebuild/reposition the hinge rather than rotating the entire existing model upside down. | Opening direction changes, while closed ventilation orientation and mounting fit remain preserved. |

### Definitions and gravity/operation boundary

Installed up remains +Y, outward remains +Z and gravity acts toward −Y. “Opens upward” means the door's free lower edge swings outward/upward about a captured hinge along the installed upper edge. Keep a useful unobstructed open cable passage and the full 0–180 degree outward operating sweep; report actual overhead and outward clearance separately from nominal closed and printable bounds. Neither mounting holes nor the photo-derived installed-up convention is to be inverted.

Gravity bias means a restoring gravitational moment or increasing gravitational potential for initial outward motion from the seated pose, evaluated for the actual modeled door and hinge-axis placement. State homogeneous-solid/density, infill or other mass-distribution assumptions and limitations explicitly. Reusing the old hinge's outboard-axis offset without checking the new mass center is not evidence. The paired PLAN must allocate compatible geometry, quantify the closed-neighborhood interval and explain the complete motion and intentional open-hold behavior before approval. Gravity need not overcome unknown friction, spring interference or print tolerance, and no automatic self-latching from an arbitrary open angle is promised. Positive geometric clip/lug retention remains required independently of gravity; no wind, vibration or force rating is introduced.

Retain finger-operated push-close/pull-open at the closure with no separate closure-release press, no reliance on flexing the male, door or hinge, no loose support/hold-open hardware, and no third operational body. A deliberately retained fully-open state may be left by finger movement of the door through its integrated hold-open/resting transition; it must not require a cable, tool or added prop. Remove cables before closing. The stronger clip/male and support-removal objectives in A16 remain effective; the operating path, gravity and open-hold allocation must be evaluated together rather than assuming a tall clip and a top hinge are automatically compatible.

### Preserved dimensions, scope and evidence

All manually entered/provisional dimensions and provenance listed in A16 remain unchanged: 125/135 × 85 mm plates, 110/120 × 70 mm screw centres, 4.5 mm shank holes, maximum 9 × 4 mm screw heads, 105/115 × 65 mm central passages, 3.6 mm frame, 3 mm door, nominal 3 mm overlap outside authorized reliefs and eight downward-facing closed hoods with 9 mm projection. Preserve nominal closed 125/135 × 85 × 12 mm and printable-layout 143/153 × 85 × 12 mm caps. No new numerical hinge, cam, hold-open or material calibration is supplied by this amendment; allocate those provisional dimensions and their manually selected provenance in the paired PLAN.

The geometry-change boundary now includes the vent's hinge/stop/bearing/retainer modules and their derived values, door-to-hinge connections, local frame roots/clearance slots, necessary moving screw-access relief, and relocated closure/grip. This explicitly supersedes A15/A16's unchanged-bottom-hinge boundary and A16's right-border-only closure allocation. It does not authorize changing mounting-hole centres, shank/head envelopes, central passage dimensions, closed louver orientation/projection, overall nominal outline/depth, other designs, printer operation or deployment. Do not restore older hinge geometry merely because it was top-positioned or simpler.

Preserve exactly two operational PETG bodies in one no-installation print-in-place unit, stable rear-down printing with accessible cleanup, OpenSCAD 2021.01 compatibility, one editable source, no external libraries, printable_layout source default, explicit assembly inspection and P2S/AMS 2 Pro design targets. An entirely revised vent reprint is permitted; existing printed-part compatibility is not promised. Earlier captured-hinge, gravity, contact, screw-clearance, bounds and printing proofs apply only where independently re-established for the new geometry; old source equality is not a substitute after hinge relocation.

### Acceptance and approval delta

Apply all A16 acceptance criteria to the top-hinged revision and add: establish actual captured upper-hinge operation/stops through the complete upward sweep and both supported width/clearance regressions; preserve closed downward-facing louvers and screw/cable interfaces; calculate and document signed closed-neighborhood gravity bias from explicit mass assumptions; demonstrate an integral stable fully-open cable-use state and deliberate departure from it; reassess EVERY first-layer island, new hinge/hold-open/closure local growth, support access and extraction; and report overhead/outward swept clearance. Assess modeled gravity and hold-open behavior separately from physical hinge friction, support cleanup, force/recovery, fit, actual stay-open performance and successful printing. Keep the bounded render/no-electronics/no-unit-tests/no-tracked-mesh rules unchanged. README must explain installed orientation, upward opening, gravity limitations, the hold-open/close sequence and revised printing risks.

Pending separate explicit approval of the COMPLETE effective SPEC through SPEC-shed-ventilation-A17, including A16. The hinge-direction clarification alone is not approval of this complete draft. PLAN A31, SCAD and README remain unchanged; no PLAN amendment, geometry/render prototype, commit or push is performed at this stage.

### A17 explicit user approval record — 2026-10-19

Approved by the user's exact reply “approve” to the question presenting the COMPLETE effective SPEC through A17, including A16. The presented revision SHA-256 was `4934cf9d0b493914a5cbfbe34c587ce2b5802cee4bd392b08e7a2cfaa17f123a`. Approval covers the broader bed-growing clip and chamfered male, support-cleanup constraints, top captured hinge/upward whole-door opening, actual closed-neighborhood gravity bias, stable fully-open cable-use state, preserved nominal/mounting/ventilation boundaries and separate modeled/slicer/physical evidence. This record supersedes pending-approval descriptions for the complete current effective revision; preserved earlier proposal text/status/approval records remain unchanged. It authorizes paired PLAN drafting and required independent planning assurance, not source implementation, render/prototype evidence, commit or push.

## Amendment 18 — 2026-10-19 — preserve 180-degree travel with clip-retained closed seating

- Amendment ID: SPEC-shed-ventilation-A18
- Previous version: complete approved effective SPEC through A17, including A16; A17 approval was recorded against presented SHA-256 `4934cf9d0b493914a5cbfbe34c587ce2b5802cee4bd392b08e7a2cfaa17f123a`, with approval-recorded file SHA-256 `089ce4835ae469235365cacc674ba56dcb581ee03433410b6dd685a561572c1d`.
- Approval: Approved by explicit user decision on 2026-10-19 for the COMPLETE effective SPEC through A18; preserve original document status and preceding content/approval history.
- Request and purpose: during pre-PLAN feasibility research, independently integrated existing source-matching mesh data gave a homogeneous-solid door center Z approximately 3.625 mm. A fixed-axis 180-degree fold with the retained 12 mm closed depth and 0.4 mm wall clearance requires an outboard hinge axis Z at least 6.2 mm. Merely moving that hinge to the top therefore does not establish A17's restoring gravity moment at the closed seat. Presented a choice between 90-degree upward operation prioritizing seated gravity return and retaining 180 degrees with clip-retained seating, the user selected exactly “Keep 180° opening: the clip retains the closed seat; gravity returns it after the first few degrees”. This amendment records that selected behavioral tradeoff, not a source implementation or measured physical mass/torque.

### Changes against the previous version

| Requirement | Before | Proposed complete effective behavior | Reason |
| --- | --- | --- | --- |
| A17 gravity row and closed-neighborhood definition | Gravity must bias the seated closed state and a nonzero initial opening interval toward closed | Keep the complete 0–180 degree top-hinged upward opening. The compliant clip and chamfered male provide positive closed-seat retention, including the short initial interval in which modeled gravity may bias opening. After that initial interval, gravity must bias return toward closed throughout the unrestrained operating range. Quantify the actual sign-change angle and relevant mass/hinge-play assumptions for the replacement door; “first few degrees” is a design objective to be demonstrated, not a fixed inherited certificate. | Preserve the user's selected full opening without falsely claiming seated gravity return from an outboard fixed hinge. |
| A17 open hold and closing sequence | Stable integral fully-open cable-use state plus deliberate departure before closing | Preserve the stable integral fully-open hold/resting state. Gravity-return behavior applies when that restraint is deliberately left; it does not authorize a door that falls onto cables. Near the closed seat, finger pressure may complete clip engagement. No automatic gravity self-latching is promised. | Distinguish positive open hold, gravity-biased free travel and positive closed capture. |

### Definitions, evidence and preserved boundaries

For an illustrative rigid top X-axis hinge, outward/upward angle theta, vertical COM distance d=Yaxis−YCOM>0 and outboard offset e=ZCOM−Zaxis, the homogeneous-solid gravity potential difference divided by mg is d(1−cos(theta))+e*sin(theta). Its initial derivative equals e. With the current source-matching door centroid and hypothetical top axes Z6.2/6.5, the opening-biased interval is approximately 3.44/3.84 degrees. These calculations explain the tradeoff only: the top hinge, broader male, grip/root and any necessary hold-open geometry are not implemented, so their actual replacement mass distribution and sign-change angle must be recalculated. Printed infill/density distribution, friction, wind and support-removal forces are not measured. Preserve the requirement for explicit mass assumptions and actual signed moment/potential analysis; do not replace it with a statement that all top hinges automatically stay shut.

This replaces only A17's strict seated/initial gravity-restoring requirement and the associated gravity acceptance wording. It does not reduce the 180-degree range, change the top-hinged whole-door upward direction, remove positive closed capture, waive the integral stable open state, alter the A16 broader bed-growing leaf/chamfered male and cleanup requirements, permit extra bodies or hardware, or change the nominal dimensions/mounting/central passage/closed downward-facing louvers. A16 and A17 otherwise remain effective, including no separate closure-release press, no tool/cable prop, no reliance on bending the male/door/hinge, bounded CAD validation and separate slicer/physical evidence. The current PLAN through A31 remains unchanged and describes the delivered bottom-hinged mechanism; it does not approve the proposed top-hinged revision.

### Acceptance and approval delta

Demonstrate positive clip/lug capture at the seated position and throughout relevant finite hinge play, continuous curved finger push-close/pull-open and reverse travel, and no gravity-assisted relaxed bypass during the initial opening-biased interval. Recompute the actual replacement-door COM and signed gravitational moment/potential over the full top-hinge sweep under stated mass assumptions, identify the initial sign-change interval, verify subsequent gravity return when unrestrained, and separately establish the integral fully-open hold and deliberate departure/closing sequence. Inspect required closing effort geometrically without claiming measured force or automatic self-latching. Preserve every other A16/A17 acceptance, printing/support, interface, safety-boundary, documentation and delivery-planning requirement.

Pending separate explicit approval of the COMPLETE effective SPEC through SPEC-shed-ventilation-A18. The user's quoted tradeoff selection defines this change but does not claim inspection/approval of the subsequently drafted complete artifact. No PLAN amendment, source/README change, prototype/render, commit or push occurred in this planning stage.

### A18 explicit user approval record — 2026-10-19

Approved by the user's exact reply “approve” to the question presenting the COMPLETE effective SPEC through A18. The presented revision SHA-256 was `ebc4b5ba0e721e3f7290b290b9b612224b5e70e3c1ee3f6e5d804c3e2817dd97`. Approval covers the broader clip/chamfered male and support-cleanup requirements of A16, the top-hinged upward whole-door opening and integral stable open state of A17, and A18's selected 180-degree/clip-retained seated behavior with gravity returning the unrestrained door after its initial opening-biased interval. This record supersedes pending descriptions of the complete current effective revision without altering preceding content/status/approval history. It permits paired PLAN drafting and mandatory independent planning assurance only; no source implementation, prototype/render, commit or push is authorized by specification approval alone.

## Amendment 19 — 2026-10-19 — full projected passage required at180, accepted top strip at90

- Amendment ID: SPEC-shed-ventilation-A19
- Previous version: complete explicitly user-approved effective SPEC throughA18.
- Approval: Automatically approved for the COMPLETE effective SPEC throughA19 under the originating `$implement specs/PLAN-shed-ventilation.md` request, recording the explicit user behavioral choice below. Preserve original document status and all previous text/approvals.
- Request and purpose: exact native moving-mesh continuous geometry established that the current top axisY38.5/Z6.5 maps minimum doorZ0 to projectedY32 at90 degrees. The fixed passage ends atY32.5, so a0.5mm top strip remains covered at90, while180 fully clears the passage. Parent presented preserving full90 clearance by repositioning hinge/revising hold versus accepting that strip. The user explicitly selected **“Full clearance at 180° is enough; accept the 0.5 mm strip at 90°”**.

### Changes against the previous version

Replace the inherited A4 acceptance1/original90-degree projected-passage requirement ONLY: full nominal105/115×65mm projected frame passage remains required at180 degrees; at90 degrees accept the nominal0.5mm top strip, with64.5mm remaining projected clear height relative to moving geometry. The fixed frame opening itself remains105/115×65mm. Atotherangles do not promise an unobstructed projected opening; the full0..180 upward movement and stable integral fully-open cable-use state remain required. Actual finite hinge play, printer tolerances, cable/connector clearance and physical access still require their separate modeled/physical assessments; this choice is not measured cable-fit evidence.

### Preserved behavior, impact and approval record

Everything else in complete SPEC A18 is preserved: strengthened full-height bed-grown closed leaf and chamfered broad paddle; top-hinged upward whole-door0..180 operation; positive closed capture and continuous push-close/pull-open/reverse; initial clip-retained gravity interval and subsequent return; stable integral fully-open hold with deliberate finger departure; two operational PETG bodies; no hardware/tool/cable props; mounting, frame/passage, nominal outline/depth, down-facing closed louvers, printer/modes/printable orientation, support/cleanup/first-layer analysis; full modeled assurance and separate pending slicer/physical outcomes. No source geometry, new dimensions or other design is changed by this amendment. README must state the90/180 distinction.

On2026-10-19 the user made the exact quoted selection in response to the parent's concrete current90-degree tradeoff question. The active implementation request automatically authorizes this required specification amendment and approval of the COMPLETE effective SPEC throughA19; do not portray the subsequently generated artifact as manually reviewed. PLAN requires its own recorded amendment/assurance before complete-effective approval. No continuation question or new-session gate applies.
