# PLAN: Voomy Power S7 Midpoint Vertical USB Interface

Status: Approved

Approved Spec: `specs/SPEC-voomy-power-s7-cable-management-case.md`

## Super-Agent Completed Work

### Affected Files

- `designs/voomy_power_s7_cable_management_case.scad`
- `README.md`
- `specs/SPEC-voomy-power-s7-cable-management-case.md`
- `specs/PLAN-voomy-power-s7-cable-management-case.md`

No other source or generated artifact is included.

### Implementation Steps Performed

1. Changed the USB source defaults from horizontal `60.0 x 36.0 mm` at center Z
   `73.0 mm` to vertical `36.0 x 60.0 mm` at center Z `103.5 mm`.
2. Updated the solid-cover dimensions and assertions to `42.0 x 66.0 mm`,
   retaining `3.0 mm` overlap, the left-biased X center, and installed alignment.
3. Updated exact midpoint-span assertions to Z `73.5..133.5 mm`.
4. Set the vertical cover's printable-layout rotation to `0 deg` and updated its
   separation and plate-bound assertions so the three parts remain separate and
   nominally fit within `256 x 256 mm`.
5. Updated the Voomy README section and approved completed-work artifacts.

### Validation Run

- `git diff --check` passed.
- A reference-free `printable_layout` CSG evaluation completed within the
  super-agent short-validation limit.
- A reference-free `assembly` CSG evaluation completed within the super-agent
  short-validation limit.
- The first layout evaluation identified the old cover rotation/spacing
  dependency; the final layout rotation and assertions were corrected before
  the passing validation above.

### Validation Skipped

- Unit tests are prohibited and not applicable in this repository.
- Longer render inspection, PNG inspection, Bambu Studio slicing, test printing,
  physical USB alignment, cover fit/cycling, airflow, and thermal/electrical
  validation were not performed.

### QA And Code Review

- QA was intentionally skipped by the explicitly invoked super-agent workflow.
- Code review was intentionally skipped by the explicitly invoked super-agent
  workflow.

### Documentation Updates

- The README now documents the vertical `36.0 x 60.0 mm` USB interface,
  `103.5 mm` midpoint default, Z `73.5..133.5 mm` span, printable orientation,
  and physical-alignment caveat.
- The approved spec records the delivered final behavior and validation boundary.

### Staging, Commit, And Push Status

- Staging status: complete for the four affected paths; no unrelated path is
  included.
- Commit status: not committed, as required by the super-agent workflow unless
  the user explicitly requests a commit.
- Push status: not pushed.

### Residual Risk And Delivery Status

- The `103.5 mm` center and rotated service envelope remain provisional until
  checked against the actual Voomy USB group.
- Printable separation is assertion- and CSG-validated, not slicer- or
  test-print-validated.
- Delivery remains DRAFT and the default Definition of Done is not fully
  satisfied because QA, code review, slicer inspection, and physical validation
  were intentionally skipped or unavailable.

## Previous Approved Implementation Record

The remaining sections record the previous approved implementation that created
the adjustable-height and top-cap-ventilation state. Its `73.0 mm` default and
horizontal `60.0 x 36.0 mm` USB values are superseded by the completed work
above and the current approved spec.

## Previous Approved Implementation Objective

Complete the final approved Voomy Power S7 design by keeping the USB access
opening left-biased while changing its adjustable default vertical center to
`73.0 mm`, supporting `103.5 mm` as the exact body-wall midpoint override, and
moving the complete hexagonal ventilation field from the front body wall to the
top cap. Preserve every previously accepted correction already present in the
worktree, update the Voomy README section, validate and independently review the
integrated final state, then commit and push every accepted in-scope change.

Implementation must use the approved spec as the complete behavior source and
this plan as the complete execution approach. It must not perform product,
architecture, scope, planning, or plan-discovery research. If implementation
reveals missing or materially different behavior, stop for an artifact
amendment instead of inventing a solution.

## Preserved Accepted Behavior

The implementation must retain the already accepted and currently staged Voomy
corrections while applying this delta:

- smooth plain body walls without raised stripes;
- smooth interior floor without supports, pins, or locating stops;
- solid removable USB cover;
- four closed `12.6 x 5.6 mm` cap receiver holes;
- fully see-through right curved-wall cable passage without an exterior
  membrane, retaining its separately approved adjustable `30.0 deg` rearward
  default center angle;
