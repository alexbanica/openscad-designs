# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes. At updated planning time, the known planned changes are:

- `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`,
- this implementation plan,
- `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- `README.md`.

## Affected Files

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Do not edit existing reference source files unless implementation discovers a syntax-level import issue that directly blocks the approved enclosure; if that happens, stop and request plan amendment before changing them.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- current repository instructions,
- existing local reference models and README sections needed to match style and derive local coordinate assumptions,
- `designs/waveshare_eth_usb_hub_hat.scad` as the source of truth for Waveshare connector spacing and default component dimensions,
- the measured/default values already captured in the approved spec,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad` implementation.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- map each acceptance criterion from the approved spec to either `designs/pi_zero_usb_grove_ir_enclosure.scad` or `README.md`,
- implement against that checklist,
- review the final diff against the same checklist.

## Implementation Steps

1. Inspect the current `designs/pi_zero_usb_grove_ir_enclosure.scad`, the approved spec, and only the reference files needed for coordinate/module names:
   - `pi_zero.scad`,
   - `waveshare_eth_usb_hub_hat.scad`,
   - `seeed_grove_base_hat_zero.scad`,
   - `grove_infrared_emitter.scad`.
2. Preserve the existing enclosure file structure, render modes, local `use` imports, and named-module approach unless a direct change is required by the approved spec.
3. Keep or add grouped `Adjustable Parameters` for:
   - render controls,
   - stack dimensions and offsets,
   - enclosure wall/floor/cover dimensions,
   - Pi Zero stack mounting standoffs,
   - clip-on top cover latch/catch features,
   - port cutout dimensions and offsets,
   - external IR emitter pod dimensions and attachment interface,
   - IR emitter pod board mount,
   - IR LED aperture,
   - main-to-pod Grove cable path,
   - top ventilation/access hole pattern,
   - anti-slide recesses/feet,
   - tolerances and print clearances,
   - printable layout,
   - visual settings.
4. Preserve independent board spacing controls. The current source already provides:
   - `pi_zero_to_waveshare_hat_z_offset_mm = 11.2`,
   - `waveshare_to_grove_hat_z_offset_mm = 10.8`.
5. Use the requested `waveshare_to_grove_hat_z_offset_mm = 10.8` default, keep it adjustable, and document that users should increase it if physical measurement or preview inspection shows collision in `assembly` or `electronics` render modes.
6. Refactor `Derived Values` so all board-tier Z positions derive from:
   - `pi_zero_bottom_z_mm`,
   - `pi_zero_to_waveshare_hat_z_offset_mm`,
   - `waveshare_to_grove_hat_z_offset_mm`,
   - the adjustable measured stack/headroom parameters.
7. Replace fixed absolute board-tier port Z centers with local offsets plus derived board-tier Z positions:
   - Pi Zero port cutout centers derive from `pi_zero_bottom_z_mm` plus Pi Zero-local adjustable offsets,
   - Waveshare RJ45/front USB-A/side USB-A cutout centers derive from `waveshare_hat_bottom_z_mm` plus Waveshare-local adjustable offsets.
8. Keep each port local Z offset independently adjustable for physical calibration.
9. Replace the existing internal Grove cable path with a main-to-pod Grove cable route:
   - start from the selected Grove Base Hat connector area using Grove-HAT-relative X/Y/Z values and adjustable local offsets,
   - pass through a dedicated main enclosure cable exit opening,
   - align with a matching cable entry opening in the external IR emitter pod,
   - end at the Grove connector clearance area on the IR emitter PCB inside the pod,
   - keep cable exit/entry dimensions and clearances adjustable.
10. Remove the Grove IR emitter PCB mount from the main enclosure tray. The main tray must retain only the board-stack standoffs, clip/catch receiver features, anti-slide features, and port cutouts.
11. Add or refactor the external IR emitter pod printable part with adjustable:
    - pod outer dimensions,
    - wall/floor/cover or shell dimensions,
    - placement relative to the main enclosure,
    - attachment side and offsets,
    - cable entry opening,
    - IR LED aperture,
    - Grove IR emitter PCB mount position and rotation,
    - printed PCB locating/support geometry,
    - printed PCB slide-in retention geometry,
    - optional separate printed retainer dimensions and tolerances only if a separate part is still needed for the tool-free retention path.
