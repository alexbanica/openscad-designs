# PLAN: Voomy USB Cap 1 mm Lower-Tab Shift

Status: Approved

Approved Spec: `specs/SPEC-voomy-usb-cap-fit.md`

Integrated Delivery Plan:
`specs/PLAN-voomy-power-s7-cable-management-case.md`

## Component Objective

Keep all four USB-cover tabs and the complete upper pair fixed while moving each
complete lower tab upward exactly `1.0 mm` from its unshifted position through
the unchanged `36.0 x 60.0 mm` base opening.

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

## Component Development Unit U1

- Type: development.
- Boundary: keep upper tabs unchanged and translate both complete lower tab
  geometries upward exactly `1.0 mm`.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: integrated-plan V0 and D1; U1 is integrated-plan D2.
- Acceptance criteria: exactly four connected tabs; unchanged complete upper
  pair; lower shafts, hooks, lead-ins, and press features move together exactly
  `1.0 mm`; lower hooks remain `0.55 mm` inside the lower edge as locating
  tabs; upper pair retains positive snap engagement; panel and installed
  outside-wall position unchanged; complete base unchanged; assertions prove
  all final positions and connectivity.
- Validation: assertions, focused source diff, installed-envelope inspection,
  and bounded reference-free `assembly` evaluation.
- Subagent assignment: one clean-context `developer`, at most five minutes,
  serialized after integrated-plan D1.

## Component Review Unit U2

- Type: independent read-only code review.
- Boundary: audit U1 and matching Voomy README guidance against the approved USB
  spec.
- Owned files: no writes; inspect the USB SCAD diff, Voomy README section,
  approved specs, and plans.
- Dependencies: U1 and integrated-plan D3.
- Acceptance criteria: identify every mismatch in shift distance, upper-pair
  preservation, tab count/connectivity, base preservation, installation
  envelope, assertions, documentation, or printability; report no findings
  explicitly when applicable.
- Validation: artifact, source, documentation, and focused diff inspection.
- Subagent assignment: one clean-context `code-reviewer`, at most five minutes;
  this is integrated-plan R2 and may run concurrently with R1.

## Main-Agent QA, Documentation, And Delivery

- The integrated plan owns main-agent QA, bounded `assembly` and
  `printable_layout` validation, `git diff --check`, immutable-base
  comparison, review resolution, staging, commit, push, and final acceptance.
- README must document the exact `1.0 mm` shift, bottom-first lower locating
  pair, unchanged upper retaining pair, and physical-validation boundary.
- Reprint only the USB cover. Physical acceptance requires bottom-first entry,
  upper-pair snap without panel bending or base stress, complete seating,
  removal, and repeated cycling.
- Include this component's accepted source, README, approved spec, and plan in
  the integrated DRAFT commit on `main`, push it to `origin/main`, and verify
  no accepted USB-cap change remains outside the pushed commit.
