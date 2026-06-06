# Reusable Raspberry Pi Reference Models Spec

Status: Approved

## Purpose

Define repository-standard reusable OpenSCAD reference models for Raspberry Pi Zero and Raspberry Pi 5 boards so future case, support, enclosure, and accessory designs can build around consistent board geometry and toggle those references on or off from child `.scad` files.

## Problem Statement

The repository now contains `designs/pi_zero.scad` and `designs/rpi5.scad` as base Raspberry Pi board models. They need to be aligned with repository OpenSCAD standards before other designs depend on them. Current issues include non-standard or terse variable names, mixed naming styles, some adjustable values living inside modules, and no documented convention requiring future Pi Zero or Pi 5 designs to use these reference models.

## Scope

- Refactor `designs/pi_zero.scad` into a repository-standard reusable Raspberry Pi Zero reference model.
- Refactor `designs/rpi5.scad` into a repository-standard reusable Raspberry Pi 5 reference model.
- Preserve the existing default board/component intent and approximate dimensions unless a name change or structure change is required for standards compliance.
- Keep both files compatible with OpenSCAD 2021.01.
- Keep both files dependency-free.
- Add clearly labeled top-level `Adjustable Parameters` and `Derived Values` sections to both files.
- Use human-friendly, descriptive `snake_case` variable and module names.
- Use `_mm` suffixes for linear dimensions and `_deg` suffixes for angles.
- Move user-adjustable values out of implementation modules and into top-level adjustable sections.
- Expose reusable named modules that child `.scad` files can call directly.
- Add child-design visibility toggles so dependent designs can show or hide Pi Zero and Raspberry Pi 5 reference geometry without editing the base files.
- Update `AGENTS.md` so future `.scad` designs that require Raspberry Pi Zero or Raspberry Pi 5 geometry use these files as references instead of duplicating board models.
- Update `README.md` only if implementation changes user-facing design inventory, usage, render modes, or validation workflow.

## Out Of Scope

- Vendor-certified mechanical accuracy or cosmetic exactness.
- Generated STL, STEP, 3MF, OFF, or other mesh exports.
- New case, support, bracket, or enclosure geometry.
- Changing existing enclosure designs to consume these reference files unless a later approved spec requires it.
- Adding external OpenSCAD libraries.
- Adding automated unit tests.
- Changing physical defaults solely to match external datasheets unless required to preserve current model intent or correct a clear internal inconsistency found during implementation review.

## Definitions

- Reference model: A non-printing OpenSCAD board and component preview used for fit, clearance, and placement when designing printable parts around Raspberry Pi hardware.
- Base file: `designs/pi_zero.scad` or `designs/rpi5.scad`.
- Child `.scad`: Any future or existing design file that imports or includes a base file to build a case, support, bracket, fixture, enclosure, or other printable geometry around the board.
- Toggleable reference: A base model that can be enabled or disabled from a child file with a top-level boolean parameter without editing the base file.
- Human-friendly variable: A descriptive `snake_case` name that states the modeled part and measurement purpose, such as `pi_zero_board_length_mm` instead of `PiSizeX`, or `rpi5_mounting_hole_diameter_mm` instead of `hole_d`.

## Inputs And Constraints

- OpenSCAD compatibility target: 2021.01.
- Units: millimetres.
- Both base files must avoid external dependencies.
- Both base files must remain editable source files, not generated artifacts.
- Existing attribution comments in `designs/pi_zero.scad` must be preserved when refactoring.
- User-adjustable values must be grouped near the top of each base file in a clearly labeled `Adjustable Parameters` section.
- Derived values must be grouped below adjustable values in a clearly labeled `Derived Values` section.
- Top-level adjustable variables must not be redefined inside modules.
- Names must use descriptive `snake_case`.
- Linear dimensions must use `_mm`.
- Angles, if introduced, must use `_deg`.
- Named modules must be used for major reference assemblies, repeated helper geometry, and child-callable entry points.
- The base files must not automatically render board geometry when used from a child file via `use <...>`.
- The base files may render their own default preview when opened directly in OpenSCAD.

## Deterministic Behavior

