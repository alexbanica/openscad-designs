# SPEC: Linksys LGS105 Cable-Management Enclosure

Status: Approved

## Auto-Approved Super-Agent Correction: Raise Power Pass-Through (2026-07-23)

### Purpose And Requested Behavior

Raise the Linksys enclosure's power-head hole by `2.0 mm` after physical
inspection showed that the existing opening sits too low.

### Scope, Definitions, Inputs, And Constraints

- "Power hole in the cover" is interpreted as the existing bounded round
  opening through the bottom tray's power-side wall; the removable top-cover
  roof does not contain a power opening.
- Scope is limited to the power pass-through Z position, its representative
  rigid-head centerline, assertions, README guidance, and completed spec/plan
  records.
- Preserve the `10.0 mm` hole diameter, X position, wall penetration depth,
  enclosure outline, switch placement, top cover, retention, ventilation,
  cable guides, and all other geometry.

### Deterministic Behavior Delivered

- Add adjustable `power_pass_through_vertical_offset_mm = 2.0`.
- Derive the power pass-through center from the former switch-body centerline
  plus that offset, raising the default center from `15.4 mm` to `17.4 mm`
  above the print plane.
- Apply the same raised centerline to the power-head reference and assert both
  the derivation and the exact default center.

### Assumptions, Impact, And Residual Risk

- "Raise" means positive source Z in the installed enclosure orientation.
- The shifted `10.0 mm` hole remains fully bounded by the `31.0 mm` tray wall.
- Source geometry cannot prove alignment with the physical switch connector;
  a slicer check or test print remains authoritative.

### Validation And Documentation

- Short validation performed: `git diff --check` and one hidden-reference
  horizontal `assembly` export with a hard ten-second limit.
- Unit tests are prohibited. Full QA, independent code review, vertical and
  printable-layout renders, Bambu Studio inspection, printing, and physical
  connector alignment were skipped.
- `README.md` documents the adjustable `2.0 mm` offset and resulting default
  `17.4 mm` center height.
- Delivery remains `DRAFT` until the revised hole is sliced or printed and
  checked against the physical power connector.

## Auto-Approved Super-Agent Correction: 5.90 mm Round UTP Fit (2026-07-23)

### Purpose And Requested Behavior

Ensure that the normal round UTP cable fits through the enclosure after the user
provided a `5.90 mm` maximum diagonal/cross-sectional measurement, with an
explicit error margin for printed fit.

### Scope, Definitions, Inputs, And Constraints

- Treat the supplied `5.90 mm` diagonal as a conservative circular cable
  envelope, so the cable fits without depending on cross-section orientation.
- Use an adjustable minimum per-side fit allowance of `0.5 mm`.
- Scope includes the round uplink cable profile, its Ethernet-side lay-in slot,
  installed cover relief, representative internal route, assertions, README,
  and completed spec/plan records.
- Preserve the shared flat-cable slot, bounded power hole, aperture centers,
  cable count and lengths, walls, enclosure outline, cover retention, vents,
  feet, and all other behavior.

### Deterministic Behavior Delivered

- Change `uplink_cable_diameter_mm` from `4.0` to the measured `5.90`.
- Add `uplink_cable_fit_clearance_mm = 0.5` as the minimum allowed clearance on
  every side of the usable uplink passage.
- Increase the uplink lay-in slot from `6.0 mm x 6.0 mm` to
  `7.0 mm x 8.0 mm`; this yields `0.55 mm` nominal lateral clearance per side
  and `1.05 mm` vertical clearance per side around the centered measured
  envelope.
- Continue deriving the installed top-cover relief from the tray slot and use
  the `5.90 mm` profile for the complete representative internal route.
- Assert the calculated radial clearance and its exact default value.

### Assumptions, Impact, And Residual Risk

- "Diagonal" is interpreted as the largest cable cross-section. Modeling it as
  a circle is conservative for a non-circular jacket of the same diagonal.
- The slot is a lay-in passage for the cable jacket; an RJ45 plug is installed
  with the cover removed and is not required to pass through the `7.0 mm` slot.
- Nominal OpenSCAD clearance does not include printer-specific shrinkage,
  elephant foot, surface roughness, or measurement error beyond the selected
  margin. A printed fit check remains authoritative.

### Validation And Documentation

- Short validation performed: `git diff --check` and one hidden-reference
  horizontal `assembly` export, limited to the super-agent time budget.
- Unit tests are prohibited. Full QA, independent code review, vertical and
  printable-layout renders, slicer inspection, cable test coupon, printing, and
  physical cable fit were skipped.
- `README.md` documents the measured cable envelope, `7.0 mm x 8.0 mm`
  passage, nominal lateral/vertical clearances, and adjustable minimum
  allowance.
- Delivery remains `DRAFT` until the slot is sliced or printed and physically
  checked with the supplied cable.

## Auto-Approved Super-Agent Correction: Measured 89 mm Switch Span (2026-07-23)

### Purpose And Requested Behavior

Correct the enclosure after physical measurement showed that the switch body is
`89.0 mm` from its Ethernet face to its power face and does not fit the prior
`75.5 mm` default. Increase the corresponding enclosure dimension and retain
positive fit room around the measured body.

### Scope, Definitions, Inputs, And Constraints

- The user-described switch "width" maps to source Y (`switch_depth_mm`), not
  source X: the existing source-X body width is already `121.0 mm` and its
  derived enclosure width is `127.0 mm`.
- `89.0 mm` is a manually entered, user-provided physical measurement of the
  switch body from the Ethernet face to the opposite power face.
- Preserve the established `0.6 mm` clearance at both ends, providing `1.2 mm`
  total extra room and a `90.2 mm` switch-bay allocation along that axis.
- Cable storage, switch X width and height, side/top clearances, wall thickness,
  power-hole relationship, routing guides, cover retention, vents, feet, and
  all other adjustable values remain unchanged.

### Deterministic Behavior Delivered

- Change `switch_depth_mm` from `75.5` to `89.0`.
- Continue deriving the switch origin and enclosure outline from the measured
  body plus both `0.6 mm` end clearances and the existing walls; the default
  outer enclosure depth becomes `167.0 mm`.
- Derive and assert a `90.2 mm` switch-bay allocation, the shifted power wall
  and pass-through reference, shifted top-vent bounds, and a default printable
  layout of `255.5 mm x 186.5 mm`.
- Preserve the `25.2 mm` rigid power-head reference protrusion because the
  switch power face and enclosure power wall move together.

### Assumptions, Impact, And Residual Risk

- The reported `89 mm` dimension is assumed to be the body span that replaces
  the undersized `75.5 mm` Ethernet-to-power default. Changing the already
  larger source-X dimension to `89 mm` would shrink the enclosure and would not
  resolve the reported non-fit.
- The larger tray and cover require reprinting; this is not compatible with the
  prior `153.5 mm`-deep printed tray or cover.
- Nominal source clearance does not prove printed fit. Printer calibration,
  corner radii, and measurement uncertainty still require a physical test fit.

### Validation And Documentation

- Short validation performed: `git diff --check` and one hidden-reference
  horizontal `assembly` export, limited to the super-agent time budget.
- Unit tests are prohibited. Full QA, independent code review, vertical and
  printable-layout renders, slicer inspection, reprinting, and physical fit
  validation were skipped.
- `README.md` documents the measured `89.0 mm` span, `90.2 mm` bay allocation,
  `167.0 mm` enclosure depth, and updated printable-layout bounds.
- Delivery remains `DRAFT` until the enlarged enclosure is sliced, printed, and
  physically fitted to the measured switch.

## Auto-Approved Super-Agent Correction: Receiver Relief And Catch Reach (2026-07-23)

### Purpose And Requested Behavior

Correct the replacement top cover after physical inspection showed that its
four locating-skirt openings do not pass over the unchanged bottom-tray female
socket receivers and its two catches still do not click into their unchanged
tray windows.

### Scope, Definitions, Inputs, And Constraints

