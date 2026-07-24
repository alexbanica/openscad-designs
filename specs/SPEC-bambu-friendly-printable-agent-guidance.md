# SPEC: Bambu-Friendly Printable Agent Guidance

Status: Approved

## Auto-Approved Super-Agent Update: Default Printable Layout (2026-07-24)

### Purpose And Requested Behavior

Update repository agent guidance so OpenSCAD designs default to the
`printable_layout` render mode.

### Scope, Definitions, Inputs, And Constraints

- Scope is limited to `AGENTS.md` and this matching completed-work record.
- "Default" means the source value assigned to `render_mode` when a `.scad`
  file is opened or rendered without a command-line or Customizer override.
- Apply the rule to every new or modified `.scad` file that exposes
  `render_mode`.
- Preserve assembly, individual-part, electronics, clearance, and other
  supported render modes as explicit overrides.
- Do not retroactively modify existing `.scad` files in this guidance-only
  invocation and do not add generated exports.

### Deterministic Behavior Delivered

- `AGENTS.md` requires `render_mode = "printable_layout"` as the source default
  in every new or modified `.scad` file that exposes the control.
- Other supported render modes remain selectable explicitly and are not
  removed or renamed.
- Designs without a `render_mode` control are unaffected.

### Assumptions, Impact, And Residual Risk

- The request to update `AGENTS.md` is interpreted as durable guidance for
  future agent work, not authorization to rewrite all existing designs now.
- Existing files may continue to default to another mode until they are next
  modified. The rule depends on future agents following repository guidance.
- Defaulting to printable geometry reduces the risk of accidentally exporting
  electronics or assembly references, but it does not prove that a layout is
  physically printable or correctly arranged.

### Validation And Documentation

- Short validation performed: `git diff --check` and manual inspection of the
  scoped guidance diff.
- Unit tests are prohibited and not applicable. OpenSCAD rendering, slicer
  inspection, code review, QA, and physical printing were skipped because no
  geometry changed.
- Documentation updated: `AGENTS.md` only; `README.md` remains unchanged.
- Delivery is lower-assurance under the explicit super-agent workflow.

## Purpose

Update repository agent instructions so future printable OpenSCAD designs are explicitly Bambu Lab-friendly and avoid common print-layout problems.

## Problem Statement

`AGENTS.md` already says design and printing guidance should remain compatible with the Bambu Lab P2S printer and AMS 2 Pro, but it does not explicitly require printable outputs to avoid floating objects, separate independently printable objects, or orient parts with the most stable/material-heavy face on the build plate.

Future agents need deterministic guidance so printable versions are modeled and reviewed in a way that is suitable for Bambu Lab printer workflows.

## Scope

- Update `AGENTS.md` repository instructions for printable design guidance.
- Clarify that printable versions should be Bambu Lab-friendly, including the existing Bambu Lab P2S and AMS 2 Pro compatibility target.
- Require printable layouts to avoid floating objects.
- Require each printable object to be separable and printable independently unless an approved spec explicitly requires a combined print.
- Require each printable object to be oriented with the face that has the most material or broadest stable contact area facing downward on the printer plate, unless an approved spec documents a different orientation.
- Require every new spec file to document manually entered dimensions when they are used, including PCB dimensions, dimensions between components, and component sizes.
- Keep the new guidance applicable to future printable `.scad` designs and render modes.

## Out Of Scope

- Changes to existing `.scad` design files.
- Changes to existing specs or plans other than this planning artifact.
- README updates, unless implementation finds existing README text directly conflicts with the approved `AGENTS.md` wording.
- Generated mesh exports such as STL, STEP, 3MF, OFF, or similar artifacts.
- Bambu Studio slicer profiles or printer configuration files.
- Physical print validation.

## Definitions

- Bambu Lab-friendly: suitable for Bambu Lab printer workflows, with repository compatibility centered on Bambu Lab P2S and AMS 2 Pro unless a future approved spec narrows or changes printer support.
- Printable version: a render mode, layout, module, or design output intended to represent printable geometry rather than only electronics/reference/clearance previews.
- Floating object: printable geometry that is suspended above the build plate or disconnected from plate contact in its printable orientation.
- Separately printable object: a distinct object in a printable layout that can be printed as its own part without relying on another object for plate contact or support.
- Most material downwards: orientation where the broadest, most stable, or most material-heavy face is placed toward the build plate to improve positioning and plate adhesion.
- Manually entered dimensions: dimensions explicitly entered into a design or spec rather than calculated from other approved values.

## Inputs And Constraints

- Repository instructions already allow direct work on `main` when otherwise unspecified.
- Repository instructions already require behavior-changing work to start from an approved spec under `specs/`.
- The guidance must stay general enough for future OpenSCAD designs while being specific enough for review.
- The wording must use `Bambu Lab`, not `Bamboo`, when naming the printer ecosystem.
- The implementation must not add generated mesh artifacts.

## Deterministic Behavior

- `AGENTS.md` will contain an explicit printable design guidance rule that future printable versions must be Bambu Lab-friendly.
- The rule will state that printable versions must not contain floating objects in their intended printable layout.
- The rule will state that every printable object should be separable and printable independently unless a future approved spec explicitly requires objects to be joined or printed together.
- The rule will state that every printable object should be oriented with its broadest, most material-heavy, or most stable face downward on the printer plate unless a future approved spec documents a different print orientation.
- The rule will preserve the existing compatibility target for Bambu Lab P2S and AMS 2 Pro.
- `AGENTS.md` will contain an explicit spec documentation rule that every new spec file must document manually entered dimensions when they are used, including PCB dimensions, dimensions between components, and component sizes.

## Assumptions

- The user's phrase "Bamboo printer friendly" means `Bambu Lab` printer-friendly.
- "Face that has more material downwards" means the broadest, most stable, or most material-heavy face should face the build plate.
- The requested change is an update to repository agent instructions only, not a retrofit of existing OpenSCAD files.
- The requested dimension documentation rule applies to new spec files.

## Impact And Regression Considerations

- Future specs and implementations will need to account for printable-object separation and orientation when adding printable render modes or parts.
- Future new spec files will need to document manually entered dimensions such as PCB dimensions, component spacing, and component sizes when those dimensions are part of the requested design behavior.
- Existing design files are not changed by this spec and are not revalidated under the new guidance.
- The wording should avoid over-constraining non-printable reference models, electronics previews, clearance guides, or assembly views.

## Acceptance Criteria

- `AGENTS.md` includes Bambu Lab-friendly printable layout guidance.
- The guidance explicitly covers:
  - no floating objects in printable versions,
  - separately printable objects,
  - build-plate orientation with the broadest, most material-heavy, or most stable face downward,
  - exception only through an approved spec.
- `AGENTS.md` requires every new spec file to document manually entered dimensions when they are used, including PCB dimensions, dimensions between components, and component sizes.
- Existing Bambu Lab P2S and AMS 2 Pro compatibility wording is preserved or strengthened.
- No `.scad` files are changed.
- No generated mesh/export artifacts are added.
- `git diff --check` passes.

## Validation Plan

- Run `git diff --check`.
- Manually inspect the `AGENTS.md` diff to confirm the accepted guidance is present and scoped to printable versions.
- Confirm no generated mesh/export artifacts are added.
- Confirm no existing `.scad` files are changed.

## Documentation Requirements

- Update `AGENTS.md`.
- Do not update `README.md` unless a direct contradiction is found during implementation.