12. Refactor the IR pod attachment so it is mounted to the removable `top_cover` rather than to `bottom_tray`.
13. Implement the IR pod attachment as a top-cover-owned tool-free positive-retention interface by default. If a slide-and-lock approach is used, keep rails, slots, stops, and retention bumps fully merged into the top-cover printable body and fully supported in the printable orientation. If a latch-and-tab approach is used instead, keep it fully merged into `top_cover`, independent from the cover-to-tray clip/catch features, and suitable for repeated hand assembly without screws.
14. Keep pod attachment features independent from Pi Zero stack mounting holes and from the top-cover clip/catch features that connect the cover to `bottom_tray`.
15. Add or refactor IR emitter pod placement values so the emitter PCB reference model, pod board locating/support geometry, pod printed retainer geometry, pod cable entry, LED aperture, and related guide volumes derive from the same adjustable pod/emitter pose:
    - pod placement relative to the main enclosure,
    - emitter board center X/Y/Z inside the pod,
    - emitter board rotation,
    - PCB dimensions,
    - LED local offset/axis values,
    - Grove connector/cable clearance local values.
16. Ensure changing the pod or emitter pose changes all dependent emitter features together:
    - electronics/reference preview,
    - pod printable part placement in assembly,
    - pod board retention geometry,
    - pod cable entry,
    - LED aperture,
    - IR guide/cutout geometry,
    - Grove cable path endpoint.
17. Replace the current internal screw-driving pod mount with a tool-free slide-in PCB retention method:
    - keep adjustable locating/support features under or around the PCB,
    - define a deterministic board insertion direction that allows the Grove IR emitter PCB to be installed with the Grove cable already connected,
    - preserve enough cable-entry and internal bend clearance that normal installation does not pinch the cable or require an immediate sharp bend at the connector,
    - use printed stops, rails, spring tabs, or a snap retainer as needed, but do not require screw fastening or screwdriver access inside the pod,
    - if a separate printed retainer remains useful, keep it explicitly tied to the slide-in retention scheme and document it as an intentional secondary printable part,
    - ensure the pod body has a visible service opening, slot, ledge, snap pocket, or equivalent feature that makes the separate retainer's installation path understandable by geometry inspection.
18. Ensure the IR LED aperture is subtracted as a true pass-through opening in the printable pod body itself, not only represented by guide geometry or electronics-preview overlap, so it remains open in `ir_pod`, `assembly`, and `printable_layout` even when `show_electronics = false`.
19. Strengthen the clip-on detachable top-cover interface:
    - keep the no-cover-screws requirement,
    - keep the cover independently removable from board-stack fasteners and pod fasteners,
    - move the cover-to-tray retention from the two long sides to the two short ends of the enclosure,
    - ensure short-end cover clip tabs, hooks, rails, latches, or equivalent features are fully merged into the cover shell with visibly supported roots,
    - ensure matching short-end tray receivers/latches are fully merged into tray end walls or fixed tray structure,
    - add or refactor support geometry so the cover-to-tray interface provides positive retention on both short ends and does not read as detached floating geometry,
    - preserve clearance from the Pi Zero microSD/camera end cutouts and keep enough material near corners and end-wall openings for printable strength,
    - keep clip/catch dimensions, count, side placement, and tolerances adjustable.
20. Refactor the top-cover-owned pod attachment geometry so it is easy to mount and unmount by hand:
    - make the pod insertion/removal direction obvious by code structure and geometry review,
    - ensure the cover-owned pod rails, clips, or latches are visibly load-bearing and not attached only by a token overlap,
    - keep enough surrounding material around the pod attachment to preserve top-cover printability and repeated-use confidence,
    - keep the pod-to-cover interface tool-free and screw-free for normal assembly.
21. Increase the default top-cover ventilation/access hole density:
    - keep a symmetric circular grid over the board-stack area,
    - expose adjustable hole count, diameter, spacing, and X/Y offset,
    - change the default pattern from the current sparse layout to a denser layout that still preserves roof strength and edge margin by code review,
    - avoid overlap with clip/catch features, tray support geometry, and pod attachment structure.
