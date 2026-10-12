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


## Amendment 5 — 2026-10-12 — full-length hinge and captive lift-and-slide implementation

- Amendment ID: PLAN-shed-ventilation-A5
- Previous version: complete effective PLAN through PLAN-shed-ventilation-A4 and its recorded implementation evidence
- Approval: Approved by user on 2026-10-12
- Approved specification: complete effective specs/SPEC-shed-ventilation.md through SPEC-shed-ventilation-A5, explicitly approved by the user on 2026-10-12; SHA-256 a061dbc08057a7d7c6e1487e8faca391c02281968f3a59b32aa4d1953604b19b.
- Request and purpose: implement the user's selected rigid latch variant A and full-length 180-degree hinge after the two specification amendments. This PLAN amendment remains planning only. Earlier PLAN bodies, statuses and approval/evidence records remain unchanged; obsolete two-body, flex-catch and 90-degree allocations are replaced below.

### Changes against the previous version

| Boundary | Before | Final planned state |
| --- | --- | --- |
| Hinge | Two isolated journals/bearings, axis Y=-48.5/Z=5.5, 90-degree stops | Eleven alternating knuckles along 111 mm with an integral continuous shaft, forward-only bed supports, axis Y=-54/Z=8 and two positive 180-degree stops |
| Closure | Deflect the top cantilever catch approximately 1.614 mm | One rigid captive frame-mounted bolt, nominal 3 mm lift and 16 mm lateral withdrawal, gravity pockets at both ends, clearanced door receiver, no flexure or assembly |
| Topology and rendering | Two bodies, assembly0..90 | Three bodies, assembly0..180 and explicit latch states; printable_layout is the closed rear-down pose with bolt retracted |
| Clearances | Old core/top-edge and local corner relief allocations | Derived swept top-core relief, enlarged local circular head reliefs, explicit hinge/arm/receiver/bolt sweep assessment and A5 rear-plane exceptions |
| Validation | Old two-body topology and0..90 evidence | Fresh three-body/0..180/latch-sequence evidence, exterior support-access inspection and continuous motion bounds; historical renders do not validate the new mechanism |
| Delivery | Previous implementation receipt | A new accepted four-path change delivered on local main and verified origin/main; no implementation starts during this planning turn |

### Approved behavior and source boundary

Preserve every effective SPEC requirement, especially fixed mounting dimensions, nominal passage, reinforced unaffected frame/door/louver sections, eight louvers, straight-edge overlap with the authorized local corner exceptions, all-printed captive/no-assembly preparation, Bambu compatibility and the open-use/remove-cable/close sequence. This is a complete replacement vent, including the frame. No retrofit compatibility with the old printed frame is claimed. All new numeric allocations below are selected design defaults or derived geometry, not measurements or strength/printability evidence.

Own only designs/shed_ventilation.scad, the shed section of README.md, specs/SPEC-shed-ventilation.md and specs/PLAN-shed-ventilation.md. Parent alone owns artifact approval/evidence updates; substantive SCAD edits belong to bounded developers. Never modify nested-bank-safe work or other designs. Use the current shed source's parameter groups, rounded panel/slot helpers and axis transform as named source patterns; replace the old catch, two-bearing allocations and stops. No external library or broad research is needed. Keep one editable SCAD file and OpenSCAD2021.01 syntax. New parameters belong near the top; derived allocations and assertions stay separate. Old controls whose geometry is removed must not remain deceptively active.

### Final geometric allocations

Use installed axes X horizontal, Y upward and Z outward. The rear mounting face and print bed are Z=0. All numbers below are millimetres unless marked degrees; adjustable dimensions retain _mm/_deg naming. The original plate125×85, screw110×70, shank4.5, head9×4, frame3.6, border10, door3, perimeter wall1.2, overlap3, louver projection5 and louver roof1.6 remain. Moving clearance g defaults to0.4.

**Hinge and bed support.** Set hinge axis Y=-54, Z=8, derive Y=-plate_height/2-11.5 and Z=max(8,frame_thickness+head_height+g). Smaller supported heads do not lower the axis. Recompute all axis-relative feet/housings/bounds consistently when a supported input raises the axis. Keep the supported screw-head-height domain0<height<=4; changing its domain requires new clearance allocation. Hinge span equals door width111, X=-55.5..55.5. Use11 segments with10 axial gaps g: segment length L=(111-10g)/11=9.727273, start_i=-55.5+i(L+g). Even indices0,2,4,6,8,10 belong to the door; odd indices1,3,5,7,9 belong to the frame. Segment count remains this selected odd count for this delivery; dimensional variations recompute L and reject collapsed lengths.

The continuous integral moving shaft is diameter5, joined to all six moving knuckles, never a loose pin. Moving collars have radius4.5. Use64 facets for circular hinge profiles. To preserve minimum radial clearance g despite faceting, implement fixed bore radius B=(shaft_radius+g)/cos(180/64), default2.903497. In local hinge coordinates u=Y-hinge_y and v=Z-hinge_z, form the lower semicircle and upper circular arc of radius B to45-degree tangent points (±B/sqrt(2),B/sqrt(2)), then straight roof slopes to(0,sqrt(2)*B). Define S=B+2, V=sqrt(2)*B+2*sqrt(2), J=V-S. The fixed exterior profile is(-S,-hinge_z),(S,-hinge_z),(S,J),(0,V),(-S,J). At defaults S=4.903497,J=2.031095,V=6.934593 and exterior topZ14.934593. These formulas, including the B adjustment, are the implemented allocation, giving2 mm side and normal roof thickness. The bore roof maximum radius4.106165 is smaller than the faceted collar's conservative inradius4.5*cos(180/64)=4.494580, leaving positive retention overlap approximately0.3884; the collar cannot pass axially through the bore. Each fixed segment is trapped between neighboring moving collars, with0.4 axial separation on both sides. Assert positive radial retention overlap and axial capture after every permitted parameter change.

For each moving segment, hull its radius4.5 collar with a forward-only rectangle u=0..3,v=-8..0. These integral feet directly contact the bed atZ0 without any negative-u bed toe. Frame housings contactZ0; fixed ribs within their own X bands reach Y=-42.3 atZ0..3.6, overlapping the fixed plate by0.2. Door bridges are2.4 wide in X atZ4..7, run fromY=-54 forward into the core by at least2 mm, and remain within moving-segment X bands. End bridge centres are X=±48.5, placing their outer X edges at±49.7, outside the expanded screw-head X interval starting at±50.1. Interior bridges are centred on their moving segments. Require positive volumetric unions, not tangent-only contacts.

Each shaft interval through a fixed segment bridges L+2g=10.527273 between bed-supported moving geometry. The fixed bore roofs are45 degrees; moving collar/foot hull rear lower tangents extend approximately3.72059 horizontally while rising5.46875. These are explicit bridge/overhang allocations, not proven slicer results. At the first door-bridge layer Z4, the forward collar/foot hull ends nearY=-50.206 and the core startsY=-31.727534, leaving approximately18.479 mm of unsupported2.4-wide bridge. Both ends must be connected printable anchors. This entire bridge must span support-free, including the part above the frame separated by only0.4; inspect its first layers and document the span. No internal support may be placed in bearings or moving gaps. Exterior supports remain permitted only with demonstrated accessible removal.

**Stops.** Provide two symmetric stop stations at moving segment2's left edge and moving segment8's right edge. Each occupies a2.4-wide X band wholly within that moving segment adjacent to fixed segment1 or9. In that band the moving lug is an annular sector r=3.5..7, polar angle0..10 degrees in(u,v), joined to the collar. The fixed stop is r=6..8, angle190..200 degrees, grown vertically downward toZ0. Connect it axially to the neighboring fixed housing through the same rear stop footprint; within the neighboring fixed band, join that footprint to the housing. Do not extend a connector into the moving collar envelope. At180 degrees the moving leading face reaches190 degrees: contact overlaps r=6..7 across2.4 mm in X, nominal contact area2.4 mm² per stop. Before180 the lug does not enter the fixed sector. Fixed downward supports remain at polar angles>=190; their nearest rear extent u<=-5.638 clears the radius4.5 collar. Validate those statements against the actual unions, including the adjacent foot and arm. Physical torsional strength is unproven.

**Panel sweep and screw relief.** Keep the nominal outer door111×71 and current panel/perimeter/louver thicknesses. Recompute the symmetric bed-contact core half-height as min(opening_height/2-g, sqrt((opening_height/2-g-hinge_y)^2-hinge_z^2)+hinge_y), default31.727534. This derived0.372466 additional top/bottom inset maintains at least g at the swept top frame edge with the raised axis; it changes internal clearance geometry, not mounting dimensions, passage size, overlap, panel thickness or the number of louvers. Recompute connecting perimeter and slot pitch without reducing the specified wall/roof sections. Reject invalid radicands or collapsed airflow openings.

Retain four full-depth local circular corner reliefs centred at the screw centres, applied to panel/core/louver/grip geometry. At defaults use upper relief radius5.4 and lower radius7.5, selected conservative round-ups. Define an expanded head radius R=4.5+g=4.9 and expanded head Z=3.2..8. For a screw at Y=s, d=s-hinge_y, all inverse-transformed head points capable of meeting the panel in the first quadrant are inside an XY circle of radius d-sqrt((d-R)^2-hinge_z^2) about that screw, at most approximately5.282 upper and7.389 lower. Use the rounded values only if they exceed the computed bound for the actual input. After the first quadrant the inverse head has Y<=hinge_y, below panel material; validate the remaining range rather than relying on the old0..3-degree check alone. Do not unnecessarily cut safe hinge bridges: keep bridges outside the expanded head X envelope and assess their independent full sweep. Document the enlarged local corner openings and weather limitation. Preserve the fixed passage and straight-edge overlap outside these local reliefs.

