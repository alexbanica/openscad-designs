# PLAN: Linksys LGS105 Cable-Management Enclosure

Status: Approved

Approved Spec: `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`

## Auto-Approved Super-Agent Work Record: 5.90 mm Round UTP Fit (2026-07-23)

### Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

### Implementation Steps Performed

1. Replaced the old `4.0 mm` round-uplink assumption with the user-supplied
   `5.90 mm` maximum diagonal/circular envelope.
2. Added an adjustable `0.5 mm` minimum fit allowance per side and increased the
   uplink lay-in passage from `6.0 mm x 6.0 mm` to `7.0 mm x 8.0 mm`, yielding
   `0.55 mm` nominal lateral and `1.05 mm` nominal vertical clearance per side.
3. Applied the measured profile to the representative internal route and kept
   the installed cover relief derived from the enlarged tray aperture.
4. Added calculated-clearance assertions and reconciled the documented route
   radius and public controls. The first bounded render rejected a `7.0 mm`
   slot height because the centered cable exceeded the guide's fully protected
   top envelope by `0.15 mm`; the delivered `8.0 mm` height centers the cable
   lower while retaining the existing guide.
5. Updated the matching approved spec and this completed-work record.

### Validation And Delivery Record

- Validation run: `git diff --check` and one hidden-reference horizontal
  `assembly` OpenSCAD export with a hard ten-second limit.
- Validation skipped: unit tests are prohibited; vertical assemblies,
  printable-layout export, Bambu Studio inspection, cable coupon, printing, and
  physical cable fit were not run.
- QA skipped: required by the explicit super-agent workflow.
- Code review skipped: required by the explicit super-agent workflow.
- Documentation updated: Linksys UTP profile, aperture, clearance, routing, and
  calibration guidance.
- Staging status: all four in-scope paths staged; no unrelated paths staged.
- Commit status: not committed.
- Push status: not pushed.
- Residual risk: nominal assertions and one short render cannot prove printed
  cable fit; delivery remains `DRAFT` until slicer and physical checks pass.

## Auto-Approved Super-Agent Work Record: Measured 89 mm Switch Span (2026-07-23)

This completed record supersedes the prior plan's `153.5 mm` depth invariant;
the earlier top-cover correction history remains unchanged.

### Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

### Implementation Steps Performed

1. Mapped the reported `89 mm` switch width to the undersized source-Y
   Ethernet-to-power body span, leaving the already larger `121.0 mm` source-X
   body width unchanged.
2. Changed `switch_depth_mm` from `75.5` to the user-measured `89.0` while
   preserving `0.6 mm` clearance at each end, yielding a `90.2 mm` bay
   allocation and `167.0 mm` outer enclosure depth.
3. Updated exact-value assertions for the power face/wall, power pass-through
   reference, top vent bounds, and `255.5 mm x 186.5 mm` printable layout.
4. Documented the new measured default, clearance, enclosure depth, and layout
   bounds in the Linksys README section.
5. Updated the matching approved spec and this completed-work record.

### Validation And Delivery Record

- Validation run: `git diff --check` and one hidden-reference horizontal
  `assembly` OpenSCAD export with a hard ten-second limit.
- Validation skipped: unit tests are prohibited; vertical assemblies,
  printable-layout export, Bambu Studio inspection, reprinting, and physical
  switch fit were not run.
- QA skipped: required by the explicit super-agent workflow.
- Code review skipped: required by the explicit super-agent workflow.
- Documentation updated: Linksys measured body span, fit allowance, enclosure
  depth, and printable-layout guidance.
- Staging status: all four in-scope paths staged; no unrelated paths staged.
- Commit status: not committed.
- Push status: not pushed.
- Residual risk: assertions and one short render cannot prove printed fit;
  delivery remains `DRAFT` until slicer and physical checks pass.

## Auto-Approved Super-Agent Work Record: Receiver Relief And Catch Reach (2026-07-23)

### Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

### Implementation Steps Performed

1. Added an adjustable `0.5 mm` extra per-side clearance to all four top-cover
   skirt reliefs around the complete female receiver bosses and wall webs,
   increasing each relief by `1.0 mm` overall.
