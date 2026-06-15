# PLAN: Waveshare ETH/USB HUB HAT Geometry Corrections

Status: Approved

Approved Spec: `specs/SPEC-waveshare-eth-usb-hub-hat-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes, including `.codex/`, `out/`, or any other unrelated user/generated files present at implementation time.

## Affected Files

- Update `designs/waveshare_eth_usb_hub_hat.scad`.
- Update `README.md` Waveshare reference documentation and validation checklist entries as needed.
- Do not edit `designs/pi_zero.scad`; use it only as the coordinate reference for the Waveshare GPIO header correction.
- Do not add generated mesh/export files to source control.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- current repository instructions,
- `designs/pi_zero.scad` for the existing GPIO coordinate pattern,
- the current Waveshare source and README sections needed to apply the approved corrections.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

Before production edits, implementation must create a short manual checklist from the approved acceptance criteria and use it during review.

## Implementation Steps

1. Inspect the existing Waveshare and Pi Zero source only enough to confirm:
   - Pi Zero GPIO pin functions and constants,
   - current Waveshare connector variables and derived center calculations,
   - current README Waveshare documentation.
2. Update the Waveshare GPIO header defaults and derived values:
   - remove independently hard-coded GPIO header center defaults where they conflict with Pi Zero alignment,
   - derive the first GPIO pin X as `-(19 * hat_gpio_pin_pitch_mm / 2)`,
   - derive the first GPIO pin Y from `hat_mounting_hole_y_mm - hat_gpio_pin_pitch_mm / 2`,
   - derive the GPIO header block center from the corrected 20 x 2 pin grid.
3. Update measured connector defaults:
   - RJ45 X/Y footprint defaults to `14.7 mm x 11.7 mm`,
   - front USB-A X/Y footprint defaults to `13.2 mm x 5.7 mm`,
   - side USB-A X/Y footprint defaults to `13.2 mm x 5.7 mm`, with X across board length and Y across board width.
4. Replace the side USB-A center X derivation:
   - left USB-A center X = `-hat_board_half_length_mm`,
   - right USB-A center X = `hat_board_half_length_mm`,
   - remove or stop using the old board-overlap heuristic for side USB center placement.
5. Add or update the front RJ45-to-USB-A spacing model:
   - expose an adjustable `3.75 mm` default margin-to-margin spacing,
   - derive the front USB-A X center from the RJ45 center, RJ45 X size, USB-A X size, and the spacing value.
6. Update RJ45 through-board placement:
   - expose an adjustable `1.3 mm` default below-board lower extent,
   - compute RJ45 center Z and total Z size so the component extends from `-1.3 mm` below the PCB bottom face to the configured top height envelope above the PCB,
   - render RJ45 through the board while keeping other top components on top of the PCB.
7. Keep existing render modes, public module names, Micro USB adapter behavior, board dimensions, mounting holes, LED blocks, and component blocks unchanged unless directly required by the approved corrections.
8. Update README Waveshare documentation:
   - document corrected RJ45 and USB-A footprint defaults,
   - document that side USB-A centers sit on the left/right board-edge margin lines,
   - document the `3.75 mm` RJ45-to-front-USB margin spacing,
   - document that RJ45 passes through the PCB and extends `1.3 mm` below the PCB bottom face,
   - keep optional OpenSCAD commands and generated-artifact guidance consistent with repository instructions.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Run an OpenSCAD render/export to `/tmp` if available and useful for visual inspection, for example:

```sh
openscad -o /tmp/waveshare_eth_usb_hub_hat_assembly.off -D 'render_mode="assembly"' designs/waveshare_eth_usb_hub_hat.scad
```

Expected result: command exits successfully and produces only a temporary artifact outside the repository.

## Manual Review Requirements

Review `designs/waveshare_eth_usb_hub_hat.scad` and confirm:

- all adjusted user-facing linear dimensions use `_mm`,
- user-adjustable values are not redefined inside modules,
- GPIO header pin centers follow the Pi Zero 20 x 2 coordinate pattern,
- GPIO header block position is derived from the corrected pin grid,
- RJ45 footprint defaults to `14.7 x 11.7 mm`,
- USB-A footprint defaults to `13.2 x 5.7 mm`,
- left and right USB-A centers sit on `-hat_board_half_length_mm` and `hat_board_half_length_mm`,
- front RJ45-to-USB-A margin spacing defaults to `3.75 mm`,
- RJ45 geometry extends `1.3 mm` below the PCB bottom face and still preserves the configured top height envelope,
- render modes and public module names remain compatible,
- no generated mesh/export artifacts are present in the repository.

Review `README.md` and confirm:

- documented connector dimensions match the corrected source defaults,
- side USB placement documentation says the centers sit on the board-edge margin lines,
- RJ45 through-board and `1.3 mm` below-board behavior are documented,
- validation guidance remains consistent with repository instructions.

## QA Requirements

Main-agent QA:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- run OpenSCAD temporary render/export if available,
- confirm no generated mesh/export files were added to source control,
- confirm unrelated dirty worktree changes were not reverted.

If OpenSCAD validation cannot run, report why and mark that visual render QA was not performed.

## Documentation Updates

Required:

- `README.md` Waveshare ETH/USB HUB HAT component assumptions and fit notes.
- README validation/manual inspection checklist entries if currently obsolete.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- mismatch with the approved geometry corrections,
- accidental changes outside Waveshare source and README,
- OpenSCAD syntax risks visible by inspection,
- stale README/source mismatch,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