22. Remove the external cutout for the Pi Zero Micro USB port that is internally occupied by the Pi Zero-to-Waveshare adapter connection.
23. Preserve the remaining externally used Pi Zero Micro USB opening and keep its dimensions and local offsets adjustable.
24. Recompute enclosure internal/case height so it remains at least high enough for:
    - Pi Zero standoff height,
    - Grove HAT derived Z position,
    - Grove HAT top-side connector/cable clearance,
    - internal Grove connector/cable exit clearance,
    - extra upward headroom.
25. Preserve render dispatch for:
   - `assembly`,
   - `bottom_tray`,
   - `top_cover`,
   - `ir_pod`,
   - `printable_layout`,
   - `electronics`.
26. Preserve or update named modules for:
   - `pi_zero_usb_grove_ir_enclosure_assembly(...)`,
   - `pi_zero_usb_grove_ir_bottom_tray()`,
   - `pi_zero_usb_grove_ir_top_cover()`,
   - `pi_zero_usb_grove_ir_ir_pod()`,
   - `pi_zero_usb_grove_ir_printable_layout()`,
   - `pi_zero_usb_grove_ir_electronics_reference(...)`,
   - board stack standoffs,
   - clip-on top-cover tabs/catches,
   - port cutout volumes,
   - IR emitter pod and pod board mount,
   - IR LED aperture,
   - main-to-pod Grove cable path guide,
   - top ventilation/access holes,
   - anti-slide features,
   - reusable helper geometry.
27. Default stack placement must remain:
   - Pi Zero at the bottom,
   - Waveshare HAT above the Pi Zero,
   - Grove Base HAT above the Waveshare HAT,
   - Grove IR emitter mounted inside the external pod attached to the main enclosure, with its cable route starting near the selected Grove HAT connector area and its LED aligned to the pod aperture.
28. Use default board footprint dimensions from the approved spec:
   - `65.0 mm x 30.0 mm` board footprint,
   - `35.0 mm` measured stack height,
   - `8.0 mm` default extra upward headroom.
29. Preserve and update the bottom tray behavior:
   - printable floor,
   - side walls,
   - Pi Zero-aligned standoffs with M2.5-class screw clearance/pilot holes,
   - top-cover clip/catch receiver features,
   - anti-slide rubber-foot recesses by default,
   - subtract required port and fastener clearances.
30. Preserve and update the top cover behavior:
   - removable upper shell or lid,
   - clip-on attachable/detachable interface with no cover screws,
   - internal lip or alignment feature for the tray,
   - adjustable ventilation/access holes with a denser default pattern,
   - clearance over the 35 mm stack plus headroom,
   - no dependency on the Pi Zero stack mounting screws,
   - includes the IR pod attachment interface as part of the printable/removable upper assembly.
31. Preserve port cutout volumes for:
   - Pi Zero microSD,
   - Pi Zero mini-HDMI,
   - the externally used Pi Zero Micro USB port only,
   - Pi Zero camera connector access,
   - Waveshare RJ45,
   - Waveshare front USB-A,
   - Waveshare left USB-A,
   - Waveshare right USB-A.
32. Refresh the Waveshare enclosure cutout defaults from `designs/waveshare_eth_usb_hub_hat.scad`:
   - keep `waveshare_rj45_cutout_center_x_mm = -16.0`,
   - change `waveshare_front_usb_a_cutout_center_x_mm` from the stale `11.0` default to `1.7`,
   - preserve front USB-A cutout dimensions sized around the Waveshare reference `13.2 mm x 5.7 mm` footprint,
   - preserve side USB-A cutout dimensions sized around the Waveshare reference `5.7 mm x 13.2 mm` footprint,
   - preserve side USB-A cutout center Y as `0.0`,
   - keep side USB-A cutout X centers as side-wall opening centers unless a code-level dependency directly requires otherwise.
33. Keep port cutout dimensions and local offsets adjustable. Use simplified rectangular cutouts with extra clearance; do not model a wireless dongle body.
34. Preserve `show_electronics` and `show_cutout_guides` so they independently control reference previews and non-printing guide geometry.
35. Keep OpenSCAD 2021.01 compatibility:
   - no external libraries,
   - no generated imports,
   - no unsupported syntax.
