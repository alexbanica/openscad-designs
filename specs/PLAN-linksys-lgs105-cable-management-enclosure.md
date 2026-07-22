# PLAN: Linksys LGS105 Cable-Management Enclosure

Status: Approved

Approved Spec: `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`

## Objective

Deliver the approved final Linksys LGS105 enclosure behavior while preserving
the existing switch fit, exactly-three-aperture contract, Ethernet cable
storage, ventilation, positive cover retention, stabilizer feet, horizontal and
vertical use, render modes, and Bambu Lab-friendly printable layout.

The implementation adds the approved compact power and guide behavior:

- replace the power-side lay-in slot with a `10.0 mm` round pass-through for the
  approximately `9.0 mm` DC head;
- place its center `21.0 mm` inward from visual right on the exterior power face,
  converting that measurement to `switch_origin_x_mm + 21.0 mm` in source X and
  centering it vertically on the switch body/power input;
- allow the rigid `28.20 mm` head length to protrude outside and shrink the
  default outer enclosure depth below `183.5 mm` without compromising rear
  catches, sockets, walls, vents, or support interfaces;
- replace both `34.8 mm` straight cylindrical guides with support-free mild
  hourglass guides having `28.0 mm` shoulders and a `26.0 mm` waist;
- preserve at least a `15.0 mm` cable centerline bend radius and visibly clear
  every female tray cover-pin socket.

## No-Research Boundary

Implementation may use only the approved spec, this approved plan, applicable
repository/workspace instructions, current branch and worktree state, the named
files, and minimal existing OpenSCAD/README patterns. Do not reopen product,
hardware, cable, architecture, scope, or planning research. Do not invent new
measurements. Stop for a spec or plan amendment if the approved geometry cannot
be implemented without materially different behavior.

## Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

Do not add generated OFF, STL, STEP, 3MF, PNG, or other render/export artifacts
to source control. Temporary inspection artifacts belong under `/tmp`.

## Branch And Worktree Policy

- Expected base and delivery branch: current `main`.
- Direct work on `main` is allowed by repository instructions.
- Inspect `git status --short --branch` before edits and preserve every unrelated
  user change.
- Workers must not create or switch branches, commit, push, or edit outside their
  stated ownership boundary.
- Shared-file integration is serialized through the main agent.

## Test-First Applicability

Repository instructions state that QA and unit tests are not required unless a
spec or user request explicitly asks for them. This is printable-geometry and
documentation work, not business/domain logic, and the repository has no unit
test harness for OpenSCAD geometry. Conventional test-first file creation is
therefore not applicable.

Before production edits, a test-focused worker will prepare a read-only static
acceptance oracle from the approved spec. Production work depends on that oracle,
and executable protection will be implemented as OpenSCAD assertions and derived
invariants in the design source.

## Dependency-Aware Execution Graph

Maximum planned concurrency is one test-focused subagent, one implementation
subagent, and two code-review subagents. Development units are serialized because
they share one `.scad` file. Review units may run concurrently after development.
Every assignment is limited to no more than five minutes of active subagent work.

### T1 — Static Geometry Acceptance Oracle

- **Type:** Test-focused, read-only; conventional unit-test files not applicable.
- **Boundary:** Translate the approved compact-power and hourglass-guide behavior
  into an exact checklist of formulas, inequalities, collision keepouts, and
  render observations before production edits.
- **Owned files:** None; report only.
- **Dependencies:** None.
- **Acceptance criteria:** The report covers the `10.0 mm` hole, visual-right
  mapping formula, vertical center formula, `9.0 mm` reference clearance,
  `28.20 mm` protrusion behavior, outer depth `< 183.5 mm`, `28.0/26.0 mm` guide
  diameters, cover-socket clearance, and cable centerline radius `>= 15.0 mm`.
- **Validation:** Cross-check only against the approved spec and current source;
  no product research or file edits.
- **Subagent assignment:** One clean-context test-focused worker, maximum five
  minutes.

### D1 — Power Pass-Through And Compact Rear Geometry