2. Increased the top-cover tapered catch lead-in reach from `1.0 mm` to
   `2.0 mm`, adding `1.0 mm` without changing the existing bottom tray,
   capture ledges, engagement height, interference, or flexure sections.
3. Updated the receiver-clearance and default-value assertions.
4. Corrected one stale exact-value assertion found by the first bounded render;
   it still expected the previous `1.0 mm` lead-in offset.
5. Documented the physical-fit calibration values and retained test-print risk.
6. Updated the matching approved spec and this completed-work record.

### Validation And Delivery Record

- Validation run: `git diff --check` and one hidden-reference horizontal
  `assembly` OpenSCAD export with a hard ten-second limit.
- Validation skipped: unit tests are prohibited; vertical assemblies,
  printable-layout export, Bambu Studio inspection, physical replacement-cover
  print, existing-tray fit, and latch cycling were not run.
- QA skipped: required by the explicit super-agent workflow.
- Code review skipped: required by the explicit super-agent workflow.
- Documentation updated: Linksys receiver-relief and catch-reach guidance.
- Staging status: all four in-scope paths staged; no unrelated paths staged.
- Commit status: not committed.
- Push status: not pushed.
- Residual risk: source assertions and one short render cannot prove printed
  clearance or latch engagement; delivery remains `DRAFT` until slicer and
  physical checks pass.

## Auto-Approved Super-Agent Work Record: Physical Cover-Flip Alignment (2026-07-23)

### Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

### Implementation Steps Performed

1. Replaced the nonphysical Z-only cover reflection with the real installation
   transform: a `180` degree Y rotation plus enclosure-width X translation and
   the existing seated Z translation.
2. Mirrored each printable cover-local Ethernet relief center from its unchanged
   tray center so the installed center maps back to the tray coordinate.
3. Updated installed-coordinate assertions for reliefs, pins, catches, and the
   seated roof datum without changing tray or retention geometry.
4. Replaced exact installed pin-coordinate equality with the existing
   microscopic retention tolerance after short validation exposed floating-point
   representation differences.
5. Documented the required installation rotation and local-to-installed X
   mapping in the Linksys README section.
6. Updated the matching approved spec and this completed-work record.

### Validation And Delivery Record

- Validation run: `git diff --check` and one hidden-reference horizontal
  `assembly` OpenSCAD export with a hard ten-second limit.
- Validation skipped: unit tests are prohibited; vertical assemblies,
  printable-layout export, Bambu Studio inspection, physical replacement-cover
  print, existing-tray fit, representative-cable fit, and latch cycling were not
  run.
- QA skipped: required by the explicit super-agent workflow.
- Code review skipped: required by the explicit super-agent workflow.
- Documentation updated: Linksys README installation and alignment guidance.
- Staging status: all four in-scope paths staged; no unrelated paths staged.
- Commit status: not committed.
- Push status: not pushed.
- Residual risk: nominal coordinate assertions and one short render cannot prove
  printed fit; delivery remains `DRAFT` until slicer and physical checks pass.

## Objective

Correct the three approved top-cover physical-fit defects while preserving the
existing bottom tray as a reusable printed part:

- align the two top-cover Ethernet reliefs with the tray's uplink and shared
  device-cable lay-in slots;
- clear each complete female tray socket receiver, including its structural
  wall web, so the cover reaches its seated datum; and
- extend the two top-cover catch lead-ins by an adjustable default `1.0 mm` so
  they enter the unchanged tray windows while their capture ledges retain the
  approved positive engagement.

The implementation must not change rendered bottom-tray geometry, enclosure
depth, tray apertures, socket receivers, catch windows, or any other preserved
enclosure behavior.

## Approved Invariants

- The bottom tray remains physically and geometrically unchanged so the user can
  print only a replacement top cover.
- "Back cable holes" means the two Ethernet-side lay-in openings: one round
  uplink cable slot and one shared four-flat-device-cable slot.
- The round power pass-through remains tray-only and unchanged.
- All four pin/socket centers and the two tray capture windows remain fixed.
- The default enclosure depth remains `153.5 mm`; the switch-to-exterior
  power-side extension remains `3.0 mm`.