- Scope is limited to top-cover receiver-relief clearance, tapered catch
  lead-in reach, their assertions, the Linksys README section, and completed
  spec/plan records.
- "`0.5 mm` on each side" means adding a dedicated `0.5 mm` radial/per-side
  calibration allowance beyond the existing `cover_fit_clearance_mm`, so every
  boss/web relief is `1.0 mm` larger overall than the preceding opening.
- "Clamp height" is implemented as an additional `1.0 mm` of top-cover tapered
  catch lead-in reach. The positive-capture ledge, engagement height,
  interference, flexure section, and unchanged tray windows do not move.
- Bottom-tray geometry, socket receivers, pin centers and sizes, cover roof,
  enclosure depth, cable apertures, vents, feet, and all other behavior remain
  unchanged.

### Deterministic Behavior Delivered

- Add adjustable `cover_receiver_relief_extra_clearance_mm = 0.5` and derive
  both receiver-boss and wall-web top-cover reliefs from the existing fit
  clearance plus this additional per-side allowance.
- Increase `cover_latch_lead_in_reach_allowance_mm` from `1.0 mm` to `2.0 mm`,
  adding the requested `1.0 mm` only to the tapered catch entry.
- Assert the complete combined receiver-relief clearance and preserve the
  existing catch-window entry, non-bottoming, capture, and release invariants.

### Assumptions, Impact, And Residual Risk

- The physical obstruction is the top-cover locating skirt around the complete
  female receiver boss/web, not pin-to-socket alignment or the DC power hole.
- Extending only the tapered catch entry is the smallest change consistent with
  tray reuse; changing `cover_latch_engagement_height_mm` would also move the
  tray shoulder/window geometry.
- The new values are physical-fit calibration inputs, not proven final
  tolerances. Only a newly printed cover fitted to the existing tray can confirm
  seating and positive catch engagement.

### Validation And Documentation

- Short validation performed: `git diff --check` and one hidden-reference
  horizontal `assembly` export, each limited to the super-agent time budget.
- Unit tests are prohibited. Full QA, independent code review, vertical and
  printable-layout renders, slicer inspection, test printing, physical seating,
  and latch-cycle validation were skipped.
- `README.md` documents the new `0.5 mm` per-side receiver relief and `2.0 mm`
  catch lead-in default.
- Delivery remains `DRAFT` until the revised top cover is sliced, printed,
  seated on the existing tray, and both catches are physically cycled.

## Auto-Approved Super-Agent Correction: Physical Cover-Flip X Alignment (2026-07-23)

### Purpose And Requested Behavior

Correct the still-misaligned top-cover Ethernet cable reliefs reported after the
previous top-cover fit change. The printed cover must align with the unchanged
bottom tray when it is physically turned over for installation.

### Scope, Definitions, Inputs, And Constraints

- Scope is limited to the removable cover's two Ethernet skirt reliefs, the
  assembly-preview transform, corresponding assertions, this spec and plan, and
  the Linksys README section.
- "Physical cover flip" means a `180` degree rotation around Y, followed by an X
  translation of `enclosure_outer_width_mm`. This keeps the Ethernet and power
  edges on their original Y sides while reversing cover-local X.
- Tray-local aperture centers remain `uplink_aperture_x_mm = 45.0` and
  `device_aperture_x_mm = 75.0`; no new physical measurements are introduced.
- Bottom-tray geometry, cable profiles, aperture widths/heights, cover roof,
  receiver reliefs, pins, catches, depth, vents, feet, and printable orientation
  are out of scope and remain unchanged.

### Deterministic Behavior Delivered

- Each printable cover-local relief center is derived as
  `enclosure_outer_width_mm - tray_aperture_x_mm`.
- The assembly preview uses the same physically achievable Y-axis rotation and
  X/Z translations required to install the roof-face-down printed cover.
- Installed relief centers are derived by applying that transform and asserted
  equal to the unchanged tray aperture centers and widths.
- Installed pin and catch envelopes are asserted after the same X reversal so
  the transform cannot make prior mating assertions pass only in local cover
  coordinates.

### Assumptions And Impact

- The cover is installed by rotating it side-to-side around Y, not by flipping
  it front-to-back around X.
- Only a replacement top cover must be printed; the existing tray remains the
  physical reference.
- OpenSCAD geometry can establish nominal alignment but cannot prove printed
  dimensional accuracy or fit.

### Validation And Documentation

- Short validation performed: `git diff --check` and one hidden-reference
  horizontal `assembly` export, limited to ten seconds.
- Unit tests are prohibited and were not run. Full QA, independent code review,
  vertical renders, printable-layout render, Bambu Studio inspection, test
  printing, existing-tray fitting, and latch cycling were skipped by the
  explicitly requested super-agent workflow.
- `README.md` documents the physical installation rotation and cover-local X
  mapping.
- Delivery remains `DRAFT` pending slicer and physical fit validation.

## Iteration: Top-Cover Physical Fit Corrections (2026-07-23)

### Purpose And Reported Bugs

A physical fit attempt exposed three defects in the removable top cover:

1. the two top-cover cable reliefs do not align with the corresponding openings
   in the bottom tray;
2. the top-cover locating skirt collides with the bottom-tray female alignment
   socket geometry, so the cover cannot lower to its seated position; and
3. the two top-cover positive catches do not reach the existing capture windows
   in the bottom tray.

This iteration is limited to top-cover production geometry. The already printed
bottom tray must remain reusable without cutting, drilling, or reprinting it.
Because the only plural cable openings that meet the removable cover are the
round-uplink and shared flat-device Ethernet lay-in slots, "back cable holes" is
defined here as those two Ethernet-side openings. The bounded round power hole
remains a tray-only opening and is not changed by this iteration.

### Final Behavior Added By This Iteration

- Preserve the complete bottom-tray solid and cut geometry, including its outer
  dimensions, both Ethernet lay-in slots, round power hole, four female
  alignment sockets and their wall-connecting webs, two catch release/capture
  windows, vents, vertical-foot interfaces, and cable-routing features.
- Correct the two top-cover skirt reliefs so their installed X positions, usable
  widths, and complete wall-to-skirt Y passages are derived from the same uplink
  and device-aperture envelopes used by the bottom tray. Because physical
  installation rotates the printable cover `180` degrees around Y, cover-local X
  is `enclosure_outer_width_mm - tray_aperture_x_mm`; installed X must equal the
  unchanged tray coordinate rather than the raw printable coordinate.
- Keep the top-cover roof intact above the two lay-in slots so it closes their
  open tops, while ensuring the skirt and roof do not reduce or pinch the
  approved `7.0 mm x 8.0 mm` uplink envelope or `8.0 mm x 7.0 mm` device-bundle
  envelope when installed.
- Replace each boss-only circular skirt relief with top-cover relief geometry
  that clears the complete corresponding tray receiver: the female socket boss,
  its wall-connecting structural web, and `cover_fit_clearance_mm` around their
  installed overlap. Local reliefs may open through the skirt toward the nearby
  perimeter; they must not cut through the exterior roof.
- Preserve all four tapered alignment pins and their current center positions,
  diameters, taper, insertion depth, and alignment-only role. Each pin must
  remain coaxial with its existing tray socket after the skirt relief changes.
- Make the cover's fully seated datum explicit: the exterior roof remains
  aligned to the tray outline and the roof underside reaches the top of the tray
  wall without any skirt-to-socket, skirt-to-web, pin-to-socket-wall, or
  catch-to-wall collision preventing settlement.
- Preserve the existing two tray capture windows and their shoulders. Correct
  only the top-cover catches so each catch enters its existing window and snaps
  behind its existing shoulder when the cover reaches the seated datum.
- Add an adjustable top-cover catch lead-in/reach allowance with a default of
  `1.0 mm`. This extends the tapered entry portion into the existing window
  beyond the current nominal reach without moving the positive-capture ledge,
  changing the tray window, or weakening the roof-rooted flexure section.
