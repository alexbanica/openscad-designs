# PLAN: Voomy USB Cap Lower-Tab Shift

Status: Approved

Approved Spec: `specs/SPEC-voomy-usb-cap-fit.md`

Integrated Delivery Plan:
`specs/PLAN-voomy-power-s7-cable-management-case.md`

## Component Objective

Keep all four USB-cover tabs, keep the complete upper pair fixed, and move the
complete lower pair upward exactly `2.0 mm` for bottom-first installation
through the unchanged `36.0 x 60.0 mm` base opening. This component is executed
and delivered only through the integrated Voomy plan because both removable-cap
changes share the same SCAD source and delivery commit.

Implementation must not repeat product, architecture, scope, planning, or
plan-discovery research. The approved spec, this component plan, and the
integrated plan are the complete execution input.

## Branch And Worktree Contract

- Delivery branch: existing `main` in the invoking checkout.
- Expected base: `origin/main` at
  `f60e93593b79a4e2d247146987c2848b5b961b08`.
- Linked worktree: no, as explicitly requested by the user.
- Verify branch, base, index, and path classification before edits. Preserve the
  existing staged USB-cap layer and all unrelated staged workflow-policy work.

## Test-First Policy

Unit tests and conventional test-first work are prohibited and not applicable.
No test-writer is used. Planned test-focused concurrency is `0`.

## Component Execution Unit U1

- Type: development.
- Boundary: introduce independent upper/lower tab position derivations; leave
  the upper pair unchanged; translate each complete lower tab upward `2.0 mm`.
- Owned file: `designs/voomy_power_s7_cable_management_case.scad`.
- Dependencies: integrated-plan V0 and D1; U1 is integrated-plan D2.
- Acceptance criteria:
  - exactly four tabs remain connected to the panel;
  - both upper tabs retain their current position and geometry;
  - both lower shafts, hooks, lead-ins, and press features move together upward
    exactly `2.0 mm` and otherwise retain their current geometry;
  - the lower pair provides bottom-first location while the upper pair provides
    positive snap retention;
  - panel dimensions and installed outside-wall position remain unchanged;
  - no base opening, wall, or other base geometry changes;
  - assertions prove the pair count, unchanged upper coordinates, exact lower
    shift, and valid printable connectivity.
- Validation: source assertions, focused diff, bounded reference-free assembly
  evaluation, and installed-envelope inspection.
- Subagent assignment: one clean-context `developer`, at most five minutes,
  serialized after integrated-plan D1 because both units share the SCAD file.

## Review Unit U2

- Type: independent read-only code review.
- Boundary: audit U1 and matching README guidance against the approved USB spec.
- Owned files: no writes; inspect the SCAD USB diff, Voomy README section, this
  plan, and the approved USB spec.
- Dependencies: U1 and integrated-plan D3.
- Acceptance criteria: identify every mismatch in shift distance, upper-pair
  preservation, tab count/connectivity, base preservation, installation
  envelope, assertions, documentation, or printability; report no findings
  explicitly when applicable.
- Validation: artifact, source, documentation, and diff inspection.
- Subagent assignment: one clean-context `code-reviewer`, at most five minutes;
  this is integrated-plan R2 and may run concurrently with R1.

## Main-Agent QA, Documentation, And Delivery

- The integrated plan owns main-agent QA, bounded `assembly` and
  `printable_layout` validation, `git diff --check`, immutable-base comparison,
  final review resolution, and final acceptance.
- README must retain the existing outside-wall seating guidance and add the
  bottom-first sequence, lower locating-pair role, upper retaining-pair role,
  and physical-validation boundary.
- Reprint only the USB cover. Physical acceptance requires bottom-first entry,
  upper-pair snap without panel bending or base stress, complete seating,
  removal, and repeated cycling.
- This component's SCAD, README, approved spec, and this plan must be included
  in the integrated path-limited Voomy commit on `main`, then pushed to
  `origin/main`. The unrelated staged workflow-policy paths remain preserved
  and excluded.
- Use the integrated DRAFT commit rule until physical acceptance is completed.
- Final reconciliation must confirm that no accepted USB-cap change remains
  outside the pushed commit.
