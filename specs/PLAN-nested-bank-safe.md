# Nested All-Printed Bank Safe — implementation plan

Status: Approved

Approval: The user explicitly approved the complete proposed PLAN with
"approve" on 2026-10-09. The approved proposal's SHA-256 was
`77b7bd2d92e95f2bd9913629daff1ab253f149882eca053a8b680b04f8b5aafa`.

## Authority and delivery

Implement the complete approved `specs/SPEC-nested-bank-safe.md`, approved in
conversation on 2026-10-05. Its handheld envelope, five layers, messages,
printed-only mechanisms and validation boundaries are authoritative. Earlier
`specs/SPEC-wardrobe-rod.md` and `specs/PLAN-wardrobe-rod.md` remain unchanged.
This PLAN approval is separate from implementation entry; use a new session,
cleared context or explicit same-context consent with the implement skill.

Planning checkout: `/home/alexbanica/workspace/openscad-designs`, branch `main`.
Observed HEAD and cached `origin/main` both:
`0f81642afdebcd4d7f86862ac782f568699935d5`. Remote state has not been refreshed
during planning. These identify the research snapshot, not a pinned execution
base. Before implementation fetch `origin`, verify local main against refreshed
`origin/main`, preserve unrelated work, and stop on divergence or overlap.
Use refreshed main as the execution base, recording its SHA and artifact hashes.

Implementation worktree: `/tmp/agent-worktrees/openscad-designs/nested-bank-safe`.
Start detached at the verified base; the invoking checkout retains main.
The exact delivery branch is `main`, remote destination `origin/main`, as required
by repository policy. No task-branch delivery or PR is planned. Approval plus
valid implementation entry authorizes accepted-path commit and push to main.
Children never perform Git mutations, create worktrees, push or deliver.

Copy the approved SPEC/PLAN byte-for-byte into the worktree and verify SHA-256
digests; retain original HEAD/index/content state for reconciliation. Only the
parent edits approval/execution records. Do not overwrite different existing
artifacts. If the exact worktree path is registered but missing, use only
non-forced removal of that registration and verify before recreating. Other
unexpected worktree states require safe reconciliation or blocked DRAFT.

After acceptance, transfer only the new source, additive README change, and
approved artifacts/execution evidence to main, verifying content and unrelated
state. If main advanced, reconcile only demonstrably disjoint changes and rerun
affected checks; conflicts or changed design dependencies stop delivery. Stage
only those four paths, inspect the staged diff, run `git diff --cached --check`,
commit on main and push `git push origin main`. Verify the accepted commit is
contained in freshly verified remote main and configured upstream is origin/main.
Remove the clean temporary worktree without force only after reconciliation and
verified delivery; preserve recoverable work on failures. Never claim local-only
work as delivered. Incomplete geometry is not pushed to main as an accepted
feature: retain a blocked DRAFT in the worktree with exact remaining criteria.

## Implementation boundary and mechanical decisions

Owned production files: new `designs/nested_bank_safe.scad`, additive
`README.md` section/design-list entry. Parent owns the two nested-safe artifacts.
No other source, dependencies, generated meshes, or validation scripts are added.
Use only the approved SPEC and named patterns: parameter/derived sections and
assembly/layout dispatch in `designs/rotating_kitchen_jar_tray.scad`; README's
existing per-design assembly, clearance and validation guidance. Do not reopen
product research or import existing enclosure geometry.

Use independent size records, not scale(): envelopes W/H/D are
85/100/75, 71/90/54, 59/81/39, 49/73/27, 40/65/17 mm. Define separate complete
envelope, child chamber, extraction throat, front mechanism, and hinge zones.
Use 2 mm primary shell walls, 0.5 mm per-side child allowance, and nominal
0.35 mm per mating moving surface (0.70 mm diametral bore allowance). Expose
named interface clearances; document any different value and verify its budget.

All safes use front-opening printed-pin hinges, with barrels outside the
extraction throat but inside the complete envelope. Use headed printed pins
with printed captive retainers and positive axle shoulders. Avoid friction-only
retention, living hinges and flexing shell panels. Assembly order must leave
access to each retainer before its covering component is installed.

Safe 1 uses a planar quarter-turn rotor behind its three-spoke handle. Two
opposing printed driving pegs engage transverse slots in two guided sliding
bolts, retracting them before door opening; use a captive printed guide plate,
travel stops and an accessible printed catch holding the latched rotor position.
The drive is a simple cam/slider, with no gear train, springs or bearings.
The rotor catch is a manually moved rigid printed blocking slider, with no
spring or stored flexure force. Dial rotates freely on its own retained printed
axle. Decorative bolt details, frame steps and panels use separate modules,
but all their actual bounds and sweeps count in envelope, throat and extraction
clearance calculations.
Safes 2--4 use successively smaller quarter-turn handles/knobs with directly
keyed single cam tongues, printed travel stops and mechanically retained axles.
Safe 5 uses a low-profile quarter-turn tongue and a front-opening door.
No mechanism may need a key, tool, glue, lubricant or purchased component.

Each removable child has a shell-mounted pull lip with the specified 12 x 6 mm
finger recess; verify access with the parent open and child still closed.
Retrieval features share allocated front space with decorative components but
never intrude into child chambers or moving sweeps. Doors must open far enough
to clear the full straight extraction prism, not merely show the child.

Safe 5's first message is a backed plaque sliding vertically in captive rails,
with a subtle edge notch accessible only after opening its door. A printed stop
retains the slide at its open position; sliding exposes the second backed
message inside the reserved 30 x 40 x 3 mm clear pocket. The pocket's 3 mm clear
depth is measured above the second message relief, not through it. Maintain
the 34 x 55 mm first-message area. Suggested line breaks: `FUCKING` / `NOSY,` /
`AREN'T YOU?`; `UNBELIEVABLE.` may wrap between letters without adding a hyphen
or changing punctuation. All Safe 5 exterior surfaces remain text-free.

Use connected bold glyphs on backed plaques, at least the SPEC's cap height,
stroke and relief targets, mechanically retained by printed rails/stops or
clips. Select an installed font by exact family/style, document it, measure
glyph bounds and narrow strokes; no automatic size reduction. If the installed
font cannot meet requirements, a self-contained vector glyph definition inside
the same SCAD source is an equivalent local default. No downloaded font/library.
Plaques can be printed in one colour or with a small number of height colour
changes; main bodies and decorative components are independently colourable.

## Source interface and printable groups

