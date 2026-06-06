# PLAN: Waveshare ETH/USB HUB HAT OpenSCAD Reference Design

Status: Approved

Approved Spec: `specs/SPEC-waveshare-eth-usb-hub-hat-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes:

- modified `AGENTS.md`,
- deleted existing spec/plan files shown by current git status,
- any other unrelated user changes present at implementation time.

## Affected Files

- Add `designs/waveshare_eth_usb_hub_hat.scad`.
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

- identify the final manual review checklist from the approved spec,
- map each checklist item to either `designs/waveshare_eth_usb_hub_hat.scad` or `README.md`,
- implement against that checklist.

## Implementation Steps

1. Inspect existing OpenSCAD style in `designs/pi_zero.scad` and `designs/rpi5.scad` only as needed for local conventions.
2. Add `designs/waveshare_eth_usb_hub_hat.scad`.
3. At the top of the new file, document:
   - units are millimeters,
   - origin and orientation,
   - that the model is a fit/clearance reference, not a vendor-certified model.
4. Add grouped `Adjustable Parameters`:
   - render controls,
   - board dimensions,
   - mounting holes,
   - GPIO header/reference dimensions,
   - connector dimensions and positions,
   - LED and component preview dimensions,
   - Micro USB bridge adapter dimensions,
   - visual settings.
5. Add `Derived Values` for board half sizes, hole positions, connector centers, adapter alignment offsets, and repeated geometry constants.
6. Implement render dispatch for:
   - `assembly`,
   - `hat`,
   - `micro_usb_adapter`,
   - `printable_layout`.
7. Implement named modules for:
   - `waveshare_eth_usb_hub_hat_reference_model(...)`,
   - board outline and mounting holes,
   - GPIO header/reference pins,
   - connector/component previews,
   - bottom Micro USB HAT interface,
   - Micro USB bridge adapter,
   - printable/fit-check layout,
   - reusable helper geometry such as rounded boxes and hole loops.
8. Use default dimensions required by the approved spec:
   - board: `65.0 mm x 30.0 mm`,
   - board thickness: adjustable default compatible with common PCB thickness, `1.6 mm`,
   - mounting holes: `3.0 mm`,
   - hole edge offsets: `3.5 mm`,
   - hole center span: `58.0 mm x 23.0 mm`,
   - corner radius: `1.5 mm`,
   - Micro USB bridge adapter solid envelope: `8.6 mm x 9.0 mm x 12.2 mm`,
   - Micro USB bridge adapter body: `8.6 mm x 1.0 mm x 12.2 mm`,
   - two Micro USB bridge adapter plug shells: about `6.5 mm x 8.0 mm x 1.46 mm`,
   - plug center spacing: about `8.70 mm`.
9. Offset the Micro USB bridge adapter plug shells toward the board interior side of the bridge body, keeping the exterior bridge-body face flush and inside the default board outline.
10. Use simplified but adjustable clearance volumes for RJ45, USB-A, bottom Micro USB, LEDs, and major ICs.
11. Ensure `show_electronics`, `show_micro_usb_adapter`, and `show_gpio_header` independently control their intended visual groups.
12. Keep the file OpenSCAD 2021.01-compatible:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax.
13. Update `README.md`:
    - add the new file under Design Files,
    - add a Waveshare ETH/USB HUB HAT section,
    - document assumptions and source dimensions,
    - document adjustable parameter groups,
    - document render modes and optional export commands,
    - add manual inspection checklist items.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Do not run OpenSCAD validation commands locally.

## Manual Review Requirements

Review `designs/waveshare_eth_usb_hub_hat.scad` and confirm:

- it has `Adjustable Parameters` and `Derived Values` sections near the top,
- all user-adjustable linear variables use `_mm`,
- any angle variables use `_deg`,
- user-adjustable values are not redefined inside modules,
- render modes dispatch deterministically,
- board dimensions and mounting holes match the approved spec,
- Micro USB adapter default solid envelope is adjustable and defaults to `8.6 x 9.0 x 12.2 mm`,
- Micro USB adapter is modeled as a bridge body plus two plug shells rather than a single envelope box,
- Micro USB adapter plug shells extend only toward the board interior and do not straddle both sides of the bridge body,
- connector and component previews are independently hideable through `show_electronics`,
- Micro USB adapter visibility is independently controlled by `show_micro_usb_adapter`,
- GPIO header visibility is independently controlled by `show_gpio_header`,
- major geometry is organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the new design is listed,
- assumptions and source dimensions match the approved spec,
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
- `README.md` Waveshare ETH/USB HUB HAT component assumptions, parameters, render modes, optional commands, and manual inspection checklist.

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
