# SPEC: Voomy Top-Cover Hook Strength And Outward Projection

Status: Approved

## Purpose

Strengthen the top-cover clamp hook and increase its projection because the
printed hook is too small to provide the requested receiver engagement.

This completed-work specification supersedes the prior `0.8 mm` outward hook
projection and `0.8 mm` vertical hook-height requirements in
`specs/SPEC-voomy-power-s7-cable-management-case.md`. All other approved Voomy
geometry and behavior remain unchanged.

## Requested Behavior

- Increase each of the four top-cover hook heads outward from the cantilever arm.
- Increase each hook's vertical root/ramp height to provide a larger, stronger
  material section at the arm-to-hook transition.
- Keep the hook width, arm position, compensated clamp positions, receiver
  openings, and complete base unchanged.

## Scope

- `designs/voomy_power_s7_cable_management_case.scad` top-cover hook projection,
  height, arm reach, derived values, and assertions.
- Voomy hook guidance in `README.md`.
- This completed-work spec and its matching plan.

## Out Of Scope

- Base, receiver-hole, receiver-catch, wall, floor, cable-passage, ventilation,
  USB-cover, roof, skirt, and printable-layout changes.
- Hook width or clamp-position changes.
- Generated mesh or preview files in source control.

## Definitions

- **Outward projection:** the hook-head distance from the arm's outer face toward
  and into the fixed receiver opening.
- **Effective wall penetration:** outward projection minus the arm's unchanged
  inward wall clearance.
- **Hook height:** the vertical root/ramp span between the fixed retention ledge
  and the lower hook tip in the installed orientation.

## Inputs And Constraints

- Previous hook outward projection: `0.8 mm`.
- Corrected hook outward projection: `1.6 mm`.
- Unchanged arm-to-inner-wall clearance: `0.3 mm`.
- Derived effective wall penetration: `1.3 mm`.
- Previous hook height: `0.8 mm`.
- Corrected hook height: `1.2 mm`.
- Unchanged hook width: `12.0 mm`.
- Corrected installed vertical span: `Z 194.3..195.5 mm`.
- Unchanged receiver opening: `12.6 x 5.6 mm`.
- OpenSCAD 2021.01 and `render_mode = "printable_layout"` remain required.

The corrected projection is a user-directed printable adjustment, not a new
physical measurement.

## Deterministic Behavior Delivered

- `cap_clip_hook_engagement_mm` is `1.6` for all four top-cover clamps.
- `cap_clip_hook_height_mm` is `1.2`, increasing the hook's vertical material
  section while keeping its retention ledge fixed at installed `Z 195.5 mm`.
- The existing `0.3 mm` inward arm clearance derives exactly `1.3 mm` effective
  receiver penetration.
- The hook polygon expands only in its wall-normal outward direction.
- The arm reach increases from `12.3 mm` to `12.7 mm` so the straight arm fully
  supports the taller hook tip.
- The `12.0 mm` width, arm thickness and wall clearance, installed clamp
  coordinates, and positive internal joins remain unchanged.
- Assertions bind the corrected projection, hook height, vertical span, arm
  reach, and effective penetration while preserving the fixed receiver geometry.

## Assumptions And Impact

The larger and taller hook is expected to provide more material at the hook
root and more positive retention. It can also increase insertion and removal
force or contact with the printed receiver edge. Printer tolerance, material
stiffness, and the physical base determine the actual fit.

Only the top cover needs reprinting for this correction.

## Validation Performed

- `git diff --check` passed for the changed source and README.
- OpenSCAD 2021.01 reference-free `assembly` and `printable_layout` CSG exports
  completed with all assertions enabled.
- A bounded reference-free `printable_layout` STL export completed as a simple
  object with the expected four OpenSCAD volumes: the exterior region and three
  connected printable solids.

## Validation Skipped

- Unit tests and conventional test-first work are prohibited and not applicable.
- QA and independent code review were skipped by the requested super-agent
  workflow.
- Bambu Studio inspection, test printing, insertion/removal force, retention,
  wall stress, and repeated-cycle testing were not performed.

## Documentation Changes

The README now documents the strengthened `1.6 mm` outward projection, `1.3 mm`
effective penetration, and `1.2 mm` vertical hook height.

## Delivery State

DRAFT until the corrected top cover is sliced, printed, fitted to the unchanged
base, removed safely, and cycle-tested without hook, clamp, or receiver damage.