Default `render_mode="printable_layout"`, `safe_index=1`, `print_group="body"`.
Supported modes: `printable_layout`, `assembly`, `individual_part`; the latter
is an explicit user export selector, not used for repository render validation.
`part_id` selects any named bill-of-materials item; unsupported values assert.
Printable groups per safe are `body`, `door`, `mechanism`, `details`; each emits
all required quantities for its group, with no duplicates across groups.
Use `part_id` as an optional filter within printable_layout for bounded checking.
Every default/selected group fits within 246 x 246 mm, leaving a nominal 5 mm
margin on the 256 mm plate; actual slicer margin/brim still needs inspection.

Assembly selectors: `assembly_view="single"` or `"nested"`, plus
`door_angle_deg`, `latch_angle_deg`, `secret_slide_mm`, and
`extraction_distance_mm`. They transform the same parts used for manufacture,
not alternate simplified models. In nested view `safe_index` selects the active
parent: door/latch states apply only to it, extraction translates its immediate
child together with that child's closed nested descendants. All other safes
stay closed; exclude ancestor shells from the selected transition view so they
cannot obscure it. The closed full-stack view uses safe_index=1 and zero
extraction. For safe_index=5 use its isolated door/secret reveal and require
zero extraction. Reject impossible combinations (opening a
latched door, sliding the message through a closed Safe 5 door). Provide an
explicit inspection option to hide the door's removable mechanism guide plate
for visual checking; this is not a printable assembly configuration.

Bodies print rear-face-down and door panels on their broad flat face. Applied
trim, handles, bolts and plaques print separately. Rails/barrels use chamfers
or printable openings rather than large unsupported shelves. Pins have stable
printed flats/heads appropriate to their bearing interface. Inventory counts,
orientation, retention and assembly order must account for every loose part.

## Execution units and ownership

All source units serialize because they share one SCAD file. No simultaneous
edits to shared paths. Each native assignment has a fresh manifest with exact
approved artifact hashes, source snapshot, scope and validation; aim three
minutes and interrupt at five. Split unfinished work into verified bounded
successors without resetting an unchanged timed-out assignment. Capacity limits
queue work; they do not waive roles or end the lifecycle.

| Unit | Owner and paths | Prerequisite | Completion and next obligation |
| --- | --- | --- | --- |
| U0 | Parent; workspace, artifact transfer | Approved SPEC/PLAN and implement entry | Verified base/hashes/ownership; dispatch U1 |
| U1 | Developer; new SCAD parameter records, shells, hinges, extraction features; parent records allocations in PLAN | U0 | Early coupled fit gate below, all five chambers/throats and complete envelopes, independently separable shell/hinge parts, assertions; U2 |
| U2 | Developer; SCAD Safe 1 drive and dial | U1 | Actual linked bolt travel, retainers, catch and assembly access; U3 |
| U3 | Developer; SCAD Safes 2--5 closures and secret compartment | U2 | Cam latches, captive slide, both reveal areas and pocket fit; U4 |
| U4 | Developer; SCAD lettering, details, selectors and print groups | U3 | All exact messages/colour components, bill of materials, stable complete layouts; U5 |
| U5 | Parent coordinates read-only code reviewer and QA; developer owns accepted SCAD corrections | U4 | Integrated review, corrected findings and required geometry evidence; U6 |
| U6 | Documentation-writer; README only | U5 | Usage, dimensions, bill of materials, assembly order, colours, print and validation guidance agree with source; U7 |
| U7 | Parent; artifacts and Git delivery | U6 | Final checks, accepted staging, main commit/push and verification, clean worktree reconciliation |

No unit completion, checkpoint or specialist handoff is terminal delivery.

Before U1 fixes any shell/hinge interface, record a dimensioned allocation and
cross-section for the coupled Safe 4/5 fit. Account for Safe 4's 7 mm front
allocation and the child's 6 mm-deep retrieval recess; lateral separation of
closure/retrieval features must be explicit. Within Safe 5's 17 mm depth and
34 mm-wide message reservation include rear wall, pocket clear depth measured
above text relief, both plaque backings and relief, rail clearances, door and
cam. Establish the slide's path past the top rim, travel required to expose
the whole second message, retained rail engagement at full opening and printed
end-stop assembly access. Verify actual proposed font metrics at this gate.
Positive scalar envelope budgets alone do not pass the gate. Use parametric
cross-sections and bounded generated geometry; if incompatible, stop for a
SPEC amendment before building downstream mechanisms. Record allocations as
implementation evidence, without silently changing approved requirements.

## Assurance and validation

Profile: full, because several interacting mechanical interfaces and their
clearance/sweep behavior warrant independent final QA. One integrated read-only
code-review wave evaluates the complete source, SPEC and development evidence;
parent consolidates supported findings into one accepted correction batch and
reruns affected checks. Independent QA then checks printable geometry and actual
artifacts. Contract and security reviewers are not triggered: there are no
changed shared/external software contracts, executable dependencies, secrets,
trust boundaries, deployment or security behavior; the toy is not a security
device. Documentation-writer runs once after assurance. Parent retains acceptance.
Repeat a correction/assurance cycle only for confirmed required-check failure,
regression or blocked behavior, not speculative preferences.

No unit tests or conventional test-first stage: prohibited by repository policy.
Use source assertions, calculations tied to generated geometry, bounded CSG/PNG
inspection, and temporary mesh inspection where needed; no generated exports
enter Git. Every render is hard-limited with `timeout 15s`; a timeout is missing
evidence, not success. Split inspection by safe/group/part within the approved
modes instead of extending runtime. If coverage cannot be completed, retain DRAFT.

Run from implementation root, with temporary outputs under `/tmp`:

```sh
git diff --check
timeout 15s openscad -o /tmp/nested-safe-default.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'render_mode="assembly"' -D 'assembly_view="nested"' -o /tmp/nested-safe-nested.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'render_mode="assembly"' -D 'safe_index=1' -o /tmp/nested-safe-1.stl designs/nested_bank_safe.scad
```

Planning capability probe: OpenSCAD 2021.01 and timeout are installed. Neither
a display server nor xvfb-run is available, and direct PNG export fails to
create its OpenGL view. Headless STL export of the existing wardrobe rod works.
Use OpenSCAD-generated meshes and a temporary Python-standard-library software
rasterizer under `/tmp` (ASCII/binary STL triangles, orthographic projection,
depth buffer, PNG encoding via struct/zlib) to produce inspectable previews.
This is a validation utility, not a repository dependency or a unit test.
Verify its projection on known mesh bounds and show front/side/isometric views;
numeric mesh measurements and source sweep analysis remain independent evidence.
If this route cannot faithfully show a required feature, report missing evidence
rather than substituting CSG parsing for visual validation. No system package
installation is authorized or required by this plan.

