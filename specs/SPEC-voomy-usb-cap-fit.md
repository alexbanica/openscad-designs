# Voomy Power S7 USB Cap Fit

Status: Approved

## Iteration: Move Lower USB Tabs Upward For Bottom-First Insertion (2026-08-16)

### Purpose And Physical Evidence

Allow the USB cap to install without bending or forcing the rigid panel. On the
printed part, inserting the lower pair first leaves the upper pair striking the
unchanged base face rather than entering the `36.0 x 60.0 mm` opening.

### Corrected Cause

The four tabs currently form opposing upper and lower hook envelopes around the
full opening height. Once the lower pair is inserted, the short upper pair and
rigid panel cannot move far enough for the upper hooks to clear the top opening
edge. The previous reductions in tab thickness and hook engagement did not
change that four-way insertion envelope.

### Required Final Behavior

- Keep exactly four USB-cap tabs: two upper and two lower.
- Keep both upper tabs at their current X and Y positions, with their current
  shaft clearance, thickness, hook engagement, lead-in, width, and depth.
- Move the complete lower two tab geometries exactly `2.0 mm` upward toward the
  upper tabs. Move each lower shaft, hook, lead-in, and press feature together;
  do not distort or independently move subfeatures.
- Keep the two lower tabs otherwise identical to their current corrected shape.
- Preserve the `42.0 x 66.0 x 3.0 mm` solid panel and its installed position
  outside the unchanged front wall.
- Preserve the unchanged `36.0 x 60.0 mm` base opening, its position, the wall,
  and every other base feature.
- Add independent upper- and lower-tab position derivations and assertions that
  prove the upper pair did not move and the lower pair moved upward by exactly
  `2.0 mm`.

### Retention Consequence

Moving the lower pair upward by `2.0 mm` while keeping its present hook shape
places the lower hook tips inside the lower opening edge instead of behind it.
All four physical tabs remain, as requested, but the lower pair becomes the
bottom-first locating pair and the unchanged upper pair provides positive snap
retention. Restoring lower-edge hook engagement would require increasing the
lower hook projection by the same `2.0 mm`, recreating the insertion span and
defeating this requested correction.

### Validation And Delivery Boundary

- Unit tests and conventional test-first work remain prohibited and not
  applicable.
- Run `git diff --check`, OpenSCAD assertions, and bounded reference-free
  `assembly` and `printable_layout` renders or exports.
- Inspect that all four tabs remain connected and printable, the lower pair is
  exactly `2.0 mm` closer to the upper pair, the upper pair is unchanged, the
  panel remains outside the wall, and no base geometry changes.
- Reprint only the USB cap. Insert the lower pair first, rotate the panel toward
  the wall, and confirm the upper pair enters and snaps without bending the
  panel or threatening the base. Confirm the cap remains seated and removable.
- Delivery remains DRAFT until physical insertion, retention, removal, and
  repeated-cycle validation passes.

## Purpose

Correct the removable front USB cap that was too tight to insert while
preserving the already satisfactory case body and its USB opening.

## Requested Behavior

- Change only the USB cap geometry and its installed assembly placement.
- Do not change the base, front-wall opening, or any other case-body geometry.
- Allow all four cap clips to pass through the front opening.
- Retain positive hook engagement behind the base wall after insertion.

## Scope

- `designs/voomy_power_s7_cable_management_case.scad` USB-cap parameters,
  derived values, assertions, clip geometry, and installed-cap transform.
- README guidance for the corrected USB-cap interface.
- This completed-work spec and its matching plan.

## Out Of Scope

- Base or front-wall geometry changes.
- USB opening position or dimensions.
- Top-cap, cable-passage, ventilation, or power-strip-reference changes.
- Generated mesh files.

## Inputs And Constraints

The following dimensions were manually entered for this correction and are
provisional printable allowances rather than physical measurements:

- Existing unchanged base opening: `36.0 mm x 60.0 mm`.
- Existing unchanged front wall: `3.0 mm` thick.
- USB cap panel: `42.0 mm x 66.0 mm x 3.0 mm`.
- Revised USB clip shaft thickness: `1.6 mm`.
- Revised per-edge shaft clearance: `0.5 mm`.
- Revised hook engagement beyond the opening edge: `0.45 mm`.
- Revised hook lead-in depth: `1.0 mm` (less than a 45-degree ramp).
- Existing hook depth clearance behind the inner wall: `0.3 mm`.
- Four clips, each `8.0 mm` wide.

The design remains OpenSCAD 2021.01 compatible and keeps
`render_mode = "printable_layout"` as its source default.

## Cause Of The Failure

The prior cap gave each upper and lower clip shaft zero clearance at the
`60.0 mm` opening edges. Its `2.4 mm`-thick, short clips also projected their
hooks `0.8 mm` beyond each edge, requiring `1.6 mm` total compression during
insertion. In addition, the assembly transform placed the entire `3.0 mm` cap
panel within the `3.0 mm` base-wall depth, so the panel's overlap ring occupied
the same volume as the unchanged wall.

## Deterministic Behavior Delivered

- Each clip shaft stops `0.5 mm` inside its opening edge.
- Each clip is independently `1.6 mm` thick instead of inheriting the top-cap
  clamp thickness.
- Each lead-in reaches `0.45 mm` beyond the opening edge after the cleared
  shaft passes through and ramps over `1.0 mm` of insertion depth.
- Hook depth remains `0.3 mm` behind the inner wall face.
- The solid panel seats immediately outside the front wall, while its clips
  alone traverse the unchanged opening and wall.
- Assertions bind shaft clearance, hook engagement, panel seating, and hook
  depth to the unchanged base dimensions.

## Assumptions And Impact

The `0.5 mm` entry clearance, `1.6 mm` tab thickness, and `0.45 mm` hook are
expected to be more compliant and printable in the intended Bambu-compatible
workflow. Material shrinkage, layer orientation, elephant-foot effects, and
the user's physical print can still change the fit.

Only the USB cap needs to be reprinted. The base remains valid and unchanged.

## Validation Performed

- OpenSCAD 2021.01 reference-free printable-layout and assembly CSG generation
  completed with all contract assertions enabled.
- `git diff --check` completed successfully.

## Validation Skipped

- Unit tests and conventional test-first work are prohibited for this
  repository and were not applicable.
- Full mesh render, slicer inspection, physical insertion, retention pull,
  repeated clip cycling, and test printing were not performed.
- QA and code review were skipped by the requested super-agent workflow.

## Documentation Changes

The README now states the cap-only entry-clearance, compliance, engagement, and
outside-wall seating behavior.

## Delivery State

DRAFT until the revised cap is sliced, printed, inserted through the existing
base opening, and its four clips are confirmed to retain behind the base wall.
