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

## Amendment 2 — 2026-10-09 — Complete-set printable batch

Amendment ID: PLAN-nested-bank-safe-A2
Approval: Explicitly approved by the user with "approve" on 2026-10-09;
complete effective PLAN (original plus A1 plus A2).

### Authority, delta and evidence boundary

Implement the original SPEC plus explicitly approved SPEC-nested-bank-safe-A1,
complete approved file SHA-256
`49993eff109e8005a0577c6bb7a9d264d53f80ec784c7f88595417c5f9959272`.
The user selected a complete set split into plates as needed and approved that
SPEC with "approve" on 2026-10-09. This proposed PLAN adds the implementation
units below; original PLAN text, execution history and automatic A1 remain intact.
Their historical implementation is already delivered; do not redo it. Where
this amendment changes printable selection and allocation, its explicit delta
supersedes the old selected-group-only implementation instructions. All geometry,
manufacturing transforms, inventory quantities, messages and mechanism behavior
remain the current delivered source's authority.

Research snapshot: local main and cached origin/main at
`5f05c05f5489464c567f5d05df836d0a4d257e00`; no live remote refresh during iteration.
Source baseline SHA-256:
`a242ccb95a43674dbe24f57d8adf6543907bccfe75804ae9627e10f9e10c0205`.
README baseline SHA-256:
`b96c5309c467943f0821f0f52a9966eb3b30a543e011a9bc30512398e9c131e6`.
Prior complete PLAN SHA-256:
`8c10e76e262749f17b1e7b28311db40ab46317cb435de7e71b53bcfcd472e703`.
Limit implementation evidence to current inventory, footprints, manufacturing
transforms, dispatch, and printing guide; no new product or mechanism research.

### Deterministic implementation decisions

Add top-level adjustable `print_scope="selected_group"` and `plate_index=1`.
Keep `render_mode="printable_layout"` and all other existing defaults unchanged.
New scope/index validation applies only to printable_layout; assembly and
individual-part dispatch ignore these controls. Preserve legacy selector
validation. Complete-set printing requires empty part_id and ignores valid
safe_index/print_group as filters; selected_group retains its current dispatch,
including explicit printable part selection, and ignores plate_index.

Flatten printed_inventory for safes 1 through 5 into occurrence records ordered
by safe, existing inventory row, then ascending copy number. Reuse existing
part_footprint_mm and u1_print_part without modifying part geometry or orientation.
Each output placement contains safe, part ID, copy number, plate, x and y.

Use translation-only shelf packing, starting plate 1 at x=5,y=5,row_height=0.
Require positive finite footprint dimensions at most 246 mm in each direction.
For each occurrence, wrap to x=5,y=y+row_height+3,row_height=0 when x+width>251.
If y+height>251, start the next plate at x=5,y=5,row_height=0. Place the
occurrence, advance x by width+3 and update row height. Never create empty
plates or silently omit oversized parts. Derive N from the completed placements.
This ordering and allocation are deterministic; no rotation, scaling or plate
count optimization is included.

Echo total plate count and an inventory manifest containing every placement and
its identity/footprint. Require integral complete-set plate_index in 0..N.
Positive indices render only that populated physical plate in its own XY frame.
Index 0 renders every plate in a two-column overview grid with 276 mm stride
(256 mm plate plus 20 mm separation). Retain plate-relative placement, Z=0,
and no plate outlines, text labels or extra printable geometry. README explicitly
identifies this overview as exceeding one physical plate and instructs positive
indices for export. Unsupported scope/nonempty complete-set part_id/invalid
index/oversized footprint assert visibly.

### Units, ownership and sequencing

| Unit | Role and immutable ownership | Prerequisite | Completion and next step |
| --- | --- | --- | --- |
| B0 | Parent: artifacts, baseline and isolated workspace | Valid implement entry after PLAN approval | Refresh/verify origin/main, preserve invoking HEAD/index/content, copy approved artifacts byte-for-byte, archive current source/legacy outputs under /tmp; dispatch B1 |
| B1 | Developer: designs/nested_bank_safe.scad only | B0 verified hashes | Add occurrence allocation and scoped dispatch; preserve geometry/defaults; development checks and manifest evidence complete; freeze integrated diff for B2 |
| B2 | Code-reviewer read-only; bounded developer owns accepted SCAD corrections; qa-agent read-only | B1 evidence and frozen diff | One integrated review wave, consolidated corrections and affected checks, then independent full QA; supported failures resolved before B3 |
| B3 | Documentation-writer: README.md only | B2 passed | Synchronize complete-set usage, plate count/indices, margins and export/AMS guidance; parent verifies semantic agreement, then B4 |
| B4 | Parent: SPEC/PLAN execution records and Git integration/delivery | B3 and all acceptance evidence | Reconcile only four owned paths, commit on main, push origin/main, verify remote containment/upstream and clean worktree removal |

All source mutations and repository checks serialize. Parent gives each fresh
native assignment exact current artifact/source hashes, ownership, criteria,
allowed effects and verified prerequisite evidence. Aim three minutes; interrupt
at five minutes and preserve evidence for a narrower successor. Children never
create worktrees, mutate Git, commit, push or deliver. Handoffs/checkpoints do not
pause execution or create continuation gates.

### Validation and assurance

Retain the original full profile: independent integrated code-review wave,
one consolidated accepted correction batch, affected validation, final independent
QA and one documentation-writer pass. Contract/security reviews are inapplicable:
this delta changes no shared software contract, trust boundary, executable
dependency or deployment behavior. No unit tests or conventional test-first phase,
prohibited by repository policy. No printer/slicer or physical acceptance claim.

Use OpenSCAD 2021.01-compatible syntax, no external dependency or tracked exports.
Every OpenSCAD command uses `timeout 15s`, outputs under /tmp, and only
printable_layout or assembly without electronics. Initial checks:

```sh
git diff --check
timeout 15s openscad -o /tmp/nested-complete-default.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'print_scope="complete_set"' -D 'plate_index=0' -o /tmp/nested-complete-overview.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'print_scope="complete_set"' -D 'plate_index=1' -o /tmp/nested-complete-plate-1.csg designs/nested_bank_safe.scad
```

Read N from the manifest, then run the same positive-index CSG command for every
index 1..N, substituting its index and unique output path. Generate actual mesh
and visual inspection evidence for every plate and the overview. Attempt bounded
whole-plate STL export first. If it exceeds 15 seconds, inspect actual parts in
subdivisions using temporary wrappers containing unchanged production definitions
and recorded occurrence translations. These wrappers set printable_layout and
invoke existing u1_print_part at the exact recorded coordinates; they do not
alter geometry definitions. Combine only those generated meshes for software
rasterized plate/overview inspection and actual triangle bounds. Verify the
wrapper definitions against source, all occurrence identities exactly once,
equivalence to each plate CSG's occurrence/transforms, and manifest totals.
No generated validation utilities enter Git. A timeout alone is missing evidence;
if subdivisions cannot cover every occurrence, acceptance remains blocked DRAFT.

Check generated triangle bounds per occurrence: contact at Z=0, XY within 5..251,
no overlapping conservative footprints and at least 3 mm separation; inspect all
plate and overview images for actual placement/orientation/separability. Verify
all 151 occurrence identities exactly once, totals 47/24/24/24/32, plate indices
contiguous and populated, and repeated identical parameters yield identical
placement/count manifests. Inventory arithmetic alone does not prove geometry.

Compare all 20 legacy safe/group CSG outputs and the default output against the
B0 baseline under identical parameters. If differing CSG formatting prevents
byte comparison, compare actual geometry/transforms with explicit evidence;
do not dismiss geometric differences. Check assembly and individual-part dispatch
statically plus allowed assembly renders with new controls overridden, proving
those controls have no effect there. No forbidden individual-part render.

Exercise assertions with unsupported printable scope, nonempty complete-set
part_id, negative/fractional/out-of-range complete-set index, and oversized
parameter footprint; inspect OpenSCAD diagnostics, since process exit status alone
may not signal an assertion. Also verify selected_group ignores plate_index and
complete_set ignores valid legacy filters while retaining invalid-selector errors.
Compare manufacturing module/transform bodies to the archived baseline; any
geometry change is outside this amendment. Rerun affected checks after corrections.
Parent verifies git diff --check and accepted staging. Full QA concerns record
evidence, impact and disposition; repeat a cycle only for confirmed required-check
failure, regression or blocked approved behavior.

### Requirement-to-delivery trace

| Approved SPEC A1 anchor | Unit/path or preserved outcome | Terminal evidence |
| --- | --- | --- |
| Confirmed behavior 1; inventory acceptance | B1 SCAD; B3 README | Exact 151 identities, per-safe counts, finite populated plates; manual batch guidance |
| Confirmed behavior 2 | B1 SCAD | Defaults/legacy CSG comparisons; assembly dispatch and allowed render invariance |
| Confirmed behavior 3 | B1 SCAD | Filter and part_id assertion checks, retained legacy validation |
| Confirmed behavior 4; preserved geometry/mechanisms | B1 SCAD, existing modules unchanged | Baseline manufacturing-body comparison, occurrence mesh orientations and deterministic manifest |
| Confirmed behavior 5 | B1 SCAD | Actual per-occurrence bounds/contact and conservative separation on every plate; legacy layout comparison |
| Confirmed behavior 6 | B1 SCAD | Manifest N, contiguous nonempty plates, invalid-index and oversize diagnostics |
| Confirmed behavior 7 | B1 SCAD; B3 README | Complete overview images/CSG equivalence, no extra geometry, positive-export warning |
| Confirmed behavior 8; direct dependency boundary | B1 SCAD; B4 parent | One source, compatible parsing, no dependency/export/slicer/printer-control additions |
| Acceptance: generated geometry, bounded renders/subdivisions | B1/B2 temporary evidence only | Every occurrence covered, actual bounds and visual images; no timeout accepted as success |
| Acceptance: git diff and unit/physical exclusions | B2/B4 | diff checks; no unit tests, explicit physical/slicer evidence limits |
| Acceptance: README workflow, count, index 0, positive exports, AMS | B3 README | Documentation inspection against validated source and manifest |

### Workspace, delivery and Definition of Done

Preserve the original exact detached implementation worktree path
`/tmp/agent-worktrees/openscad-designs/nested-bank-safe` and main delivery mechanics.
Refresh origin/main before creation; record its SHA. The snapshot above is not an
execution pin. Stop on failed refresh, unsafe worktree/registration, conflicting
source dependency changes or inability to preserve unrelated state. Reuse only
verified clean state; absent but registered exact path permits guarded non-forced
registration removal and recreation, never unrelated worktree cleanup.

Only designs/nested_bank_safe.scad, README.md and the two nested-safe artifacts
are owned accepted delivery paths. Preserve prior artifact bodies and append
execution evidence. Transfer/reconcile approved artifacts with retained invoking
HEAD/index/content recovery state, never overwrite independent edits. Integrate
the accepted result into local main, inspect staged contents, run
`git diff --cached --check`, commit and `git push origin main`. Verify origin/main
contains the accepted commit and configured upstream is origin/main; remove only
the clean reconciled temporary worktree without force. No PR/task-branch delivery,
force push or administrative bypass is authorized. Unsafe integration/push or
missing evidence retains a recoverable blocked DRAFT with exact unmet criteria.

Done requires every trace row satisfied, all supported findings disposed, QA and
documentation complete, legacy geometry/defaults preserved, all 151 parts evidenced
across selectable physical plates, and verified main commit/push/cleanup. Physical
printing, slicer outcomes and unattended printer execution are excluded as the
approved SPEC states. PLAN approval plus valid implement entry authorizes the
whole remaining lifecycle without routine continuation questions; iteration
itself implements nothing and performs no commit or push.

### Approval record

The user explicitly approved the complete effective PLAN with "approve" on
2026-10-09: preserved original plus A1 plus PLAN-nested-bank-safe-A2, including
the reconciled plan-assurance clarification below. Reviewed proposal SHA-256:
`d062745bd6e85bc6798d5ec27f511b76bfca7acabdee655a92b1415abe644266`.
The paired approved effective SPEC is SPEC-nested-bank-safe-A1 at the SHA-256
recorded above. Document Status and all earlier approval history remain intact.
This records PLAN approval, not implementation entry; implementation requires
new-session/cleared-context entry or explicit same-context consent with implement.

### Plan-assurance evidence and reconciled validation clarification

On 2026-10-09, fresh read-only explorer and architect assignments independently
verified the approved SPEC hash above, proposed complete PLAN hash
`4d7c6ff1ca51ddad5e188743d170afd5decbca3e3c3419de61e18db13d48edc1`,
and both production baseline hashes above. Neither assignment implemented,
rendered, changed files or performed Git effects.

Explorer traced inventory/normalized manufacturing dispatch/analytic footprints
(source lines 913–959) and current per-group README guidance (lines 1987–2009)
to B1/B3. Architect checked the scoped selectors, deterministic translation-only
allocation, subdivision validation, ownership, full assurance and main delivery.
Both found that plate bounds and conservative-rectangle separation alone do not
prove that actual geometry fits its claimed footprint. Architect also identified
the need to explicitly preserve per-part manufacturing solidness during mesh
subdivision. These are supported validation gaps, resolved as follows.

B1 development evidence and B2 independent QA must establish for every generated
occurrence mesh that its actual transformed triangle XY bounds are contained
within the manifest rectangle [x,x+width] × [y,y+height], with only a recorded
small numerical comparison tolerance (at most 0.01 mm), never clearance reduction.
Retain the specified 3 mm conservative rectangle separation. If containment
fails, acceptance is blocked until an in-scope correction of the analytic
footprint/allocation is validated; never change manufacturing geometry to fit.
Every manufacturing mesh must be nonempty, contain no degenerate solid components,
and pass applicable OpenSCAD valid-solid diagnostics and mesh closure/manifold
inspection, including expected connected-component counts from the unchanged
manufacturing baseline. Record any limitations explicitly; concatenating occurrence meshes
is for inspection only and does not establish individual solidness. Check those
properties before composing plate/overview inspection meshes. This clarification
completes the behavior-4/5 and generated-geometry trace evidence without changing
the approved SPEC, ownership, timeout limit, physical exclusions or delivery.

No other supported planning contradiction or missing implementation decision was
reported. Main verified the original committed artifact bodies remain byte-for-byte
prefixes and git diff --check passes. Planning assurance is advisory evidence,
not user approval or proof of generated geometry, slicer behavior or physical fit.


## Amendment A2 implementation execution evidence — 2026-10-09

The originating user request was `$implement specs/PLAN-nested-bank-safe.md`
in a fresh implementation session. Effective entry was the preserved original
SPEC plus explicitly approved SPEC-A1, and the preserved PLAN plus A1 and
explicitly approved PLAN-A2. This execution implemented only the complete-set
layout delta; it did not rebuild or recalibrate the delivered mechanisms.
No new automatically approved SPEC/PLAN amendments were required.

### B0 verified entry and workspace

Refreshed origin/main and local main both resolved to
`5f05c05f5489464c567f5d05df836d0a4d257e00`. Created the exact detached worktree
`/tmp/agent-worktrees/openscad-designs/nested-bank-safe` at that base.
Invoking HEAD/index/artifact bytes were retained under
`/tmp/nested-complete-evidence`; both approved artifact copies were byte-verified.
The only invoking changes were the approved nested-safe artifact amendments.
Entry SHA-256 digests:

- SPEC: `49993eff109e8005a0577c6bb7a9d264d53f80ec784c7f88595417c5f9959272`.
- PLAN: `d3499b42ea3ba02bb669609664de85a875be2ed18ea05c31600f57fb4ed2fc4a`.
- Source baseline: `a242ccb95a43674dbe24f57d8adf6543907bccfe75804ae9627e10f9e10c0205`.
- README baseline: `b96c5309c467943f0821f0f52a9966eb3b30a543e011a9bc30512398e9c131e6`.

### B1 implemented behavior and development evidence

A bounded developer added only selection controls, ordered occurrence records,
translation-only shelf allocation, manifest echoes, assertions and batch dispatch.
Source SHA-256 is
`bc7bea006b66e5a770e5fbb6c916b218df12bbc278c94c3212640ee7159a95bf`.
Nominal result: three populated plates, 151 distinct safe/part/copy identities.

| Physical plate | Occurrences | Generated/inspected evidence |
| --- | --- | --- |
| 1 | 42 | Positive-index CSG; composed mesh; XY and oblique previews |
| 2 | 53 | Positive-index CSG; composed mesh; XY and oblique previews |
| 3 | 56 | Positive-index CSG; composed mesh; XY and oblique previews |
| Overview 0 | All 151 | Production-equivalent CSG; composed mesh; XY and oblique previews |

Per-safe counts are 47/24/24/24/32. All 20 legacy safe/group CSGs retain
exact Boolean geometry/transforms after removing only identity group nodes;
assembly checks and source dispatch inspection preserve assembly/individual-part
behavior. All manufacturing definitions and transforms remain unchanged.

Whole-plate STL attempts for plates 1–3 each stopped at the 15-second limit
(exit 124); none was accepted as a completed mesh. The approved subdivision
route rendered all 96 unique manufacturing parts plus the same 96 baseline
parts with every OpenSCAD invocation limited by `timeout 15s`. Repeated inventory
copies reuse identical verified manufacturing geometry with recorded translations.
All 151 occurrence wrappers contain the exact production definition prefix and
use exact allocator-index placement. The composed meshes match all three
production plate CSGs and overview after removing identity group nodes only.

All 96 current/baseline canonical triangle multisets match. Each has one
connected nonzero-volume component, exact edge multiplicity two and single-cycle
vertex links. All components contact Z=0. Actual occurrence bounds are contained
within footprints and XY 5..251 using the declared 0.01 mm numerical tolerance.
All 3,779 same-plate rectangle pairs retain the nominal 3 mm separation.
The serialization utility rounds once to eight decimal places (maximum error
0.000000005 mm); production wrappers use exact source values. Parent and
specialists inspected all plate/overview images. Validation files are temporary
under `/tmp/nested-complete-evidence/mesh-dev`, notably `summary.json`,
`mesh-statistics.json`, `vertex-link-statistics.json`, `occurrence-statistics.json`,
`equivalence.json` and `validation-notes.json`; none enters source control.

### B2 independent assurance and finding dispositions

One independent integrated code-review wave found no supported source defect
or required correction. Independent final QA then verified inventory identities,
all 96 actual part meshes, all 151 placements, topology, footprint containment,
contact, all rectangle pairs, production CSG equivalence and eight images.
Fresh parameter checks confirmed deterministic manifests, all positive plates,
overview, ignored valid legacy filters, selected-group ignored plate index,
and assembly ignored printing controls. Unsupported scope, nonempty batch filter,
negative/fractional/out-of-range indices, invalid legacy safe/group and oversized
body inputs all produced expected assertion diagnostics. OpenSCAD assertion
errors were inspected directly, not inferred from exit codes.

Two informational QA concerns were accepted as unchanged baseline behavior:
72 collinear triangles remain, with no disconnected or zero-volume solid
component or edge/vertex-manifold failure; 24 direct-export part logs omit CGAL's
Simple field, but actual independent topology checks pass. These concerns do not
justify geometry changes. No correction cycle or validation weakening occurred.
QA evidence is under `/tmp/nested-complete-evidence/qa`, including
`parameter-results.json`, `independent-mesh-results.json`,
`provenance-results.json` and `inventory-results.json`.
Contract/security review remains inapplicable for the reasons in approved A2.
Unit tests/test-first were prohibited and skipped. Physical printing, slicing,
material behavior, fit, retention cycles and endurance remain excluded/unverified.

### B3 documentation and B4 acceptance/reconciliation

The documentation-writer synchronized only README guidance. Parent inspected
it against accepted source and corrected examples to verified bounded CSG
previews, with explicit single-positive-plate mesh export/import instructions
and disclosure of whole-plate STL timeouts. Defaults, all parts/mechanisms,
AMS guidance, manual plate changes, margins, overview warning and physical
limitations are documented. Accepted README SHA-256:
`fbbf1a0e908649da7fde0936a271f70d25759201b4fc9c39b9cb0bc9dfdab7c7`.

Every A2 requirement-to-delivery row is satisfied within modeled acceptance;
code review and final QA have no blocking findings. Parent git diff --check
passes. Final delivery owns only README.md, designs/nested_bank_safe.scad and
the two nested-safe artifacts; all preceding artifact bodies are preserved.
The final commit/push, origin/main containment and guarded cleanup are verified
in the terminal delivery report, rather than inventing this record's future
commit identifier. No temporary utility, mesh or preview is an implementation
output. Acceptance is CAD/layout acceptance only, not physical validation.


## Amendment 3 — 2026-10-10 — Simplified five-safe implementation

- Amendment ID: PLAN-nested-bank-safe-A3
- Previous version: original PLAN, automatic A1, approved A2 and delivered
  execution evidence; complete preceding SHA-256
  `827035fa145db8d68c83ab2da2aac578f7402416c64fa8db1dd0355f81dc2dc0`.
- Approval: Explicitly approved by the user with "approve" on 2026-10-10;
  complete effective PLAN (original plus A1 plus A2 plus A3).
- Request and purpose: User invoked `$iterate and simplify it`, selected full
  simplification, then approved complete effective SPEC-A2 with `approve` on
  2026-10-10. Implement that behavior only after separate PLAN approval and
  valid implement entry. Historical PLAN bodies/approval evidence are preserved.

### Authority, scope delta and current evidence

Authoritative effective SPEC is original plus A1 plus explicitly approved
SPEC-nested-bank-safe-A2, SHA-256
`c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`.
Its <=50-occurrence cap, full simplification, exact five envelopes, all messages,
secret-pocket dimensions and modeled acceptance boundaries supersede the older
mechanism/inventory clauses expressly listed in SPEC-A2.

