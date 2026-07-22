# PLAN: Linksys LGS105 Cable-Management Enclosure

Status: Approved

Approved Spec: `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`

## Objective

Deliver the approved final Linksys LGS105 enclosure with the power-side tray
wall and matching cover edge immediately behind the switch instead of retaining
an unused cover-retention cavity.

The final default geometry must:

- derive outer depth as `switch_origin_y_mm + switch_depth_mm +
  switch_end_clearance_mm + wall_thickness_mm`;
- reduce the default tray and cover depth from `178.2 mm` to `153.5 mm`;
- leave exactly `3.0 mm` behind the switch power face;
- preserve the `10.0 mm` round power-head hole and allow `25.2 mm` of the
  installed `28.20 mm` rigid reference to remain outside;
- relocate four alignment pins/sockets and two positive cover catches within
  the shortened outline without allowing retention geometry to increase depth;
- preserve all approved cable storage, hourglass routing, ventilation,
  horizontal/vertical placement, printable-layout, and service behavior.

## No-Research Boundary

Implementation may use only the approved spec, this approved plan, applicable
repository/workspace instructions, current branch and worktree state, the named
files, and minimal current Linksys SCAD/README patterns. Do not reopen product,
hardware, cable, architecture, or planning research. Do not invent measurements
or relax approved retention, power-hole, cable, ventilation, or printing
behavior. Stop for an artifact amendment if the shortened geometry requires
materially different behavior.

## Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

Do not add OFF, STL, STEP, 3MF, PNG, or other generated artifacts to source
control. Temporary validation artifacts belong under `/tmp`.

## Branch And Worktree Policy

- Expected base and delivery branch: current `main`.
- Direct implementation and delivery on `main` is allowed.
- Inspect `git status --short --branch` before edits and preserve unrelated
  changes.
- Workers must not create or switch branches, commit, push, or edit outside
  their stated ownership boundary.
- Shared SCAD integration is serialized through the main agent.

## Test-First Applicability

This is printable geometry and documentation work rather than business/domain
logic, and the repository has no unit-test harness for OpenSCAD geometry.
Conventional test-first files are therefore not applicable.

Before production edits, a read-only test-focused worker will convert the
approved delta into a static acceptance oracle. Executable protection will be
implemented through OpenSCAD assertions and bounded render evaluation.

## Dependency-Aware Execution Graph

Maximum planned concurrency is one test-focused subagent, one implementation
subagent, and two code-review subagents. D1 and D2 are serialized because they
share the SCAD source. Reviews may run concurrently after documentation is
aligned. Every assignment is limited to five minutes of active subagent work.

### T1 — Shortened-Depth And Retention Acceptance Oracle

- **Type:** Test-focused, read-only; no test files.
- **Boundary:** Translate the approved iteration into exact formulas,
  inequalities, collision keepouts, assertion requirements, and render
  observations before production edits.
- **Owned files:** None; report only.
- **Dependencies:** None.
- **Acceptance criteria:** Cover `153.5 mm` outer depth, `3.0 mm` rear extension,
  `25.2 mm` rigid-head protrusion, complete round-hole passage, four relocated
  alignment pairs, two positive catches, switch/removal clearance, ventilation,
  feet, and printable-layout bounds.
- **Validation:** Cross-check only the approved spec and current source.
- **Subagent assignment:** One clean-context test-focused worker, maximum five
  minutes.

### D1 — Minimal Power-Side Tray And Cover Geometry

- **Type:** Development.
- **Boundary:** Remove retention-controlled depth derivations and derive the
  complete tray, cover, skirt, rear wall, power cut, route preview, dependent
  rear-Y features, and printable layout from the direct switch-fit formula.
- **Owned file:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to enclosure
  depth, matching tray/cover outlines, power-wall/reference geometry, dependent
  rear-Y/layout values, and D1 assertions.
- **Dependencies:** T1.
- **Required approach:**
  - set `enclosure_outer_depth_mm` directly from the approved switch power-face,
    end-clearance, and wall-thickness inputs;
  - remove `power_side_*_clearance_depth_mm` maximum candidates and every
    retention-driven depth dependency;
  - preserve the current power-hole X/Z formulas and full-wall subtraction;
  - derive the rigid reference from the switch power face and assert the default
    `25.2 mm` exterior protrusion without hard-locking adjustable inputs;
  - recalculate cover/skirt, support-foot, vent, preview, and layout positions
    from the shortened depth rather than retaining stale absolute Y values.
