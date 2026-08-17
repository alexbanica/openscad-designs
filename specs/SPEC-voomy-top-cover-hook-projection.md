# SPEC: Voomy Top-Cover Hook Strength And Outward Projection

Status: Approved

## Iteration: Measured Clamp Reach And Hook Capture (2026-08-17)

### Physical Evidence And Corrected Cause

The printed base measures `11.5 mm` from its top edge to the receiver opening's
upper edge, and its printed wall is `3.55 mm` thick. The current installed hook
retention ledge is also `11.5 mm` below the seated base top, leaving it aligned
with the opening edge instead of positively below it. The clamp reaches the base
wall, but the hook therefore has no reliable vertical capture margin.

These manually entered printed-part measurements calibrate only the replacement
top cover. They do not authorize any base-source or receiver change.

### Required Final Geometry

- Extend each clamp so its installed retention ledge is exactly `13.5 mm` below
  the printed base top: the measured `11.5 mm` receiver-top margin plus `2.0 mm`
  positive capture.
- Increase hook height from `1.2 mm` to `2.0 mm`, placing the installed hook tip
  `15.5 mm` below the printed base top.
- Preserve the nominal unchanged `5.6 mm` receiver height. Combined with the
  measured upper-edge offset, it derives a modeled lower-edge offset of
  `17.1 mm`, leaving `1.6 mm` nominal clearance between the enlarged hook tip
  and receiver lower edge. The physical lower-edge clearance remains subject to
  the printed hole height.
- Set `cap_clip_arm_reach_mm` to `15.5`. Relative to the current `12.7 mm` tip
  reach, the `2.8 mm` increase consists of the requested `2.0 mm` ledge extension
  plus the `0.8 mm` hook-height increase.
- Increase hook outward projection from `1.6 mm` to `2.0 mm`. With the unchanged
  `0.3 mm` inward arm clearance, effective receiver penetration becomes
  `1.7 mm`; the hook remains `1.85 mm` inside the measured `3.55 mm` printed
  wall and must not protrude through the exterior face.
- Keep hook width `12.0 mm`, arm thickness `2.4 mm`, arm position, compensated
  clamp coordinates, roof, skirt, and all four clamp sites unchanged.
- Derive the hook ledge, tip, arm reach, receiver clearances, and wall penetration
  from named cover-calibration values and bind them with assertions.

### Immutable Base And Validation

- Do not modify the base, receiver holes or catches, wall or floor geometry,
  cable passages, USB interface, ventilation, or exterior envelope. The source
  base remains unchanged even though the printed wall measurement is `3.55 mm`.
- Unit tests and conventional test-first work remain prohibited and not
  applicable.
- Run `git diff --check`, OpenSCAD assertions, bounded reference-free `assembly`
  and `printable_layout` validation, and focused source/diff inspection proving
  base-generating modules and dimensions did not change.
- Reprint only the top cover. Physically verify that all four hooks enter the
  existing holes, capture their upper edges by `2.0 mm`, remain clear of the
  lower edges, seat without wall deflection, remain removable, and survive at
  least 20 engagement/release cycles.
- Delivery remains DRAFT until those physical checks pass.

This iteration supersedes the prior `1.6 mm` projection, `1.2 mm` height,
`12.7 mm` arm reach, and zero physical ledge-capture margin below. All other
approved top-cover behavior remains unchanged.

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