- fixed `210 x 210 x 110 mm` envelope, cable slots, cap retention, render modes,
  printable layout, and DRAFT physical-validation boundary.

Do not unstage, discard, overwrite, or split those accepted changes from the
final integrated delivery.

## Clean-Context Gate

Implementation may begin only in a newly started session, after context is
cleared, or after the user explicitly confirms same-context implementation for
that invocation. After the gate, load only applicable instructions, approved
artifacts, complete branch/worktree/index state, the affected files, and minimal
local source context needed for the planned corrections.

## Affected Files

- `designs/voomy_power_s7_cable_management_case.scad` — revise adjustable USB
  vertical placement, remove the front-wall grid, add the top-cap grid, update
  assertions and derived values, and preserve all accepted geometry.
- `README.md` — update only the Voomy section for the new USB height controls
  and top-cap ventilation placement.
- `specs/SPEC-voomy-power-s7-cable-management-case.md` — approved final behavior
  contract included in delivery.
- `specs/PLAN-voomy-power-s7-cable-management-case.md` — approved final-state
  execution contract included in delivery.

No other source is modified. Generated STL, STEP, 3MF, OFF, CSG, PNG, or other
exports remain temporary under `/tmp` and outside Git.

## Branch, Index, And Worktree Policy

- Expected branch and base: `main`, tracking `origin/main`.
- Direct implementation and delivery on `main` are allowed by repository
  guidance.
- Before editing, inspect `git status --short --branch`, staged names and diff,
  unstaged names and diff, and local/upstream divergence.
- At plan approval time, the SCAD source and README corrections are committed on
  `main`; the main Voomy spec and plan each contain an accepted staged artifact
  layer plus this iteration's unstaged artifact updates. Re-check rather than
  assuming that state persists.
- Treat the pre-existing accepted staged artifact layers and committed Voomy
  corrections as in scope. Preserve them and integrate the new delta on top.
- Any other path present at implementation time is unrelated user-owned work.
  Do not restore, modify, unstage, stage, or commit it.
- Reconcile every modified, added, deleted, renamed, untracked, staged, and
  unstaged path before delivery. The final commit must contain the complete
  accepted state of the four affected paths and no unrelated path.
- Inspect staged names, staged diff, staged whitespace, and final commit diff.
  Use an explicit path-limited commit.
- Push the resulting commit to `origin/main` and verify local/upstream parity.
- Use commit message `fix: DRAFT refine Voomy USB and ventilation layout`
  unless Bambu Studio inspection and every physical acceptance check are
  completed during implementation. Missing fit, cap-cycle, USB-alignment,
  airflow, cable, or thermal evidence requires `DRAFT`.

## Test-First And Unit-Test Policy

Unit tests and conventional test-first work are not applicable. Repository
guidance prohibits creating or running unit tests for OpenSCAD work. No
test-focused agent may be spawned. Assertions, bounded OpenSCAD evaluation,
source inspection, independent review, slicer checks, and physical checks are
the applicable validation layers.

Planned test-focused concurrency: `0`.

## Dependency-Aware Execution Graph

All SCAD development is serialized because the units share one file. Every
developer receives the approved spec, this plan, its precise ownership
boundary, relevant staged and unstaged diff context, and a maximum five-minute
active-work limit. Developers must not create branches, commit, push, research,
or edit outside their assignment. Each reports changed files, validation,
blockers, and remaining work.

### V0 — Validation And Preservation Gate

- Type: validation policy; main-agent owned.
- Behavior boundary: record unit tests/test-first as not applicable; classify
  the existing staged and unstaged four-path state; confirm it contains only
  accepted Voomy work and will be preserved.
- Owned files: none.
- Dependencies: clean-context gate.
- Acceptance criteria: no test-focused work; no accepted staged correction is
  lost, unstaged, reverted, or overwritten.
- Validation: instruction, status, index, and diff audit.
- Subagent assignment: none.

### D1 — Adjustable USB Vertical Position

- Type: development.
- Behavior boundary: set `usb_cutout_center_z_mm = 73.0` as an adjustable
  source parameter; keep the current left-biased X derivation unchanged; ensure
  the installed solid cover follows the effective center; allow `103.5 mm` and
  every value that keeps the full opening between the floor and body top.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: V0.
