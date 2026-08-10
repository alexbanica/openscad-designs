# PLAN: Voomy Power S7 Plain-Body And Closure Corrections

Status: Approved

Approved Spec: `specs/SPEC-voomy-power-s7-cable-management-case.md`

## Objective

Correct the existing Voomy Power S7 OpenSCAD design so its final geometry
matches the approved specification: smooth exterior walls with the hexagonal
ventilation retained, a solid removable USB cover, four minimal closed cap
receiver holes without top-edge gaps, and a smooth interior floor without
supports or locating pins. Update only the Voomy README section, validate and
review the corrected final state, commit every accepted in-scope change, and
push it to `origin/main`.

Implementation must use the approved spec as the complete behavior source and
this plan as the complete execution approach. It must not perform product,
architecture, scope, planning, or plan-discovery research. If implementation
reveals missing or materially different behavior, stop for an artifact
amendment rather than inventing a solution.

## Clean-Context Gate

Implementation may begin only in a newly started session, after context is
cleared, or after the user explicitly confirms same-context implementation for
that invocation. After the gate, load only applicable instructions, the
approved artifacts, branch/worktree state, the affected files, and minimal
local source context needed for the planned corrections.

## Affected Files

- `designs/voomy_power_s7_cable_management_case.scad` — revise body surface,
  interior floor, USB cover, clamp receiver holes, assertions, and dependent
  derived values while preserving the approved envelope and render modes.
- `README.md` — revise only the Voomy section for the smooth walls and floor,
  retained grid, solid USB cover, minimal receiver holes, and validation
  boundary.
- `specs/SPEC-voomy-power-s7-cable-management-case.md` — approved revised
  behavior contract included in delivery.
- `specs/PLAN-voomy-power-s7-cable-management-case.md` — approved final-state
  execution contract included in delivery.

No other design source is modified. Generated STL, STEP, 3MF, OFF, CSG, PNG,
or other exports remain temporary under `/tmp` and outside Git.

## Branch And Worktree Policy

- Expected branch and base: `main`, tracking `origin/main`.
- Direct implementation and delivery on `main` are allowed by repository
  guidance.
- Before editing, verify `main` is not unexpectedly divergent and inspect the
  complete worktree with `git status --short --branch`.
- At plan update time, only this approved spec and proposed plan are modified.
  Re-check rather than assuming that state persists.
- Any other path present at implementation time is unrelated user-owned work.
  Do not restore, overwrite, stage, or commit it.
- Reconcile every modified, added, deleted, renamed, and untracked path before
  delivery. Stage and commit only the four affected paths.
- Inspect the staged path list, staged diff, and final commit diff. Use an
  explicit path-limited commit so unrelated staged work, if any, remains
  excluded.
- Push the resulting commit to `origin/main` and verify local/upstream parity.
- Use commit message `fix: DRAFT correct Voomy case geometry` unless Bambu
  Studio inspection and every physical acceptance check are completed during
  implementation. Missing physical-fit, cover-cycle, cap-cycle, cable, or
  thermal evidence requires `DRAFT`.

## Test-First And Unit-Test Policy

Unit tests and conventional test-first development are not applicable.
Repository guidance prohibits creating or running unit tests for OpenSCAD
work. No test-focused agent may be spawned. Assertions, bounded OpenSCAD
evaluation, source inspection, independent review, slicer checks, and physical
checks are the applicable validation layers.

Planned test-focused concurrency: `0`.

## Dependency-Aware Execution Graph

All SCAD development units are serialized because they share one file. Every
developer receives the approved spec, this plan, its exact ownership boundary,
current relevant diff context, and a maximum five-minute active-work limit.
Developers must not create branches, commit, push, research, or edit outside
their assigned files. Each reports changed files, validation, blockers, and
remaining work.

### V0 — Validation-Policy Gate

- Type: validation policy; main-agent owned.
- Behavior boundary: record unit tests and conventional test-first work as not
  applicable while preserving the repository geometry-validation path.
- Owned files: none.
- Dependencies: clean-context gate.
- Acceptance criteria: no unit tests or test-focused agents are created or run.
- Validation: applicable-instruction audit.
- Subagent assignment: none.

### D1 — Smooth Body Walls And Interior Floor

