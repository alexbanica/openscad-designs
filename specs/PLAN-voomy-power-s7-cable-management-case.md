# PLAN: Voomy Removable-Cap Physical Fit

Status: Approved

Approved Specs:

- `specs/SPEC-voomy-power-s7-cable-management-case.md`
- `specs/SPEC-voomy-usb-cap-fit.md`

Companion Plan: `specs/PLAN-voomy-usb-cap-fit.md`

## Objective And Execution Boundary

Correct both removable printed parts without changing the already-good case
base. The top cover receives four calibrated hook-only clamps that do not load
the base wall: a `2.4 mm` signed tangential compensation around the capsule and
an exact `7.7 mm` upward hook correction. The USB cover keeps four unchanged-
size tabs, leaves the upper pair fixed, and moves the complete lower pair upward
exactly `2.0 mm`.

Implementation must use the approved specs and this final-state plan as its
complete behavior and execution contract. It must not repeat product,
architecture, scope, planning, or plan-discovery research. A materially
different physical or source condition requires an artifact amendment.

## Clean-Context Gate

Implementation may begin only in a new session, after context is cleared, or
after the user explicitly confirms same-context implementation. After that
gate, load only applicable instructions, the approved artifacts, branch and
index state, the affected files, and minimal local edit patterns.

## Final Scope And Owned Files

- `designs/voomy_power_s7_cable_management_case.scad` — replace the top-cover
  release-pad/wall-loading assemblies with calibrated hook-only clamps, preserve
  the complete base, and move only the lower USB pair upward `2.0 mm`.
- `README.md` — document the calibrated hook-only top-cover interface, fixed
  base, four-tab USB arrangement, bottom-first installation, and physical-
  validation boundary.
- `specs/SPEC-voomy-power-s7-cable-management-case.md` — approved top-cover
  contract included in delivery.
- `specs/SPEC-voomy-usb-cap-fit.md` — approved USB-cover contract included in
  delivery.
- `specs/PLAN-voomy-power-s7-cable-management-case.md` — this integrated plan.
- `specs/PLAN-voomy-usb-cap-fit.md` — the matching USB component plan.

No base shell, receiver hole, receiver catch, floor, wall, cable passage, USB
opening, ventilation field, exterior envelope, or unrelated design may change.
Generated STL, STEP, 3MF, OFF, CSG, PNG, and similar outputs remain temporary
under `/tmp` and outside Git.

## Branch, Checkout, And Existing-State Contract

- Delivery branch: existing `main` in the invoking checkout.
- Expected base: `origin/main` at
  `f60e93593b79a4e2d247146987c2848b5b961b08`.
- Linked worktree: no. The user explicitly authorized the current branch and
  prohibited a worktree for this change.
- Before edits, verify the invoking checkout is still `main`, `HEAD` and
  `origin/main` still equal the expected base, and no branch or worktree
  transition occurred. Stop on conflict rather than selecting another base.
- Preserve the accepted staged Voomy USB-cap work already present in `README.md`,
  the SCAD source, and its spec/plan, then implement this approved delta on top.
- Preserve and exclude the unrelated staged `AGENTS.md`,
  `specs/SPEC-worktree-implementation-main-delivery.md`, and
  `specs/PLAN-worktree-implementation-main-delivery.md` changes. Do not restore,
  modify, unstage, or include them in the Voomy commit.
- Reclassify every path at implementation start because the current status may
  change before the clean-context handoff.

## Test-First Policy

Unit tests and conventional test-first work are prohibited by repository
instructions and are not applicable. No test-writer is used. OpenSCAD
assertions, bounded renders or exports, source/diff inspection, independent
review, main-agent QA, and later physical printing are the applicable evidence.

Planned test-focused concurrency: `0`.

## Dependency-Aware Execution Graph

Every subagent assignment is bounded to no more than five minutes of active
work. The two geometry units are serialized because they own the same SCAD
file. The main agent supervises all dependencies, time limits, integration,
artifact status, QA, commit, and push.

### V0 — Checkout, Index, And Immutable-Base Baseline

- Type: main-agent validation gate.
- Boundary: classify staged, unstaged, untracked, renamed, and deleted paths;
  record the immutable base receiver and USB-opening geometry; confirm the
  expected branch/base and accepted staged Voomy layer.
- Owned files: none.
- Dependencies: clean-context gate.
- Acceptance criteria: in-scope and unrelated changes are explicitly
  classified; base receiver holes remain `12.6 x 5.6 mm`; the USB opening
  remains `36.0 x 60.0 mm`; no test-focused phase starts.
