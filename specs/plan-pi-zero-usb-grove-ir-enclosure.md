# Raspberry Pi Zero USB Ethernet Grove IR Enclosure Implementation Plan

Status: Approved

Approved spec: `specs/spec-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

- Use the current branch as requested by the user.
- Do not create a new implementation branch.
- Preserve unrelated worktree changes and do not revert them.

## Scope

Update the existing approved OpenSCAD design and supporting documentation for the WS-16595 USB HAT connector layout correction:

- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`

No generated STL, STEP, 3MF, or other mesh exports are part of this plan.

## Test-First And Validation Strategy

Automated unit tests are not applicable and QA is not required for this project unless explicitly requested. A code review is sufficient repository validation for this iteration.

Validation for this iteration:

- `git diff --check`.
- Code review of the OpenSCAD and README changes against the approved spec, focused on the WS-16595 connector topology:
  - RJ45 plus one USB on the front edge,
  - one USB on the left long side,
  - one USB on the right long side,
  - no grouped three-USB cutout on a single face,
  - no overlap between the front IR LED aperture and the RJ45/front USB openings.
- Optional OpenSCAD render checks may be run when available for syntax and geometry sanity, but they are not required acceptance gates for this iteration.

## Implementation Steps

1. Confirm implementation context.
   - Verify the approved spec and this approved plan are present.
   - Verify the command context boundary before implementation starts.
   - Check current branch and worktree state before editing.

2. Update `designs/pi_zero_usb_grove_ir_enclosure.scad` adjustable parameters.
   - Target OpenSCAD 2021.01-compatible syntax only.
   - Preserve the existing one-file design structure and render modes.
   - Replace the grouped `usb_hat_usb_cutout_*` assumptions with independently tunable front, left-side, and right-side USB cutout parameters.
   - Keep linear dimension variables suffixed with `_mm`.
   - Keep user-adjustable variables in the existing `Adjustable Parameters` section and derived values in the existing `Derived Values` section.

3. Update USB HAT port cutout geometry.
   - Keep the RJ45 opening on the front edge.
   - Add one front USB opening beside the RJ45 opening.
   - Add one USB opening on the left long side.
   - Add one USB opening on the right long side.
   - Remove the obsolete loop that places all three USB openings as a grouped set on one face.
   - Preserve existing Pi Zero, Grove HAT, hatch, standoff, bottom bridge clearance, and IR emitter behavior unless a small front-opening adjustment is needed to avoid overlap.

4. Update electronics preview geometry.
   - Show the RJ45 connector on the front edge.
   - Show one USB connector on the front edge beside the RJ45 connector.
   - Show one USB connector on each long side.
   - Keep previews non-printing and controlled by `show_electronics`.

5. Update `README.md`.
   - Document the USB HAT as Kiwi product code `WS-16595`.
   - Correct the component assumptions from three USB ports on one side to RJ45 plus one USB on the front edge and one USB on each long side.
   - Update common tuning guidance to mention independent front, left-side, and right-side USB HAT cutout positions.
   - Update the manual/code-review checklist to include the corrected connector topology and front IR aperture non-overlap.

6. Validate and review.
   - Run `git diff --check`.
   - Perform code review against the approved spec and implementation plan.
   - Optional: run OpenSCAD render checks for changed render modes if available and useful.

7. Commit and push.
   - Commit only the approved spec/plan and implementation files required for this iteration.
   - A non-draft commit is acceptable when `git diff --check` passes and code review finds no unresolved issues.
   - Commit and push directly to `main` if otherwise unspecified, per repository guidance.

## Worker Split

No implementation subagents are required. The design and documentation changes are coherent and low-coupling enough for the main agent to implement directly after plan approval.

## Code Review Requirements

The implementation is not accepted until code review confirms:

- OpenSCAD adjustable parameters include independent front, left-side, and right-side USB HAT cutout positions.
- Bottom tray cutouts expose RJ45 plus one USB on the front edge.
- Bottom tray cutouts expose one USB on the left long side and one USB on the right long side.
- The obsolete grouped three-USB cutout pattern is removed.
- Electronics preview geometry matches the corrected connector topology.
- The front IR aperture does not overlap RJ45 or front USB openings.
- Unrelated Pi Zero, Grove HAT, hatch, standoff, bottom bridge, and IR emitter behavior is preserved.
- README documents the corrected WS-16595 connector layout.

## Documentation Requirements

- `README.md` must document the corrected WS-16595 USB HAT connector layout and tuning/checklist updates.
- Documentation must match implemented file names and render modes.

## Completion Criteria

- Approved spec behavior is implemented.
- This implementation plan is followed or any deviation is re-approved.
- `git diff --check` passes.
- Code review findings are reported and resolved or delivery is marked draft.
- Documentation is updated.
- Commit and push status are reported.
