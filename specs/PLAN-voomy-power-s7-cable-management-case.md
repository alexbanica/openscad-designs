# PLAN: Voomy Power S7 Cable-Management Case

Status: Approved

Approved Spec: `specs/SPEC-voomy-power-s7-cable-management-case.md`

## Objective

Implement the approved Voomy Power S7 cable-management case as one standalone
OpenSCAD design, document it, validate the source and bounded geometry, obtain
independent review, reconcile every in-scope path, commit the complete accepted
change, and push it to `origin/main`.

Implementation must reproduce the approved spec literally. It must not perform
new product research, architecture research, scope discovery, planning
research, or plan discovery. If implementation exposes an infeasible dimension
or a materially different requirement, stop and request a spec or plan
amendment instead of silently changing behavior.

## Clean-Context Gate

Implementation may start only in a newly started session, after context is
cleared, or after the user explicitly confirms same-context implementation for
that invocation. The implementation command must verify and record which
condition applies before editing production files.

After that gate, load only:

- applicable repository and workspace instructions,
- this approved plan and its approved spec,
- current branch and complete worktree state,
- the precise existing OpenSCAD patterns needed for local syntax and print
  layout consistency,
- the affected files listed below.

## Affected Files

- `designs/voomy_power_s7_cable_management_case.scad` — new case body, plain
  capsule cap, USB passthrough clip, optional reference model, assertions, and
  render modes.
- `README.md` — design behavior, parameters, render modes, printing, operation,
  safety boundaries, and validation guidance.
- `specs/SPEC-voomy-power-s7-cable-management-case.md` — approved behavior
  contract included in delivery.
- `specs/PLAN-voomy-power-s7-cable-management-case.md` — approved execution
  contract included in delivery.

No existing design source is modified. Generated STL, STEP, 3MF, OFF, CSG,
PNG, or similar preview/export files must remain under `/tmp` and outside Git.

## Branch And Worktree Policy

- Expected branch and base: `main`, tracking `origin/main`.
- Direct implementation and delivery on `main` are allowed by repository
  guidance.
- Before editing, verify the branch and inspect `git status --short --branch`.
  If the branch is no longer `main`, or `main` is unexpectedly divergent from
  its upstream, stop and ask before changing branch state.
- At plan creation, the only worktree changes are the untracked approved spec
  and this proposed plan. Re-check rather than assuming that state persists.
- Any unrelated path present at implementation time is user-owned work. Do not
  restore, unstage, modify, stage, or include it in the implementation commit.
- Reconcile every modified, added, deleted, renamed, and untracked path before
  delivery. Classify every file listed under Affected Files as in scope and
  identify any other path as unrelated unless the approved artifacts say
  otherwise.
- Stage only the four in-scope paths. Inspect the complete staged path list and
  use an explicit path-limited commit such as
  `git commit --only -- <in-scope paths>` so any unrelated staged work remains
  excluded from the commit.
- Inspect the path-limited staged diff and final commit diff. After committing,
  verify that no accepted in-scope change remains modified or untracked and
  that any unrelated work remains preserved in its prior state.
- Push the resulting commit to `origin/main` and verify the local branch is no
  longer ahead of its configured upstream.
- Use commit message `feature: DRAFT add Voomy Power S7 cable-management case`
  unless slicer and all physical acceptance checks are actually completed in
  the implementation invocation. Missing physical-fit, clip-cycle, thermal, or
  slicer evidence requires `DRAFT`.

## Test-First And Unit-Test Policy

Unit tests and conventional test-first work are not applicable. Repository
guidance explicitly prohibits creating or running unit tests for OpenSCAD work.
No test-writer agent may be spawned. Geometry assertions, bounded OpenSCAD
evaluation, render inspection, diff checks, independent review, slicer checks,
and physical checks are the applicable validation layers.

Planned test-focused concurrency: `0`.

## Dependency-Aware Execution Graph

