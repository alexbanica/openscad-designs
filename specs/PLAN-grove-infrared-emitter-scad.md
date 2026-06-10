# PLAN: Grove Infrared Emitter OpenSCAD Reference Design

Status: Approved

Approved Spec: `specs/SPEC-grove-infrared-emitter-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time.

## Affected Files

- Update `designs/grove_infrared_emitter.scad`.
- Update `README.md`.
- Update `specs/SPEC-grove-infrared-emitter-scad.md` only for the approved Grove cable-clearance correction.
- Do not edit existing Raspberry Pi reference source files.
- Do not edit existing HAT design/spec/plan files.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan after approval,
- current repository instructions,
- existing local code needed to match style,
- the source facts already captured in the approved spec.

Implementation must not perform additional product, architecture, scope, or web research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD reference design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by deterministic pre-implementation checklist creation:

- map each approved model requirement to `designs/grove_infrared_emitter.scad` or `README.md`,
- implement against that checklist,
- use manual review and `git diff --check` as validation.

## Implementation Steps

1. Inspect only the approved spec, this plan, `AGENTS.md`, `README.md`, and one or two existing `.scad` files needed to match repository style.
2. Update `designs/grove_infrared_emitter.scad` in place as a standalone OpenSCAD 2021.01-compatible reference model.
3. At the top of the new file, document:
   - units are millimeters,
   - the module coordinate system origin is the board center on the PCB bottom face,
   - X runs across the board width, Y runs along board length, Z rises from the PCB bottom face,
   - the IR LED points toward positive Y by default,
   - the model is an adjustable fit/clearance reference, not a vendor-certified model.
4. Add grouped `Adjustable Parameters`:
   - render controls,
   - board dimensions,
   - mounting holes,
   - Grove connector dimensions and placement,
   - Grove perpendicular cable/plug clearance dimensions,
   - IR LED body and extension dimensions,
   - component and label preview dimensions,
   - clearance and sightline guide dimensions,
   - printable layout,
   - visual settings.
5. Add `Derived Values` for:
   - board half dimensions,
   - mounting-hole positions,
   - Grove connector and perpendicular cable clearance placement,
   - IR LED center, forward extension envelope, and full mechanical envelope,
   - guide geometry constants.
6. Implement render dispatch for:
   - `assembly`,
   - `pcb`,
   - `clearance`,
   - `printable_layout`.
7. Preserve named modules for:
   - `grove_infrared_emitter_reference_model(...)`,
   - PCB board and mounting holes,
   - Grove connector preview,
   - Grove cable/plug clearance preview,
   - IR LED body and extension preview,
   - component clearance previews,
   - labels,
   - clearance/sightline guides,
   - printable/fit-check layout,
   - reusable helper geometry.
8. Use default board and LED values required by the approved spec:
   - PCB width: 20.0 mm,
   - PCB length: 24.0 mm,
   - board thickness: 1.6 mm,
   - IR LED extension beyond PCB: 7.5 mm.
9. Implement mounting holes as adjustable planning references:
   - include user-adjustable hole diameter and edge offsets,
   - document in source comments and README that defaults are Grove 20 mm-class mechanical planning assumptions until measured.
10. Implement Grove connector and cable clearance as simplified adjustable clearance volumes:
    - connector body near one PCB edge,
    - independent cable/plug clearance guide,
    - default cable/plug clearance centered in X/Y over the Grove connector,
    - default cable/plug clearance extending upward along positive Z from above the connector body,
    - no horizontal off-board side-exit clearance in the default model,
    - controlled by `show_grove_connector` and `show_clearance_guides`.
11. Implement IR LED geometry:
    - adjustable cylindrical LED body,
    - adjustable diameter, body length, center height, and forward extension,
    - positive-Y orientation by default,
    - controlled by `show_ir_led`.
12. Implement optional IR sightline or beam guide:
    - use adjustable `ir_half_intensity_angle_deg` defaulting to 17 degrees,
    - treat it as visual/mechanical clearance context only,
    - controlled by `show_clearance_guides`.
13. Implement simplified major component clearance blocks and label markers:
    - controlled by `show_electronics` and `show_labels`,
    - keep dimensions and positions adjustable.
14. Preserve independent visibility toggles:
    - `show_electronics`,
    - `show_grove_connector`,
    - `show_ir_led`,
    - `show_labels`,
    - `show_clearance_guides`.
15. Keep the file OpenSCAD 2021.01-compatible:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax,
    - no user-adjustable value redefinitions inside modules.
16. Update `README.md`:
    - list `designs/grove_infrared_emitter.scad`,
    - document the selected detailed mechanical default,
    - document the conflicting Seeed wiki size,
    - document mounting-hole assumptions,
    - document Grove connector, perpendicular cable clearance, IR LED extension, and optional sightline guide behavior,
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

Review `designs/grove_infrared_emitter.scad` and confirm:

- it has `Adjustable Parameters` and `Derived Values` sections near the top,
- all user-adjustable linear variables use `_mm`,
- any angle variables use `_deg`,
- user-adjustable values are not redefined inside modules,
- render modes dispatch deterministically,
- PCB dimensions and IR LED extension match the approved spec,
- mounting holes are adjustable and documented as assumptions,
- Grove connector and perpendicular cable clearance are independently adjustable,
- Grove cable/plug clearance is centered over the connector and extends upward from the connector instead of horizontally off the board,
- IR LED body and extension are independently adjustable,
- optional sightline/beam guide uses an adjustable 17 degree half-intensity default,
- visibility toggles control the intended groups,
- major geometry is organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the new design is listed,
- selected source dimensions and source conflict notes match the approved spec,
- mounting-hole assumptions are documented,
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
- `README.md` Grove Infrared Emitter component assumptions, source dimensions, source conflict note, perpendicular cable clearance behavior, adjustable parameters, render modes, optional commands, fit notes, and manual inspection checklist.

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