- Preserve the approved `12.0 mm` flexure length, `2.0 mm` flexure thickness,
  `1.6 mm` engagement height, `0.15 mm` positive interference, opposed outward
  release direction, and tool-free release behavior unless the catch lead-in
  cannot be extended independently; any need to change those approved values
  requires another spec amendment.
- Derive and assert the installed cover/tray mating envelopes so slot alignment,
  complete receiver clearance, pin/socket coaxiality, catch-window entry, and
  positive shoulder capture cannot be satisfied only by visual coincidence.

### Preserved Behavior And Scope Boundary

- Preserve the approved `153.5 mm` tray and cover depth, `3.0 mm` power-side
  extension, switch clearance, `10.0 mm` power pass-through, `25.2 mm` external
  rigid-head reference, exactly-three-aperture contract, cable storage,
  hourglass guides, ventilation, switch retention, detachable vertical feet,
  horizontal and vertical placement, and printable layout.
- Preserve the top cover as one connected, independently printable object with
  its broad exterior roof face on the print bed in `top_cover` and
  `printable_layout` modes.
- Do not modify bottom-tray geometry to accommodate the revised cover. Source
  refactoring may name or expose the tray's existing mating envelopes for shared
  calculations and assertions, but rendered bottom-tray geometry must remain
  unchanged.
- Do not add a cover opening around the round power pass-through, change cable
  sizes, add cable-service apertures, move sockets or tray catch windows, or
  change enclosure depth.
- Only the Linksys SCAD source, this spec, its separate plan, and the Linksys
  README section are in scope. Generated mesh or preview artifacts remain out of
  source control.

### Constraints, Assumptions, And Impact

- The `1.0 mm` extra catch reach is a proposed printable calibration default,
  not a measured dimension from the failed print. It must remain adjustable and
  must fit within the existing `6.0 mm`-high tray release window without
  bottoming out or blocking tool-free release.
- The reported inability to settle the cover is treated as a collision with the
  complete female socket receiver, including its structural web, rather than as
  evidence that socket or pin centers should move.
- OpenSCAD inspection can prove nominal alignment, clearance, and engagement but
  cannot prove the printed fit, latch force, fatigue life, or dimensional
  accuracy. The existing tray and a newly printed cover remain the authoritative
  physical compatibility check.
- The implementation remains `DRAFT` until the revised cover is sliced, printed,
  fully seated on the existing tray, and cycled through engagement and release.

### Acceptance And Validation Delta

- An assembly section through each Ethernet lay-in slot shows one continuous
  cable passage across the tray wall and cover skirt with no X or Y step, and the
  installed roof closes the slot without entering its usable cable envelope.
- The installed top-cover skirt has positive `cover_fit_clearance_mm` from every
  complete female socket boss and wall-connecting web; no skirt material blocks
  vertical settlement.
- The four cover pins remain coaxial with and enter the four unchanged female
  sockets while the roof underside reaches the tray-wall top datum.
- Both revised catch lead-ins enter the two unchanged tray windows. Each
  unchanged capture ledge snaps behind its window shoulder with the approved
  `0.15 mm` positive interference, and the added reach does not bottom out in the
  window or obstruct inward tool-free release.
- OpenSCAD assertions cover shared tray/cover aperture coordinates, complete
  receiver-to-skirt clearance, pin/socket alignment, catch/window intersection,
  shoulder capture, and in-window reach bounds.
- Bounded hidden-reference renders of horizontal `assembly`, left and right
  vertical `assembly`, and `printable_layout` complete within `15` seconds.
  Inspection confirms a fully seated cover, aligned cable passages, four engaged
  alignment pairs, two engaged catches, connected printable geometry, and no
  regression to apertures, vents, feet, switch clearance, or the shortened
  outline.
- `git diff --check` passes, and no generated render or mesh is tracked.
- Physical validation reuses the current tray and prints only the revised top
  cover. The cover must lower vertically to the tray-wall datum without forced
  flexing, both Ethernet passages must align without pinching representative
  cables, all four pins must enter, both catches must audibly or visibly engage,
  and ten tool-free release/reinstall cycles must leave the cover and catches
  intact. Until this check passes, delivery remains `DRAFT`.
- `README.md` documents the corrected top-cover-only fit, the `1.0 mm` adjustable
  catch-reach default, reuse of the unchanged tray, and the remaining slicer and
  physical-fit limitations.

## Iteration: Minimal Power-Side Cover Depth (2026-07-22)

### Purpose And Requested Delta

Remove the remaining unused enclosure and cover length behind the switch. The
power side has no hardware connector other than the DC lead, and the approved
`10.0 mm` round pass-through now allows the approximately `9.0 mm` power head and
its rigid `28.20 mm` section to pass through the wall instead of occupying an
internal rear service space.

The current default power-side cover edge is `27.7 mm` behind the switch power
face (`178.2 mm - 150.5 mm`). That distance is controlled by cover-retention
geometry rather than by the switch or power connector and must no longer set the
enclosure depth.

### Final Behavior Added By This Iteration

- Move the complete power-side tray wall and the matching top-cover edge to the
  smallest direct switch-fit depth:
  `switch_origin_y_mm + switch_depth_mm + switch_end_clearance_mm +
  wall_thickness_mm`.
- With the approved defaults, set the outer enclosure and cover depth to
  `153.5 mm`, leaving exactly `3.0 mm` beyond the switch power face: `0.6 mm`
  internal switch-end clearance plus the `2.4 mm` power wall.
- Keep the power wall continuous except for the approved bounded round power
  aperture. Preserve its `10.0 mm` default diameter, approximately `9.0 mm`
  reference head, `21.0 mm` visual-right offset, body-center Z alignment, and
  printed-hole calibration controls.
- Model the installed `28.20 mm` rigid head from the switch power face through
  the power wall. At the new default depth, `25.2 mm` of that rigid reference
  extends beyond the exterior wall and remains straight.
- Remove every depth dependency on a rear service cavity, rear catch-release
  aisle, or rear cover-pin boss. Cover-retention geometry must fit within the
  new `153.5 mm` outline and must not increase the power-side depth.
- Preserve four tapered alignment pins and matching female sockets, but allow
  the power-side pair to move from their previous Y positions. They are cover
  alignment features, not external switch sockets, and may overlap the switch
  footprint in XY only when their complete Z envelopes remain clear of the
  switch and its removal path.
- Preserve two positive, tool-free PLA-oriented cover catches. Relocate or
  reorient them as needed so their complete flexure, engagement, and release
  geometry remains inside the shortened outline, clears the switch, power hole,
  cables, vents, alignment sockets, and vertical-support interfaces, and does
  not depend on pin friction for retention.
- Shorten the bottom tray, top cover, cover skirt, rear wall, top vents,
  stabilizer-foot placement, and printable-layout bounds together. Do not crop
  only the top cover or leave a mismatched tray extension.

### Preserved Behavior And Overrides

- Preserve switch fit and removal, exactly three cable-service apertures, the
  two Ethernet lay-in slots, the round power-head pass-through, cable storage,
  hourglass guides, `15.0 mm` minimum cable centerline bend radius, ventilation,
  horizontal and both vertical orientations, detachable feet, render modes, and
  Bambu Lab-friendly printable orientation.
- Preserve the existing pin diameters, tapered tips, socket clearance, catch
  flexure section, engagement, interference, and release-access defaults unless
  a later approved iteration explicitly changes those retention values.
- This iteration overrides the earlier requirement to keep the rear alignment
  pin/socket pair and opposed catches at their existing Y locations. Their count
  and retention roles remain unchanged, but their placement must follow the
  shortened outline.
- No additional rear hardware socket, connector cavity, or cable-bend allowance
  may be introduced. The external AC adapter remains outside the enclosure.

### Constraints, Assumptions, And Impact

- The `153.5 mm` default depth assumes the approved `75.5 mm` switch depth,
  `0.6 mm` power-side clearance, and `2.4 mm` wall. Adjusting those inputs may
  change the derived enclosure depth.