Planning checkout is /home/alexbanica/workspace/openscad-designs on main;
observed HEAD and cached origin/main are
`bc3e9ecc7cb472b6aa6791160e800f5e24ee0e6a`. Remote was not refreshed during
planning. This is a source research snapshot, not an execution pin. Current source
SHA-256 is `bc7bea006b66e5a770e5fbb6c916b218df12bbc278c94c3212640ee7159a95bf`.
Read only approved artifacts, named source inventory/hinge/cam/secret/text/layout
modules and README's nested-safe guide; do not reopen product research or touch
unrelated designs. Prior complete-set allocation and validation methods may be
reused, but their old 151-part/three-plate evidence does not validate new geometry.

| Previous effective outcome | Final outcome | Preserved boundary |
| --- | --- | --- |
| Separate leaves and attachment hardware | Integral alternating barrels; one hinge pin and clip per safe | Opening, coaxiality, tool-free retention and extraction |
| Safe 1 linked bolt/catch drive and rotating dial | One directly driven cam, three-spoke handle, integral fixed dial | Functional closure and vault appearance |
| Separate axle/knob for smaller cams | Combined handle/axle, separate keyed cam and clip | Quarter-turn operation and positive retention |
| Separate exterior plaques/trim/mounts | Integral door lettering and relief | Exact strings, glyph metrics and envelope |
| Captive first-message slide/cleat/stop assembly | Removable cover with integral rail engagement and intentional release | Two reveals, hidden second message, pocket clearance |
| 151-item inventory/legacy part IDs | New explicit 36-occurrence allocation, <=50 hard cap | Complete inventory, safe/group selectors and batch packing |

### Deterministic design and source decisions

**Inventory/defaults.** Allocate per safe body 1, door 1, hinge_pin 1,
hinge_clip 1, handle_axle 1, cam 1 and cam_clip 1, plus Safe 5 secret_cover 1:
nominal counts 7/7/7/7/8 = 36. Integral second lettering, dial, trim, hinge roots,
rail surfaces and any cover release feature are features of the corresponding
solid, not extra disconnected objects. This is a planned BOM, not established
fit. In-scope retainers may increase quantities only with complete inventory,
assembly/print validation and <=50 cap; no hidden manufactured pieces. Source
parameters/default render modes and general selectors follow SPEC S8. Keep
all four print groups: body owns body; door owns door; mechanism owns the five
loose hinge/latch components; details owns Safe 5 secret_cover and is explicitly
empty for Safes 1–4. Avoid empty OpenSCAD ranges/phantom geometry. The complete
batch uses the existing deterministic shelf allocator against new footprints;
recompute N, never preserve old nominal plate counts as acceptance evidence.

**Integral hinge and print gate.** Retain independent envelope/chamber records
and rear-face-down body. Change only required front mechanisms/hinge reliefs.
Start with hinge radii [3,3,3,2,2] mm, pin diameter 1 mm and original per-safe
lateral axis positions. Place each new hinge axis at door_back_mm(i)+radius so
its rear barrel tangent is coplanar with the door's broad rear face. For the
current door back depths this produces front bounds 69.6/50.35/38.35/26.35/14.85
mm, within the corresponding 75/54/39/27/17 depths. These scalar values are
candidate allocations, not swept fit proof. Make fixed/moving barrel segments
alternating with 0.35 mm axial running clearance; join moving barrels to the
door with connected integral roots, no leaf mounts. Rebuild front panel pockets
and swept relief from these actual solids; do not retain old radial-corner
assertions or cutouts unless they still describe the new geometry. Pin heads,
clips and removal accesses stay inside complete bounds and outside extraction.
Use existing printed pin/clip shoulder and named snap-clearance patterns only
where dimensionally equivalent; state any adjusted new interface exception.
Doors print broad rear-face-down with text facing upward; major geometry and
manufacturing transforms change together. Integral roots may not bridge a gap
or protrude below the rear datum and make the door float. Inspect actual barrel
openings and support/contact, including 1 mm pin printability at the planned
nozzle. No bridge/overhang claim follows from the tangent formula.

**Direct cams.** Adapt the existing single-cam geometry for all five safes.
Safe 1's operating center stays at [48,36] mm; other centers use the delivered
cam records. The tongue reaches the existing right-hand frame region in its
0-degree latched position and rotates clear at 90 degrees. Rebuild Safe 1
receiver and swept relief for this tongue instead of the old pair of bolts.
Combine the knob/three-spoke handle and keyed axle as one connected component,
printed broad handle-face-down with the shaft growing upward. The separate cam
fits the rear keyed shaft and a separate printed neck clip retains it; print
cam/clip flat. Reserve a recessed rear clip/shaft-shoulder stack inside the cam
hub, rather than appending the old clip behind its rear face. For Safe 5 every
retained rotating surface, including shaft end, clip and collar, must remain at
Z>=8.5 mm, preserving 0.35 mm clearance from first-cover relief ending at 8.15.
Allocate 0.60 mm of rear hub depth for the existing 0.50 mm clip and 0.05 mm
static axial allowance on each side; verify the remaining 1.40 mm hub/key path,
positive retaining shoulders and side insertion/release access. This is a
candidate reservation, not a strength or fit claim. C1 records this actual
stack before interfaces freeze; C2/C3 validate full retained geometry/sweeps.
If it cannot retain torque and clear the cover, pause for a required amendment,
never project the clip into reserved pocket/cover space. Head/shoulder/clip
make a positively retained stack with accessible clip before nesting. Retain
0.35 mm bearing clearance and the documented static shoulder allowance; verify
the actual cam/door stack, not a sum of lengths.
Integral stops bound 0..90; the latch must remain frame-engaged at 0 and clear
at 90 without a separate manual catch. Fixed dial relief occupies the former
upper dial region and counts in front bounds; it must not interfere with the
handle or cover extraction. Remove obsolete drive/guide/catch/dial-moving
modules and their bores/cutters, not just their dispatch.

**Lettering/relief.** Reuse exact connected vector glyph geometry and wording;
union text and restrained frame/panel/dial relief into doors, deleting separate
exterior mounts and plaque hardware. Preserve 4 mm cap height, >=0.8 mm strokes
and >=0.6 mm relief targets. Reposition only within approved door/envelope and
retrieval/sweep reservations. No auto shrinking and no false claim that integral
lettering remains independently AMS colourable. Keep first-message cover at
34 x 55 mm reservation and second-message relief integral to body/backing; all
strings remain exact with documented wrapping. Match source glyph dimensions
with generated bounds and inspect connection to backing/door.

**Removable cover.** Start from the delivered Safe 5 depth stack: rear wall
0..2 mm, fixed second backing/text 2..3.4, clear pocket above relief 3.4..6.4,
cover backing 6.75..7.55 and first relief 7.55..8.15, cam 8.5..10.5, door rear
10.85 mm. Integrate the fixed second backing/text into body and replace separate
cleats with body rails. Set secret_cover_rail_clearance_mm=0.35 per mating
rail surface. Rails capture cover edges against front/back displacement and
have an integral seated bottom stop; eliminate transverse pin/clip and separate
rail hardware. Open rail exits
allow cover removal after roughly 60 mm upward travel, clearing a roughly 55 mm
cover; derive exact travel from actual rail/cover bounds. Preserve a clear top
passage and finger/retrieval beam without narrowing the specified recess. Model
an intentional positive seated detent on a localized cover edge release feature,
operable through a non-text finger notch with the door open. The release feature
is integral to the cover, and its seat is integral to the body rail; neither
adds a disconnected item to the 36-part BOM. Start with named
secret_cover_detent_clearance_mm=0.15 per mating snap surface,
secret_cover_detent_engagement_mm=0.30 and
secret_cover_release_travel_mm=0.45. The latter exceeds nominal engagement by
the snap clearance; verify real available movement and rail stock, not just
this subtraction. Any snap engagement is localized cover-retainer stock, not
flexing shell or a living hinge; disclose its fit/material uncertainty. The
unreleased detent itself positively blocks upward cover travel. The closed door
blocks finger access to its front-only release notch; it is not assumed to
obstruct upward translation through the top rail exits merely because it is
in front of the cover. Verify closed-door/unreleased obstruction separately
from open-door/released removal clearance. SPEC's open-front access describes
access to the intentional release and cover handling; upward translation then
exits the top passage. Actual printed retention, release, rail exit and cover
removal/reinsertion must be inspected before acceptance; gravity/friction alone
is insufficient. If these named allowances/engagement cannot fit without
weakening approved dimensions, pause for an amendment before downstream freeze. Preview removed state
places the same cover aside without changing its manufactured geometry.

**Controls.** Preserve safe_index, print_group, part_id, assembly_view,
door_angle_deg, latch_angle_deg and extraction_distance_mm semantics in S8.
Set secret_cover_removed=false and allow true only with active Safe 5's door
open and latch released; the cover then appears aside in assembly. Remove
secret_slide_mm, safe1 catch controls, dial_angle_deg and show_guide_plate from
adjustable sections and dispatch. Deleted part IDs assert unsupported. Arbitrary
OpenSCAD -D values for removed variable names cannot be promised to reject;
README explicitly identifies removed controls as unsupported, with no aliases.
Source assertions cover supported modes/groups/parts, hard part cap, clearances,
complete bounds, nesting, invalid motion combinations and all populated plates.

### Execution units and ownership

All production SCAD edits serialize. Parent supplies verified artifact/source
hashes, exact ownership and prerequisites in each fresh native manifest. Aim
three minutes per launched assignment; interrupt at five, reconcile inspected
partial output, then assign a narrower successor, never retry unchanged work.
Temporary native capacity queues assignments; it never waives required roles.
Children preserve others' edits and perform no Git/worktree/commit/push effects.

| Unit | Owner / boundary | Prerequisite | Completion and next obligation |
| --- | --- | --- | --- |
| C0 | Parent: workspace, artifacts, baseline archive | Valid approved pair/implement entry | Refresh origin/main, verify state/hashes, exact worktree, copy bytes, capture baseline and recovery state; C1 |
| C1 | Developer: SCAD hinge/body/door skeleton only | C0 | Dimensioned Safe 4/5 cross-section and all-safe hinge/print gate; complete envelopes, connected integral hinges and positive pin retention; C2 |
| C2 | Developer: SCAD direct cam/handle/retention/fixed dial only | C1 frozen handoff | All five working closures, full travel and assembly accesses; C3 |
| C3 | Developer: SCAD integrated lettering/removable cover only | C2 | Actual glyph/pocket bounds, intentional cover retention and full removal/reinsertion; C4 |
| C4 | Developer: SCAD inventory/footprints/modes/batch integration only | C3 | Exact final <=50 inventory, groups, stable layouts, full development evidence and frozen integrated diff; C5 |
| C5 | Code-reviewer read-only; developer owns consolidated source fixes | C4 | One full integrated independent review wave, all supported findings disposed, corrected batch and affected checks; C6 |
| C6 | QA-agent read-only | C5 | Independent full final geometry/selector/batch QA and parent acceptance; qualifying failure returns through correction/assurance cycle, otherwise C7 |
| C7 | Documentation-writer: README only | Accepted C6 | New BOM/assembly/controls/colours/plate guide agrees with source; C8 |
| C8 | Parent: artifacts and Git delivery | C7 / all criteria | Reconcile four paths, main commit/push/remote verification and clean worktree removal |

Before downstream mechanisms, C1 must record actual sections for Safe 4/5:
parent front depth, retrieval feature, child full envelope, changed barrel sweep,
cover/rail/top exit and Safe 5 cam/pocket stack, including recessed rear
retainer envelope, remaining torque-bearing hub and closed-door release-access
obstruction. Generate bounded geometry for the proposed interfaces and broad
door bed contact. Positive scalar budgets
alone do not pass. Unresolved fit pauses downstream units for required amendment;
never thin primary walls, reduce pocket/glyphs or discard retention to meet count.

### Assurance, checks and coverage

Profile full: hinge/door/closure/reveal redesign has interacting mechanical
interfaces and changed manufacturing orientations, requiring independent final
QA. Independent code-reviewer covers the full integrated source, approved SPEC
and all development artifacts, followed by one consolidated accepted correction
batch. Independent QA checks actual geometry and source requirements after
correction. Contract/security reviewers are inapplicable: no shared software
contract, executable dependency, trust boundary, deployment or security behavior
changes; this remains a toy. Documentation-writer runs once after assurance.
Parent retains integration, findings, requirements and final acceptance. Repeat
a complete cycle only for a confirmed required-check/acceptance failure,
regression or blocked behavior, not speculative preferences. Unit tests and
conventional test-first are prohibited and skipped.

All OpenSCAD validation is timeout 15s, temporary outputs under /tmp, only
printable_layout or reference-free assembly. No system packages or external
libraries, tracked utility or generated mesh is added. Use existing standard-
library rasterization/mesh-inspection patterns as temporary tools; inspect
utility behavior on known bounds, retain provenance and show actual artifacts.

```sh
git diff --check
timeout 15s openscad -o /tmp/nested-simple-default.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'render_mode="assembly"' -D 'assembly_view="nested"' -o /tmp/nested-simple-nested.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'print_scope="complete_set"' -D 'plate_index=0' -o /tmp/nested-simple-overview.csg designs/nested_bank_safe.scad
```

Record complete matrix commands, exit status, diagnostics, file paths and visual
findings in PLAN execution evidence:

- All 20 safe/group combinations: CSG checks and documented empties. Every
  nonempty group/part has actual generated mesh and visual/bed-contact evidence.
  Verify revised inventory counts, single solid components except explicitly
  justified actual part geometry, no zero-volume/degenerate solid components,
  exact edge closure and vertex-manifold checks, applicable OpenSCAD solid
  diagnostics, no unknown/missing glyph/assertion/invalid geometry warnings.
- Per safe closed latched, closed released, partly and fully open, and latch
  at 0/15/30/45/60/75/90 degrees. Supplement sampling with analytic swept
  bounds or actual swept union derived from the same manufactured parts.
  Establish latch engagement at closed state; verify no unintended contact
  in released/open states. Inspect axle/pin alignment, positive retention,
  travel stops, insertion/removal access and reverse disassembly.
- Four nesting transitions: full stack, partial and complete straight extraction
  with active parent at 110 degrees; check whole child-subtree envelopes,
  throat/sweeps, retained primary walls, hinge/handle/dial/trim boundaries,
  retrieval access and contact clearance between samples.
- Safe 5 closed/seated, open/first reveal and cover removed/second reveal;
  actual intermediate removal path and reinsertion, positive seated release,
  rail/top/door/hinge/cam interference, full cover access and pocket above text.
  Inspect exact glyph width/cap height/strokes/relief for all six messages.
- Revised complete-set N from manifest: direct CSG for 0 and each 1..N,
  repeated identical manifests, exact identity reconciliation and per-safe
  totals <=50. Attempt each whole physical-plate STL under timeout15s first.
  On timeout subdivide using byte-verified production definition prefixes and
  exact allocator-index translations, render each unique actual manufacturing
  part and account for every repeated occurrence. Verify individual solidness
  before composing plate/overview meshes, prove canonical CSG geometry and
  transform equivalence to production dispatch, and inspect all plate/overview
  XY/oblique views. Check actual occurrence bounds within manifest rectangles
  and physical margin with numerical tolerance <=0.01 mm, never reducing the
  nominal 3 mm rectangle gap. Do not claim new geometry matches obsolete
  part meshes. Baseline comparison is limited to expressly preserved numeric
  envelopes/clearances, text strings, stable interfaces and packing semantics.
- Direct parameter checks: invalid safe/group/mode/part IDs, removed part IDs,
  negative wall/clearance, oversize envelope, invalid latch/door/reveal/extraction
  combinations, unsupported scope/nonempty batch filter, negative/fractional/
  out-of-range plate index. Inspect assertion text, not just process exit.
  Selected-group ignores plate_index; complete-set ignores valid safe/group
  filters; assembly ignores printing-only controls. No individual_part render.
- Physical printing, Bambu slicing, fit, snap fatigue, material/thermal safety
  and cycle endurance remain unperformed/unclaimed. This is geometry acceptance,
  not a functional hardware or security-device certification.

### Requirement-to-delivery trace

| Approved SPEC-A2 requirement | Units / paths | Terminal evidence |
| --- | --- | --- |
| S1 and V1: five safes, <=50 inventory, no hidden pieces | C1–C4 SCAD; C7 README | Complete BOM, counts/manifests, all repeated identities and accessible assembly |
| S2 and V2: integral hinges and positive retained pins | C1 SCAD; C5/C6 | Generated connected geometry, bed contact, coaxiality/sweeps, retention and tool-free disassembly |
| S3 and V2: direct single cams, fixed dial and appearance | C2 SCAD; C5/C6; C7 README | Travel/engagement/release/stops, full envelope, actual handle/shaft/clip stack; no removed bolt/catch requirements |
| S4 and V4: exact integral lettering, glyph metrics, colour delta | C3 SCAD; C6; C7 README | Connected actual glyph geometry and dimensions, all four outer strings, documented AMS limits |
| S5 and V4: intentional removable-cover reveal and clear pocket | C3 SCAD; C5/C6; C7 README | Both messages, seated/release/path/reinsert views, 34x55 and 30x40x3 clear measurements, blank exterior |
| S6 and V3: five dimensions, walls, nesting and retrieval | C1–C3 SCAD; C6; C7 README | Dimensioned coupled sections, all four extraction prisms and complete sweeps; no weakened clearances |
| S7 and V5/V6: one source, printable solid independent parts | C1–C4 SCAD; C5/C6 | All parts/groups/plates contact/solidness/visual evidence, no dependencies/exports/unit tests, timeout coverage |
| S8 and V5: controls, removed IDs, groups, batch/overview | C4 SCAD; C6; C7 README | Source defaults/assertions, ignored filters, empty groups, deterministic finite populated plates and all occurrence bounds |
| V7 and preserved exclusions/regression | C7 README; C8 parent | Matched-set migration warning, new assembly/controls/colours/printing limits; only four accepted paths |

### Workspace, delivery, recovery and Definition of Done

Keep the selected exact detached worktree
/tmp/agent-worktrees/openscad-designs/nested-bank-safe. Before preparation refresh
origin/main and verify local main against it; record live base SHA and hashes.
Stop on divergence, overlapping source/artifact changes or failed refresh.
Preserve invoking HEAD/index/content state and copy approved SPEC/PLAN byte-for-
byte into the verified workspace; retain recovery bytes until terminal cleanup.
Absent exact path is expected; registered-but-missing exact path allows only
non-forced deregistration and verification. Unexpected existing/dirty states
require safe reconciliation, never deletion of unrelated worktrees.

Owned accepted paths are designs/nested_bank_safe.scad, README.md and the two
nested-safe artifacts. No production additions/splits/export scripts/dependencies.
Parent alone appends execution evidence and reconciles accepted paths to local
main. Delivery is main -> origin/main as repository policy requires, with no
replacement task branch or PR. If main advanced, reconcile only demonstrated
disjoint changes and rerun affected checks; overlap or dependency drift blocks.
Inspect accepted staging, git diff --cached --check, Conventional Commit on main,
and git push origin main. Verify accepted bytes in the commit, refreshed remote
main containment, independently read remote SHA and origin/main upstream. Do not
change/bypass protection settings or force push; if direct main delivery is
rejected, preserve work and report the missing prerequisite instead of switching
delivery branch. No merge or deploy beyond specified main delivery.

After verified delivery and acceptance, compare every temporary changed/untracked
path against accepted bytes; reconcile detached worktree to the exact delivered
commit only after proving no unrelated/unaccepted bytes would be lost. Remove
only the clean exact worktree without force. Preserve all recovery evidence on
failures. Incomplete geometry is not committed/pushed to main as an accepted
feature; retain blocked DRAFT in the worktree with exact unmet criteria and the
smallest missing prerequisite. Finish safe independent work first. A unit or
handoff/checkpoint never satisfies terminal delivery or requests continuation.

Done requires all S1–S8/V1–V7 rows satisfied, every supported finding disposed,
full final QA and documentation accepted, <=50 actual inventory, verified main
commit/push/upstream/remote bytes, no accepted dirty paths and guarded cleanup.
Printing and slicing remain excluded, not passed. PLAN approval plus valid
implement entry obliges the complete lifecycle without routine stage confirmations.
This iteration performs no source changes, renders, worktree creation or Git
delivery. After PLAN approval use a new session, cleared context or explicit
same-context implementation consent with the implement skill.

### Plan-assurance evidence

On 2026-10-10 fresh read-only explorer and architect assignments independently
reviewed approved SPEC-A2 digest
`c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`
and initial complete proposed PLAN digest
`8b240ceeca8ec03cb8043029359794c5989725d2c6d77737072c6bc44fb8df76`,
against current source/README, HEAD and applicable instructions. Neither
implemented, rendered, edited artifacts or performed Git effects. The explorer
confirmed four-path ownership, exact conceptual count, current baseline,
selector/batch migration and S1–S8/V1–V7 coverage; the architect confirmed
sequencing, mechanical boundaries, assurance, inventory and guarded delivery.

All three supported planning findings were accepted and reconciled:

1. Explorer: new cover rails/detent lacked named numeric allowances and explicit
   BOM ownership. The design section now pins 0.35 mm rail running allowance,
   0.15 mm detent fit allowance, 0.30 mm engagement and 0.45 mm release travel,
   with an integral cover release feature/integral body seat and an actual fit
   gate. No extra hardware or proven snap/material behavior is implied.
2. Architect: the rear-retained combined axle could place its existing 0.5 mm
   clip inside the Safe 5 cover clearance. The plan now allocates a 0.60 mm rear
   hub recess and requires all retained rotating surfaces to remain Z>=8.5,
   records the remaining 1.40 mm key-bearing hub/retaining shoulder/insertion
   checks, and makes this an early C1 coupled allocation and C2/C3 geometry gate.
3. Architect: a front door does not inherently block top-exit cover translation.
   The plan now separates positive unreleased detent obstruction from closed-
   door finger access blocking, and requires distinct closed/unreleased and
   open/released path inspections. Front access and top translation are explicit.

