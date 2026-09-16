# One-piece wardrobe rod implementation plan

Status: Approved

Approval: User explicitly approved this implementation plan in the conversation.

## Authority and scope

Implement the approved `specs/SPEC-wardrobe-rod.md`: one 320 mm open-ended
PLA tube, 22 mm OD, 14 mm ID, with 300 mm clear span and 10 mm insertion at each
end. No behavior changes beyond that specification. Source patterns are the
repository's adjustable/derived parameter sections, named geometry modules,
and render-mode dispatch; no further product research is needed.

Owned paths:

- `designs/wardrobe_rod.scad` (new)
- `README.md` (design listing and wardrobe-rod usage section only)
- `specs/SPEC-wardrobe-rod.md` (approved authority and reconciliation)
- `specs/PLAN-wardrobe-rod.md` (this plan and execution evidence)

Preserve all unrelated files and index state.

## Workspace, base, and delivery

Research checkout: `/home/alexbanica/workspace/openscad-designs`, branch `main`.
Research SHA: `a9ea1e434a9fd9ce76d9a35db5b1c6537e8ffc13`.
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
this small change. One independent code-reviewer reviews the integrated diff
against the approved artifacts and validation evidence. It is read-only, bounded
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

Expose `clear_span_mm`, `left_insertion_depth_mm`, `right_insertion_depth_mm`,
`outside_diameter_mm`, `wall_thickness_mm`, and `render_mode` near the top.
Derive length and bore diameter. Use a centered cylinder difference, orient its
axis horizontally, and raise its center by its outer radius. Printable layout
adds 45-degree XY rotation; assembly omits that rotation. Default to printable
layout. Assert valid dimensions and supported render modes.

Reversible implementation defaults: 96 circumferential facets (a multiple of
four preserving the lowest vertex at the bed plane), and a small axial
subtraction overrun to guarantee open bore ends. Neither is an additional
user-adjustable fit dimension.

Acceptance: approved dimensions, one continuous open tube, specified placement,
both render modes, parameter assertions, no other geometry or dependencies.

### WR-2: Durable documentation

Owner: main. Path: `README.md`. Depends on WR-1; serialized with model changes.
Add the source to the design listing and document all parameters, modes,
320/300/10 mm length interpretation, OD/ID, diagonal fit, slicer starting
settings and validation limits from SPEC. Explain that a 4 mm CAD wall is not
the slicer's wall count and that modeled bore space remains empty. Document
adhesion, overhang, bore bridging and removable-support inspection. No generated
documentation command applies. Target five minutes.

### WR-3: Integrated review and delivery

Owner: main, with one independent read-only code-reviewer. Depends on WR-1/WR-2.
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

Use `QT_QPA_PLATFORM=offscreen` for PNG commands if needed. Inspect both images
for placement, connected geometry, open ends and unintended features. Inspect
OFF geometry bounds and connectivity with a temporary read-only geometry
inspection script, not a unit test: assembly bounds must correspond to
320 × 22 × 22 mm and printable XY bounds to approximately 241.83 mm, Z=0–22 mm,
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

## Execution evidence

- Frozen execution base: `cf4476a6f7eecf575c5e3a04a108de7c019ee79f`, fetched
  from origin/main; research SHA is its ancestor. The only intervening change
  removes `.codex/agents/default.toml`; the plan uses main and code-reviewer,
  so this unused role deletion has no impact on the planned scope or assurance.
- Invoking main initially equals execution base; index is empty. Only the two
  approved artifacts are untracked. Detached worktree HEAD was verified equal
  to the execution base before source edits. Original artifacts remain in the
  invoking checkout as recovery copies. Transfer SHA-256 digests match:
  SPEC `d42de46418bac1d5f2da071afd2756c17e978315b691086a8f7a7931046e49c6`;
  PLAN `f4992652e759d274c85ecb957e2342ef1e92384dc078f18756c43bfa915a3e4c`.
- Development checks passed: both OFF exports (under one second each), one
  connected mesh per mode, every mesh edge incident to two faces. Assembly
  bounds are X=-160..160, Y=-11..11, Z=0..22 mm; layout bounds are
  X/Y=-120.915..120.915, Z=0..22 mm. Both assembly end rings have inner/outer
  vertex radii approximately 7/11 mm (OFF rounding within 0.00004 mm).
- Both PNG renders passed and were visually inspected for continuous tube form,
  horizontal placement, orientation and absence of extra geometry. End openings
  are supplemented by source and mesh-ring inspection because of oblique views.
- Conformance-only environment substitution: original PNG commands with
  `QT_QPA_PLATFORM=offscreen` failed because this OpenSCAD build requires X.
  The same OpenSCAD render options and image outputs succeeded with `DISPLAY=:92`
  using a temporary Xvfb unpacked under `/tmp/wardrobe-rod-xvfb`, with its tool
  directory redirected to `/tmp/wr`. No system packages were installed. Xvfb
  was bounded to 14 seconds; each render to 12 seconds. Coverage, geometry,
  assurance and outputs are unchanged; nonfatal keyboard keysym warnings do
  not affect rendered geometry. Temporary display processes were terminated.
- `git diff --check` passed. Assertion guards were reviewed directly. No unit
  tests or conventional test-first work were performed, per repository policy.
- WR-3 independent review is BLOCKED: native `code-reviewer` failed at startup
  with HTTP 400: `gpt-5.3-codex-spark` is not supported with this ChatGPT account.
  The skill-authorized single same-role retry requested `gpt-5.6-luna`, but the
  native role still launched Spark and failed identically. Neither reviewer
  inspected the change; no independent-review pass is claimed.
- Main's bounded fallback inspection found no source/README conformance issue,
  but does not satisfy the plan's independent-review criterion. No correction
  batch was indicated by the completed checks. Distinct QA remains inapplicable
  under the routine plan; the required independent evidence is still missing.
- Status: DRAFT, implementation and development validation complete; independent
  review, final reconciliation, commit/push and clean-worktree removal pending.
  Original invoking artifacts and index remain unchanged. Preserve this detached
  worktree for recovery. A working native reviewer or explicitly approved review
  procedure amendment is required before acceptance and delivery.

## Approved review recovery amendment

The user replied `use luna` to the explicit request to use a fresh generic worker
configured with `gpt-5.6-luna` for independent review and then finish delivery.
This replaces only the unavailable native reviewer launch with an independent,
read-only generic worker running that model. The frozen source, criteria,
five-minute deadline, assurance independence, no-edit/no-Git authority, and main
acceptance/delivery responsibilities remain unchanged. The worker checks the same
SPEC/PLAN, full source and README diff, and development evidence. No review gate
is bypassed. This supersedes the preceding review-blocked status once the review
successfully completes; acceptance and delivery remain conditional on its result.

## Final acceptance assessment

- The approved recovery worker ran on `gpt-5.6-luna` (confirmed from its session
  turn metadata) and completed independent WR-3 review within five minutes.
  All four handoff digests matched. It inspected the source, README diff,
  authority artifacts, existing OFF bounds and PNGs, and whitespace checks.
  Result: no findings; no corrective source batch or repeated renders required.
- Main accepts the modeled behavior and documentation against the approved
  criteria. Development evidence plus independent review covers the routine
  assurance scope; distinct QA is not required. Unit tests remain prohibited.
- Definition of Done for geometry/documentation is satisfied. Physical holder
  fit, retention, slicer output, load capacity and PLA creep remain unvalidated
  as explicitly excluded from implementation evidence. Git delivery and guarded
  cleanup are verified externally after this recorded pre-delivery assessment.