36. Refactor `printable_layout` for the IR pod retainer:
   - keep the retainer installed in `assembly` only when that render intentionally shows it installed,
   - place the retainer as a clearly separated secondary printable part in `printable_layout`,
   - increase or reorient the retainer offset as needed so it does not appear to protrude from, intersect, or fuse with the IR pod body after pod rotation,
   - preserve the retainer's installed pose and pod interface behavior outside printable layout.
37. Update `README.md`:
   - ensure the design file is listed,
   - align the Pi Zero USB Grove IR enclosure section with the approved spec,
   - document component assumptions, including 35.0 mm stack height plus 8.0 mm default headroom,
   - document the independent board spacing parameters users should adjust,
   - document that changing board spacing moves electronics previews and dependent case openings/guides together,
   - document the external IR emitter pod behavior and that its printed PCB retention geometry, LED aperture, pod cable entry, cable guide, and top-cover attachment follow the implemented pod/emitter pose and attachment method,
   - document that the Grove IR emitter PCB loads tool-free into the pod with the Grove cable allowed to remain connected,
   - document that the pod mounts tool-free to the top cover through the implemented slide or clip interface,
   - document that the pod-to-top-cover attachment is separate from the IR pod PCB retainer mechanism,
   - document how the IR pod PCB retainer installs into the pod and what visible pod features receive it,
   - document that the top cover is clip-on attachable/detachable and does not use cover screws,
   - document that the top cover retention is on the two short ends by default,
   - document top ventilation/access hole parameters and the implemented denser default pattern,
   - document that the four bottom-tray board-stack holes exist because the Pi Zero/HAT stack has four mounting points, and that top-cover clips/catches and pod attachment features are separate,
   - document which Pi Zero Micro USB opening remains available externally and which internally used opening is intentionally closed,
   - document that Waveshare enclosure cutout defaults are refreshed from `designs/waveshare_eth_usb_hub_hat.scad`,
   - document that the default Waveshare front USB-A cutout X center is `1.7 mm`,
   - document adjustable parameter groups,
   - document render modes,
   - document optional OpenSCAD commands for users with OpenSCAD installed,
   - document Bambu Lab print and assembly notes,
   - update the manual inspection checklist to match actual implemented behavior.
38. Add printable-only wrapper modules or equivalent transforms for printable render modes so assembled geometry can keep its existing world pose while printable outputs are plate-friendly:
   - `bottom_tray` must rest on the build plate at `Z=0`,
   - `top_cover` must rest on the build plate at `Z=0` with its broad, stable printable face downward,
   - `ir_pod` must rest on the build plate at `Z=0` with its broad, stable printable face downward,
   - any separate IR pod PCB retainer must rest on the build plate at `Z=0` as its own printable object.
39. Preserve assembled-world modules and transforms used by `assembly` and `electronics`; printable wrapper transforms must not alter board-stack positions, pod attachment positions, cable guide positions, or electronics preview positions in assembled modes.
40. Refactor render dispatch if needed so:
   - `render_mode = "assembly"` continues to call assembled-position case, pod, electronics, and guide modules,
   - `render_mode = "bottom_tray"` calls the bottom tray printable wrapper,
   - `render_mode = "top_cover"` calls the top cover printable wrapper,
   - `render_mode = "ir_pod"` calls the IR pod printable wrapper,
   - `render_mode = "printable_layout"` calls printable wrappers for all parts.
41. Refactor `pi_zero_usb_grove_ir_printable_layout()` so it arranges all printable objects side-by-side with sufficient X/Y spacing:
   - bottom tray,
   - top cover,
   - IR pod body,
   - any separate IR pod PCB retainer.
42. Ensure `printable_layout` contains no object that is suspended above the build plate, hidden inside another printable part, intersecting another printable part, visually fused to another printable part, or dependent on another part for build-plate contact.
43. If the current IR pod printable wrapper keeps the retainer as a child of the pod module, split printable retainer rendering into a separate printable module or parameter path so the retainer is placed as an independent object with its own build-plate contact.
44. Keep source OpenSCAD 2021.01-compatible and preserve adjustable parameter grouping. Add only narrowly scoped `_mm`/`_deg` printable-layout orientation or spacing parameters if the existing `printable_layout_spacing_mm` and `ir_pcb_retainer_print_gap_mm` are insufficient.
45. Update `README.md` to document:
   - printable render modes place objects on the build plate,
   - `printable_layout` separates independently printable parts,
   - no generated STL/STEP/3MF/OFF exports are committed,
   - assembled preview positions remain separate from printable-only orientation transforms.
