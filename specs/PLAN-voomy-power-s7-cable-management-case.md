# PLAN: Voomy Printed-Base Removable-Cover Fit Calibration

Status: Approved

Approved Specs:

- `specs/SPEC-voomy-power-s7-cable-management-case.md`
- `specs/SPEC-voomy-top-cover-hook-projection.md`
- `specs/SPEC-voomy-usb-cap-fit.md`

Component Plans:

- `specs/PLAN-voomy-top-cover-hook-projection.md`
- `specs/PLAN-voomy-usb-cap-fit.md`

## Objective And Execution Boundary

Calibrate only the top cover and USB cover to the already-printed base. Set the
top-cover hook ledge `13.5 mm` below the printed base top, use a `2.0 mm`
hook height and `2.0 mm` outward projection, and derive a `15.5 mm` arm
reach. Change the USB lower-tab upward shift from `2.0 mm` to `1.0 mm`.
The complete base remains immutable.

Implementation must treat the approved specs and plans as its complete behavior
and execution contract. It must not repeat product, architecture, scope,
planning, or plan-discovery research. A materially different source, printed
part, or fit condition requires an artifact amendment.

## Clean-Context Gate

Implementation may begin only in a new session, after context is cleared, or
after the user explicitly confirms same-context implementation. After that
gate, load only applicable instructions, the approved artifacts, branch and
index state, the affected files, and minimal local edit patterns.

## Final Scope And Owned Files

- `designs/voomy_power_s7_cable_management_case.scad` — top-cover calibration
  values, derivations, assertions, hook/arm geometry, and USB lower-tab shift.
- `README.md` — final dimensions, installation guidance, immutable-base
  boundary, reprint scope, and physical-validation limitations.
- The three approved Voomy specs and three matching plans named above.

No base shell, receiver hole, receiver catch, floor, wall, cable passage, USB
opening, ventilation field, exterior envelope, or unrelated design may change.
Generated STL, STEP, 3MF, OFF, CSG, PNG, and similar outputs remain temporary
under `/tmp` and outside Git.

## Branch, Checkout, And Delivery Contract

- Delivery branch: existing `main` in the invoking checkout.
- Expected base: `origin/main` at
  `cd2d90e86491ef3e9d604536bf826916308049fc`.
- Linked worktree: no. Preserve the previously approved direct-`main`,
  invoking-checkout implementation choice.
- Before edits, verify the invoking checkout remains on `main`, fetch
  `origin/main`, and require `HEAD` and the refreshed `origin/main` to equal
  the expected base. Stop on a mismatch rather than choosing a different base,
  branch, checkout, or worktree.
- Classify every staged, unstaged, untracked, deleted, and renamed path. The
  approved spec and plan changes are in scope; preserve and identify any
  unrelated user changes that appear before implementation.
- No worktree detachment or invoking-checkout artifact cleanup applies because
  implementation and delivery remain in the invoking checkout.

## Test-First Policy

Unit tests and conventional test-first work are prohibited by repository
instructions and are not applicable. No test-writer or test-focused unit is
used. Planned test-focused concurrency is `0`.

OpenSCAD assertions, bounded `assembly` and `printable_layout` renders or
exports, source/diff inspection, independent review, main-agent QA, and later
physical printing are the applicable evidence.

## Dependency-Aware Execution Graph

Every subagent assignment is bounded to no more than five minutes of active
work. D1 and D2 are serialized because they own the same SCAD file. The main
agent supervises dependencies, time limits, integration, QA, staging, commit,
push, and final acceptance.

### V0 — Checkout And Immutable-Base Baseline

- Type: main-agent validation gate.
- Boundary: confirm the clean-context gate, branch/base, artifact status, and
  exact source baseline for every base-generating parameter and module.
- Owned files: none.
- Dependencies: none beyond the clean-context gate.
- Acceptance criteria: every path is classified; the current base source is
  recorded for focused comparison; receiver holes remain nominally
  `12.6 x 5.6 mm`; USB opening remains `36.0 x 60.0 mm`; printed
  `11.5 mm` receiver-top and `3.55 mm` wall measurements are treated only as
  cover-calibration inputs.
- Validation: Git status, branch/base verification, artifact inspection, and
  focused source baseline.
- Subagent assignment: none; main-agent gate.

### D1 — Measured Top-Cover Clamp And Hook Calibration