These are implementation decisions within approved SPEC-A2, not new behavior
or physical evidence. No other supported planning contradiction was reported.
Candidate hinge tangency, hub stock, snap retention and the 36-part allocation
remain implementation fit/printing risks addressed by the explicit generated-
geometry gates and <=50 cap. Advisory planning assurance does not approve the
PLAN or establish CAD/physical performance. Parent verifies prior artifact
bodies remain byte-for-byte prefixes and git diff --check passes before
presenting this reconciled complete effective PLAN for manual approval.

### Approval record

The user explicitly approved the complete effective PLAN with "approve" on
2026-10-10: preserved original/A1/A2 history plus PLAN-nested-bank-safe-A3,
including its reconciled explorer/architect assurance dispositions.
Reviewed proposal SHA-256:
`48ccd85300f176a6e15de13bcac1004df27f6d0f97fbca3763e9e816d9c6c0db`.
The paired approved effective SPEC is SPEC-nested-bank-safe-A2, SHA-256
`c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`.
Document Status and all previous content/approval history remain unchanged.
This records PLAN approval only; iteration implements nothing and performs no
commit/push. Implementation requires a new session, cleared context or explicit
same-context consent with the implement skill.

## Amendment 4 — 2026-10-11 — Flat-door cam stops and coupled candidate gate

- Amendment ID: PLAN-nested-bank-safe-A4
- Previous version: approved complete effective PLAN through A3; entry SHA-256 `2912fb43ff71302bbaf9460b56afc81270ba702bac0a6219dbac9830979fa500`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required recovery under the originating `$implement specs/PLAN-nested-bank-safe.md` request on 2026-10-11. Actual rear-face-down door meshes exposed the legacy rear cam stop extending 2.25 mm below the printing datum. This amendment preserves approved SPEC-A2 unchanged and replaces only conflicting implementation allocation and prerequisite mechanics.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A3 C2 direct-cam stops | Reuse rear door stop engaging cam's rear slot | Door-front integral peg engages a rear-open quadrant recess in combined handle/axle; delete rear stop and obsolete cam stop slot | Rear stop prevents broad rear-face-down door printing |
| A3 Safe 4 knob | Existing 1.2 mm thickness | 2.0 mm thickness; front 26.70 mm remains within 27 mm complete depth | Preserve >=0.85 mm uninterrupted front disk above 1.15 mm stop recess |
| A3 C1 coupled gate / C2–C3 prerequisites | Complete new mechanism/cover geometry gate before downstream production mechanisms exist | Finish initial hinge/body/door gate, construct temporary production-equivalent C2/C3 candidates, inspect complete coupled sections/sweeps, then integrate/freeze accepted candidates | Gate requires actual new cam retention and cover geometry; prospective scalar reservations cannot establish it |

### Deterministic replacement allocation

For each safe let F be the door front and B=F+0.35 mm the handle back.
Door peg diameter 1.6 mm, center at operating axis +[-2.75,0], extends F..F+1.15.
The handle's rear-open recess extends B..B+1.15, excludes a central radius-1.60 mm core, and occupies x<=0.80/y>=-0.80 through the handle's outer radius.
The peg has nominal 0.35 mm radial/core and roof clearance, 0.80 mm axial engagement, and tangent stop faces at handle angles 0 and 90 degrees. Actual intersection/swept checks must establish unobstructed permitted travel and interference beyond both endpoints, including when the door is open.
Every handle is at least 2.0 mm thick; its uninterrupted front disk is at least 0.85 mm thick and prints broad face down before recess walls, core and axle. This mechanical disk is not a primary shell wall. Safe 4 front becomes 26.70 mm; Safe 5 front remains 15.20 mm. Safe 1 keeps its three-spoke handle and all handle/peg/axle bounds are inspected.
The keyed cam and rear recessed retainer remain required, with all Safe 5 retained rotating surfaces Z>=8.5 mm. No rear door projection, extra manufactured part, body-only stop, friction-only retention or loss of travel limit is permitted.

Temporary candidates use byte-verified production definition prefixes and the same prospective manufacture/assembly geometry. They remain under /tmp, use only permitted printable_layout/reference-free assembly and 15-second renders. Candidate units serialize source ownership. No downstream interface is accepted or frozen until full C1 coupled geometry, door bed contact, retained cam, cover rails/removal, primary walls and extraction criteria pass. Failed candidate evidence requires correction or a further amendment. There is no waiver of the original fit gate or final development/review/QA coverage.

### Preserved behavior and impact

SPEC-nested-bank-safe-A2 remains unchanged, SHA-256 `c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`.
Preserve S1–S8/V1–V7, all five envelopes, >=2 mm primary walls, 0.5 mm nesting, nominal 0.35 mm moving clearance, exact glyphs and pocket, positive tool-free retention, intended reveals, <=50 inventory, selectors and deterministic packing. C1–C4 remain serialized developer units; C5 full independent code review, C6 independent final QA, C7 documentation writer and C8 verified main delivery/cleanup remain mandatory. Contract/security reviews and unit tests remain inapplicable as approved. Physical printing/slicing remain excluded and unclaimed. Ownership remains the same four paths; no new Git/delivery authority or dependencies.

### Requirement-to-delivery trace

| Approved requirement | Unit / owned path | Required terminal evidence |
| --- | --- | --- |
| S3/V2 quarter-turn stops, direct handle/cam and retention | C2 source; C5/C6 | Actual stop engagement and unobstructed 0..90 sweep in closed/open door states; recessed rear stack and reverse assembly |
| S6/S7/V3/V5 stable broad-face printing, fixed envelopes/walls | C1/C2 candidates and source; C5/C6 | All door and handle meshes connected, Z=0 contact, bounds and unchanged nesting/extraction |
| S5/V4 and early coupled fit | C1–C3 candidate gate before interface freeze; C5/C6 | Actual Safe 4/5 section, cam/cover clearance, rail exit/reinsertion and intentional detent; no scalar-only acceptance |
| All remaining S1–S8/V1–V7 | Unchanged A3 trace C1–C8 | Entire original coverage, assurance, documentation and verified origin/main delivery |

### Planning assurance and approval record

Pending bounded independent explorer and architect review of this complete effective PLAN and unchanged approved SPEC; supported findings must be reconciled before automatic approval. This is required implementation recovery, never a claim of manual user approval or successful geometry acceptance.

### Reconciled candidate sequence and gate coverage

The replacement front peg/recess applies to **all five safes**, including Safe 1's new directly driven single cam and combined three-spoke handle/axle. A3 explicitly supersedes Safe 1's linked bolt/catch/guide drive; those older original-plan clauses do not remain effective. Delete their obsolete stops along with that mechanism.

Candidate ownership and sequence replace only the conflicting C1–C3 prerequisites:

1. C1 developer freezes the initial hinge/body/door skeleton and its verified source hash; parent reconciles its evidence and releases source ownership. The full coupled gate remains pending.
2. C2-candidate developer exclusively owns temporary cam/handle/stop/retainer definitions under /tmp, based on a byte-verified frozen production prefix; no production SCAD mutation. Record definitions, source/prefix digests, exact prospective integration delta and actual mesh/section/sweep checks. Parent freezes this candidate and releases its owner.
3. C3-candidate developer exclusively owns temporary cover/rails/detent/lettering candidates under /tmp built from the same frozen production prefix and the verified C2 candidate definitions. No production mutation or copied alternate approximation. Parent reconciles ownership and checks the combined candidate gate.
4. Parent accepts the complete actual coupled gate only after dimensioned Safe 4/5 sections prove the full retained cam stack, remaining torque-bearing hub/key/shoulders and insertion/release access; full door/hinge/cam sweeps; child-subtree extraction and retrieval; both Safe 5 reveal states; positively retained cover with intentional release; full intermediate top-exit removal and reverse reinsertion; clear 34x55 first-message reservation and 30x40x3 pocket above exact second-letter relief; blank exterior and unblocked 12x6 retrieval beam.
5. After that gate, bounded C2/C3 production developers serialize promotion of their verified candidate definitions into the sole source. Parent proves candidate/source correspondence and reruns affected actual meshes/sweeps before interface freeze. A change during promotion invalidates affected candidate evidence until regenerated; failed coupled outcomes require correction/amendment, never downstream acceptance.
6. C4 inventory/controls/layout, C5 review, C6 QA, C7 docs and C8 main delivery proceed only from the accepted integrated interfaces. Temporary candidates remain evidence under /tmp and are not implementation outputs or source dependencies.

This clarifies the explorer's supported sequencing and coupled-outcome findings. Its Safe 1 coverage concern is resolved by the explicit all-five replacement statement and A3's already approved direct-cam replacement. No obsolete linked-drive criterion is restored.

### Complete effective A4 automatic approval — 2026-10-11

Required independent explorer and architect reviewed the proposed complete PLAN digest `f1de47c1ccc0fa290d6fc7a36c51f47f06f9b1a6e36a5c22ed934b4ab4196662` with unchanged approved SPEC-A2. Architect found no blocking allocation/sequence conflict and retained actual geometry gates. Explorer's candidate ownership/sequence, all-five stop coverage and explicit coupled-outcome findings are resolved in the clarification above. Parent assessed these clarifications as preserving every behavior, boundary, criterion and assurance requirement; reconciled proposal digest before this approval record was `5e65673fe5a38fb118b030ab0952e4927bdc2bba847417043cd6a4030fddd351`.

Approval: **Automatically approved complete effective PLAN through PLAN-nested-bank-safe-A4**, under the originating 2026-10-11 implementation request and implement's required automatic-amendment procedure. This replaces A4's pending fields above; no manual user review/approval is claimed. Earlier approved bodies and document Status remain unchanged. SPEC-A2 is unaffected. Effective scope is the same S1–S8/V1–V7 simplified matched set, with the replacement stop allocation and clarified candidate gate only. Actual coupled fit, independent implementation review/QA, documentation and verified main delivery remain uncompleted obligations, not approval evidence.

## Amendment 5 — 2026-10-11 — Printable rear retention and torque-bearing key fit

- Amendment ID: PLAN-nested-bank-safe-A5
- Previous version: automatically approved complete effective PLAN through A4, SHA-256 `1dfa0c49a6f6e8efe577efea4e610fb29805acee8b41aca660b7e90cb347116d`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required recovery under the originating 2026-10-11 `$implement specs/PLAN-nested-bank-safe.md` request. C2 allocation exposed a rear collar limited to at most 0.05 mm by A3's recess. Independent architecture analysis also established that the inherited 0.35 mm keyed bore contains the shaft's entire radius-1 disk, permitting full spin instead of transmitting torque. Correct these implementation allocations while preserving approved SPEC-A2 behavior.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A3 rear cam hub recess and key path | 0.60 mm recess, 0.50 clip with 0.05 gaps, 1.40 mm remaining path | 1.00 mm rear recess, 0.40 mm D-shaped terminal collar, 0.50 mm clip with 0.05 axial gaps, 1.00 mm remaining keyed hub | Provide actual positive printable collar stock without projecting behind Safe 5 Z=8.5 |
| Keyed cam/shaft interface | Inherited moving-clearance 0.35 applied to keyed bore | Named `cam_key_fit_clearance_mm=0.05` per static keyed mating surface; bearing clearance remains 0.35 | Inherited flat bore y=1.00 admits full radius-1 shaft rotation, eliminating drive |
| Cam manufacturing | Legacy rear-face-down cam | Broad front-flat-face-down cam, recessed rear face upward | Build solid hub first and avoid printing an unsupported recessed hub roof |

### Deterministic replacement allocation and validation

All five cams use the same relative rear stack. Let C be cam back, Safe 5 C=8.5 mm. Cam remains C..C+2.00 mm. Shaft's D-shaped terminal collar is C..C+0.40; neck diameter 1.20 is C+0.40..C+1.00. The 0.50 mm C-clip occupies C+0.45..C+0.95, leaving nominal 0.05 axial allowances to collar and the keyed cam shoulder at C+1.00. Rear hub recess depth is 1.00 mm and opens rearward and radially for intentional clip insertion/removal; required geometry must establish side access before nesting. The remaining keyed hub is C+1.00..C+2.00, length 1.00 mm, with the original radius-4.8 hub stock around its bore. This is secondary mechanical stock, not a reduced primary shell wall. Physical strength/endurance remain unproven; do not claim those from modeled contact.

Key shaft and terminal collar retain diameter 2.00 mm and flat y=0.65 mm in local coordinates. The static keyed bore uses diameter 2.10 mm and flat y=0.70 mm. The D collar passes through the matching cam opening and the separate circular running door bearing, then the clip positively retains the cam; no circular collar that cannot pass the D bore is substituted. Shaft and cam rotate together; the 0.05 static key-fit exception replaces the inappropriate bearing allowance only there. Cam/door bearing and other free-running surfaces retain nominal 0.35 mm, clip radial snap clearance remains 0.15 mm, and static axial allowance remains 0.05 mm. Prove actual insertion and retained shoulders, cam-to-shaft torque contact under angular displacement, inability to rotate the keyed shaft freely through 360 degrees, full reverse disassembly and modeled engagement/release/stops. Inspect finite-volume collar/key/clip components and actual clearance; no acceptance from arithmetic alone.

The cam prints front face down with its 1.00 mm uninterrupted keyed hub stock on the bed and rear recess opening upward. The combined handle prints front face down with shaft/neck/D-collar growing upward. Verify broad contact, connected nondegenerate solids and accessible snap interface for every safe. All retained Safe 5 rotating surfaces remain Z>=8.5, >=0.35 above first-message relief ending at8.15. A4 front door/handle stops and all coupled candidate gating remain unchanged.

### Preserved behavior and impact

SPEC-A2 remains byte-for-byte unchanged, digest `c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`. This changes implementation secondary hub allocation and introduces the explicitly allowed documented named static-fit exception; it does not weaken primary walls, enlarge envelopes, narrow extraction, reduce pocket/glyph dimensions, remove positive retention, add parts or replace a functioning cam with decoration. S1–S8/V1–V7, <=50 cap, print/batch semantics, all physical exclusions, four-path ownership, full assurance and parent-only verified main delivery remain unchanged.

C2 temporary candidate owns these changes; C3 candidate and complete pre-promotion coupled gate must use its frozen verified geometry. Failed fit/torque/retention remains a correction/amendment gate. C5 independent review/C6 final QA cover the changed key, recess, collar, clip access, whole moving sweeps and manufacturing orientation. C7 README documents the new named static exception and modeled/physical limits. No new dependencies or production files.

### Requirement-to-delivery trace

| Approved requirement | Unit / path | Terminal evidence |
| --- | --- | --- |
| S3/V2 working directly keyed cam and positive retention | C2 candidate/source; C5/C6 | Actual torque contact, collar/clip capture, insertion/removal and all-state sweeps |
| S5/S6/V3/V4 cover clearance and hard boundaries | C2/C3 pre-promotion coupled gate; C5/C6 | Safe 5 rotating bounds >=8.5; clear pocket/cover path and unchanged complete envelopes/walls |
| S7/V5 manufacturing | C2 candidate/source; C4/C6 | Front-face-down cam and handle actual bed contact/solidness, all repeated occurrences |
| V7 named fit documentation; other S1–S8/V1–V7 | C7 README; unchanged C1–C8 A3/A4 traces | Actual tolerances and candid physical limits; complete original acceptance and origin/main verification |

### Planning assurance and approval record

Pending independent explorer and architect assurance of the complete effective proposal with unchanged approved SPEC. The dimensions above are candidate allocations, not geometry or physical acceptance. Automatic authorization follows only after supported findings are reconciled.

### Reconciled manufacturing clarification and complete A5 automatic approval

Both independent explorer and architect verified proposed complete PLAN digest `44bd29f640c119ba42741c1480ee8b0ae68768edb6021490fb9ff1461f42d86d` and unchanged approved SPEC-A2. They found the recess/collar/key allocation consistent and retained the actual retention/torque/access/coupled gates. Their one supported manufacturing finding is incorporated explicitly: inspect the terminal collar's **0.40 mm radial step above the 1.20 mm neck in actual front-face-down handle manufacturing geometry**. Bed contact and mesh connectedness do not establish that transition's support. Any correction must preserve positive shoulder overlap, D-bore passage, actual collar stock and axial gaps; do not silently chamfer away capture or claim support-free printing from thickness. Failed modeled printability requires correction/amendment before promotion; slicer/material/physical results remain excluded and unclaimed.

Approval: **Automatically approved complete effective PLAN through PLAN-nested-bank-safe-A5 on 2026-10-11**, under the originating implementation request and implement's automatic required-amendment authorization. This replaces A5's pending fields, preserves prior bodies and document Status, and does not claim manual user approval. SPEC-A2 remains unchanged. Complete effective scope remains all S1–S8/V1–V7 with A4 stops/candidate gate and A5 retained/keyed stack/fit/manufacturing allocation. Supported planning findings are resolved; source/candidate geometry acceptance, implementation review/QA, documentation and main commit/push remain required.

## Amendment 6 — 2026-10-11 — Safe 4 released-hub opening clearance

- Amendment ID: PLAN-nested-bank-safe-A6
- Previous version: automatically approved complete effective PLAN through A5, SHA-256 `cc8720e31adebfeddb08e112b0f10def7994c01420a3e2ba9f0a5e3125773110`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required correction under originating `$implement specs/PLAN-nested-bank-safe.md`. Actual C2 candidate Safe 4 released closure at door angle 5 degrees intersects its body by `0.0000751045 mm3`, X47..47.0124/Y33.8732..34.1268/Z23.8329..23.9762. Correct opening clearance without thinning primary frame or cam hub.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A3 inherited Safe 4 cam axis | [42,34] mm | [41.6,34] mm, 0.40 mm left shift | Rear hub corner exceeds the right frame during initial opening |
| Receiver and dependent geometry | Derived from prior center | Regenerate from corrected axis; preserve receiver algorithm/Z allocation and fixed tip X47.65, not byte-identical receiver void | Longer tongue needs actual regenerated sweep clearance |
| Receiver sweep approximation | Convex hulls of 5-degree samples with nominal offset only | Add a derived maximum 2.5-degree chord/arc allowance to nominal offset | Maintain >=0.35 continuous clearance between samples instead of claiming hull chords are exact arcs |

### Deterministic correction and preserved boundaries

Safe 4 retains hub radius 4.8 mm, cam Z20..22, hinge X3/Z24.35, and latch tip X47.65. Tongue length increases 5.65..6.05 mm; latched frame overlap remains 0.65 mm. Conservative released-hub maximum X becomes `3+sqrt((41.6-3+4.8)^2+(24.35-20)^2)=46.617456`, near 5.723664 degrees; gap to X47 is0.382544. This analytic result informs the candidate, not actual full assembly acceptance. Bearing, door-front stop, handle/axle, receiver and any related bounds derive from the same corrected axis. No primary wall/frame thinning, hub-radius reduction or latch-engagement removal is substituted.

For receiver sampled hulls, derive an allowance from the largest actual profile radius plus nominal clearance and the 2.5-degree half-step, using a conservative secant-based bound (or a demonstrated stronger exact sweep). Add it to nominal moving clearance in the cutter only. Verify actual swept source geometry/remaining frame stock and all 0..90 angles; no physical clearance is reduced. Preserve 2 mm stock ahead of the receiver's unchanged Z allocation.

C2/C3 candidate reconciliation owns the correction before promotion. Validate actual released opening sweep0..110, explicit worst-angle probe around5.724, closed engagement/release, all latch-angle sweeps, handle/stop/text/retrieval clearance and full Safe5 child-subtree extraction. Refresh hashes and combined coupled sections. Previously generated changed Safe4 cam/body/door/handle meshes are superseded; unaffected evidence remains tied to exact unchanged definitions.

SPEC-A2 remains unchanged, SHA-256 `c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`. Preserve all S1–S8/V1–V7, dimensions/walls/pocket/glyphs, positive retention, A4 stops and A5 key/clip geometry, <=50 count, selectors/packing, full code review and final QA, documentation, four-path ownership and verified main delivery. Physical/slicer evidence remains excluded. No extra dependency, part or Git authority.

### Requirement-to-delivery trace

| Approved requirement | Unit / path | Terminal evidence |
| --- | --- | --- |
| S3/V2 clearance, engagement and stops | C2 candidate/source; C5/C6 | Actual full released-door and latch sweeps, analytic worst angle, fixed-tip frame engagement |
| S6/V3 walls, dimensions, retrieval/extraction | C1–C3 combined candidate; C5/C6 | Unchanged primary walls/frame Z stock and five envelopes, Safe4 retrieval and full child-subtree extraction |
| All other S1–S8/V1–V7 | Preserved A3–A5 C1–C8 trace | Complete original validation/assurance/documentation and verified origin/main delivery |

### Planning assurance and approval record

Pending independent explorer and architect assurance of this complete effective proposal and unchanged approved SPEC. The confirmed original collision is a required-check failure, not a preference; no failed geometry is accepted or pushed.

### Complete effective A6 automatic approval — 2026-10-11

Independent explorer and architect verified proposed complete PLAN digest `291313ce11d272a4e538e2470caba11d0fdf4c0709ac059e0c63e6df8cff40ed` with unchanged SPEC-A2. Both confirmed the recorded finite Safe4 collision, the coherent axis/tip/receiver dependency correction, conservative continuous chord allowance and preserved criteria/ownership. No supported blocking planning finding remained. Corrected geometry is still required, not established by these reviews.

Approval: **Automatically approved complete effective PLAN through PLAN-nested-bank-safe-A6** under the originating 2026-10-11 implementation request and implement's required automatic-amendment procedure. This replaces A6 pending fields; no manual user approval is claimed. Prior bodies and Status remain unchanged. All S1–S8/V1–V7 and A4/A5 fit/manufacturing/assurance/main delivery obligations remain effective.


## Implementation execution — 2026-10-11 (C0–C4 progress)

Originating authority: `$implement specs/PLAN-nested-bank-safe.md`, fresh entry
against effective approved SPEC-A2/PLAN-A3, followed by automatically approved
required amendments A4–A6 above. Earlier approved content is preserved verbatim.
This section records execution evidence; it does not redefine behavior.