- **Type:** Development.
- **Boundary:** Replace the power lay-in slot and its cover-skirt relief with a
  bounded round wall hole; add adjustable measured inputs and derived X/Z
  placement; reduce rear depth to the smallest derived value compatible with
  the preserved latches, sockets, walls, vents, feet, switch clearance, and
  printable layout; update power preview geometry and assertions.
- **Owned files:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to power,
  enclosure-depth, dependent rear-Y placement, preview, and assertion sections.
- **Dependencies:** T1.
- **Acceptance criteria:** Exactly three service apertures remain; only the two
  Ethernet openings are lay-in slots; the power hole uses the approved formulas
  and clears the reference head; default outer depth is below `183.5 mm`; all
  preserved rear features remain in bounds and non-overlapping.
- **Validation:** OpenSCAD command-line syntax/CSG evaluation for horizontal
  assembly with references hidden, plus relevant assertion output; maximum
  `15` seconds.
- **Subagent assignment:** One clean-context implementation worker, maximum five
  minutes.

### D2 — Mild Hourglass Routing Guides

- **Type:** Development.
- **Boundary:** Refactor the two routing-guide solids and derived route radii to
  separate guide radius from cable centerline bend radius; implement smooth,
  floor-connected, support-free `28.0 mm` shoulder / `26.0 mm` waist guides;
  recalculate guide centers, representative cable paths, vent keepouts, and
  assertions affected by the smaller guide envelope.
- **Owned files:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to routing
  guide parameters, derived values, modules, previews, keepouts, and assertions.
- **Dependencies:** T1 and D1; serialization prevents overlapping SCAD edits.
- **Acceptance criteria:** Both guides have the approved profile, remain joined
  to the tray floor, clear all female cover-pin sockets, introduce no floating
  geometry, and keep both representative cable centerline radii at least
  `15.0 mm`.
- **Validation:** OpenSCAD command-line syntax/CSG evaluation for horizontal
  assembly with references hidden, plus relevant assertion output; maximum
  `15` seconds.
- **Subagent assignment:** One new clean-context implementation worker, maximum
  five minutes.

### D3 — Documentation Alignment

- **Type:** Documentation development; test-first not applicable.
- **Boundary:** Update the Linksys README section to describe the final power-hole
  geometry, coordinate orientation, insertion/service procedure, reduced-depth
  behavior, hourglass defaults, calibration warning, preserved bend radius, and
  physical-validation limits. Remove stale claims that all three apertures are
  lay-in slots or that the rear cavity is `30.0 mm`.
- **Owned files:** `README.md` only.
- **Dependencies:** D1 and D2 so documentation uses implemented final values.
- **Acceptance criteria:** README and approved spec describe the same final
  behavior and exact defaults, without claiming physical fit or validation that
  did not occur.
- **Validation:** Targeted `rg` consistency scan and `git diff --check`.
- **Subagent assignment:** One clean-context implementation/documentation worker,
  maximum five minutes.

### R1 — Power, Depth, And Preserved-Feature Review

- **Type:** Independent code review; no edits.
- **Boundary:** Review the power pass-through, coordinate conversion, rear-depth
  derivation, aperture count, catches, sockets, vents, feet, and printable-layout
  consequences against the approved spec and plan.
- **Owned files:** Read-only review of the SCAD diff, README, spec, and plan.
- **Dependencies:** D1, D2, and D3.
- **Acceptance criteria:** Report every spec/plan mismatch, regression risk,
  missing assertion, stale claim, or unvalidated physical assumption; explicitly
  state when no issue is found.
- **Validation:** Diff/source inspection only.
- **Subagent assignment:** One clean-context code-review worker, maximum five
  minutes.

### R2 — Guide Geometry And Printability Review

- **Type:** Independent code review; no edits.
- **Boundary:** Review hourglass profile continuity, guide/socket clearance,
  cable-radius derivations, representative routes, vent keepouts, floor
  connection, OpenSCAD 2021.01 compatibility, and Bambu-friendly orientation.
- **Owned files:** Read-only review of the SCAD diff and relevant spec/README
  sections.
