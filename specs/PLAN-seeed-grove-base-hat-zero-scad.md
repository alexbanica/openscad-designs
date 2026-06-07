# PLAN: Seeed Grove Base Hat Zero OpenSCAD Reference Design

Status: Approved

Approved Spec: `specs/SPEC-seeed-grove-base-hat-zero-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time. The current planning context observed staged deletions for the previous Seeed design/spec/plan paths; implementation must treat the approved spec and this plan as the authority for restoring/recreating only the approved Seeed artifacts.

## Affected Files

- Create or replace `designs/seeed_grove_base_hat_zero.scad`.
- Update `README.md`.
- Keep `specs/SPEC-seeed-grove-base-hat-zero-scad.md` unchanged except for mechanical status or typo fixes that do not alter behavior.
- Do not edit existing Raspberry Pi reference source files.
- Do not edit the Waveshare design/spec/plan.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan after approval,
- current repository instructions,
- existing local code needed to match style,
- `designs/pi_zero.scad` only as the GPIO and board-fit reference,
- the source facts already captured in the approved spec.

Implementation must not perform additional product, architecture, scope, or web research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by deterministic pre-implementation checklist creation:

- map each approved model requirement to `designs/seeed_grove_base_hat_zero.scad` or `README.md`,
- implement against that checklist,
- use manual review and `git diff --check` as validation.

## Implementation Steps

1. Inspect only the approved spec, this plan, `AGENTS.md`, `README.md`, and `designs/pi_zero.scad`.
2. Create `designs/seeed_grove_base_hat_zero.scad` as a standalone OpenSCAD 2021.01-compatible reference model.
3. At the top of the new file, document:
   - units are millimeters,
   - the user connector coordinate system uses bottom-left PCB origin with X across 30 mm board width and Y along 65 mm board length,
   - the OpenSCAD model origin is board center on the PCB bottom face,
   - the model is an adjustable fit/clearance reference, not a vendor-certified model.
4. Add grouped `Adjustable Parameters`:
   - render controls,
   - board dimensions,
   - mounting holes,
   - stack and optional Pi Zero reference offsets,
   - GPIO header/passthrough dimensions,
   - underside GPIO socket/receptacle clearance dimensions,
   - Grove connector coordinate table and transform offsets,
   - Grove connector body dimensions,
   - component, LED, and label preview dimensions,
   - printable layout,
   - visual settings.
5. Add `Derived Values` for:
   - board half dimensions,
   - mounting-hole positions,
   - Pi Zero GPIO grid-equivalent header pin positions,
   - user-coordinate to board-centered coordinate transform,
   - underside GPIO socket/receptacle center and Z placement,
   - Grove connector centers after transform,
   - repeated geometry constants.
6. Implement render dispatch for:
   - `assembly`,
   - `hat`,
   - `connectors`,
   - `printable_layout`.
7. Implement named modules for:
   - `seeed_grove_base_hat_zero_reference_model(...)`,
   - board outline and mounting holes,
   - Pi Zero-style GPIO passthrough/header reference,
   - underside GPIO socket/receptacle clearance block,
   - Grove connector previews,
   - component/LED previews,
   - labels,
   - optional Pi Zero stack preview using `use <pi_zero.scad>`,
   - printable/fit-check layout,
   - reusable helper geometry.
8. Use default board and mounting values required by the approved spec:
   - board footprint: 65.0 mm x 30.0 mm,
   - board thickness: 1.6 mm,
   - overall height envelope: 20.0 mm,
   - mounting-hole edge offsets: 3.5 mm,
   - mounting-hole span: 58.0 mm x 23.0 mm,
   - mounting-hole diameter adjustable for Pi Zero M2.5 hardware.
9. Implement GPIO placement to match the Pi Zero reference pattern:
   - 20 columns by 2 rows,
   - 2.54 mm pitch,
   - X positions matching the same centered span used by `pi_zero_gpio_pin_x_mm`,
   - Y positions using the same mounting-hole-derived edge relationship as `pi_zero_gpio_pin_y_mm`,
   - adjustable pad/hole/pin dimensions,
   - support above-board, below-board, and hidden pin preview modes.
10. Implement the underside GPIO socket/receptacle clearance block:
    - aligned with the same GPIO grid,
    - below the HAT PCB where Pi Zero header pins enter,
    - default visible through `show_gpio_socket_clearance = true`,
    - independently adjustable in X/Y/Z size and Z offset.
11. Implement the default Grove connector table exactly from the approved spec:
    - `UART`: `(9.4, 12.6)`,
    - `A3/A4`: `(17.8, 12.6)`,
    - `I2C`: `(9.6, 28.6)`,
    - `A2`: `(17.8, 28.3)`,
    - `D16`: `(9.6, 44.7)`,
    - `D26`: `(17.8, 44.1)`,
    - `D5`: `(9.6, 59.9)`,
    - `D6`: `(17.8, 59.1)`.
12. Implement default Grove connector bodies as adjustable 8.0 mm x 10.0 mm x 8.0 mm clearance volumes.
13. Include adjustable UART cutout guidance values of 11.0 mm x 9.0 mm centered on the UART connector for README/source documentation and optional clearance preview if practical without adding a separate printable enclosure.
14. Preserve independent visibility toggles:
    - `show_electronics`,
    - `show_gpio_header`,
    - `show_gpio_socket_clearance`,
    - `show_grove_labels`,
    - `show_pi_zero_reference`.
15. Keep the file OpenSCAD 2021.01-compatible:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax,
    - no user-adjustable value redefinitions inside modules.
16. Update `README.md`:
    - list `designs/seeed_grove_base_hat_zero.scad`,
    - document the bottom-left PCB Grove coordinate table,
    - document the board-centered OpenSCAD transform,
    - document the Pi Zero-style GPIO header/passthrough behavior,
    - document the underside GPIO socket/receptacle clearance block,
    - document render modes and visibility toggles,
    - document adjustable parameters and physical-measurement caveats,
    - document optional OpenSCAD commands for users with OpenSCAD installed,
    - keep validation guidance consistent with repository instructions.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Do not run OpenSCAD validation commands locally.

## Manual Review Requirements

Review `designs/seeed_grove_base_hat_zero.scad` and confirm:

- it has `Adjustable Parameters` and `Derived Values` sections near the top,
- all user-adjustable linear variables use `_mm`,
- any angle variables use `_deg`,
- user-adjustable values are not redefined inside modules,
- render modes dispatch deterministically,
- board dimensions and mounting holes match the approved spec,
- `use <pi_zero.scad>` is present only for the optional Pi Zero reference,
- optional Pi Zero reference visibility is controlled by `show_pi_zero_reference`,
- connector/component visibility is controlled by `show_electronics`,
- GPIO header/passthrough visibility and above/below pin preview mode are controlled independently,
- underside GPIO socket/receptacle clearance is controlled by `show_gpio_socket_clearance`,
- GPIO placement matches the Pi Zero reference 20 x 2 grid and edge relationship,
- underside GPIO socket/receptacle clearance is below the board and aligned with the GPIO grid,
- Grove label visibility is controlled by `show_grove_labels`,
- default Grove sockets are exactly `UART`, `A3/A4`, `I2C`, `A2`, `D16`, `D26`, `D5`, and `D6`,
- default Grove socket coordinates match the approved bottom-left PCB coordinate table after transform,
- Grove socket bodies default to adjustable 8.0 mm x 10.0 mm x 8.0 mm dimensions,
- UART cutout guidance defaults to adjustable 11.0 mm x 9.0 mm centered on `UART`,
- component references are present,
- major geometry is organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the new design is listed,
- assumptions and coordinate table match the approved spec,
- Pi Zero-style GPIO header placement is documented,
- underside GPIO socket/receptacle clearance is documented,
- render modes match the OpenSCAD source,
- optional commands are clearly optional for users with OpenSCAD installed,
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

- `README.md` design list update.
- `README.md` Seeed Grove Base Hat Zero component assumptions, coordinate basis, adjustable parameters, render modes, optional commands, GPIO/header notes, underside GPIO socket clearance notes, and manual inspection checklist.

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