C0 verified invoking local main and refreshed origin/main at
`bc3e9ecc7cb472b6aa6791160e800f5e24ee0e6a`; preserved the two pre-existing
approved artifact edits and recreated only the exact missing detached worktree
`/tmp/agent-worktrees/openscad-designs/nested-bank-safe`. Baseline/approved-entry
bytes and recovery records are under `/tmp/nested-safe-recovery`. Four-path
ownership remains source, README, SPEC and PLAN. Entry SPEC SHA256 was
`c2263aa95f62d924b82616c9a84eab78287dfa8dd319d5fcd377d1d058665257`;
entry PLAN was `2912fb43ff71302bbaf9460b56afc81270ba702bac0a6219dbac9830979fa500`.

Native developer units C1–C3 were serialized through temporary candidates.
Supported failures were corrected, not waived: shell unions refilling hinge
bores, Safe 5 tangent barrel contact, rear stop below the door print datum,
non-retaining keyed stack, Safe 4 released cam/body sweep, panel rear-corner
running clearance, unsupported cover rails/bottom seat and cover normalization.
The required stop/key/axis changes received the exact A4/A5/A6 explorer and
architect assurance and automatic approval records above. Original manual SPEC
approval was not replaced or inferred from a passing render.

Final coupled candidate SHA256
`94ee11af08d17039823097af4378646b90ff7e38b19b75a9d1e834979b06d431`
was promoted only after the combined gate passed. Exact candidate/delta
provenance and fresh commands/results are in
`/tmp/nested-simple-evidence/coupled-gate/HANDOFF.md`, `results.json`,
`extra-results.json`, `section-evidence.json`, `seat-slope.json` and
`plate-contact.json`. Body/cover are single connected edge- and vertex-manifold
meshes; the seat underside has actual 45-degree supported facets. Positive
unreleased cover interference is 0.0612846 mm³; released lift and continuous
release/removal/reinsertion envelopes are clear. At the starting seat only,
intersection is the intended y=5 zero-volume boundary, separately distinguished
from positive-travel clearance. Pocket/glyph bounds, 3×6 mm front grip access,
Safe 4 critical 5.723664-degree position, complete Safe 4/5 bounds and all four
fresh complete child-extraction prisms pass. Parent inspected generated cover
and body views; exact first and second messages are visible. No predecessor
mesh was substituted for these changed interfaces.

C4 froze production source SHA256
`87e126ac5ad22c1bc0185ee8bcb8eb219ed6cb26930032062bb7b1bede46f4c3`.
`/tmp/nested-simple-evidence/c4/HANDOFF.md`, `correction.patch` and
`geometry-preservation.json` record unchanged accepted geometry, same-value
named 0.05 mm key fit, removal of obsolete helpers and final dispatch/inventory.
The inventory is 36 occurrences (7/7/7/7/8), two populated physical plates
(14/22), five mechanism objects per safe and genuinely empty details groups
for Safes 1–4. Forty-seven direct production CSG/selector checks passed.
High-precision actual allocator assertions establish nominal 3 mm gaps and
5 mm margins; rounded conventional echo numbers are not accepted as reduced
nominal separation. Definitions prefix SHA256 is
`49e8c7ecb75d860ad191a2f06bfc9e42196834ef4ba7d6f602ccf1c50f5a9ef5`.

Parent supplementary production checks in
`/tmp/nested-simple-evidence/final-motion/run.py` and `results.json` passed all
69 cases: every safe at latch 0/15/30/45/60/75/90 degrees, doors 5/45/110 degrees,
all four partial/complete extractions, first/second reveals and negative motion,
clearance and oversized-depth assertions. These CSG checks prove evaluated
selection/assertions; actual collision/manufacturing evidence is separate.
All OpenSCAD invocations are timeout 15s, permitted reference-free modes and
/tmp artifacts. Unit tests and conventional test-first are not applicable and
were not run. Contract/security reviews remain inapplicable for the approved
toy geometry scope. Physical prints, slicing, force/material fit and endurance
are excluded and unclaimed.

At this progress record, full manufacturing evidence, independent code review,
final independent QA, documentation and main commit/push/reconciliation are
still required. Checkpoints 01–07 reported not committed and not pushed.
This is progress, not implementation completion or delivery acceptance.


### C4 manufacturing completion — 2026-10-11

`/tmp/nested-simple-evidence/c4-manufacture/HANDOFF.md`, `results.json`,
`render-results.json`, `group-mesh-results.json` and `artifact-sha256.json`
record fresh meshes for all 36 exact allocator-index occurrences and all 16
nonempty groups. Every individual has one connected positive-volume mesh,
zero edge errors, zero vertex-link errors, finite broad-face bed contact and
actual bounds inside its declared rectangle and physical margin within the
approved 0.01 mm numerical tolerance. Mechanism groups have five intended
separate solids; other nonempty groups have one. Four empty groups were checked
by direct CSG. All exact indexed physical-plate and group canonical CSG
correspondence checks passed. Plate 1 direct STL completed in 11.03 seconds;
plate 2 hit timeout15s and uses the explicitly approved subdivision fallback.
Its composition includes all 22 fresh actual source/indexed occurrence meshes;
there is no obsolete-part substitution or rounded-echo placement.

The initial worker overview comparison was unproven because it added the
276 mm offset to already rounded CSG matrices. Parent completed the remaining
proof in `/tmp/nested-simple-evidence/c4-overview-proof/run.py` and
`results.json`: 36 exact indexed source expressions apply the overview offset
before CSG export, and their geometry-aware canonical union matches the direct
production overview (63 canonical geometry roots). All checks preserve source
SHA256 `87e126ac5ad22c1bc0185ee8bcb8eb219ed6cb26930032062bb7b1bede46f4c3`
and definitions-prefix SHA256 above. This resolves the worker remainder; it
does not silently relabel the earlier failed comparison as passing.

Parent visually inspected both physical plate XY/oblique views, overview,
all 16 actual group previews and the four exterior door XY views. Parts are
separate, broad manufacturing faces are down, body/door integral geometry is
connected and the exact four outer messages are visible. Worker inspected the
all-36 montage and detailed retention/cover views. Thin 1 mm upright hinge pins
(heights up to 91 mm), small snaps and the secondary tapered retention collar
remain explicit slicer/material/physical-print risks, not validated physical
results. No additional manufactured parts or generated artifacts are tracked.
C4 development validation is complete; C5 full independent review, C6 final QA,
C7 README and C8 main delivery remain required. Checkpoint 08 reports not
committed and not pushed.


### C5 consolidated full-review disposition — 2026-10-11

Independent code-reviewer `/root/full_review` completed the full C1–C4 review
wave against source `87e126ac5ad22c1bc0185ee8bcb8eb219ed6cb26930032062bb7b1bede46f4c3`
and effective SPEC-A2/PLAN-A3+A4–A6. Report and fresh diagnostic meshes/commands
are in `/tmp/nested-simple-evidence/full-review/REVIEW.md` and its three hinge
access result matrices. One supported finding R1 (P2, mandatory acceptance
blocker) was accepted: installed hinge clips are clear but actual side/axial
approach poses collide with rigid stock on all five safes. There were no other
supported defects in the full source, selector, mechanical, manufacturing,
continuous-motion or batch review. Documentation remains scheduled after QA.

Parent assigned one consolidated in-scope correction batch to a developer:
open a front retainer access corridor confined to secondary barrel stock and
orient the clip mouth for the demonstrated approach. The same approved assembly
criterion requires actual pin insertion/removal, not only a seated bore check.
Fresh actual pin poses shifted -1 mm axially also collide on all five
(`hinge-access-fix/before-results.json`), with volumes
0.104774/0.104774/0.104774/1.465515/0.732758 mm³. Therefore this correction batch
also includes the directly dependent lower head approach in secondary front
allocation. It is not a new requirement or a primary-wall relaxation.

The proposed lower approach uses the existing 3.1 mm head-recess diameter and
ends at hinge_start+0.95 mm, retaining its bearing shoulder. Its rear Z limits
65.05/45.8/33.8/22.8/11.3 mm all exceed complete primary chamber front limits
57/42/30/20/10.85 mm. Parent requires actual primary-region preservation,
all-five insertion/reverse paths and positive capture, connected manufacture,
unchanged closed bounds/motion/extraction and batch correspondence before
acceptance. No hinge-axis/radius, envelopes, walls, pocket, inventory, default
controls or packing changes are authorized by this correction batch. In-scope
correction and affected validation continue under originating implement authority;
independent final QA will assess the corrected actual geometry. No new manual
approval or speculative extra review wave is introduced.

Checkpoint 09 reports the supported blocker and correction in progress, not
committed and not pushed. The current correction remains unaccepted until its
required evidence and final QA are complete.


### C5 correction and affected validation completion — 2026-10-11

Developer `/root/hinge_access_fix` completed the consolidated R1 batch. Final
production source SHA256 is
`1984fae9271fa8d037871d2315b3eadbc71e5458696cf07dfaf60374fff3fd42`.
`/tmp/nested-simple-evidence/hinge-access-fix/HANDOFF.md`, `correction.patch`,
`correspondence.json`, `before-results.json`, `results.json`,
`extra-results.json` and `localized-results.json` record actual geometry and
60 bounded commands without timeout. Only hinge_head_recess and hinge_clip
changed. All axes, radii, envelopes, door/cam/cover geometry, inventory,
footprints, manufacturing transforms and packing functions remain unchanged.

The lower Ø3.1 approach extends through secondary front stock to
hinge_start+0.95 mm; actual cutter intersections with complete primary chamber
regions are empty on all five. A localized front end-slot and rear-facing clip
mouth provide the explicit radial clip route. Continuous conservative actual
pin head/shaft sweeps and clip route envelopes against actual body+door are
empty on every safe; reverse assembly follows the same paths. Actual approach
poses additionally pass. Positive terminal-collar capture is 0.00638385 mm³
per safe; lower head bearing-stop capture is about 0.33595 mm³. Intended snap
interference is isolated to two local jaw patches at the 0.6 mm neck; it is
not a collision with rigid stock. Earlier coincident whole-pin diagnostic
surfaces are explicitly superseded by the isolated neck-jaw diagnostic.

All five changed bodies and clips are connected edge/vertex-manifold actual
manufacturing meshes with broad bed contact and unchanged declared bounds.
Body changes remove secondary stock, so earlier whole-body door/cam/cover/
extraction collision-free containment remains valid; the retainer allocation
is separated from moving hinge segments. Primary chamber walls are unchanged.
The parent accepts R1 as corrected at the modeled-geometry level, subject to
independent final QA. Printed flex, forces, wear and small-feature fabrication
remain excluded, not inferred from these positive capture volumes.

Parent regenerated final-source evidence rather than relabeling old source
checks: `post-review-c4` contains all47 direct CSG/selector cases and exact
allocator assertions; `post-review-motion` all69 motion/negative cases;
`post-review-manufacture` all36 actual exact-index meshes, all16 direct group
meshes, physical plate attempts, composition and geometry-aware CSG equivalence.
All pass. Final plate1 direct render completed in11.22s; plate2 timed out15.02s
and uses the approved fresh22-occurrence fallback. Parent inspected changed
body/mechanism previews. `post-review-overview-proof/results.json` confirms
fresh final-source exact indexed overview canonical correspondence (63 roots).
Definitions-prefix SHA256 is
`a8e1b53a820f4f4dfdca889b6aa551f7d298bb673a1a91c50212a772ced0e50b`.
No outputs were added to source control. C6 final independent QA, C7 README and
C8 verified main delivery/cleanup remain required; no commit/push yet.


### C6–C7 final acceptance and C8 delivery readiness — 2026-10-11

Independent QA `/root/final_qa` completed
`/tmp/nested-simple-evidence/final-qa/REPORT.md`: modeled S1–S8 and V1–V6
pass, with no acceptance blocker. It independently recomputed the 36 actual
mesh hashes and topology, layout counts and margins, positive head/collar
capture, primary-region preservation, and performed 25 fresh bounded checks
including all-five continuous hinge insertion routes. The parent accepts the
corrected geometry and the single consolidated review-correction batch.

Documentation writer `/root/final_docs` synchronized the final README section.
Parent integration corrected localized cover release wording, exact cam-first
assembly order, hinge allowances and individual-mesh topology wording, and
added matched-set migration, removed controls and assembly examples. Earlier
README sections are byte-preserved. V7 now passes. Final README SHA256 is
`7dd54ea085b78b8efbadb4ceba2d6deb77ad65aee37a3022fc566cd4dc9497d7`;
source remains `1984fae9271fa8d037871d2315b3eadbc71e5458696cf07dfaf60374fff3fd42`.

All still-required modeled geometry, review, affected validation, independent
QA and documentation criteria are accepted. Unit tests and conventional
test-first phases are not applicable under repository instructions and were
not run. Security and external-contract reviews are not applicable to this
local toy geometry. No physical measurement, slicer result, test print,
material flex/force, durability or security qualification is claimed.
Plate 2 uses the approved fresh 22-object subdivision/equivalence route after
the bounded direct render timed out. Generated evidence remains outside Git.

A4–A6 retain their automatic implementation approval and specialist assurance
records above; the earlier approved SPEC and PLAN content is preserved. C8
now requires parent-only integration of these four owned paths into local
main, commit, push to origin/main, independent remote SHA verification, and
guarded reconciliation/removal of the exact temporary worktree. This record
is delivery readiness, not a claim that those Git actions have occurred.
The unrelated invoking-checkout SPEC-shed-ventilation.md must be preserved.

## Amendment 7 — 2026-10-12 — Nine-unit captive-hinge implementation

- Amendment ID: PLAN-nested-bank-safe-A7
- Previous version: complete effective PLAN through approved A6 and its retained
  implementation evidence; preceding file SHA-256
  `0f3f764e0cd1dca9bd37fa359213c6d001e33343c47f387d4202c417b8a8b0d6`.
- Approval: Explicitly approved by the user with `approve` on 2026-10-12,
  covering the complete effective PLAN through A7. Original document Status
  and earlier content/approval history remain unchanged.
- Request and purpose: Explicit user iterate request, selection `do the 9`,
  approval `approve` of SPEC-A3 on 2026-10-12, then `continue` to complete
  planning. Implement the complete approved SPEC through SPEC-nested-bank-safe-A3
  only after separate approval of this PLAN and valid implement entry.
- Approved effective SPEC SHA-256:
  `047479b6f255a36da37e452f1e1e4e925c5e329ec91f18aca3bd8504afdce954`.

### Changes against the previous version

| Requirement / unit | Before | After | Reason |
| --- | --- | --- | --- |
| C1 hinges and manufacture | Separately rear-down bodies/doors assembled with pins/clips | Five upright, open, captive body/door units with integral pivots, bed-contact door bands and accessible cavity supports | Eliminate hinge assembly |
| C2 closures | Five retained rotary cam assemblies | Preserve Safe 1 three-piece rotary latch; replace Safes 2–5 with integral deliberate-release snaps and fixed decorative knobs | Nine-unit selection |
| C4 inventory and solidness | 36 single-solid objects, 7/7/7/7/8 | Nine units, 4/1/1/1/2; fourteen solids, 5/2/2/2/3 | Honest articulated-unit accounting |
| C4 selectors / operating gates | Separate body/door/pin/clip selectors and rotary release on all levels | `body_door_unit`, empty door groups, outer-only rotary gate and inner `snap_released` gate | Export and preview actual geometry |
| C5–C8 acceptance and delivery | Prior source/evidence accepted for A2 behavior | Fresh integrated review, independent QA, README and main delivery for A3 behavior | Old evidence cannot validate new hinges/snaps/printing |

### Current evidence, preserved boundaries and research limit

Planning stays in /home/alexbanica/workspace/openscad-designs. Local main and
cached origin/main resolve to `2d67bad90145c5d0d68fbd1ee430aa1990f8f3e0`;
remote was not refreshed for planning and this is not an execution pin.
Source SHA-256 is
`1984fae9271fa8d037871d2315b3eadbc71e5458696cf07dfaf60374fff3fd42`;
README SHA-256 is
`7dd54ea085b78b8efbadb4ceba2d6deb77ad65aee37a3022fc566cd4dc9497d7`.
Preserve unrelated shed artifacts and every other design/worktree.
No shared-backlog identity or dependency pins exist for this standalone pair;
backlog preparation is not applicable.

Preserve all A3 dimensions, walls, chambers/throats, retrieval access, wording,
cover/pocket, outer latch allocations and printing/software constraints.
The current geometry cannot simply be combined: its separately printed door
starts at Y=4.85/4.35/3.85/3.85/3 mm, and rear-down manufacture leaves the
attached door elevated. Source-derived hinge-side chamber gutters are
11/9/7/6/2 mm; Safe 5 has no spare lateral primary-wall stock for a deep hinge
arm. Do not use an unallocated mid-depth hinge or unsupported cavity roof.
Implementation reads only the effective artifacts and named body/hinge/door,
closure, cover, glyph, assertion, dispatch and allocator patterns; no product
research, cross-repository mapping or external dependencies.

### Selected final-state geometry and defaults

**Manufacturing pose.** Print each articulated unit with original Y as print Z,
using `rotate([90,0,0])` followed by XY translation from actual projected bounds.
The body rests on its original Y=0 lower wall; the door prints at 110 degrees
open, within the operating range. Add a connected secondary door-bottom band
at original Y=0..door_bottom_mm(i)+1, inset 1 mm from each panel side, with
its forward stock at original Z=frame_front_mm(i)+0.35..+2.35. Join that stock
to the existing panel above its lower edge with finite overlap and a supported
taper; its band is not a primary wall. Closed front extrema are
67.95/48.70/36.70/26.70/15.20 mm, below the five depth limits. Do not recess
primary chamber floors or move chamber walls to provide bed contact. The band
must remain clear of the frame through the complete sweep. Each moving solid
must have nonzero-area bed contact; a point or edge touch is insufficient.
Measure footprint/support at the actual 110-degree pose, not the closed envelope.

Upright body roofs need explicitly documented accessible slicer supports where
bridging cannot be justified. This design is not described as support-free.
Reserve removal through each open front, by hand, without trapped fragments,
tools or damage. Keep supports out of hinge and snap running gaps. Model the
support-access/removal envelope in temporary reference-free assembly inspection
only; no sacrificial component is added to the installed inventory. Check
access against actual body/door/rail geometry, including Safe 5's rails and
message backing. Slicer toolpaths and actual removal remain unverified physical
outcomes. If modeled access or supported geometry fails, stop affected units
for an in-scope required amendment; do not silently require tools or remove a
roof/wall. Permitted bounded renders remain limited to approved modes.

**Captive rigid hinge allocation.** Replace removable pin/clip bores and
retainer recesses with body-connected retaining cups and door-connected rigid
double-cone trunnions, sharing the existing vertical Y axis. Use two bearing
stations near the existing lower/upper hinge regions; their exact placements
derive from retained hinge start/end records with at least 0.35 mm separation
from adjacent moving roots. Select outer bearing radius 2.25 mm for all five,
trunnion maximum radius 1.10 mm, neck radius 0.50 mm, radial and axial running
gaps 0.35 mm, and minimum cup wall 0.80 mm. Cup throat radius is 0.85 mm,
giving 0.25 mm nominal radial capture of the 1.10 mm head. Use 45-degree
conical transitions with 0.60 mm axial length between neck and maximum radius;
at least 1 mm neck length remains connected to its door root. No third solid
is permissible. Preserve at least 0.35 mm clearance normal to every conical
mating face, not merely a 0.35 mm radial translation (which would yield only
about 0.2475 mm normal clearance at 45 degrees). Construct the cup's receiving
profile from a true 0.35 mm Euclidean offset of the trunnion meridian profile,
including its rounded corner transitions, before revolving about the Y axis.
The maximum receiving radius is 1.45 mm, leaving the allocated 0.80 mm wall
inside the 2.25 mm outer radius; the offset neck radius is 0.85 mm. Dimensioned
sections must confirm these maxima, minimum face-normal gap, axial clearance
and actual retaining throat/capture together, including rounded transitions.
Cup roof/underside profiles must be self-supported in print Y,
not a flat inaccessible roof over a joint. The scalar capture calculation is
an allocation, not proof of captivity or printable material strength.

Candidate axes X are 5.5/4.5/3.5/3/2.25 mm; Z are
65.85/46.60/34.60/24.60/13.45 mm. Outer X extents are
3.25..7.75, 2.25..6.75, 1.25..5.75, 0.75..5.25 and 0..4.5 mm;
outer Z extents are 63.60..68.10, 44.35..48.85, 32.35..36.85,
22.35..26.85 and 11.20..15.70 mm. The Safe 5 hinge is thus forward of its
chamber ending at Z=10.85 mm with 0.35 mm clearance. Rebuild roots, pockets,
continuous swept relief and retaining cups from these actual solids, preserving
primary walls and both body/door connectivity. Do not reuse removed pin-clearance
exceptions for this joint. Fine 1 mm necks and 0.8 mm bearing walls are physical
print/strength risks, not qualified hardware.

**Coupled candidate gate.** Before downstream changes, N1 records fully
dimensioned all-five hinge sections, especially Safes 4/5, plus door-band
connectivity, the 110-degree manufacturing placement, bed areas and conservative
continuous motion bounds. Prove two disconnected manifold solids, mechanical
capture against axial separation, no fusion/contact at running gaps, connected
roots, no collisions throughout 0..110, and no narrowed chamber/extraction
prism. Inspect cone undersides and support removal envelopes. These candidate
dimensions may be refined only within approved behavior and with a recorded
dimensioned PLAN amendment where needed; they are not permission to weaken
constraints. A failed candidate is missing evidence, never acceptance.

