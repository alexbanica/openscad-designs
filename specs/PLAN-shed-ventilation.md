# Shed ventilation implementation plan

Status: Approved

Date: 2026-10-12

## Authority and final outcome

Approved specification: `specs/SPEC-shed-ventilation.md`, complete 2026-10-12
revision, approved by user reply "approve".
SPEC SHA-256: `74fe2747d143fa5f483d767828580e41aade941cba249995b988927b65e25d94`.

Deliver one OpenSCAD source for the complete print-in-place vent, including its
captive hinge, full-panel downward opening, top catch and 90-degree stop, plus
README instructions. Preserve all approved dimensions and their provisional
provenance. No physical assembly is required; cleanup, freeing the hinge and
mounting screws are as specified. This PLAN introduces no behavior delta and
changes no earlier approved artifact. PLAN approval is separate from SPEC
approval; implementation requires a fresh session, cleared context, or explicit
same-context consent and valid implement entry.

## Evidence and bounded source approach

Planning checkout: `/home/alexbanica/workspace/openscad-designs`, local `main`
at `2d67bad90145c5d0d68fbd1ee430aa1990f8f3e0`. At inspection the only untracked
path was the new SPEC. OpenSCAD is available at `/usr/bin/openscad`. The remote
is `origin` (`git@github.com:alexbanica/openscad-designs.git`). These observations
are not a pinned execution base or proof of current remote state.

No existing shed model or library dependency is needed. Follow the repository's
parameter/module conventions; fixed slot examples in
`designs/linksys_lgs105_cable_management_enclosure.scad` and hinge transforms in
`designs/nested_bank_safe.scad` are bounded reference patterns only, not geometry
to copy wholesale or edit. Existing designs and specifications are outside
ownership. Do not reopen broad research during implementation.

Use closed-position printing with both the frame rear face and the door's
underside reaching Z=0. Build the door underside into the frame aperture with
clearance; build its overlapping perimeter above the frame with a printable
relief gap. Integral journals grow from the door and are captured by frame
bearing features, with no isolated floating axle. Use self-supporting bearing
roof geometry and accessible exterior supports where necessary; no trapped
support or sacrificial internal assembly feature. All moving door details use
one hinge-axis transform. Top catch flexure, stop contact, and screw keepouts
must be designed together with this envelope. In the as-printed closed pose,
all frame-to-door interfaces, including catch, stop, journals and retention
features, must have positive separation. A catch may retain the door behind a
clearanced lip without touching it in this pose; intentional operating contact
does not permit fused print geometry. Allocate numeric hinge offsets, bearing
wall thickness, retention overlap, overlap relief, stop and catch envelopes during U1 and check
them against the approved plate, overlap, clearance and opening before finishing
the geometry. These derived implementation dimensions do not replace SPEC inputs.

This is a geometric approach to validate, not proven printability. Do not deliver
an elevated floating door, fused hinge, obstructed passage, or a disconnected
pin to satisfy an export. If geometry contradicts the SPEC, use the implement
amendment process; do not silently weaken one-print/no-assembly behavior.
Reversible local defaults: descriptive module names, modest preview tessellation,
and temporary artifact names; none may change the approved dimensions/behavior.

## Workspace, base and delivery

Implementation worktree: `/tmp/agent-worktrees/openscad-designs/shed-ventilation`.
Create detached from freshly fetched `origin/main`; record the resolved SHA before
source changes. Exact delivery branch is local `main`, remote `origin/main`,
per repository instructions. No task-branch delivery substitutes for main.

The parent snapshots HEAD, index/content state and SHA-256 hashes of both approved
artifacts, then copies them byte-for-byte into the detached worktree. Preserve
all unrelated invoking-checkout changes. Refresh with
`git fetch origin +refs/heads/main:refs/remotes/origin/main`; failed fetch,
main divergence or unsafe checkout state blocks execution as DRAFT. Recheck
AGENTS.md at the fetched base. An absent worktree path is normal; an exactly
registered but absent planned path may be removed non-forcibly and recreated.
Other dirty/conflicting occupancy stops; never prune unrelated worktrees.

Following acceptance, parent reconciles all owned paths and original artifact
copies and safely updates invoking local main to the verified upstream, using
fast-forward only where needed. Transfer accepted source, README and artifact
content to main without overwriting concurrent work. The new SCAD and README
must be absent/unchanged respectively against the recorded execution base unless
an explicit reconciled integration resolves the difference. Stage only the four
owned paths, inspect the staged diff, commit on local main and push explicitly
with `git push origin main:main`. PLAN approval plus valid implement invocation
will authorize this complete lifecycle; no Git delivery is authorized by planning
alone. Verify remote main contains the accepted commit using fetched ref/remote
SHA, and verify upstream is origin/main. Do not push unrelated ahead commits.

Retain recovery state until transfer and remote verification finish. Remove only
the clean reconciled temporary worktree, without force. A rejected push must not
be forced: fetch, reassess and safely integrate if within authority; otherwise
retain an evidenced DRAFT. Incomplete work remains recoverable in its worktree;
do not put a blocked or unaccepted geometry change onto main merely to checkpoint.

## Delivery units and ownership

All substantive specialist assignments use fresh context, exact artifact hashes,
bounded authority and a five-minute maximum (aim three). Parent integrates and
owns Git, requirement decisions and acceptance. Specialists never branch, create
worktrees, commit or push. Serialize source ownership and repository checks;
follow-up units retain exclusive ownership after reconciling the previous worker.

| Unit | Prerequisites | Owner and paths | Completion / next step |
| --- | --- | --- | --- |
| U1 Geometry | Approved pair, valid implement entry, verified worktree/base | Developer: `designs/shed_ventilation.scad` only | Parameters/assertions, frame, eight-louver door, captive hinge, catch, stop, printable layout and assembly angles; development checks below. Then U2 |
| U2 Integrated assurance and corrections | U1 frozen source/diff and development evidence | Independent code-reviewer read-only; developer corrects same SCAD path after parent disposition | One integrated review wave, consolidated supported corrections, affected checks; then U3 |
| U3 Geometry QA | Corrected U2 snapshot | Independent qa-agent, read-only source; outputs under `/tmp` | Assess motion/retention, bed support and passage evidence, not merely repeat parsing; resolve qualifying failures through bounded corrections and affected QA; then U4 |
| U4 Documentation | Accepted geometry and QA dispositions | Parent: `README.md`; parent owns only approval/evidence updates to this PLAN and paired SPEC | Durable dimensions/provenance, one-print preparation, modes, tuning, installation and physical limits; inspect consistency; then U5 |
| U5 Acceptance and delivery | U1–U4 complete | Parent: integration/staging of the four owned paths only | Final diff check, DoD, commit on main, verified origin/main push, safe reconciliation/cleanup |