Execute bounded CSG and STL command forms for every safe and every nonempty
print group, then inspect software-rendered PNGs, not just exit codes. Log each
safe_index=1..5 and print_group=body/door/mechanism/details selector combination,
its output path, exit status, diagnostics and visual findings; log any bounded
part_id subdivision used to meet the time limit. Rendering diagnostics
must contain no unknown variables, failed assertions, missing font/glyph or
invalid geometry warnings. Use bounded per-part STL generation in
`printable_layout` when solidness/contact cannot be resolved visually; inspect
the artifact before accepting it. Do not call such commands unit tests.

Coverage matrix to record in PLAN execution evidence:

- All 20 safe/group combinations: correct parts/counts, no overlaps/floating
  objects, Z=0 stable contact, no oversized group; empty groups documented.
- Each safe: closed/latched, closed/unlatched, partially open and fully clear
  door; each latch at travel limits and intermediate 15-degree increments.
  Inspect sliding bolt motion including guide contact and catches. Supplement
  samples with analytic sweep bounds so collisions between samples are covered.
- Four nesting transitions: closed full stack and staged straight extraction
  with parent fully open; envelope and throat values, hinge/trim clearances,
  and finger-recess access. Check complete extraction swept prisms analytically.
- Safe 5: shut/first-reveal/secret-open states, slide captive at both ends,
  no interference, pocket dimensions, exact visible messages and blank exterior.
- Actual glyph width/height/strokes, retention interfaces, pin coaxiality,
  physical assembly access and reverse disassembly sequence for all mechanisms.
- Invalid selector, negative wall, and deliberately oversized child input
  fail source assertions through bounded OpenSCAD invocations. These are
  direct parameter checks, not a unit-test suite.

Physical printing, Bambu Studio slicing, fatigue and material-fit measurements
are not performed by this plan and are not claimed. README must require maker
slicer inspection and mechanism test prints before trusting physical operation.
CAD completion means modeled geometry acceptance only. Failed CAD criteria
cannot be relabeled as maker validation to bypass them.

## Requirement-to-delivery trace

Precise SPEC headings/bullet anchors identify requirements without editing the
approved SPEC to add IDs. SCAD below means `designs/nested_bank_safe.scad`.

| SPEC anchor | Units and paths | Evidence |
| --- | --- | --- |
| Purpose/scope; Definitions, all four terms | U1--U4 SCAD; U6 README | Five independently opening/removable safes; complete parts inventory; all printed, all protrusions budgeted |
| Common rules: parts/assembly, retrieval and throat bullets | U1--U3 SCAD; U6 README | Pin/retainer assembly inspection; 12 x 6 recess and extraction sweeps |
| Common rules: clearances/walls, print orientation | U1/U4 SCAD; U5 QA | Dimension assertions, each part's bed contact and bridge/overhang inspection |
| Common rules: parameters, modes, text/colour separation | U4 SCAD; U6 README | Named groups/part selection, default mode, invalid-input assertions, separable backed plaques |
| Nominal chain: every table row and remaining-budget paragraphs | U1--U4 SCAD | Complete bounds and all four cavity/throat checks; no uniform scaling |
| Nominal chain: Safe 5 message/pocket/glyph paragraph | U3/U4 SCAD | 34 x 55 area, 30 x 40 x 3 clear pocket, measured text geometry |
| Safe 1, every bullet | U2/U4 SCAD; U6 README | Open door, three spokes, rotating independent dial, linked two-bolt latch/catch, exact plaque and industrial details |
| Safe 2, both bullets | U3/U4 SCAD; U6 README | Single driven latch, removal, exact plaque and red/black guidance |
| Safe 3, both bullets | U3/U4 SCAD; U6 README | Quarter-turn latch, removal, exact plaque and grey/contrast guidance |
| Safe 4, both bullets | U3/U4 SCAD; U6 README | Simpler closure, premium trim, removal, exact plaque and black/gold guidance |
| Safe 5, every bullet | U3/U4 SCAD; U6 README | Blank gold exterior, working door, first message, subtle captive secret slide, second message |
| Exclusions, all bullets; Regression boundary | U0/U7 parent; U6 README | Scoped diff; no exports/dependencies/hardware or security/physical claims; existing designs unchanged |
| Acceptance: source/BOM, assertions, renders, sweeps, diff check | U1--U5/U7 SCAD and PLAN evidence | Full coverage matrix, actual reviewed artifacts, commands/outcomes, final diff check |
| Acceptance: README guidance; no tests | U6 README; U7 parent | Complete assembly/printing/colour/material instructions; unit tests inapplicable |

## Stop conditions and Definition of Done

Stop for required behavior changes, unsatisfied fit/text/sweep requirements,
missing validation capability, unsafe worktree state, overlapping edits,
unresolved Git divergence or push failure. Preserve exact evidence and remaining
criteria in a blocked DRAFT; no reduced wall thickness, enlarged outer envelope,
removed mechanism or erased acceptance check as an implicit workaround.
Before stopping, complete independent safe work. Specialist timeouts alone are
scheduling/repartitioning events, not completion or missing authority.

Done requires every trace row and QA check satisfied, supported findings
resolved, README synchronized, artifact approvals retained with truthful execution
evidence, no unrelated changes staged, accepted commit verified on origin/main,
and clean final worktree reconciliation. Do not require a physical print for
CAD delivery or imply that it occurred. No implementation is performed by drafting
or approving this plan alone.

## Plan-assurance evidence

On 2026-10-05 independent native explorer `plan_explorer` and architect
`plan_architect` verified the approved SPEC digest
`b5bf72858bd4955f877c39256ba8bc61ea4ca403e9df23692479d05c4dd614eb`
and initial complete PLAN digest
`25f20dd9edfea3145078ba89d51f46cd31244999f938319231ab745e649de6dd`.
Both inspected the artifacts and repository instructions read-only.

- Explorer found source inventory, ownership, dimension allowances and main
  delivery consistent. Its selector-log clarity recommendation is incorporated
  in validation above. The pending assurance placeholder is replaced here.
- Architect found an explicit decorative-clearance wording conflict: corrected
  above so every protrusion remains included. Its early Safe 4/5 coupled fit
  gate and unambiguous nested-selector semantics are incorporated in U1 and
  Source interface respectively. Neither requires changing approved behavior.
- Parent accepted all supported findings and reconciled them in this revision.
  No actionable review finding remains unresolved. Reviews establish planning
  coverage, not mechanical feasibility; early fit and actual geometry evidence
  remain mandatory implementation work. The software rasterizer is planned
  implementation-time validation tooling, not a capability already demonstrated.

## Implementation execution evidence — 2026-10-09