**Inner closures.** Safes 2–5 use a vertical door-edge cantilever tab in a
non-text right-hand front reservation, with Y=18..30 mm nominal 12 mm length,
0.8 mm local bending thickness in X and 2 mm front/back width. Attach one end
with finite stock overlap to the door; keep primary panels rigid. Use local
tab clearance 0.35 mm, catch engagement 0.30 mm, and inward (-X) release
travel 0.65 mm, leaving 0.35 mm released clearance. Size the hook reach from
the actual panel/frame gap plus 0.30 mm engagement, not from a fixed assumed
door edge. Provide an externally accessible front release recess at least
3 x 6 mm and an inward movement corridor with the full release travel plus
running clearance. A lead-in ramp cams the tab inward on closing; the seated
hook blocks outward door motion until intentional release. Keep all hook,
catch and access cuts in secondary front stock beyond each chamber, clear of
lettering, cover, retrieval and extraction. Include actual deflected tab geometry
in release previews; no magic disappearance. Tab force, fatigue and print
durability remain unverified. Fixed inner knobs become connected door decoration.

**Outer latch and reveals.** Preserve the current Safe 1 handle/axle, cam,
clip, fixed dial and retained key/stop allocations from A4/A5. Verify cam-first
assembly and reverse removal with the now-captive door open at 110 degrees;
no step may assume a detached door. Revalidate actual access paths, travel,
clearance and torque-bearing key geometry. Preserve Safe 5's current cover,
detent, rails, text and pocket stack; remove its cam-related parts/cutters only.
The inner snap must not inadvertently release or expose the secret cover.

**Inventory, selectors and packing.** Install exactly one `body_door_unit`
in each safe's `body` group, Safe 1's `handle_axle`, `cam`, `cam_clip` in
`mechanism`, and Safe 5's `secret_cover` in `details`. All `door` groups are
empty; other `mechanism`/`details` groups are empty as specified. Reject legacy
separate `body`, `door`, `hinge_pin`, `hinge_clip` IDs and inner latch IDs.
Preserve default safe/group/scope/plate/mode parameters. Add
`snap_released=false`; Safes 2–5 require true before opening/extraction, and
Safe 5 reveal uses its open/released state. Safe 1 alone uses the rotary latch
gate. Inactive nested descendants remain closed with their own engaged closures.
Assembly latch/snap controls must not change manufacturing geometry; the print
pose uses the same articulated solids with the tab seated shape where compatible
with the open position, not a separately manufactured released tab.
Remove stale all-five cam assertions/cutters and source parameters that solely
described pin/clip manufacture. Unsupported removed -D variable names are not
promised to reject; document their removal rather than aliasing them.
Keep individual_part dispatch available, but validate only through permitted
printable_layout/assembly overrides. Pack nine actual unit footprints using
the existing translation-only allocator: 5 mm margins and 3 mm gaps between
units. Joint gaps within articulated pairs use named clearances. Overview index
0 remains inspection-only; do not promise a plate count before allocation.

### Units, roles, ordering and ownership

Profile: **full**, because coupled mechanical interfaces and manufacturing
orientation changes need independent geometry QA beyond development and review.
Code-reviewer and QA-agent are required; security/contract review is inapplicable
to this local toy geometry with no external/shared software contract, dependency,
trust, deployment or security change. Documentation-writer follows accepted QA.
All source edits serialize; parent owns artifact updates, integration and Git.
Every fresh native assignment has verified hashes, immutable ownership,
prerequisites, three-minute aim and five-minute interruption deadline. Capacity
queues work; it does not waive required assignments. Children never manage Git
or worktrees. A handoff/checkpoint is intermediate and proceeds to the next unit.

| Unit | Owner and exact boundary | Prerequisite | Completion / next obligation |
| --- | --- | --- | --- |
| N0 | Parent; artifacts/workspace/base/recovery | Approved pair and valid implement entry | Verified refreshed main base and copied approval bytes; N1 |
| N1 | Developer; designs/nested_bank_safe.scad hinge, roots, band, manufacturing helpers only | N0 | Coupled all-five candidate gate above; N2 |
| N2 | Developer; same source outer latch access, inner snap closures and motion assertions only | Frozen N1 | Accessible operation/assembly, engagement, release and full sweeps; N3 |
| N3 | Developer; same source preserved cover/text integration, selectors, inventory/packing and dispatch | Frozen N2 | Nine units/fourteen solids, exact text/reveals, complete development evidence; N4 |
| N4 | Code-reviewer read-only; bounded developer corrections within same source | Frozen N3/source/artifact/check hashes | One integrated review wave, consolidated accepted correction batch and affected validation; N5 |
| N5 | QA-agent read-only; parent acceptance | N4 | Independent geometry/selector/packing evidence for all criteria; N6 or justified correction cycle |
| N6 | Documentation-writer; README.md nested-safe section only | Accepted N5 | Source-matched usage, dimensions, assembly/support/colour/validation guide; N7 |
| N7 | Parent; four owned paths and Git | N6/all required criteria | Verified local main commit and origin/main push, reconciliation and guarded cleanup |

### Validation and requirement-to-delivery trace

No unit tests or conventional test-first phases; prohibited by repository policy.
Use `git diff --check` and bounded OpenSCAD geometry evidence only. All commands
use `timeout 15s openscad`, outputs under /tmp, printable_layout or electronics-
free assembly. Do not render individual_part mode or add tracked mesh/helper
exports, packages or libraries. Record complete command matrix, statuses,
assertion diagnostics, artifact paths, bounds and visual findings.

Minimum direct examples after implementation:

```sh
git diff --check
timeout 15s openscad -o /tmp/nested-pip-default.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'print_scope="complete_set"' -D 'plate_index=0' -o /tmp/nested-pip-overview.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'render_mode="assembly"' -D 'assembly_view="nested"' -D 'latch_angle_deg=0' -o /tmp/nested-pip-closed.csg designs/nested_bank_safe.scad
timeout 15s openscad -D 'render_mode="assembly"' -D 'safe_index=5' -D 'snap_released=true' -D 'door_angle_deg=110' -D 'secret_cover_removed=true' -o /tmp/nested-pip-secret.csg designs/nested_bank_safe.scad
```

Retain A3's prior development/QA coverage methods, replacing obsolete part/motion
expectations. Generate all nine unit meshes; each articulated export has exactly
two individually manifold components, each other export one, total fourteen.
Inspect closure, nondegeneracy, vertex links, volume, bed support area and bounds.
Mesh component splitting for inspection must not manufacture separated hinge
pieces or lose their relative production placement. Check all 20 safe/group
combinations, expected empties, all supported IDs and removed-ID diagnostics.
Inspect each hinge from manufacturing pose into the entire operating range,
conservative sweep bounds between samples, axial capture and no part fusion.
Inspect inner snap latched/released/deflected states, closing ramp, release
access, every child extraction prism and all preserved glyph/pocket bounds.
Check assembly-only controls do not modify printing exports.
Attempt each actual plate STL under the bound. If direct rendering times out,
use the existing byte-verified production-prefix subdivision route with every
unit's exact allocator transform, canonical CSG equivalence, component topology
and combined views. Account for nine unit identities and all fourteen solids.
Repeat allocator manifests for determinism; inspect plate/overview XY and oblique
views, real footprints, populated finite plates, <=0.01 mm numerical tolerance
on bounds without reducing nominal gaps. Validate invalid mode/safe/group/part,
wall/clearance/motion/reveal/extraction/scope/filter/plate diagnostics and ignored
printing filters in assembly. Empty group output is deliberate, not a phantom part.

| Effective SPEC requirement | Units / owned paths | Required terminal evidence |
| --- | --- | --- |
| P1; S1/V1 as amended: nine units, fourteen solids, no hidden parts | N1/N3/N5 source; N6 README | Enumerated 4/1/1/1/2 units, 5/2/2/2/3 solids and actual meshes |
| P2; S2/V2 as amended: captive rigid hinges, no assembly, full travel | N1/N4/N5 source; N6 README | Two-solid capture, clearance, roots, sweeps and no pin/clip assembly |
| P3; S3/V2 inner closure delta | N2/N4/N5 source; N6 README | Engaged/released catch, external release access, local flex only and decorative knobs |
| P4; S7/V5/V6 manufacture delta | N1/N3/N5 source; N6 README | Both solids' bed area, stable unit pose, supported roofs and accessible support removal; physical limits disclosed |
| P5; S8/V5 selectors and packing delta | N3/N5 source; N6 README | IDs/empty groups/gates/defaults, exact nine-unit manifests and plate bounds/gaps |
| S3/V2 preserved outer latch and appearance | N2/N4/N5 source; N6 README | Working three-spoke handle, cam/stops/retention and captive-door installation/removal access |
| S4/V4 exact lettering and colour boundary | N3/N5 source; N6 README | Connected glyph dimensions/all exterior strings, integral features and colour limitations |
| S5/V4 secret reveal/pocket | N3/N5 source; N6 README | Both exact messages, blank exterior, intentional cover access/removal/reinsertion and original reservations |
| S6/V3 fixed dimensions, walls, nesting and retrieval | N1–N3/N5 source; N6 README | All-five complete closed bounds, primary walls, four extraction paths, lips/recesses and clearances |
| S7/V6 preserved source/printer/tool constraints | N0–N7 all four owned paths | Single 2021.01 source, P2S/AMS guidance, no libraries/exports/unit tests, bounded renders and diff check |
| V7 and A3 preserved behavior/acceptance/documentation paragraphs | N4–N7 source/README/artifacts | Fresh review/QA, matched-set migration, no false physical evidence, verified main delivery |

QA is genuinely independent: re-inspect generated meshes and selected fresh
release/capture/support-access cases rather than merely repeat successful commands.
Dispose supported review findings, apply one consolidated correction batch and
affected validation. Repeat full assurance only for confirmed required-check
failure, regression or blocked accepted behavior; speculative preferences do not
qualify. Documentation must explain nine units versus fourteen solids, captive
doors, supported upright print pose, no hinge assembly, outer latch installation,
inner snaps, changed selectors, recalculated plates and colour workflows without
promising slicer integration. No physical print, slicing, flex/force, fatigue,
support-removal success or hardware fit is claimed by modeled acceptance.

### Workspace, delivery, recovery and Definition of Done

Preserve the prior selected implementation location:
`/tmp/agent-worktrees/openscad-designs/nested-bank-safe`, detached for temporary
mechanics. Delivery is **main -> origin/main**; no task-branch delivery or PR.
At implement entry fetch origin/main, record its live resolved SHA, verify invoking
main/upstream and all path states, and create/reuse only a clean reconciled exact
worktree from that base. Preserve unrelated changes and invoking index/content;
transfer approved SPEC/PLAN bytes with hashes and recovery copies. Absent exact
path is expected; registered-but-missing permits only non-forced deregistration
of that path and verification. Any dirty/unexpected overlap, divergence, failed
fetch or unsafe reconciliation stops as evidenced blocked DRAFT. Do not alter
the unrelated shed or internal-IR worktrees.

After all modeled acceptance, integrated review/corrections, independent QA and
documentation, parent reconciles only designs/nested_bank_safe.scad, README.md,
specs/SPEC-nested-bank-safe.md and specs/PLAN-nested-bank-safe.md into local main.
Keep historical approved artifacts and append truthful execution evidence; do not
rewrite predecessor bodies. Inspect staged bytes and `git diff --cached --check`,
commit on main and push origin main. Verify accepted bytes in that commit,
origin/main upstream, fetched remote containment and independently read remote SHA.
No force push, protections bypass, unrelated staging or deployment. Safely handle
disjoint main advances with reconciliation and affected checks; overlap/drift stops.
Retain approved artifact changes/recovery until reconciliation is verified, then
remove only the clean exact temporary worktree without force.

Definition of Done is all still-required SPEC-A3 modeled criteria, complete fresh
assurance and documentation, all accepted paths committed on local main and
verified on origin/main, and safe recovery/cleanup. No old A2 evidence substitutes
for new joints, tabs, orientation or allocation. If blocked, record completed
work, exact unmet criteria, evidence and remainder in the PLAN; safe authorized
DRAFT delivery may preserve work but cannot claim acceptance. Checkpoint summaries
use sequential Checkpoint XX, actual commit/destination evidence and next steps;
they never create continuation gates. Planning/approval alone starts no production
work. Implement handoff requires a new session, cleared context or explicit
same-context consent.

### Plan-assurance evidence

On 2026-10-12, independent read-only native explorer
`/root/plan_a7_explorer` and architect `/root/plan_a7_architect` reviewed
approved effective SPEC-A3, proposed complete PLAN-A7, current source and
README. Assigned SPEC SHA-256 was
`047479b6f255a36da37e452f1e1e4e925c5e329ec91f18aca3bd8504afdce954`;
reviewed PLAN draft SHA-256 was
`2ad962670255ae86212ecb609fe6c98052fb140a29776f5b596b554c9e58ffcc`.
Both verified assigned hashes and performed no edits or renders. Explorer found
the affected-file map, current-source deltas, ownership, selectors, inventory,
candidate gate and validation/delivery coherent with no actionable contradiction.
Its inspection-mode reminder is covered explicitly by the permitted temporary
printable_layout/reference-free assembly route above.

Architect found one supported allocation ambiguity: radial-only 0.35 mm spacing
on a 45-degree cone would give approximately 0.2475 mm face-normal clearance.
Parent reconciled it in this unpresented draft by requiring a true 0.35 mm
Euclidean meridian offset, explicit corner transitions and face-normal/axial
measurement, with maximum receiving radius 1.45 mm, minimum cup wall 0.80 mm
and throat/capture checks. This preserves the approved default clearance and
does not change SPEC behavior. Other coupled geometry checks are assigned
legitimately to N1 rather than unallocated future choices. No other supported
actionable findings remain. Neither report proves printable geometry, slicer
output, support removal, material behavior or physical fit; N1 and the complete
implementation assurance lifecycle remain required.

### Approval record

The user explicitly approved the complete effective PLAN with `approve` on
2026-10-12: original body, retained ordered amendments and execution evidence
through A6, and PLAN-nested-bank-safe-A7, paired with approved SPEC-A3.
Reviewed proposal SHA-256:
`91e10e155ca66fe4c7cab12fdfc10cc81e96e31a2c5cce64b82dd5d29f527501`.
Earlier PLAN Status and A1–A6 content/approval history remain unchanged. The
earlier `continue` authorized planning only; this later decision approves the
complete presented PLAN. No implementation or Git delivery has occurred during
iteration. Implement entry requires a new session, cleared context or explicit
same-context consent.

## PLAN-A7 implementation entry and N1 candidate evidence — 2026-10-12

Fresh `$implement specs/PLAN-nested-bank-safe.md:194` entry verified the complete
effective SPEC through A3 and PLAN through A7, including their explicit complete
revision approval records. The line-194 pointer is within the historical
validation section; ordered amendments remain authoritative. Entry SPEC SHA-256:
`047479b6f255a36da37e452f1e1e4e925c5e329ec91f18aca3bd8504afdce954`;
PLAN SHA-256: `8413af1d1dde90e87ac54f228a5a3a51b285d3af546a740891e0432767677569`.
Refreshed `origin/main` and invoking `main` both resolved to
`bb162429d79efed632ffd2af820b68c7b92bca0f`. Created only the approved detached
worktree and copied approval artifacts byte-for-byte. Entry recovery files remain
under `/tmp/nested-pip-entry`; unrelated shed/internal-IR work remains unchanged.

Native developer N1 implemented provisional captive cups/trunnions, conservative
root relief and upright paired manufacturing helpers. Parent inspection found
Safe 5's initial 0.10 mm root/panel gap and all-five closed floor interference
from the initial band hull. Corrections keep Safe 5's root rear at 12.60 mm
(0.25 mm finite overlap into the panel), update its corresponding swept relief,
and restrict the band's rearward connector to Y at or above the panel bottom.
The primary floors and chamber walls remain unchanged. Candidate source SHA-256
at this handoff: `d937e080adbdf83232052344be5e45854277e20004cff93b63d8468480e0f426`.

Production-prefix bounded pair meshes at `/tmp/n1-evidence` contain two closed
edge/link-manifold solids for each safe, with positive bed-contact areas.
The body meshes still contain 4/4/4/4/2 collinear degenerate triangles at the
cup/shell boundary; these are not accepted as completed topology evidence.
Closed final intersections are empty after band correction, but a full continuous
motion gate is not yet accepted. OpenSCAD 2021.01 is installed; each render was
bounded to 15 seconds, and temporary mesh tools use the Python standard library.
No unit tests, slicing or physical printing were performed.

Independent read-only diagnostician confirmed the initial cup underside is a
flat annulus from radii 0.85 to 1.75 mm at station Y−1.95. Shell stock ends at
relative Z−0.25, leaving an unsupported forward annular start. The taper above
that plane does not establish support. Root relief remains beyond the protected
chamber fronts; no primary-wall or throat-retention defect was established from
that cutter. Cavity-support removal envelopes remain missing evidence, including
Safe 5 rail-adjacent support routes. A dimensioned support allocation recovery
must precede candidate promotion. No old 36-part evidence substitutes for this
gate. N2–N7, complete modeled acceptance, independent review/QA, documentation,
main commit/push and guarded cleanup remain outstanding. This is provisional
DRAFT development evidence, not geometry acceptance or completed delivery.

## Amendment 8 — 2026-10-12 — Supported captive-bearing roots and saddles

- Amendment ID: PLAN-nested-bank-safe-A8
- Previous version: approved complete effective PLAN through A7 plus truthful N1
  candidate evidence; preceding SHA-256
  `88d9f5640472d33021f4a46a3f619b6e75492f99ef3170095807b26290d9c6e5`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required recovery under the originating 2026-10-12
  `$implement specs/PLAN-nested-bank-safe.md:194` request. Actual N1 geometry
  exposed an unsupported lower cup annulus and unallocated lower root support.
  Replace these manufacturing allocations without changing SPEC-A3 behavior.

### Changes against the previous version

| Allocation | Before | After | Reason |
| --- | --- | --- | --- |
| Bearing station / neck | Lower station hinge_start+4; root Y−3.35..−2.30; short lower neck | Lower station hinge_start+11; upper station hinge_end−4 unchanged; root Y−6.41..−5.36; neck begins Y−6.41 | Reserve supported growth and full neck first-layer support |
| Door-root underside | Rectangular root starts beyond panel with no allocated support | Panel-seeded hull ramp Y−10.01..−6.41 feeding the complete root cross-section | Connected layer support from existing door material |
| Cup underside | Flat annulus starts at Y−1.95; taper above cannot support it | Shell-fed geodesic saddle inside radii 0.85..1.75, from Y−5.00 to −1.95 | Grow around receiver bore without floating forward starts |
| Door-band connector | Original convex hull reaches below panel and collides with floor | Forward bed stock remains unchanged; rearward connector only at/above door_bottom | Preserve unchanged floor and closed clearance |

### Dimensioned allocation and candidate gates

Coordinates below are relative to each unchanged A7 hinge axis/station. Set
stations to `[hinge_start_mm(i)+11, hinge_end_mm(i)-4]`. Root seed is a panel-
contained block: X=`door_left..door_left+1`, Z=`door_back..frame_front`,
Y=`station−10.01..station−9.91`. The first station seed starts at
`hinge_start+0.99`, above all five panel-bottom datums. The target root block
is X=`axisX−0.50..door_left+1`, Z=`min(axisZ−0.50,frame_front−0.25)..axisZ+0.50`,
Y=`station−6.41..station−5.36`. Hull seed to target, retaining the full target
block. Its complete 1 mm diameter neck footprint is supported, rather than
only half its initial disk. Largest nearest-seed XZ distance is
`sqrt(3.1^2+1.1^2)=3.2894 mm` for Safe 5, below the 3.50 mm seed-top-to-root-
bottom rise; first-four distance is `sqrt(3.1^2+0.75^2)=3.1895 mm`.
Validate actual hull support slopes and finite panel overlap. Preserve the
0.50 mm neck radius and 1.10 mm maximum head radius; extend only the lower
neck to Y−6.41, retaining the original 45-degree head meridian at Y−0.60..+0.60.

Expand the conservative continuous root relief to the full ramp/target geometry,
including its X−0.50 extent and all Y−10.01..−5.36 material, with nominal
0.35 mm gap and bounded between-sample arc allowance. Root material ends
at −5.36, its axial running cutter at −5.01. The saddle begins at −5.00,
so moving root and body saddle retain 0.36 mm actual axial spacing; the cutter
must not erase support or refill a receiver gap. Verify actual cutter minima
against protected chamber fronts 57/42/30/20/10.85 mm and retained primary walls.
The original roots-only scalar sweep no longer proves this larger hull's motion.

Keep the original radial cup/head/throat envelope and Euclidean-offset receiver.
Add a body-connected saddle inside annulus `r=0.85..1.75` whose lower surface is
`Y=−5.00+1.10*D(X,Z)`. D is shortest path length *within that annulus* to existing
shell stock at relative Z<=−0.60; do not measure through the bore. On rear-side
points or |X|>=0.85, D=`max(0,Z+0.60)` where the straight path remains in the
annulus. For forward points with |X|<0.85, with r=sqrt(X²+Z²),
D=`0.60+0.85*(atan2(Z,abs(X))−acos(0.85/r))*PI/180+sqrt(r²−0.85²)`.
Angles here are OpenSCAD degrees. At the forward outermost point D≈2.561 mm;
1.10*D≈2.817 mm, reaching the entire lower annulus by Y≈−2.183,
below the existing cup underside −1.95. The 10% height margin allows a
conservative finite faceted realization while retaining growth no steeper than
45 degrees. Implement a dimensioned annular polar grid/polyhedron or an
explicit equivalent that preserves the bore, continuous supported growth and
nominal radial boundaries. Verify face orientation, actual facet slopes,
connectivity, receiving clearances and self-support. If finite realization does
not meet those bounds, this remains a failed candidate requiring correction,
not a waived check. Subtract the receiver after the complete shell/cup/saddle
union; saddle stock must not refill it. No hidden installed or sacrificial part
is introduced.

The corrected band keeps its existing forward Y=0 bed stock. Its rearward
connector starts at/above the panel-bottom datum and spans the nominal 2.35 mm
rearward reach; justify this small bridge or model accessible removable support
in the actual open manufacturing pose. No floor/wall recess, unsupported-start
claim or support-free claim follows. Model segmented support-removal envelopes
for cavity roofs and any allocated accessible connector supports, including
Safe 5's rail-adjacent routes. Physical support removal remains unverified.

