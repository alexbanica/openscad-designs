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
   - cover fasteners,
   - port cutout dimensions and offsets,
   - IR emitter board mount,
   - IR LED aperture,
   - internal Grove cable path,
   - anti-slide recesses/feet,
   - tolerances and print clearances,
   - printable layout,
   - visual settings.
4. Preserve independent board spacing controls. The current source already provides:
   - `pi_zero_to_waveshare_hat_z_offset_mm = 11.2`,
   - `waveshare_to_grove_hat_z_offset_mm = 10.5`.
5. Review the Grove HAT reference height and Waveshare reference placement by code inspection. Increase the default `waveshare_to_grove_hat_z_offset_mm` if required so the default Waveshare HAT and Grove HAT previews do not visibly collide in `assembly` or `electronics` render modes.
6. Refactor `Derived Values` so all board-tier Z positions derive from:
   - `pi_zero_bottom_z_mm`,
   - `pi_zero_to_waveshare_hat_z_offset_mm`,
   - `waveshare_to_grove_hat_z_offset_mm`,
   - the adjustable measured stack/headroom parameters.
7. Replace fixed absolute board-tier port Z centers with local offsets plus derived board-tier Z positions:
   - Pi Zero port cutout centers derive from `pi_zero_bottom_z_mm` plus Pi Zero-local adjustable offsets,
   - Waveshare RJ45/front USB-A/side USB-A cutout centers derive from `waveshare_hat_bottom_z_mm` plus Waveshare-local adjustable offsets.
8. Keep each port local Z offset independently adjustable for physical calibration.
9. Update the internal Grove cable path so its default start is tied to the Grove Base Hat connector area using Grove-HAT-relative X/Y/Z values and adjustable local offsets.
10. Add or refactor IR emitter placement values so the emitter PCB reference model, mounting bosses, mounting holes, LED aperture, and related cutout/guide volumes derive from the same adjustable IR emitter pose:
    - center X/Y/Z or center X/Y plus board-bottom Z,
    - rotation,
    - PCB dimensions,
    - LED local offset/axis values,
    - Grove connector/cable clearance local values.
11. Reposition the default IR emitter board near or above the selected Grove Base Hat connector/cable area inside the case, leaving adjustable clearance for the Grove plug and cable bend. Preserve the requirement that the PCB stays inside and only the LED path is exposed by default.
12. Ensure the IR emitter mount includes case mounting bosses and screw/pilot holes based on adjustable Grove 20 mm-class mounting-hole planning assumptions.
13. Ensure changing the IR emitter pose changes all dependent emitter features together:
    - electronics/reference preview,
    - mounting bosses,
    - mounting holes,
    - LED aperture,
    - IR guide/cutout geometry,
    - Grove cable path endpoint.
14. Recompute enclosure internal/case height so it remains at least high enough for:
    - Pi Zero standoff height,
    - Grove HAT derived Z position,
    - Grove HAT top-side connector/cable clearance,
    - IR emitter board and cable/plug clearance,
    - extra upward headroom.
15. Preserve render dispatch for:
   - `assembly`,
   - `bottom_tray`,
   - `top_cover`,
   - `printable_layout`,
   - `electronics`.
16. Preserve or update named modules for:
   - `pi_zero_usb_grove_ir_enclosure_assembly(...)`,
   - `pi_zero_usb_grove_ir_bottom_tray()`,
   - `pi_zero_usb_grove_ir_top_cover()`,
   - `pi_zero_usb_grove_ir_printable_layout()`,
   - `pi_zero_usb_grove_ir_electronics_reference(...)`,
   - board stack standoffs,
   - cover bosses,
   - port cutout volumes,
   - IR emitter mount,
   - IR LED aperture,
   - internal Grove cable path guide,
   - anti-slide features,
   - reusable helper geometry.
17. Default stack placement must remain:
   - Pi Zero at the bottom,
   - Waveshare HAT above the Pi Zero,
   - Grove Base HAT above the Waveshare HAT,
   - Grove IR emitter mounted internally near the Grove HAT connector/cable area with its LED aligned to the case aperture.
18. Use default board footprint dimensions from the approved spec:
   - `65.0 mm x 30.0 mm` board footprint,
   - `35.0 mm` measured stack height,
   - `8.0 mm` default extra upward headroom.