All development assignments that touch the new SCAD file are serialized because
they share one ownership boundary. Each subagent receives the approved spec,
this approved plan, its exact unit, current relevant diff context, and a strict
five-minute active-work limit. Every development assignment uses a clean-context
`developer` agent, must not create branches, commit, push, research, or edit
outside its owned files, and must report changed files, validation, blockers,
and remaining work.

### V0 — Validation-Policy Gate

- Type: validation policy; main-agent owned.
- Boundary: confirm unit tests/test-first are prohibited and record them as not
  applicable before production work.
- Owned files: none.
- Dependencies: clean-context gate.
- Acceptance: no unit tests or test-focused agents are created or run; the
  approved geometry-validation path remains available.
- Validation: instruction audit.
- Subagent assignment: none.

### D1 — Source Contract And Parameter Scaffold

- Type: development.
- Boundary: create the OpenSCAD file with grouped adjustable parameters,
  derived capsule values, source-axis conventions, supported render-mode
  names, top-level assertions, and named-module stubs. Set
  `render_mode = "printable_layout"`.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance: all approved fixed, provisional, measured, and derived values are
  represented; unsupported modes are prepared to fail; no final geometry is
  claimed yet.
- Validation: OpenSCAD syntax evaluation if the scaffold is renderable, plus
  targeted source inspection.
- Subagent assignment: one clean-context developer, at most five minutes.

### D2 — Capsule Body, Shell, Stripes, And Ventilation

- Type: development.
- Boundary: implement the upright body and floor using the exact
  `210 x 110 mm` capsule envelope, `55 mm` semicircular ends, `100 mm` tangent
  runs, inset smooth wall datum, raised horizontal bands, wall grid fields,
  wall/floor continuity, and structural keepouts.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D1.
- Acceptance: outer stripe peaks define the fixed capsule envelope; side ends
  are true semicircles; stripe levels wrap tangentially; the body is one
  connected, build-plate-supported printable object; the top remains open.
- Validation: source assertions for dimensions, tangency, minimum thickness,
  stripe pitch/projection, and grid ribs; bounded syntax/CSG evaluation if
  available within the unit.
- Subagent assignment: one clean-context developer, at most five minutes.

### D3 — Device Placement And Cable Interfaces

- Type: development.
- Boundary: add the toggleable non-printable `80 x 80 x 88 mm` Voomy reference,
  floor stops and clearance, the front-left USB-group wall opening, the rear
  20 mm top-open main-lead slot, and the 20 mm tangential right-arc shared cable
  slot with four vertically stacked cable references.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D2.
- Acceptance: the USB opening remains within the straight front run at the
  approved provisional offset; both cable slots run from top edge to floor;
  Schuko heads are never required to pass through the slots; cable-contact
  edges and structural continuity match the spec.
- Validation: assertions for slot widths/positions, cable clearance, USB bounds,
  body/reference clearance, and no conflict with fixed envelope.
- Subagent assignment: one clean-context developer, at most five minutes.

### D4 — Plain Capsule Cap And Durable Retention

- Type: development.
- Boundary: implement the plain flat capsule cap, matching alignment skirt,
  four approved clip locations, flexure dimensions, release pads, catches,
  body receiver geometry, and passage-clear bridging behavior.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D3.
- Acceptance: cap footprint matches and seats on the body capsule; exterior is
  plain; clip roots and paths satisfy all numeric minimums; the cap does not
  pinch either cable route; all geometry is printable exterior-face-down.
- Validation: assertions for cap envelope, skirt clearance/depth, clip count,
  clip dimensions, nominal interference/release travel, and keepouts.
- Subagent assignment: one clean-context developer, at most five minutes.

### D5 — Removable USB Clip And Render Integration

- Type: development.
- Boundary: implement the independent front-wall USB passthrough clip, integrate
  all named printable/reference modules, complete exact render dispatch, and
  arrange the default printable layout.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D4.