**Rigid bolt and guide.** Install the guide on the fixed upper frame, with a door-mounted receiver shelf. Let bolt centre X=0 when locked and X=-16 when retracted; seated centre Y=49 and lifted centre Y=52. The operational sequence is locked(0,49), lifted(0,52), lifted sliding X0..-16,Y52, retracted(-16,49). Reverse it after closing. Nominal stroke is16 and lift3. End-pocket sidewalls block lateral travel until the stem clears their shoulder; allow only normal g play, not an alternate release by bending or friction.

The bolt's captive flange is12×8, local X±6,Y±4,Z2.4..5.4. An integral rear bed foot X±6,Y=-2.5..0.5,Z0..2.8 joins it with0.4 vertical overlap. Its stem is3×3 in XY, rising from the flange toZ12. The fixed guide chamber bounds are X=-22.4..6.4,Y44.6..56.4, with a retained flange cavity Z2..5.8. Outer walls are2.4 thick: X=-24.8..8.8,Y42.2..58.8. Roof occupiesZ5.8..8.2 except the stem slot. Two bottom retaining rails occupy Z0..2, across the chamber X width, at Y44.6..46.1 and52.9..56.4. Their intervening rear slot Y46.1..52.9 is6.8 wide, admitting the moving3-wide bed foot through its full3 mm Y travel with0.4 clearance while preventing the8-wide flange from escaping rearward. Chamber sidewalls close both X ends. Flange undersideZ2.4 clears these rails by0.4; its upper faceZ5.4 clears the roof by0.4. The slot is the union of3.8-wide clearanced rectangular corridors along the two vertical centre paths(X=-16 and0,Y49..52) and horizontal connecting path(Y52,X=-16..0). Closed endpoint centres are not open exits. The enlarged flange cannot pass through the stem slot; nominal capture overlap at its transverse retaining strips is2.1. Roof gap over flange is0.4, and chamber XY limits provide0.4 at extrema. The rear slot is offset1 toward the door relative to the upper guide path to centre the bed footprint under the tongue-heavy bolt. Bottom retaining overlap totals at least1.2 across the two rails at all nominal lift positions (individual rails need not both overlap in every state). Flange thickness3 and the traversing3-wide stem through the2.4-thick roof constrain tilt. Pure yaw gives flange projection12*abs(sin(psi))+8*abs(cos(psi))>=8, greater than rear-slot width6.8. A conservative tilt bound while the stem traverses the roof is3/cos(beta)+2.4*tan(beta)<=6.8, giving beta<=45.976 degrees; the flange projection remains at least7.7168, exceeding6.8. Verify maintained stem engagement, roof/bottom hard stops, permitted clearance play and actual geometry; do not replace complete capture QA with this nominal bound. Assert and inspect capture throughout all allowed travel and with clearance play, including potential tilting, not only at centreline endpoints.

Anchor the guide to the upper frame with a fixed rear foot X=-24.8..8.8,Y39.5..44.6,Z0..3.6. Its material ends at the chamber boundary and does not fill the bed-foot slot. The footprint is outside the clear passage and away from the corner screws. Roof and bottom-rail capture leave the bolt captive after removal from the bed without depending on the wall as a retainer. Check capture with actual cavity/slot/clearance geometry, not merely because the bolt prints inside the guide.

A rigid tongue, width6 in X, extends from the stem toward the door: at a seated bolt centre its world Y is36.5..50.5, Z9..12; lift translates all bolt geometry+3 inY. A finger pad width8, depth6 occupies Z12..15 centred on the stem XY. The door receiver is a10-wide shelf X=-5..5,Y33..41.6,Z5.6..8.6, joined by a root at X=-5..5,Y33..35.5,Z4..8.6 to the existing upper lip. The tongue overlaps the shelf in locked and lifted positions, with0.4 vertical gap before contact and at least2.1 mm Y overlap when lifted. At X=-16 it clears the receiver laterally by8 mm; its Y>=36.5 also clears the rest of the door lip, whose top sweep is bounded atY35.589341. Receiver top sweep is bounded atY41.683646, leaving>0.5 to guide frontY42.2. Operating contact may occur after the designed clearance is taken up; as-printed geometry remains separated. No old flexible catch remains.

Printing the retracted bolt requires external removable support under the leading tongue at X=-19..-13,Y36.5..41.8, above the fixed frame. Leave the guide/channel and moving gaps support-free. The span from the front support's rear edgeY41.8 to the stem frontY47.5 is5.7 and must bridge at tongue undersideZ9 without internal support. Provide accessible exterior support under the receiver's forward shelf extension above the frame where required; it must withdraw from the exterior after printing with the bolt retracted. The bolt flange overhangs its offset bed foot by1.5 toward the tongue and3.5 on the other Y side; assess those layers without adding support in captive rail gaps. The12×3 bed foot is shifted toward the tongue for stability; verify the actual bolt centre of mass/support polygon and first-layer support rather than assuming minimumZ alone is stable. Confirm side access to remove the external support without moving a trapped component or adding assembly. The guide roof itself spans an open-bottom chamber28.8 wide by11.8 deep, interrupted by the stem slot; inspect its actual first roof layers, bridge directions and exposed roof edges. Do not claim an unprinted flat roof is self-supporting. If the assigned geometry cannot meet support-access/no-floating acceptance, use the implementation amendment process rather than silently accept trapped support.

### Motion, rear-plane exceptions and inspection controls

Door motion uses the existing X-axis transform with the new axis. For every point, Z(theta)=8+u*sin(theta)+v*cos(theta). Forward hinge foot points(u>=0) have minimum bounded by endpoint heights. Negative-u collar/hull material lies within radius8, giving Z>=0 throughout motion. The hinge foot radial bound is sqrt(8²+3²)=8.544004; the nearest lower plate corner has radius sqrt(11.5²+4.4²)=12.313001, giving>3.76 radial separation for that local hinge body. Separately validate long door bridges, panel/core, receiver, stop supports, fixed ribs, hardware and latch. These local bounds do not certify the complete mechanism.

A5 exceptions are the door rear core/perimeter and forward hinge bed-foot surfaces plus adjoining low-Z swept material, and the bolt bed foot and its adjoining low-Z material during X/Y travel. Identify them in the actual source/QA report. No moving point may crossZ<0. At180, moving door Z=16-Zclosed; its nominal maximumZ12.5 at the collars gives minimum3.5, exceeding0.4. Other moving features must satisfy the same0.4 fully-open criterion. Bolt rear contact remains the explicit exception. Model contact with a flat plane only; rough siding may rub and requires a physical check.

Expose door_angle_deg in0..180, latch_slide_mm in0..16 (positive means withdrawal toward-X), and latch_lift_mm in0..3. Printable_layout ignores inspection pose overrides and uses angle0,slide16,lift0. Assembly defaults to angle0 with the bolt locked; a nonzero door angle requires slide16 and lift0. For intermediate slide values require lift3; at endpoint slide0 or16 permit the full lift range for sequence inspection. Enforce meaningful incompatible-state assertions. These controls are modeled demonstration poses, not a physical interlock guarantee; inspect whether actual guides constrain motion as claimed. Keep both render modes only.

Default overall envelope is expected within X±62.5,Y approximately-61.879..58.8,Z0..15 (125×120.679×15). These are planning bounds to recompute from the final source/mesh, not measured/exported results. Nominal centred P2S margins are approximately65.5 and67.66 before slicer supports/brim. Ensure exterior supports do not exceed the plate and preserve AMS2Pro compatibility without a multicolour requirement.

### Execution workspace, base, delivery and recovery

Planning stays in /home/alexbanica/workspace/openscad-designs. Current inspection: local main HEAD7ac835d6e99f4b343418fb4710b800450c7fd3d8; unrelated nested-bank-safe SPEC/PLAN edits are present. This observed HEAD is not a pinned execution base or fresh remote verification. Preserve the earlier selected implementation worktree /tmp/agent-worktrees/openscad-designs/shed-ventilation. Delivery remains local main and origin/main, not a task branch. No shared backlog identity exists for this standalone pair, so backlog preparation is inapplicable.

After separate PLAN approval and valid clean-context implement entry, parent snapshots invoking HEAD/index/content and approved artifact hashes, fetches origin main with git fetch origin +refs/heads/main:refs/remotes/origin/main, verifies ancestry and records the refreshed base. Create a detached worktree at that exact refreshed origin/main. Byte-verify copies of both approved artifacts and check applicable instructions at the base. Exact absent registration may be removed only with non-forced git worktree remove before recreation; any other occupied/dirty/unsafe state is a blocker. Never touch other worktrees or prune them. Failed fetch, unsafe divergence or mismatched authority stops as DRAFT.

After acceptance, reconcile every owned path against its execution-base content and invoking content/index; the existing SCAD and README must match the recorded base unless parent explicitly reconciles concurrent edits. Safely fast-forward invoking main when needed, preserving unrelated work, then transfer accepted four-path contents, stage only those paths, inspect and commit on main. Push explicitly git push origin main:main. Verify upstream origin/main and remote ancestry/SHA containing the accepted commit before claiming delivery. Never force-push or publish unrelated ahead commits. Reconcile original transferred artifacts without overwriting later edits. Retain recovery state until verified delivery; clean/remove only the reconciled temporary worktree without force. Source not accepted or blocked work remains recoverable in the worktree and is not integrated onto main merely as a checkpoint.

### Units, roles and execution order

Each assignment has exact current artifact/source hashes, bounded fresh context, precise ownership and five-minute maximum (aim three). Parent retains requirements, architecture, integration, Git and final acceptance. No child branches, manages worktrees, commits or pushes. Serialize all edits to the single SCAD and all mutable validation environments; a successor starts only after parent reconciles its predecessor. Temporary agent capacity is scheduling state, not a terminal blocker.