- The shortened rear region makes cover retention more tightly coupled to the
  switch-height and removal-path keepouts. Retention geometry must be derived
  and asserted rather than placed using stale absolute Y positions.
- Relocated alignment sockets may sit above the switch footprint only if they do
  not touch the switch, obstruct insertion/removal, weaken the power wall, or
  create unsupported printable geometry.
- Rendered geometry can establish nominal clearance and engagement, but physical
  latch force, printed-hole fit, switch insertion, fatigue, and thermal behavior
  still require a test print and hardware validation.

### Acceptance And Validation Delta

- The default outer tray and cover depth is exactly `153.5 mm`, and the exterior
  power wall is exactly `3.0 mm` behind the switch power face.
- The tray and top cover share the same shortened power-side outline with no
  unused rear cover shelf or tray extension.
- The `28.20 mm` rigid power-head reference starts at the switch input, passes
  through the `10.0 mm` round hole, protrudes `25.2 mm` beyond the exterior wall,
  and does not bend.
- All four alignment pins/sockets and both positive catches remain connected,
  accessible, non-intersecting, and within the shortened enclosure bounds.
- The switch reference does not intersect relocated retention geometry and has a
  clear installation and removal path with the cover removed.
- Horizontal assembly, both vertical assemblies, and printable layout render
  within the repository's `15`-second limit. Geometry inspection confirms intact
  power-wall material, unobstructed apertures and vents, stable feet, connected
  printable parts, and the expected reduced layout depth.
- `README.md` documents the `153.5 mm` outer depth, `3.0 mm` rear extension,
  `25.2 mm` external rigid-head length, relocated cover retention, and the
  remaining slicer, test-print, and physical-fit limitations.

## Iteration: Compact Power-Head Pass-Through And Hourglass Guides (2026-07-22)

### Purpose And Requested Delta

Correct two physical-fit problems reported from the current enclosure:

- the rigid part of the installed DC adapter extends `28.20 mm` beyond the part
  inserted into the switch, so keeping the complete rigid head inside the rear
  service cavity wastes enclosure depth and still leaves poor routing clearance;
- the straight cylindrical cable-routing guides are too large near the tray's
  female cover-pin sockets, preventing the cables and their connected ends from
  fitting comfortably around the guides.

### Final Behavior Added By This Iteration

- Replace the power-side open-topped lay-in slot with one round, bounded
  pass-through hole through the power wall.
- Size the default power hole to `10.0 mm` diameter for the user-measured
  approximately `9.0 mm` power head, providing `0.5 mm` nominal radial clearance
  while keeping the diameter adjustable for printed-hole calibration.
- Align the hole with the switch's DC input: its center is `21.0 mm` inward from
  the switch's visual right margin when looking directly at the exterior power
  face, and its vertical center follows the switch power-input/body centerline.
  Because source X is defined from the Ethernet-side view, exterior power-face
  visual right maps toward lower X: the default center is derived as
  `switch_origin_x_mm + 21.0 mm`, not from the switch's maximum-X edge. The
  default vertical center is `switch_origin_z_mm + switch_height_mm / 2`.
- Allow the rigid `28.20 mm` power head and cable to pass partly through the
  power wall and remain outside the enclosure. The external AC adapter remains
  outside and the design does not require the rigid head to bend.
- Remove the adapter-length-derived `30.0 mm` rear service cavity. Reduce the
  default enclosure depth to the smallest derived power-side clearance that
  preserves switch fit, the complete positive-catch release geometry, rear
  cover-pin sockets, wall continuity, ventilation, and printable support-foot
  interfaces. The new default outer depth must be strictly less than the current
  `183.5 mm` outer depth.
- Replace each approximately `34.8 mm` diameter straight cylindrical routing
  guide with a mild hourglass guide. The default maximum diameter at the lower
  and upper retaining shoulders is `28.0 mm`, and the deliberately fat waist is
  `26.0 mm` diameter rather than a sharply narrowed hourglass stem.
- Use smooth, support-free transitions between each `26.0 mm` waist and
  `28.0 mm` shoulder. The complete guide remains joined to the tray floor,
  printable upright, and free of sharp cable-contact edges.
- Preserve at least the existing `15.0 mm` cable centerline bend radius for both
  the round uplink and flat device bundle. Guide-solid radius and cable
  centerline bend radius must therefore be modeled as distinct derived values.
- Keep the four existing alignment pin/socket locations and the two positive
  cover catches. The reduced guide envelope must visibly clear the female tray
  sockets and leave usable cable space around them.

### Preserved Behavior And Impact

- Preserve exactly three cable-service apertures: two Ethernet lay-in slots and
  one round DC power-head pass-through hole.
- Preserve switch fit and retention, Ethernet cable counts and profiles, cable
  storage, the uplink/device divider, ventilation, cover retention, stabilizer
  feet, horizontal and vertical placement, render modes, printable layout, and
  Bambu Lab P2S/AMS 2 Pro compatibility except where the reduced depth requires
  derived repositioning.
- Recalculate rear cover-retention, stabilizer-foot, vent, route-preview, and
  printable-layout positions from the reduced enclosure depth; do not retain
  stale absolute Y positions.
- Treat `10.0 mm` as a printable starting diameter. A test coupon or physical
  fit check may require adjustment for the actual printer and power head.

### Validation And Documentation Delta

- Render and visually inspect the permitted horizontal assembly, both vertical
  assemblies, and printable layout within the repository's `15`-second limits.
- Confirm the power hole is a real round through-hole, is on the visual right at
  the measured `21.0 mm` center offset, aligns vertically with the switch power
  input, and accepts the `9.0 mm` reference envelope without requiring the
  `28.20 mm` rigid length to remain inside.
- Confirm both hourglass guides clear all female tray sockets, remain connected
  and support-free, and preserve the `15.0 mm` minimum cable centerline radius.
- Update `README.md` with the measured power-head dimensions and offset, power
  insertion procedure, reduced-depth behavior, hourglass defaults, calibration
  warning, and revised three-aperture contract.

## Super-Agent Iteration: PLA-Friendly Cover Pins And Catches (2026-07-21)

### Purpose And Requested Behavior

Correct the printed-cover retention geometry after the user identified that the
alignment pins ended in expansions larger than their rigid receiver holes and
that the positive snap catches were too slender for confident PLA handling.

### Scope And Deterministic Behavior Delivered

- Preserve the skirt and four pin/socket locations as cover-alignment features.
- Remove the enlarged pin detents completely; cover retention remains the job of
  the two opposed positive catches.
- Keep each alignment pin at `4.0 mm` diameter, add a `3.2 mm` tip diameter and
  `0.8 mm` taper, and retain the `4.5 mm` socket diameter derived from the
  existing `0.25 mm` radial clearance.
- Strengthen each PLA-oriented positive catch by changing the flexure defaults
  from `8.0 mm x 1.2 mm` to `12.0 mm x 2.0 mm`.
- Increase the engagement height from `1.2 mm` to `1.6 mm`, the release width
  from `14.0 mm` to `16.0 mm`, and the release height from `5.0 mm` to `6.0 mm`.
- Reduce insertion interference from `0.20 mm` to `0.15 mm` to lower the force
  required to seat and release brittle PLA while preserving geometric capture.
- Preserve switch fit, feet, three cable-service apertures, ventilation,
  horizontal/vertical placement, render modes, and printable layout.

### Constraints, Assumptions, And Impact

- The change targets PLA but does not certify a filament, layer orientation,
  slicer profile, insertion force, or fatigue life.
- The tapered pins are alignment-only and must never be treated as retention
  barbs; the catches provide positive cover capture.
- The larger catch section trades some flexibility for impact resistance, while
  the longer flexure and reduced interference limit local bending strain.

### Validation And Documentation

- Short validation is limited to `git diff --check` and a lightweight OpenSCAD
  syntax/CSG export under the super-agent workflow.
- Full OFF rendering, visual QA, slicer inspection, test printing, insertion-force
  checks, and the ten-cycle latch test are skipped for this direct iteration.
- `README.md` documents the tapered alignment pins and revised PLA-oriented catch
  defaults.