- Acceptance: the clip has one shared clear opening and tool-less external
  removal; all five render modes behave literally; printable layout contains
  exactly body, cap, and clip as separate, non-intersecting, build-supported
  objects in intended orientations; the optional Voomy reference never enters
  printable output.
- Validation: complete source assertion pass and bounded `printable_layout` and
  reference-free `assembly` CSG exports.
- Subagent assignment: one clean-context developer, at most five minutes.

### D6 — README Documentation

- Type: documentation development.
- Boundary: add the approved README section without changing unrelated design
  documentation.
- Owned file: `README.md`.
- Dependencies: D5.
- Acceptance: documentation covers the fixed capsule dimensions, published and
  provisional measurements, front-left USB placement, 20 mm top-open slots,
  cable-vs-Schuko behavior, plain cap, clip operation, wall stripes, grid,
  parameters, render modes, print grouping, OpenSCAD commands, measurement
  checklist, non-certification, and DRAFT physical-validation boundary.
- Validation: documentation/source consistency audit and diff check.
- Subagent assignment: one clean-context developer, at most five minutes.

### R1 — Contract And Geometry Review

- Type: independent code review; read-only.
- Boundary: audit the final SCAD source against every deterministic approved
  spec requirement, focusing on capsule derivation, fixed envelope, openings,
  USB alignment, cap/clip geometry, assertions, and render dispatch.
- Owned files: no writes; review
  `designs/voomy_power_s7_cable_management_case.scad` and the approved
  artifacts.
- Dependencies: D5.
- Acceptance: report every spec mismatch, plan mismatch, invalid derivation,
  missing assertion, collision risk, or regression risk with exact locations;
  explicitly report no findings if none exist.
- Validation: source/diff inspection only.
- Subagent assignment: one clean-context `code-reviewer`, at most five minutes.

### R2 — Printability, Safety-Boundary, And Documentation Review

- Type: independent code/documentation review; read-only.
- Boundary: audit stable orientations, floating-object risk, stripe overhangs,
  grid/clip keepouts, cable edge treatment, printable-layout grouping, README
  accuracy, measurement caveats, and physical/slicer/thermal DRAFT language.
- Owned files: no writes; review the new SCAD file, `README.md`, and approved
  artifacts.
- Dependencies: D6.
- Acceptance: report actionable printability, documentation, validation, or
  approved-artifact mismatches with exact locations; explicitly report no
  findings if none exist.
- Validation: source/diff inspection only.
- Subagent assignment: one clean-context `code-reviewer`, at most five minutes.

### F1 — Review And QA Fixes (Conditional)

- Type: development fix unit.
- Boundary: resolve only accepted in-scope findings from R1, R2, or main-agent
  QA. Split into smaller file-specific assignments if more than one five-minute
  unit is needed.
- Owned files: exactly the files implicated by accepted findings.
- Dependencies: R1, R2, and the relevant QA finding.
- Acceptance: each accepted finding is resolved without scope expansion; the
  relevant review and validation are repeated.
- Validation: finding-specific assertion/render/doc checks plus final validation
  sequence.
- Subagent assignment: new clean-context developer per non-overlapping fix
  unit, each at most five minutes.