Checkpoints report completed work, next unit and actual commit/push state; unit
handoffs and checkpoint reports do not pause implementation for permission.

## Assurance profile

Select **routine**: bounded mechanical source and documentation with no changed
shared software interfaces, executable dependencies, deployment, security or
credentials. Independent integrated code review is required for geometry,
parameter consistency, regression isolation, print-in-place topology and motion.
Contract and security reviewers are inapplicable: no API/schema/integration or
security behavior is changed. Physical screw/clearance interfaces are covered by
code review and geometry QA, with measured fit explicitly deferred by the user.

Independent QA is required despite routine profile because the captive hinge,
overlap/bed-contact geometry and unobstructed sweep need evidence beyond source
review. Main synchronizes documentation under the routine profile. Unit tests and
conventional test-first phases are prohibited and inapplicable. Correct supported
findings within approved behavior, rerun affected checks, and repeat a cycle only
for confirmed failed acceptance, regression or blocked requested behavior. An
unresolved mandatory check or material geometry issue prevents acceptance.

## Validation commands and evidence

Use `timeout -k 1s 14s` around each OpenSCAD invocation so a background render
cannot continue beyond 15 seconds. All outputs go under
`/tmp/shed-ventilation-validation/`. No generated mesh enters Git.

Example command shapes, using the eventual declared `door_angle_deg` parameter:

```sh
mkdir -p /tmp/shed-ventilation-validation
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/layout.csg -D 'render_mode="printable_layout"' designs/shed_ventilation.scad
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/open.csg -D 'render_mode="assembly"' -D 'door_angle_deg=90' designs/shed_ventilation.scad
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/layout.stl -D 'render_mode="printable_layout"' designs/shed_ventilation.scad
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/closed.png --imgsize=1200,900 --viewall --autocenter -D 'render_mode="assembly"' -D 'door_angle_deg=0' designs/shed_ventilation.scad
git diff --check
```

Repeat assembly preview/CSG at 0, 30, 60 and 90 degrees, and create a printable
layout preview. Use offscreen Qt or an available virtual display for PNG renders.
Inspect images; parsing/CSG alone is not visual evidence. Record command outcomes,
paths and observations. Timeouts remain failed/incomplete evidence; do not extend
the limit. A substitute needs equivalent documented coverage under implement
amendment rules; required geometry validation still missing means blocked DRAFT.

Check each moving body's lowest geometry and first-layer connectivity, not only
the complete object's minimum Z. U1 development and U3 QA must explicitly check
positive frame-to-door separation at every moving interface in the as-printed
pose, including the catch; operating-contact exceptions never apply to that
pose. Confirm positive journal/bearing gaps, captive
retention across the angle range, no unintended collisions except deliberate
catch/stop contacts, and stop engagement at 90 degrees. Assess intermediate sweep
analytically from envelopes in addition to sampled views. Check the clear frame
passage as 105 × 65 mm and absence of fixed centre bars. Check eight actual
louver passages, overlap, drainage, rounded exposed edges and accessible screw
heads/tools. A matching journal diameter alone does not prove retention.

Use parameter assertions for dimensions and keepouts, plus bounded permitted-mode
CLI checks for representative invalid inputs (nonpositive dimensions/clearances,
collapsed louver passages, screw/hinge/catch conflicts) and one valid dimensional
variation. These are OpenSCAD assertion checks, not a unit-test suite. Measure the
complete printable envelope including louvers/hinge against the target printer
plate; record any slicer support/brim uncertainty. No slicer or physical print is
claimed. Actual unfused hinge operation, weather performance, connector fit and
mounting measurements remain user verification as approved in the SPEC.

## Requirement-to-delivery trace

SPEC anchors use existing headings and numbered operation criteria; acceptance
bullets are numbered in their document order.

| SPEC anchor | Unit / owned paths | Required terminal evidence |
| --- | --- | --- |
| Purpose; User decisions; Dimensions table | U1 SCAD, U4 README | Defaults/provenance match; whole panel; no connector-fit claim |
| Operation 1 | U1–U3 SCAD, U4 README | Flat mounting face, four holes/head/tool keepouts; measurement guidance |
| Operation 2–3 | U1–U3 SCAD | Full open passage, captive hinge, outward/downward sweep, 90-degree stop |
| Operation 4 | U1–U3 SCAD, U4 README | Integral finger catch/grip, retained closed pose, cable removal sequence |
| Operation 5–6 | U1–U3 SCAD, U4 README | Eight downward louvers, seam overlap/drainage, rounded passage, stated weather limits |
| Operation 7 | U1–U3 SCAD | Assertions and invalid/valid parameter check evidence |
| Source/printing bullets 1–3 | U1–U3 SCAD | 2021.01 syntax, one file, printable_layout default, bed-supported captive bodies, no trapped supports or assembly |
| Source/printing bullets 4–7 | U1–U4 SCAD/README | Cleanup vs assembly, assembly angles, printer-envelope check, retained hinge and accessible catch/screws |
| Acceptance bullets 1–4 | U1–U3 SCAD | Default, closed/open, intermediate sweep and layout evidence described above |
| Acceptance bullets 5–6 | U1–U5 all owned paths | Bounded renders, no unit tests, diff check, no tracked meshes |
| Acceptance bullets 7–8 | U4 README; no physical source outcome | Explicit pending measurement/slicer/print/retention/cable checks; no invented results |
| Documentation/exclusions; revision | U4 README, U5 all owned paths | Durable use/provenance guide; no edits to other designs or historical artifacts |

## Definition of Done and blockers

All trace rows must have recorded evidence or their explicitly approved no-source
outcome. Complete review, corrections, required geometry QA, README and final
`git diff --check`; inspect staged content, commit accepted paths on main, verify
origin/main contains the commit and reconcile/clean the temporary worktree.
Physical fit and actual successful printing remain pending user checks and are
not claimed by completion of the CAD scope.

Missing approval/valid entry, failed base refresh, unsafe concurrent changes,
unavailable mandatory evidence, or geometry incompatible with required behavior
stops affected work as evidenced DRAFT after safe independent work. Native-agent
capacity is scheduling state: wait and resume pending assignments. Only true
missing information/authority/capability blocks; no routine continue question.
Preserve partial work and state exact unmet criteria, hashes and recovery paths.