- Type: development.
- Boundary: change only top-cover calibration derivations, assertions, arm
  reach, and hook geometry while freezing all base-generating code.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance criteria:
  - named cover-calibration values record the printed `11.5 mm` receiver-top
    margin and `3.55 mm` wall thickness without changing base dimensions;
  - each installed retention ledge is `13.5 mm` below the seated base top,
    providing exactly `2.0 mm` capture below the measured upper edge;
  - hook height is `2.0 mm`, hook tip is `15.5 mm` below the base top, and
    arm reach from the seated roof underside to the tip is `15.5 mm`;
  - the nominal `5.6 mm` receiver height derives a `17.1 mm` modeled lower
    edge and `1.6 mm` nominal lower-edge clearance;
  - outward hook projection is `2.0 mm`; with unchanged `0.3 mm` inward arm
    clearance, effective receiver penetration is `1.7 mm` and the hook remains
    `1.85 mm` inside the measured exterior wall face;
  - hook width remains `12.0 mm`, arm thickness remains `2.4 mm`, and all
    four compensated clamp coordinates, the roof, skirt, ventilation, and
    printable orientation remain unchanged;
  - assertions bind every final dimension, preserve positive joins and
    connectivity, and prohibit hook contact with the modeled receiver lower
    edge or projection through the measured exterior wall;
  - no base-generating parameter, transform, assertion, or module changes.
- Validation: source assertions, focused immutable-base diff, installed
  hook/receiver envelope inspection, and bounded reference-free `assembly`
  evaluation.
- Subagent assignment: one clean-context `developer`, owning only the SCAD
  top-cover calibration boundary, for at most five minutes.

### D2 — USB Lower-Tab 1 mm Shift

- Type: development.
- Boundary: keep both upper USB tabs fixed and change only the complete lower
  pair's upward shift from `2.0 mm` to `1.0 mm`.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D1, because both units share the SCAD file.
- Acceptance criteria:
  - exactly four connected printable tabs remain;
  - upper shafts, hooks, lead-ins, press features, and positions are unchanged;
  - both complete lower shafts, hooks, lead-ins, and press features move
    together upward exactly `1.0 mm` from their unshifted positions;
  - each lower hook tip remains `0.55 mm` inside the lower opening edge and
    acts as bottom-first location while the upper pair retains snap engagement;
  - panel size and outside-wall seating remain unchanged;
  - base opening, front wall, and all other base geometry remain unchanged;
  - assertions distinguish upper/lower positions and prove the exact shift,
    four-tab connectivity, and immutable opening.
- Validation: source assertions, focused diff, installed envelope inspection,
  and bounded reference-free `assembly` evaluation.
- Subagent assignment: one new clean-context `developer`, owning only the USB
  tab boundary, for at most five minutes.

### D3 — Final-State Voomy Documentation

- Type: documentation development.
- Boundary: update only the Voomy README section for the approved cover
  calibration, installation sequence, reprint scope, and DRAFT boundary.
- Owned file: `README.md`.
- Dependencies: D1 and D2.
- Acceptance criteria: README matches all final dimensions and semantics;
  distinguishes measured printed-base inputs from unchanged source-base
  dimensions; requires reprinting only the top and USB covers; preserves
  bottom-first USB insertion and physical-fit limitations; changes no unrelated
  documentation.
- Validation: artifact/source/document consistency and focused diff inspection.
- Subagent assignment: one clean-context `developer`, owning only the Voomy
  README section, for at most five minutes.

### R1 — Top-Cover Contract And Geometry Review

- Type: independent read-only code review.
- Boundary: audit D1 and matching documentation against both approved
  top-cover specs, with special attention to physical-input math, hook
  containment, immutable base, connectivity, and printability.
- Owned files: no writes; inspect the SCAD top-cover diff, Voomy README section,
  approved specs, and plans.
- Dependencies: D1 and D3.
- Acceptance criteria: report exact locations for every spec/plan mismatch,
  unsupported calculation, base regression, assertion gap, or printability risk;
  explicitly report no findings when applicable.
- Validation: artifact, source, documentation, and focused diff inspection.
- Subagent assignment: one clean-context `code-reviewer` for at most five
  minutes.

### R2 — USB-Cover Contract And Geometry Review

- Type: independent read-only code review.
- Boundary: audit D2 and matching documentation against the approved USB spec.
- Owned files: no writes; inspect the SCAD USB diff, Voomy README section,
  approved specs, and plans.