## Iteration: Vertical Placement And Positive Cover Retention (2026-07-21)

This iteration preserves the approved switch fit, cable-storage behavior,
exactly-three-aperture contract, round-uplink and flat-device cable geometry,
ventilation intent, horizontal use, serviceability, and Bambu Lab printing
constraints while adding a reduced-footprint tabletop orientation:

- the assembled enclosure may stand on either long tray side, never on the
  Ethernet-side or power-side cable wall;
- two identical, detachable, tool-free stabilizer feet support the tray in the
  vertical orientation without becoming permanent enclosure parts;
- the feet keep the downward-facing side ventilation clear of the tabletop and
  leave all three cable-service apertures unobstructed;
- the default vertical bounding footprint is narrower than the default
  horizontal bounding footprint;
- the cover uses positive, releasable snap capture rather than depending only on
  friction, so gravity, stored cable pressure, and ordinary cable handling do not
  dislodge it when the enclosure is vertical;
- horizontal tabletop use remains available with the stabilizer feet removed;
- rendered geometry can establish alignment and plausible engagement, but a
  printed retention and stability check is required before vertical use is
  treated as physically validated.

## Iteration: Flat Device Cables And Lay-In Connector Access (2026-07-21)

This iteration preserves the approved two-part enclosure, switch arrangement,
three-aperture contract, cable lengths, ventilation, render modes, and printing
constraints while refining the Ethernet cable geometry:

- the single uplink remains a conventional round CAT6 cable;
- the four device cables are flat CAT6 cables associated with EAN
  `7432022397395` and share one device-bundle aperture;
- the four flat device cables are treated as one stacked or compact bundle, not
  as four separately routed enclosure exits;
- RJ45 connector bodies do not have to pass through a closed cable-size hole;
  the removable cover is the opening mechanism, allowing each connector to be
  placed inside and connected before its cable jacket is laid into the
  open-topped slot;
- cable previews, aperture sizing, routing evidence, parameter names, and
  documentation must distinguish the round uplink from the flat device cables.

## Purpose

Create a printable enclosure for a Linksys LGS105 five-port unmanaged Ethernet
switch that hides excess Ethernet cable, keeps the switch fixed in position,
provides exactly three cable-service apertures, maintains passive airflow, and
supports stable horizontal or reduced-footprint vertical tabletop placement.

## Problem

The switch uses one Ethernet cable as its uplink and four Ethernet cables for
connected devices. The cables are longer than the immediately visible runs need
to be, leaving an unwanted bundle next to the exposed switch. A normal close-fit
switch case would not provide enough internal space or suitable bend control for
the excess cable.

The enclosure must therefore combine a protected switch compartment with an
internal cable-storage compartment. It must allow only the required cable length
to leave the enclosure while keeping the remaining cable organized, must not
allow the switch to slide or lift during normal cable handling, and must not
block the switch's passive ventilation.

## Scope

- Add one editable OpenSCAD 2021.01-compatible source for the complete enclosure.
- Model a two-part enclosure consisting of a bottom tray and removable top cover.
- Add two identical detachable stabilizer feet for optional vertical tabletop
  placement while keeping the serviceable enclosure itself a bottom tray and top
  cover.
- Provide a dedicated switch compartment and an adjacent cable-storage
  compartment on the Ethernet-port side.
- Fix the switch horizontally and vertically without modifying the metal switch
  body.
- Provide exactly three cable-service apertures:
  - one round power-head pass-through aperture on the power-input side,
  - one uplink Ethernet cable aperture on the Ethernet side,
  - one shared device-cable aperture for four Ethernet cables beside the uplink
    aperture on the same side.
- Provide adjustable cable-routing guides and usable storage for the stated
  Ethernet cable set.
- Provide real ventilation openings through the enclosure while keeping the
  switch's own ventilation paths clear.
- Provide assembly, individual-part, and printable-layout render modes.
- Document parameters, assumptions, printing guidance, assembly, and validation
  in `README.md`.

## Out Of Scope

- Modifying the Linksys switch, its power adapter, or any Ethernet cable.
- Providing electrical shielding, water resistance, dust sealing, strain-relief
  certification, or fire-resistance certification.
- Supporting PoE switches or Linksys models other than the LGS105.
- Storing the external AC power adapter inside the enclosure.
- Wall-mounting hardware in the initial design.
- Standing the enclosure on the Ethernet-side or power-side wall, where it could
  obstruct or load the cable-service apertures.
- Generated STL, STEP, 3MF, OFF, or other mesh exports in source control.
- Guaranteeing physical fit without checking the actual switch and cables.

## Definitions

- **Ethernet side:** the side of the switch containing all five RJ45 ports and
  their status indicators.
- **Power side:** the side opposite the Ethernet ports containing the DC power
  input.
- **Uplink:** the single Ethernet cable connecting the switch to the upstream
  router or network.
- **Device bundle:** the four Ethernet cables connecting the other four switch
  ports to local devices. In the default design these are flat cables gathered
  into one shared enclosure exit.
- **Cable-service aperture:** one of the three intentional enclosure-wall
  openings through which a power or Ethernet cable exits. Ventilation openings
  do not count as cable-service apertures.
- **Lay-in aperture:** an open-topped tray-wall slot that accepts a cable without
  passing its connector through the wall; the installed top cover closes the
  open side and turns it into a bounded pass-through opening.
- **Power-head pass-through aperture:** the bounded round opening in the power
  wall through which the approximately `9.0 mm` DC head can be inserted, allowing
  part of its rigid length and cable to remain outside the enclosure.
- **Connector access mechanism:** removal of the complete top cover, which opens
  both Ethernet lay-in slots and exposes the switch ports so RJ45 heads can be
  placed inside the enclosure without fitting through a cable-size wall opening.
- **Cable-storage compartment:** the enclosed volume adjacent to the Ethernet
  ports where excess cable is routed around bend guides.
- **Necessary exposed length:** the cable length the user leaves outside the
  enclosure to reach the connected device. The remainder stays inside.
- **Horizontal placement:** normal use with the tray floor parallel to the
  tabletop and the top cover facing upward.
- **Vertical placement:** reduced-footprint tabletop use with either long tray
  side facing downward, the Ethernet and power walls remaining upright, and the
  top cover perpendicular to the tabletop.
- **Stabilizer foot:** one of two identical detachable printed supports that
  engages the bottom tray, broadens the vertical support base, and creates an
  airflow gap below the downward-facing side wall without retaining the cover.
- **Positive cover retention:** a releasable geometric catch with a matching
  shoulder or undercut that must elastically disengage before the cover can be
  removed; plain surface friction or an uncaptured interference pin alone does
  not satisfy this definition.

## Research Sources And Hardware Identification

- Linksys documents two LGS105 versions:
  - v1: `121 mm x 75.5 mm x 26 mm`, `5 V DC / 1.0 A`;
  - v2: `120 mm x 88 mm x 26 mm`, `12 V / 0.5 A`.
- The user-provided EAN `4260184663453` is associated by multiple product
  listings with product code `LGS105-EU` and the original approximately
  `121 mm x 75 mm x 26 mm` enclosure.
- Some retailer data for the same EAN contains later-revision power or dimension
  values. The design therefore uses the v1-size body as its default planning
  assumption while keeping switch dimensions adjustable and requiring a physical
  pre-print check.
- The user-provided cable EAN `7432022397395` is associated with a REXLIS flat
  CAT6 cable listing that reports a `6 mm x 1.4 mm` cable cross-section. The
  listing is not manufacturer mechanical documentation and does not provide a
  reliable RJ45 head or molded-boot envelope, so the cable cross-section remains
  an adjustable planning input requiring measurement.
- Sources:
  - <https://support.linksys.com/kb/article/5017-en/>
  - <https://www.toppreise.ch/preisvergleich/Switches-1000-MBit/LINKSYS-LGS105-p404462>
  - <https://www.photopoint.ee/en/networking/6393107-linksys-lgs105-5-port-switch>
  - <https://www.bol.com/nl/nl/p/0-5m-cat6-ultra-dunne-flat-ethernet-netwerk-lan-kabel-zwart/9200000088464010/>

