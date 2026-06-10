# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes. At planning time, the only known changes are:

- `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`,
- this implementation plan.

## Affected Files

- Add `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Do not edit existing reference source files unless implementation discovers a syntax-level import issue that directly blocks the approved enclosure; if that happens, stop and request plan amendment before changing them.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- current repository instructions,
- existing local reference models and README sections needed to match style,
- the measured/default values already captured in the approved spec.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- map each acceptance criterion from the approved spec to either `designs/pi_zero_usb_grove_ir_enclosure.scad` or `README.md`,
- implement against that checklist,
- review the final diff against the same checklist.

## Implementation Steps

1. Inspect existing OpenSCAD style in `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad` if present, plus the four component reference files only as needed for import/module names and local helper style.
2. Add `designs/pi_zero_usb_grove_ir_enclosure.scad`.
3. At the top of the new file, document:
   - units are millimeters,
   - coordinate origin and orientation,
   - the model is an adjustable printable case and fit reference,
   - physical measurement and test fitting are still required.
4. Import local reference models using `use`:
   - `pi_zero.scad`,
   - `waveshare_eth_usb_hub_hat.scad`,
   - `seeed_grove_base_hat_zero.scad`,
   - `grove_infrared_emitter.scad`.
5. Add grouped `Adjustable Parameters`:
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
6. Add `Derived Values` for internal/external case dimensions, stack height, tray/top split, board hole positions, port cutout centers, IR mount positions, cover boss positions, anti-slide feature positions, and repeated geometry constants.
7. Implement render dispatch for:
   - `assembly`,
   - `bottom_tray`,
   - `top_cover`,
   - `printable_layout`,
   - `electronics`.
8. Implement named modules for:
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
9. Default stack placement:
   - Pi Zero at the bottom,
   - Waveshare HAT above the Pi Zero,
   - Grove Base HAT above the Waveshare HAT,
   - Grove IR emitter mounted inside the tray with its LED aligned to the case aperture.
10. Use default board footprint dimensions from the approved spec:
    - `65.0 mm x 30.0 mm` board footprint,
    - `35.0 mm` measured stack height,
    - `8.0 mm` default extra upward headroom.
11. Implement the bottom tray:
    - printable floor,
    - side walls,
    - Pi Zero-aligned standoffs with M2.5-class screw clearance/pilot holes,
    - IR emitter mounting bosses or posts,
    - cover attachment bosses,
    - anti-slide rubber-foot recesses by default,
    - subtract required port, IR, cable, and fastener clearances.
12. Implement the top cover:
    - removable upper shell or lid,
    - independent cover screw clearance holes,
    - internal lip or alignment feature for the tray,
    - clearance over the 35 mm stack plus headroom,
    - no dependency on the Pi Zero stack mounting screws.
13. Implement port cutout volumes for:
    - Pi Zero microSD,
    - Pi Zero mini-HDMI,
    - Pi Zero Micro USB power and data,
    - Pi Zero camera connector access,
    - Waveshare RJ45,
    - Waveshare front USB-A,
    - Waveshare left USB-A,
    - Waveshare right USB-A.
14. Keep port cutout dimensions and offsets adjustable. Use simplified rectangular cutouts with extra clearance; do not model a wireless dongle body.
15. Implement IR emitter mounting:
    - fixed adjustable internal placement,
    - screw/boss geometry based on the Grove IR emitter reference mounting-hole defaults,
    - LED aligned to an adjustable wall aperture,
    - PCB and Grove connector remain inside by default.
16. Implement the internal Grove cable path as an adjustable clearance guide/volume from the Grove Base HAT connector area to the IR emitter board. Keep it internal.
17. Implement `show_electronics` and `show_cutout_guides` so they independently control reference previews and non-printing guide geometry.
18. Keep OpenSCAD 2021.01 compatibility:
    - no external libraries,
    - no generated imports,
    - no unsupported syntax.
19. Update `README.md`:
    - ensure the design file is listed,
    - align the Pi Zero USB Grove IR enclosure section with the approved spec,
    - document component assumptions, including 35.0 mm stack height plus 8.0 mm default headroom,
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
- bottom tray includes Pi Zero-aligned standoffs with M2.5-class screw clearance or pilot holes,
- top cover fasteners are independent from board stack fasteners,
- all required Pi Zero and Waveshare port cutouts exist,
- at least one Waveshare USB-A cutout allows an external wireless dongle,
- IR emitter PCB is internally mounted with screw/boss features,
- only the IR LED is exposed outside the case by default,
- Grove cable path remains internal,
- anti-slide features are present,
- printable parts have plausible flat print orientations,
- no generated mesh/export artifacts are present.

Review `README.md` and confirm:

- the documented filename matches the new source,
- assumptions and dimensions match the approved spec,
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