| Unit | Prerequisite | Exclusive ownership and role | Completion and next step |
| --- | --- | --- | --- |
| H1 Hinge and panel motion | Approved pair and verified execution worktree/base | Developer: designs/shed_ventilation.scad | Full-length shaft/knuckles, feet/arms,180stop, core/reliefs and guards; development checks; thenH2 |
| H2 Rigid latch and inspection | Parent-verified H1 handoff | Developer: same SCAD, serialized | Bolt/guide/receiver, removal of flexure, three-body layout/controls, state guards and development validation; thenH3 |
| H3 Integrated review/correction | Frozen H1/H2 source, diff and evidence | Code-reviewer read-only; bounded developer correction owns same SCAD only after parent dispositions | One integrated review wave, consolidated supported corrections and affected development checks; thenH4 |
| H4 Motion and print geometry QA | Corrected frozen H3 source | Independent qa-agent read-only source; temporary outputs only | Complete hinge/latch sweep, capture, three-body topology, bed support, supports/access and preserved behavior evidence; correct qualifying failures and revalidate; thenH5 |
| H5 Durable usage and acceptance | Accepted corrected geometry and QA | Parent: shed README section and artifact evidence/approval fields only | Final dimensions/provenance, latch instructions, orientation/supports, limits, exact trace and DoD; thenH6 |
| H6 Git delivery | All required accepted evidence, reconciled files | Parent: integration/staging of four owned paths | main commit, verified origin/main push and guarded worktree cleanup; terminal receipt |

Unit completion is a handoff, not a user continuation gate. Implementation continues through all authorized units, corrections, assurance and delivery once entered. Checkpoint reports give completed work, next ready unit and verified commit/push status; they do not invent delivery or authorize extra effects.

### Assurance and validation

Select routine for this bounded local mechanical source/docs change: no external/shared software interface, deployment, executable dependency, security or credentials change. One independent integrated code-review wave is required. Contract/security reviews are inapplicable; physical hardware/motion interfaces are covered by geometry review and QA, not a software contract review. Independent QA is required because three captive bodies, inaccessible clearances,180-degree motion and gravity-latch capture need evidence beyond source review. Main performs documentation synchronization and final git diff --check. No unit tests or conventional test-first phase may be created or run.

All OpenSCAD invocations use timeout -k 1s 14s and write under /tmp/shed-ventilation-validation/A5/. Only printable_layout and assembly are allowed. Use an available offscreen/virtual display for PNG and actually view images. CSG generation is syntax/assertion evidence, not visual acceptance. STL/mesh inspection and temporary analytic scripts are geometry inspection, not repository unit tests. Never add generated exports or analysis scripts to source control. Example command forms:

```sh
mkdir -p /tmp/shed-ventilation-validation/A5
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/A5/layout.csg -D 'render_mode="printable_layout"' designs/shed_ventilation.scad
timeout -k 1s 14s openscad -o /tmp/shed-ventilation-validation/A5/layout.stl -D 'render_mode="printable_layout"' designs/shed_ventilation.scad
timeout -k 1s 14s openscad --imgsize=1200,900 --viewall --autocenter -o /tmp/shed-ventilation-validation/A5/open180.png -D 'render_mode="assembly"' -D 'door_angle_deg=180' -D 'latch_slide_mm=16' -D 'latch_lift_mm=0' designs/shed_ventilation.scad
git diff --check
```

Generate and inspect printable preview plus assembly door0/30/60/90/120/150/180 with retracted bolt, and closed locked/lifted/mid-slide/retracted latch poses. Add closeups of bore/shaft, both stops, guide capture, pockets, receiver and external support access. Continuous geometry bounds or equivalent complete motion analysis must cover the whole hinge sweep, all hardware envelopes, bolt travel plus permitted clearance play, and rear-plane nonpenetration. Verify shelf retention even while lifted, no premature180stop collision, no passage obstruction at90/180 and genuine bolt capture with the vent off the wall. A three-component STL count alone cannot establish captivity.

Mesh checks must establish exactly three finite closed connected components, each with actual stable Z0 contact and printable connected growth. Confirm all as-printed moving gaps, roofs/bridges, material unions, positive locked and retracted pockets, capture shoulders, eight passages and screw/tool access. Inspect the selected external supports' removal path; never substitute inaccessible support for bed-supported captive geometry. Report final bounds/plate margins. Source-derived geometry and preview evidence do not prove slicer output or unfused printing; physical checks remain as approved.

Run a valid dimensional variation plate_width135/screw_spacing_x120 and recompute span/segment/plate bounds. Check negative guards for nonpositive dimensions/gaps, collapsed segments or vents, lost hinge/bolt capture, wall penetration, invalid pose, unsupported head height, screw/hinge/receiver conflicts and lost stop engagement. Inspect OpenSCAD diagnostic output rather than exit code alone. Record precise commands, outcomes, source hashes and artifact paths. Timeouts remain missing evidence; no render over15 seconds, repeated successful unchanged checks or invented evidence. Equivalent substitutions require documented coverage-preserving amendment; unresolved mandatory checks block acceptance.

Parent consolidates supported review findings, commissions one bounded correction batch, then affected checks and QA. Repeat a cycle only for confirmed acceptance failure, regression or blocked approved behavior, with benefit exceeding impact. In-scope corrections continue without routine permission. Newly discovered geometry requiring an approved-behavior change follows the active implementation amendment rules after valid implement entry; this user-invoked planning turn retains manual SPEC/PLAN gates. Do not silently weaken capture, support or clearance requirements.

### Requirement-to-delivery trace

| Effective SPEC anchor | Units / owned paths | Planned terminal evidence |
| --- | --- | --- |
| A4 hinge distribution, range and stop; acceptance1 | H1,H3,H4 / SCAD | Full111span,11alternating knuckles, integral capture, complete0..180sweep and exact180stop; required poses and clear passage90/180 |
| A4 catch replacement, retention semantics; acceptance2 | H2,H3,H4 / SCAD | Rigid lift3/slide16, both end pockets, guide/shelf engagement, open/close sequence, no intended flex, capture with clearance play and off-wall |
| A4 topology and render controls; acceptance3 | H1,H2,H4 / SCAD | Exactly3connected bodies, direct stable bed contact, closed/retracted printable pose, no assembly, permitted modes/state guards, clearances and accessible external cleanup |
| A4 preserved mounting, passage, reinforced unaffected sections, overlap/reliefs,8louvers/drainage; acceptance4 | H1,H2,H4,H5 / SCAD,README | Dimensions/section comparison, head/tool and sweep checks, enlarged local relief disclosure, physical opening unchanged, variation and geometry guards |
| A4 full-replacement scope, materials/printing compatibility and exclusions | H5 / README; parent source boundary | Complete new vent scope, printer bounds, no new hardware/library, preserved other designs and unmeasured provenance |
| A5 wall-plane nonpenetration, named rear-contact exceptions and180gap | H1,H2,H4,H5 / SCAD,README | Continuous point/envelope analysis, identified rear regions, >=g door180gap, independent stop, explicit rough-siding/physical-fit limitation |
| A4 acceptance5 and inherited validation | H1–H6 / four paths and /tmp evidence | Bounded permitted-mode commands/images/meshes, no unit tests, independent review/QA, git diff --check and honest missing evidence |
| A4 acceptance6 and inherited documentation | H5 / README | Current dimensions/parameters/provenance, print/support/clearance guidance, gravity-dependent latch operation and new source/render defaults |
| Original Operation1–7 and source/printing requirements, as overridden byA1–A5 | H1–H5 / SCAD,README | Four screws/flat rear, full-panel access, no fixed obstruction, all-printed/no assembly, ventilating overlap, safe exposed edges/guards, one source/OpenSCAD2021.01, named modules/parameters and installation sequence |
| Original physical-fit/slicer/weather/cable/endurance limitations and A4/A5 physical checks | H5 / README, explicit no-source outcome | User checks remain pending; no physical strength, material flexibility, unfused print, siding fit, weather, security or cable-safety claim |
| Approval/delivery authority | Parent,H6 / SPEC,PLAN and accepted source/docs | Consistent approved pair, preserved previous amendments/unrelated work, clean-context entry, verified main/origin/main delivery and safe cleanup |

### Planning assurance and finding disposition

Initial bounded read-only architect analysis supplied hinge allocations and local bounds; parent authored the integrated latch/panel/source/delivery plan. Required independent final-state explorer and architect reviewed draft SHA-256 a9aafe7a3b99ac2bd9ea1ec7fe0c8cbc22314a1904c5011160889fc39a59dbe1 against the approved SPEC hash above. Architect found smaller head heights could lower the hinge into the wall and the18.479 mm door bridges lacked an explicit support-free allocation. Both are corrected here: the axis has an8 mm floor, and the long bridges have named span/anchors/support exclusion and validation. Explorer confirmed requirement/path/validation/delivery coverage but questioned yaw escape; in a bounded followup it withdrew that unsupported yaw-only finding after checking the minimum8 mm projection and accepted the specified tilt bound for the stated engaged-stem motion envelope. Actual capture/play QA remains mandatory. Parent additionally conservatively allocated bore faceting and shifted the bolt bed foot/rear slot1 mm toward the tongue for stability; no SPEC behavior changes. Both roles then checked corrected draft SHA-256 d195b205104f0bb0efda17838c70b666113097055afd9e85d01b336de7000a8e. Architect independently reproduced the facet-adjusted roof/capture, shifted-foot clearance, bottom-rail overlap and tilt bound; both original findings were resolved with no further supported blocker. Explorer confirmed the foot/slot and authority/coverage consistency, but requested removal of ambiguity between old ideal bore coordinates and the new facet-adjusted formulas. Parent replaced that paragraph with only the implemented B/S/V/J formulas and their numerical values, matching the architect-verified allocation. This final clarification changes no chosen geometry or behavior. No supported planning finding remains unresolved; all source/mesh/slicer/physical evidence limitations remain explicitly stated. These advisory reviews support plan presentation, not user approval or implementation acceptance.