- Exactly three cable-service apertures, all cable profiles, guide geometry,
  ventilation, switch retention, vertical feet, render modes, and printable
  orientation remain unchanged.
- The approved catch flexure length/thickness, engagement height, positive
  interference, release direction, and capture ledge remain unchanged. Only the
  top-cover lead-in reach may gain the approved adjustable extension.

## No-Research Boundary

Implementation may load only applicable instructions, the approved spec, this
approved plan, Git/worktree state, the named files, and the smallest relevant
current Linksys source and README sections. Do not reopen product, cable,
hardware, architecture, or planning research. Do not invent additional
measurements or change the approved `1.0 mm` calibration default. If the fixed
tray cannot be reused under this contract, stop for a spec amendment.

## Affected Files

- `designs/linksys_lgs105_cable_management_enclosure.scad`
- `README.md`
- `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`
- `specs/PLAN-linksys-lgs105-cable-management-enclosure.md`

Do not add OFF, STL, STEP, 3MF, PNG, CSG, or other generated artifacts to source
control. Temporary inspection outputs belong under `/tmp`.

## Branch And Worktree Policy

- Expected base and delivery branch: `main` tracking `origin/main`.
- Direct implementation and delivery on `main` is allowed.
- Inspect `git status --short --branch` before implementation and preserve any
  unrelated user changes.
- Workers must not create or switch branches, commit, push, or edit outside
  their assigned ownership boundary.
- The main agent serializes all SCAD integration and owns staging, commit, push,
  final worktree reconciliation, and acceptance.

## Unit-Test And Test-First Applicability

Unit tests and conventional test-first work are not applicable and are
prohibited by repository instructions. No unit-test files or test-focused
subagents may be created or run.

Geometry protection comes from approved-formula review before editing,
OpenSCAD assertions, bounded permitted renders, source/diff inspection, and
physical fit criteria. Each development unit records its test assignment as not
applicable for this repository.

## Dependency-Aware Execution Graph

Maximum planned concurrency is one development subagent and two code-review
subagents. D1 and D2 are serialized because they edit the same SCAD file and D2
depends on D1's seated-cover datum. R1 and R2 may run concurrently after D3.
Every subagent assignment is limited to five minutes of active work.

### D1 — Top-Cover Slot And Receiver Reliefs

- **Type:** Geometry development.
- **Behavior boundary:** Correct only the top-cover mating/skirt geometry for
  Ethernet-slot alignment and full female-receiver clearance.
- **Owned file:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to relevant
  adjustable/derived mating values, `cover_skirt()`, top-cover-only helper
  geometry, and directly corresponding assertions.
- **Dependencies:** None.
- **Unit-test assignment:** Not applicable; unit tests are prohibited.
- **Development assignment:** One clean-context developer subagent, maximum five
  minutes. It must not edit tray modules, tray cut geometry, socket receiver
  solids, catch windows, enclosure depth, or unrelated source sections.
- **Required approach:**
  - derive each top-cover Ethernet relief from the matching tray aperture's
    installed X center, width, and complete installed Y passage; because the
    printed cover is installed with a `180` degree Y rotation, derive cover-local
    X as `enclosure_outer_width_mm - tray_aperture_x_mm`;
  - keep the exterior roof intact while clearing the skirt through the complete
    lay-in passage;
  - replace boss-only circular skirt clearance with local cover-only reliefs for
    the complete receiver boss and wall web plus `cover_fit_clearance_mm`;
  - retain four coaxial tapered pins at their existing centers;
  - add assertions for shared slot coordinates, receiver/web clearance,
    pin/socket coaxiality, and the fully seated roof/tray-wall datum.
- **Acceptance criteria:** Both Ethernet passages have no installed X/Y step or
  reduced usable envelope; the skirt clears all four complete tray receivers;
  all pins remain aligned; the cover can nominally settle; rendered bottom-tray
  geometry remains unchanged by source inspection.
- **Validation:** Targeted source/diff inspection, assertion evaluation through
  the permitted horizontal assembly render, and `git diff --check`.