- **Acceptance criteria:** Default tray and cover depth is exactly `153.5 mm`;
  their power edges match; no unused rear shelf remains; the switch retains
  `0.6 mm` internal clearance; the bounded power hole and connected rigid-head
  reference remain correct; preserved features remain within the new outline.
- **Validation:** Hidden-reference horizontal assembly CSG evaluation under
  `15` seconds and `git diff --check`.
- **Subagent assignment:** One clean-context implementation worker, maximum five
  minutes.

### D2 — Relocated Alignment And Positive-Catch Geometry

- **Type:** Development.
- **Boundary:** Reposition the second, switch-side alignment pair and redesign
  the two positive catches so all retention fits within the `153.5 mm` outline
  without occupying the switch or power-wall keepouts.
- **Owned file:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to cover-pin
  Y derivations, socket webs/reliefs, catch placement/orientation, release
  openings, retention assertions, and directly dependent foot/vent positions.
- **Dependencies:** T1 and D1.
- **Required approach:**
  - keep two front and two switch-side tapered alignment pins with the approved
    diameters, taper, clearance, and alignment-only role;
  - derive the switch-side pair immediately ahead of the switch's conservative
    straight-up removal sweep, with its complete boss retaining the approved
    switch-end clearance; this approved placement replaces the infeasible rear
    inset because the available side margins cannot keep a same-X rear pair out
    of that removal sweep;
  - keep the switch-side pair's socket and pin Z envelopes above the switch;
  - retain one positive catch on each long side but move the release span ahead
    of the switch-side socket keepout;
  - confine each catch arm to its side-wall envelope and direct its hook/capture
    away from the switch so the `0.6 mm` switch clearance is not consumed;
  - derive catch Y so the release far edge remains at least one wall thickness
    before the switch-side socket boss near edge;
  - preserve the approved catch flexure length/thickness, engagement,
    interference, release width/height, tool-free access, and independent
    positive-retention role;
  - assert complete XY/Z separation among switch, sockets, catch arms/hooks,
    power hole, vents, support sockets, and cover-removal paths.
- **Acceptance criteria:** Four alignment pairs and two catches are connected,
  accessible, in bounds, geometrically engaged, clear of the switch and power
  aperture, and no longer contribute to enclosure depth. Horizontal and both
  vertical assemblies retain positive cover capture.
- **Validation:** Hidden-reference horizontal and both vertical assembly CSG
  evaluations under `15` seconds plus relevant assertion output.
- **Subagent assignment:** One new clean-context implementation worker, maximum
  five minutes; serialized after D1.

### D3 — Documentation Alignment

- **Type:** Documentation development; test-first not applicable.
- **Boundary:** Update only the Linksys README section for the final shortened
  geometry, retention placement, power insertion, layout bounds, and physical
  validation limitations.
- **Owned file:** `README.md` only.
- **Dependencies:** D1 and D2.
- **Acceptance criteria:** README records the implemented `153.5 mm` depth,
  `3.0 mm` switch-to-exterior distance, `25.2 mm` protrusion, relocated
  retention behavior, unchanged three-aperture contract, and no stale `178.2 mm`
  default claim.
- **Validation:** Targeted consistency scan and `git diff --check`.
- **Subagent assignment:** One clean-context documentation worker, maximum five
  minutes.

### R1 — Depth, Power, And Preserved-Feature Review

- **Type:** Independent read-only code review.
- **Boundary:** Review the depth formula, tray/cover match, switch clearance,
  power-hole/reference behavior, vents, feet, vertical placement, and printable
  layout against the approved artifacts.
- **Owned files:** Read-only review of the SCAD diff, README, spec, and plan.
- **Dependencies:** D1, D2, and D3.
- **Acceptance criteria:** Report every spec/plan mismatch, stale depth
  dependency, regression risk, missing assertion, or unsupported physical claim;
  explicitly state when none is found.
- **Validation:** Diff/source inspection only.
- **Subagent assignment:** One clean-context reviewer, maximum five minutes.

### R2 — Retention, Clearance, And Printability Review