### Preserved behavior and impact

SPEC-A3 remains byte-identical and authoritative. Preserve nine units/fourteen
solids, permanent rigid captivity, all-five fixed envelopes, primary walls,
clearances, extraction/retrieval, snaps and deliberate releases, outer latch,
secret reveal/cover, exact glyphs and source/printing constraints. Only N1's
root/neck/station/support allocation changes; all N2–N7, full assurance,
bounded renders, documentation and main delivery obligations remain unchanged.
Children retain single-source serialized ownership and no Git authority.

### Requirement-to-delivery trace

| Effective SPEC criterion | Units / paths | Required evidence |
| --- | --- | --- |
| P2/P4; S2/V2/V5/V6 as amended | N1/N4/N5 source; N6 README | Actual root/saddle facet support, two manifold solids, axial/radial capture, full sweeps and support access |
| P1/P5 inventory/modes/packing | N3/N5 source; N6 README | Same exact nine-unit/fourteen-solid inventory, actual revised footprints/placements |
| S6/V3 dimensions/stock/extraction | N1–N3/N5 source | All-five closed bounds, cutter stock and four extraction prisms unchanged |
| V7 / preserved remaining A7 trace | N2–N7 four owned paths | Original snaps/latch/messages/cover, integrated review/QA/docs and verified origin/main delivery |

### Planning assurance and approval record

Pending independent explorer and architect assurance of the complete effective
proposal and unchanged approved SPEC-A3. Automatic authorization derives from
the originating valid implement request only after findings are reconciled.
No manual user approval or geometry acceptance is claimed by this draft.

### A8 sweep-construction clarification before assurance

The panel-contained ramp seed extends rearward to `door_back`; the target root's
rear bound does not cover it. Sweep the actual three-dimensional hull (preferred),
or a demonstrated conservative convex XZ hull of the seed and target sections
with their actual axial allocations. Do not sweep their full rectangular bounding
box: that invents a rear-left corner at `[axisX−0.50,door_back]` and may remove
Safe 5 primary-wall stock. Confirm remaining primary-wall material from actual
ramp/cutter geometry and extraction intersections. Target-root-only scalar
bounds are insufficient evidence for the complete ramp.

### A8 reconciled support convention and finite-facet allocation

Independent explorer and architect verified proposed complete PLAN SHA-256
`8e1045b9472c7fa9c456c01783ca767ba23a659fe0bf5f9eb364a684ffa51163`
and unchanged approved SPEC-A3. Explorer identified an ambiguous slope convention:
`1.10*D` has rise/run 1.10, i.e. about 47.73 degrees above horizontal and
42.27 degrees from vertical. The self-support limit is **no more than 45 degrees
from print vertical**, equivalently rise/run at least 1. The wording "no steeper
than 45 degrees" above is superseded by that precise convention. Increasing the
height supplies a conservative support margin; it does not reduce it. Root and
saddle facets must meet this convention with actual supported growth paths.

Architect established a concrete finite-facet deficit: 64-sided receiving radius
1.45 against a rotating head vertex at 1.10 yields only
`1.45*cos(180/64)-1.10≈0.348254 mm`, and 0.80 radial wall gives only
`0.80*cos(180/64)≈0.799036 mm` face-normal stock. Increasing facet count alone
cannot satisfy the exact zero-reserve allocation. Replace the following named
modeling allocations to preserve actual minimum clearances and walls:

- Cup outer radius 2.30 mm (previously 2.25), lower/upper taper radius 1.80 mm
  (previously 1.75), same exterior Y coordinates and 0.50 mm/45-degree taper.
- Receiving meridian Euclidean offset 0.36 mm, comprising the unchanged nominal
  0.35 mm running allowance plus a named 0.01 mm faceting reserve. Head/neck
  radii remain 1.10/0.50 mm. Maximum receiving radius 1.46, neck throat 0.86.
  Positive nominal head/throat overlap becomes 0.24 mm, replacing the earlier
  0.25 allocation; permanent captivity remains mandatory. Nominal default
  moving_clearance_mm remains 0.35; this reserve is specific to this receiver.
- Safe 5 axis becomes X=2.30, Z=13.50 mm; other axes unchanged. Its exterior
  X range remains 0..4.60 and Z range 11.20..15.80, within its 40x65x17 envelope
  and retaining 0.35 mm clearance beyond chamber Z=10.85. Recompute door-left,
  roots, swept relief and actual footprints from these named dimensions.
- Saddle annulus becomes radii 0.86..1.80 mm, shell-seed datum Z<=−0.65 mm.
  Replace 0.85 with 0.86 and 0.60 with 0.65 in D's formula above. Maximum D
  is approximately 2.659 mm; its 1.10 height multiplier finishes by Y≈−2.075,
  below unchanged cup underside −1.95. Root/saddle axial separation is unchanged.
- Root ramp worst nearest-seed distance with these dimensions is at most
  `sqrt(3.15^2+1.15^2)=3.3534 mm`, below its unchanged 3.50 mm rise.

These are explicit PLAN dimension corrections inside unchanged SPEC-A3 behavior,
not permission to reduce its 0.35 mm running minimum or primary shell walls.
Measure actual conical/faceted gaps over relative rotation, minimum cup stock and
capture from generated geometry. The scalar reserve motivates a candidate;
it does not replace the all-five coupled gate. Construct saddle facets with
angular intervals <=2.8125 degrees, radial intervals <=0.10 mm, and explicit
front symmetry-ridge / distance-branch splits. Verify actual facets and complete
path-connected support, not grid density alone. Remaining candidate checks and
N2–N7 obligations remain unchanged.

### A8 complete effective automatic approval — 2026-10-12

Independent explorer and architect checked the reconciled complete proposal
SHA-256 `76cbd7b4a449de1e318ba91a30820025e649c5be67ec864266358cea9798bb87`
against unchanged approved SPEC-A3. Both found no remaining supported planning
conflict. Architect independently computed maximum saddle D=2.659651 mm,
complete annulus Y=−2.074383, root growth 3.353357<3.50 mm, 64-facet radial
head/neck gap 0.358241/0.358964 mm, aligned radial cup wall 0.838988 mm,
and conservative head-apothem/throat capture overlap 0.238675 mm. Actual
conical gaps, topology, support growth, full sweeps, protected stock and
extraction remain mandatory geometry checks, not planning-assurance evidence.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A8 on 2026-10-12**, under the originating valid
`$implement specs/PLAN-nested-bank-safe.md:194` request and implement's required
automatic-amendment procedure. This supersedes A8's pending approval fields,
retains all earlier content and document Status, and claims no manual user
approval. SPEC-A3 remains unchanged. Effective scope is its nine-unit/fourteen-
solid matched set with the named support/faceting corrections only. N1 candidate
acceptance, N2–N7, independent integrated review/QA, README synchronization,
verified main commit/push and guarded cleanup remain required.

### A8 N1 implementation and recoverable saddle correction — 2026-10-12

Native fallback developer realized the supported root/neck, enlarged cup,
receiving faceting allowance, Safe 5 axis and annular saddle. Primary developer
capacity retries were explicitly requested by the user; after repeated capacity
failures the primary retry became available. Source ownership was reassigned only
after the predecessor froze and released its edits. Source at the initial saddle
handoff: `03fad7bf0a2491dc0d2b9715f587e3c5b1074059440ca819561b0dd8f94080b6`.

Raw saddle topology was closed, but CGAL Boolean conversion failed. Parent
inspected actual indexed CSG geometry: all edges and winding were consistent,
but one branch-aligned concave cell used an exterior diagonal, producing one
folded lower-face triangle. Developer corrected the per-cell diagonal consistently
on lower and upper surfaces; unsuccessful quantization/compaction experiments
were discarded. Source SHA-256 after this minimal correction:
`862f99cc52e314e8af97567ba8fde80c17aa4ef03f3c2b84d197382c52d974a1`.
Raw and Boolean saddle meshes now each have one closed component, no invalid
edges/vertex links/degenerate triangles; Boolean render completed in 0.530 s.
Measured minimum forward lower-facet rise/run is 1.039145766, above the required
1.0. Evidence is `/tmp/n1d-evidence`. Body 5 still reached the 15-second bound;
no timed-out body artifact is accepted. The approved conservative convex-XZ
root-sweep route is being realized to reduce Boolean complexity while retaining
stock/sweep gates. N1 remains unaccepted pending all-five actual topology,
stock, full motion and support-removal evidence. N2–N7 remain outstanding.

## Amendment 9 — 2026-10-12 — Upright rail roots and bounded production inspection

- Amendment ID: PLAN-nested-bank-safe-A9
- Previous version: automatically approved complete PLAN through A8 and retained
  N1 execution evidence; preceding SHA-256
  `ccbb702ce0e539a0d0db2c7ccb7cddf216d88a72275ea4bb158da1149c7baaec`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required recovery under the originating implement request.
  Read-only diagnosis found Safe 5 rail first-layer support defects in the new
  upright pose; body render timeouts also require bounded production inspection
  without extending the 15-second limit or substituting old geometry evidence.

### Changes against the previous version

| Allocation / sequencing | Before | After | Reason |
| --- | --- | --- | --- |
| Safe 5 rail support in original Y | Rail triangles begin at Y5; seat supports only Z6..7.55 | Add connected wall-seeded roots Y2..5; retain all mating stock at Y>=5 | Remove actual floating rail starts |
| Text endpoint faceting | 32 angular facets per 0.82 mm circular cap | 16 angular facets per cap, preserving extrema and minimum 0.80 mm strokes | Reduce Boolean complexity within required actual glyph dimensions |
| Candidate sequencing | N1 before all N3 text integration | Permit only named rail support and glyph faceting corrections during N1; remaining N2/N3 unchanged | Obtain production-equivalent candidate meshes with actual upright support |
| Roof support/access | Unallocated segmented removal paths for Safe 5 | Dimensioned central segmented tree/canopy route and bounded residual bridge strips | Cover support access without trapping fragments behind rails, backing or retrieval lip |

### Dimensioned correction and preserved behavior

The independent diagnostician measured unsupported first-layer areas per side
at Y5: 0.845 mm² on the lower rail in Z4.7..6 beyond the sidewall and 0.684 mm²
on the upper rail in Z7.55..8.35. Add only new root stock at Y2..5. On the left,
seed from existing sidewall strip X1.8..2, using each rail profile's full Z range,
at Y2..2.10; hull to a 0.10 mm thick copy of the unchanged lower/upper triangle
at Y4.90..5.00. Mirror on the right. Keep copies aligned so no root stock
extends above Y5 and no running face, ear, detent, release corridor or cover
changes. The 2.80 mm seed-top-to-target-bottom rise exceeds lateral growth
1.70 mm lower / 1.255 mm upper. Verify actual finite wall overlap, support
facets, cutter intersections, connected topology and absence of cover collision.
Secret pocket reservations and primary walls remain unchanged.

Change only the circular endpoint tessellation inside `safe_glyph` to `$fn=16`.
Circle diameter stays 0.82 mm. Its minimum faceted width is
`0.82*cos(180/16)=0.80424 mm`, above the 0.80 mm minimum; four cardinal extrema
and existing glyph placement, stroke centerlines, connected integral text,
strings, relief heights and dimensional reservations remain unchanged. This is
a named finite geometry allocation, not reuse of predecessor mesh evidence.
Inspect all actual glyph widths/heights/strokes and connectivity from final
meshes; if any criterion fails or required renders still time out, correct
within the approved subdivision/geometry gates instead of weakening them.
No new font/library, controls, software dependencies or generated exports.

Flat upper saddle surface may be triangulated using only its annular boundary
rings, retaining the exact lower support surface and side boundaries. Prove
same annular coverage, internal diagonals, no hole-crossing triangles and closed
raw/Boolean topology; redundant coplanar radial upper vertices are not required
manufactured geometry. All previous receiving/capture/support gates remain.

### Explicit support-access allocation

Model only temporary inspection envelopes; no installed support part enters
the nine-unit inventory. Actual slicer support generation/material removal are
outside CAD evidence. Safes 1–4 use segmented cavity-interior support envelopes
with 0.35 mm margins, withdrawn through their actual open front at 110 degrees;
check retrieval stock and the same manufactured door, not merely throat scalars.

Safe 5's central support tree is rooted on existing seat top Y5, X4.95..35.05,
Z6..7.55. It may grow toward roof footprint X4.95..35.05, Z3.75..12.50 over
at least 4.95 mm original-Y rise, satisfying a 45-degree growth envelope; no
support is assumed to start floating behind the seat. Keep detached lower
removal segments within Y5.35..60.65, X4.95..35.05 and Z>=3.75. They avoid
letters ending at Z3.40 and rail stock ending before X4.95 / starting after
X35.05; verify actual +Z withdrawal against body and open door. Specify maker
support segmentation into manually removable pieces, with modeled envelopes
no taller than 8 mm; actual support fragmentation/strength remains unverified.

The upper detached canopy occupies Y60.65..62.65 within the same X/Z footprint.
First lower it 2 mm in original Y (to Y58.65..60.65), then withdraw along +Z.
This bypasses the retrieval bar at Y61..65, Z15..17 while staying inside the
central rail-free corridor; inspect both continuous swept paths. Do not claim
that a full-height unsegmented support box can be withdrawn straight forward.
Residual roof strips between X2..4.95 / X35.05..38 are 2.95 mm bridge spans
between permanent sidewall and supported central roof; the rear strip Z2..3.75
is 1.75 mm, front strip Z12.50..12.85 is 0.35 mm. Document these bounded bridge
allocations, check actual roof continuity and support coverage, and require
maker slicer inspection/test printing. These small bridge allowances do not
justify an unsupported whole cavity roof or trapped near-rail support fragments.
If actual geometry obstructs any path/coverage, correct/amend before acceptance.

### Impact, ownership and requirement-to-delivery trace

Approved SPEC-A3 remains byte-identical. All dimensions, primary walls, nine
units/fourteen solids, hinges, snaps, outer latch, cover, exact messages,
clearances, modes, allocator and main delivery remain effective. Extend N1's
serialized developer ownership to these named rail-root/glyph-only corrections;
N2–N7 remain required and unchanged in their remaining work. Full integrated
review/QA and source-matched README still precede delivery. All commands remain
printable_layout/reference-free assembly, timeout15s, /tmp, no unit tests.

| Criterion | Units / paths | Required evidence |
| --- | --- | --- |
| P4/S7/V5/V6 manufacturing and support access | N1/N4/N5 source; N6 README | Supported rail roots, actual segmented continuous removal paths, residual bridge dimensions, final production topology |
| S4/V4 exact glyph dimensions/strings | N1/N3/N5 source; N6 README | 16-facet actual minimum strokes/extrema/relief and connected exact lettering |
| P1/P2/P3/P5 and all preserved A8 trace | N1–N7 four owned paths | Previous all-five capture/sweep/stock, closures/reveals/inventory/modes/packing, assurance/docs/main delivery |

### Planning assurance and approval record

Pending independent explorer and architect assurance of the complete effective
proposal with unchanged approved SPEC-A3. No geometry or physical acceptance
is claimed. Automatic authorization derives from the originating valid implement
request after supported planning findings are reconciled.

### A9 reconciled planning assurance and complete automatic approval

Independent explorer and architect verified the complete proposal digest
`eda4bcce22a910f11f36925d8b5a9d9c50719944b0d3027d0f60e596597a5645`
and unchanged approved SPEC-A3. No supported planning conflict remained.
Architect independently confirmed the named glyph/root/tree/canopy/bridge
allocations. Its sequencing clarification is mandatory: **remove lower support
segments first**, freeing the canopy's 2 mm downward path, then remove the
canopy. Actual support-growth, geometry paths, roof coverage, clearances and
all other required acceptance remain implementation evidence, not these reviews.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A9 on 2026-10-12**, under the originating valid implement
request and implement's required automatic-amendment procedure. This supersedes
A9 pending approval fields; earlier content/Status and SPEC-A3 are unchanged.
Effective scope is the named N1 manufacturing corrections inside the unchanged
nine-unit/fourteen-solid design, with all N2–N7, full assurance, README and
verified origin/main delivery required. No manual user approval is claimed.

### Exact mesh inspection clarification and current render evidence

N1's flat upper saddle tessellation was reduced from 9144 to 5328 raw triangles.
Lower/side triangles are unchanged; upper area and Boolean volume are equal.
Source at this handoff:
`af6b3350003e2dc525e35d9274b54fa6515053ea7c410ca080790152509aa439`.
Body 5 completes in 14.292 s (ASCII) and 14.480 s (binary), but whole pairs
still time out. ASCII's six-significant-digit coordinates collapse fine Boolean
facets; artificial 1e-6 coordinate welding also creates inspection defects.
Binary STL's **exact exported float32 coordinates** form one closed component,
zero invalid edges/vertex links and no exactly zero-area triangles. There are
93 positive-area triangles below 1e-10 mm²; record them as numerical sensitivity,
not as an invented approved minimum-area criterion. Actual nondegeneracy,
finite positive volumes, closure, connected components, support and all motion
criteria remain mandatory. Use binary exports and inspect the exact represented
coordinate graph before any optional tolerance-based sensitivity measurement.
This clarifies measurement accuracy, not acceptance relaxation; final independent
QA must assess the exported geometry and numerical sensitivity. Prefer production
geometry corrections that remove unstable coincident boundaries where feasible.
No timed-out export or malformed ASCII mesh is accepted as completed evidence.
Temporary evidence is `/tmp/n1f-evidence`; no source-controlled meshes are added.

## Amendment 10 — 2026-10-12 — Actual Safe 5 support seed and exact geometry evidence

- Amendment ID: PLAN-nested-bank-safe-A10
- Previous version: automatically approved complete effective PLAN through A9;
  preceding SHA-256
  `0193e0c821cc1a2eec95d81624c217b6ca125a2baec037821887ff0ff768bda9`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required recovery under the originating implement request.
  Source inspection found Safe 5's open chamber invalidates the earlier full
  rear-plane saddle seed. Actual export inspection also distinguishes precise
  nondegenerate CGAL surfaces from lower-precision triangulation artifacts.

### Changes against the previous version

| Allocation / evidence | Before | After | Reason |
| --- | --- | --- | --- |
| Safe 5 seed | Full rear plane relative Z<=−0.65 assumed existing stock | Actual continuous sidewall outer arc, relative X<=−0.30 and Z<=−1.60 at radius1.80 | The chamber removes stock at X>2 through the frame front |
| Safe 5 lower surface | −5+1.10*rear-plane D | −6.40+1.12*actual-arc geodesic D, with support-aware cell diagonals | Supply height and finite-facet support margin from actual stock |
| Safe 5 root/station | Shared original relative root offsets | Relative offsets lowered1.40; lower station raised1.40; upper station unchanged | Preserve first root position and0.36 axial separation |
| Geometry inspection | Rounded OFF/STL coordinates alone | Exact rational native CGAL Nef polygon topology plus attempted printing exports | Rounded export facets can collapse without a degenerate source solid |

### Dimensioned Safe 5 allocation

Safes1–4 retain A8/A9 support geometry. Safe5's axis stays X2.30,Z13.50,
with outer cup2.30, head1.10, neck0.50 and receiver nominal0.36 offset.
Its actual supported seed is the **outer annulus arc at radius1.80**, with
relative X<=−0.30 (global X<=2) and Z<=−1.60 (global Z<=11.90). Angle uses
`atan2(Zrelative,Xrelative)` normalized into0..360. Seed interval:
`[180+asin(1.60/1.80),180+acos(0.30/1.80)]`
=`[242.7339555492672,260.4059317731395]` degrees.
Conservative left-wall root-relief bound11.93710173 leaves0.03710 mm stock
margin behind that cutter. Verify the actual source cutter and finite seed
stock overlap; the analytical bound alone is not inspected geometry evidence.

Let R=1.80,r0=0.86,r be target radius, and delta the wrapped shortest angular
distance to this seed interval in0..180 degrees. For
`delta<=acos(r0/R)+acos(r0/r)`, the straight chord avoids the bore and
`D=sqrt(R²+r²−2*R*r*cos(delta))`.
Otherwise use the shortest tangent/inner-arc route:
`D=sqrt(R²−r0²)+sqrt(r²−r0²)+r0*(delta−acos(r0/R)−acos(r0/r))*PI/180`.
Clamp roundoff only inside square roots/acos domains, never clearance criteria.
The maximum D is3.88667609656 mm; lower-face maximum with factor1.12 is
Y≈−2.046922772, below unchanged cup underside−1.95 by≈0.09692 mm.

For Safe5 only, lower station becomes `hinge_start+12.40`; upper remains
`hinge_end−4`. Root seed relativeY=−11.41..−11.31; full target/neck start
−7.81..−6.76. The original first root's absolute Y placement is unchanged;
the upper root moves down1.40. Keep seed/target XZ sections unchanged.
Update actual hull and axial root-relief bounds consistently, including every
root-segment record and lower neck meridian. Original head cones atY±0.60 and
cup meridian remain unchanged. Root end−6.76 versus saddle base−6.40 retains
0.36 nominal axial gap. Verify actual faceted extrapolation leaves at least0.35.

Use11 radial rings,0.094 mm steps from0.86 to1.80. Safe5 angular grid is fixed
across radial rings, splitting0, the opposite seed midpoint
71.56994366120335, both seed endpoints, and360; subdivide each interval into
`ceil(interval/2.8125)` equal steps (130 sectors). For each convex lower-surface
cell, choose the interior diagonal maximizing the minimum of its two actual
facet rise/run magnitudes. Both candidate diagonals must remain inside the XZ
cell; avoid folded surfaces. This rule is required: independent reconstruction
found the ordinary diagonal minimum0.642093 and best-diagonal minimum0.998439
with factor1.10. Factor1.12 supplies additional margin; actual mesh facet support
and connected sublevel growth from the real seed remain mandatory checks.
Use the same consistent annular coverage on the flat upper cap.