- Dependencies: D2 and D3.
- Acceptance criteria: report exact locations for every mismatch in shift
  distance, unchanged upper pair, tab connectivity, base preservation,
  installation envelope, assertions, documentation, or printability; explicitly
  report no findings when applicable.
- Validation: artifact, source, documentation, and focused diff inspection.
- Subagent assignment: one clean-context `code-reviewer` for at most five
  minutes.

### F1 — Accepted Review Or QA Fixes

- Type: conditional development.
- Boundary: resolve only accepted R1, R2, or main-agent QA findings within the
  approved artifacts.
- Owned files: only files directly implicated by an accepted finding.
- Dependencies: the relevant finding.
- Acceptance criteria: each finding is resolved without scope expansion and all
  affected validation is repeated.
- Validation: finding-specific checks plus the final validation sequence.
- Subagent assignment: one new clean-context `developer` per non-overlapping
  finding, at most five minutes; serialize every SCAD edit.

## Concurrency And Timeout Supervision

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1` for shared SCAD work; D3 begins only
  after D1 and D2.
- Review maximum concurrency: `2`; R1 and R2 may run concurrently after D3.
- At five minutes, stop an active subagent, record completed and partial work,
  changed files, validation, blockers, and remaining work, preserve usable
  changes, then split the remainder before assigning a clean-context agent.

## Main-Agent QA And Overall Validation

The main agent must:

1. Run `git diff --check` and inspect all staged and unstaged changes.
2. Evaluate all OpenSCAD assertions with OpenSCAD 2021.01-compatible syntax.
3. Generate reference-free `assembly` and `printable_layout` renders or
   exports under `/tmp`; stop any command that exceeds 15 seconds.
4. Inspect the top-cover `13.5 mm` ledge offset, `2.0 mm` vertical capture,
   `2.0 mm` hook height and projection, `15.5 mm` tip/arm reach,
   `1.7 mm` penetration, nominal lower-edge clearance, and all four unchanged
   compensated clamp coordinates.
5. Inspect the exact `1.0 mm` USB lower-pair shift, unchanged upper pair,
   `0.55 mm` lower-edge inset, four connected tabs, and outside-wall seating.
6. Compare all base-related parameters, transforms, assertions, and modules
   against V0; accept no receiver, catch, shell, wall, floor, passage, opening,
   ventilation, or envelope change.
7. Confirm `printable_layout` still contains three separate supported,
   broad-face-down printable objects within the nominal plate assertions.
8. Reconcile every review finding and complete final main-agent acceptance.

OpenSCAD evidence cannot prove slicer behavior, insertion force, retention,
cycling, or physical fit. Without new prints and physical checks, implementation
delivery and its commit remain DRAFT.

## Physical Acceptance

- Reprint only the top cover and USB cover; reuse the existing base.
- Top cover: verify all four hook ledges sit below the receiver upper edges,
  hooks remain clear of lower edges and exterior wall faces, the cap seats
  without wall deflection, remains removable, and survives at least 20 cycles
  without whitening, cracking, delamination, excessive force, wall damage, or
  retention loss.
- USB cover: insert the lower pair first, rotate the panel toward the wall, and
  verify the unchanged upper pair enters and snaps without panel bending or base
  stress; confirm seating, removal, and repeated cycling.

## Documentation, Reconciliation, Commit, And Push

- Before committing, reconcile every modified, added, deleted, renamed, and
  untracked path. Preserve and identify unrelated user changes.
- Stage every accepted in-scope path, including the SCAD source, README, all
  three approved specs, and all three approved plans. Inspect
  `git diff --cached --name-status`, the full staged diff,
  `git diff --cached --check`, and the prospective commit path list.
- Commit directly on `main` with
  `fix: DRAFT calibrate Voomy removable-cover fit` unless every physical
  acceptance check runs and passes during implementation.
- Push to `origin/main`, verify local `main` is synchronized with its
  upstream, and inspect final status. Do not report completion while any
  accepted in-scope change remains outside the pushed commit.
- The completion report must cover implementation, review/QA findings and
  resolutions, validation run and not run, documentation, residual risk,
  commit/push status, no-worktree status, DRAFT or final state, skipped or
  blocked requirements, Definition of Done, and final main-agent acceptance.
