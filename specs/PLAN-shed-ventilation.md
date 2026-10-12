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
