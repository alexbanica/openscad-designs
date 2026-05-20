# Raspberry Pi 5 AI HAT+ Dual-Heatsink Vision Case Implementation Plan

Status: Approved

Approved spec: `specs/spec-rpi5-ai-hat-dual-heatsink-vision-case.md`

## Target Branch

- `feature/rpi5-ai-hat-vision-case`
- Create this branch from `main` during implementation unless the user explicitly instructs otherwise.
- Preserve the existing unrelated `.gitignore` change and do not revert it.

## Scope

Implement the approved OpenSCAD design and repository documentation:

- `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`
- `README.md`
- `AGENTS.md`

No exported STL, STEP, or 3MF files are part of this plan.

## Test-First And Validation Strategy

Automated unit tests are not applicable because this repository contains OpenSCAD geometry rather than executable application logic.

Before production modeling work, define the validation checklist from the approved spec in `README.md` and use it as the test/QA target:

- OpenSCAD syntax validation for the main assembly and each render mode when `openscad` is installed.
- `git diff --check`.
- Manual visual inspection of airflow, exhaust, camera placement, CSI routing, and printability.

## Implementation Steps

1. Create the implementation branch.
   - Check current branch and worktree state first.
   - Create `feature/rpi5-ai-hat-vision-case` from `main` unless directed otherwise.

2. Add `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`.
   - Target OpenSCAD 2021.01-compatible syntax only.
   - Use one primary file with same-file helper modules.
   - Add a clearly labeled `Adjustable Parameters` section near the top.
   - Group adjustable variables by:
     - render controls,
     - board dimensions,
     - stack and cooler clearances,
     - case structure,
     - ventilation,
     - camera system,
     - CSI ribbon routing,
     - fasteners and print tolerances.
   - Use descriptive `snake_case` names.
   - Use `_mm` for linear dimensions and `_deg` for angles.
   - Keep derived values in a separate `Derived Values` section.

3. Implement printable geometry modules.
   - Tower base/frame with Raspberry Pi 5 mounting standoffs.
   - Open side walls using posts, ribs, or rails rather than closed panels.
   - Bottom intake slots or open intake geometry.
   - Top exhaust/chimney opening above the AI cooler.
   - Camera arm extending forward from the tower.
   - Adjustable camera tilt bracket.
   - Camera module holder with lens clearance and mounting/clamp geometry.
   - CSI ribbon relief/channel with conservative bend clearance.

4. Implement render modes.
   - Full assembly preview.
   - Tower/base printable part.
   - Camera arm printable part.
   - Camera holder/tilt bracket printable part.
   - Optional combined printable layout if it does not compromise clarity.
   - Simplified electronics preview controlled by `show_electronics`.

5. Update `README.md`.
   - Document project overview and design intent.
   - Document component assumptions and default dimensions.
   - Document OpenSCAD 2021.01 requirement.
   - Document the adjustable parameter groups and common edits.
   - Document render/export workflow.
   - Document Bambu Lab print notes.
   - Document manual fit, thermal, CSI routing, and camera-position QA checklist.

6. Add `AGENTS.md`.
   - Capture repository-specific OpenSCAD guidance.
   - Require OpenSCAD 2021.01 compatibility for current and future `.scad` files.
   - Preserve the variable naming and adjustable-parameter conventions.
   - Document validation expectations.
   - Require specs for future behavior-changing work.

7. Validate.
   - Run `openscad --version` if available.
   - If available, run OpenSCAD syntax/render checks for the main file and each render mode.
   - Run `git diff --check`.
   - Manually inspect the design in OpenSCAD or document that manual inspection could not be performed in this environment.

8. Review and QA.
   - Review the `.scad` file against the approved spec for missing parameters, closed airflow paths, post-2021.01 syntax, unclear variables, or undocumented render modes.
   - Review documentation for accurate assumptions and future-agent guidance.
   - Perform final main-agent acceptance against the approved spec and this plan.

9. Commit and push.
   - Commit only the files required for this work plus the already-present `.gitignore` only if the user confirms it should be included or it is intentionally part of repository setup.
   - Use a non-draft commit only if validation and manual QA are complete and passing.
   - Use a `DRAFT` commit message if OpenSCAD validation or manual QA cannot be completed.
   - Push the implementation branch if repository access is available and project policy permits.

## Worker Split

No implementation subagents are required for the first implementation. The work is coherent and low-coupling enough for the main agent to implement directly.

## Manual QA Requirements

The implementation is not accepted until the final report states the result of each check:

- Side walls are open enough for cooler intake/exhaust airflow.
- Bottom intake is present and not blocked by the base.
- Top exhaust is substantially open above the AI cooler.
- Camera is forward of the top exhaust path.
- CSI ribbon path has no intentionally sharp bend or pinch point.
- Each printable part has a plausible flat print orientation.
- Adjustable variables are grouped and understandable without reading implementation modules.

## Documentation Requirements

- `README.md` and `AGENTS.md` must both be updated before delivery.
- Documentation must match the implemented file names and render controls.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- Validation results are reported.
- Review and QA findings are reported and resolved or delivery is marked draft.
- Documentation is updated.
- Commit and push status are reported.