### Definition of Done and approval record

Complete H1–H6 with no unresolved required geometry, review or QA finding; satisfy every trace row with current evidence or its explicitly approved physical-check limitation; synchronize README; verify the consistent effective artifacts, source/diff and owned staged paths; commit on main, verify origin/main contains the accepted commit and complete safe worktree reconciliation/removal. Physical printing/fit/endurance remains pending as explicitly specified. A blocked run reports exact unmet criteria and recoverable DRAFT state, never completed implementation.

Approved on 2026-10-12 by the user reply "approve" to the presented complete effective PLAN through PLAN-shed-ventilation-A5. Reviewed proposal SHA-256: c393897aa55d799ff2828d52d174a9e5651c0ddbb307c5a0ec5bb0ab213db0a1. Approval covers units H1–H6, concrete hinge/latch allocations, routine assurance with independent code review and geometry QA, documentation, the selected worktree and refreshed origin/main base policy, and eventual verified main/origin/main delivery after valid implementation entry. The user subsequently clarified "not in this session", "just approval", and "create the plan": this session records planning approval only and does not start implementation. The approved counterpart is SPEC-shed-ventilation-A5 at SHA-256 a061dbc08057a7d7c6e1487e8faca391c02281968f3a59b32aa4d1953604b19b. Preserve document-level status, prior bodies and approval history. Implementation must be requested in a new session; no implementation worktree, source edit, commit or push is performed by this approval record.

## Amendment 6 — 2026-10-12 — bounded wide-flange capture and operating clearance

- Amendment ID: PLAN-shed-ventilation-A6
- Previous version: complete effective PLAN through PLAN-shed-ventilation-A5
- Approval: Automatically approved on 2026-10-12 under the originating implementation request after required final-state assurance
- Approved specification: complete effective SPEC through SPEC-shed-ventilation-A6; SHA-25660a8dd67245dbffc457ac93cdcd239822b634d562cbed9fcd72b04cc3c856b55.
- Request and purpose: the explicit `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md` entered approved A5 in a fresh session. H1/H2 implementation, integrated review and two conformance guard corrections completed. H4 hinge/print QA passed its modeled scope; H4b and a focused successor could not certify compound latch capture from the A5 conditional bound. Focused architect analysis supplied the wide-flange first-contact invariant below. This amendment changes only the latch allocation and its proof/printing guidance; no A5 escape or collision is claimed.

### Changes against the previous version

| Boundary | Before | After |
| --- | --- | --- |
| Flange | 12×8×3,Z2.4..5.4 | 16×16×3,Z2.4..5.4; retain12×3 offset foot X±6,Y=-2.5..0.5,Z0..2.8 |
| Latch centre | SeatedY49/liftedY52 | SeatedY53/liftedY56; X0/-16 unchanged |
| Guide chamber / exterior | X-22.4..6.4,Y44.6..56.4 / X-24.8..8.8,Y42.2..58.8 | ChamberX-24.4..8.4,Y44.6..64.4; exteriorX-26.8..10.8,Y42.2..66.8; closed2.4 walls, roof5.8..8.2 unchanged |
| Bottom rails / rear opening | Front44.6..46.1,rear52.9..56.4; opening46.1..52.9 | Front44.6..50.1,rear56.9..64.4; opening50.1..56.9; rail topZ2 |
| Roof slot | Endpoint centresY49..52,corridorY52 | Endpoint centre pathsY53..56 with3.8 width; rectanglesY51.1..57.9 atX0/-16; lifted corridorY54.1..57.9,X-17.9..1.9 |
| Tongue | Width6,Y36.5..50.5,Z9..12 | Width6,Y37.5..54.5,Z9..12;17 mm length; stem/pad/receiver unchanged |
| Proof | Conditional single-section45.976° tilt bound | Four opposed flange sections establish a closed reachable inclination/centre envelope, captivity and complete operating bounds; no finite-stem assumption for captivity |
| Printing | Smaller flange/guide spans | Flange overhangs5.5/7.5Y and2X; first roof9.5 one-sided cantilever;19.8 roof-column spans;9.7 tongue-to-stem bridge; renewed connected-growth/access inspection |

### Preserved behavior and exact source boundary

Own only designs/shed_ventilation.scad, shed README section, and these two SPEC/PLAN artifacts. Preserve all earlier text/status/approval/evidence records, unrelated designs and invoking changes. The existing selected detached worktree remains /tmp/agent-worktrees/openscad-designs/shed-ventilation at freshly fetched origin/main913a207bb11e0d0a8e61b4eb366ee008f527aca8; invoking main remains at the same commit, with original pending A4/A5 artifact changes only. Recovery snapshots remain /tmp/shed-ventilation-recovery/A5. Parent reconciles original invoking bytes against that snapshot, then accepted amended artifacts/source/docs against current invoking/index/base before the unchanged main/origin/main delivery. No task branch, PR, unrelated ahead-history publication, force or deployment is authorized.

Current corrected source SHA-2569d174eb2920bc039088bc6f185d5e9fc9a93139d7ef00c499311e76a4dc45d43 is the exclusive C1 prerequisite. Keep its H1 hinge/panel/reliefs and H3 thin-panel/essential-material guards. Named edit patterns are derived latch values, fixed_latch_guide/latch_stem_slot/rigid_latch_bolt/bolt_at_pose and associated assertions; no broad research. Use dimension variables consistently in actual solids instead of retaining obsolete12×8 literals. Preserve the10-wide receiver, same Z and Y coordinates, reinforced sections and all eight passages. Keep only printable_layout/assembly and source default printable_layout. Pose controls remain slide0..16/lift0..3, print closed/retracted/seated, assembly closed/locked by default and open only fully retracted/seated. Installation remains gravity-dependent with deliberate lift, slide and lower in both directions.

### Complete default proof allocation

Let c be flange centre; R its rigid rotation; n=R[:,z]; tX=nX/nZ and tY=nY/nZ. Start at the nominal print/operation pose and consider the FIRST departure from total inclination beta<=7 degrees, centre3<=cZ<=4.8 and the connected yaw branch containing zero. In this enclosing region, flange vertical half-extent is bounded by1.5*cos(beta)+sqrt(128)*sin(beta)<2.868. Its entire Z extent is strictly inside the sidewall height0..8.2, so actual sidewalls constrain its XY projection. Its inscribed radius8 disc yields52.540<=cY<=56.460 and similarly constrained cX. Four vertical flange sections at global offsets(±3.5,±6.5) lie inside the flange and outside both roof and rear apertures. Finite-thickness containment uses sqrt(3.5²+6.5²)/cos(7)+1.5*tan(7)<7.624<8. Their Ys are strictly below50.1 or above57.9 while remaining within44.6..64.4, and their Xs remain inside the chamber. Both roof and bottom retaining surfaces therefore oppose every section.

Necessary confinement is7*abs(tX)+13*abs(tY)+3/nZ<=3.8. At beta7 the left side is at least7*tan7+3*sec7>3.8, excluding the first inclination boundary. Symmetric sections force3.5<=cZ<=4.3, excluding both enclosing centre boundaries. The flange cannot reach the first ±45-degree yaw boundary because its Y projection would exceed the19.8 chamber depth. These facts close the reachable envelope; in particular c cannot cross the rear or roof plane, and closed sidewalls prevent lateral escape. This is an orientation/translation capture proof independent of pad sidedness or continued stem engagement, not a sampled-pose claim. Consequences abs(tX)<=0.8/7 and abs(tY)<=0.8/13 are conservative.

Put a=abs(Ryx),b=Ryy>0. Sidewalls give a+b<=19.8/16=1.2375 and a²+b²=1-nY². On the connected branch a<=0.279258,b>=0.958242,abs(Rxy)<=(a+abs(nX*nY))/b<=0.298767 and Rxx>0.947. Within the already-certified envelope the actual finite stem crosses planeZ7; its section contains a radius1.5 disc. At a selected endpoint its axis fits the3.8 endpoint strip, bounding flange centreX within±0.8 of X0/-16. Lifted-but-engaged means the locked endpoint before deliberate lateral withdrawal; the connecting corridor intentionally permits that withdrawal.

Coupled sidewall bound cY<=64.4-8*(a+b)-1.5*abs(nY) bounds the ENTIRE leading tongue edge at localY-15.5/underside5.1 above c: Y<=64.4-5*a-23.5*b+3.6*abs(nY)<=41.166078. Its midpoint hasabs(X)<=6.013740, while its horizontal half-width exceeds2.84, giving at least approximately1.82 mm leading-edge overlap with receiverX±5. Orthogonality boundsabs(Rzx)<=0.13148,abs(Rzy)<=0.09569: underside belowapproximately11.28 and top aboveapproximately9.66. At door2degrees the receiver intersects these height/Y intervals; its outerY isapproximately41.521. Consequently no collision-free opening beyond2degrees exists at a still-engaged endpoint. This conservative clearance-take-up bound does not promise2degrees of actual free play or security.