- Validation: Git status, staged and unstaged name/diff inspection, exact base
  verification, and focused source inspection.
- Subagent assignment: none.

### D1 — Calibrated Hook-Only Top-Cover Clamps

- Type: development.
- Boundary: replace only the cap-side top-cover clamp assemblies with simple
  interior cantilever arms and hook heads, apply the approved tangential and
  vertical corrections, and freeze all body geometry.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance criteria:
  - receiver holes, positions, vertical spans, internal catches, and body
    modules remain unchanged at their current geometry;
  - exactly four `12.0 mm`-wide clamps remain; width does not change;
  - each clamp consists only of one straight interior arm and one `0.8 mm`
    hook head; release pads, press projections, wall-loading arm placement,
    skirt-pocket bypasses, and other cap-side wall-loading features are removed;
  - each arm remains at least `0.3 mm` inside the base inner wall, and only its
    hook head enters the receiver opening;
  - receiver-local tangential compensation is exactly `2.4 mm`, producing
    installed coordinates front X `35.6`, left-end Y `2.4`, rear-left X
    `-39.6`, and rear-right X `22.4 mm`;
  - each installed hook ledge is at Z `195.5 mm` and each complete head spans
    Z `194.7..195.5 mm`, corresponding to source ledge Z `14.5 mm`, source tip
    Z `15.3 mm`, and a `12.3 mm` arm reach from the roof underside;
  - hook projection remains `0.8 mm` and is not increased;
  - the hook heads catch the receiver openings' upper edges and do not rely on
    the existing internal catches;
  - assertions cover compensated coordinates, hook span, wall clearance,
    unchanged width/projection, connectivity, and absence of arm/wall overlap;
  - cap roof, ventilation, skirt, envelope, and printable orientation remain
    unchanged.
- Validation: assertions, focused source diff, immutable-body comparison,
  installed hook/opening inspection, and bounded reference-free `assembly`
  evaluation.
- Subagent assignment: one clean-context `developer` owning only the SCAD
  top-cover interface for at most five minutes.

### D2 — USB Lower-Pair Shift

- Type: development.
- Boundary: retain four USB tabs, keep both upper tabs fixed, and translate the
  complete lower pair upward exactly `2.0 mm` without any base change.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D1, because both units share the SCAD file.
- Acceptance criteria:
  - exactly four connected and printable tabs remain;
  - upper shafts, hooks, lead-ins, press features, and positions are unchanged;
  - each lower shaft, hook, lead-in, and press feature moves together upward
    exactly `2.0 mm`;
  - the lower pair acts as bottom-first locating tabs and the upper pair retains
    positive snap engagement;
  - panel size and outside-wall seating remain unchanged;
  - the base opening, front wall, and all other base geometry remain unchanged;
  - independent assertions distinguish upper and lower positions.
- Validation: assertions, focused diff, installed-envelope inspection, and
  bounded reference-free `assembly` evaluation.
- Subagent assignment: one new clean-context `developer` owning only the USB
  tab geometry for at most five minutes.

### D3 — Final-State Documentation

- Type: documentation development.
- Boundary: update only the Voomy README section for the approved calibrated
  hook-only top-cover and USB-cover fit behavior, reprint scope, installation
  sequence, and DRAFT gap.
- Owned file: `README.md`.
- Dependencies: D1 and D2.
- Acceptance criteria: dimensions and behavior match the final source; the base
  is explicitly unchanged; top-cover arms do not load the wall and only hook
  heads enter the fixed holes; only the top cover and USB cover require
  reprinting; the USB lower pair is described as the locating pair and the upper
  pair as the retaining pair; no unrelated README content changes.
- Validation: source/document consistency and focused diff inspection.
- Subagent assignment: one clean-context `developer` owning only the Voomy
  README section for at most five minutes.

### R1 — Top-Cover Contract And Geometry Review

- Type: independent read-only code review.
- Boundary: review the top-cover implementation and documentation against the
  approved top-cover spec, focusing on immutable base geometry, exact
  receiver-local compensation, hook-height derivation, hook-only simplification,
  wall clearance, receiver-edge engagement, connectivity, and printability.
- Owned files: no writes; review the SCAD top-cover diff, README, and approved
  top-cover artifact context.
- Dependencies: D1 and D3.
- Acceptance criteria: report exact locations for every mismatch, regression,
  unsupported assertion, or printability risk; explicitly report no findings
  when none exist.
- Validation: source, artifact, and diff inspection.
- Subagent assignment: one clean-context `code-reviewer` for at most five
  minutes.

### R2 — USB-Cover Contract And Geometry Review