- **Type:** Independent read-only code review.
- **Boundary:** Review all four pin/socket pairs, both catches, switch/removal
  clearance, power-wall continuity, release accessibility, vent/foot conflicts,
  OpenSCAD 2021.01 compatibility, and Bambu-friendly part connectivity and
  orientation.
- **Owned files:** Read-only review of the SCAD diff and relevant artifact/docs
  sections.
- **Dependencies:** D1, D2, and D3.
- **Acceptance criteria:** Report every collision, capture, printability,
  strength, serviceability, assertion, or documentation issue; explicitly state
  when none is found.
- **Validation:** Diff/source inspection only.
- **Subagent assignment:** One clean-context reviewer, maximum five minutes,
  concurrent with R1.

### F1 — Review And QA Finding Fixes

- **Type:** Conditional development.
- **Boundary:** Resolve only accepted in-scope findings from R1, R2, or
  main-agent QA. Serialize shared SCAD fixes and split independent findings when
  ownership permits.
- **Owned files:** Narrow sections named by each accepted finding.
- **Dependencies:** R1 and R2 for review fixes; relevant QA finding for QA fixes.
- **Acceptance criteria:** Each finding is resolved without expanding approved
  behavior, followed by targeted revalidation.
- **Validation:** Finding-specific assertion/render check and
  `git diff --check`.
- **Subagent assignment:** One new clean-context implementation worker per
  deterministic finding, each maximum five minutes.

## Main-Agent Integration And QA

The main agent owns integration and final QA.

1. Inspect every worker result and the complete worktree after each unit.
2. Confirm edits stay within approved artifacts and ownership boundaries.
3. Run `git diff --check`.
4. Run each permitted OpenSCAD render with a hard `15`-second timeout and hidden
   electronic/cable references, exporting only under `/tmp`:
   - horizontal `assembly`;
   - vertical-left `assembly`;
   - vertical-right `assembly`;
   - `printable_layout`.
5. Inspect render or mesh evidence for:
   - matching `153.5 mm` tray/cover depth and the `3.0 mm` rear extension;
   - a connected `28.20 mm` rigid reference with `25.2 mm` outside;
   - the correct round power aperture with continuous surrounding wall;
   - four aligned pin/socket pairs above and clear of the switch;
   - two engaged, releasable catches clear of switch, pins, vents, feet, and
     power hole;
   - intact cable storage, guides, vents, vertical supports, and apertures;
   - four separated stable printable objects inside the configured bed.
6. Inspect source dispatch for `bottom_tray`, `top_cover`,
   `vertical_support_foot`, and `cable_routing_preview` without separately
   rendering those modes.
7. Reconcile formulas/assertions with every approved default and ensure
   adjustable parameters remain adjustable.
8. Route accepted findings through F1 and repeat affected checks.

OpenSCAD evidence does not replace Bambu Studio inspection, physical switch and
power-head fit, cable routing, thermal observation, vertical stability, printed
retention force, or the ten-cycle catch test.

## Documentation And Contract Reconciliation

- Keep approved spec, plan, source, and README aligned on all depth, retention,
  power-hole, and protrusion values.
- Preserve exactly three cable-service apertures: two Ethernet lay-in slots and
  one bounded round power pass-through.
- Document the distinction between external hardware connectors and internal
  cover-alignment sockets.
- Do not add unrelated documentation churn.

## Commit And Push

- Before staging, inspect `git status --short --branch` and classify every
  modified, added, deleted, renamed, and untracked path.
- Stage every accepted in-scope path: SCAD source, README, approved spec, and
  approved plan. Preserve and identify unrelated changes.
- Inspect `git diff --cached --check`, staged statistics, staged path list, and
  the complete staged diff.
- Use a `DRAFT` commit subject because slicer and physical validation are
  expected to remain unperformed, for example
  `fix: DRAFT shorten Linksys power-side enclosure`.
- Commit on `main`, push to its configured upstream, and verify the local branch
  is no longer ahead of upstream.
- Confirm no accepted in-scope change remains outside the commit.

## Completion Criteria

Implementation is complete when source and documentation match the approved
spec/plan, assertions and bounded renders pass, review and QA findings are
resolved or explicitly blocked, all accepted paths are committed and pushed,
final status is reconciled, and the main agent presents the required completion
report. Delivery remains `DRAFT` until slicer and physical checks are completed.