- Type: development.
- Behavior boundary: remove all raised stripe parameters, derived values,
  assertions, calls, and modules; expand the smooth vertical capsule wall to
  the approved `55 mm` radius and `210 x 110 mm` outline; retain the existing
  hexagonal ventilation grid and every functional opening; remove all internal
  power-strip supports, stops, pins, and related parameters/modules; place the
  optional reference directly on the `3 mm` floor.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance criteria:
  - body and cap preserve the exact `210 x 210 x 110 mm` assembled envelope,
    `55 mm` side radii, and `100 mm` tangent runs;
  - body walls are smooth and plain except for the retained grid and approved
    functional openings;
  - the interior floor is one flat continuous surface with no raised locating
    geometry;
  - cable slots and their floor boundary remain unchanged.
- Validation: targeted source inspection and assertions; bounded approved-mode
  syntax/CSG evaluation if useful within the unit.
- Subagent assignment: one clean-context developer, at most five minutes.

### D2 — Solid Removable USB Cover

- Type: development.
- Behavior boundary: change the existing USB printable part from an open bezel
  to a solid panel while preserving the `60 x 36 mm` body cutout, `3 mm`
  per-edge overlap, external snap removal, alignment, print orientation, and
  existing `usb_passthrough_clip` render-mode identifier.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D1.
- Acceptance criteria:
  - the installed panel has no through-opening, grille, divider, or transparent
    geometry and completely closes the USB wall cutout;
  - the same physical part appears in individual, assembly, and printable
    layout modes;
  - snap tabs remain accessible from outside and clear the body opening;
  - USB access and cable routing require cover removal.
- Validation: assertions for solid panel dimensions, overlap, installed
  alignment, and printable-layout separation; approved-mode CSG evaluation.
- Subagent assignment: one clean-context developer, at most five minutes.

### D3 — Minimal Closed Cap Receiver Holes

- Type: development.
- Behavior boundary: replace the four existing top-open receiver gaps with
  four closed holes sized to the approved `12.6 x 5.6 mm` defaults; preserve
  the existing cap clips, rigid installed transform, catches, release pads,
  interference, and tool-less operation.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D2.
- Acceptance criteria:
  - exactly four receiver holes exist at the approved clip locations;
  - every hole is bounded by solid body wall on all four sides and no receiver
    opening reaches the top rim;
  - wall material is continuous above and around each hole;
  - each default hole is exactly `12.6 mm` wide and `5.6 mm` high;
  - release-pad access, hook engagement, and required release travel remain
    geometrically aligned.
- Validation: assertions for count, dimensions, top-wall bridge thickness,
  transformed clip/receiver alignment, and structural keepouts; approved-mode
  CSG evaluation.
- Subagent assignment: one clean-context developer, at most five minutes.

### D4 — README Final-State Documentation

- Type: documentation development.
- Behavior boundary: update only the Voomy README section to describe smooth
  plain walls, retained hexagonal ventilation, smooth unsupported interior
  floor, solid removable USB cover, minimal clamp holes, unchanged render-mode
  identifier, operation, printing, and DRAFT validation boundaries.
- Owned file: `README.md`.
- Dependencies: D3.
- Acceptance criteria: documentation contains no stale claims about raised
  stripes, open USB access through an installed bezel, or floor locating
  supports; measurements and commands match the final SCAD source.
- Validation: documentation/source consistency inspection and diff check.
- Subagent assignment: one clean-context developer, at most five minutes.

### R1 — Geometry And Contract Review

- Type: independent code review; read-only.
- Behavior boundary: audit the final SCAD diff against the approved revised
  behavior, focusing on smooth outer walls, retained grid, exact capsule
  envelope, flat floor, solid USB closure, four minimal receiver holes, clip
  alignment, and preserved render dispatch.
- Owned files: no writes; review the SCAD file and approved artifacts.
- Dependencies: D3.
- Acceptance criteria: report every spec/plan mismatch, stale stripe/support
  path, unintended opening, collision, invalid derivation, or missing assertion
  with exact locations; explicitly report no findings if none exist.
- Validation: source and diff inspection only.
- Subagent assignment: one clean-context code reviewer, at most five minutes.

### R2 — Printability, Documentation, And Safety Review

- Type: independent code/documentation review; read-only.
- Behavior boundary: audit build-plate contact, floating-object risk, grid and
  clamp-hole borders, USB-cover printability, printable-layout separation,
  README accuracy, and DRAFT physical/slicer/thermal boundaries.
- Owned files: no writes; review the SCAD file, README, and approved artifacts.
- Dependencies: D4.
- Acceptance criteria: report actionable printability, documentation, safety,
  or artifact mismatches with exact locations; explicitly report no findings if
  none exist.
