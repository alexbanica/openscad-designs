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