For the entire retracted tongue, Ymin>=44.6-7.5-6.6*(0.8/13)=36.693846, exceeding whole lip sweep35.589341 by1.104505. At the released endpoint Xmax<=-15.2+15.5*(0.298767)+3+8.1*(0.8/7)=-6.643403; receiver remains X±5, giving1.643403 lateral clearance throughout door motion. Validate the remaining foot/flange/stem/pad against the continuous door envelope; do not silently infer these from the tongue proof. Installed wall contact clips inward normal play of the bed foot; nominal X/Y travel stays atZ0. Off-wall captive play is separately covered above and does not assert an absent wall clamps Z0.

### Guards and dimensional variation

Support0<g<=0.4. Keep fixed selected flange16×16×3, stroke16,lift3,seatedY53,stem3,guide wall2.4,rail top2, foot12×3/offset-2.5..0.5. Guards must reject overriding those proof allocations unless the same complete invariant is maintained; they are selected mechanism constants rather than deceptively tunable unchecked controls. Preserve user-adjustable mounting/structural parameters and the mandatory135-width/120-screw-spacing variation. For g below0.4, derive cavity/roof/slot/rail coordinates from g; the enclosing centre bounds become3<=cZ<=4.4+2g and sidewall height7.4+2g, retaining the positive first-contact margins. Confinement right-hand side is3+2g<=3.8, so the default certificate is conservative. Slot and centre bounds shrink; roof plane7 remains strictly between both roof faces for every positive g. Inspect finite stem section at that plane.

Preserve proof constants/lever limits explicitly: the flange section radius margin, minimum sidewall height, aperture endpoints outside the four sections, cavity-depth/yaw bound, bolt_top relative to flange centre<=8.1 and appropriate tongue-front/height lever bounds. Reject unsupported frame/door/clearance combinations using these bounds. Assert the all-play tongueY lower bound exceeds actual lip_sweep_y_mm by configured g, and the all-play lateral receiver gap remains>=g. Check positive receiver obstruction with actual derived shelf/axis at2degrees and throughout the engaged clearance envelope. Parameter guards cannot stand in for the underlying geometry proof; source and independent QA must agree. Complete all A5 negative-input categories plus new allocation/domain/boundary guards, reading diagnostics even if OpenSCAD exits0.

### Printing, bounds and documentation

Expected default envelope125×128.6785×15, centred256 plate margins65.5/63.66075; width variation135 leaves60.5 horizontal margin. These remain expected until final mesh inspection. Roof outer columns span19.8 inY; front central strip reachesY54.1 from44.6, a9.5 one-sided flat cantilever; front/rear outer strips are6.5 overhangs. No part of this is claimed physically self-supporting. Flange first layer grows from the retained12×3 foot but overhangs5.5/7.5Y and2X; source-connected growth, actual stablebed contact/COM and no islands must be inspected. Architect uniform-density union arithmetic predicts local COM Yapproximately-1.551 inside foot-2.5..0.5; rederive from final mesh.

Exterior tongue support remainsX-19..-13,nowY37.5..41.8 underZ9. Its9.7 bridge to stem frontY51.5 must remain support-free over the guide. Receiver exterior support/removal remains as A5. Verify exposed lateral withdrawal paths for both selected supports without moving captured bodies. Supports/brim in captive chambers/gaps remain forbidden. Slicer accuracy, sag/fusion, breakaway, successful print and physical endurance remain the explicitly pending checks; disclose the longer one-sided spans. README replaces old mechanism/allocation text and reports current dimensions/provenance, operation, proof domain, orientation/supports, exact CAD evidence and these limits.

### Units, ownership, assurance and validation

Routine profile remains applicable: bounded local mechanical model/docs, no software external contract/security/deployment change. Required repeat cycle is justified by confirmed missing A5 mandatory compound capture evidence; no speculative physical issue alone triggers another cycle. Parent retains architecture/artifacts/docs/Git/acceptance. Serialize source edits and OpenSCAD environment; assignments fresh, exact hashes/prerequisites, aim3minutes/hard5minutes.

| Unit | Prerequisite / exclusive ownership | Completion and successor |
| --- | --- | --- |
| C1 Wide-flange correction | Assured automatically approved A6 pair; developer SCAD only at recorded corrected source | Allocations/actual solids/domain guards and development allowed-mode checks; frozen source toC2 |
| C2 Independent integrated review | Frozen C1; code-reviewer read-only | Whole final SCAD diff against effectiveSPEC, complete proof/source agreement and regressions; consolidated supported correction batch/affected checks, thenC3 |
| C3 Final geometry QA | Corrected C2 frozen source; independent qa-agent source-read-only/tmp only | Complete first-contact/capture/endpoint retention/continuous retracted clearance, exact3 closed stablebed bodies, connected growth/support access, current poses/variation/guards/bounds; qualifying failures corrected beforeC4 |
| C4 Durable evidence/docs | Accepted C3 geometry; parent README and artifact evidence | Current provenance/support/operation/limits and exact trace/DoD; final diffcheck; thenC5 |
| C5 Main delivery | Complete accepted evidence and safe reconciliation; parent four owned paths | Commit localmain,push origin main:main,independentremote/upstream/artifact verification; retain recovery until safe nonforced worktreecleanup |

No unit tests/test-first phases. Every OpenSCAD uses timeout -k1s14s, ONLYprintable_layout/assembly, outputs /tmp/shed-ventilation-validation/A6. Render and actually view layout/door0/30/60/90/120/150/180, locked/lifted/midslide/retracted and guide/roof/foot/receiver/support closeups. Use the available temporary DISPLAY:95 for PNG. Fresh default/135-120 STL, finite closed3 connected components, actualZ0 contact areas/COM,8passages, default/variation bounds and guards are required. Analytic complete first-contact/continuous bounds are mandatory; samples supplement them. H4a unchanged hinge/panel proof may be retained only after explicit source/geometry reconciliation; new guide/bolt/receiver interactions require current evidence. Parent runs finalgit diff --check. Contract/security reviews remain inapplicable; routine docs synchronized by parent. No claim of slicer/physical validation.

### Requirement-to-delivery trace

| Effective SPEC requirement | Units / paths | Terminal evidence |
| --- | --- | --- |
| A6 wide flange/domain; A4 capture/retention and acceptance2/3 | C1–C3/SCAD | First-contact invariant, closed reachable envelope, endpoint pockets, actual finite-stem/receiver bounds and noassembly3bodycapture |
| A4 locked/lifted/retracted sequence and all-play clearance | C1–C3/SCAD | Positive receiver obstruction, deliberate withdrawal, full retracted continuous0..180 gap and endpoint play |
| A6 print spans; A4 bed/cleanup acceptance3/5 | C1–C4/SCAD,README | Stableactualcontacts/COM,connected layer growth, precise cantilevers/bridges,accessible exterior supports with no internal support |
| A4/A5 preserved hinge,wall,hardware,mounting,8vents and acceptance1/4 | C2–C4/SCAD,README | Reconciled unchanged H4a bounds plus current integrated interactions/poses/mesh/variation/guards |
| A6/earlier provenance,printing/material/operation/physical exclusions and acceptance6 | C4/README,SPEC,PLAN | Durable manuallyentered defaults/domain,exact current CAD evidence and pendingphysical/slicer limits |
| All inherited authority/delivery/DoD | C4–C5/fourownedpaths | Preserved predecessor text and unrelatedstate, automaticallyapproved completeA6pair,acceptedmaincommit,verifiedorigin/main and safe cleanup |

### Planning assurance and approval record

Required independent explorer and architect reviewed complete proposed PLAN SHA-2564f484e26c411b35e617a2037790465a9c94089839a38efc2f2bbfde5b8f8768d against complete approved SPEC A6 SHA-25660a8dd67245dbffc457ac93cdcd239822b634d562cbed9fcd72b04cc3c856b55 and prerequisite source9d174eb2920bc039088bc6f185d5e9fc9a93139d7ef00c499311e76a4dc45d43. Explorer confirmed source boundaries, complete requirement/path/delivery/validation trace and explicit unsupported-configuration guards; no supported blocker. Architect independently reproduced vertical half-extent2.867613, finite section radius7.622029<8, first-boundary3.882021>3.8, smaller-g enclosing margin0.132387, closed reachable capture, endpoint obstruction and retracted bounds. It confirmed remaining bolt-feature, actual growth/support and supported-dimension checks stay mandatory in C2/C3; no missing design decision or supported blocker. Parent accepts both results and preserves their distinction from implemented-source QA. Complete effective PLAN through PLAN-shed-ventilation-A6 is automatically approved on2026-10-12 under the originating explicit implement request and the implement skill automatic-amendment rule after valid approved entry. Authorization covers C1–C5, all allocations/domain/proof/printing guidance above and unchanged verified main/origin/main lifecycle. This is automatic authorization, not manual user approval. Original status, earlier bodies and approval/implementation history remain unchanged; no manual continuation/new-session gate applies.

Definition of Done remains complete C1–C5 plus all remaining inherited requirements, with no unresolved mandatory model/review/QA finding. Only the already stated physical/slicer checks remain pending. An unvalidated allocation remains recoverable DRAFT and cannot be integrated as accepted main delivery.

## A6 implementation and acceptance evidence — 2026-10-12

The originating explicit implement request entered the separately approved complete A5 pair in a fresh session. Fresh origin/main execution base and invoking main were913a207bb11e0d0a8e61b4eb366ee008f527aca8. Approved artifacts were byte-verified in the selected detached worktree. Original invoking contents/index were retained under /tmp/shed-ventilation-recovery/A5; only the four named paths are owned. H1/H2 implemented the full-width180-degree hinge and rigid latch. Independent H3 review found two P2 parameter-guard omissions (0.1 mm panel rear penetration and oversized relief erasing essential geometry); a consolidated developer correction added dimension-derived guards, preserving emitted default geometry. A5 hinge, topology/growth and ordinary latch translation passed QA; combined latch orientation capture remained unverified. No escape was demonstrated or falsely claimed.