- **Dependencies:** D1, D2, and D3.
- **Acceptance criteria:** Report every geometry, printability, radius, collision,
  or documentation issue; explicitly state when no issue is found.
- **Validation:** Diff/source inspection only.
- **Subagent assignment:** One clean-context code-review worker, maximum five
  minutes, concurrent with R1.

### F1 — Review-Finding Fixes

- **Type:** Conditional development.
- **Boundary:** Resolve only accepted in-scope findings from R1, R2, or main-agent
  QA. Split independent findings into new non-overlapping assignments; serialize
  any shared `.scad` edit.
- **Owned files:** The narrow paths/sections named in each accepted finding.
- **Dependencies:** R1 and R2 for review fixes; relevant QA finding for QA fixes.
- **Acceptance criteria:** Each accepted finding is fixed without expanding the
  approved scope, and targeted validation is rerun.
- **Validation:** Finding-specific assertion/render check and `git diff --check`.
- **Subagent assignment:** New clean-context implementation worker per
  deterministic finding, each maximum five minutes.

## Main-Agent Integration And QA

The main agent owns integration and QA and must not delegate final QA.

1. Inspect every worker result and the complete worktree after each unit.
2. Confirm all accepted edits remain within approved artifacts and ownership
   boundaries; preserve unrelated changes.
3. Run `git diff --check`.
4. Run each permitted OpenSCAD command with a hard `15`-second limit and hidden
   electronic/cable references, exporting only under `/tmp`:
   - horizontal `assembly`;
   - vertical-left `assembly`;
   - vertical-right `assembly`;
   - `printable_layout`.
5. Inspect temporary previews or renders for:
   - the correctly oriented, vertically aligned round power hole;
   - the `9.0 mm` head envelope passing through without requiring the rigid
     `28.20 mm` section inside;
   - reduced depth with intact rear catches, sockets, walls, vents, and feet;
   - hourglass guides clearing all cover sockets and remaining floor-connected;
   - representative cable paths meeting the `15.0 mm` radius;
   - exactly three service apertures and only two lay-in slots;
   - separated, stable printable objects fitting the configured bed.
6. Inspect non-rendered mode dispatch for `bottom_tray`, `top_cover`,
   `vertical_support_foot`, and `cable_routing_preview` as required by repository
   instructions.
7. Reconcile source assertions and derived values with all approved measurements.
8. Route any accepted review or QA fix through F1, then repeat affected checks.

OpenSCAD renders provide visual geometry evidence only. Bambu Studio inspection,
printed-hole measurement, DC-head insertion, physical switch fit, cable winding,
thermal observation, vertical stability, and ten-cycle catch validation remain
unverified unless actually performed by the user.

## Documentation And Contract Reconciliation

- Ensure the approved spec, approved plan, SCAD source, and README agree on every
  changed dimension and behavior.
- Preserve the exact count of three service apertures while documenting that only
  the two Ethernet apertures are lay-in slots.
- Document manual measurements separately from adjustable planning clearance.
- Do not add unrelated documentation churn.

## Commit And Push

- Before staging, inspect `git status --short --branch` and classify every
  modified, added, deleted, renamed, and untracked path.
- Stage every accepted in-scope path: SCAD source, README, approved spec, and
  approved plan. Preserve and identify unrelated user changes.
- Inspect `git diff --cached --check`, `git diff --cached --stat`,
  `git diff --cached --name-status`, and the complete staged diff.
- Because physical fit, Bambu Studio, and test-print checks are expected to remain
  unperformed, use a `DRAFT` commit subject such as
  `feature: DRAFT compact Linksys power and cable routing`.
- Commit on `main`, push to its configured upstream, and verify the local branch
  is no longer ahead of upstream.
- After committing, inspect final `git status --short --branch`; no accepted
  in-scope change may remain outside the commit.

## Completion Criteria

Delivery is complete only when implementation matches the approved spec and
plan, assertions and permitted renders pass, review and QA findings are resolved
or explicitly blocked, documentation is aligned, every accepted in-scope path is
committed and pushed, final status is reconciled, and the main agent presents the
required completion report. Delivery remains `DRAFT` until the physical and
slicer checks listed above are completed.