## Plan assurance

Read-only native explorer and architect reviewed the approved SPEC digest above
and initial PLAN digest
`2682a8cac81b66df5a28222b4bcb87173c72b75e93c860fe6eb1ea5f05a2a233`
on 2026-10-12. The parent reconciled their findings before presentation:

- Explorer verified both hashes, current HEAD, AGENTS.md, artifact scope, and
  targeted source/README evidence. No supported contradiction found. The existing
  safe hinge has separate pins/clips and the Linksys vents are fixed slots;
  neither proves print-in-place feasibility. Retained the pattern-only boundary.
- Architect found the review/QA/delivery gates coherent and requested explicit
  separation at the catch as well as bearings in the printed closed pose.
  Added positive separation at every frame-to-door interface, distinguishing
  operating contact from fused geometry; U1 also explicitly allocates and checks
  the numeric hinge/catch/stop envelopes before completion.

These are planning reviews, not geometry renders, print evidence or approval.
The parent checked the reconciled PLAN against the unchanged approved SPEC;
all supported findings are disposed in the approach and validation gates.

## Approval

Approved on 2026-10-12 by the user reply "approve" to the complete PLAN
presented at Checkpoint 02. The approved proposal SHA-256 was
`088b327f03110eb863c243cf97117c3af72aca53959de9207fcf5041e6ab6dd1`.
This approval covers the complete planned implementation, assurance and verified
main delivery lifecycle upon valid implement entry. No implementation has begun;
use a fresh session, cleared context, or explicit same-context consent for entry.

## Amendment 1 — 2026-10-12 — corner relief and guard corrections

- Amendment ID: PLAN-shed-ventilation-A1
- Previous version: original approved 2026-10-12 body
- Approval: Automatically authorized by originating implement request; planning assurance pending
- Request and purpose: integrated review of source SHA-256 243c3ac254a56615160c63e858aa683deb24645f44be423d6d37dbe8efd6bfad found three P2 defects; implement requires correction against SPEC-shed-ventilation-A1.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| U1/U2 overlap | Uninterrupted corner overlap; draft cuts relief through core | Limit four screw-head relief cuts to Z >= frame_thickness_mm; retain recessed core; explicitly adopt SPEC A1 corner exception. | Preserve core and accessible screw heads with unchanged input defaults. |
| U2 parameter correction | Positive thickness and centre-only screw guards | Reject combinations with no positive journal-to-bridge material overlap; reject screw shank envelopes intersecting aperture and head/tool envelopes intersecting hinge or catch. Use actual corner-distance envelopes. | Thickness 7 mm disconnects journals; 106 × 66 mm spacing intersects aperture. |
| U3 validation | Default sweep and representative inputs | Additionally demonstrate rejection of thickness 7 and screw spacing 106 × 66; verify preserved core at corner cuts, accepted valid variation, full default sweep and stop/retention/bed support. | Close evidence-backed review findings. |

### Preserved behavior and impact

Scope remains four owned paths, same worktree/base policy and main delivery, routine profile with independent code review and geometry QA, no unit tests, 15-second render limit, no physical/slicer claims. U2 developer applies one consolidated correction after planning assurance; U3 then validates snapshot; U4 parent documents corner/weather exception and final inputs; U5 parent alone integrates/commits/pushes. No source edits before complete effective pair assurance. Earlier artifacts remain unchanged except these appended amendments.

### Requirement-to-delivery trace

| Requirement | Unit / paths | Evidence |
| --- | --- | --- |
| SPEC A1 local relief and preserved core | U2 SCAD, U3 QA, U4 README | Corner cut height/source and visual inspection, screw access and localized seam/weather note |
| Operation 7 valid parameter domain | U2 SCAD, U3 QA | Thickness7 and spacing106×66 rejected; one valid variation accepted |
| All original trace criteria | Existing U1–U5 / four owned paths | Original complete trace and DoD retained |

### Approval record

The complete effective PLAN including PLAN-shed-ventilation-A1, paired with complete effective SPEC including SPEC-shed-ventilation-A1, is automatically authorized on 2026-10-12 by the originating implement request under active implement amendment rules. Required explorer and architect assurance is pending and will be appended before source correction. Original status/approval preserved.

## Amendment 2 — 2026-10-12 — swept screw clearance

- Amendment ID: PLAN-shed-ventilation-A2
- Previous version: PLAN-shed-ventilation-A1, automatically authorized but not implementable after architecture assurance
- Approval: Automatically authorized by originating implement request; planning assurance pending
- Request and purpose: architect assurance of A1 found retained core intersects a 9 mm head at 0.5 degrees; complete the original accessible-fastener and unobstructed-motion criteria.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A1 relief/core boundary | Cut only above frame top; preserve entire recessed core | Permit four local relief cuts through the complete moving door, including recessed core, where screw clearance requires; document four small additional closed corner ventilation gaps and increased local rain exposure. Preserve 3 mm straight-edge overlap and the complete fixed 105 × 65 mm open passage. | Frame-top-only cuts leave material that rises into screw heads during initial opening. |
| Screw envelope provenance | Head diameter 9 mm; height unspecified | Add adjustable screw_head_height_mm = 4 mm as a manually entered provisional design default, not a measured fastener. Validate against cylinder diameter9, Z=frame_thickness_mm through frame_thickness_mm+head_height. Measure actual heads before printing. Tool access is required at mounting/inspection poses, not with a tool present during motion. | Bounded modeled envelope is needed to distinguish actual head clearance from an indefinitely tall screwdriver keepout. |
| Sweep evidence | Original sampled0/30/60/90 views | Additionally inspect 0–3 degrees analytically against head envelope and assess full sweep, enlarging local clearance cuts if necessary without changing mounting defaults. | Sampled endpoints miss initial corner motion. |

### Preserved behavior and impact

All original and A1 requirements/ownership/assurance remain except explicit replacements above. No physical fastener measurement or weather claim. Original two bodies, captive hinge, no assembly, eight louvers, downward swing, catch, stop, printer compatibility and full open frame passage remain required. U2 developer applies consolidated guards and swept local relief; U3 independent QA checks head envelopes and original criteria; U4 README records selected head height, corner gaps, measurements and weather limits; U5 parent delivers four paths to main/origin/main. The corresponding SPEC-shed-ventilation-A2 defines the same complete effective boundary.

