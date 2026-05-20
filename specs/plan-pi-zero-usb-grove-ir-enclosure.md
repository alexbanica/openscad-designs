# Raspberry Pi Zero USB Ethernet Grove IR Enclosure Implementation Plan

Status: Approved

Approved spec: `specs/spec-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

- Use the current branch as requested by the user.
- Do not create a new implementation branch.
- Preserve unrelated worktree changes and do not revert them.

## Scope

Implement the approved OpenSCAD design and supporting documentation:

- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`
- `AGENTS.md`

No generated STL, STEP, 3MF, or other mesh exports are part of this plan.

## Test-First And Validation Strategy

Automated unit tests are not applicable because this repository contains OpenSCAD geometry rather than executable application logic.

Before production modeling work, update the README validation checklist for this new design and use it as the QA target:

- OpenSCAD syntax/render validation for the full assembly and each render mode when `openscad` is installed.
- `git diff --check`.
- Manual visual inspection of board stacking, port exposure, GPIO hatch behavior, IR LED exposure, internal cable routing, bottom header protrusion clearance, and printability.

## Implementation Steps

1. Confirm implementation context.
   - Verify the approved spec and this approved plan are present.
   - Verify the user intentionally wants implementation on the current branch.
   - Check current branch and worktree state before editing.

2. Add `designs/pi_zero_usb_grove_ir_enclosure.scad`.
   - Target OpenSCAD 2021.01-compatible syntax only.
   - Use one primary file with same-file helper modules.
   - Add a clearly labeled `Adjustable Parameters` section near the top.
   - Group adjustable variables by:
     - render controls,
     - Pi Zero dimensions,
     - USB HAT dimensions,
     - Grove HAT dimensions,
     - IR emitter dimensions,
     - enclosure structure,
     - fasteners and tolerances.
   - Use descriptive `snake_case` names.
   - Use `_mm` for linear dimensions and `_deg` for angles.
   - Keep derived values in a separate `Derived Values` section.

3. Implement printable enclosure geometry.
   - Bottom tray with Pi/HAT standoffs and clearance for manually inserted header pins protruding below the Pi.
   - Side and end cutouts for Pi microSD, mini-HDMI, both Pi micro-USB connectors, camera connector access where mechanically practical, USB HAT RJ45, and all 3 USB connectors.
   - Screw-fastened top cover.
   - Sliding GPIO hatch aligned over only the Grove HAT 2x20 GPIO header area.
   - Internal IR emitter mount with LED aperture and optional screw holes.
   - Internal channel or clearance path for the Grove IR emitter cable.
   - Simplified electronics preview modules controlled by `show_electronics`.

4. Implement render modes.
   - `assembly`
   - `bottom_tray`
   - `top_cover`
   - `gpio_hatch`
   - `printable_layout`

5. Update `README.md`.
   - Add the new design file to the design list.
   - Document supported hardware stack and source assumptions.
   - Document OpenSCAD 2021.01 requirement.
   - Document adjustable parameter groups and common tuning points.
   - Document render/export commands for each mode.
   - Document assembly and Bambu P2S / AMS 2 Pro print guidance.
   - Add manual validation checklist entries for this enclosure.

6. Update `AGENTS.md`.
   - Add validation commands for the new design render modes.
   - Preserve existing repository guidance, including Bambu Lab P2S and AMS 2 Pro compatibility.

7. Validate.
   - Run `openscad --version` if available.
   - If available, run OpenSCAD checks for each render mode:
     - `assembly`
     - `bottom_tray`
     - `top_cover`
     - `gpio_hatch`
     - `printable_layout`
   - Run `git diff --check`.
   - If OpenSCAD is unavailable, mark geometry validation as not run and include manual inspection steps in the completion report.

8. Review and QA.
   - Review the `.scad` file against the approved spec for missing parameters, exposed Grove sockets, blocked ports, non-2021.01 syntax, unclear variables, and undocumented render modes.
   - Review documentation for accurate component assumptions and validation commands.
   - Perform final main-agent acceptance against the approved spec and approved plan.

9. Commit and push.
   - Commit only the approved spec/plan and implementation files required for this work, including the existing `AGENTS.md` compatibility edit if still present and intended.
   - Use a non-draft commit only if required validation and manual QA are complete and passing.
   - Use a `DRAFT` commit message if OpenSCAD validation or manual QA cannot be completed.
   - Push only if repository access is available and project policy permits.

## Worker Split

No implementation subagents are required. The design, documentation, and validation changes are coherent and low-coupling enough for the main agent to implement directly after plan approval.

## Manual QA Requirements

The implementation is not accepted until the final report states the result of each check:

- Pi Zero, USB HAT, and Grove HAT render in the correct vertical order.
- Pi Zero microSD, mini-HDMI, both micro-USB ports, and camera connector access are not blocked by the enclosure.
- USB HAT RJ45 and all 3 USB connectors are exposed.
- Sliding top hatch exposes only the GPIO header area.
- Grove sockets remain enclosed.
- IR emitter cable path is internal.
- Only the IR LED is exposed outside the case.
- Bottom clearance accounts for manually inserted GPIO header pin protrusion.
- Each printable part has a plausible flat print orientation.
- Wall thicknesses, clearances, bridges, and screw features are plausible for Bambu P2S printing.

## Documentation Requirements

- `README.md` must document the new design, render controls, assumptions, print guidance, and manual validation.
- `AGENTS.md` must include validation commands for the new design.
- Documentation must match implemented file names and render modes.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- Required render modes compile when OpenSCAD is available.
- `git diff --check` passes.
- Review and QA findings are reported and resolved or delivery is marked draft.
- Documentation is updated.
- Commit and push status are reported.