SPEC-shed-ventilation-A6 and PLAN-shed-ventilation-A6 are automatically authorized by the originating implement request under active implementation amendment rules, preserving all preceding artifact bodies/status/approval history. They replace the insufficient A5 conditional tilt allocation with the wide-flange first-contact proof, supported0<g<=0.4 domain, shifted guide/17 mm tongue and renewed printing guidance. Required independent final-state explorer/architect assurance passed. C1 implemented it; C2 independently reviewed the whole source/diff and reproduced the capture/operating inequalities, with no supported finding and no additional correction batch. C2 reconciled unchanged entire-door CSG against A5, SHA-25669bf634f6dd0363f031110822fdb8d5ce8d4ce223140814836c9f6370cb8798f, retaining the earlier complete hinge/head/stop proof without repeating unchanged checks.

Final source SHA-2566700b9868b581ab85150410c0dd005bfc51cbfdb446f6be2150339c0413add32. C3 independent motion QA reproduced the closed six-degree-of-freedom capture envelope, finite stem/endpoint bounds, full-thickness locked/lifted receiver obstruction by2degrees, complete retracted0..180 clearance including all bolt features, unchanged door mesh and continuous rear-plane/passage bounds. Conservative final lip gap1.104505 and lateral receiver gap1.643351 exceed0.4; remaining bolt-feature receiver gap is at least2.969879. Door continuous wall minimum0 is confined to named rear-contact exceptions; fully open minimum3.5. Two nominal180-degree stop contacts remain2.4 mm² each. Installed wall contact clips bolt normal play; off-wall captivity does not claim an absent wall is a Z0 retainer.

C3 independent print QA exported fresh final default,135-width/120-screw-X and g0.1 STLs using timeout -k1s14s. All succeeded in approximately3.2 seconds without diagnostics, yielding exactlythree finite closed connected components, positive actual Z0 contacts and COM projections within support polygons. Default contact areas frame5295.658147/door4575.514657/bolt36 mm². Bolt COM(-16,51.333034,6.350359), localY-1.666966, supersedes the planning approximate COM; it remains within its actual foot. Default envelope125×128.6785×15; centred256 plate margins65.5/63.66075. Variation envelope135×128.6785×15, margins60.5/63.66075. g0.1 mesh also passed. Exact final door triangle multiset equals the independently validated earlier eight-passage mesh, preserving all eight real passages.

Current-source sixteen OpenSCAD previews (layout,seven door poses,four latch states and hinge/stop/receiver-support/guide-rear details) rendered within the limit and were actually viewed across parent and independent QA. An expired temporary display caused one failed preview attempt; the display was restored and every required preview then succeeded. Exact commands/source hashes/outcomes are /tmp/shed-ventilation-validation/A6/previews.json; failed display attempt is retained separately. No failed render is claimed successful. C3 print QA executed44 inherited/new negative cases; each produced the intended assertion diagnostic, despite OpenSCAD returning0 for rejected CSG. No timeout or unexpected accepted negative remained. Source-based geometry analysis and temporary helpers are inspection, not repository unit tests.

Connected first-layer growth and positive unions were checked for all bodies. The flange's5.5/7.5Y/2X overhangs, guide9.5 one-sided cantilever/19.8 column bridge/6.5 strip overhangs and tongue9.7 bridge are explicit unprinted risks, not claimed self-supporting. Selected exterior tongue/receiver supports have exposed lateral removal routes without translating captured bodies; supports above frame/guide anchor start on existingZ3.6 solids rather than filling them. No internal support or brim in captive clearances is allowed. Actual slicer settings, sag/fusion, support breakaway, adhesion, successful freeing, hardware/siding fit, strength/endurance/weather/cable safety remain the previously specified physical checks and were not performed or claimed. Unit tests/conventional test-first phases are prohibited and not applicable; software contract/security reviews are deterministically inapplicable to this routine local mechanical change.

Main synchronized only the shed README section; all other README bytes were preserved. README SHA-256c160abfea7712b5291b536a4bc7c5627aaaec44bea8ebf2e73712225e782a655. Independent receipts, commands, assertions, meshes and analytic bounds remain under /tmp/shed-ventilation-validation/A6/C3motion-* and C3print-*; generated exports/scripts are excluded from Git. Final git diff --check passed after documentation synchronization. All current modeled requirement-to-delivery trace rows are accepted; no unresolved mandatory model/review/QA finding remains. At this record's creation only parent C5 reconciliation, commit/push verification and safe worktree cleanup remain; their actual outcome is established by the subsequent Git/remote evidence and parent delivery receipt, never by inventing this file's future commit SHA.

## Amendment 7 — 2026-10-12 — broaden independent first-layer soles

- Amendment ID: PLAN-shed-ventilation-A7
- Previous version: complete effective PLAN through A6 and its execution receipt; preserve all previous bytes and document status.
- Approval: Approved on 2026-10-12 by the user’s explicit “approve” reply to the complete effective PLAN through A7.
- Approved SPEC: SPEC-shed-ventilation-A7, user reply “approve” on 2026-10-12; complete current file SHA-25604d578c9ba10e831af74ec195f98f1b3c08cf2c542a6aa182c46c03e346f197e.
- Baseline evidence: main/origin/main at0d2763e69590053f524c0e942003666d8002bb59; source SHA-2566700b9868b581ab85150410c0dd005bfc51cbfdb446f6be2150339c0413add32; AGENTS SHA-256daab684e75c0b41365f5e00e7b0ade8b8942cb225982aac480cc6f109604b9f8. This identifies researched geometry, not a pinned execution base.

### Final state and immutable scope

Apply the approved A7 delta to designs/shed_ventilation.scad, README.md's shed section and AGENTS.md, with parent-owned current-amendment evidence in this SPEC/PLAN pair. Preserve earlier artifact bodies, approval records and document status, all other designs and README sections. No renewed research or alternate allocation: use the selected dimensions, source patterns and complete preserved A6 mechanism/proofs. Planning performs no implementation or Git delivery effects.

Set hinge_foot_forward_mm to8. Preserve six moving X bands and default segment length9.727273. Set bolt foot width15/depth4/localY minimum-2.5/topZ2.8, keeping flange16×16×3 and all other latch geometry unchanged. Derive rear opening endpoints from the revised foot's local minimum/maximum, seated centre,3 mm lift and moving clearance; reorder derived definitions before use. Default opening isY50.1..57.9. Update the selected-allocation assertion and add explicit seven-sole guards: hinge segment length×forward depth>=60 mm², min(segment length,forward depth)>=4 mm; bolt width×depth>=60 mm², min(width,depth)>=4 mm. Preserve all supported clearance/capture/motion assertions and reject unsupported combinations instead of weakening them.

Retain rear-down closed/retracted/seated printable_layout default, assembly override, nine initial islands and exactly three finished bodies. Do not introduce source render modes, sacrificial connections, fused brims, inaccessible supports or changed assembly/mounting. Independently renew full A6 capture, engagement and retracted-clearance coverage with the enlarged opening/foot. Recheck the source proof's conservative terms for the wider foot; keep or strengthen the proof. Expected feasibility bounds are hinge radial clearance0.999293 mm, rear opposed-section margin1.140369 mm and bolt X-end clearance0.9 mm; these advisory figures require fresh evidence and do not substitute for final geometry checks.

Insert verbatim the approved SPEC A7 fenced First-Layer Robustness section after OpenSCAD Rules and before Validation in AGENTS.md. Change no other instruction, approval/permission/trust boundary or workflow rule. Main updates the shed README with actual dimensions, nine island descriptions, selected provisional floors, joining heights, supported parameters and fresh geometry evidence. Explain reduced door bridge span (expected14.272 mm), bolt flange overhangs0.5 mm X and5.5/6.5 mm Y, enlarged rear opening and unchanged later-layer risks. Slicer/toolpath and physical success stay explicitly pending unless genuine supplied evidence becomes available; never claim the reported spaghetti is resolved from CAD alone.

### Execution location, base, delivery and recovery

Preserve the selected isolated path /tmp/agent-worktrees/openscad-designs/shed-ventilation and main delivery. At valid implementation entry, parent checks instructions, exact Git/common-directory identity, status/index/HEAD, worktree registrations and approved artifact digests. Retain byte-exact invoking artifact/index/HEAD recovery state before transfer. Refresh origin/main with git fetch origin and verify its resolved SHA before creating a detached worktree at that refreshed ref. A failed fetch, unavailable ref, baseline source drift affecting the allocation, divergence, unsafe main state or conflicting worktree stops as evidenced DRAFT; do not silently repin or overwrite. An absent unregistered planned path is normal. If only that exact path is registered but absent, remove its stale registration with non-forced git worktree remove and verify removal before recreation. Any present/dirty/conflicting planned path requires safe reconciliation or DRAFT; never touch other worktrees.

Transfer the exact approved SPEC/PLAN bytes into the clean detached worktree, verify hashes, and retain invoking recovery state. Specialists have no Git/worktree/delivery authority. Parent alone reconciles accepted owned files into local main after validation, preserving unrelated content/index and verifying main can safely incorporate the refreshed base; normal fast-forward alignment is allowed when clean and nondivergent. Inspect the staged five-path set, run git diff --check, commit on main, and normal push to origin/main. Verify configured upstream, local commit and actual remote SHA contain the accepted source/docs/artifacts. No force push, protection change, alternate final branch or PR is authorized by this plan. A refused push or unsafe reconciliation remains DRAFT with exact unmet evidence.