Fresh-session implement entry verified the Approved SPEC and PLAN above.
Fetched origin; invoking main and refreshed origin/main both resolve to
`0f81642afdebcd4d7f86862ac782f568699935d5`. The specified detached worktree
was created at `/tmp/agent-worktrees/openscad-designs/nested-bank-safe`.
Original invoking artifacts were untracked, with no index entries; no other
invoking changes were present. Recovery copies are retained under
`/tmp/nested-bank-safe-recovery`. Transferred bytes matched these SHA-256 values:

- SPEC: `b5bf72858bd4955f877c39256ba8bc61ea4ca403e9df23692479d05c4dd614eb`.
- Approved PLAN: `d6984ef26bfbb449e61040f2c030f7594f0507c9dd079ae3301748c60c5ee682`.

Unit tests and conventional test-first execution are not applicable under
repository policy. No unit tests were created or run.

U1 initial temporary coupled cross-section work established candidate depth
allocations, but did not pass the early fit gate: rail attachments were only
tangent to shell walls and slide stops had no modeled positive retention.
No production interfaces were fixed and no downstream units were started.
A bounded successor addresses those specific incomplete interfaces. This is
intermediate work, not acceptance or proof of mechanical feasibility.

### U1 coupled fit gate accepted for interface allocation

Parent reconciled the bounded temporary successors and directly completed the
final frozen-source checks. Gate source `/tmp/nested-safe-u1-gate/gate.scad`
SHA-256: `cbb1c563eed7efe1a8281ddbc2b0dd0bf680fb7a9d785184e8345e3292f62880`.
This gate accepts space and interface feasibility, not finished U3 mechanisms.

Safe 4 chamber: x6..47, y3.5..69.5, z2..20 (41 x 66 x 18). Safe 5 is
placed at (6.5,4,2.5), with complete 40 x 65 x 17 bounds. Safe 4's front
allocation z20..27 contains cam z20..22, door z22.35..24.35, hinge axis
(3,23.35) with radius 3 (frontmost 26.35), and handle/retainer reservation
ending at 27. Its side frame reaches z24.35 alongside the recessed door.
Through-side receiver windows preserve the nominal 2 mm primary walls and
2 mm stock ahead of the window; they do not depend on a 1 mm remaining wall.
The cam reaches x47.65 into the frame at x47..49 and retracts by quarter turn.
The child's finger recess is x20.5..32.5, y59..65, z11.5..17.5 in parent
coordinates: 12 x 6 mm, laterally separate from the closure at x42..47.65.
The rigid lip is connected to the child's top rim.

Safe 5 depth allocation (mm): rear wall 0..2; second backing 2..2.8;
second relief 2.8..3.4; clear pocket 3.4..6.4; first backing 6.75..7.55;
first relief 7.55..8.15; cam 8.5..10.5; door 10.85..12.85; knob and lip
no farther forward than 17. The 30 x 40 x 3 pocket is measured above relief.
The first face reserves 34 x 55 mm. The cam reaches x38.65 into a through-side
receiver at x38..40. Frame stock ahead of that receiver is 2 mm, beside the
door. A local upper-right rail relief clears the cam sweep; the lower rail
and left rail remain continuous. A top passage z5.25..8.5 passes the slide's
backing and T-ears; 42 mm travel exposes the complete pocket, retaining 13 mm
rail engagement. A transverse headed printed stop pin and separately printed
C-clip are accessible before installing the door/cam. Remove the clip/pin to
insert or remove the slide through the top passage. Hinge-pin counterbores and
printed clip reservations are accessible before the cam/knob is installed.
The cam/knob gate visualization reserves independently printed keyed parts;
it is not an installable integral cam-and-knob manufacturing part. U3 must
complete their actual retention, stops, and reversible assembly.

Local vector glyphs use 0.82 mm round strokes with 32 polygon segments: actual
minimum polygon width 0.81605 mm, cap height 4.02 mm, seven-letter line width
24.42 mm, and 0.6 mm relief. First message lines are FUCKING / NOSY, / AREN'T /
YOU?; second is UNBELI / EVABLE. with no added punctuation.

Evidence: final Safe 4 and Safe 5 body/door/cam intersections at latch 0 and
90 were empty in 4.579--6.505 s (`freeze-body*_collision-*.log`). Earlier
full-body door sweeps and extraction checks established the hinge relief
pattern; final production sweeps remain required after integration. Individual
body/door/slide/pin/clip mesh evidence is retained in the temporary gate folder.
Parent exported frozen Safe 5 closed assembly in 10.800 s, exit 0, Simple yes,
no warnings; bounds 40 x 65 x 17. Parent exported frozen Safe 4 closed assembly
in 4.987 s, exit 0, Simple yes, no warnings; bounds 49 x 73 x 27. Inspected
`/tmp/nested-safe-inspect/gate4-final-iso.png`, `gate5-final-iso.png` and
`gate5-final-side.png`, generated from these meshes. Software rasterizer
projection/bounds were verified with a rendered 10 x 20 x 30 mm reference block.

Gate-only validation substitution: the full child-text intersection exceeded
15 s. The parent instead intersected the complete conservative 40 x 65 x 17
child envelope box with the unchanged parent parts, using the same placement
and a temporary source copy. Bounded command used assembly,
gate_check=child4_collision, and gate-envelope.scad; exit 1 in 4.740 s,
`Current top level object is empty`, no warnings. Empty intersection against
the entire box proves a stronger containment separation than inspecting only
its included child parts. This substitutes only the coupled gate intersection,
not any required final manufacture, nesting or visual coverage. Exact endpoint
contact witnesses are not accepted as manufacturing meshes; clean individual
parts and closed assemblies provide separate solid-geometry evidence.

Gate acceptance permits U1 shell/hinge interfaces to proceed. All final source
interfaces, mechanisms, complete motion sweeps and QA remain outstanding.

### U1 production handoff

Verified frozen source digest
`810f6ae70e8a433f4a94c3252e89917ba05e5aa85afed4a4404f77bde738469b`.
Production shells use independent complete-envelope/chamber/throat/front/hinge
records. Door panels are flat separate parts; two full-ring C-shaped hinge
leaves per safe attach through four printed retention pins and four clips.
Leaves slide over the panel edge before pins/clips are installed; only then
is the door mounted with its headed hinge pin and clip. Reverse that order
for disassembly. Integral barrel truncation was rejected because it left
0.15 mm bearing stock. Safe 5 leaf pin holes were moved to x6.5 and leaves
widened to x8.7; counterbores that weakened the fore flange were removed.
Static leaf-retainer head/clip axial allowance is a named 0.05 mm exception;
free-running interfaces remain nominal 0.35 mm. Proud heads stay in the
complete envelope (Safe 4 maximum z27).

