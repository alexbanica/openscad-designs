# PLAN: Waveshare ETH/USB HUB HAT Side USB Side-Margin Center Alignment Fix

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
- the current Waveshare source and README sections needed to apply the approved side USB-A side-margin center alignment correction.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

Before production edits, implementation must create a short manual checklist from the approved side USB-A side-margin center alignment acceptance criteria and use it during review.

## Implementation Steps

1. Inspect the current Waveshare source and README only enough to confirm:
   - current side USB-A size variables,
   - current side USB-A center derivations,
   - current README side USB-A documentation.
2. Keep the side USB-A footprint variables oriented so the long USB-A component dimension lies on the PCB side margin:
   - `hat_side_usb_a_depth_x_mm = 5.7`,
   - `hat_side_usb_a_width_y_mm = 13.2`,
   - X is the short inward-over-PCB depth,
   - Y is the long board-side-margin direction.
3. Update side USB-A placement so the component blocks stay fully inside the PCB in X and align to the middle of the side margin along Y:
   - `hat_side_usb_a_center_y_mm = 0`,
   - left USB-A center X = `-hat_board_half_length_mm + hat_side_usb_a_depth_x_mm / 2`,
   - right USB-A center X = `hat_board_half_length_mm - hat_side_usb_a_depth_x_mm / 2`.
4. Keep existing GPIO, RJ45, front USB-A, Micro USB adapter, board dimensions, mounting holes, LEDs, component blocks, render modes, and public module names unchanged unless directly required by the side USB-A side-margin center alignment fix.
5. Update README Waveshare documentation:
   - document that the side USB-A blocks stay fully inside the PCB in X,
   - document that the side USB-A center Y aligns to the middle of the left/right side margins,
   - document that side USB-A uses `5.7 mm` X inward depth and `13.2 mm` Y margin length,
   - remove stale wording that says side USB-A component centers align to board side edge lines or that the short side USB-A depth straddles the PCB side edge line,
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
- side USB-A footprint defaults are `5.7 x 13.2 mm` in X/Y,
- side USB-A X is the short inward-over-PCB depth,
- side USB-A Y is the long board-side-margin direction,
- `hat_side_usb_a_center_y_mm` defaults to `0`,
- left USB-A center X is `-hat_board_half_length_mm + hat_side_usb_a_depth_x_mm / 2`,
- right USB-A center X is `hat_board_half_length_mm - hat_side_usb_a_depth_x_mm / 2`,
- side USB-A blocks stay fully inside the left/right PCB side faces in X,
- side USB-A center Y aligns to the middle of the side margins,
- unrelated GPIO, RJ45, front USB-A, Micro USB adapter, board, LED, and component behavior is unchanged,
- render modes and public module names remain compatible,
- no generated mesh/export artifacts are present in the repository.

Review `README.md` and confirm:

- side USB-A placement documentation says the blocks stay fully inside the PCB in X,
- side USB-A placement documentation says the center Y aligns to the middle of the side margins,
- side USB-A placement documentation says X is the 5.7 mm inward depth and Y is the 13.2 mm margin length,
- stale documentation saying side USB-A component centers align to board side edge lines or that the short depth straddles the PCB side edge line is removed,
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
