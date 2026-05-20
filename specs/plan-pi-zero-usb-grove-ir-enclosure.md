# Raspberry Pi Zero USB Ethernet Grove IR Enclosure Implementation Plan

Status: Approved

Approved spec: `specs/spec-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

- Use the current branch as requested by the user.
- Do not create a new implementation branch.
- Preserve unrelated worktree changes and do not revert them.

## Scope

Update the existing approved OpenSCAD design and supporting documentation for measured Raspberry Pi Zero side-port cutout margins:

- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`

No generated STL, STEP, 3MF, or other mesh exports are part of this plan.

## Test-First And Validation Strategy

Automated unit tests are not applicable and QA is not required for this project unless explicitly requested. A code review is sufficient repository validation for this iteration.

Validation for this iteration:

- `git diff --check`.
- Code review of the OpenSCAD and README changes against the approved spec, focused on:
  - Micro HDMI to first Micro USB edge-to-edge margin defaulting to 20 mm,
  - first Micro USB to second Micro USB edge-to-edge margin defaulting to 5 mm,
  - Micro USB x positions deriving from the margin parameters and cutout widths,
  - Pi side-port cutouts and electronics preview using the derived Micro USB x positions,
  - existing USB HAT, bridge clearance, stack clearance, hatch, and IR emitter behavior remaining unchanged.
- Optional OpenSCAD render checks may be run when available for syntax and geometry sanity, but they are not required acceptance gates for this iteration.

## Implementation Steps

1. Confirm implementation context.
   - Verify the approved spec and this approved plan are present.
   - Verify the command context boundary before implementation starts.
   - Check current branch and worktree state before editing.

2. Update `designs/pi_zero_usb_grove_ir_enclosure.scad` adjustable parameters.
   - Target OpenSCAD 2021.01-compatible syntax only.
   - Preserve the existing one-file design structure and render modes.
   - Add `pi_mini_hdmi_to_micro_usb_margin_mm` defaulting to 20.
   - Add `pi_micro_usb_between_margin_mm` defaulting to 5.
   - Keep linear dimension variables suffixed with `_mm`.
   - Keep user-adjustable variables in the existing `Adjustable Parameters` section and derived values in the existing `Derived Values` section.

3. Update derived Pi side-port geometry.
   - Move `pi_micro_usb_power_x_mm` and `pi_micro_usb_data_x_mm` out of user-adjustable fixed-position defaults and derive them from:
     - `pi_mini_hdmi_cutout_x_mm`,
     - `pi_mini_hdmi_cutout_width_mm`,
     - `pi_micro_usb_cutout_width_mm`,
     - `pi_mini_hdmi_to_micro_usb_margin_mm`,
     - `pi_micro_usb_between_margin_mm`.
   - Preserve existing Pi side-port cutout widths, heights, z positions, y/depth placement, and preview dimensions.
   - Preserve all USB HAT connector topology, bridge clearance, vertical stack clearance, hatch, IR emitter, and printable layout behavior.

4. Update `README.md`.
   - Document the measured Micro HDMI to first Micro USB margin default of 20 mm.
   - Document the measured first Micro USB to second Micro USB margin default of 5 mm.
   - Update tuning guidance to mention changing the measured side-port margin parameters after test fitting.
   - Update the manual/code-review checklist to include the measured side-port margins.

5. Validate and review.
   - Run `git diff --check`.
   - Perform code review against the approved spec and implementation plan.
   - Optional: run OpenSCAD render checks for changed render modes if available and useful.

6. Commit and push.
   - Commit only the approved spec/plan and implementation files required for this iteration.
   - A non-draft commit is acceptable when `git diff --check` passes and code review finds no unresolved issues.
   - Commit and push directly to `main` if otherwise unspecified, per repository guidance.

## Worker Split

No implementation subagents are required. The design and documentation changes are coherent and low-coupling enough for the main agent to implement directly after plan approval.

## Code Review Requirements

The implementation is not accepted until code review confirms:

- OpenSCAD adjustable parameters include explicit measured side-port margin defaults.
- `pi_mini_hdmi_to_micro_usb_margin_mm` defaults to 20.
- `pi_micro_usb_between_margin_mm` defaults to 5.
- The first Micro USB x position derives from the Micro HDMI x position, cutout widths, and 20 mm margin.
- The second Micro USB x position derives from the first Micro USB x position, Micro USB cutout width, and 5 mm margin.
- Pi side-port cutouts and electronics preview use the derived Micro USB x positions.
- Existing USB HAT, bridge clearance, stack clearance, hatch, IR emitter, and printable layout behavior is unchanged.
- README documents the measured side-port margin defaults.

## Documentation Requirements

- `README.md` must document the measured Micro HDMI to Micro USB and Micro USB to Micro USB side-port margin defaults.
- Documentation must match implemented file names and render modes.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- `git diff --check` passes.
- Code review findings are reported and resolved or delivery is marked draft.
- Documentation is updated.
- Commit and push status are reported.