Safes 1--4 use actual roof-open hook recesses, each 12 x 6 x 6 mm; origins
are (36.5,89.5,67), (29.5,80,46), (23.5,71.5,31), and (18.5,63.5,19.8).
Safe 5 retains (14,55,9). Rigid cap depths are 2/2/2/1.2/2 mm; Safe 4's
1.2 mm mechanical grip beam is not a primary shell wall or flexing hinge.
Primary chamber walls remain 2 mm. Retained lips lie outside their own
extraction throats, and the front approach lies inside the containing
parent's open throat. Recess/boxed-child and recess/interior-body checks
were empty. Safe 4 recess begins at z19.8, beyond its child's z19.5 bound.

Bounded final-source Safe 4 and 5 body/door/leaves/pins/clips intersections
were empty at 0,15,30,45,60,75,90,110 degrees: exit 1 solely for empty
export, no warnings, 3.476--4.127 s. Safe 4's full 41 x 66 throat prism
clears at 110 degrees, empty in 3.062 s. Safe 5 has no child throat.
These establish hinge geometry; future latch sweeps remain required.
Evidence: `/tmp/nested-safe-u1-final/final-motion-*.log`, `final-throat-4.log`,
`recess-child-*.log`, `recess-interior-*.log`, body/door meshes and previews.
The final body/door meshes were clean and visually inspected. Earlier combined
sweep exports timed out and were replaced with bounded per-angle geometry
checks, supplemented by the source's conservative sweep-relief calculation.
Parent additionally rendered default Safe 1 body: 0.649 s, exit 0, Simple yes,
no warnings, `/tmp/nested-safe-inspect/u1-body1.stl`.

Safes 1--3 complete manufacturing/motion coverage and corrected loose-part
inspection remain in final combined assurance. All U2--U4 integration, QA,
documentation and delivery criteria remain required.

### U2 drive and operating-part handoffs

Frozen U2 source digest:
`c9703127da49dc4b6bf138c2b42c010e4f9632b87da33678063cbfd6ed99acec`.
Peg phase 225/45 degrees, radius 9 mm, provides nominal bolt travel
`9*(cos(45)-cos(45+angle))`: 0/6.364/12.728 mm at 0/45/90 degrees.
Left tip 10..22.728 and right tip 84..71.272 retract inside throat 11..83.
Fixed Y bands 24.7..31.935 and 40.065..47.3 stay disjoint. Rotor occupies
z57.35..59.35, sliders z59.7..61.7, and guide plate z62.05..63.25.
Guide X14..82.65/Y20..52 has four closed mount bores and windows leaving
0.8 mm upper capture at both bolt edges. Guide/drive intersections were
empty at 15-degree increments; individual rotor, bolt and guide meshes
were clean, inspected, and plate-supported. Earlier drive mesh previews
preceded the final corrected guide windows and are not final evidence.

Four guide pins, four clips and four separately printed 0.35 mm washers
mechanically mount the guide to the detached door. The handle axle has a
7 mm head seated in a rear rotor counterbore at z57.4..58, outside the
reserved child chamber; its keyed shaft and positive sleeve/handle
shoulders and front clip constrain axial travel. A radius-10.5 upper-left
stop peg runs in the guide's quarter-circle slot. Three spokes are
separately printed with the keyed handle; no gearing, springs or bearings.
Eight retained-drive part meshes succeeded without warnings in 0.02--0.31 s;
assembly CSG at 0/90 passed. Handle, guide and axle bounds remain within
z75. Retention handoff digest was
`9944cd157dafad07f361d7e8304685f7eea6ef133a3d52cbafc91e8ba141796f`.

Rigid rotor catch uses a sliding tongue at z58.15..59.35, lower keeper
z57..57.8 and upper channel z59.7+, maintaining 0.35 mm running gaps.
The front control spans x67..73 latched and x71..77 released, beyond the
handle's x65.5 sweep. Source rejects rotation with catch engaged. A separate
keeper, two pins and two clips permit assembly before the guide is mounted;
clips sit at z57.25..57.75, with positive end collars. The independent dial
uses a 4 mm axle in a 4.7 mm bore, front shoulder z65.95 and rear clip
z62.55..63.25, with 0.35 mm running gaps to the door. Catch L-profile and
dial broad print faces were inspected after correcting the catch profile
so every piece shares its plate-contact face.

Evidence folders: `/tmp/nested-safe-inspect/u2/` and
`/tmp/nested-safe-inspect/u2-final-*`. All commands bounded by 15 s, no unit
tests. Final integrated operating sweeps, keeper-access inspection, complete
quantities/layout, independent review/QA and README remain required. A catch
comment stating x68..76 is stale; U4 must synchronize it to actual x67..77
across the full stroke.

### U3 closure and secret-slide development

Frozen source after U3c:
`a19e039b550f2e971bf8ce47f4f90bfe9b318427b0143059e17460da6fb6e02f`.
Safes 2--5 use separate keyed cams, headed D-flat axles, successively smaller
knobs and positive front clips. Axes are (63,34), (51,34), (42,34), (32,31).
Swept receivers preserve 2 mm front frame stock. Sixteen individual mechanism
exports and twelve assembly CSG states succeeded; twelve body/closure
intersections at 0/45/90 degrees were empty. Safes 2--4 full-throat checks at
110 degrees were empty. The Safe 5 chamber probe was nonempty and is not
claimed as child-extraction evidence. Temporary evidence: `/tmp/nested-safe-u3a-*`.
Parent inspected the Safe 4 cam preview and numeric plate contact for sampled
cam parts. All intermediate exports remain development evidence; final integrated
coverage is still required.

Safe 5 has a separate second-message backing, captured by rails and an upper
ear retained by the shared transverse stop. Second backing/text remain at
z2..2.8 / 2.8..3.4; the clear pocket is x5..35, y5..45, z3.4..6.4.
First backing/text remain at z6.75..7.55 / 7.55..8.15, with a 34 x 55 mm face.
Stop axis remains y49.75/z5.65, diameter 1.5 mm, headed and separately clipped.
The first plaque slides 42 mm with 13 mm rail engagement at its physical stop.
The original integral rear T-ears failed broad-face print orientation and were
replaced by two detachable C-cleats, four headed pins and four clips. Cleats
print fore-face-down; the plaque prints broad backing down. Rear tabs retain
the accepted rail/stop interface; pin positions y47.5/53 stay outside the
pocket and stop. Named static edge clearance 0.05 mm, mechanical flange stock
0.55 mm and radial snap clearance 0.15 mm are explicit non-primary-shell
exceptions. Main shell walls and running-interface clearances remain unchanged.