- Type: independent read-only code review.
- Boundary: review the USB implementation and documentation against the USB
  spec, focusing on the exact lower shift, unchanged upper pair, four connected
  tabs, installation envelope, panel seating, and immutable base.
- Owned files: no writes; review the SCAD USB diff, README, and approved USB
  artifact context.
- Dependencies: D2 and D3.
- Acceptance criteria: report exact locations for every mismatch, regression,
  unsupported assertion, or printability risk; explicitly report no findings
  when none exist.
- Validation: source, artifact, and diff inspection.
- Subagent assignment: one clean-context `code-reviewer` for at most five
  minutes.

### F1 — Accepted Review Or QA Fixes

- Type: conditional development.
- Boundary: resolve only accepted R1, R2, or main-agent QA findings within the
  approved specs.
- Owned files: only files directly implicated by the accepted finding.
- Dependencies: the relevant finding.
- Acceptance criteria: the finding is resolved without scope expansion and all
  affected validation is repeated.
- Validation: finding-specific checks plus the final validation sequence.
- Subagent assignment: one new clean-context `developer` per non-overlapping
  finding, at most five minutes; serialize every SCAD edit.

## Concurrency And Timeout Supervision

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1` for SCAD work; documentation may begin
  only after both SCAD units complete.
- Review maximum concurrency: `2` because R1 and R2 are read-only and
  non-overlapping.
- At five minutes, stop an active subagent, record completed and partial work,
  changed files, validation, blockers, and remaining work, preserve usable
  changes, and split the remainder before assigning a new clean-context agent.

## Main-Agent QA And Overall Validation

The main agent must:

1. Run `git diff --check` and inspect the complete staged and unstaged diff.
2. Evaluate all OpenSCAD assertions with 2021.01-compatible syntax.
3. Produce reference-free `assembly` and `printable_layout` renders or exports
   under `/tmp`, stopping any command that exceeds 15 seconds.
4. Inspect all four top-cover `2.4 mm` tangential compensations, the `7.7 mm`
   upward correction, exact installed hook spans, interior arm clearance,
   absence of release pads and wall-loading geometry, cantilever connectivity,
   skirt seating, and hook-to-receiver-edge engagement.
5. Inspect the USB bottom-first insertion envelope, unchanged upper pair,
   exact `2.0 mm` lower shift, four connected tabs, and outside-wall seating.
6. Compare all base-related source and geometry against the baseline; accept no
   receiver-hole, catch, body, wall, floor, passage, USB-opening, ventilation,
   or envelope change.
7. Confirm `printable_layout` still contains three separate, supported,
   broad-face-down printable objects and fits the nominal plate assertions.
8. Reconcile every independent review finding and complete final main-agent
   acceptance.

OpenSCAD evidence cannot prove slicer behavior, insertion force, retention,
cycling, or physical fit. Without new prints and physical checks, delivery and
the commit remain DRAFT.

## Physical Acceptance

- Reprint only the top cover and USB cover; reuse the existing base.
- Top cover: all four hook heads enter without force or wall deflection, the
  arms remain clear of the base wall, all hooks catch the receiver openings'
  upper edges, the cap seats flush and remains removable, and 20 cycles cause no
  whitening, cracking, delamination, excessive force, wall damage, or retention
  loss.
- USB cover: insert the lower pair first, rotate the panel to the wall, and
  confirm the unchanged upper pair enters and snaps without bending the panel
  or stressing the base; confirm seating, removal, and repeated cycling.

## Documentation, Reconciliation, Commit, And Push

- Update README behavior and printing guidance only as required above.
- Before committing, reconcile every modified, added, deleted, renamed, and
  untracked path. Preserve and identify unrelated user changes.
- Stage every accepted in-scope path, including both approved specs and both
  approved plans. Use path-limited staging and commit so the unrelated staged
  workflow-policy paths remain preserved but excluded.
- Inspect `git diff --cached --name-status`, the complete staged diff,
  `git diff --cached --check`, and the prospective commit path list.
- Commit directly on `main` with
  `fix: DRAFT correct Voomy removable cap fit` unless all physical acceptance
  checks pass during implementation, in which case `DRAFT` may be omitted.
- Push the commit to `origin/main`, verify local `main` is not ahead of its
  upstream, and inspect final status. Do not report completion while any
  accepted Voomy change remains outside the commit.
- The completion report must cover implementation, review and QA findings,
  resolved findings, validation run and not run, documentation, remaining risk,
  commit/push status, DRAFT or final status, skipped or blocked requirements,
  Definition of Done, and final main-agent acceptance.