### Approval record

Complete effective PLAN, including ordered A1 and these overriding A2 changes, is automatically authorized on 2026-10-12 by the originating `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md` request under active implement amendment rules. A1 assurance: explorer verified numerical corner conflicts and gates; architect identified 0.5-degree core/head collision. This A2 disposes that supported finding and retains all remaining A1 corrections. Independent explorer/architect assurance of A2 is pending before correction resumes. Earlier bodies and approval records remain unchanged.

### A2 planning assurance and effective-revision confirmation

On 2026-10-12 independent explorer verified artifact hashes, base and source evidence; independent architect confirmed the initial 0.5-degree head collision and found A2 coherent without a blocking finding. The parent accepted their dispositions: A2 supersedes every A1 core-preservation statement/trace; U2 explicitly uses full-depth local relief and positive adjustable head height, guards actual screw shank/head/catch/hinge envelopes and journal/bridge connection. U3 explicitly evaluates 9 mm diameter, 4 mm default height heads at Z=3..7, initial 0..3-degree motion and full sweep, retains connected core/door apart from authorized corner gaps, and runs all original QA criteria. Tools are inspected at mounting poses only. No unsupported lower-head collision is claimed. Documentation carries the new provisional input and local-weather exception.

The parent confirms automatic approval of the complete effective revision including A1 as overridden by A2 under the originating implement request, after required planning assurance. Implementation resumes in the same session. Original artifact contents/status and prior approvals are preserved.

## Implementation and acceptance evidence — 2026-10-12

Execution base was freshly fetched origin/main at 2d67bad90145c5d0d68fbd1ee430aa1990f8f3e0, in the planned detached worktree. Original artifact copies were byte-verified and retained under /tmp/shed-ventilation-recovery. Source SHA-256 after correction: 3349157f1b1c776ac64e4168ea49b78c833c623cdb761c292a63926aefb3f387.

U1 completed through bounded developer assignments; interrupted partial assignments were reconciled before exclusive successors. U2 independent code review of source243c3ac2 found three P2 issues: corner overlap conflict, disconnected journals at thickness7, and aperture-intersecting screws at106×66. Parent accepted all findings. A1/A2 automatic amendments underwent explorer and architect assurance; A2 replaces the rejected core-preservation approach. Developer consolidated correction retains full-depth authorized corner relief, introduces provisional head-height4 with supported domain0<height<=4, and guards positive bridge/journal connection and real screw/catch/hinge envelopes. No earlier or unrelated design/artifact was changed.

U3 independent QA verified two finite connected bodies both bedZ0, envelope125×97×14.2495mm, default .4mm bearing/axial gaps, .6mm captive retention overlap and positive stop contact at90. Successful bounded previews were viewed by QA and parent: printable layout, assembly0/30/60/90, catch and hinge closeups. Analytical full-sweep bounds cover frame, journals, retention, stop and 9mm diameter headsZ3..7, including initial0..3deg. Lower-head bound4.746211mm is within32facet corner-relief inradius4.876405mm; upper/initial bounds also pass. At90 all moving geometry lies below the passage; no fixed centre bar. Eight connected downward-open louver mouths, open bearing drainage, exposed catch/grip, screw access and exterior support access were inspected. Catch release requires about1.604mm +Y displacement; force/strain/elasticity are unverified physical limitations, not claimed results.

Default bounded STL completed successfully (~1.7s), Simple:yes, Volumes:3 (two finite bodies). Valid dimensional variation plate_width135/screw_spacing_x120 passed. OpenSCAD assertion logs reject clearance0, collapsed slots at plate_height45, frame_thickness7, screw_spacing106×66, head_height0 and height5. Parent additionally reached the distinct catch guard with plate170×165/border50/spacing_x72/head_diameter64 and the hinge guard with plate210×120/border40/spacing132×50/head_diameter70; each produced its intended assertion error. Assertions were read from diagnostics because OpenSCAD returns0 on failure. No unit tests or test-first phase were performed, per repository prohibition. Contract/security review is inapplicable as planned.

Initial offscreen PNG attempts failed for absent X, then sandbox-local-display access failed; those zero-byte outputs were not evidence. Parent recovered the same required PNG checks using a temporary extracted Xvfb under /tmp, with local-display access and each OpenSCAD command still timeout-k1s14s. No system package installation or changed repository dependency. All successful previews/STLs and detailed QA reports remain temporary under /tmp/shed-ventilation-validation; none is staged. qa2-motion-visual-report.md records independent mathematical/visual evidence. No render timeout was extended.

U4 parent synchronized README dimensions/provenance, new head-height domain, corner weather exception, print-in-place preparation/support exclusion, catch operation, material-selection criteria, modes, measurement and physical/slicer limits. Final diff check passed. All modeled trace rows have source/review/QA or documented no-physical-outcome evidence. Physical fit, actual unfused print, slicer/support removal, catch elasticity, weather/endurance and cable/connector safety remain pending as originally approved. U5 final main reconciliation/commit/push/remote verification/clean-worktree removal are required next; this precommit record does not invent future delivery evidence.

## Amendment 3 — 2026-10-12 — durability reinforcement implementation

- Amendment ID: PLAN-shed-ventilation-A3
- Previous version: complete approved effective PLAN through PLAN-shed-ventilation-A2 and its delivered implementation evidence
- Approval: Approved by user on 2026-10-12
- Request and purpose: user invoked iterate for modest thicker moving/support/retaining elements, clarified durability, confirmed outward door opening, then approved SPEC-shed-ventilation-A3 with "approve the new iteration".
- Approved effective SPEC: specs/SPEC-shed-ventilation.md through SPEC-shed-ventilation-A3; SHA-256 99af6ba25fbdb4aff533634e349f74635dfe3949c1f457eb6ec9c0e83e400789.

### Changes against the previous version