Five corrected slide-part meshes were clean, one connected component each,
Z minimum within 0.000001 mm of zero, with plate vertices. Slide and cleat
previews were inspected; parent additionally inspected the connected second
message backing and its lettering/retention ear. Moving slide/cleats/retainers
versus body/second message/stops at 0.35 and 41.65 mm were empty without
warnings in 10.143 / 10.026 s. Exact end-stop contacts at 0/42 produced
degenerate diagnostic intersection meshes earlier; they are not accepted as
manufacturing meshes. Physical end stops remain modeled and their endpoint
contacts require separate final inspection. Open-door/slide-42 assembly CSG
passed. Evidence: `/tmp/u3b-evidence.txt`, `/tmp/u3c-evidence.txt`, `/tmp/u3c/`.
All renders used 15-second limits; no unit tests. Full combined motion, pocket,
selectors, inventory/layouts, independent review/QA, README and delivery remain.

Checkpoint reporting instruction received during execution on 2026-10-09:
sequential numbered parent progress summaries include completed/upcoming scope
and verified commit/push status. Checkpoints 01/02 reported not committed,
not pushed. This changes reporting only; all approved delivery criteria remain.

### U4 integrated source and print-group development

Pre-assurance source digest:
`5ddaeac46995919ee52af4e4d40e7e266ef0240cb2582ab8536d600c8cb417f7`.
Self-contained vector lettering covers every exact exterior/interior message,
including the em dash, apostrophe and punctuation; unsupported glyphs assert.
Backed exterior plaques and separate connected trim use two diagonal headed
pins/two rear clips per safe. Rear clip/collar bounds exclude child chambers.
Safe 5 has no exterior text or exterior trim. Industrial Safe 1 frame/ribs and
premium Safe 4 frame are separate colourable parts. Initial trim interference
with four Safe 1 guide heads was corrected with 2.05 mm-radius clearances and
connected pads; corrected trim remained one clean plate-supported component,
and its full mechanism intersection was empty in 7.612 s. Safes 2--4 exterior
mechanism intersections were empty. Separate trim/hinge-leaf intersections
confirmed Safe 3/4 overlaps; connected inward rails and local reliefs corrected
them, with final intersections empty for all four exterior-detail safes.
Evidence: `/tmp/u4a-*`, `/tmp/u4b-*`, `/tmp/u4d-final-exports.json`.

Assembly passes explicit active latch/slide/catch states; nested descendants
remain closed and latched, selected ancestors are omitted, and extraction moves
the complete immediate child subtree. Source rejects latched opening, invalid
secret reveal, negative extraction, Safe 5 extraction and extraction before
110-degree full clearance. `show_guide_plate` is assembly inspection only;
manufacturing always includes the guide. Six valid state CSG exports passed,
and five impossible-state invocations emitted the expected assertions. CSG
assertion runs can return zero; diagnostics, not exit status alone, establish
rejection. Evidence: `/tmp/u4b-{default,closed_stack,active2,active4,reveal5,guide_hidden}.log`
and `/tmp/u4b-bad_*.log`.

`printed_inventory(i)` is the single [ID,quantity,group] authority. Safes have
47/24/24/24/32 printed components (151 total). Group counts are body1, door3,
mechanism37/14/14/14/26, details6/6/6/6/2. All required quantities appear once,
while individual `part_id` filters emit one part. XY-normalized helpers use
3 mm shelf gaps and a 5 mm origin margin. All 20 CSG and all 20 STL exports
at source `6f59d42c99c4efbd69a35ae788197380025eee6a0501daeaf01402fb8e28f6b2`
succeeded, maximum 8.562 s, Simple yes, no warnings/errors. Every component
matched its inventory, had Z=0 contact within 1e-5 mm, fit within 246 x 246 mm,
and had no overlapping XY component bounds. All 20 software-rendered previews
were inspected by the developer and parent; tall pins use their broad headed
ends. Evidence: `/tmp/u4c-collection.json`, `/tmp/u4c-matrix-summary.json`,
`/tmp/u4c-all-mesh-stats.jsonl`, `/tmp/u4c-previews/all20.png`.
Four invalid safe/part combinations asserted, and quantity-four selectors
exported one component each (`/tmp/u4c-selectors/summary.json`).

Separate parent fit checks found closed door/frame overlap in Safes 1--3;
print-group success did not establish assembly fit. A front-only left-edge
pocket, before unioning fixed hinge barrels, corrected the overlap without
moving doors/pins or changing child chambers/envelopes. All 24 body/door
intersections at 0/15/30/45/60/75/90/110 degrees were empty. Corner analysis
then identified a continuous gap below the nominal budget, including Safe 4.
The pocket for Safes 1--4 now starts at hinge-axis X + 2.65 mm: front corner
radius sqrt(2.65^2+1.35^2)=2.97405447 is inside the retained 3 mm barrel radius;
minimum rotating panel radius is 3.35 mm. Corner gap is at least 0.37594553 mm,
barrel gap nominal 0.35 mm, rear-plane gap 0.35 mm; Y rotation preserves roof
and floor gaps. Front left stock is 8.15/7.15/6.15/5.65 mm, with unchanged
primary rear/side walls. At the final source, all 16 body/door and all 16
0.3 mm-expanded hinge-edge intersections at 0/18.435/45/110 degrees were empty.
Four body meshes retained exact envelopes, one connected component and plate
contact; five earlier changed body/detail groups and all final body previews
were inspected. Evidence: `/tmp/u4d-intersections.json`, `/tmp/u4d-measurements.json`,
`/tmp/nested-safe-inspect/u4e/` including `proof.txt`.

All development renders were limited to 15 seconds; unit-test/test-first phases
remain inapplicable. Parent `git diff --check` passed. Independent integrated
review, consolidated correction assessment, final QA/motion/extraction/retention
coverage, README synchronization and verified main delivery remain required.
Checkpoints 03/04 reported development progress and not committed/not pushed.

### U5 independent review and consolidated correction

Independent native code reviewer verified source/SPEC/PLAN hashes and reviewed
complete source against the requirement trace, mechanisms, pocket, selectors,
retention, inventory and manufacturing transformations. One supported P2 finding:
subtraction rounding made the nominally permitted 0.3 mm radial-clearance
comparison fail for Safe 3. The consolidated correction adds only 1e-9 mm
arithmetic comparison tolerance; it does not alter any physical geometry or the
0.3 mm minimum. Corrected source digest:
`60a7317d797447dadc38be62ffd360e81f503841c6be709eb5b1364a5c1d298b`.
All five safes at 0.3 mm passed without diagnostics; 0.35 mm Safe 3 passed with
identical prior/corrected CSG hashes; 0.29 mm correctly rejected the clearance
budget. A 0.4 mm Safe 3 combination fails a separate child-chamber allocation
assertion, reproduced in the prior source. Parent disposition: this is correct
protection against an incompatible parameter combination, not permission to
consume nesting allowance; 0.35 mm defaults are the approved validation baseline.
README must explain coupled allocations/assertions rather than promise every
combination within individual scalar ranges. Evidence:
`/tmp/nested-safe-radial-clearance-review/results.json`.
No additional supported review findings. Contract/security remain inapplicable.
Final independent QA and documentation remain required.

