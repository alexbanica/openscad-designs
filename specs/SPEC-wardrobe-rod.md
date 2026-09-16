# One-piece wardrobe rod

Status: Approved

Approval: User explicitly approved this specification in the conversation.

## Purpose and scope

Create one editable OpenSCAD design for a hollow PLA wardrobe rod spanning
existing holders. Include durable usage and printing guidance in README.md.
Exclude holder design, holder modification, joints, connectors, and load ratings.
Existing designs remain unchanged.

## Confirmed dimensions and decisions

All dimensions below are manually supplied by the user, not measured hardware:

| Parameter | Value |
| --- | --- |
| Clear distance between holders | 300 mm |
| Insertion into left holder | 10 mm |
| Insertion into right holder | 10 mm |
| Derived total rod length | 320 mm |
| Outside diameter, including ends | 22 mm |
| Radial wall thickness | 4 mm |
| Derived inside diameter | 14 mm |

Use one continuous circular tube with an open bore through both ends. No center
joint, reduced end diameter, end cap, adhesive connection, or retention feature
is included. Holder dimensions have not been measured; this scope models the
requested rod and does not establish socket fit or secure retention with 10 mm
engagement. The 10 mm engagement at each end is an explicit user choice.

## Geometry and render behavior

- Expose clear span, left/right insertion depths, outside diameter, and radial
  wall thickness as adjustable parameters. Derive total length and bore diameter.
- Assert positive span, outside diameter and wall thickness, nonnegative
  insertion depths, and a positive bore diameter.
- Default `render_mode` to `"printable_layout"`: one horizontal rod at 45 degrees
  in XY, with its lowest surface on Z=0, centered in XY. Preserve the circular
  section; do not flatten the underside or add integrated supports.
- Also expose `"assembly"` to show the same complete rod horizontally, without
  the print-layout rotation. No holders or electronics are modeled.
- Target OpenSCAD 2021.01, with no external libraries and one coherent `.scad`
  source. Follow repository parameter, derived-value, and module conventions.

## Printing and plate fit

Target the Bambu Lab P2S and PLA, compatible with AMS 2 Pro. Retain the user's
starting slicer settings: 0.20 mm layers, 5–6 walls, and 20–30% infill. The CAD
wall thickness is 4 mm independently of the slicer's wall count. Infill applies
to material regions, not to the modeled open bore.

The P2S manufacturer specification lists a 256 × 256 mm XY build area:
https://csm.bblcdn.com/hub/cb24b13a195541199f3f820270a7df3b.pdf

At 45 degrees, the nominal rod's XY footprint is
`(320 + 22) / sqrt(2) = 241.83 mm` on each axis. Centering leaves approximately
7.08 mm on each side before slicer-generated supports, brim, and reserved areas.
This establishes geometric plate fit, not a validated sliced print.

README guidance must require checking bed adhesion, horizontal tube overhangs,
bore bridging, and support removability in the slicer. Supports and adhesion
settings are slicer decisions; no support geometry is added to the source.
Do not claim support-free printing, physical fit, a safe clothing load, or
long-term resistance to PLA creep based on CAD validation.

## Acceptance and validation

- Nominal modeled rod is 320 mm long with 22 mm OD and 14 mm ID, without a seam
  or connector. Nominal insertion leaves the specified 300 mm exposed span.
- Printable layout contains exactly one continuous part, horizontal at 45
  degrees and resting on the build plane, within the nominal plate dimensions.
- Inspect bounded OpenSCAD printable-layout and assembly renders for continuity,
  open ends, orientation, and absence of unintended geometry. Stop any render
  exceeding 15 seconds; keep preview artifacts under `/tmp`.
- Run `git diff --check`. Unit tests and conventional test-first work are not
  applicable and must not be performed under repository instructions.
- Update README with dimensions, parameter and render-mode usage, plate-fit
  calculation, slicer starting settings, and the limits of modeled validation.
- Do not commit generated mesh exports. Slicer checks, physical holder fit,
  retention, and loaded endurance remain physical/user validation, not results
  established by this implementation.