- Acceptance criteria:
  - default cutout and cover span Z `55.0..91.0 mm`;
  - override `103.5 mm` spans Z `85.5..121.5 mm`;
  - both positions preserve the approved left-biased X center and solid-cover
    overlap/alignment;
  - assertions reject any effective center that intersects the interior floor
    or body top;
  - power-strip reference geometry remains unchanged and the measurement risk
    of the midpoint override is not hidden.
- Validation: source assertions and bounded reference-free `assembly` CSG
  evaluation at both `73.0` and `103.5 mm`.
- Subagent assignment: one clean-context developer, at most five minutes.

### D2 — Move Ventilation Grid To Top Cap

- Type: development.
- Behavior boundary: remove front-wall grid subtraction, front-grid derived
  bounds, helpers, calls, and assertions; implement the same staggered
  `12.0 mm` across-flats through-grid with at least `3.0 mm` ribs in the central
  top-cap roof; keep at least `12.0 mm` solid borders around the cap perimeter,
  skirt, clip roots, flexure paths, and retention keepouts.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: D1.
- Acceptance criteria:
  - no hexagonal aperture remains in the front or any body wall;
  - one central top-cap through-grid is present;
  - cells violating perimeter, skirt, or clip keepouts are omitted whole;
  - grid ribs and solid perimeter remain connected to the cap roof with no
    floating islands;
  - the physical cap used in assembly, `top_cap`, and `printable_layout` is the
    same part and retains the rigid installed transform;
  - exterior-down cap printing has broad support on its perimeter and grid ribs;
  - fixed envelope, cap retention, cable passages, solid USB cover, and
    printable-layout separation remain unchanged, including the right passage's
    approved adjustable `30.0 deg` rearward default center angle.
- Validation: assertions for grid location, rib width, border/keepout bounds,
  and absence of front-wall grid; bounded approved-mode CSG evaluation.
- Subagent assignment: one clean-context developer, at most five minutes.

### D3 — README Final-State Documentation

- Type: documentation development.
- Behavior boundary: update only the Voomy README section to document the
  left-biased USB opening, adjustable `73.0 mm` default, `103.5 mm` midpoint
  override and alignment caveat, plain front wall, top-cap grid, printing
  orientation, parameters, validation, and DRAFT boundary.
- Owned file: `README.md`.
- Dependencies: D2.
- Acceptance criteria: no stale claim remains that the grid is on the front
  wall or the cap is fully solid/plain; commands and parameter names match the
  final source; previously accepted Voomy documentation remains preserved.
- Validation: documentation/source consistency inspection and diff check.
- Subagent assignment: one clean-context developer, at most five minutes.

### R1 — Contract And Geometry Review

- Type: independent code review; read-only.
- Behavior boundary: audit the complete integrated SCAD state against the
  approved spec, focusing on USB default/override bounds, left X preservation,
  absence of body grid apertures, top-cap grid connectivity and keepouts,
  physical cap identity, and regression safety for every preserved correction.
- Owned files: no writes; review the SCAD file, approved artifacts, and complete
  staged/unstaged diff context.
- Dependencies: D2.
- Acceptance criteria: report every spec/plan mismatch, invalid derivation,
  collision, disconnected feature, stale source path, or missing assertion with
  exact locations; explicitly report no findings if none exist.
- Validation: source and diff inspection only.
- Subagent assignment: one clean-context code reviewer, at most five minutes.

### R2 — Printability, Documentation, And Safety Review

- Type: independent code/documentation review; read-only.
- Behavior boundary: audit cap exterior-down support, grid first-layer/rib and
  floating-object risks, USB-height documentation, printable-layout grouping,
  README accuracy, and physical/slicer/thermal DRAFT language.
- Owned files: no writes; review the SCAD file, README, approved artifacts, and
  complete staged/unstaged diff context.
- Dependencies: D3.
- Acceptance criteria: report actionable printability, documentation, safety,
  or artifact mismatches with exact locations; explicitly report no findings if
  none exist.
- Validation: source and diff inspection only.
- Subagent assignment: one clean-context code reviewer, at most five minutes.

### F1 — Review And QA Fixes (Conditional)

- Type: development fix.
- Behavior boundary: resolve only accepted R1, R2, or main-agent QA findings
  without scope expansion. Split by file when independent; serialize every fix
  touching the SCAD source.