### D2 — Top-Cover Catch Lead-In Reach

- **Type:** Geometry development.
- **Behavior boundary:** Extend only the two top-cover catch entry portions so
  they reach the fixed tray windows while preserving the capture ledges and
  release behavior.
- **Owned file:**
  `designs/linksys_lgs105_cable_management_enclosure.scad`, limited to the new
  adjustable catch-reach parameter, its derived top-cover values,
  `cover_positive_snap_catch()`, and corresponding assertions.
- **Dependencies:** D1.
- **Unit-test assignment:** Not applicable; unit tests are prohibited.
- **Development assignment:** One new clean-context developer subagent, maximum
  five minutes. It must not edit tray release openings or shared values in a way
  that moves or resizes them.
- **Required approach:**
  - add an adjustable `1.0 mm` default top-cover lead-in/reach allowance in the
    appropriate parameter group;
  - extend the tapered entry into the existing window without moving the
    positive-capture ledge or weakening the roof-rooted flexure;
  - keep the existing `12.0 mm` flexure length, `2.0 mm` flexure thickness,
    `1.6 mm` engagement height, `0.15 mm` interference, and inward release travel;
  - derive against the unchanged tray-window coordinates and assert entry,
    non-bottoming, positive shoulder capture, and release clearance.
- **Acceptance criteria:** Both catches enter their existing windows at the
  seated datum, retain the approved capture interference, fit within the
  `6.0 mm` window height, remain connected/printable, and release without a
  tool; tray window geometry is unchanged.
- **Validation:** Targeted source/diff inspection, horizontal and both vertical
  assembly assertion evaluation, and `git diff --check`.

### D3 — Linksys Documentation Alignment

- **Type:** Documentation development.
- **Behavior boundary:** Document only the approved top-cover fit correction and
  physical reuse/validation procedure.
- **Owned file:** `README.md`, limited to the Linksys LGS105 section.
- **Dependencies:** D1 and D2.
- **Unit-test assignment:** Not applicable; documentation-only work.
- **Development assignment:** One clean-context developer subagent, maximum five
  minutes.
- **Acceptance criteria:** README states that only the top cover changes, the
  existing tray is reused, the two Ethernet reliefs now share tray coordinates,
  the skirt clears full socket receivers/webs, the catch lead-in default is
  adjustable at `1.0 mm`, and slicer/test-print validation remains required.
- **Validation:** Targeted Linksys consistency scan and `git diff --check`.

### R1 — Mating Geometry And Retention Review

- **Type:** Independent read-only code review.
- **Boundary:** Review the complete SCAD diff against the approved spec and plan,
  focusing on bottom-tray preservation, installed coordinate transforms, slot
  continuity, receiver/web clearance, pin/socket alignment, seated datum,
  catch-window entry, shoulder capture, release, and assertions.
- **Owned files:** Read-only review of the SCAD diff and approved artifacts.
- **Dependencies:** D1, D2, and D3.
- **Subagent assignment:** One clean-context code-review subagent, maximum five
  minutes; concurrent with R2; no edits.
- **Acceptance criteria:** Report every spec/plan mismatch, tray regression,
  collision, insufficient clearance, unproven coordinate relationship, or
  missing assertion; explicitly state when none is found.
- **Validation:** Diff and source inspection only.

### R2 — Printability, Regression, And Documentation Review

- **Type:** Independent read-only code review.
- **Boundary:** Review top-cover connectivity and stable orientation, OpenSCAD
  2021.01 compatibility, aperture/vent/feet/switch/depth regressions, parameter
  organization, README accuracy, and physical-validation claims.
- **Owned files:** Read-only review of all four affected files.
- **Dependencies:** D1, D2, and D3.
- **Subagent assignment:** One clean-context code-review subagent, maximum five
  minutes; concurrent with R1; no edits.
- **Acceptance criteria:** Report every printability, compatibility,
  documentation, scope, or regression issue; explicitly state when none is
  found.
- **Validation:** Diff and source inspection only.

### F1 — Review And QA Finding Fixes

- **Type:** Conditional development.
- **Boundary:** Resolve only accepted in-scope findings from R1, R2, or
  main-agent QA; no artifact or behavior expansion.