- Validation: source and diff inspection only.
- Subagent assignment: one clean-context code reviewer, at most five minutes.

### F1 — Review And QA Fixes (Conditional)

- Type: development fix.
- Behavior boundary: resolve only accepted findings from R1, R2, or main-agent
  QA without expanding scope. Split by file when multiple independent fixes are
  needed; serialize all fixes touching the SCAD file.
- Owned files: only files directly implicated by accepted findings.
- Dependencies: the relevant review or QA finding.
- Acceptance criteria: each accepted finding is resolved and affected review
  and validation are repeated.
- Validation: finding-specific checks plus the final validation sequence.
- Subagent assignment: one new clean-context developer per non-overlapping fix
  unit, each at most five minutes.

## Concurrency And Supervision

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1` because D1-D3 share the SCAD file and D4
  depends on its final behavior.
- Review maximum concurrency: `2`; R1 and R2 may run concurrently because both
  are read-only and cover distinct criteria.
- The main agent owns handoffs, dependency readiness, timeout supervision,
  integration, finding acceptance, QA, staging, commit, and push.
- At five minutes, stop an active subagent, record completed and partial work,
  changed files, validation, blockers, and remainder, inspect and preserve the
  worktree, then split the remainder into a smaller non-overlapping assignment.

## Main-Agent QA And Validation

After development, documentation, review, and accepted fixes, the main agent
performs QA and does not delegate it.

Required local validation:

```sh
git diff --check
timeout 15s openscad -o /tmp/voomy_power_s7_case_printable_layout.csg -D 'render_mode="printable_layout"' designs/voomy_power_s7_cable_management_case.scad
timeout 15s openscad -o /tmp/voomy_power_s7_case_assembly.csg -D 'render_mode="assembly"' -D 'show_powerstrip_reference=false' designs/voomy_power_s7_cable_management_case.scad
```

Any OpenSCAD render exceeding 15 seconds must be stopped and reported. Optional
PNG previews may be attempted only for these two modes with all references
disabled; unavailable headless preview is reported rather than treated as
visual validation.

Main-agent inspection must confirm:

- exact `210 x 210 x 110 mm` assembly and matching `55 mm` capsule outlines;
- no raised stripe parameter, assertion, call, or geometry remains;
- hexagonal ventilation remains present with its existing structural borders;
- the complete interior floor is flat, continuous, and free of supports, pins,
  stops, ridges, and other raised features;
- the solid USB cover closes the complete cutout and stays removable;
- exactly four `12.6 x 5.6 mm` receiver holes exist, each bounded by wall above,
  below, and on both sides;
- cap clips, hooks, catches, press pads, and rigid installed transform remain
  aligned and operable by nominal geometry;
- cable slots, cable references, cap, and fixed envelope are unchanged except
  where wall simplification necessarily removes stripe-dependent calculations;
- printable layout contains exactly body, cap, and solid USB cover as separate,
  stable objects without reference geometry;
- README and approved artifacts match the final source;
- no other design changed and no generated artifact entered Git.

While artifacts remain unstaged, use no-index whitespace checks for untracked
files when necessary. After exact-path staging, run `git diff --cached --check`
for all four affected paths.

## Physical And Slicer Validation Boundary

OpenSCAD and source inspection cannot prove actual Voomy alignment on the now
unlocated smooth floor, solid-cover insertion/removal force, cap-hole access,
clip durability, cable fit, Bambu Studio support behavior, operating
temperature, or electrical safety. Delivery and commit remain `DRAFT` unless
the actual device, intended cables, Bambu Studio, printer/material, repeated
cover/cap cycles, and intended-load thermal behavior are validated during the
implementation invocation.

## Documentation, Delivery, And Completion

- Update only the Voomy section of `README.md`.
- Repeat affected review and validation after accepted fixes.
- Reconcile the complete worktree and classify every path before staging.
- Stage all four accepted paths and no unrelated work.
- Inspect staged names, staged diff, staged whitespace, and final commit diff.
- Commit with the required DRAFT message, push `main`, and verify upstream
  parity.
- Do not report completion while an accepted in-scope path is untracked,
  unstaged, uncommitted, or unpushed.
- The completion report must include implemented behavior, review/QA findings,
  resolved findings, validation run and not run, documentation changes, commit
  and push status, residual fit/print/thermal risks, final or DRAFT status,
  skipped or blocked Definition-of-Done items, and final main-agent acceptance.