| Section / decision | Before | After | Reason |
| --- | --- | --- | --- |
| U1 selected sections | Delivered A2 dimensions | Implement every reinforcement value in SPEC A3: frame3.6, panel/overlap3, perimeter wall1.2, journal3.6, arm2.4, head2, toe.8, bearing walls/roof>=2, lug1.4×1.4, fixed stop height1.4/depth1.8, louver roof1.6, anchor14, rigid hook1.6, grip12×2.4; retain beam1.2×12 | Complete approved durability delta |
| Hinge numeric allocation | Axis Y=-47.5,Z=5 at defaults; fixed bearing14mm Y envelope | Keep default hinge Y=-47.5; derive axis Z=frame_thickness+moving_clearance+1.5=5.5mm. Resize chamber/exterior and stop reach below. | Maintain positive connections and sweep despite greater thickness |
| Validation evidence | Existing A2 renders/mesh/sweep evidence | Fresh evidence on reinforced frozen source; earlier results are historical only | Changed geometry invalidates reliance on old successful checks |
| Documentation | A2 dimensions and release/envelope figures | Update selected sections, parameter domains, new sweep/release/footprint results and physical durability limitations | Durable usage must match final source |

### Final geometry approach and numeric allocation

One editable OpenSCAD2021.01 source, no dependencies. Add purpose-grouped named adjustable inputs for approved thicknesses/sections, preserving existing mounting inputs and supported modes/default printable_layout. Derived dimensions live separately; do not hide defaults in modules. No new render modes. All door features use the existing positive-X angle transform: installed +Y up, +Z outside, rear mounting planeZ0. Preserve outward/downward whole-panel operation, flat rear mounting face, two captive bed-supported bodies and no assembly.

The following default allocations are design intent to validate, not claimed render evidence:

- Keep opening105×65, core104.2×64.2, straight overlap3 and door envelope111×71. Panel3, frame3.6, overlap undersideZ4.0 and topZ7.0. Perimeter connection wall1.2 joins core to overlap with positive volumetric overlap. Louver roofs1.6 embed positively in core and retain eight open mouths; projection remains5, not5+extra-thickness. Four complete-depth head reliefs retain diameter9.8 at default clearance; extend their height to cover actual reinforced door geometry. Head cylinders now occupy Z3.6..7.6, diameter9, height4. Existing supported head-height domain0<height<=4 remains, with fresh full-sweep validation.
- Default axisY=-47.5,Z=5.5; journal radius1.8; head radius2.8. Arm X width2.4 with default startX30.1; bearing innerX34.1, axial width8; bridge undersideZ4.0 and thickness3 join the supported leg/journal. Printed arm/bearing X gap1.6. Journal throat allowance.4 per side and head axial gaps.4. Throat axial length3, head startX37.5, axial length2, chamberX37.1..39.9, remaining outer axial wall2.2. Head/toe radial sweep radius sqrt(5.5²+.4²)=5.5145; chamber radius=max(toe sweep,head radius)+.4=5.9145. Ensure throat retains the head/toe throughout motion, not merely diameter equality.
- Bearing upper chamber uses the full45-degree diamond profile. Its maximum profile-Y extent is sqrt(2)*chamber_radius, so choose exterior Y half-span sqrt(2)*chamber_radius+2=10.3645 (full20.729), rather than adding2 only to the lower circular half. Roof topZ=axisZ+sqrt(2)*chamber_radius+2=15.8645. Keep at least2mm outer side/roof material; intentional drainage opening and journal throats are exceptions. Outer bearing reaches Y=-37.1355, still outside aperture bottom-32.5, and overlaps the fixed lower border. Maintain through-underside drainage and no mandatory inaccessible interior support. Recalculate all envelopes for permitted parameter changes and reject unsupported combinations.
- Reallocate lug X start to arm_x+arm_width-.2=32.3, width1.4, ending33.7: .4 gap to bearing inner face34.1. It connects positively to journal material. Derive radial stop reach axisZ-fixed_stop_height=4.1; lug localY from axisY-4.1 to axisY-1.1, localZaxisZ..axisZ+1.4. Fixed stop spans X32.9..34.3 (moving supported-leg end32.5 plus.4 clearance) to overlap bearing by.2; lug contact X32.9..33.7 has width.8 and nominal90-degree area.8×1.4=1.12mm², YaxisY-1.6..axisY+.2 (depth1.8), Z0..1.4. Lug minimumZ=5.5-4.1sin(angle), strictly above1.4 until90 and matching at90; mirrored counterpart identical. Verify contact area and all intermediate separations after integration.
- Separate rigid catch anchor width14 from flexible beam width12/thickness1.2. Default rigid anchor X-7..7,Y37.5..38.7,Z0..3.6 terminates at frame top. Flexible beam X-6..6,Y37.5..38.7,Z3.6..9.8 has an unbraced free span Z3.6..8.2=4.6mm before its first rigid load-transfer attachment; do not count hook thickness in this metric. Rigid upper bridge X-6..6,Y35.9..38.7,Z8.2..9.8 connects to beam only at/above8.2. Inward hook X-6..6,Y34.3..36.3,Z7.4..9.0 has thickness1.6 and overlaps the upper bridge inY by.4 andZ by.8; it does not touch free beam below8.2. No rib/anchor may shorten that free span. Hook-to-rim printed gap is.4 with inward lip reach1.2. Grip X-6..6,Y31.5..33.5,Z7.0..9.4 remains separate from hook. Preliminary rimY sweep bound is35.5136, requiring outward hook displacement at least1.2136mm, or1.6136mm including.4 clearance; reserve that +Y release path to exterior without a fixed obstacle. Preserve grip pull+Z and recompute exact integrated displacement/free span during development and QA. Do not claim material force, strain or springback from static geometry.

The preliminary complete default exterior estimate is125×100.3644×15.8644mm, dominated by the enlarged bearings; nominal centred P2S XY margins are65.5 and77.8178mm before brim/supports. Verify this from final geometry rather than treating arithmetic as export evidence.

Derived allocation may be adjusted during implement only within complete approved behavior, thickness defaults, clearances and source ownership; material changes use implement amendment rules. No unsupported acceptance or substitute validation follows from these preliminary calculations.

### Location, base, scope and delivery

Planning remains in invoking checkout/home/alexbanica/workspace/openscad-designs. Observed local main and cached origin/main are bb162429d79efed632ffd2af820b68c7b92bca0f; this is current local evidence, not a new pinned execution base or live fetch. Implementation retains the exact planned detached worktree/tmp/agent-worktrees/openscad-designs/shed-ventilation, created from freshly fetched origin/main. Snapshot invoking HEAD/index and both artifact bytes/hashes; copy byte-for-byte with recovery copies and verify. Preserve unrelated nested-bank-safe edits and any newer unrelated work. Absent planned path is normal; only the exactly registered missing path may be non-forcibly deregistered. Dirty/conflicting occupancy, failed fetch or unsafe local main divergence blocks.