## User-Provided And Manually Entered Dimensions

The following values were supplied manually by the user and must be documented
as design inputs:

- Ethernet cable count: exactly five connected cables.
- Uplink count: one cable.
- Device cable count: four cables.
- Device cable profile: four flat CAT6 cables associated with EAN
  `7432022397395`.
- Uplink cable profile: one conventional round CAT6 cable.
- Cable lengths: four flat device cables at `250 mm` each and one round uplink
  cable at `500 mm`.
- Total connected Ethernet cable length: `1500 mm`.
- Uplink and device cables leave from the same enclosure side.
- Power leaves from the opposite enclosure side.
- Rigid DC adapter length beyond the inserted portion: `28.20 mm`.
- Maximum measured DC power-head diameter: approximately `9.0 mm`.
- DC input center: `21.0 mm` inward from the switch's visual right margin when
  looking directly at the exterior power face.

The user identified the device cables as flat and supplied the round uplink's
maximum cross-sectional diagonal, but did not provide measured RJ45 head or
molded-boot dimensions. Current adjustable cable inputs are:

- Round uplink cable maximum diagonal:
  `uplink_cable_diameter_mm = 5.90`.
- Round uplink minimum fit allowance:
  `uplink_cable_fit_clearance_mm = 0.5` per side.
- Flat device cable width: `device_cable_width_mm = 6.0`.
- Flat device cable thickness: `device_cable_thickness_mm = 1.4`.
- Uplink aperture usable width and height: `7.0 mm x 8.0 mm`, providing
  `0.55 mm` nominal lateral clearance and `1.05 mm` nominal vertical clearance
  per side around the centered `5.90 mm` cable envelope.
- Shared four-device-cable aperture usable width and height:
  `8.0 mm x 7.0 mm`, supporting a default four-cable stack of
  `6.0 mm x 5.6 mm` with clearance.
- Minimum routing-guide bend radius: `15.0 mm`.
- Power-head pass-through diameter: `10.0 mm`, an adjustable starting value
  providing `0.5 mm` nominal radial clearance around the measured head.
- Hourglass routing-guide shoulder diameter: `28.0 mm`.
- Hourglass routing-guide waist diameter: `26.0 mm`.
- Switch fit clearance on each horizontal side: `0.6 mm`.
- Switch fit clearance above the body: `0.8 mm`.

The user requested vertical tabletop placement and secure cover retention but
did not provide stand or latch dimensions. Initial adjustable planning
assumptions are:

- Stabilizer-foot count: exactly two identical feet.
- Default vertical support-base width:
  `vertical_support_base_width_mm = 60.0`.
- Each stabilizer foot's along-enclosure contact length:
  `vertical_support_foot_length_mm = 18.0`.
- Minimum tabletop airflow gap below the downward-facing side wall:
  `vertical_vent_gap_mm = 3.0`.
- Stabilizer-foot fit clearance:
  `vertical_support_fit_clearance_mm = 0.30`.
- Positive cover-catch interference:
  `cover_latch_interference_mm = 0.15`.

These support and latch values are printable starting assumptions, not measured
retention-force or stability guarantees. They must remain adjustable and require
a test print with the intended material and slicer settings.

These assumptions are not vendor-certified measurements. The actual switch
width, depth, height, both cable profiles, cable behavior, and RJ45 head and boot
clearances must be checked before relying on the default fit. All manually
entered or assumed dimensions must remain user-adjustable near the top of the
source.

## Inputs And Constraints

- Target OpenSCAD 2021.01 syntax with no external library dependency.
- Keep the coherent enclosure in one editable `.scad` source file.
- Use descriptive `snake_case` names and `_mm` suffixes for linear dimensions.
- Keep user-adjustable parameters grouped by purpose and derived values in a
  separate section.
- Default switch body dimensions are `121.0 mm x 89.0 mm x 26.0 mm`; the
  `89.0 mm` Ethernet-to-power span is the user-provided physical measurement
  that supersedes the initial retailer-derived `75.5 mm` assumption.
- The source coordinate convention must clearly state which axis represents
  switch width, switch depth from Ethernet side to power side, and height.
- The enclosure must fit a Bambu Lab P2S build plate in every individual-part
  and printable-layout mode.
- Every printable part must be separate, non-floating, and oriented with its
  broadest stable face on the print plane.
- The top cover must be removable for switch installation, cable connection,
  cable winding, and later service.
- Vertical placement must use two detachable support feet engaging the bottom
  tray. It must not rely on balancing the bare enclosure on a cable wall or on an
  unsupported narrow side edge.
- The same two support feet must fit either long tray side without blocking a
  service aperture, vent opening, LED sightline, cover release point, or cover
  removal path.
- Cover retention must include positive, tool-free snap engagement independent
  of the stabilizer feet, switch body, and cables.
- Ethernet connectors must be installed with the top removed and must not pass
  through a cable-size opening. The DC head is intentionally inserted through
  its separate `10.0 mm` round power aperture.
- With the cover removed, both Ethernet cable slots must be open from above so an
  RJ45 head can be placed inside the enclosure and the attached jacket can then
  be lowered into its slot.
- No default cable route may require a bend tighter than the adjustable minimum
  bend radius.
- Ventilation must preserve continuous material around the enclosure perimeter,
  cover-retention features, switch-retention features, and cable apertures.

## Deterministic Behavior

### Overall Arrangement

- The switch sits in a close-fit compartment with its Ethernet ports facing the
  internal cable-storage compartment.
- The external wall beyond the cable-storage compartment is the Ethernet-side
  enclosure wall.
- The uplink and shared device-bundle apertures are adjacent openings in that
  Ethernet-side enclosure wall.
- The round power aperture is aligned with the DC input on the opposite enclosure
  wall, `21.0 mm` inward from the switch's visual right margin and vertically on
  the switch power-input/body centerline.
- The default exterior is functional and simplified rather than a cosmetic copy
  of the Linksys metal housing.

### Exactly Three Cable-Service Apertures

- The enclosure has exactly three cable-service apertures in its default
  assembled configuration.
- Each aperture is a real pass-through opening through its wall, not a recess or
  a subtraction that terminates inside wall material.
- The two Ethernet apertures use lay-in tray-wall slots closed by the installed
  top cover. The power aperture is a permanently bounded round through-hole.
- The uplink aperture retains the one round uplink cable without sharing its
  opening with device cables.
- The device aperture accommodates all four flat device cables as one stacked or
  controlled compact bundle without crushing them; it does not create four
  separate enclosure exits.
- The installed cover and its locating skirt provide relief above both Ethernet
  slots so they close the open side without reducing the approved usable cable
  envelopes.
- The `10.0 mm` power aperture passes the approximately `9.0 mm` DC head and
  allows some or all of its `28.20 mm` rigid external length to remain beyond the
  enclosure wall.
- Vent holes are permitted in addition to these three service apertures and are
  visually and functionally distinct from them.

### Switch Retention

- The tray provides a flat switch support floor and adjustable perimeter stops
  or rails that prevent movement along both horizontal axes.
- Retention features must not depend on adhesives, screws driven into the
  switch, or modification of the metal housing.
- The top cover provides adjustable downward retention pads or rails with
  positive clearance so the switch cannot lift out during ordinary cable
  handling but is not clamped hard enough to deform or scratch it.
- Retention features must not cover the RJ45 ports, DC input, LEDs, or the
  switch's own ventilation openings.
- The switch remains removable after the top cover is removed.

### Cable Storage And Routing

- The cable-storage compartment includes multiple smooth, rounded routing guides
  positioned to support loops rather than sharp folds.
- Routing guides use the adjustable minimum bend radius and have no cable-contact
  edge sharper than the modeled rounding allowance.
