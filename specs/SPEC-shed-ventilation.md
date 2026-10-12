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