46. Adjust the IR pod default clearance from the Waveshare RJ45/Ethernet opening:
   - reduce `pod_outer_width_mm` from 32.0 mm to a smaller default that still fits the 20.0 mm IR emitter PCB, locator geometry, retainer/service opening, and printable walls,
   - shift `pod_center_offset_x_mm` toward the front USB-A side so the pod does not sit over the RJ45 cutout,
   - reduce `pod_slide_rail_spacing_x_mm` and trim unnecessary slide root plate width as needed so rail slots remain compatible with the narrower pod, stay inside the top-cover X margin, and do not crowd the front USB-A cutout,
   - keep pod width, X offset, and rail spacing adjustable,
   - update README to document the default smaller/off-center pod placement and its Ethernet-clearance purpose.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Optional OpenSCAD inspection may be run locally when useful for printability confidence. Any generated inspection artifacts must be written under `/tmp` and must not be added to source control.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- it has `Adjustable Parameters` and `Derived Values` sections near the top,
- all user-adjustable linear variables use `_mm`,
- any angle variables use `_deg`,
- user-adjustable values are not redefined inside modules,
- render modes dispatch deterministically,
- existing reference models are imported rather than duplicated,
- the electronics stack order is Pi Zero, Waveshare HAT, Grove Base HAT,
- default internal height derives from 35.0 mm stack height plus 8.0 mm headroom,
- independent board spacing parameters are present for Pi Zero-to-Waveshare and Waveshare-to-Grove distances,
- the default Waveshare-to-Grove spacing is 10.8 mm, remains adjustable, and README documents when to increase it after measurement or preview inspection,
- changing `pi_zero_to_waveshare_hat_z_offset_mm` changes the Waveshare preview Z position and Waveshare port cutout Z centers,
- changing `waveshare_to_grove_hat_z_offset_mm` changes the Grove HAT preview Z position and main-to-pod Grove cable guide placement,
- bottom tray includes Pi Zero-aligned standoffs with M2.5-class screw clearance or pilot holes,
- bottom tray's four Pi Zero stack mounting holes are distinct from top-cover clip/catch features and pod attachment holes,
- top cover uses short-end clip/catch attachment, has no cover screw holes, is independent from board stack fasteners, and carries the IR pod attachment interface as a separate merged feature,
- short-end top cover clip tabs and short-end tray receivers are visibly continuous with and supported by their parent solids,
- short-end cover retention preserves clearance around the Pi Zero microSD/camera end cutouts and does not weaken the end walls by code review,
- the IR emitter PCB retention path is tool-free, does not depend on internal screws, and allows board insertion with the Grove cable already connected by code review of the modeled path,
- the IR pod attaches to the top cover through a tool-free slide or clip interface with visibly supported roots and a plausible repeated-use mounting path,
- top cover has adjustable ventilation/access holes with a denser default pattern that avoids clip/catch features and preserves roof margins by code review,
- all required Pi Zero and Waveshare port cutouts exist,
- the Waveshare front USB-A cutout X center defaults to `1.7 mm`, matching the current local Waveshare reference formula,
- the Waveshare front USB-A cutout no longer uses the stale `11.0 mm` X center,
- Waveshare side USB-A cutout size and center Y still match the current local Waveshare reference orientation while remaining side-wall openings,
- the internally used Pi Zero Micro USB opening is removed while the externally used Pi Zero Micro USB opening remains accessible,
- Pi Zero and Waveshare port cutout Z centers derive from board-tier Z positions plus adjustable local offsets,
- at least one Waveshare USB-A cutout allows an external wireless dongle,
- IR emitter PCB is retained inside the external IR pod with a serviceable printed retention feature rather than inaccessible internal screw-driving geometry,
- any separate IR pod retainer part is clearly intentional and consistent with the tool-free slide-in board retention concept,
- any separate IR pod retainer part is clearly separated from the pod body in `printable_layout` and does not appear to protrude from, intersect, or fuse with the pod,
- the IR pod includes a visible service opening, slot, ledge, snap pocket, or equivalent feature that makes the separate retainer installation path understandable by geometry inspection,
- IR emitter pod is attachable to `top_cover` through a distinct pod attachment interface that is separate from the cover-to-tray clips,
- pod attachment features are visibly continuous with and supported by the `top_cover` body,
- IR emitter reference preview, pod board retention geometry, pod cable entry, LED aperture, and IR/cable guides derive from one pod/emitter pose,
- the IR LED aperture remains a true pass-through opening in the printable pod body even when electronics previews are hidden,
- default IR emitter pod placement attaches outside the main enclosure and aligns the cable route with the selected Grove HAT connector/cable area,
- only the IR LED path is exposed outside the pod by default,
- Grove cable exits the main enclosure only through the dedicated cable exit and enters the pod only through the dedicated cable entry,
- anti-slide features are present,
- printable parts have plausible flat print orientations,
- `bottom_tray`, `top_cover`, `ir_pod`, and `printable_layout` printable outputs have no floating printable objects by code review,
- every printable object in `printable_layout` rests at `Z=0` independently and does not intersect or visually fuse with another printable object,
- printable-only transforms do not alter `assembly` or `electronics` assembled-world geometry,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the documented filename matches the new source,
- assumptions and dimensions match the approved spec,
- board spacing parameters and default/current values are documented,
- README states that board spacing changes move dependent electronics previews and case openings/guides,
- README states that the IR emitter pod/emitter pose drives its mounting holes, aperture, pod cable entry, and cable guide positions,
- README states that the IR pod attachment is mounted to `top_cover` as part of the removable upper assembly,
- README states that the Grove IR emitter PCB installs tool-free with the cable allowed to remain connected,
- README states that the pod mounts tool-free to the top cover through the implemented clip or slide interface,
- README states that the pod-to-top-cover attachment is separate from the IR pod PCB retainer mechanism,
- README describes how the IR pod PCB retainer installs into the pod and what visible pod features receive it,
- README states that the separate retainer is placed apart from the IR pod in printable layout,
- README states that printable render modes place parts on the build plate,
- README states that printable layout separates independently printable parts and does not commit generated mesh exports,
- README distinguishes printable-only orientation from assembled preview geometry,
- README states that the top cover is clip-on attachable/detachable and does not use cover screws,
- README states that the cover-to-tray retention is on the two short ends by default,
- README documents the top ventilation/access holes and the denser default pattern,
- README explains why the bottom tray has four Pi Zero stack mounting holes and how those differ from clip/catch and pod attachment features,
- README identifies the intentionally closed internally used Pi Zero USB opening,
- README documents the refreshed Waveshare enclosure cutout defaults and the `1.7 mm` front USB-A center,
- render modes match the OpenSCAD source,
- optional commands are clearly optional for users with OpenSCAD installed,
- validation guidance remains consistent with repository instructions,
- Bambu Lab print notes and manual inspection checklist match implementation behavior.