## Concurrency And Shared-File Integration

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1` because D1–D5 share one SCAD file and
  D6 depends on its final public behavior. Conditional fixes affecting the same
  file are also serialized.
- Review maximum concurrency: `2`; R1 and R2 may run concurrently after their
  respective dependencies complete because both are read-only and cover
  distinct concerns.
- The main agent owns all handoffs, timeout supervision, diff inspection,
  integration, validation, review finding acceptance, QA, staging, commit, and
  push.
- At five minutes, forcibly stop an active subagent, capture completed work,
  changed files, validation, blockers, and remaining work, inspect and preserve
  usable changes, then split the remainder into a smaller clean-context unit.
  Do not retry the same oversized assignment unchanged.

## Main-Agent Integration And QA

After each development unit, inspect the owned diff and confirm that the next
unit's prerequisites are satisfied. After all development and accepted fixes,
the main agent performs QA and must not delegate it.

Required local validation:

```sh
git diff --check
timeout 15s openscad -o /tmp/voomy_power_s7_case_printable_layout.csg -D 'render_mode="printable_layout"' designs/voomy_power_s7_cable_management_case.scad
timeout 15s openscad -o /tmp/voomy_power_s7_case_assembly.csg -D 'render_mode="assembly"' -D 'show_powerstrip_reference=false' designs/voomy_power_s7_cable_management_case.scad
```

While the new source remains untracked, inspect it with a no-index diff and
treat exit status `1` as the expected "files differ" result only when
`--check` emits no whitespace errors. After exact-path staging, run
`git diff --cached --check -- <in-scope paths>`. A render that exceeds 15
seconds must be stopped and reported, not allowed to continue in the
background.

Main-agent inspection must confirm:

- all OpenSCAD assertions evaluate without errors,
- only `assembly` and `printable_layout` are rendered for validation and the
  assembly excludes the reference device,
- exact `210 x 210 x 110 mm` assembled envelope,
- `55 mm` side radii, `100 mm` straight runs, tangent continuity, and matching
  body/cap capsule outlines,
- 20 mm right-arc and rear top-open slots extending to the floor,
- four 12 mm cable references stack vertically without nominal overlap,
- front-left group-only USB opening and removable clip alignment,
- plain cap exterior, clip clearances, release travel, and keepouts,
- raised wall stripes and ventilation grids remain connected and printable,
- printable layout has exactly three separate stable printable objects,
- no existing design changed and no generated artifact entered Git.

Optional visual PNG previews may be attempted only for `assembly` and
`printable_layout`, with the reference device disabled and the same 15-second
hard limit. Failure of headless visual preview must be reported and must not be
misrepresented as visual validation.

## Physical And Slicer Validation Boundary

OpenSCAD assertions and bounded renders cannot prove:

- actual Voomy body, USB-group, attached-lead, or connected-plug fit,
- Bambu Studio plate placement, first layer, bridge, overhang, or support
  behavior,
- cap insertion/release force or survival of 20 physical cycles,
- USB clip access while other USB cables remain connected,
- routing of the actual four fat cables and attached mains lead,
- cable abrasion, strain, operating temperature, ventilation, or safe behavior
  under the intended electrical load.

Unless those checks are actually completed with the physical device, intended
cables, Bambu Studio, printer, and material during implementation, delivery and
the commit remain `DRAFT`. The completion report must list every unavailable
check explicitly.

## Documentation, Review Fixes, And Delivery

- Update only the Voomy design section of `README.md`.
- Route accepted review or QA findings to new clean-context developer fix units;
  review agents must not edit files.
- Repeat affected validation after fixes, then rerun the complete final
  validation sequence.
- Inspect final `git status`, unstaged diff, staged diff, staged path list, and
  commit diff. Preserve and identify unrelated work.
- Stage every accepted in-scope path, including this spec and plan.
- Commit only the four accepted paths, push `main`, and verify upstream parity.
- Do not report completion while any accepted in-scope path remains untracked,
  unstaged, uncommitted, or unpushed.

## Completion Report Requirements

The implementation completion report must state:

- summary of the implemented approved spec,
- issues found during independent review and main-agent QA,
- findings resolved and any unresolved blockers,
- validation run, results, and validation not run,
- remaining fit, printability, clip, USB, cable, thermal, and safety risks,
- README changes,
- complete in-scope commit and push status,
- preserved unrelated worktree paths,
- final or DRAFT delivery status and why,
- every skipped, blocked, incomplete, or unvalidated Definition-of-Done item,
- whether the applicable Definition of Done was fully satisfied,
- confirmation that final main-agent acceptance was completed.