After verified delivery, restore only unchanged transferred invoking artifact/index state as appropriate, reconcile all five paths against the accepted main commit, verify clean worktree state and remove only the planned temporary worktree without force. A failed transfer, verification or cleanup remains DRAFT. Intermediate specialist/checkpoint completion is not terminal: continue to the next ready obligation without routine continuation prompts. Terminal delivery requires all model assurance, documentation and verified main/origin/main delivery, or an evidenced blocked DRAFT. Physical/slicer criteria are separately pending under SPEC A7 acceptance6, not fabricated delivery prerequisites.

### Assurance profile and deterministic units

Select routine: bounded reversible local mechanical geometry and its validation instructions; no public/shared software interfaces, deployment, security executable configuration, dependencies, provenance, credentials, permissions or approval authority changes. AGENTS edit is the exact scoped geometry-check rule. Contract/security reviews are inapplicable on these semantics; any discovered trigger requires amendment. Unit tests and conventional test-first phases are prohibited/inapplicable. Require development validation, one independent integrated code-review wave, one consolidated accepted correction batch and affected revalidation, plus distinct independent QA for early-island evidence and complete captive-motion regression beyond source review. Main owns final README synchronization and acceptance.

Every assignment uses fresh context, verified complete artifacts/source digests, exact immutable ownership, permitted effects and evidence handoff. Aim3 minutes and interrupt at5 minutes; resplit inspected remainder without resetting a running assignment deadline. Serialize shared mutations, geometry commands and integration; workers preserve others' edits and never commit/push/create worktrees.

| Unit | Ownership / role | Prerequisite and acceptance / next step |
| --- | --- | --- |
| F1 enlarged soles and clearance guards | developer: designs/shed_ventilation.scad only | Approved entry/base/transfer; implement exact allocations and preserve proofs; bounded development checks below. Hand off frozen diff/evidence to F3, not delivery. Split geometry implementation and bounded validation assignments if needed. |
| F2 durable first-layer rule | separate developer: AGENTS.md only | Approved entry/transfer; insert exact approved block, otherwise byte-preserve. May run alongside F1; both complete before F3. |
| F3 integrated assurance/correction | independent code-reviewer read-only SCAD+AGENTS and artifacts; fresh developer corrections on named owned paths | Frozen F1/F2 diff and criteria; review entire change including floors/proof/early growth and policy semantics. Parent disposes every finding together; one accepted correction batch, affected checks, then F4. No speculative scope expansion. |
| F4 independent geometry QA | qa-agent read-only source; temporary outputs only | Frozen corrected source. Independently establish islands/early support and full inherited mechanism coverage below, with exact commands/hashes/results. A confirmed required failure triggers bounded correction and qualifying revalidation; otherwise proceed F5. |
| F5 durable guidance and acceptance | parent: shed README section and current SPEC/PLAN evidence only | Reconcile all evidence and findings; actual dimensions/provenance/limits, exact AGENTS block, trace complete, no physical claim; final nondelegable diff check. |
| F6 verified delivery | parent: owned five-path staging/integration/Git only | F5 accepted; safe local main reconciliation, commit and origin/main push verification, recovery and guarded cleanup. |

### Validation commands and evidence boundaries

Use OpenSCAD2021.01 syntax. All renders/exports use only printable_layout or assembly with no electronics, timeout -k 1s 14s openscad …, temporary outputs under /tmp/shed-ventilation-validation/A7 and no tracked generated meshes/scripts. Preserve exact commands, input SHA, selected definitions, elapsed/exit/assertion diagnostics and artifact paths. A timed-out/unavailable check is not a pass; retry only after a concrete bounded remedy or record a coverage-preserving substitution in PLAN. Inspect OpenSCAD assertion text even when CSG exits0. Temporary analytic/clipping scripts are geometry inspection, never repository unit tests.

1. Generate fresh default and135 mm plate/120 mm screw-spacing printable meshes and inspect finite closed manifold components, exactly three connected bodies, Z0 contacts, positive intended unions, gaps and actual overall bounds. Validate supported0<g<=0.4 representative endpoints, with geometry-derived limits preserved. Use CSG for parameter guards and mesh geometry for actual accepted poses; do not infer geometry from CSG exit alone.
2. Independently extract all Z0 contact patches and source-derived rectangles/remaining polygon footprints. Expected nine: frame, door core, six hinge feet, bolt. Report actual shape/area, narrow dimensions/thin necks, gaps, default hinge77.818182 and bolt60 mm², variant hinge85.090909 mm². Distinguish numerical mesh tolerance from the exact source floor, especially bolt exactly60; record the tolerance rather than weakening an assertion.
3. Inspect clipped geometry below connection heights. Initial candidate sample heights0.2,1.0,2.0,2.39,2.6,3.9 and4.1 mm are modeled inspection planes, not a user slicer profile. Adapt/add planes at actual topology/overhang transitions while retaining coverage from Z0 until substantial joins. Temporary intersection helpers keep allowed render_mode values and cap each command. Analyze each disconnected clipped component's volume/COM versus its own bed support polygon until joined; report unsupported growth and any COM outside support. For this inspection, joining means the first positive-volume continuous union with the door core through the modeled bridges (hinge feet), or with the broader flange (bolt foot); mere tangent contact is insufficient. Inspect immediately below and above each actual union transition. Hinge bridges beginZ4; bolt flange startsZ2.4 with0.4 mm foot overlap. Verify modeled unions after transitions, individual support before them, flange overhangs and bridge span. Do not substitute the finished door's global hull for its six early feet or claim this measures physical adhesion.
4. Renew full A6 analytic reachable orientation/translation capture and finite-section witnesses against the revised opening. Cover locked and lifted receiver obstruction, retracted continuous clearance, complete3 mm lift/16 mm slide with revised sole, flange retention and off-wall capture. Recompute all inequalities, foot extrema/end clearances and positive union. Retain current supported clearance domain and four-section proof; unsupported proof/allocation fails acceptance.
5. Renew source-based continuous hinge/wall/frame/screw-head/stop clearance proof, representative bounded geometry at0,30,60,90,120,150,180 degrees and clearance extrema, plus two independent stop contacts. Check fully open180 gap and90/180 unobstructed passage. Inspect printable and electronics-free assembly previews at default, lifted/locked/retracted and fully open relevant poses. Quantify outer bounds and accessible exterior supports; retain all unchanged inherited dimensional assertions and later bridge/cantilever limitations.
6. Execute inherited and new negative parameter assertions by bounded CSG: selected allocation mismatch, invalid clearance, collision/capture loss, hinge sole area/short dimension below floors, bolt sole area/short dimension below floors and invalid mandatory variant geometry. Where constants are not adjustable, a temporary source copy may alter a single derived allocation solely to exercise its guard; never add source overrides or change supported API. Record rejection diagnostics and ensure valid default/135 variant pass. Capture/motion assertions remain mandatory, not replaced by new foot floors.
7. Parent runs git diff --check and verifies no generated files, unrelated edits, earlier artifact changes or changed README sections. Confirm AGENTS block matches approved text exactly. Final reports separate CAD contact/connectivity/support, reviewed slicer toolpaths and physical print outcomes. No actual sliced file or physical success is presently available; label these pending without attributing a proven exclusive cause.

### Requirement-to-delivery trace

| Approved SPEC anchor | Unit / paths | Required terminal evidence |
| --- | --- | --- |
| A7 changes table: six8 mm hinge soles,15×4 bolt, revised rear opening and60 mm²/4 mm floors; mandatory135/120 | F1,F3,F4 / SCAD | Exact allocation, independent default/variant footprints, supported and rejected parameter checks |
| A7 acceptance1 and2: nine independent patches, early growth, own support/COM and joining heights | F1,F4,F5 / SCAD, shed README | Independent clipped-island evidence, dimensions, connections and explicit adhesion limitations |
| A7 preserved behavior; acceptance3: mount/passage/sections/louvers/hinge/stops/wall/head/capture/latch/no assembly | F1,F3,F4 / SCAD | Fresh full three-body geometry, continuous motion/capture proofs, representative poses, positive unions and floor/capture guards; inherited physical checks stay pending |
| A7 acceptance4 and no brim/internal support/fusing or new render modes | F1,F3,F4,F5 / SCAD, shed README | Bounded allowed previews/meshes, actual growth/support limits, no tests/generated Git artifacts, diff check |
| A7 exact AGENTS addition; acceptance5 | F2,F3,F5 / AGENTS, shed README | Verbatim rule and scoped current usage/dimension/evidence guide, all other bytes preserved |
| A7 acceptance6: model/slicer/physical distinction and no physical-fix claim | F4,F5 / shed README, SPEC/PLAN evidence; no printer operation | Actual slicer/physical evidence pending; model delivery is limited to approved CAD assurance |
| A7 scope/approval/delivery boundaries and preserved prior artifacts | Parent,F5,F6 / five named paths | Consistent approved effective pair, fresh entry/base, scoped staging, verified local main/origin/main commit, safe recovery/cleanup |

### Plan-assurance evidence

Completed on 2026-10-12 by fresh read-only explorer A7-PE and architect A7-PA. Both independently verified and assessed the complete proposal PLAN SHA-2566eb84ddef89f31b57e7afe5677a41f4e8e573f57c088a1503e2e71af83278759, approved SPEC SHA-25604d578c9ba10e831af74ec195f98f1b3c08cf2c542a6aa182c46c03e346f197e and current source SHA-2566700b9868b581ab85150410c0dd005bfc51cbfdb446f6be2150339c0413add32, with actual AGENTS/README evidence. Explorer found no blocking contradiction in paths, allocation, validation, delivery or scope; noted that “substantial” joining could be subjective. Parent resolved this by naming positive-volume union with the door core through bridges or the broader bolt flange, with samples immediately before/after the actual transition, in validation3. This clarifies evidence collection without changing approved behavior or acceptance. Architect found no supported blocking finding or missing decision; independently reproduced sole areas, hinge radial separation and rear capture-section margin, confirmed full capture renewal, bounded units and routine eligibility of the exact geometry-only AGENTS rule. Neither performed renders, implementation, slicer or physical validation. No actionable supported plan finding remains; final proposal differs from the reviewed draft only by this evidence clarification and assurance receipt.

