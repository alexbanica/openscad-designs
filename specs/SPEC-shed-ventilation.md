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
