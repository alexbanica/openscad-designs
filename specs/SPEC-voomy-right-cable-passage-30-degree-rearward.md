# SPEC: Voomy Right Cable Passage 30 Degrees Rearward

Status: Approved

## Purpose And Requested Behavior

Move the Voomy enclosure's right cable passage away from the exact right-hand
midpoint and place its center `30.0 deg` farther toward the back of the
enclosure. Preserve the previously corrected see-through opening.

## Scope

- Add an adjustable right-passage center angle with a `30.0 deg` default.
- Rotate the complete bottom and full-height passage profiles around the right
  semicircular wall.
- Redirect the optional cable references toward the relocated passage.
- Update only the Voomy cable-routing guidance in `README.md`.

## Out Of Scope

- Passage width, vertical extent, floor termination, edge treatment, cap, rear
  passage, USB interface, ventilation, retention, fixed envelope, or power-strip
  placement.
- The separate Proposed adjustable-USB-height and top-cap-ventilation iteration
  in `specs/SPEC-voomy-power-s7-cable-management-case.md`.
- Generated mesh or preview artifacts in source control.

## Definitions And Orientation

- `0 deg` is the exact visual-right midpoint of the right semicircular wall.
- Positive passage angles rotate toward the rear (`+Y`) when viewed from above.
- The right semicircle spans strictly between `-90 deg` at the front tangent and
  `+90 deg` at the rear tangent.

## Manually Entered Dimensions

| Dimension | Delivered value | Basis |
| --- | ---: | --- |
| Right-passage center angle | `30.0 deg` | User supplied |
| Existing passage tangential width | `20.0 mm` | Preserved user-supplied value |

## Inputs And Constraints

- `right_passage_center_angle_deg = 30.0` is an adjustable cable-interface
  parameter near the top of the OpenSCAD source.
- The widened bottom profile must remain entirely within the right semicircle.
- The corrected outer chord for each passage profile must continue beyond the
  curved exterior surface so no thin wall membrane returns.
- OpenSCAD 2021.01 compatibility, the `210.0 x 210.0 x 110.0 mm` fixed exterior,
  and Bambu Lab P2S/AMS 2 Pro compatibility remain unchanged.
- Unit tests and conventional test-first work are prohibited and not applicable.

## Deterministic Behavior Delivered

- The right passage center is `30.0 deg` rearward from exact visual right.
- Both the widened bottom edge and full-height passage rotate about the same
  center angle.
- The passage retains its `20.0 mm` outer tangential width, full wall height,
  interior-floor termination, and cable-contact edge treatment.
- Both outer cut chords still terminate beyond the curved exterior wall.
- Optional cable references run from the power-strip side toward the relocated
  passage rather than the former exact-right location.
- The rear passage and every unrelated printable feature remain unchanged.

## Assumptions

- "30 degrees more towards the back" means `+30.0 deg` from exact visual right,
  not `30.0 deg` measured forward from the rear tangent.
- Updating the optional cable references is required to keep preview routing
  consistent with the printed opening.

## Impact And Documentation

- Production behavior changes only in
  `designs/voomy_power_s7_cable_management_case.scad`.
- The Voomy README section documents the angle origin, rearward-positive
  direction, new default, and adjustable parameter.
- This approved completed-work artifact does not approve or modify the separate
  Proposed Voomy iteration already present in the worktree.

## Validation Performed

- `git diff --check` passed for tracked changes.
- Reference-free `printable_layout` CSG evaluation passed with all assertions.
- Reference-free `assembly` CSG evaluation passed with all assertions.
- `assembly` CSG evaluation with optional cable references enabled passed.

## Validation Skipped

- Code review and QA were skipped by the requested super-agent workflow.
- Unit tests and conventional test-first work were skipped as prohibited.
- Slicer inspection, test printing, physical cable routing, and confirmation of
  rear-wall/tangent clearance on a printed enclosure were not performed.
- Delivery remains DRAFT pending physical and slicer validation.
