# PLAN: Seeed Grove Base Hat for Raspberry Pi Zero OpenSCAD Reference Design

Status: Approved

Approved Spec: `specs/SPEC-seeed-grove-base-hat-zero-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time.

## Affected Files

- Add `designs/seeed_grove_base_hat_zero.scad`.
- Update `README.md`.
- Do not edit existing Raspberry Pi reference source files unless implementation discovers a syntax-level import issue that directly blocks the approved design; if that happens, stop and request plan amendment before changing them.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- current repository instructions,
- existing local code needed to match style,
- the researched source facts already captured in the approved spec.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by deterministic pre-implementation checklist creation during implementation:

- map each approved acceptance criterion to `designs/seeed_grove_base_hat_zero.scad` or `README.md`,
- implement against that checklist,
- use manual review and `git diff --check` as validation.

## Implementation Steps

1. Inspect existing OpenSCAD style in `designs/pi_zero.scad` and `designs/waveshare_eth_usb_hub_hat.scad` only as needed for local conventions.
2. Add `designs/seeed_grove_base_hat_zero.scad`.
3. At the top of the new file, document:
   - units are millimeters,
   - origin and orientation,
   - that the model is a fit/clearance reference, not a vendor-certified model.
4. Add `use <pi_zero.scad>` so the optional stack preview can call the repository Pi Zero reference model.
5. Add grouped `Adjustable Parameters`:
   - render controls,
   - board dimensions,
   - mounting holes,
   - stack and Pi Zero reference offsets,
   - GPIO header/reference dimensions,
   - Grove connector dimensions and positions,
   - Grove cable-exit clearance dimensions,
   - SWD/debug header dimensions,
   - LED/label/component preview dimensions,
   - printable layout,
   - visual settings.
6. Add `Derived Values` for board half sizes, mounting hole spans, GPIO pin positions, top-side component Z values, Grove connector centers, cable-exit centers, optional Pi Zero stack offset, and repeated geometry constants.
7. Implement render dispatch for:
   - `assembly`,
   - `hat`,
   - `connectors`,
   - `printable_layout`.
8. Implement named modules for:
   - `seeed_grove_base_hat_zero_reference_model(...)`,
   - board outline and mounting holes,
   - optional Pi Zero stack reference,
   - GPIO passthrough/header reference,
   - Grove socket and cable-exit previews,
   - SWD/debug header preview,
   - controller/component previews,
   - label previews,
   - printable/fit-check layout,
   - reusable helper geometry such as rounded boxes, top components, holes, and pin arrays.
9. Use default dimensions required by the approved spec:
   - board: `65.0 mm x 30.0 mm`,
   - overall height envelope: `20.0 mm`,
   - board thickness: adjustable default `1.6 mm`,
   - mounting hole edge offsets: `3.5 mm`,
   - mounting hole center span: `58.0 mm x 23.0 mm`.
10. Use an adjustable mounting hole diameter compatible with common M2.5 Pi Zero hardware and document that it is a clearance reference.
11. Place Grove sockets as adjustable simplified clearance blocks grouped by Digital, Analog, I2C, PWM, and UART labels.
12. Include adjustable cable-exit clearance volumes for Grove sockets so enclosure designs can reserve space outside the plastic connector bodies.
13. Include a simplified SWD/debug header reference and main controller/component clearance blocks.
14. Include optional label text for Grove groups, controlled by `show_grove_labels`.
15. Ensure `show_electronics`, `show_gpio_header`, `show_grove_labels`, and `show_pi_zero_reference` independently control their intended visual groups.
16. Keep the file OpenSCAD 2021.01-compatible:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax.
17. Update `README.md`:
    - add the new file under Design Files,
    - add a Seeed Grove Base Hat for Raspberry Pi Zero section,
    - document assumptions and source dimensions,
    - document the analog-port source discrepancy from the approved spec,
    - document adjustable parameter groups,
    - document render modes and optional export commands,
    - add fit notes and manual inspection checklist items.

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
- `use <pi_zero.scad>` is present for the optional Pi Zero reference,
- optional Pi Zero reference visibility is controlled by `show_pi_zero_reference`,
- connector/component visibility is controlled by `show_electronics`,
- GPIO visibility is controlled by `show_gpio_header`,
- Grove label visibility is controlled by `show_grove_labels`,
- Grove socket bodies and cable-exit envelopes are adjustable,
- Digital, Analog, I2C, PWM, UART, SWD/debug, and controller/component references are present,
- major geometry is organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the new design is listed,
- assumptions and source dimensions match the approved spec,
- the analog-port source discrepancy is documented,
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
- `README.md` Seeed Grove Base Hat for Raspberry Pi Zero component assumptions, parameters, render modes, source notes, optional commands, and manual inspection checklist.

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