Internal disk fill avoids independently faceted coincident bore walls; receiver
subtraction occurs exactly once after the complete body/cup/saddle union. For
Safe5 the internal center isY−7.40; other centers remain−6.00. All center stock
inside the bore is removed. Check any retained microscopic faceted extension,
root spacing, lower-facet support and exact topology rather than treating the
internal primitive coordinates as manufactured stock. There is no new part or
running-clearance relaxation. Source phantom receiver phase experiments are
rejected and reverted; no finite angular phase change is authorized by A10.

### Exact source-mesh validation substitution

The source at recovery entry is
`e216313baa90d22057c16ab0a69433f264bf265f8ac1c480fc8c5e8683e5a074`.
Bounded actual Body1/Pair1 native `.nef3` exports and an exact-rational parser
confirmed zero duplicate vertices, zero-length edges, zero-area polygon cycles,
nonplanar cycles, broken face loops, invalid edge incidence or vertex links.
Body1 contains one connected polygon surface; Pair1 contains two, with finite
positive volumes. Native faces may have multiple hole cycles; inspection must
connect those cycles through the actual face interior, not invent disconnected
components or validate only a naive triangle fan. Temporary evidence is
`/tmp/n1k-evidence`. OFF is six-significant-digit triangulation and did not
resolve this issue. Binary STL's float32 triangulation still collapses some
very small facets, despite the exact source geometry being nondegenerate.

Replace **acceptance of rounded STL/OFF topology** with **inspection of the
production-equivalent exact rational CGAL surface** for every manufactured unit,
all14 solid components, preserved bounds/contact, closure, vertex links,
nondegenerate polygon cycles, orientation and finite positive volumes. Keep all
unit/group/plate STL attempts and source-matched CSG/placement equivalence.
Printing-export artifacts with collapsed triangles are not represented as clean
meshes. Their coordinate/area diagnostics remain reported numerical limitations
for independent review/QA and README maker guidance. This is a validation-format
substitution preserving the original modeled-solid acceptance criteria and
strengthening geometry fidelity; it does not accept degenerate source polygons,
reduce coverage, delete failed checks, promise repaired STL files, or claim
slicer/physical validation. All exports remain timeout15s,/tmp and untracked.
Final independent QA must inspect exact native surfaces and quantify the printing
format limitations. If precise source topology or production equivalence fails,
this gate fails. Each articulated unit still requires exactly two individually
manifold solids, not merely a positive combined volume.

### Preserved behavior, sequencing and requirement-to-delivery trace

Approved SPEC-A3 remains byte-identical. All nine units/fourteen solids, permanent
hinge captivity, dimensions/primary walls, snaps/outer latch, text/cover/pocket,
operational controls, plate allocation, full assurance, documentation and main
commit/push remain unchanged. N1 developer owns these named support-construction
corrections serially; N2–N7 remain required. No user-authorized validation skip
is inferred and no physical claim is introduced.

| Criterion | Units / paths | Required evidence |
| --- | --- | --- |
| P2/P4,S2/S7,V2/V5/V6 | N1/N4/N5 source; N6 README | Actual seed stock, supported facets, neck/root spacing, capture, full sweeps, support removal and exact two-solid topology |
| P1/P5,S1/S8,V1/V5 | N3/N5 source; N6 README | All9 units/all14 exact components, groups/IDs/plates and production equivalence |
| S6/V3,remaining A9 trace | N1–N7 four owned paths | Protected stock/dimensions, all closures/reveals/glyphs, complete assurance/docs and verified origin/main |

### Planning assurance and approval record

Pending independent explorer and architect assurance of the complete effective
proposal and unchanged approved SPEC-A3. No completed geometry or physical
acceptance is claimed. Automatic authorization derives from the originating
valid implement request after supported findings are reconciled.

### A10 complete effective automatic approval and reconciliation — 2026-10-12

Independent explorer and architect verified complete proposed PLAN digest
`fb64d2dd866dfe73a23289b42b5798d80d7a6cb0ac4d8b850b9cfe4a9af41853`
and unchanged approved SPEC-A3/source. Explorer found scope, dependency,
coverage, exact native-surface substitution, full assurance and main delivery
consistent. Architect independently rebuilt the exact130-sector/11-ring grid:
1430 lower vertices,2600 lower triangles, minimum actual rise/run1.01659265,
maximum lowerY−2.046922772. All eight local-minimum vertices lie on the connected
real-stock outer seed arc; no non-seed local minimum was found. It reviewed
native Nef inspection and found no supported planning conflict. These establish
candidate feasibility and evidence-format fidelity, not implemented geometry.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A10 on 2026-10-12**, under the originating valid implement
request and implement's required automatic-amendment procedure. This replaces
A10 pending approval fields; earlier content/Status and SPEC-A3 remain unchanged.
All actual stock/facet/gap/full-motion/support-removal checks, N2–N7, integrated
review, independent QA, documentation and verified origin/main delivery remain
required. No manual user approval, clean STL or physical validation is claimed.

All five preceding production-pair Nef3 exports completed in10.8/9.1/9.9/10.2/
11.2 seconds; each has exactly two closed nondegenerate native polygon surfaces
with finite positive volumes and positive bed areas. Evidence manifest is
`/tmp/n1l-evidence/manifest.json`. These establish source topology before the
Safe5 seed correction, not acceptance of its old unsupported lower face.

Concurrent main advanced from entry `bb16242` to
`7ac835d6e99f4b343418fb4710b800450c7fd3d8` with disjoint shed source/artifacts
and README changes. Parent refreshed origin/main, verified no nested-safe source
or artifact overlap, and safely fast-forwarded only the detached implementation
worktree. Owned source/SPEC/PLAN bytes were verified unchanged; current README
now includes the shed update and must be preserved during final writer/integration.
Invoking nested-safe artifact bytes still match the original entry hashes.

## Amendment 11 — 2026-10-12 — Coupled inner snap allocation and accessible outer clip route

- Amendment ID: PLAN-nested-bank-safe-A11
- Previous version: automatically approved complete effective PLAN through A10,
  SHA-256 `b69ca92ae8a5d26792a007372f3b71fced307b1309a860ebacb9acebc003fcab`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required in-scope recovery under the originating
  `$implement specs/PLAN-nested-bank-safe.md:194` request. Temporary all-four
  candidates exposed a radial running-clearance deficit, decorative bridging,
  unsupported snap-feature starts, and the need to demonstrate the retained
  outer clip's actual flex route with the door permanently captive.

### Changes against the previous version

| Allocation | Before | After | Reason |
| --- | --- | --- | --- |
| Inner hook tip Z | Frame front; lateral release alone | Existing hinge-axis Z | Preserve at least0.35 released radial clearance throughout opening, with the same0.30 engagement and0.65 release |
| Inner catch/receiver | Catch begins frameFront+0.35; matching receiver limit | Catch begins axisZ+0.35; receiver ends at that same plane | Seat the raised hook without fusion and retain positive blocking |
| Hook/pad starts | Abrupt forward/lateral protrusions | Connected upward-growing roots described below | Provide modeled support in upright manufacture |
| Safe4 right decoration | Intersects moving pad/support | Secondary-only movement corridor cut | Keep the tab locally flexible without thinning its primary panel |
| Safe2 fixed knob | Center doorRight−9,Y34 | Center doorRight−10,Y34 | Clear the full release-pad travel; radii and heights preserved |
| Outer retained clip evidence | Rigid approach collides with neck | Actual connected jaw deformation, insertion and relaxation evidence | Demonstrate the existing snap installation without detaching the door |

### Dimensioned inner allocation

Keep tabX thickness0.80, Y18..30, primary-front width2.00, finite root overlap
Y17.95..18, catch engagement0.30, release0.65 and running allowance0.35.
Actual release remains the linear shear X′=X−0.65*(Y−18)/12; the tab, hook,
pad and their local roots move together, rather than disappearing in previews.
The non-text U-slot's inward boundary is doorRight−1.80, preserving the
released minimum0.35 between the tab and rigid panel.

The closing polygon runs from ZdoorBack+0.01 to ZhingeAxis. Its maximum tip
X is bodyInner+0.30, graded over Y28.5..30 by the inverse release shear so
the released tip is bodyInner−0.35 throughout that hook length. With tipZ
on the hinge axis, that tip's opening radius no longer grows past its initial
released X. Verify every other hook/root vertex against the same radial bound;
this scalar tip result alone is not whole-door acceptance. Preserve a closing
lead-in and positive seated blocking; force and fatigue remain excluded.

Add a connected hook root from the actual tab section at Y27..27.01 to the
complete closing profile at Y28.49..28.51. Its worst Safe5 lateral/forward
growth is below the1.49mm rise. The3x6 front pad remains XdoorRight−3..doorRight,
Y24..30,ZframeFront+0.35..+1.15. Its0.8mm-wide forward root starts at
Y20.65..20.66,ZframeFront−0.01..+0.01 and reaches frameFront+1.15 atY21.8.
The inward-growth hull runs Y21.8..24 and grows2.20mm in X, retaining its
45-degree allocation. Actual final facets and continuous release clearances
remain required; connected geometry alone does not prove printability.

Catch lip: XbodyInner..width,Y28..30.35,Zaxis+0.35..axis+1.15, retaining
0.80 forward thickness. Let catchFront=axis+1.15. Its wall-connected root
starts at Y=28−(catchFront−(frameFront−0.10)):26.50 for Safes2–4 and26.10
for Safe5. SeedZframeFront−0.10..frameFront; seedY thickness0.20. Hull to
the lip. The actual final downward facets have forward-rise/Y ratios
0.933333715/0.933333715/0.933333121/0.947368236, all within45degrees.
Catch frontZ47.75/35.75/25.75/14.65 remains within54/39/27/17 depth envelopes.

Apply the actual hook/snap receiving cutter after the complete body/catch union.
Its protected lower limit remains ZdoorBack+0.0001; top becomes axis+0.35.
Thus Safe5 primary stock at/belowZ10.85 is preserved. Do not substitute a full
unclipped rectangular cut through primary chamber walls. Verify primary stock,
chamber/extraction, retrieval and Safe5 rail/message/pocket boundaries on the
final source, not solely from these allocations.

For Safe4 only, subtract XdoorRight−4..doorRight+0.35,Y20.30..30.35,
ZframeFront−0.01..frameFront+1.50 from integral exterior decoration alone.
Keep this cutter inside that decoration's local difference, leaving the2mm
primary panel and exact text intact. It covers the complete pad/support shear
corridor with allowance. Safe2's fixed knob center moves inward1mm to
doorRight−10; Safes3–5 retain doorRight−9. All retain Y34 and their prior
radii/heights. Check actual continuous pad-to-knob clearance, not just the
seated pose. Fixed circular knobs require explicitly accessible removable
external supports unless final source proves their undersides self-supported;
no support-free or physical removal claim is introduced.

### Preserved outer mechanism and flex evidence

Safe1's A4/A5 rest cam, shaft/key/collar, clip, recess, stops and named static
fit exceptions remain byte-equivalent. The clip's nominal0.15 radial snap
allowance is preserved; it is not a0.35 running bearing. The32-sided source
bore yields approximately0.1464 conservative circular clearance even at rest.
No literal0.15 Euclidean minimum everywhere or new tolerance is asserted.

Temporary actual-rest-mesh evidence uses connected upper/lower10.7-degree
jaw rotation about rear[-1.8,0], graded by clamp((X+0.75)/0.75,0,1), leaving
rear material unchanged. Mouth opening1.512663mm exceeds the1.20 neck plus
two nominal0.15 gaps. Continuous6mm approach clears actual shaft/cam and
body/captive110-degree door; reversal demonstrates modeled removal. At the
installed seat,0..10.7-degree relaxation with conservative interval bounds
retains positive neck/cam separation. This geometric map has about6.3percent
volume change and is evidence of modeled access only, not material strain,
force, elasticity, fatigue or print feasibility. Restore the exact original
rest geometry after seating. Preserve cam-first installation and keyed/axial
shoulder retention; do not add a printed part or assume door detachment.

### Evidence, preserved scope and sequencing

Frozen temporary candidate SHA-256
`b026c4c6678a576257d189e4833c1dd90f29e7f9f7e0561ae4b809535f1b57ec`
at `/tmp/n2-catch/candidate.scad` is not promoted source or acceptance.
All-four closed seated intersections are empty; at1degree seated blocking
volumes are0.187214491/0.170219679/0.139234652/0.083858486mm³; released
1/5/110-degree checks are empty. Fresh final upright110 units each have two
positive, closed exact native surfaces, both with positive bed area. Actual
piecewise-convex pad/support shear envelopes clear the cleaned Safe4 decoration.
Logs identify the earlier catch-only prefix and the subsequent Safe4-only
removal; do not imply all checks ran at the final candidate hash.

Evidence roots: `/tmp/n2-four`, `/tmp/n2-corrected`, `/tmp/n2-catch`,
`/tmp/n2-access`, `/tmp/n2-clip`. These are temporary development evidence,
not source-controlled exports or independent final QA. Full continuous released
sweeps and deliberate release, closing action, manual access, all feature/support
paths, primary stock/extraction, protected reveals and final source equivalence
remain required. Safes1–4 printing-precision correspondence and the N1 candidate
gate also remain required; no missing check is waived.

Approved SPEC-A3 remains byte-identical. Nine units/fourteen solids, permanent
rigid hinges, body dimensions/primary walls, exact messages and appearance,
cover/pocket, controls/defaults, translation-only5mm-margin/3mm-gap packing,
full review/independent QA/documentation and verified origin/main delivery are
preserved. N2 owns named snap changes only after frozen N1 acceptance and this
amendment's planning assurance/automatic approval. N3–N7 remain unchanged.

| Criterion | Ownership | Required final evidence |
| --- | --- | --- |
| P3,S3/V2 inner closures | N2/N4/N5 source; N6 README | Seated blocking, actual continuous release/opening/closing, manual access and local flex connectivity |
| P4,S7/V6 manufacture | N2/N3/N5 source; N6 README | Actual supported roots, external knob-support withdrawal, positive bed/contact and print limits |
| S3/V2 preserved outer latch | N2/N4/N5 source; N6 README | Captive-door cam/shaft/clip route, restored rest retention/key/stops and explicit flex limits |
| S4–S6,V3/V4 preservation | N2–N5 source; N6 README | Exact text/decorative boundary,2mm primary stock, nesting/extraction and protected cover/pocket |
| P1/P5,S8,V1/V5 | N3–N7 four owned paths | Same nine units/fourteen solids, fresh footprints/selectors/plates and complete main delivery |

### Planning assurance and approval record

Pending independent explorer and architect assurance of the complete effective
proposal and unchanged approved SPEC-A3. Automatic authorization derives from
the originating valid implement request after supported findings are reconciled.
No manual user approval, implementation acceptance or delivery is claimed.

### A11 complete effective automatic approval and reconciliation — 2026-10-12

Independent explorer and architect verified complete proposed PLAN digest
`9db045b006ba10f173721cf66e32f284b63334e85439e24668f43d366919deca`
and unchanged approved SPEC-A3 digest
`047479b6f255a36da37e452f1e1e4e925c5e329ec91f18aca3bd8504afdce954`.
Explorer found no supported scope, authority, sequencing or delivery conflict.
Architect independently reproduced the catch fronts and seeds, approximately
1.38173mm combined Safe5 hook-root growth below1.49mm rise, and Safe2's
conservative approximately0.50483mm pad-to-knob clearance. It confirmed the
secondary-only decoration boundary and preserved nominal clip fit/physical
limitations. Neither reviewer accepted production geometry or waived remaining
criteria. No supported planning conflict or missing user behavior decision remains.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A11 on 2026-10-12**, under the originating valid implement
request and implement's required automatic-amendment authorization. This replaces
A11 pending approval fields; prior content/Status and SPEC-A3 remain unchanged.
No manual user review/approval is claimed. The complete effective scope is all
SPEC-A3 and N1–N7 with A8–A11's allocations, exact-source validation, full
independent review/QA/documentation and verified origin/main delivery.

Subsequent temporary released-door checks certified all22 intervals0..110 for
each of Safes2–5 using continuous separating-axis bounds and retained printing
triangles; exact source/printing correspondence still applies. They also found
the prototype hook's extra0.01mm inward overlap stock reduces its local U-slot
gap to0.34mm. Correct that implementation defect before promotion: align its
inner X boundary to the approved tab's doorRight−0.80 instead of−0.81. The
hook retains finite0.80mm lateral and1.99mm front/back overlap with the tab;
the allocated0.80 tab,0.35 running gap,0.30 engagement and0.65 release do not
change. Revalidate actual connectivity/slot gap and affected source equivalence;
these prototype sweep results are not acceptance of the narrower gap. N1
printing correspondence/candidate acceptance and all remaining N2–N7 criteria
remain outstanding. No physical acceptance, completed implementation or Git
delivery is asserted.

## Amendment 12 — 2026-10-12 — Inner snap numerical clearance reserve

- Amendment ID: PLAN-nested-bank-safe-A12
- Previous version: automatically approved complete effective PLAN through A11,
  SHA-256 `75e30ae93c14bc08b9cd9aed983b982206e540256071909a4e9b21e8e4ac99a5`.
- Approval: Pending automatic implementation approval after planning assurance.
- Request and purpose: Required numerical conformance recovery under the
  originating valid implement request. Exact native terminal slot gaps in the
  conforming0.35 nominal prototype measured0.349987602/0.349999046/
  0.349990463/0.349997139mm. Keep the minimum0.35 criterion; add geometric
  reserve instead of accepting these deficits or rounding evidence upward.

### Changes against the previous version

| Allocation | Before | After at approved defaults | Reason |
| --- | --- | --- | --- |
| Snap running construction allowance C | 0.35 | 0.36 | Leave reserve over literal native0.35 minimum |
| Release travel R | 0.65 | 0.66 =0.30+C | Preserve0.30 engagement and a full C released gap |
| Slot inward edge | doorRight−1.80 | doorRight−1.82 =doorRight−(0.80+R+C) | Preserve C between released0.80 tab and rigid panel |
| Pad underside | frameFront+0.35 | frameFront+C | Preserve literal0.35 separation from primary panel |
| Catch rear/receiver top | axisZ+0.35 | axisZ+C | Keep seated clearance and matched receiving cut |
| Pad/catch front | underside/rear+0.80 | Same0.80 thickness | Preserve secondary feature stock while shifting0.01 |

### Complete dimensioned reserve allocation

Use named derived C=max(0.36,moving_clearance_mm), retaining the source
default moving_clearance_mm=0.35 and the approved upper0.40 allocation.
At default C=0.36, R=0.30+C=0.66. The inverse hook grading and actual
above-root shear both use R/12; engagement stays0.30. The fixed root at
Y17.95..18 remains stationary, with aboveY18 deformation continuous at that
plane. Keep hook innerX=doorRight−0.80, not the failed−0.81 overlap.
All other tab/closing-profile and axis-tip geometry from A11 is preserved.
Verify actual native gaps>=0.35, including all hook/root vertices, not just
these algebraic nominal values. The unchanged C0.35 prototype's empty old/new
receiver symmetric differences and eight positive manifold door exports do
not establish this new allocation's geometry.

Pad: XdoorRight−3..doorRight,Y24..30,ZframeFront+C..frameFront+C+0.80.
Forward root seedY=21.8−(C+0.80)=20.64 at default; its seed thickness remains
0.01 in Y and0.02 in Z straddling frameFront. Grow to full pad-front height
atY21.8; preserve the supported inward-growth hullY21.8..24. Hook-root
seedY27 and targetY28.49..28.51 remain; check supported facets after the
slightly changed inverse grading. Fixed knob allocations remain unchanged.

Catch lipZaxis+C..axis+C+0.80. Wall root seedY is
28−(axis+C+0.80−(frameFront−0.10)):26.49 for Safes2–4 and26.09 for Safe5
at defaults. Keep finite wall overlap and final receiver subtraction after
the complete body/catch union, protected belowZdoorBack+0.0001. Receiver
upper clipping plane and offset allowance both use C. Default catch fronts
47.76/35.76/25.76/14.66 remain within54/39/27/17 envelopes. Do not cut
primary walls, pocket/rails or extraction reservations to obtain clearance.

Safe4's decoration-only reserve corridor becomes
XdoorRight−(3+R+C)..doorRight+C,Y(21.8−(C+0.80))−C..30+C,
ZframeFront−0.01..frameFront+C+0.80+C. At defaults this is
XdoorRight−4.02..doorRight+0.36,Y20.28..30.36,ZframeFront−0.01..+1.52.
It remains inside difference(integral_exterior_details), preserving the
2mm primary panel and exact lettering. Body receiving offsets, manual pad
approaches and all release-envelope checks must use the same C/R allocation.

### Preserved behavior, evidence and obligations

SPEC-A3 remains byte-identical: it requires intentional externally accessible
snap release, engagement and running clearance, not a particular thumb-travel
number. This0.01mm increase is a PLAN construction allocation, with no new
user-adjustable control or operating state. Keep source defaults,0.80 local
tab/2mm primary panels,0.30 engagement, exact dimensions/messages/reveals,
outer latch/clip and their named static exceptions, five rigid captive units,
nine units/fourteen solids, packing and delivery unchanged. Physical forces,
comfort, strain and print/material performance remain excluded.

The earlier prototype's full released sweeps, continuous deliberate-release
envelopes and front3x6 approaches establish feasibility only. Revalidate the
changed source: native topology/volumes/contact, literal gaps, continuous
release/opening/closing, supported growth and accessible external knob-support
removal, preserved primary stock/extraction/reveal, printing correspondence
and fresh manufacturing footprints. Do not reuse earlier hashes as this
allocation's results. Temporary evidence roots are `/tmp/n2-final-candidate`,
`/tmp/n2-sweep` and `/tmp/n2-release-access`. N1 acceptance still precedes
production N2; N2–N7/full review/independent QA/documentation and verified
local main commit/origin/main push remain required.

### Planning assurance and approval record