Own only designs/shed_ventilation.scad, README.md and the paired SPEC/PLAN approval/evidence content. Other designs/artifacts and generated meshes remain excluded. Parent alone reconciles accepted changes to invoking local main after validation, verifies owned SCAD/README still match the recorded base and original artifact state remains reconcilable, fast-forwards main if needed and safe, stages only these four paths, inspects full staged diff, commits and pushes explicitly git push origin main:main. Verify remote SHA, upstream origin/main and accepted file bytes. No unrelated ahead commits, forced push, task-branch delivery or deployment. Clean only verified accepted temporary copies, then remove the clean worktree non-forcibly after confirmed main delivery; retain recovery/evidence if any blocker. A blocked/unaccepted geometry change stays recoverable outside main rather than being published as a checkpoint.

### Units, ownership and assurance

| Unit | Prerequisite | Owner / boundary | Completion and next step |
| --- | --- | --- | --- |
| R1 Reinforced mechanism | Consistent explicitly approved effective pair, valid fresh implement entry, verified base/worktree/hashes | Fresh developer: SCAD only; no Git effects | All SPEC A3 defaults, coordinated numeric geometry and development evidence; freeze then R2 |
| R2 Integrated review/correction | R1 frozen source/diff/checks | Independent code-reviewer read-only; bounded developer correction only SCAD after parent disposition | One full review wave, consolidated supported correction, affected checks; then R3 |
| R3 Geometry QA | Corrected R2 snapshot | Independent qa-agent read-only; artifacts/tmp only | Fresh section/bed/retention/full-sweep/head/catch/stop/support/passage evidence; supported failures require correction and affected QA; then R4 |
| R4 Durable guide | Accepted geometry/QA dispositions | Parent README and paired artifact evidence only | New dimensions/provenance/domains/footprint/release/print/use/physical-limit consistency; then R5 |
| R5 Acceptance/delivery | R1–R4 complete | Parent four owned paths/Git | Final trace/DoD, diffcheck, safe main integration, commit/push verification and guarded cleanup |

Each native specialist receives a fresh bounded manifest/hashes/exclusive ownership; aim3min, hard5min, no branching/worktrees/commit/push. Serialize source ownership and repository/render checks. Parent reconciles interruptions and assigns disjoint bounded successors; a handoff or checkpoint is not completion. Capacity saturation means wait/resume, not waiver. Number current execution checkpoints with completed/next and verified commit/push status.

Routine assurance remains appropriate: local mechanical source/documentation, no shared software contracts/security/deployment/dependencies. Independent code review and independent geometry QA remain mandatory, especially increased chamber/exterior, stop timing and compliant catch. Contract/security review is inapplicable with this bounded change. Parent synchronizes docs under routine profile. Unit tests/conventional test-first are prohibited and inapplicable. Repeat a complete correction cycle only for supported acceptance/check failure or regression, not speculation. Missing physical durability proof is an explicitly preserved user-validation outcome, not claimed CAD evidence.

### Fresh validation and evidence

Use timeout -k 1s 14s for every OpenSCAD invocation; permitted modes only printable_layout/assembly without electronics. Outputs/tmp/shed-ventilation-validation/; no generated mesh in Git. Fresh default CSG/STL, printable PNG and assembly0/30/60/90 PNG inspection are required; use an available local/virtual display, including local-display socket permission if required. Previous virtual display was stopped; temporary extracted binaries under/tmp may be reused when still present, never assume an active display. Do not silently substitute parsing for failed images or extend timeouts. Read assertion diagnostics because process exit0 can contain an ERROR.

Re-measure every reinforced section and outer bearing minimum wall/roof. Inspect two finite connected bodies and each body's initial bed contact/growth: core/legs/toes grow from bed, no floating isolated journals or required assembly. Verify all frame-door interfaces have positive separation in printed pose, including catch, stops, axial retainers, journals and overlap relief. Assess inaccessible support exclusion and exterior support removal; do not claim sliced unsupported bridging or real freeing. Measure complete plate envelope including enlarged bearings and compare nominal P2S plate; compute first-layer/brim margin uncertainty explicitly.

Analytically assess all0–90-degree motion plus views, including initial0–3-degree and full screw-head sweep against diameter9,Z3.6..7.6 at defaults; prior Z3..7 evidence is superseded. Check axis transform opens outward, principal panel avoids inward wall motion, clear passage remains105×65 without centre bar, catch releases/retains with measured modeled displacement, fixed and moving stops meet only at90, captive axial/radial retention remains effective, four screw heads/tools stay accessible, eight passages remain open/downward, edges remain rounded/chamfered and drainage remains open. Every supported new geometry defect blocks acceptance until corrected.

Assertion checks cover representative nonpositive inputs, collapsed louver passages, screw-shank/aperture and head/catch/hinge conflicts, disconnected journal/bridge combinations, undersized bearing material/retention, invalid stop reach or flex-span, and unsupported head height. Adapt previous deterministic conflict inputs to reach intended guards in reinforced geometry; log exact parameters/errors. One valid dimensional variation remains plate_width135 and spacing_x120, checked for topology and modeled clearance instead of parsing alone. No unit-test suite. Parent final git diff --check and staged diffcheck remain required.

### Requirement-to-delivery trace

| SPEC requirement | Units / paths | Required evidence |
| --- | --- | --- |
| A3 table: frame, panel/overlap, perimeter | R1–R3 SCAD; R4 README | Exact3.6/3/1.2 sections, connected bed growth, positive overlap relief, no passage reduction |
| A3 table: journals, arms, heads, toes, bearings | R1–R3 SCAD; R4 README | Exact3.6/2.4/2/.8 inputs, >=2 exterior wall/roof, .4 mating gaps, bed support and full-range captive retention |
| A3 table: moving/fixed stop | R1–R3 SCAD; R4 README |1.4lug X/Z and1.4fixed height/1.8depth, connected support, positive gaps before90, intended contact at90 |
| A3 table: louvers, catch anchor/hook, grip and flexbeam | R1–R3 SCAD; R4 README | Roof1.6, eight passages/projection5, anchor14/hook1.6/grip12×2.4, flex1.2×12 with free length>=4.6 and accessible release envelope |
| A3 preserved behavior and original Operation1–7 | R1–R4 SCAD/README | Mount125×85/screws110×70, selected head9×4, .4clearance, full105×65 passage, local corner relief, eight vents, outward/downward full panel, catch/stop, assertions/keepouts/drainage/edges |
| A3 acceptance and original source/printing/acceptance | R1–R5 four owned paths | Fresh bounded layout/0/30/60/90 images, initial/full analytical sweep, two captive bed-supported bodies, no assembly, complete envelope/P2S/AMS guide, diffcheck/no tracked meshes and all original trace coverage |
| A3 documentation/claimed outcome/physical boundaries | R4 README; R5 artifacts | Before/after provenance and new inputs/domain/release/footprint, intended durability only; slicer/fit/freeing/material/endurance/weather/cable checks explicitly pending |
| Delivery/authority | R5 four paths | Approved effective pair/fresh entry, unchanged unrelated work, exact main commit/remote verification and guarded cleanup |