- `designs/pi_zero.scad` provides a child-callable Raspberry Pi Zero reference assembly module.
- `designs/rpi5.scad` provides a child-callable Raspberry Pi 5 reference assembly module.
- Each reference assembly module accepts a visibility parameter or uses a top-level visibility toggle so child designs can hide the reference model without deleting or commenting out imports.
- Pi Zero child designs can toggle at least:
  - the full Pi Zero board reference,
  - test pads,
  - GPIO header pins,
  - optional GPIO sound/vision header pads when supported by the existing model.
- Raspberry Pi 5 child designs can toggle at least:
  - the full Raspberry Pi 5 board reference,
  - GPIO pins,
  - microSD card preview,
  - active cooler preview.
- Top-level defaults render useful standalone previews when each base file is opened directly.
- Child `.scad` files can build around the base models by calling named modules and passing explicit toggle values where needed.
- Refactoring must not intentionally change the default Pi Zero board outline, mounting holes, connector previews, GPIO header layout, test pads, or version-dependent behavior.
- Refactoring must not intentionally change the default Raspberry Pi 5 board outline, mounting holes, connector previews, GPIO header layout, microSD preview, or active cooler preview.
- Values currently defined inside modules that affect user-visible reference geometry must move to top-level adjustable variables or derived values.
- Implementation comments should explain non-obvious measured or inherited values without narrating simple transformations.
- `AGENTS.md` must state that future `.scad` files requiring Raspberry Pi Zero or Raspberry Pi 5 board geometry should reference these base files for fit and clearance modeling before duplicating board geometry.
- `AGENTS.md` must state that these base reference models should remain toggleable from child designs.

## Assumptions Proposed For Approval

- The term "base plans" means the base reference model source files `designs/pi_zero.scad` and `designs/rpi5.scad`.
- Toggleable child usage means child files can hide or show the imported board reference and major optional subfeatures through boolean parameters or module arguments, not that OpenSCAD can mutate parent-file globals after `use`.
- Refactoring should prioritize naming, structure, reuse, and standards compliance over changing default dimensions.
- Existing authored/attribution comments in the Pi Zero source should remain in the file because the model appears to be derived from an external author.
- The implementation should add README usage notes only if the final base files expose a documented child-call pattern that users need to know.

## Impact And Regression Considerations

- Future Pi Zero and Raspberry Pi 5 cases should become easier to maintain because board dimensions and preview modules have one local source of truth.
- Existing uncommitted base files are new, so compatibility risk is mainly preserving their current default visual intent during refactor.
- OpenSCAD `include` executes top-level statements, while `use` imports modules and functions without top-level rendering. The implementation must structure default preview calls so child designs can reuse modules without unwanted board rendering.
- If child designs use `include` instead of `use`, top-level preview toggles need defaults that can be overridden before include where OpenSCAD semantics allow it.
- Renaming variables and modules can break any untracked child designs already using the old names. Since these base files are newly added, the approved implementation may standardize names without providing backward-compatible aliases unless the user requests aliases before approval.
- Because no physical validation is required by repository policy, code review is the required validation gate. OpenSCAD render checks should be run when available for syntax and geometry sanity.

## Validation Plan

- Run `git diff --check`.
- Perform code review of both base files against this spec and repository OpenSCAD rules.
- If `openscad` is installed, validate both changed base files with preview exports to `/tmp`, for example:
  - `openscad -o /tmp/pi_zero_reference.off designs/pi_zero.scad`
  - `openscad -o /tmp/rpi5_reference.off designs/rpi5.scad`
- If implementation adds documented child-usage examples or render modes, validate those examples where practical.
- Manual review checklist:
  - each file has `Adjustable Parameters` and `Derived Values` sections,
  - top-level adjustable names are descriptive `snake_case`,
  - linear dimensions use `_mm`,
  - no user-adjustable geometry value is redefined inside modules,
  - major geometry is exposed through named modules,
  - Pi Zero default preview still shows the board, configured optional features, and version-dependent components,
  - Raspberry Pi 5 default preview still shows the board, configured optional features, and active cooler when enabled,
  - child files can show and hide each base reference model without editing the base files,
  - `AGENTS.md` tells future agents to reuse these base files for Pi Zero and Raspberry Pi 5 dependent designs.

## Documentation Requirements

- Update `AGENTS.md` with repository guidance for reusable Raspberry Pi Zero and Raspberry Pi 5 reference models.
- Update `README.md` if the implemented child-call pattern, file inventory, or validation commands become user-facing.
- Do not add generated mesh files to source control.
