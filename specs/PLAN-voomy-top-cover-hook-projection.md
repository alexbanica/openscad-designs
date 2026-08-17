# PLAN: Voomy Measured Top-Cover Clamp Reach And Hook Capture

Status: Approved

Approved Spec: `specs/SPEC-voomy-top-cover-hook-projection.md`

Integrated Delivery Plan:
`specs/PLAN-voomy-power-s7-cable-management-case.md`

## Component Objective

Use the printed base's `11.5 mm` receiver-top margin and `3.55 mm` wall
thickness to calibrate only the top cover. Place the hook ledge `13.5 mm`
below the base top, use a `2.0 mm` hook height and projection, and derive a
`15.5 mm` arm reach while preserving the complete base.

Implementation must not repeat product, architecture, scope, planning, or
plan-discovery research. This component executes only through the integrated
delivery plan because both cover corrections share the SCAD source and commit.

## Branch And Worktree Contract

- Delivery branch: existing `main` in the invoking checkout.
- Expected base: `origin/main` at
  `cd2d90e86491ef3e9d604536bf826916308049fc`.
- Linked worktree: no; preserve the approved integrated direct-`main` choice.
- Verify the refreshed base, branch, index, artifacts, and full path
  classification before edits. Preserve and identify unrelated user changes.

## Test-First Policy

Unit tests and conventional test-first work are prohibited and not applicable.
No test-writer is used. Planned test-focused concurrency is `0`.

## Component Development Unit T1

- Type: development.
- Boundary: implement only the approved top-cover calibration, derivations,
  assertions, arm reach, and hook profile.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: integrated-plan V0; T1 is integrated-plan D1.
- Acceptance criteria: ledge offset `13.5 mm`; vertical capture `2.0 mm`;
  hook height/projection `2.0 mm`; tip and arm reach `15.5 mm`; nominal
  lower-edge clearance `1.6 mm`; effective wall penetration `1.7 mm`;
  `12.0 mm` width, `2.4 mm` arm thickness, compensated coordinates, roof,
  skirt, ventilation, and all base-generating geometry unchanged; assertions
  prove all final calculations and containment.
- Validation: assertions, immutable-base source comparison, focused diff,
  installed-envelope inspection, and bounded reference-free `assembly`
  evaluation.
- Subagent assignment: one clean-context `developer`, at most five minutes,
  owning only the top-cover calibration boundary.

## Component Review Unit T2

- Type: independent read-only code review.
- Boundary: audit T1 and matching Voomy README guidance against the approved
  top-cover specs.
- Owned files: no writes; inspect the top-cover SCAD diff, Voomy README section,
  approved specs, and plans.
- Dependencies: T1 and integrated-plan D3.
- Acceptance criteria: identify every calculation mismatch, base regression,
  geometry/assertion gap, documentation mismatch, or printability risk; report
  no findings explicitly when applicable.
- Validation: artifact, source, documentation, and focused diff inspection.
- Subagent assignment: one clean-context `code-reviewer`, at most five minutes;
  this is integrated-plan R1 and may run concurrently with R2.

## Main-Agent QA, Documentation, And Delivery

- The integrated plan owns main-agent QA, bounded `assembly` and
  `printable_layout` validation, `git diff --check`, immutable-base
  comparison, review resolution, staging, commit, push, and final acceptance.
- README must distinguish printed-base calibration measurements from unchanged
  source-base geometry and document reprinting only the top cover.
- Physical acceptance requires seating, positive upper-edge capture, lower-edge
  and exterior-wall clearance, safe removal, and at least 20 cycles.
- Include this component's accepted source, README, approved spec, and plan in
  the integrated DRAFT commit on `main`, push it to `origin/main`, and verify
  no accepted top-cover change remains outside the pushed commit.