- Owned files: only files implicated by accepted findings.
- Dependencies: the relevant finding.
- Acceptance criteria: each accepted finding is resolved without losing prior
  staged corrections; affected review and validation are repeated.
- Validation: finding-specific checks plus the final sequence.
- Subagent assignment: one new clean-context developer per non-overlapping fix
  unit, each at most five minutes.

## Concurrency And Supervision

- Test-focused maximum concurrency: `0`.
- Development maximum concurrency: `1` because D1-D2 share the SCAD file and D3
  depends on final public behavior.
- Review maximum concurrency: `2`; R1 and R2 may run concurrently because they
  are read-only and cover distinct criteria.
- The main agent owns preservation of the staged state, handoffs, dependencies,
  timeout supervision, integration, finding acceptance, QA, reconciliation,
  commit, and push.
- At five minutes, stop an active subagent, record completed and partial work,
  changed files, validation, blockers, and remainder, inspect and preserve the
  actual worktree, then split the remainder into a smaller non-overlapping unit.

## Main-Agent QA And Validation

After development, documentation, review, and accepted fixes, the main agent
performs QA and does not delegate it.

Required local validation:

```sh
git diff --check
timeout 15s openscad -o /tmp/voomy_power_s7_case_printable_layout.csg -D 'render_mode="printable_layout"' designs/voomy_power_s7_cable_management_case.scad
timeout 15s openscad -o /tmp/voomy_power_s7_case_assembly.csg -D 'render_mode="assembly"' -D 'show_powerstrip_reference=false' designs/voomy_power_s7_cable_management_case.scad
timeout 15s openscad -o /tmp/voomy_power_s7_case_assembly_midpoint.csg -D 'render_mode="assembly"' -D 'show_powerstrip_reference=false' -D 'usb_cutout_center_z_mm=103.5' designs/voomy_power_s7_cable_management_case.scad
```

Any OpenSCAD render exceeding 15 seconds must be stopped and reported. Optional
PNG previews may be attempted only for `assembly` and `printable_layout` with
references disabled; unavailable headless preview is reported rather than
treated as visual validation.

Main-agent inspection must confirm:

- default USB cutout/cover center Z is `73.0 mm` and midpoint override is
  `103.5 mm`, with exact spans and left-biased X alignment asserted;
- no front/body-wall hexagonal aperture, helper, derived bound, call, or stale
  assertion remains;
- top-cap grid uses `12.0 mm` cells, at least `3.0 mm` ribs, at least `12.0 mm`
  borders/keepouts, connected geometry, and broad exterior-down contact;
- assembly, top-cap mode, and printable layout use the same physical cap;
- smooth body walls/floor, solid USB cover, four closed receiver holes, fully
  open right cable passage at its adjustable `30.0 deg` rearward default, fixed
  envelope, cap clips, cable slots, references, and three-part printable layout
  remain correct;
- README and approved artifacts match final source;
- all previously staged accepted Voomy work remains included;
- no unrelated path or generated artifact enters Git.

After final integration, run path-limited `git diff --cached --check` for the
four affected paths.

## Physical And Slicer Validation Boundary

OpenSCAD and source review cannot prove actual USB alignment at either height,
top-cap airflow, slicer first-layer behavior around the grid, cap strength,
cover/clip cycle durability, cable fit, operating temperature, or electrical
safety. Delivery and commit remain `DRAFT` unless the actual device and cables,
Bambu Studio, intended printer/material, repeated cover/cap cycles, airflow,
and intended-load thermal behavior are validated during implementation.

## Documentation, Delivery, And Completion

- Update only the Voomy README section.
- Repeat affected review and validation after accepted fixes.
- Reconcile the complete staged and unstaged worktree; preserve all accepted
  prior Voomy corrections and identify any unrelated path.
- Stage the complete final state of all four affected paths and no unrelated
  work.
- Inspect staged names, staged diff, staged whitespace, and final commit diff.
- Commit with the required DRAFT message, push `main`, and verify upstream
  parity.
- Do not report completion while an accepted in-scope change remains untracked,
  unstaged, uncommitted, or unpushed.
- The completion report must include implemented behavior, review/QA findings,
  resolved findings, validation run and not run, documentation changes, commit
  and push status, residual fit/print/thermal risks, final or DRAFT status,
  skipped or blocked Definition-of-Done items, and final main-agent acceptance.