### Implementation-required PLAN amendment A1 — 2026-10-09

Approval: Automatically approved under the originating `$implement
specs/PLAN-nested-bank-safe.m` request by the user's replacement AGENTS.md
instruction on 2026-10-09: required implementation amendments are automatically
approved after valid entry, with artifact generation and required assurance in
the same session. This complete effective PLAN is the original approved PLAN
plus this amendment; previous content/status/approval evidence remain unchanged.
SPEC behavior, scope, dimensions, acceptance, assurance roles and delivery are
unchanged. Delta: bounded assembly visualization export mechanics only.

Old complete-assembly STL command, for example:
`timeout 15s openscad -D 'render_mode="assembly"' -D 'safe_index=1'
-D 'latch_angle_deg=0' -o /tmp/nested-safe-integrated/1-closed.stl
designs/nested_bank_safe.scad`.
Actual Safe 1 and Safe 5 closed/open complete assembly exports timed out with
exit 124 at 15.010--15.013 s; no usable mesh evidence is claimed. Safes 2--4
closed/open exports succeeded, Simple yes, in 7.841--10.418 s.
Commands/diagnostics: `/tmp/nested-safe-integrated/assemblies.json`.

New equivalent procedure: retain direct full-state CSG commands and all 20
clean manufacturing-group STL requirements. For timed-out assembly meshes,
copy the frozen production source prefix before `// Output dispatch` without
changing any definitions, globals, dimensions or part geometry. Append only
one selected actual assembly module group (body; door including leaves/pins;
stationary hinge pin/clip; transformed mechanism; transformed exterior details;
Safe 5 secret parts). Render each at identical requested state using
`timeout 15s openscad -D 'render_mode="assembly"' -D 'safe_index=...'
-D 'latch_angle_deg=...' -D 'door_angle_deg=...' -D 'secret_slide_mm=...'
-o /tmp/qa-unit.stl /tmp/qa-frozen-component-selection.scad`.
All groups must be enumerated, with no omitted guide/retainer/plaque. Combine
unchanged triangle coordinates for assembly visualization and numeric envelope
measurement; nested views translate each complete closed child mesh by the
source's exact accumulated child placements and extraction offset. No Boolean
solidness or collision result is inferred from concatenation: retain separate
clean manufacture meshes, actual bounded intersection diagnostics, analytic
continuous sweep checks and independent QA for those acceptance criteria.

Equivalence evidence: all groups call the same production assembly modules and
transforms. Temporary compositor records every input hash, offset and triangle
count; it only copies/translates vertices, introducing no simplified geometry.
The independent numeric inspector verified the known 10 x 20 x 30 mm reference
cube translated by (1,2,3), producing bounds (1..11,2..22,3..33) and the same
12 triangles. Temporary utilities:
`/tmp/nested-safe-inspect/compose_mesh.py`, `render_mesh.py`, `mesh_stats.py`.
Final QA must verify part completeness/coordinates and inspect actual composite
PNGs, including closed full stack, extraction and secret reveal. A physical
end-stop contact at exactly 42 mm remains required evidence; a 41.65 mm preview
may show the fully exposed pocket before intentional stop tangency, with the
42 mm position inspected separately via CSG/endpoint geometry. This preserves
all acceptance coverage, evidence strength, assurance and permitted effects;
no timeout is relabeled success, no required check is removed, and no physical
print/slicer/material claim is introduced. All exports remain under /tmp.


### U5 final QA and qualifying mechanical correction — 2026-10-09

A1 preceding complete PLAN SHA-256: `2d9a96170506bb7d7a82069bf3c4e69eed5c7e46f4f0f51604b2b8ae786cdb27` (bytes before A1).
A1 effective scope is the original approved PLAN plus its bounded visualization
substitution, preserving every criterion, role, effect and delivery boundary.
Independent explorer and architect assurance inspected timeout commands,
compositor implementation, reference cube and all nine nested manifests.
They found no blocking substitution defect. Their evidence qualification is
accepted: the 20-group manufacturing matrix belongs to source `60a7317d...298b`,
not a later source. It contains 20 CSG and 20 STL successes, not 40 STLs.
Six full assembly STLs (Safes 2--4 closed/open) passed; four (1/5 closed/open)
timed out. No timeout or triangle concatenation proves solidness/collision.

Independent print QA at source `60a7317d...298b` checked all 20 groups,
151 connected parts (47/24/24/24/32), bed contact for every part, no XY overlaps,
246 mm group bounds, glyph dimensions and six invalid-input assertions.
Actual glyph cap height 4.01998451 mm, relief 0.6 mm and minimum round-stroke
caliper 0.816051475 mm; exact message strings remain unchanged.
Evidence: `/tmp/nested-safe-qa-prints/report.json`, `collection.json`, `matrix.png`.
Source-backed continuous sweeps and actual bounded intersections verified all
five latch positions at 15-degree increments, door states, Safe 1 guide/bolt
travel, catch release, throat/extraction and finger access. Empty diagnostic
intersections may exit 1; only explicitly classified contact surfaces are
accepted as zero-volume, never as successful manufacturing exports.

Final QA confirmed Safe 5 closed rear leaf overlapped its left upper secret
rail. Benefit: restore required door operation. Impact: left nonprimary capture
cap thickness only. Severity: blocking modeled-function defect. Classification:
in-scope correction, not changed specified behavior. Native developer retained
full 1.85 x 55 mm rail width/length and set named left cap height 0.45 mm,
top Z8.95; moving leaf minimum Z9.3 gives 0.35 mm continuous clearance.
Primary walls, right rail, captured overlap, pocket and messages unchanged.
Independent code review found no supported regression. Independent affected QA
at source `d03284d722c84097b1af569211314dad4b4b337f5707a7572dbc4bfdcc95ce12`
rechecked all eight door angles, closed latched state, expanded 0.3 mm cap,
body manufacturing one-component/40 x 65 x 17/Z0, secret retention and visuals.
At travel 42 mm the first stop has zero-volume contact; 42.1 mm gives
0.0964172 mm3 interference. Second plaque 0.5 mm travel clears, 1.1 mm gives
0.000159068 mm3 stop interference. Pocket 30 x 40 x 3 mm above text is clear;
text tops only touch Z3.4, interior probe is empty. Entire child 5 extraction
prism and 12 x 6 mm finger corridor clear all parent 4 groups.
Evidence: `/tmp/nested-safe-u5-rail/`, `/tmp/nested-safe-qa-safe5-final/`.
Thin cap stock remains a maker slicer/material check, not physical assurance.

