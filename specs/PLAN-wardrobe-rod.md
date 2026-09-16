# One-piece wardrobe rod implementation plan

Status: Approved

Iteration: 2026-09-16 — extend each insertion end by 10 mm.
Approval: User explicitly approved this revised implementation plan in the
conversation on 2026-09-16.

## Authority and scope

Implement the approved `specs/SPEC-wardrobe-rod.md`: one 340 mm open-ended
PLA tube, 22 mm OD, 14 mm ID, with 300 mm clear span and 20 mm insertion at each
end. No behavior changes beyond that specification. Source patterns are the
repository's adjustable/derived parameter sections, named geometry modules,
and render-mode dispatch; no further product research is needed.

Owned paths:

- `designs/wardrobe_rod.scad` (insertion-depth defaults only)
- `README.md` (wardrobe-rod usage section only)
- `specs/SPEC-wardrobe-rod.md` (approved authority and reconciliation)
- `specs/PLAN-wardrobe-rod.md` (this plan and execution evidence)

Preserve all unrelated files and index state.

## Workspace, base, and delivery

Research checkout: `/home/alexbanica/workspace/openscad-designs`, branch `main`.
Research SHA: `3a46df7265e57c677810ea556f96746d46ea0d5b`.
Implementation worktree: `/home/alexbanica/.herdr/worktrees/openscad-designs/wardrobe-rod`.
Final delivery branch and upstream: local `main` and `origin/main`.

After plan approval and clean-context entry, fetch `origin/main`; require the
research SHA to equal or be an ancestor of it. Inspect intervening changes for
effects on owned paths, direct dependencies, governing instructions and approved
assumptions, including renames and deletions. Only proven non-impact permits
advancing. Failed fetch, non-descendant history or uncertain impact stops for
assessment and any required amendment. Record and freeze the execution SHA
before source edits; do not silently rebase afterward.

Create a clean detached worktree at that SHA, or reuse only a verified matching
clean worktree. Record original HEAD, index and content recovery state; copy
approved artifacts and verify byte identity using `sha256sum`. Do not change
the invoking checkout during implementation. Existing conflicting worktrees or
local main divergence block automatic integration; do not overwrite them.

Repository instructions override the skill's ordinary task-branch delivery:
after accepted validation, reconcile the complete owned change set into the
invoking local `main`, verify its base and preserve unrelated changes, inspect
exact staged paths, commit there, and push `origin main`. Include approved
SPEC/PLAN artifacts in delivery. Verify the accepted commit is on `origin/main`
and the upstream is correct. Remove only the reconciled clean temporary
worktree, without force. Missing validation, unsafe reconciliation, failed push
or incomplete cleanup remains DRAFT; no alternate branch constitutes delivery.

## Assurance and roles

Profile: routine. This is one isolated parametric design and associated usage
documentation, with no executable dependencies, deployment, security changes,
or shared software contracts. Discovery of a full-assurance trigger stops for
plan amendment.

Main performs development, documentation, validation, integration, and final
acceptance. Explorer/developer delegation adds no useful independent work to
this small change. One fresh independent generic worker configured with `gpt-5.6-luna` performs
code review of the integrated diff
against the approved artifacts and validation evidence, preserving the user
choice `use luna` from the preceding delivery. Confirm its actual launched model.
It is read-only, bounded
to five minutes, with a frozen manifest/digests and no Git delivery authority.
Main disposes findings and applies one consolidated accepted correction batch,
then repeats affected validation. Distinct QA is unnecessary because the checks
below cover modeled acceptance and independent review checks their sufficiency;
physical and slicer validation are explicitly outside implementation evidence.
Unit tests and conventional test-first work are prohibited and not applicable.

## Serialized work units

### WR-1: Model and development validation

Owner: main. Path: `designs/wardrobe_rod.scad`. Prerequisites: approved artifacts,
verified execution base and transferred authority. Target one bounded five-minute
work unit; report a checkpoint if unfinished rather than treating it as accepted.

Change only `left_insertion_depth_mm` and `right_insertion_depth_mm` defaults
from 10 to 20. Derived total length becomes 340 mm. Preserve the 300 mm clear
span, 22 mm outside diameter, 4 mm radial wall and 14 mm bore. Keep existing
modules, assertions, render dispatch and printable-layout default unchanged.

Retained reversible implementation defaults: 96 circumferential facets and
0.1 mm axial bore overrun per end. No new adjustable parameter or geometry.

Acceptance: approved dimensions, one continuous open tube, specified placement,
both render modes, parameter assertions, no other geometry or dependencies.

### WR-2: Durable documentation

Owner: main. Path: `README.md`. Depends on WR-1; serialized with model changes.
Update length/engagement descriptions to 340/300/20 mm. Recalculate the
45-degree footprint as (340 + 22) / sqrt(2) = 255.973 mm per axis, leaving
approximately 0.014 mm per side on the specified 256 mm plate. Explicitly state
that this is nominal geometric fit with essentially no usable margin and that
supports, brim or reserved areas may prevent slicing in this orientation.
Preserve all other usage, material, slicer and physical-validation guidance.
No generated documentation command applies. Target five minutes.

### WR-3: Integrated review and delivery

Owner: main, with the independent read-only Luna worker. Depends on WR-1/WR-2.
Freeze source diff, artifact digests, acceptance criteria and evidence. Review
geometry, parameters, print placement, scope and README consistency. Main
handles the consolidated correction batch and affected checks, then records
evidence in PLAN, reconciles, commits and pushes as specified above. Reviewer
deadline: five minutes, interrupted at expiry with incomplete evidence reported.
No concurrent mutations or duplicate unchanged successful checks.