Pending independent explorer and architect assurance of complete effective
A12 and unchanged approved SPEC-A3. Automatic authorization derives from the
originating valid implement request after supported findings are resolved.
No manual user approval, implementation acceptance or delivery is claimed.

### A12 draft planning reconciliation — 2026-10-12

Architect assurance of preceding proposed digest
`19ceffe4f467b22619f6ad8a635665e6bc8dd435c65d97b8bc4fa78c776c6990`
identified the same numerical deficit at the prototype door slot's upper plane:
Y30.34999942779541 against tabY30. Resolve this explicitly in the complete
effective A12 allocation: door U-slot upperY=30+C, length=12+C fromY18,
including both panel-cut pieces; keep the finite fixed root at/belowY18.
Inspect actual native X and Y slot gaps, all Z/pad/catch gaps and diagonal
interfaces against the unchanged0.35 minimum. Body receiving offsets and
their clipping-box Y bounds likewise use C rather than old0.35 literals:
lowerY=17.95−C, upperY=30+C, preserving the protected primary-stock Z limit.

Explorer verified the numerical measurements but noted the absence of a
HANDOFF.md directly in `/tmp/n2-final-candidate`. The artifact cites that
evidence directory, not that absent filename. Candidate provenance is the
verified SHA747fc3c723ccdbf132e0050d947663845c329fc4617e6ef1efd123edf896eb1a,
its exact native inspections/slot-gap.json and
`/tmp/n2-release-access/HANDOFF.md`; no absent handoff is acceptance evidence.
This record resolves the provenance interpretation without inventing a file.
The current complete effective proposal requires renewed explorer/architect
assurance before automatic approval. No other boundary or criterion changes.

### A12 complete effective automatic approval — 2026-10-12

Independent explorer and architect renewed assurance against complete proposed
digest `bc24b6a624c8100307343092e8d58a57474f82b2bbc1b8855159a5cab2982ea2`
and unchanged approved SPEC-A3. The architect's supported slot-top finding is
resolved by30+C/12+C and matched receiver bounds; the provenance clarification
identifies actual retained evidence. Both found no remaining supported planning
conflict or missing user behavior decision. Architect independently reproduced
reserve ranges, catch fronts/seeds, supported root growth and knob-clearance
margin. These are planning assurance, not geometry acceptance.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A12 on 2026-10-12**, under the originating valid implement
request and implement's required automatic-amendment authorization. This
replaces A12 pending fields without changing prior content/Status or SPEC-A3.
Complete scope remains SPEC-A3/N1–N7 with A8–A12 allocations and every still-
required geometry, independent review/QA, README, main/origin/main delivery and
cleanup obligation. No manual user review/approval is claimed.

### N1 parent candidate acceptance and handoff — 2026-10-12

Parent verified frozen source
`4d8948ba8b2e9e7b21a275acc0a97dc9c820bb2c331afa53414bb2744ed2f5fb`
against the complete N1 candidate criteria. All five articulated pairs have
exactly two closed, oriented, nondegenerate native surfaces with positive
volumes and positive bed areas. Source-equivalent Safes1–4 geometry is unchanged
by the conditional Safe5 recovery; Safe5 has fresh native/printing exports.
Continuous0..110-degree separating-axis certificates and native-to-retained-
printing-surface transfer are complete. Exact rounded chains and retained
boundary wires, including collapsed segments, establish one-way coverage;
the conservative6E maximum0.00004550mm fits the0.0001 per-mesh certificate
allowance. No printing topology repair is implied: body STL zero-area counts
7/4/2/0/0 remain disclosed and every triangle was retained in motion checks.
Evidence is `/tmp/n1u-final/proof-chain.json` and its hash manifest.

Separate joint bounds preserve running gaps, minimum cup wall and head/throat
capture. Actual post-cut Safe5 lower slope minimum1.016602210 and axial gap
0.359999657 pass. The shared legacy post-cut root/saddle gap is0.358795835;
3109 growing lower facets satisfy gradient>=1. Its one flat seed facet5750 is
wholly buried in retained frame stock, verified by exact coordinate bounds,
actual primary-cube references and exclusion of all other cutters. Minimum
stock margins are0.399999 behind the front and0.0058 beyond root relief;
`/tmp/n1w-seed/stock-proof.json` records full-facet containment for Safes1–4.
All-five supported roots/bands and full roof-support withdrawal envelopes are
covered by retained source bounds and continuous prism checks, including fresh
Safe5 paths in `/tmp/n1n-motion`. No slicer/physical result is asserted.

N1 alone is accepted for handoff to production N2. This is not complete SPEC
acceptance or implementation delivery. N2 must implement approved A11/A12 on
this exact frozen predecessor and obtain fresh affected evidence; older snap
prototypes with0.34/sub0.35 gaps are not accepted. N3–N7 remain outstanding.
Source, amendments and acceptance evidence are not committed or pushed.

## Amendment 13 — 2026-10-12 — supported snap seed and unified hook root

- Amendment ID: PLAN-nested-bank-safe-A13
- Previous version: complete effective PLAN through PLAN-nested-bank-safe-A12
- Approval: Pending
- Request and purpose: required construction correction during the originating
  `$implement specs/PLAN-nested-bank-safe.md:194` execution. Fresh native
  inspection found an unsupported pad-seed ledge and nearly coincident hook/root
  interfaces. Preserve SPEC-A3 behavior while correcting their construction.

### Changes against the previous version

| Section / requirement | Before | After | Reason |
| --- | --- | --- | --- |
| A12 forward pad seed | ZframeFront−0.01, height0.02, straddling the tab front | Same origin/Y0.01 thickness, Zheight0.01 ending at frameFront | The original seed produces a real0.01mm forward horizontal ledge; the corrected seed remains buried in the tab |
| A11/A12 hook and support union | Separate free hookY28.5..30 and hull of rectangular seedY27..27.01 with targetY28.49..28.51 | One parametric hull of a ramp-clipped seed, target span and full free-hook span, all using the same unexpanded hook profile | Remove almost coincident internal caps while retaining the closing-ramp plane and free-end engagement |

The exact clipped seed is the intersection of the original block
`[r−0.8,27,b]`, size`[0.8,0.01,2]`, with
`inner_hook_span(i,27,27.01)` using zero overlap. Here r is door_right_mm(i),
b is door_back_mm(i), and the existing hook helper retains its inverse
Y grading R/12. Construct one hull containing that intersection,
`inner_hook_span(i,28.49,28.51)` and
`inner_hook_span(i,28.5,30)`. Do not separately union the free-hook span.
Do not bake exported vertex coordinates or use the exploratory X/Z padding.
The helper, seed and hull remain derived from the adjustable/derived source
allocations. All inputs satisfy the same affine outer ramp halfspace; the seed
bottom becomes b+0.01 and its clipped corner remains inside the existing tab.

### Preserved behavior and impact

SPEC-A3 remains byte-identical. Preserve the outer hook ramp/free-end tip,
0.30 engagement, C=max(0.36,moving_clearance_mm), R=0.30+C, finite fixed root
at/belowY18, local0.8mm tab, primary2mm panel, externally accessible3x6mm pad,
fixed decorative knobs, actual release preview and deliberate release gates.
All dimensions, nesting/retrieval, exact messages, cover/pocket/reveals, outer
keyed latch/static exceptions, captive hinges, nine units/fourteen solids,
selectors/packing defaults, full assurance and main/origin/main delivery remain.
Physical force, fatigue, slicer contacts and printing/material results remain
unverified and excluded exactly as before.

The seed correction is already present in partial production source
`757a9a0963b65642c37916c6b16cb109d205451d7547e8629c87b207dbdaaa12`,
but has not been accepted or delivered. Preserve that work pending this
amendment; further root edits remain temporary until approval. Fresh evidence
is `/tmp/n2o-stock`, `/tmp/n2r-support`, `/tmp/n2u-support` and
`/tmp/n2w-support`. Increasing inner X overlap and forcing eager union did not
resolve every actual seam. Literal-coordinate shared meshes are diagnostic only.
The unclipped full-hull alternative is rejected: the architect found a Safe2
point atY28.75 protruding0.0700324971mm beyond the intended ramp plane.
The clipped-seed recipe avoids that specific geometric expansion.

N2 owns this named source correction after complete effective planning assurance
and automatic approval. Verify every actual postboolean supported facet, native
topology/volumes/bed contact and literal gaps on the final source. Establish
source inclusion or fresh continuous closing/release/opening coverage, receiver
stock equivalence, and cover/outer-latch/extraction correspondence; do not
silently reuse prior source hashes. All previously required N2–N7 criteria,
integrated independent code review, final independent QA, README and delivery
remain required. No validation is waived, no unsupported native facet is hidden,
and no mesh repair/export substitution is authorized by this amendment.

### Approval record

Pending explorer and architect assurance of the complete effective PLAN and
unchanged approved SPEC-A3. Automatic approval, after supported findings are
resolved, derives from the originating valid implement request and implement's
automatic-amendment procedure. No manual user review, implementation acceptance,
commit or push is claimed.

### A13 draft construction refinement — 2026-10-12

Architect analysis identified the remaining coplanar seed/tab boundary as a
credible continuation of the observed kernel seams. Refine the preceding
clipped-seed allocation before approval: use seed block origin
`[r−0.79,27,b+0.01]`, size`[0.78,0.01,1.98]`, intersected with
`inner_hook_span(i,27,27.01)` with zero overlap. This supersedes only A13's
original full-width seed block. Keep the original0.8mm tab unchanged.
The seed is at least0.01mm inside the tab's X/Z boundaries, with positive
default clipped bottom width0.625mm. Use the same one hull of this seed,
targetY28.49..28.51 and full hookY28.5..30; no extra union or profile padding.

All inputs lie inside the same convex affine hook prism. ForY>=28.49 the
hull equals the original hook exactly; only root stock below28.49 shrinks.
Analytical maximum target-vertex XZ growth from seed endY27.01 toY28.49
is0.66901/0.67655/0.68615/1.39320mm forSafes2..5, below the1.48mm rise.
These establish a construction proposal, not actual native facet/topology or
motion acceptance. Fresh validation and complete effective explorer/architect
assurance remain required; preceding approval/preservation/delivery boundaries
remain unchanged.

### A13 validated construction reconciliation — 2026-10-12

The final temporary source candidate
`6f1ebcdd8d87bc2a8ba6c2aedc8a3ce373dc618fb533b3f063bb677157785b40`
uses A13's original ramp-clipped full-width seed, not the optional inset seed
proposed in the preceding refinement. All four actual postboolean support
audits pass, all four pairs retain two positive manifold solids with bed area,
and the continuous release envelopes/pad approaches are clear. Select this
validated recipe: seed block`[r−0.8,27,b]`, size`[0.8,0.01,2]`, intersect
with`inner_hook_span(i,27,27.01)` using zero overlap; one hull also contains
the unchanged targetY28.49..28.51 and free hookY28.5..30. The optional inset
seed is superseded and is not an implementation requirement. Its numerical
connection/growth estimates are advisory only, not evidence for this candidate.
The clipped seed still has positive volumetric connection inside the existing
tab. Keep the pad seed height0.01 and remove exploratory root padding.

Evidence is `/tmp/n2x-support`. The untrimmed full-hull alternative adds
approximately0.176..0.216mm³ outside the former shape and is rejected.
Actual clipped-candidate-minus-old native differences are nonzero,
6.97..8.05×10⁻⁷mm³, despite analytical affine-profile preservation. Do not
claim native equality or infer motion/receiver equivalence from ideal inclusion.
Verify fresh affected gaps, closing/opening/release, body-stock and preserved
geometry correspondence as already required. These development findings do not
accept production N2 or waive any still-required criterion. Complete effective
explorer/architect assurance of this reconciliation precedes automatic approval.

### A13 complete effective automatic approval — 2026-10-12

Explorer and architect independently assured complete proposed digest
`c98862421c134f1436691d36cd4c77cdc52ed7b8e1a5875df14c59dd33a08547`
against unchanged approved SPEC-A3. Both verified preserved A12 bytes, the
selected original ramp-clipped full-width seed and candidate provenance,
disclosure of nonzero native differences, and unchanged required assurance/
delivery scope. Neither found a supported remaining planning conflict. Architect
recomputed clipped-seed target-vertex XZ growth0.655931/0.663497/0.673125/
1.379662mm versus1.48mm rise and positive tab-volume connection. These are
planning findings, not final source or physical acceptance.

Approval: **Automatically approved complete effective PLAN through
PLAN-nested-bank-safe-A13 on 2026-10-12**, under the originating valid implement
request and implement's required automatic-amendment procedure. This supersedes
A13's pending approval fields without changing prior content/Status or SPEC-A3.
The complete scope remains SPEC-A3/N1–N7 with effective A8–A13 construction
allocations, fresh affected geometry evidence, independent integrated review,
final QA, README, verified local main commit/origin/main push and cleanup.
No manual user approval, production acceptance, commit or push is claimed.

### N2 parent acceptance and current-source handoff — 2026-10-12

Parent accepted frozen N2 source
`6f1ebcdd8d87bc2a8ba6c2aedc8a3ce373dc618fb533b3f063bb677157785b40`
for handoff after A13 integration and fresh affected validation. All four native
paired units have two closed oriented positive-volume solids, positive bed
contact and supported postboolean snap/catch facets. Actual seated doors block
at1degree solely against the catch; partial-deflection doors remain connected,
and the finite root at/belowY18 is unchanged throughout release. Evidence is
`/tmp/n2aa-engagement`, `/tmp/n2x-support` and `/tmp/n2y-final`.

Fresh whole-body/released-door certificates for every5degree interval0..110
are complete for all four safes: `/tmp/n2ab-motion` and `/tmp/n2ac-motion`.
Exact native-to-retained-export coverage bounds fit0.0001mm per-mesh
allowances; all raw triangles, including degeneracies, were retained.
Thirty-three fresh continuous closing/relaxation envelopes and four full
body/partial-door critical checks are empty in `/tmp/n2ae-closing`, each within
15seconds. The actual single clipped compound and fixed root are included;
exposed-lip contact is covered separately, not silently removed.

Native critical slotX/Y, padZ and hook/lipZ gaps exceed0.35 in
`/tmp/n2af-gaps`. These are named interface checks, not an exhaustive global
surface-distance claim. Safes2..4 native ramp halfspaces are inward. Safe5's
rounded low back corner has7.21×10⁻⁶mm excess against the ideal plane;
`/tmp/n2ag-active-plane/proof.json` proves the full regionZ<=12 cannot reach
X38 under any hinge angle, while the entire higher native convex region remains
inward after actual catch-plane rounding. Required active travel0.39757858mm
is below the existing allocation. No native contact-angle digits or physical
forces/elastic performance are claimed.

Fresh current-body cover/seat/removal/reinsertion and all four full-child-box
extractions pass in `/tmp/n2ad-preservation`. The cover travels+Y61 then+Z20;
seated contacts are exactlyY5 and contain no3D material. Preserved literal
retrieval access, primary stock, dimensions, cover/pocket/messages and outer
mechanism are source-correlated. Safe1 cam/shaft/clip motion, installation and
removal remain covered by unchanged reachable geometry and the retained
`/tmp/n2m-outer`, `/tmp/n2-access` and `/tmp/n2-clip` evidence.

Tiny nonzero receiver/body differences under A13 were retained and led to
fresh current-body validation; receiver-envelope similarity alone was not
accepted as body equivalence. Source/STL precision, slicer contacts, physical
printing/freeing, material fit, fatigue and forces remain unverified. N2 alone
is accepted for N3 handoff, not final implementation delivery.

### N3 integrated development handoff — 2026-10-12

Current frozen production source is
`c61342f3cef6902712ad1f80133d4c3874148e628bbe369a79586c6330af8223`.
Exactly nine manufacturing units contain fourteen native solids: Safe1 four
units/five solids, Safes2..4 one unit/two solids each, Safe5 two units/three
solids. Every body group contains one captive body_door_unit; all door groups
are empty, only Safe1 has mechanism parts, and only Safe5 has the cover detail.
Legacy IDs and inner mechanism IDs reject. Source defaults remain unchanged.

Reversible implementation defaults: analytic manufacturing rectangles reserve
0.01mm on eachXY edge without changing part geometry; normalization and packing
remain rigid translations, with5mm margins and3mm gaps. The outer handle's
manufacturing origin is algebraically rebased before180degree rotation so its
native bed face is exactlyZ0. Default-zero origins preserve installed geometry,
verified by five raw/canonical assembly CSG comparisons; no trimming, added
stock, repaired mesh or new part was used. The tiny old handle floor offset and
nonzero numerical native volume delta are disclosed in `/tmp/n3b-bed`.

Nine production-dispatch unit STLs and seven populated group STLs exported
within15seconds; thirteen groups are deliberately empty. Plate1 exported;
plate2 and overview0 timed out at15seconds. Required attempts are retained in
`/tmp/n3c-exports`. The approved subdivision route proves all9 actual placed
source subtrees for plate1/plate2/overview, preserving every real primitive,
Boolean and transform. `/tmp/n3d-layout` records deterministic two-plate
allocation: four units/five solids and five units/nine solids. Current native
bounds fit reservations, minimum native plate margin5.010000581mm; source
allocator gaps are3mm. Echo rounding is not used to shrink clearances.

Fresh actual unit CSGs correlate with nine native exports in `/tmp/n3a-inventory`
and the corrected handle in `/tmp/n3b-bed`: all14 solids are closed, oriented,
positive-volume and have exact positive bed area. All manufacturing control
overrides produce identical geometry. Seventy-five selector/default/rejection
checks and current all-nine control checks pass. `/tmp/n3e-preservation`
verifies108/110 reachable mechanical definitions byte-identical to accepted N2;
two default-zero handle origins preserve actual installed CSG. Exact exterior
and hidden messages, blank Safe5 exterior,34x55 first face,30x40x3 pocket and
glyph minimum0.80424mm remain intact.

Parent inspected actual exported plate top and oblique views. Modeled external
knob-support guide bounds, transformed by current unit normalization, fit the
current reservations (`/tmp/n3-parent-guides/proof.json`). This is a modeled
reservation check, not slicer contact/toolpath or material validation.
Raw unit STL zero-area triangle counts for body pairs1..5 are8/7/1/11/0;
other unit meshes have none, and plate1 has23. No triangle was repaired or
excluded, and no clean STL/slicer/physical claim replaces exact native geometry.

These records document authorized implementation defaults and development
validation; they change no approved behavior, criterion, scope, authority or
destination. N3 candidate handoff proceeds to required integrated independent
code review, consolidated corrections, final independent QA, documentation,
verified main/origin/main delivery and cleanup. Source and artifacts are not
committed or pushed; no final implementation acceptance is claimed.

### N4 independent review disposition and N5 acceptance — 2026-10-12

One integrated independent code-review wave covered mechanics, manufacturing/
selectors/layout, and outer closure/text/cover/preservation on frozen source
`c61342f3cef6902712ad1f80133d4c3874148e628bbe369a79586c6330af8223`
and complete PLAN digest
`acc8db2e5ed5ef05258f420405f6d3781a7d5f4cba4784fcbb1d637fe446e083`.
All three reviewers found no supported source defect. Consolidated accepted
source correction batch is empty. The layout review's fresh-gate coverage
recommendation was accepted into N5, rather than claiming the earlier matrix
already covered those cases. No contract/security assurance trigger applies.

Independent final QA on the unchanged source completed115 fresh selector,
dimension, assembly-gate and print-state checks, including67 expected assertion
rejections; all pass. Twenty groups reconcile with13 deliberate empties and
nine valid unit IDs. Assertion logs were checked because CSG rejection can
exit0. Evidence is `/tmp/n5-selectors-qa`.

`/tmp/n5-native-qa` contains nine fresh current-production native exports and
exact inspections: fourteen closed oriented nondegenerate finite positive
solids, zero boundary/topology defects, exact minZ0 and positive exact bed
areas. Pure cam_clip needed the documented disjoint-cube Boolean conversion
to obtain Nef data, without changing its geometry. Current factories,
all-nine control invariance and exact placed CSG subdivision correlate.
Independent full-precision allocation yields two plates, minimum actual native
margin5.010000581mm and interunit AABB separation3.019990845mm.

`/tmp/n5-support-qa` independently audits fresh normalized manufacturing
geometry:10/11/11/10 downward snap/root/pad/hook/catch faces forSafes2..5,
all<=45degrees. All four modeled support-guide downward facets pass as well.
Current source preservation, five assembly CSG comparisons, all37 closing
logs and recorded motion/access/extraction coverage were independently checked.
Knob contact gaps, intended bridges, slicer toolpaths and physical/material
performance remain unverified, as in the approved modeled-validation scope.

Parent verified frozen hashes and ran git diff --check. N5 is accepted within
the approved modeled geometry scope; no confirmed acceptance failure,
regression or other qualifying concern requires a repeated assurance cycle.
Unit tests remain not applicable/prohibited, with none created or run. Required
N6 documentation and N7 verified main/origin/main delivery/cleanup are next;
no completed Git delivery or physical result is claimed by this record.

### N6 documentation completion and final delivery assessment — 2026-10-12

The documentation specialist synchronized only the nested-safe README section;
all preceding repository documentation remains byte-preserved. Parent inspection
requested clarification of support withdrawal versus printing and separation of
selector checks from native geometry QA. These documentation corrections do not
change geometry, controls, approved requirements or earlier assurance results.

Development, independent integrated review, final QA and documentation fulfill
the approved modeled-validation scope. Unit tests are prohibited and were not
created or run. No physical or slicer evidence is claimed; retained raw export
degeneracies and bounded-render/subdivision limitations remain disclosed.
All automatically approved A8–A13 amendments and preceding approved bytes remain
recorded above. SPEC is unchanged from the approved entry. Parent will deliver
only the four owned source/document/artifact paths on main, verify origin/main,
and remove only the reconciled clean temporary implementation worktree. Git
delivery is pending at the time of this pre-commit record; the actual commit and
remote verification belong in the execution-end report, never a future SHA here.
