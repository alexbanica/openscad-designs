# PLAN: Correct Seeed Grove Base Hat Zero Visual Layout

Status: Approved

Approved Spec: `specs/SPEC-seeed-grove-base-hat-zero-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time.

## Affected Files

- Update `designs/seeed_grove_base_hat_zero.scad`.
- Update `README.md`.
- Update `specs/SPEC-seeed-grove-base-hat-zero-scad.md` only if implementation discovers a spec typo that blocks deterministic execution; otherwise do not change the approved spec.
- Do not edit existing Raspberry Pi reference source files.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- current repository instructions,
- existing local code needed to match style,
- the source facts already captured in the approved spec.

Implementation must not perform additional product, architecture, scope, or web research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by deterministic pre-implementation checklist creation:

- map each approved visual-layout and GPIO-visibility requirement to `designs/seeed_grove_base_hat_zero.scad` or `README.md`,
- implement against that checklist,
- use manual review and `git diff --check` as validation.

## Implementation Steps

1. Inspect only the approved spec, this plan, `AGENTS.md`, `README.md`, and `designs/seeed_grove_base_hat_zero.scad`.
2. In `designs/seeed_grove_base_hat_zero.scad`, change the default Grove socket data so the visible default layout matches the official wiki overview described by the approved spec:
   - top row from left to right: `D5`, `A0`, `A2`, `A4`,
   - bottom row from left to right: `D16`, `PWM`, `I2C`, `UART`.
3. Remove extra default visible Grove sockets from the model:
   - no `D18`,
   - no duplicate `I2C`,
   - no right-edge `A6`.
4. Keep Grove connector positions and cable-exit sizes adjustable near the top of the file.
5. Update Grove cable-exit defaults so each socket group has a plausible edge-facing clearance envelope consistent with the corrected two-row layout.
6. Update the Grove socket grouping/module logic only as needed to support the corrected defaults without adding new behavior outside the approved spec.
7. Update the GPIO reference so it is clearly visible by default when `show_gpio_header = true`:
   - render metallic through-hole/pad references along the +Y edge,
   - keep the row visually distinct from the PCB and component overlays,
   - ensure it is visible in `assembly`, `hat`, and `connectors` render modes,
   - ensure it renders after any translucent height envelope or other overlays that could obscure it.
8. Preserve independent visibility toggles:
   - `show_electronics` controls Grove sockets, cable exits, SWD/debug, component blocks, LEDs, and height envelope without hiding PCB or holes,
   - `show_gpio_header` controls only the GPIO passthrough/header reference,
   - `show_grove_labels` controls labels independently from connector bodies,
   - `show_pi_zero_reference` controls optional Pi Zero reference geometry.
9. Preserve render modes:
   - `assembly`,
   - `hat`,
   - `connectors`,
   - `printable_layout`.
10. Keep OpenSCAD 2021.01-compatible syntax:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax.
11. Update `README.md`:
    - document that the default visual Grove socket layout follows the official wiki overview image,
    - document that extra sockets implied only by conflicting text claims are not modeled by default,
    - update component assumptions/common parameter notes if socket counts or labels change,
    - update manual inspection checklist to include the corrected 8-socket two-row layout and visible GPIO pad/header row.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Do not run OpenSCAD validation commands locally.

## Manual Review Requirements

Review `designs/seeed_grove_base_hat_zero.scad` and confirm:

- it keeps `Adjustable Parameters` and `Derived Values` sections near the top,
- all user-adjustable linear variables use `_mm`,
- user-adjustable values are not redefined inside modules,
- render modes dispatch deterministically,
- board dimensions and mounting holes remain unchanged from the approved spec,
- `use <pi_zero.scad>` remains present for the optional Pi Zero reference,
- optional Pi Zero reference visibility remains controlled by `show_pi_zero_reference`,
- connector/component visibility remains controlled by `show_electronics`,
- GPIO visibility remains controlled by `show_gpio_header`,
- Grove label visibility remains controlled by `show_grove_labels`,
- default Grove sockets are exactly `D5`, `A0`, `A2`, `A4`, `D16`, `PWM`, `I2C`, and `UART`,
- top-row and bottom-row socket ordering matches the approved spec,
- no extra default visible Grove sockets are present,
- Grove socket bodies and cable-exit envelopes remain adjustable,
- SWD/debug and controller/component references remain present,
- GPIO passthrough/header pads are clearly visible in `assembly`, `hat`, and `connectors` when `show_gpio_header = true`,
- major geometry remains organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the corrected default visual layout is documented,
- the source discrepancy around analog port count remains documented,
- README does not claim extra sockets are modeled by default,
- render modes match the OpenSCAD source,
- optional commands remain clearly optional for users with OpenSCAD installed,
- validation guidance remains consistent with repository instructions.

## QA Requirements

Main-agent QA is manual review only:

- inspect the final diff against the approved spec,
- run `git diff --check`,
- confirm no OpenSCAD command was run,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Seeed Grove Base Hat for Raspberry Pi Zero section update.
- `README.md` manual inspection checklist update.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- OpenSCAD syntax risks visible by inspection,
- missing adjustable parameters,
- README/source mismatch,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
