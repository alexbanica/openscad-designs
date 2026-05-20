# Raspberry Pi Zero USB Ethernet Grove IR Enclosure Implementation Plan

Status: Approved

Approved spec: `specs/spec-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

- Use the current branch as requested by the user.
- Do not create a new implementation branch.
- Preserve unrelated worktree changes and do not revert them.

## Scope

Update the existing approved OpenSCAD design and supporting documentation for the measured Micro USB bridge adapter and stack clearances:

- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`

No generated STL, STEP, 3MF, or other mesh exports are part of this plan.

## Test-First And Validation Strategy

Automated unit tests are not applicable and QA is not required for this project unless explicitly requested. A code review is sufficient repository validation for this iteration.

Validation for this iteration:

- `git diff --check`.
- Code review of the OpenSCAD and README changes against the approved spec, focused on:
  - Micro USB bridge clearance defaults of 8.5 mm width and 12 mm vertical height,
  - explicit Pi-to-USB-HAT stack clearance parameter defaulting to 11.20 mm,
  - Grove HAT stack clearance defaulting to 10.5 mm,
  - derived z positions using the stack clearance parameters,
  - tray height, cover placement, port cutouts, and previews deriving from the updated stack.
- Optional OpenSCAD render checks may be run when available for syntax and geometry sanity, but they are not required acceptance gates for this iteration.

## Implementation Steps

1. Confirm implementation context.
   - Verify the approved spec and this approved plan are present.
   - Verify the command context boundary before implementation starts.
   - Check current branch and worktree state before editing.

2. Update `designs/pi_zero_usb_grove_ir_enclosure.scad` adjustable parameters.
   - Target OpenSCAD 2021.01-compatible syntax only.
   - Preserve the existing one-file design structure and render modes.
   - Set `usb_hat_bottom_bridge_clearance_width_mm` default to 8.5.
   - Set `usb_hat_bottom_bridge_clearance_height_mm` default to 12.
   - Add an explicit Pi-to-USB-HAT stack clearance parameter defaulting to 11.20 mm in the USB HAT or stack-related adjustable parameter group.
   - Set `grove_hat_stack_clearance_mm` default to 10.5.
   - Keep linear dimension variables suffixed with `_mm`.
   - Keep user-adjustable variables in the existing `Adjustable Parameters` section and derived values in the existing `Derived Values` section.

3. Update derived stack geometry.
   - Replace the hard-coded Pi-to-USB-HAT vertical gap in `usb_hat_board_z_mm` with the new explicit stack clearance parameter.
   - Preserve the existing derivation pattern for `grove_hat_board_z_mm`, `electronics_top_z_mm`, `tray_wall_height_mm`, and `top_cover_z_mm`.
   - Preserve existing port cutout and preview behavior so z positions automatically follow the updated board stack dimensions.

4. Update `README.md`.
   - Document the measured Micro USB bridge adapter clearance defaults.
   - Document the measured Pi-to-USB-HAT and USB-HAT-to-Grove-HAT stack gap defaults.
   - Update tuning guidance to mention changing these measured stack and bridge clearance parameters after test fitting.
   - Update the manual/code-review checklist to include the measured bridge and stack clearances.

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

- OpenSCAD adjustable parameters include explicit measured bridge and stack clearance defaults.
- `usb_hat_bottom_bridge_clearance_width_mm` defaults to 8.5.
- `usb_hat_bottom_bridge_clearance_height_mm` defaults to 12.
- Pi-to-USB-HAT stack clearance is parameterized and defaults to 11.20 mm.
- `grove_hat_stack_clearance_mm` defaults to 10.5.
- Derived z positions use the explicit stack clearance parameters rather than a hard-coded Pi-to-USB-HAT gap.
- Tray height, cover placement, port cutouts, and previews remain derived from the updated stack values.
- README documents the measured bridge adapter and stack clearance defaults.

## Documentation Requirements

- `README.md` must document the measured Micro USB bridge adapter clearance and stack gap defaults.
- Documentation must match implemented file names and render modes.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- `git diff --check` passes.
- Code review findings are reported and resolved or delivery is marked draft.
- Documentation is updated.
- Commit and push status are reported.