### Definition of Done and blockers

Every A3 table row and preserved original/A1/A2 criterion must have fresh modeled evidence or its explicit no-physical-outcome disposition. Complete development, independent review and accepted corrections, independent geometry QA, README synchronization, artifact reconciliation, final diff/staged inspection, accepted local main commit and verified origin/main push, then clean-worktree removal. Do not reuse old renders as new evidence or claim increased service life. Missing valid approvals/entry, failed base refresh, unsafe overlap/concurrency, unavailable mandatory evidence, modeled interference/disconnection/retention/stop/release failure or unsafe main delivery leaves evidenced blocked DRAFT with exact missing outcome and recoverable artifacts. No routine continue gate after valid implementation entry.

### Plan assurance

On2026-10-12 independent shed-scoped explorer verified SPEC99af6ba2, initial PLAN4b206b14, source3349157f and current checkout; it found the original trace/ownership/delivery and proposed bearing/hinge allocations supported as design intent, requiring new release/section/envelope evidence. Independent architect verified the same pair and found two supported handoff defects: fixed stopX32.3..34.3 intersected the widened moving bed leg; catch free-span endpoints were undefined. Parent corrected the pending A3 draft to fixed stopX32.9..34.3 with.4 leg gap/.8 contact/.2 bearing attachment and explicitly allocated rootZ3.6, first bridge attachmentZ8.2, 4.6mm unbraced beam and separate hook/bridge connection. Added calculated release/footprint estimates explicitly awaiting implementation validation. An initial explorer assignment selected unrelated nested artifacts and was not accepted as shed assurance; a fresh correctly scoped explorer replaced it without modifying files. A fresh bounded architect verified corrected PLAN7cd3bc84 and approved SPEC99af6ba2, confirmed the stop leg gap/contact/attachment and catch unbraced span/bridge-hook connectivity resolve both findings, and found no introduced blocking contradiction. Parent accepted the reconciled allocations; remaining topology/sweep/elasticity evidence is explicitly assigned to implementation and physical checks, not invented during planning. No source implementation/render/physical durability result is implied.

### Approval record

Approved on 2026-10-12 by user reply "approve" to the complete effective PLAN including PLAN-shed-ventilation-A3, paired with approved SPEC-shed-ventilation-A3 (effective SPEC SHA-256 99af6ba25fbdb4aff533634e349f74635dfe3949c1f457eb6ec9c0e83e400789). Reviewed PLAN proposal SHA-256 c940c470573b2da1b29405540927e5e84bdfe9d30615eb6b3b092b4eac650e61. Approval covers the complete planned reinforcement, independent assurance, documentation and verified main delivery lifecycle upon valid implement entry. Original document status/body/prior approval and implementation history remain unchanged. Implementation requires a new session, cleared context or explicit same-context consent; planning alone authorizes no source edits, commit or push.

## Amendment 4 — 2026-10-12 — moving support sweep clearance

- Amendment ID: PLAN-shed-ventilation-A4
- Previous version: complete approved PLAN through PLAN-shed-ventilation-A3
- Approval: Automatically authorized by originating implement request; planning assurance pending
- Request and purpose: active `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md`; independent R3 QA found a moving bed leg intersects the fixed lower frame during opening on frozen source f0b9b0a9f0325c79c052508181a4fa51e96fd480d3a6fa0b2bd85151db6f122c. Interior witness X31,Y-45.8,Z0.1 rotates at45 degrees into Y-42.47954,Z2.88370, inside the lower frame. Correct the required uninterrupted sweep without reducing reinforced sections.

### Changes against the previous version

| Section / decision | Before | After | Reason |
| --- | --- | --- | --- |
| A3 derived hinge Y allocation | -plate_height_mm/2-5, default-47.5 | -plate_height_mm/2-6, default-48.5; retain Z5.5 and all approved reinforced sections | Lower plate edge becomes6mm from axis, beyond moving leg radial extent sqrt(5.5²+1.8²)=5.7871mm and head/toe extent5.5145mm |
| Guard coverage | Core/bridge/retention guards omit bed-leg lower-frame sweep | Add analytic guard requiring distance to lower plate edge exceed conservative rotating bed-leg and head/toe radii; reject unsupported combinations | Prevent recurrence when supported dimensions change |
| Envelope/release evidence | A3 preliminary125×100.3644×15.8644 and release1.6136 | Recalculate fresh geometry; expected125×101.3644×15.8644, centred XY margins65.5/77.3178; recompute catch release and every affected sweep | Prior images/measurements cannot validate modified source |
| Assurance | A3 no-finding review followed by failed motion QA | Bounded developer correction, full independent source review, fresh motion/image and assertion/variation/mesh QA, README/evidence synchronization | Confirm supported failure resolved and no regression |

### Preserved behavior and impact

SPEC-shed-ventilation-A3 is unaffected: it specifies no exact hinge Y coordinate and already permits coordinated derived placement. Preserve every A3 thickness, mounting125×85/screws110×70, 9×4 heads, moving gaps.4, fixed105×65 passage, flat rear mounting plane, eight vents/projection5, full-panel outward/downward0–90, catch/free span, positive stop, two bed-supported captive bodies/no assembly, four local head reliefs, printing/material/physical limits and four-path main delivery. The enlarged bearing still overlaps the lower frame outside the aperture. No modification of other designs/artifacts. All prior content/status/approvals remain unchanged. Evidence outputs remain temporary, renders bounded to14s plus1s kill.

### Requirement-to-delivery trace

| Requirement | Unit / path | Required evidence |
| --- | --- | --- |
| A3 preserved Operation3/Acceptance sweep | R1 correction SCAD; R2 review; R3 QA | Bed-leg/toe full-range radius guard and frame separation; fresh head/bridge/stop/catch/retention calculations and0/30/60/90/layout previews |
| A3 sections/print/parameter support | R1–R3 SCAD | Unchanged sections, two bed-connected surfaces, new complete envelope, intended negative guards and valid135/120 variation |
| Documentation and delivery | R4 README/PLAN; R5 four paths | Corrected axis/envelope/release/domain/physical limits, finaldiffcheck/main commit/push/cleanup |

