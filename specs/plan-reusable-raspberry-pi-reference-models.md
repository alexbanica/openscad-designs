# Reusable Raspberry Pi Reference Models Implementation Plan

Status: Approved

Approved spec: `specs/spec-reusable-raspberry-pi-reference-models.md`

## Target Branch

- Use the current `main` branch.
- Do not create a new implementation branch because repository guidance allows direct work on `main` unless otherwise specified.
- Preserve unrelated worktree changes, including files not required by this plan.

## Scope

Implement the approved reusable reference-model spec in:

- `designs/pi_zero.scad`
- `designs/rpi5.scad`
- `AGENTS.md`
- `README.md`, only if the implementation exposes user-facing reusable-reference usage, file inventory, or validation commands that should be documented.

No generated STL, STEP, 3MF, OFF, or other mesh exports are part of the implementation.

## Context Boundary

Before implementation starts, the implementation command must verify one of:

- a fresh session,
- an explicitly cleared context,
- or explicit user confirmation that continuing in the current context is intentional for this invocation.

Implementation must use only the approved spec, this approved plan, repository instructions, and minimal affected-file context.

## Test-First And Validation Strategy

Automated unit tests are not applicable because this is OpenSCAD reference geometry and repository instructions state QA/unit tests are not required unless explicitly requested.

Required validation:

- `git diff --check`
- Main-agent code review against the approved spec and this plan.

OpenSCAD validation:

- If `openscad` is installed, run:

```sh
openscad -o /tmp/pi_zero_reference.off designs/pi_zero.scad
openscad -o /tmp/rpi5_reference.off designs/rpi5.scad
```

- If `openscad` is unavailable, report that geometry validation was not run and rely on code review plus the manual checklist below.

Manual review checklist:

- Each base file has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable variable names are descriptive `snake_case`.
- Linear dimensions use `_mm`; angles use `_deg` if any are introduced.
- User-adjustable geometry values are not redefined inside modules.
- Major assemblies and repeated geometry are exposed through named modules.
- `designs/pi_zero.scad` preserves the current default Pi Zero board, mounting holes, connector previews, GPIO layout, test pads, and version-dependent behavior.
- `designs/rpi5.scad` preserves the current default Raspberry Pi 5 board, mounting holes, connector previews, GPIO layout, microSD preview, and active cooler preview.
- Child designs can call named modules and disable the Pi Zero or Raspberry Pi 5 reference model without editing the base file.
- `AGENTS.md` instructs future agents to reuse these base files for Pi Zero and Raspberry Pi 5 board geometry.
- README is updated if implementation creates user-facing usage or validation expectations.

## Implementation Steps

1. Confirm implementation readiness.
   - Verify approved spec and approved plan are present.
   - Verify the required clean-context boundary.
   - Check current branch and worktree state.
   - Note unrelated worktree files and preserve them.

2. Refactor `designs/pi_zero.scad`.
   - Preserve attribution comments.
   - Replace CamelCase/global terse names with descriptive `snake_case` names.
   - Add a top-level `Adjustable Parameters` section grouped by:
     - render controls,
     - Pi Zero version and feature visibility,
     - board dimensions,
     - mounting holes,
     - GPIO header and pin dimensions,
     - connector/component preview dimensions,
     - test-pad preview data,
     - visual settings where useful.
   - Add a separate `Derived Values` section for calculated hole positions, half-thickness, offsets, and version-dependent component positions.
   - Rename modules and functions to descriptive `snake_case`.
   - Provide a child-callable main module, for example `pi_zero_reference_model(...)`, with parameters for showing the board reference and optional subfeatures.
   - Preserve default standalone rendering behavior when the file is opened directly.
   - Ensure child usage via `use <pi_zero.scad>` can import modules without triggering top-level rendering.

3. Refactor `designs/rpi5.scad`.
   - Add a top-level `Adjustable Parameters` section grouped by:
     - render controls,
     - Raspberry Pi 5 board dimensions,
     - mounting holes,
     - GPIO header dimensions,
     - connector/component preview dimensions,
     - microSD preview dimensions,
     - active cooler preview dimensions,
     - visual settings where useful.
   - Add a separate `Derived Values` section for calculated positions and repeated geometry values.
   - Rename terse variables such as `board_x`, `board_y`, `board_z`, `corner_r`, and `hole_d` to descriptive names with `_mm`.
   - Move current module-local user-adjustable values from `gpio_header`, `microsd_card`, and `official_active_cooler` into top-level adjustable or derived sections.
   - Rename modules to descriptive `snake_case` names where needed.
   - Provide a child-callable main module, for example `rpi5_reference_model(...)`, with parameters for showing the board reference and optional subfeatures.
   - Preserve default standalone rendering behavior when the file is opened directly.
   - Ensure child usage via `use <rpi5.scad>` can import modules without triggering top-level rendering.

4. Update `AGENTS.md`.
   - Add guidance that future `.scad` files requiring Raspberry Pi Zero geometry should use `designs/pi_zero.scad` as the reference model.
   - Add guidance that future `.scad` files requiring Raspberry Pi 5 geometry should use `designs/rpi5.scad` as the reference model.
   - State that dependent cases, supports, enclosures, and accessories should build around these base references instead of duplicating board geometry.
   - State that these base references must remain toggleable from child designs.
   - Preserve all existing repository OpenSCAD rules and validation guidance.

5. Update `README.md` if needed.
   - Add the two base reference files to the design inventory if they are user-facing.
   - Document the child-call pattern if the implemented modules are intended for direct reuse by users.
   - Add validation commands for the base references if README validation should cover them.
   - Do not add generated mesh files.

6. Review and validate.
   - Run `git diff --check`.
   - Run OpenSCAD preview exports for both base files if `openscad` is available.
   - Perform code review against the approved spec and this plan.
   - If OpenSCAD is unavailable or validation fails, mark delivery draft during implementation completion unless fixed or explicitly accepted.

7. Commit and push expectations.
   - After implementation, review, and validation, commit only files required by the approved spec and plan.
   - A non-draft commit is allowed only if required validation passes and review finds no unresolved issues.
   - Use a draft commit message if required validation is skipped, blocked, incomplete, or failing.
   - Push directly to `main` if repository access is available and validation is complete; otherwise report push status.

## No-Research Constraints For Implementation

- Do not perform additional product or architecture research.
- Do not look up external board dimensions unless implementation finds an internal contradiction that blocks preserving the current model intent; if that occurs, stop for spec clarification.
- Do not modify existing enclosure designs to consume the references.
- Do not add compatibility aliases for old variable names unless the user explicitly amends the approved spec or plan.

## Worker Split

No implementation subagents are required. The changes are coherent, localized, and low-coupling enough for the main agent to implement directly after plan approval.

## Review Requirements

Implementation is not accepted until review confirms:

- Both base files satisfy repository OpenSCAD style rules.
- Current default reference geometry intent is preserved.
- Child-callable modules and visibility toggles are present.
- `AGENTS.md` includes the required reuse guidance.
- README changes, if any, match implemented module names and validation behavior.
- Unrelated worktree changes are not reverted or committed.

## Documentation Requirements

- `AGENTS.md` update is required.
- `README.md` update is conditional but expected if the reusable modules are user-facing after implementation.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- Required validation is run or explicitly reported as unavailable.
- Code review findings are reported and resolved, or delivery is marked draft.
- Documentation requirements are satisfied.
- Commit and push status are reported.