## Validation commands and evidence

Run from the implementation workspace, with previews kept under `/tmp`:

```sh
timeout 15s openscad -o /tmp/wardrobe-rod-layout.off designs/wardrobe_rod.scad
timeout 15s openscad -D 'render_mode="assembly"' -o /tmp/wardrobe-rod-assembly.off designs/wardrobe_rod.scad
timeout 15s openscad --render --autocenter --viewall --imgsize=1200,800 -o /tmp/wardrobe-rod-layout.png designs/wardrobe_rod.scad
timeout 15s openscad --render --autocenter --viewall --imgsize=1200,800 -D 'render_mode="assembly"' -o /tmp/wardrobe-rod-assembly.png designs/wardrobe_rod.scad
git diff --check
```

Use a working X display for PNG commands. The previous delivery established
that this installed OpenSCAD build requires X even with Qt offscreen mode.
If needed, reuse the temporary Xvfb setup under `/tmp/wardrobe-rod-xvfb` after
checking availability, exporting its library path and a local `DISPLAY`; stop
the display after rendering. Bound each render to at most 15 seconds. Do not
install system packages or treat unavailable rendering as success. Inspect both images
for placement, connected geometry, open ends and unintended features. Inspect
OFF geometry bounds and connectivity with a temporary read-only geometry
inspection script, not a unit test: assembly bounds must correspond to
340 × 22 × 22 mm and printable XY bounds to approximately 255.973 mm, Z=0–22 mm,
within mesh numerical tolerance. Check the 14 mm bore against source and mesh
end rings. Review assertion guards directly; do not add or run unit tests.

Timeouts and unavailable rendering are missing evidence, not passes; resolve
within approved constraints or report a blocker. Final main-agent checks include
`git diff --check` and `git diff --cached --check` plus exact staged-path review.
No mesh or PNG files enter Git. Record actual outcomes without claiming physical
fit, sliced support clearance, retention, load capacity or creep endurance.

## Approval and handoff

Only plan approval authorizes this implementation/delivery procedure. Implementation
starts through `implement` in a new session, cleared context, or with explicit
same-context consent. Main retains requirements, integration and acceptance.

## Iteration delta and preserved choices

This plan replaces the completed 320 mm implementation plan; prior execution
and review records remain in Git history at the research SHA. At approval, this iteration had no execution or validation results; completed
evidence is recorded below. Only two source defaults and related
README dimensions/fit guidance change. Preserve the existing construction,
orientation, printer/material target, routine assurance, independent Luna review,
main-owned documentation, linked-worktree delivery to main, and physical/slicer
validation exclusions. No additional product research or agent discovery work
is needed for this bounded parameter revision.

## Execution evidence — 2026-09-16

Fresh-session entry verified. Fetched origin/main equals research and frozen
execution SHA `3a46df7265e57c677810ea556f96746d46ea0d5b`; no intervening changes.
Created the planned clean detached worktree at that SHA. Invoking main has only
the two approved unstaged artifacts and an empty staged diff. Recovery bytes,
original diff and index manifest retained under `/tmp/wardrobe-rod-recovery`.
Transferred artifacts byte-verified: SPEC SHA-256
`c2e7b3da378d45dbfcf9328c119c1457be52a8bb5f85aff3ebb09f91d03b7a44`;
original approved PLAN SHA-256
`59ed90a42ff012e62c0a579e22fa052fdffea23ea1bed60f6308e73f4edff1ad`.

Development validation: both planned OFF exports and both PNG renders passed
(exit 0; each under 15 seconds). Reused temporary Xvfb on :97 and stopped it
following rendering. Images under `/tmp/wardrobe-rod-{layout,assembly}.png`
show the expected single horizontal tube, changed XY orientation, visible open
end and no unintended geometry. Source and both mesh end rings establish the
through-bore where the camera obscures the far opening.
Read-only OFF inspection found one connected mesh in each mode and all 1152
edges incident to two faces. Assembly bounds: X -170..170, Y -11..11, Z 0..22 mm.
Layout bounds: X/Y -127.986..127.986, Z 0..22 mm (255.972 mm XY extent,
consistent with 255.973 mm after OFF coordinate rounding). Both assembly end
rings have 192 vertices, radii approximately 7 and 11 mm (maximum rounding
error below 0.00006 mm), confirming 14 mm bore and 22 mm OD. Guards and unchanged
render dispatch inspected directly. `git diff --check` passed. Unit tests and
conventional test-first phases skipped as prohibited/not applicable.

WR-3 independent read-only review completed with no findings or blockers by
fresh generic worker `wardrobe_review`. Actual `gpt-5.6-luna` launch verified
from its session turn-context metadata. Reviewer verified all frozen digests,
source scope, mesh bounds, both images, README consistency and diff hygiene;
recommended acceptance. No correction batch was necessary. Routine-profile
main assessment: development geometry evidence plus independent review covers
all modeled criteria; distinct QA is not required. Documentation synchronized
by main. No physical or slicer acceptance is claimed. Final reconciliation
retains the approved SPEC and this PLAN in the four-path delivery; no generated
exports are included. Commit/push and guarded cleanup are verified separately
in the delivery report, rather than claimed before they occur.
