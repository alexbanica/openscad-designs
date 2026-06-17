# PLAN: Grove Infrared Emitter OpenSCAD Reference Design

Status: Approved

Approved Spec: `specs/SPEC-grove-infrared-emitter-scad.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time.

## Affected Files

- Update `designs/grove_infrared_emitter.scad`.
- Update `README.md`.
- Do not edit `specs/SPEC-grove-infrared-emitter-scad.md` during implementation except to read the approved behavior.
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
4. Update grouped `Adjustable Parameters`:
   - render controls,
   - board dimensions,
   - mounting holes,
   - Grove connector dimensions and placement,
   - Grove perpendicular cable/plug clearance dimensions,
   - IR LED body and extension dimensions,
   - component and label preview dimensions,
   - clearance, bottom pin protrusion, and sightline guide dimensions,
   - printable layout,
   - visual settings.
5. Update `Derived Values` for:
   - board half dimensions,
   - the two mounting-hole positions centered along PCB length and placed near the left/right PCB margins from adjustable X edge inset,
   - Grove connector top envelope, body height/placement, and perpendicular cable clearance placement,
   - bottom pin protrusion clearance placement below the PCB bottom,
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
8. Use default board, connector envelope, bottom pin, and LED values required by the approved spec:
   - PCB width: 20.25 mm,
   - PCB length: 23.75 mm,
   - board thickness: 1.6 mm,
   - Grove connector total top envelope: 9.65 mm from the PCB bottom,
   - bottom pin protrusion/clearance: up to 2.0 mm below the PCB bottom,
   - preserve the existing adjustable IR LED extension behavior and positive-Y LED direction.
9. Replace the four mounting-hole default with exactly two adjustable planning references:
   - one left screw hole near the left PCB margin,
   - one right screw hole near the right PCB margin,
   - both screw holes centered on the PCB length centerline,
   - keep user-adjustable hole diameter and X edge inset,
   - remove or stop using Y edge-offset defaults for screw-hole placement,
   - document in source comments and README that screw-hole diameter and X edge inset remain planning assumptions until measured.
10. Implement Grove connector and cable clearance as simplified adjustable clearance volumes:
    - connector body near one PCB edge,
    - connector/reference top reaches 9.65 mm above the PCB bottom by default,
    - independent cable/plug clearance guide,
    - default cable/plug clearance centered in X/Y over the Grove connector,
    - default cable/plug clearance extending upward along positive Z from above the connector body,
    - no horizontal off-board side-exit clearance in the default model,
    - controlled by `show_grove_connector` and `show_clearance_guides`.
11. Implement bottom pin protrusion clearance:
    - add an adjustable `bottom_pin_protrusion_mm` or equivalent set to 2.0 mm by default,
    - render the protrusion as a bottom-side clearance/reference guide below the PCB bottom,
    - keep it controlled by `show_clearance_guides`,
    - do not move the module origin away from the PCB bottom face.
12. Implement IR LED geometry:
    - adjustable cylindrical LED body,
    - adjustable diameter, body length, center height, and forward extension,
    - positive-Y orientation by default,
    - preserve existing extension behavior rather than introducing a new measured LED extension value,
    - controlled by `show_ir_led`.
13. Implement optional IR sightline or beam guide:
    - use adjustable `ir_half_intensity_angle_deg` defaulting to 17 degrees,
    - treat it as visual/mechanical clearance context only,
    - controlled by `show_clearance_guides`.
14. Implement simplified major component clearance blocks and label markers:
    - controlled by `show_electronics` and `show_labels`,
    - keep dimensions and positions adjustable.
15. Preserve independent visibility toggles:
    - `show_electronics`,
    - `show_grove_connector`,
    - `show_ir_led`,
    - `show_labels`,
    - `show_clearance_guides`.
16. Keep the file OpenSCAD 2021.01-compatible:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax,
    - no user-adjustable value redefinitions inside modules.
17. Update `README.md`:
    - list `designs/grove_infrared_emitter.scad`,
    - document the selected measured mechanical defaults: 20.25 mm x 23.75 mm PCB, 1.6 mm PCB thickness, 9.65 mm connector top envelope, and 2.0 mm bottom pin protrusion clearance,
    - document that the measured default supersedes the earlier public-source dimensions,
    - document the two-hole left/right margin-centered layout and remaining screw-hole diameter/X-inset assumptions,
    - document Grove connector, perpendicular cable clearance, bottom pin protrusion clearance, IR LED extension behavior, and optional sightline guide behavior,
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
- PCB dimensions, PCB thickness, connector top envelope, bottom pin protrusion clearance, and IR LED extension behavior match the approved spec,
- exactly two screw holes are rendered by default, centered on the PCB length centerline and placed near the left/right PCB margins,
- screw-hole diameter and X edge inset are adjustable and documented as assumptions,
- Grove connector and perpendicular cable clearance are independently adjustable,
- Grove connector/reference top reaches 9.65 mm from the PCB bottom by default,
- Grove cable/plug clearance is centered over the connector and extends upward from the connector instead of horizontally off the board,
- bottom pin protrusion clearance is independently controlled by `show_clearance_guides`,
- IR LED body and extension are independently adjustable,
- optional sightline/beam guide uses an adjustable 17 degree half-intensity default,
- visibility toggles control the intended groups,
- major geometry is organized through named modules,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the new design is listed,
- selected measured dimensions and superseded public-source notes match the approved spec,
- the two-hole layout and remaining screw-hole assumptions are documented,
- connector top envelope and bottom pin protrusion clearance are documented,
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
- `README.md` Grove Infrared Emitter component assumptions, measured source dimensions, superseded public-source note, two-hole layout, connector top envelope, bottom pin protrusion clearance, perpendicular cable clearance behavior, adjustable parameters, render modes, optional commands, fit notes, and manual inspection checklist.

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