19. Preserve the bottom tray behavior:
   - printable floor,
   - side walls,
   - Pi Zero-aligned standoffs with M2.5-class screw clearance/pilot holes,
    - IR emitter mounting bosses or posts,
    - cover attachment bosses,
   - anti-slide rubber-foot recesses by default,
   - subtract required port, IR, cable, and fastener clearances.
20. Preserve the top cover behavior:
   - removable upper shell or lid,
   - independent cover screw clearance holes,
    - internal lip or alignment feature for the tray,
    - clearance over the 35 mm stack plus headroom,
   - no dependency on the Pi Zero stack mounting screws.
21. Preserve port cutout volumes for:
   - Pi Zero microSD,
   - Pi Zero mini-HDMI,
    - Pi Zero Micro USB power and data,
    - Pi Zero camera connector access,
    - Waveshare RJ45,
    - Waveshare front USB-A,
   - Waveshare left USB-A,
   - Waveshare right USB-A.
22. Keep port cutout dimensions and local offsets adjustable. Use simplified rectangular cutouts with extra clearance; do not model a wireless dongle body.
23. Preserve `show_electronics` and `show_cutout_guides` so they independently control reference previews and non-printing guide geometry.
24. Keep OpenSCAD 2021.01 compatibility:
   - no external libraries,
   - no generated imports,
   - no unsupported syntax.
25. Update `README.md`:
   - ensure the design file is listed,
   - align the Pi Zero USB Grove IR enclosure section with the approved spec,
   - document component assumptions, including 35.0 mm stack height plus 8.0 mm default headroom,
   - document the independent board spacing parameters users should adjust,
   - document that changing board spacing moves electronics previews and dependent case openings/guides together,
   - document the corrected IR emitter placement behavior and that its mount holes, LED aperture, and cable guide follow the emitter pose,
   - document adjustable parameter groups,
   - document render modes,
    - document optional OpenSCAD commands for users with OpenSCAD installed,
    - document Bambu Lab print and assembly notes,
    - update the manual inspection checklist to match actual implemented behavior.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Do not run OpenSCAD validation commands locally.

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
- the default Waveshare-to-Grove spacing prevents visible collision by code review of derived Z positions and reference height assumptions,
- changing `pi_zero_to_waveshare_hat_z_offset_mm` changes the Waveshare preview Z position and Waveshare port cutout Z centers,
- changing `waveshare_to_grove_hat_z_offset_mm` changes the Grove HAT preview Z position and Grove cable/case guide Z placement,
- bottom tray includes Pi Zero-aligned standoffs with M2.5-class screw clearance or pilot holes,
- top cover fasteners are independent from board stack fasteners,
- all required Pi Zero and Waveshare port cutouts exist,
- Pi Zero and Waveshare port cutout Z centers derive from board-tier Z positions plus adjustable local offsets,
- at least one Waveshare USB-A cutout allows an external wireless dongle,
- IR emitter PCB is internally mounted with screw/boss features,
- IR emitter reference preview, mounting bosses, mounting holes, LED aperture, and IR/cable guides derive from one emitter pose,
- default IR emitter placement is near or above the selected Grove HAT connector/cable area and leaves internal cable/plug clearance,
- only the IR LED is exposed outside the case by default,
- Grove cable path remains internal,
- anti-slide features are present,
- printable parts have plausible flat print orientations,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the documented filename matches the new source,
- assumptions and dimensions match the approved spec,
- board spacing parameters and default/current values are documented,
- README states that board spacing changes move dependent electronics previews and case openings/guides,
- README states that the IR emitter pose drives its mounting holes, aperture, and cable guide positions,
- render modes match the OpenSCAD source,
- optional commands are clearly optional for users with OpenSCAD installed,
- validation guidance remains consistent with repository instructions,
- Bambu Lab print notes and manual inspection checklist match implementation behavior.

## QA Requirements

Main-agent QA is manual review only:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- confirm no OpenSCAD command was run,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Pi Zero USB Grove IR enclosure section updates.
- `README.md` validation checklist updates if implemented behavior differs from the current README text.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- OpenSCAD syntax risks visible by inspection,
- default board-stack collision risk from derived Z positions,
- fixed absolute Z values where board-tier-relative Z values are required,
- IR emitter placement values that do not drive all dependent mount/hole/aperture/cable features,
- missing adjustable parameters,
- missing required port, IR, cable, fastener, or anti-slide behavior,
- README/source mismatch,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