- Both routing guides use a mild `28.0 mm` shoulder / `26.0 mm` waist hourglass
  profile, clear the female cover-pin sockets, and retain cables without reducing
  either cable route below its `15.0 mm` centerline bend radius.
- Representative routing distinguishes one round uplink from four flat device
  cables and does not render all five cables as round cylinders.
- The storage area supports routing the stated five connected cables with a
  combined maximum length of `1500 mm`, while allowing any required portion of
  each cable to remain outside.
- Storage does not require every cable to be wound to the same exposed length.
- The user can pull out the necessary length for each run and route the remaining
  slack around the internal guides before closing the cover.
- A divider or guide boundary separates the single uplink path from the
  four-device bundle near their external apertures so the two exits remain
  identifiable.
- The cover prevents loosely routed cable loops from rising out of the storage
  compartment during normal use.
- The design does not pinch, kink, or apply a hard edge to an Ethernet cable at
  an exit.

### Cover And Serviceability

- The enclosure has a removable, tool-free top cover aligned by the existing
  skirt/pin interface and retained by at least two opposed printable positive
  snap catches with adjustable fit and interference.
- Each positive catch engages a matching shoulder or undercut; cover retention
  must not depend solely on smooth-pin friction.
- The catches keep the cover fully seated when the enclosure is horizontal or
  standing vertically on either long side, including under gravity, stored cable
  pressure, and ordinary cable handling.
- Cover removal requires a deliberate tool-free release action but must not
  require destructive flexing or permanent deformation.
- The cover retention is independent of the switch body and cables.
- With the cover removed, the switch, all RJ45 plugs, the power connector, the
  complete cable-storage area, both Ethernet lay-in apertures, and the round power
  pass-through are accessible.
- The open cover state is the connector access mechanism: RJ45 heads are placed
  inside and connected before the cable jackets are lowered into the uplink and
  shared-device slots.
- With the cover installed, the switch and stored cable bundle are visually
  covered while the three service apertures remain usable.
- The design includes a visible status-light window or sightline aligned with
  the Ethernet-side LED region so link/activity state can be checked without
  removing the cover.

### Vertical Tabletop Placement

- Two identical detachable stabilizer feet engage only the bottom tray and are
  positioned apart along the enclosure depth to resist rocking and tipping.
- The same feet support either long tray side as the downward-facing side; the
  user does not need separate left-side and right-side variants.
- The default stabilizer-foot geometry provides a `60.0 mm` support-base width,
  which is less than the default enclosure width and therefore reduces the
  vertical orientation's bounding tabletop footprint relative to horizontal
  placement.
- The feet provide at least `3.0 mm` clear airflow space below the downward-facing
  side wall and do not overlap any side ventilation opening.
- The feet, tray, and cover have no tabletop collision in the vertical assembly,
  and the enclosure cannot rest on or transfer its weight through an Ethernet or
  power cable.
- The Ethernet and power walls remain upright and fully accessible, and their
  three cable-service apertures retain their approved usable envelopes.
- The stabilizer feet remain attached during ordinary repositioning but are
  removable without tools so the unmodified horizontal placement remains
  available.

### Ventilation

- The bottom tray and top cover include adjustable, real pass-through
  ventilation openings that create a passive low-to-high airflow path around the
  fanless metal switch.
- Default vents must not be blocked by the switch-retention rails or cable guide
  posts.
- The switch compartment and cable compartment must not form an airtight
  partition; air can move between them without adding a fourth cable-service
  aperture.
- Vent openings must keep clear of cable-contact paths so cable loops cannot be
  forced through them during normal assembly.
- Default vent placement preserves cover strength and continuous material around
  retention features and corners.
- In vertical placement, the downward-facing side vents retain the configured
  tabletop airflow gap, the upward-facing side vents remain unobstructed, and
  neither the support interfaces nor positive cover catches interrupt the
  passive airflow path.

### Render Modes

- `assembly`: assembled enclosure with simplified switch and cable-route
  references available through visibility toggles and an adjustable horizontal
  or vertical placement orientation.
- `bottom_tray`: printable bottom tray only, stable face on the print plane.
- `top_cover`: printable top cover only, oriented with its broadest stable face
  on the print plane.
- `cable_routing_preview`: enclosure reference showing the three aperture paths,
  switch keepout, minimum bend guides, and representative cable loops.
- `vertical_support_foot`: one printable detachable stabilizer foot, oriented on
  its broadest stable face.
- `printable_layout`: bottom tray, top cover, and two stabilizer-foot instances
  separated with no overlap, floating objects, or electronic reference geometry.

## Adjustable Parameter Groups

The source must expose at least these groups near the top:

- Render controls and reference-visibility toggles.
- Switch body dimensions and fit clearances.
- Tray, wall, floor, cover, and corner dimensions.
- Switch retention rails, stops, and vertical pads.
- Cable count, round-uplink diameter, flat-device width and thickness, total
  storage allowance, and minimum bend radius.
- Cable-storage compartment depth and routing-guide geometry.
- Routing-guide shoulder diameter, waist diameter, height profile, and derived
  cable centerline radii.
- Uplink and device-bundle aperture dimensions and positions, plus power-head
  diameter, clearance, visual-right offset, and vertical position.
- LED sightline dimensions and position.
- Bottom, side, and top ventilation dimensions, counts, spacing, and offsets.
- Cover-retention geometry and fit clearance.
- Positive cover-latch interference, flexure, engagement, and release geometry.
- Vertical-support base width, foot length, vent gap, fit clearance, and assembly
  orientation.
- Printable-layout spacing and preview colors.

## Assumptions

- EAN `4260184663453` originally supported a researched
  `121.0 mm x 75.5 mm x 26.0 mm` body envelope, but the user-measured unit has
  an `89.0 mm` Ethernet-to-power span and that measurement now controls the
  default.
- The actual unit may differ from both retailer data and the current measured
  sample, so physical dimensions remain authoritative.
- The DC input is on the side opposite the five Ethernet ports.
- All five Ethernet ports can be used simultaneously: one uplink and four device
  connections.
- The `500 mm` round cable is the uplink; the four `250 mm` flat cables form the
  device bundle.
- The cables are flexible enough to follow a `15.0 mm` default minimum bend
  radius, subject to measurement and physical validation.
- Horizontal and vertical tabletop placement are required; wall mounting is not
  required.
- Two small detachable support feet are acceptable additions to the existing
  two-part serviceable enclosure.
- The AC adapter remains outside the enclosure.
- The approximately `9.0 mm` DC head can be passed through a default `10.0 mm`
  printed hole; printer calibration and the actual maximum head diameter may
  require adjustment.
- The user will arrange cables with the cover removed rather than pulling RJ45
  connector bodies through finished apertures.

## Regression And Risk Considerations

- An incorrect hardware-version assumption can prevent the switch from fitting;
  adjustable dimensions and a physical measurement checkpoint mitigate but do
  not eliminate this risk.
- Cable jackets and molded boots vary substantially. The default apertures may
  need tuning even though the removable-cover lay-in mechanism avoids passing
  RJ45 heads through them.
- The researched flat-cable cross-section is retailer data, not a measured
  sample or manufacturer drawing; the actual four-cable bundle can require a
  different stacking orientation or aperture clearance.
- Packing the full stated cable length depends on actual cable thickness,
  stiffness, and necessary exposed run lengths.
- Tight cable routing can damage performance or cable life; minimum bend radius
  and rounded guide surfaces are hard acceptance criteria.
- Shrinking the rear cavity can collide with positive catches, cover-pin sockets,
  support feet, vents, or the switch. The reduced depth must be derived from all
  of those keepouts rather than from the power-head length alone.
- A printed `10.0 mm` hole may be undersized, and the measured power head may not
  be perfectly circular; a physical insertion test remains required.
- Confusing visual right on the exterior power face with source-coordinate right
  when viewed from the Ethernet face can mirror the power hole away from the DC
  input; the coordinate conversion and preview must be checked explicitly.
- Excessively open ventilation can weaken the cover, while insufficient airflow
  can retain heat. Default patterns must balance open area and continuous
  structure.
