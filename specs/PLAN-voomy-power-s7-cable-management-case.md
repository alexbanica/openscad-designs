# PLAN: Voomy Top-Cover Clamp-To-Receiver Alignment

Status: Approved

Approved Spec: `specs/SPEC-voomy-power-s7-cable-management-case.md`

## Objective

Correct the four top-cover retention clamp sites so their installed centerlines
coincide with the four unchanged base receiver centerlines. Preserve the already
good case base and every unrelated Voomy behavior. Deliver the approved spec,
this plan, the OpenSCAD correction, and matching documentation in one commit and
push.

Implementation must use the approved spec as the complete behavior contract and
this plan as the complete execution approach. It must not perform product,
architecture, scope, planning, or plan-discovery research. If implementation
reveals a materially different discrepancy, stop for artifact amendment.

## Clean-Context Gate

Implementation may begin only in a newly started session, after context is
cleared, or after the user explicitly confirms same-context implementation for
that invocation. After the gate, load only applicable instructions, the approved
artifacts, branch/worktree state, the affected files, and minimal local edit
patterns.

## Final Scope And Ownership

- `designs/voomy_power_s7_cable_management_case.scad` — separate clamp-site
  coordinates from the inset skirt radius, realign the four clamps and their
  pocket/bypass clearance geometry, and replace the offset-accepting assertion.
- `README.md` — document that the correction is top-cover-only, the existing
  base remains unchanged, and physical fit requires reprinting only the cap.
- `specs/SPEC-voomy-power-s7-cable-management-case.md` — include the approved
  final behavior contract in delivery.
- `specs/PLAN-voomy-power-s7-cable-management-case.md` — include this approved
  final-state execution contract in delivery.

No other source is modified. The base shell, receiver holes, receiver catches,
floor, cable passages, USB geometry, ventilation, and all other designs are
immutable. Generated STL, STEP, 3MF, OFF, CSG, PNG, and similar exports remain
temporary under `/tmp` and outside Git.

## Branch And Worktree Contract

- Delivery branch: `fix/voomy-top-cover-clamp-alignment`.
- Expected base: `origin/main` at `0a632524e39f5e84bf18b1449a9902f8b1a77a52`.
- Implementation uses the isolated worktree task slug
  `voomy-top-cover-clamp-alignment` at
  `~/.herdr/worktrees/openscad-designs/voomy-top-cover-clamp-alignment`.
- The main agent creates `~/.herdr/worktrees/openscad-designs` when absent,
  verifies the repository name and exact task path, and creates or reuses the
  worktree in detached-HEAD state at the expected base before edits.
- If the expected base, worktree registration, path identity, cleanliness, or
  planned branch availability conflicts with this contract, stop rather than
  selecting another base, path, or branch.
- The invoking checkout contains the approved spec and proposed/approved plan
  edits. After the worktree is established, transfer the exact approved artifact
  state into the worktree without bringing along unrelated changes.
- Workers never create or manage worktrees or branches, commit, or push.
- Create the planned branch from the worktree only after development reaches
  DRAFT delivery or the Definition of Done.

## Test-First Policy

Unit tests and conventional test-first development are prohibited by repository
instructions and are not applicable. No test-focused subagent is used. OpenSCAD
assertions, bounded geometry evaluation, diff inspection, independent review,
and physical-fit validation are the applicable evidence.

Planned test-focused concurrency: `0`.

## Dependency-Aware Execution Graph

All assignments are bounded to no more than five minutes of active subagent
work. Development remains serialized because the geometry units share one SCAD
file. The main agent supervises dependencies, time limits, integration, QA,
artifact status, worktree state, and delivery.

### V0 — Preservation And Coordinate Baseline

- Type: main-agent validation gate.
- Boundary: classify every invoking-checkout and implementation-worktree path;
  record the installed coordinates of all four cap clamps and base receivers;
  confirm the only approved mismatch is the `0.3 mm` radial cover-side inset.
- Owned files: none.
- Dependencies: clean-context and worktree gates.
- Acceptance criteria: the base geometry is identified as immutable; unrelated
  user changes are preserved; approved artifact changes are available for
  transfer; no test-focused work is started.
- Validation: `git status`, staged/unstaged diff inspection, source-coordinate
  inspection, and expected-base verification.
- Subagent assignment: none.

### D1 — Top-Cover Retention Realignment

- Type: development.
- Boundary: change only top-cover clamp-site and associated skirt-pocket/bypass
  placement plus alignment assertions.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance criteria:
  - front and rear clamp sites use installed radial magnitude `52.0 mm`;
  - the left-end clamp site uses installed X `-102.0 mm`;
  - tangential positions `38.0`, `-42.0`, `20.0`, and left-site Y `0.0 mm`
    remain unchanged;
  - the corresponding cap-local pocket and bypass geometry follows each moved
    clamp site and does not obstruct flexure;
  - the continuous skirt remains at `51.7 mm` outer radius with `0.3 mm`
    per-side seating clearance;
  - installed clamp/receiver centerline and orientation assertions cover all
    four sites after the rigid `180 deg` flip;
  - no body module, receiver transform, receiver hole, or receiver catch changes.