## QA Requirements

Main-agent QA is manual review only:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- confirm any OpenSCAD-generated inspection artifacts, if created, are temporary under `/tmp` and not tracked,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Pi Zero USB Grove IR enclosure section updates.
- `README.md` validation checklist updates if implemented behavior differs from the current README text.
- `README.md` printable render-mode and printable-layout notes for Bambu Lab-friendly build-plate placement.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- stale Waveshare front USB-A X spacing left in the enclosure defaults,
- OpenSCAD syntax risks visible by inspection,
- default board-stack collision risk from derived Z positions,
- fixed absolute Z values where board-tier-relative Z values are required,
- IR emitter pod/emitter placement values that do not drive all dependent pod mount/hole/aperture/cable features,
- missing adjustable parameters,
- missing required port, IR pod, cable exit/entry, clip/catch, top-hole, pod-fastener, or anti-slide behavior,
- README/source mismatch,
- stale screw-hole retention geometry left as the default IR pod board mount path,
- a pod or PCB retention path that still implies screwdriver-based normal assembly,
- a retainer printable-layout placement that still reads as fused to or protruding from the IR pod body,
- a cover-to-tray interface that remains on the long sides instead of the two short ends,
- printable render paths that leave the top cover, IR pod, or retainer floating above the build plate,
- printable layout placement that intersects or visually fuses separate printable parts,
- printable-only transforms accidentally changing assembled `assembly` or `electronics` geometry,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