- A close vertical retention fit can press on the metal enclosure or obstruct
  its vents; default top pads require positive clearance and a physical fit
  check.
- Openings that exist in source logic may still fail to pierce rendered walls;
  rendered inspection of every service aperture and vent is required.
- A single large printable tray may approach practical print-time and warping
  limits even if it fits the Bambu Lab P2S plate.
- A support base that is too narrow can allow tipping, while an unnecessarily
  wide base defeats the requested space saving. The default `60.0 mm` base is an
  adjustable starting point and requires a populated physical stability check.
- Printed snap retention varies by material, layer orientation, dimensional
  accuracy, and wear. Adjustable catch interference and deliberate flexure
  geometry reduce but do not eliminate the need for a repeated-use test print.
- A vertical support interface or foot placed over a side vent can invalidate
  passive-airflow assumptions; source assertions and vertical assembly inspection
  must preserve the full vent openings and the configured tabletop gap.
- Adding two feet to `printable_layout` can cause overlap or exceed the build
  plate even when the tray and cover still fit; final layout bounds must include
  all four printable objects.

## Acceptance Criteria

- A proposed OpenSCAD source can represent the v1-size LGS105 default envelope
  and exposes its dimensions for tuning.
- The assembled enclosure visibly contains separate switch and cable-storage
  regions.
- The switch is constrained in X, Y, and Z while remaining removable after the
  cover is removed.
- The default assembly has exactly three cable-service apertures: power, uplink,
  and four-cable device bundle.
- Uplink and device-bundle apertures are adjacent on the Ethernet side; power is
  on the opposite side.
- All three service apertures visibly pass completely through their enclosure
  walls and remain bounded when the cover is installed.
- The power aperture is a round `10.0 mm` default hole centered `21.0 mm` inward
  from the switch's visual right margin and vertically aligned with the switch
  power-input/body centerline.
- The approximately `9.0 mm` power head can pass through the power hole, the
  rigid `28.20 mm` section may remain partly outside, and no bend of that rigid
  section is required.
- The default outer enclosure depth is strictly less than the current
  `183.5 mm` while preserving all rear retention, wall, vent, and support
  keepouts.
- The five Ethernet cables can be connected and laid into their apertures without
  passing RJ45 plug bodies through the openings.
- The four flat device cables share one lay-in aperture and are not represented
  as four separate cable-service holes.
- With the cover removed, RJ45 heads fit into the exposed assembly area and the
  attached cable jackets can be lowered into the open-topped slots.
- Representative routing models four flat `250 mm` device cables and one round
  `500 mm` uplink cable, uses smooth guides, and has no bend tighter than the
  configured minimum radius.
- Both guides have smooth, printable mild-hourglass profiles with default
  `28.0 mm` shoulders and a `26.0 mm` waist, clear the female tray cover-pin
  sockets, and preserve the configured cable centerline bend radius.
- Stored cable is covered in the assembled mode, while individually adjustable
  external cable lengths can remain outside.
- Status LEDs remain observable without opening the enclosure.
- Bottom and top or side ventilation openings visibly pass through their walls,
  do not collide with retention features, and provide an airflow path around the
  switch.
- The assembled enclosure can stand on either long side using the same two
  stabilizer feet while both cable walls and all three service apertures remain
  clear of the tabletop.
- The default vertical bounding footprint is strictly smaller than the default
  horizontal bounding footprint, and the support-base width is less than the
  enclosure's horizontal width.
- Both downward-facing side-vent configurations retain at least the configured
  `3.0 mm` tabletop airflow gap, and neither foot covers a vent opening.
- At least two opposed positive snap catches geometrically capture the installed
  cover; gravity alone cannot disengage the cover in horizontal or either
  permitted vertical orientation.
- `bottom_tray`, `top_cover`, `vertical_support_foot`, and `printable_layout`
  contain only independently printable, non-floating geometry with stable
  print-plane contact; `printable_layout` contains one tray, one cover, and two
  separated foot instances.
- No generated mesh artifact is added to source control.

## Validation Plan

- Run `git diff --check`.
- Run OpenSCAD syntax/render checks with a maximum of 15 seconds per render for:
  - horizontal `assembly` with electronic references hidden,
  - vertical `assembly` with electronic references hidden,
  - `printable_layout` with electronic references hidden.
- Inspect the `bottom_tray`, `top_cover`, `vertical_support_foot`, and
  `cable_routing_preview` mode selection and module wiring in source without
  rendering those modes, in accordance with the repository's render
  restrictions.
- Export temporary inspection artifacts only under `/tmp`.
- Visually inspect that:
  - the switch envelope does not intersect tray, cover, or retention geometry;
  - retention exists in all three axes and does not block service areas;
  - all three cable-service apertures fully pierce their walls;
  - the cover closes the open side of both Ethernet lay-in apertures without
    pinching their cable envelope;
  - the round power aperture is mirrored correctly from the exterior power-face
    measurement, passes the power-head reference, and remains clear of the cover;
  - the shared device aperture fits a four-flat-cable bundle and remains open
    from above with the cover removed;
  - the cover and skirt do not pinch the round uplink or flat device bundle;
  - representative flat and round cables follow the configured minimum bend
    radius;
  - the hourglass guide shoulders and waist clear all cover-pin sockets and have
    no unsupported or floating geometry;
  - ventilation openings are real, unobstructed, and structurally separated;
  - each positive cover catch visibly engages a matching capture shoulder and
    exposes a deliberate release path;
  - both vertical-side configurations keep feet, cover, tray, vents, and cable
    apertures free of collisions;
  - the feet provide the configured vent gap and are spaced along the enclosure
    depth to resist rocking;
  - printable parts are separated, stable, and contain no reference electronics.
- Confirm through derived values or assertions that the default vertical
  bounding footprint is smaller than the default horizontal footprint, the feet
  do not intersect side-vent keepouts, and all four printable objects fit the
  configured Bambu Lab P2S plate.
- Measure the actual switch, round cable diameter, flat cable width/thickness,
  RJ45 head/boot envelope, power-head maximum diameter, and printed power-hole
  diameter before final printing.
- Inspect the sliced parts in Bambu Studio for build-plate fit, unsupported
  bridges, wall continuity, and practical print orientation.
- Perform a physical test fit and low-temperature operational observation before
  treating airflow and retention as validated.
- On a padded surface, test the populated printed enclosure for at least 60
  seconds on each long side with both feet installed, then perform ordinary
  cable repositioning. The feet must remain engaged, the enclosure must not rock
  or tip, cables must remain unloaded by the tabletop, and the cover must remain
  fully caught.
- Release and reinstall the cover at least ten times; the catches must remain
  tool-free, intact, and positively engaged. Until these physical checks pass,
  vertical stability and anti-drop cover retention remain unvalidated and the
  implementation delivery is draft.

## Documentation Needs

Update `README.md` to document:

- the new design file and supported LGS105 default body assumption;
- the EAN/version ambiguity and required physical measurement check;
- the three cable-service apertures and their side assignment;
- the round power-head pass-through, `28.20 mm` rigid length, approximately
  `9.0 mm` head diameter, `21.0 mm` visual-right offset, and calibration warning;
- switch retention and service procedure;
- cable-storage capacity, cable-length inputs, bend-radius controls, and routing
  procedure;
- the smaller mild-hourglass guide geometry and its cover-socket clearance;
- round-uplink and flat-device cable parameters, the single shared device exit,
  and removable-cover connector insertion procedure;
- ventilation strategy and keepouts;
- horizontal and vertical placement, support-foot installation on either long
  side, reduced-footprint limits, and the prohibition on standing on a cable
  wall;
- positive cover-catch engagement, tool-free release, tuning parameters, and
  the physical anti-drop/repeated-use validation procedure;
- render modes and relevant OpenSCAD commands;
- Bambu Lab P2S/AMS 2 Pro printing and slicer guidance;
- the limitation that rendered inspection cannot replace physical measurement,
  thermal observation, slicer inspection, or a test print.