- Validation: OpenSCAD assertions, focused source diff, and bounded
  reference-free `assembly` evaluation.
- Subagent assignment: one clean-context developer with the approved artifacts,
  exact ownership boundary, and relevant source coordinates.

### D2 — Documentation And Approved Artifacts

- Type: documentation development and main-agent artifact integration.
- Boundary: update only Voomy retention/fit guidance and transfer the exact
  approved spec and plan state into the implementation worktree.
- Owned files: `README.md`,
  `specs/SPEC-voomy-power-s7-cable-management-case.md`, and
  `specs/PLAN-voomy-power-s7-cable-management-case.md`.
- Dependencies: D1.
- Acceptance criteria: documentation says the base and its holes are unchanged,
  only the top cover must be reprinted, and delivery stays DRAFT pending fit and
  cycle checks; no unrelated documentation changes.
- Validation: source/document consistency inspection and path-limited diff.
- Subagent assignment: one clean-context developer for `README.md` only, with
  approved artifact transfer retained as a main-agent responsibility.

### R1 — Independent Contract And Geometry Review

- Type: read-only code review.
- Boundary: audit the complete integrated diff for spec/plan compliance,
  installed coordinate correctness, pocket/clip connectivity, printability, and
  regressions to immutable base and preserved Voomy geometry.
- Owned files: no writes; review all four in-scope files and full diff context.
- Dependencies: D1 and D2.
- Acceptance criteria: report exact locations for every mismatch, regression,
  unsupported claim, or missing assertion; explicitly report no findings when
  none exist.
- Validation: approved-artifact, source, documentation, and diff inspection.
- Subagent assignment: one clean-context code-review agent.

### F1 — Review Or QA Fixes (Conditional)

- Type: development fix.
- Boundary: resolve only accepted R1 or main-agent QA findings without changing
  the base or expanding scope.
- Owned files: only files implicated by an accepted finding.
- Dependencies: relevant finding.
- Acceptance criteria: every accepted finding is resolved and its affected
  validation is repeated.
- Validation: finding-specific checks plus the final validation sequence.
- Subagent assignment: one new clean-context developer per non-overlapping fix;
  serialize every SCAD edit.

## Concurrency And Timeout Supervision

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1`.
- Review maximum concurrency: `1`.
- At five minutes, the main agent stops an active subagent, records completed and
  partial work, changed files, validation, blockers, and remaining work, then
  preserves usable changes and splits any remainder into a smaller clean-context
  assignment. A timed-out assignment is not retried unchanged.

## Main-Agent QA And Validation

The main agent must:

1. Run `git diff --check`.
2. Evaluate OpenSCAD 2021.01-compatible assertions.
3. Run reference-free `assembly` and `printable_layout` renders or exports under
   `/tmp`, stopping either command if it exceeds 15 seconds.
4. Inspect assembly geometry for coincident clamp/receiver centerlines at all
   four sites, unobstructed pocket and bypass clearance, complete clip-to-roof
   connectivity, flush cap seating, and unchanged skirt clearance.
5. Compare the body-related source diff and geometry against the expected base;
   no case-body, receiver-hole, receiver-catch, floor, wall, passage, USB, or
   ventilation change is accepted.
6. Confirm printable layout still contains exactly one supported body, cap, and
   USB cover with `render_mode = "printable_layout"` and no floating objects.
7. Inspect the complete diff against the approved artifacts and resolve or
   document every review and QA finding.

OpenSCAD review is visual/static evidence only. Bambu Studio inspection, print
behavior, and physical fit are not established by CSG success.

## Physical Acceptance And Delivery Status

- Reprint only the corrected top cover and reuse the existing base.
- Confirm all four clamps enter the existing receiver holes without collision,
  the skirt seats completely, and the cap is flush.
- Complete at least 20 engagement/release cycles without whitening, cracking,
  delamination, excessive force, or loss of retention.
- Unless these physical checks are completed during implementation, delivery is
  DRAFT and the commit message includes `DRAFT`.

## Reconciliation, Commit, And Push

- Before committing, reconcile every modified, added, deleted, renamed, and
  untracked path in both the invoking checkout and implementation worktree.
- Preserve and identify unrelated user changes. Transfer and stage every
  accepted in-scope path, including the approved spec and plan.
- Inspect `git diff --cached --name-status`, the complete staged diff, and
  `git diff --cached --check`; confirm no base-geometry edit is staged.
- Create the planned branch, commit the complete accepted four-file change set,
  and push it to `origin`.
- Use `fix: DRAFT align Voomy top-cover clamps with base receivers` unless all
  slicer and physical acceptance checks are completed; only then may `DRAFT` be
  omitted.
- After committing, inspect `git status` and the commit diff. After pushing,
  verify the local branch is not ahead of its configured upstream. Do not report
  completion while any accepted in-scope change remains outside the commit.

## Documentation And Completion Report

The README must describe the top-cover-only correction, existing-base reuse,
reprint scope, and DRAFT physical-fit boundary. The final completion report must
state implementation summary; review and QA findings; resolved findings;
validation run and not run; remaining risks; documentation changes; commit and
push status; skipped or blocked steps; final or DRAFT delivery; Definition of
Done status; and final main-agent acceptance.