- **Owned files:** Narrow sections identified by each accepted finding.
- **Dependencies:** The relevant completed review or QA finding.
- **Unit-test assignment:** Not applicable; unit tests remain prohibited.
- **Development assignment:** One new clean-context developer subagent per
  deterministic finding, maximum five minutes each. Serialize SCAD fixes.
- **Acceptance criteria:** Each accepted finding is resolved inside the approved
  contract and affected validation is repeated.
- **Validation:** Finding-specific source/assertion/render checks and
  `git diff --check`.

## Main-Agent Integration And QA

The main agent owns integration and final QA.

1. Inspect each worker result and the complete worktree after every unit.
2. Confirm the bottom-tray modules, solids, openings, sockets, windows, and
   geometry-driving values remain unchanged; source refactoring may only expose
   their existing mating envelopes for top-cover calculations/assertions.
3. Run `git diff --check`.
4. Run only permitted OpenSCAD renders, each with a hard `15`-second timeout,
   hidden electronic/cable references, and output under `/tmp`:
   - horizontal `assembly`;
   - left-side vertical `assembly`;
   - right-side vertical `assembly`;
   - `printable_layout`.
5. Inspect the rendered geometry for a cover at the seated datum, continuous
   Ethernet passages, roof closure without cable-envelope intrusion, clearance
   around all complete receiver bosses/webs, four aligned pin/socket pairs, two
   catches entering and capturing their windows, unobstructed release, connected
   printable parts, stable orientation, and unchanged depth/apertures/vents/feet.
6. Inspect `bottom_tray`, `top_cover`, `vertical_support_foot`, and
   `cable_routing_preview` dispatch in source without separately rendering those
   modes, as required by repository instructions.
7. Reconcile all adjustable and derived formulas with the approved defaults and
   inspect assertion output for every new mating invariant.
8. Route accepted findings through F1 and repeat all affected checks.

OpenSCAD evidence is nominal visual validation. It does not replace Bambu Studio
inspection or fitting a newly printed cover to the existing physical tray.

## Physical Validation And Delivery Status

The implementation agent must report these checks as unperformed unless the user
provides direct evidence:

- slice the replacement top cover in Bambu Studio and inspect supports, wall
  continuity, thin features, and plate contact;
- print only the replacement top cover;
- lower it vertically onto the existing tray without forced flexing;
- confirm both Ethernet passages align and do not pinch representative cables;
- confirm all four pins enter and both catches engage their unchanged windows;
- release and reinstall the cover for ten tool-free cycles without damage.

Delivery remains `DRAFT` until those physical checks pass.

## Documentation And Contract Reconciliation

- Keep spec, plan, SCAD, and the Linksys README section consistent.
- Preserve exactly three cable-service apertures and the distinction between the
  two Ethernet lay-in slots, the tray-only power hole, internal alignment
  sockets, and catch release windows.
- Document the `1.0 mm` reach as an adjustable calibration default, not a proven
  physical measurement.
- Do not add unrelated documentation churn.

## Commit And Push

- Before staging, inspect `git status --short --branch` and classify every
  modified, added, deleted, renamed, and untracked path.
- Stage every accepted in-scope path: SCAD source, README, approved spec, and
  approved plan. Preserve and identify unrelated changes.
- Inspect `git diff --cached --check`, staged statistics, staged path list, and
  the complete staged diff.
- Use a DRAFT commit subject because slicer and physical fit validation remain
  unperformed, for example:
  `fix: DRAFT correct Linksys top cover fit`.
- Commit on `main`, push to its configured upstream, verify the local branch is
  no longer ahead, and confirm no accepted in-scope change remains outside the
  commit.

## Completion Criteria

Implementation is complete when the source and README match both approved
artifacts, bottom-tray geometry is preserved, all assertions and bounded renders
pass, review/QA findings are resolved or explicitly blocked, all accepted paths
are committed and pushed, final Git status is reconciled, and final main-agent
acceptance and the required completion report are complete. Delivery remains
`DRAFT` until slicer and physical existing-tray fit checks pass.