All nine current-source nested CSG commands and composed closed/partial/complete
views passed independent QA; complete full-stack bounds remain 85 x 100 x 75 mm.
Exact accumulated placements: [0,0,0], [11.5,5,2.5], [21,9.5,5],
[28.5,13.5,7.5], [35,17.5,10]. Source/component manifests record all parts,
actual coordinate translations and input hashes. Safe 5 has intentionally no
exterior details. Evidence: `/tmp/nested-safe-qa-nested/results.json`.
Safe 2/3 actual closed/open views and source-backed retainer access/reversal
passed: `/tmp/nested-safe-qa-retention/qa-report.md`.

That QA confirmed one additional installation obstruction: Safe 1's round
4 mm terminal axle collar cannot pass the rotor/handle 3.7 mm keyed-bore flats.
Both actual insertion probes produced 0.0715614 mm3 interference. Benefit:
restore specified printed-only rigid assembly; impact: terminal collar profile
only; severity: blocking assembly defect; classification: in-scope correction.
Accepted correction: terminal collar uses the same 4 x 3 mm keyed profile as
shaft, preserving 0.35 mm bore allowance and positive C-clip arc bearing.
Temporary QA proof is not final production evidence; fresh developer correction,
independent review and affected manufacturing/insertion/retention/assembly QA
remain required. Other frozen source definitions are preserved.
No unit tests, slicer runs or physical printing have been performed or claimed.
Documentation and authorized verified main commit/push/cleanup remain required.


### U5 accepted final production geometry — 2026-10-09

Final source SHA-256:
`a242ccb95a43674dbe24f57d8adf6543907bccfe75804ae9627e10f9e10c0205`.
The native developer changed only Safe 1 terminal collar profile and comment.
Independent correction review found no supported regression: constant keyed
bores permit 0.35 mm per-face passage over the matching 4 x 3 mm collar;
closed clip arc has positive shoulder overlap, unchanged 0.05 mm axial gap.
Collar is contained in the prior cylinder, preserving envelopes and sweeps.
Final affected native QA independently regenerated insertion probes, positive
bearing, the mechanism group and actual closed/open drive compositions.
Mechanism STL Simple yes in 7.785 s: 37 components, every component on plate,
no XY overlaps, within 246 mm. Developer/QA triangle sets match despite differing
STL ordering/hashes. Closed/open and nested fullclosed/active1 partial/complete
actual ISO images were refreshed and inspected. Evidence:
`/tmp/nested-safe-u5-collar/`, `/tmp/nested-safe-qa-collar-final/report.md`.
No supported finding or assigned modeled-geometry check remains unresolved.

Assembly-only nonmanifold warnings were independently classified, not ignored:
actual rotor/guide unions at 0 and 90 degrees show intended endpoint stop
contact; at 45 degrees they are Simple yes. Fresh endpoint intersections are
empty. Dial/clip shoulders intersect only at the zero-thickness Z62.55 and
Z63.25 contact planes. These are visual assembled-part contact diagnostics,
not printable meshes. Every accepted manufacturing group remains Simple yes.
The source, physical clearance budget and printed parts are not changed to
make touching assembled components a single manufacturing solid.

Final manufacturing coverage reconciliation: the all-20 matrix at source
60a7317d...298b plus exactly two affected-group refreshes establishes all 20
final groups. Full source comparisons establish only Safe 5 body rail-cap and
Safe 1 mechanism terminal-collar geometry changed. Other 18 groups retain
identical definitions, layout transforms, quantities and geometry. Fresh Safe 5
body evidence at d03284d7...ce12 remains applicable after the Safe 1-only edit;
its source call path is unchanged. Fresh Safe 1 mechanism is at final a242...
source. No older matrix is claimed to be a complete final-source rerun.
Final-source default and Safe 5 body direct CSG commands passed without logs:
`timeout 15s openscad -o /tmp/nested-safe-final-default.csg designs/nested_bank_safe.scad`
and `timeout 15s openscad -D 'render_mode="printable_layout"' -D 'safe_index=5'
-D 'print_group="body"' -o /tmp/nested-safe-final-body5.csg designs/nested_bank_safe.scad`.

Parent accepts U5 within CAD scope against every requirement trace and QA row.
SPEC remains byte-identical to the approved document. A1 remains the only
automatically approved amendment; its required explorer/architect assurance and
independent implementation QA are complete. Contract/security and unit-test
phases remain inapplicable. Bambu slicing, actual prints, material strength,
snap installation, fatigue and physical fit are expressly unverified under PLAN.
U6 README synchronization and U7 main delivery/verification/cleanup follow.


### U6 documentation acceptance and U7 delivery preparation — 2026-10-09

One required native documentation-writer synchronized README after U5 final
assurance. Parent reviewed the additive section against final source and corrected
wording about the independent dial, single-copy part selection, retainer access,
hinge installation order and classified contact warnings. No source semantics
changed. All previous README bytes remain unchanged except the additive design
list entry; the new section supplies dimensions, every printed inventory ID and
quantity, 151-part group totals, modes and motion, exact labels/messages,
assembly/reversal, shell-lip retrieval, materials/AMS colours, stable orientation,
thin-feature slicer checks, coupled assertions and CAD/physical limitations.
Accepted README SHA-256: `bafddda110b0711084a4c57b1f10342fc5af91e8d53d05ecddefd3969f744883`.
New documented Safe 4 extraction and Safe 5 full-secret CSG examples passed
bounded final-source commands without diagnostics. Parent git diff --check passed.
Unit tests remain prohibited and were neither created nor run.

U0--U6 are complete within modeled CAD acceptance scope; original physical/slicer
exclusions remain unchanged. U7 transfers exactly README.md,
designs/nested_bank_safe.scad, specs/SPEC-nested-bank-safe.md and this PLAN to
invoking main after checking its original bytes/index/base. Stage only these
four paths and verify full staged diff/check, then commit on main, push
origin/main, independently verify remote/upstream accepted commit and reconcile
this temporary worktree cleanly before non-forced removal. Git and the final
execution receipt prove those subsequent effects; this pre-commit record does
not invent a future commit SHA or claim an unperformed push/cleanup.

Final pre-commit documentation check explicitly names the approved P2S
0.4 mm nozzle target. This is requirement synchronization only. Final accepted
README SHA-256: `b96c5309c467943f0821f0f52a9966eb3b30a543e011a9bc30512398e9c131e6`. No geometry or prior record changed.