### Approval record and Definition of Done

Manually approved on 2026-10-12 by the user’s exact reply “approve” to the complete PLAN A7 proposal, SHA-25681a8af873eec0a820c89a835db6f87cce9cc879ffba98643b6f0f0d66c30179f, paired with approved SPEC SHA-25604d578c9ba10e831af74ec195f98f1b3c08cf2c542a6aa182c46c03e346f197e. Approval covers the complete effective PLAN through A7, including F1–F6, validation, assurance, scoped files, isolated location and verified main/origin/main delivery. Approval preserves all previous document bodies/status/approvals and the selected isolated location/main delivery; it does not by itself start implementation in this iterate session. After valid implement entry, execute F1–F6 continuously with no routine stage approval gates. Done means every trace row's modeled/review/QA/documentation and authorized main delivery evidence is accepted, no unresolved required finding, both source and rule implemented, and safe reconciliation/cleanup verified. Slicer and physical adhesion remain explicitly pending under approved SPEC acceptance6; successful first-layer printing is required before claiming the actual spaghetti failure fixed. A blocked DRAFT names exact unmet model/delivery criteria and preserved recovery state.


## A7 implementation and acceptance evidence — 2026-10-12

The originating explicit `$implement specs/SPEC-shed-ventilation.md specs/PLAN-shed-ventilation.md` request entered in a fresh implementation session after separate manual approval of the complete effective pair through A7. Refreshed origin/main and invoking main both resolved to 0d2763e69590053f524c0e942003666d8002bb59. Source matched the researched baseline SHA-256 6700b9868b581ab85150410c0dd005bfc51cbfdb446f6be2150339c0413add32. Approved SPEC SHA-256 04d578c9ba10e831af74ec195f98f1b3c08cf2c542a6aa182c46c03e346f197e and PLAN entry SHA-256 106e3df2815bda108b6b1ccfdb344096d609e757520d37521f1f5d9401a3f682 were byte-verified in the selected detached worktree /tmp/agent-worktrees/openscad-designs/shed-ventilation. Original invoking artifacts, index entries and diff remain in /tmp/shed-ventilation-recovery-A7. No unrelated path or stale unrelated worktree was changed. Sandbox Git metadata access needed escalation to create the authorized worktree; creation succeeded without changing invoking main.

F1 implemented six 8 mm-deep hinge soles, the 15×4 mm bolt sole, derived rear aperture Y50.1..57.9, exact 60 mm²/4 mm floors and selected-allocation/positive-union guards. F2 inserted the exact approved First-Layer Robustness block; all other AGENTS bytes are preserved. Frozen source SHA-256 3c68000005d8898eeada4f2e080d897f91ac5690cbaa51357bf8e8fc14ac46b9; AGENTS SHA-256 ce1da10c17bd690433f69104ebecb3f78f4f788f3e0a47bf8cf0cd96aca69847. F3 independent integrated code review found no supported finding. It independently checked the wider-foot conservative 0.5·abs(Ryx) discarded term, exact rule equality, footprint floors, positive flange overlap, and unchanged capture/motion guards. No source correction batch was necessary; no source changed after review.

F4a independently exported fresh printable default, mandatory 135/120 and g0.01 meshes. Every export is finite, closed, consistently wound with exactly three permanent bodies and nine actual Z0 patches. Default frame/core areas 5262.858147/4400.423497 mm²; six rectangular feet 77.81808..77.8184 mm² (exact source 77.818181818), bolt 60 mm². Variant hinge areas 85.09056..85.0912 mm² (exact source 85.090909091). The seven rectangular soles have no necks; their short dimensions are 8/4 mm. Other patch characteristic dimensions, hole/relief shapes, 7/5 mm door webs, 1.2 mm perimeter rib, 2.4 mm guide walls and conservative frame-hole neck bound 1.285534 mm were inspected without claiming an exhaustive medial-axis certificate. Minimum actual gaps .4/default and variant, .01/g0.01. Numeric mesh tolerance 1e-4 mm/1e-3 mm² is distinct from exact source floors.

F4a clipped the accepted meshes at 15 heights per variant, including Z.2/1/2/2.39/2.6/3.9/4.1, immediately before/after Z2.4/4, and g0.01 transitions Z2.01/3.61. Analytic clipping of triangulated accepted geometry, planar capping and geometry-neutral subdivision of collinear cap edges reproduce the requested volumetric intersections. Each of all 45 accepted clipped solids' disconnected components is watertight before volume/COM acceptance. Each early COM projects within its own actual bed support polygon; default/variant minimum margin 1.624309 mm, g0.01 1.591971 mm. Nine clipped components become three immediately above bridge Z4, or Z3.61 at g0.01. Bolt flange broadens above Z2.4, or Z2.01, with positive sole overlap; no tangent-only join is claimed. Final-body global COM is separate; default bolt projects Y51.412220 inside Y50.5..54.5. An initial manual cap and native-cap T-junction attempt were invalid analysis evidence and retained; missing temporary analysis libraries were supplied in /tmp and the corrected capped geometry closed. No failed result is accepted, no source geometry was altered to repair an analysis artifact, and no repository dependency or test was introduced.

F4b renewed the full first-departure compound orientation/translation capture proof with four finite flange sections. Front/rear margins around the expanded opening .140369/1.140369 mm remain positive, inclination-boundary exclusion .0820214 mm; finite-stem endpoint constraints, locked/lifted receiver obstruction and full retracted continuous door/latch clearance remain supported. Whole retracted tongue gaps are 1.104505 mm to lip and 1.643351 mm to receiver; remaining bolt-feature receiver clearance at least 2.969879 mm. Sole X-end gap .9, Y-travel gap .4, positive flange overlap .4. Continuous hinge/frame/head/wall/stop proof passes, lower-frame radial gap .999293, fully open door-wall gap 3.5, two stop areas 2.4 mm² each, clear passage at 90/180. Parent identified report precision errors (receiver v reaches .6, and exterior support cleanup should not require moving a captive body); QA corrected the report with the full endpoint wall bound and exposed lateral cleanup paths. No source correction or behavior amendment resulted.

F4c independently checked current pose geometry, guards and 14 actually viewed previews: layout, seven door angles, locked/lifted/mid-slide latch and three guide/hinge/rear-slot details. Fresh 90-degree mesh has three closed bodies and door Y below -46, leaving passage clear. At exactly 180, deliberate stop-face contact makes the union export nonmanifold with a numerical zero-volume sliver; 179.999 export also merges near-contact surfaces at mesh precision. These exports are not accepted as isolated-body-count evidence. The printable meshes establish exactly three permanent bodies; continuous geometric proof establishes the intentional endpoint stop and door gap. No source change removed the required stop contact. Valid default/135-120/g.01/g.4 CSG passes; all 15 representative negative inputs emit expected diagnostics: clearance domain, hinge capture, frame collision, wall penetration, head height, vents, poses/lift sequencing, invalid mandatory variant, selected allocation and both sole floors. OpenSCAD exit0 alone was never treated as a guard pass. Initial PNGs failed due to sandbox X socket access; temporary display setup and authorized local-socket escalation produced all required successful previews. No invocation exceeded the 14-second timeout plus 1-second kill limit.

Default/variant envelopes remain 125×128.6785×15 and 135×128.6785×15 mm; centred nominal P2S margins 65.5/63.66075 and 60.5/63.66075 mm before external supports. Bridge span is 14.2725 mm, bolt flange overhangs .5 X and 5.5/6.5 Y. Shaft intervals, guide roof/cantilevers, tongue 9.7 mm bridge and receiver exterior support remain explicit later-layer slicer/physical risks. Source comparison preserves their geometry. Exposed lateral support removal routes remain available with captive bodies in the printed pose; no inaccessible internal support or brim joining moving gaps is allowed. QA receipts/commands/logs/scripts/meshes/previews are temporary under /tmp/shed-ventilation-validation/A7, specifically F1-report.md, islands-receipt.md/islands-report.json/islands-analyze.py, motion-proof.md/motion-numeric.json/motion-analysis.py and poses-report.md/poses-*-records.json/guards-*.log. No generated artifact is tracked.

F5 main synchronized only the shed README section, SHA-256 fc62b366c733e0520a498726e4c21e71f46611db31c903922d7423d7ef0a43ee, recording measured CAD dimensions, provisional provenance/floors, all nine early islands, joining heights, per-island versus full-body evidence, support limitations and pending physical checks. The exact AGENTS block and all predecessor artifact bodies/status/approvals are byte-preserved. Unit tests and conventional test-first phases are prohibited and not applicable; contract/security review is deterministically inapplicable under the approved routine profile. No new automatic SPEC/PLAN amendment occurred in this execution. Actual sliced toolpaths, adhesion/successful first-layer printing, freeing, fastener/site fit, material/endurance/weather and cable safety remain pending under SPEC A7 acceptance6. The reported spaghetti failure is not claimed resolved.

All modeled requirement-to-delivery trace rows have accepted development/review/QA/documentation evidence and no unresolved required model finding. Parent final diff check passed. At this precommit receipt only F6 five-path reconciliation, accepted main commit, origin/main push verification and guarded temporary-worktree removal remain; their actual outcome is reported by subsequent Git evidence and the parent delivery receipt, never by inventing this artifact's future SHA. Earlier approved artifacts and their historical approval records remain unchanged.