### Approval record

Complete effective PLAN through PLAN-shed-ventilation-A4 is automatically authorized on2026-10-12 by the originating implement request under active implementation amendment rules. SPEC remains the separately user-approved complete A3 with SHA-25699af6ba25fbdb4aff533634e349f74635dfe3949c1f457eb6ec9c0e83e400789. Required independent explorer/architect planning assurance is pending before developer correction. No new manual approval or continuation gate is introduced.

### A4 planning assurance and effective-revision confirmation

Independent architect and explorer verified SPEC99af6ba2, complete pending PLANfec07c3b and failed-sourcef0b9b0a9 on2026-10-12. Both found no supported planning blocker: the outer lower plate edge is6mm from the corrected axis, beyond leg radius5.787055 and maximum head/toe radius5.514526; the bearing forward edge-38.135597 still joins the frame and lies below aperture-32.5. Architect predicted release1.613392 and required parameter-derived leg/head/toe radii, explicitly distinguishing conservative radial separation from a uniform.4gap. Explorer traced source ownership/relationships and required guard terminology to identify the outer plate edge. Parent accepts those dispositions. Developer must include max(head_radius,toe_radius) and the actual bed-leg envelope in the guard and preserve positive separation; fresh QA must also assess actual modeled mating clearances. Explorer's illustrative catch arithmetic was not used as release evidence; the exact source expression and fresh QA control that value.

The parent confirms automatic approval of the complete effective PLAN through PLAN-shed-ventilation-A4 under the originating implementation request after both required planning assurance assignments. SPEC A3 remains unchanged and user-approved. All source validation/review/QA/documentation/delivery obligations remain outstanding; implementation resumes in the same session.

## Reinforcement implementation and acceptance evidence — 2026-10-12

Implemented user-approved SPEC/PLAN A3 and automatically approved PLAN A4 under the originating implement request. Fresh fetched origin/main basebb162429d79efed632ffd2af820b68c7b92bca0f; exact detached planned worktree and byte-verified approved artifact copies; unrelated nested-bank-safe changes preserved. Final SCAD SHA-2569dfd963284364509c37f48a81004d34d074ca30c240becfbf37fc20355bd36d4.

R1 implemented all reinforced defaults/derived allocations. R2 independent source review found no initial source issue; R3 fresh motion QA nevertheless proved moving leg and toe collisions against the lower frame. Parent accepted both witnessed failures, appended automatically approved PLAN A4, obtained independent explorer/architect planning assurance, then commissioned bounded developer correction. The second complete independent source review found no supported issue in final source; independently recomputed clearance.506593, core top32.287437, release1.613392 and correct stop/retention/head sweep. No source change after that frozen review.

Final independent motion/visual QA generated and viewed all five fresh layout/assembly0/30/60/90 PNGs with authorized temporary Xvfb:92; every OpenSCAD invocation timeout-k1s14s, no error or timeout. Fresh full0–90/initial0–3 head bounds for diameter9/Z3.6..7.6 remain below relief inradius4.876405 (worst bound4.741753). Actual leg/toe envelopes cannot reach plate footprint; conservative lower-frame separation.506593>=.4. Former interior collision witnesses now outside frame. Core/overlap/bridge interfaces clear; captive retention holds through range; stops contact only90 with1.12mm² per side; nominal rounded105×65 passage clear at90, movingY<=-43. Catch free span4.6, modeled release1.613391790; eight downward mouths, four screw-access reliefs, exposed tool/grip approach, open drainage and support exclusion checked. Detailed fresh report/bounds/images: /tmp/shed-ventilation-validation/A4-motion-report.md, A4-motion-bounds.json and A4-motion-*.png/log. Previous A2/A3 images were not reused as success evidence.

Final independent guard/mesh QA verified source/pair hashes and fresh mesh2017573a8d0b735627f8f7af95dabc329b18ebca2e7f9632587336214a041bb0: exactly two finite closed connected components, each bedZ0; bed contact areas3978.909528 and4451.116383mm². All approved before/after reinforcement sections and positive printed mating gaps verified, bearing minimum exterior2mm/outer axial2.2, toe retention, hook/bridge connectivity and free span. Complete default envelope125×101.3644×15.8644; nominal256mm centred margins65.5/77.3178 beforebrim/supports. Fresh valid135width/120spacing STL has same two-body bed-contact topology/local clearances, envelope135×101.3644×15.8644. Fresh defaultCSG and complete negative guard matrix inspected diagnostics, not only exits: dimensions/clearance/vents/shank/headheight/catch/hinge/journalbridge/bearing/retention/stop/flexspan. Old axis-47.5 rejects new outer-edge guard; -48.3 rejects new actual-frame.4clearance guard; adapted journal7/axis-49.5 reaches retention diagnostic. No missing assigned case or timeout. Details: A4-guards-report.md, A4-guards-assertions.json, A4-guards-mesh.json, A4-guards-variation-mesh.json and logs under the same temporary directory.

R4 parent synchronized README current selected inputs/provenance, new structural parameters, axis/envelope/margins, modeled catch release/span, print preparation/support exclusions and physical limitations. Every A3/A4/original trace requirement now has fresh source/review/QA evidence or its originally approved pending physical outcome. No unit tests or conventional test-first phase were created/run: repository prohibition. Routine contract/security assurance is inapplicable to this local mechanical-only scope with no external interface, executable dependency, deployment or security change. Temporary meshes/images remain outside Git. No new SPEC amendment: complete SPEC A3 unchanged; only PLAN A4 was automatically approved during this execution.

Modeled acceptance is satisfied after consolidated findings/correction and the complete fresh assurance cycle. Physical fit/hardware measurements, actual unfused printing/support cleanup, slicer/brim/plate exclusions, material/catch elasticity/release force, retention cycles/strength/endurance, weather and cable/connector safety remain explicitly pending user checks as approved, not skipped newly and not claimed. Final parent diff/staged inspection, safe four-path main integration, commit/push remote verification and non-forced clean-worktree cleanup remain required delivery actions; this precommit record does not invent their future evidence. Final verified Git delivery and cleanup are reported in the parent execution-end receipt.
