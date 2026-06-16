# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes. At planning time:

- `README.md`, `designs/pi_zero_usb_grove_ir_enclosure.scad`, `designs/waveshare_eth_usb_hub_hat.scad`, `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`, and unrelated Waveshare spec files already have uncommitted changes.
- Treat the current enclosure source and README as the implementation baseline.
- Treat `designs/waveshare_eth_usb_hub_hat.scad` as the source of truth for the enclosure's front RJ45/Ethernet and front USB-A connector hole placement.

## Affected Files

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Do not edit electronics reference files unless a direct syntax or import issue blocks validation.
- Keep generated mesh/export files out of source control.
- Preserve existing IR pod attachment, electronics placement, Waveshare front connector alignment, USB sizing, microSD access, enclosure Y-envelope behavior, anti-slide behavior, render modes, and printable layout except where a direct local change is required for the plug-in cover connection.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan,
- repository instructions,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section,
- the current `designs/waveshare_eth_usb_hub_hat.scad` front RJ45/Ethernet and front USB-A connector values.

Implementation must not perform additional product, architecture, or scope research.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- identify all current cover-to-tray clip parameters, derived values, module calls, README text, and validation text,
- identify tray wall and top-cover skirt geometry available for pin/socket placement,
- identify nearby port cutouts, camera access, microSD access, vent holes, cable exit, pod rails, and Pi Zero stack standoffs that must remain clear,
- map each approved pin/socket acceptance criterion to source, README, validation, or manual review.

## Implementation Steps

1. Inspect only the current enclosure source and README design section needed for this iteration.
2. Replace the default cover-to-tray clip/hook interface with a plug-in pin/socket interface:
   - remove or disable obsolete cover clip hook/tab geometry from the default top-cover solid,
   - remove or disable obsolete tray clip receiver/catch geometry from the default bottom-tray solid,
   - retain no clip-specific code unless it has been renamed/refactored into pin/socket support.
3. Add adjustable cover pin/socket parameters near the existing enclosure connection parameters:
   - male pin diameter or equivalent cross-section,
   - pin insertion length/depth,
   - pin root/boss diameter or equivalent support dimensions,
   - pin placement offsets/count,
   - socket clearance,
   - socket depth,
   - socket reinforcement or local wall-thickening dimensions.
4. Make the male pins part of `top_cover`:
   - default to at least four pins,
   - place pins near supported side-wall/corner regions without intersecting vents, port cutouts, cable exit, pod rails, or required access openings,
   - root each pin into the top-cover shell/skirt through broad bosses, pads, or thickened local geometry,
   - use at least `3.0 mm` default pin diameter or equivalent narrowest cross-section,
   - use at least `4.5 mm` default root/boss support or equivalent broad rooted geometry.
5. Make the female sockets part of `bottom_tray`:
   - default to matching socket count and placement,
   - integrate sockets into tray walls, corners, or reinforced local bosses,
   - subtract true socket holes sized from pin diameter plus adjustable clearance,
   - default socket clearance must be in the approved `0.25 mm` to `0.45 mm` per-diameter range,
   - keep socket geometry distinct from the four Pi Zero stack mounting holes and IR pod attachment features.
6. Thicken the connection support:
   - increase `wall_thickness_mm` default from `2.4` to at least `2.8`, or add equivalent named local tray/cover reinforcement around sockets and pin roots,
   - if global wall thickness changes alter the footprint or cutout relationships, preserve required connector/cable clearances by adjusting only directly affected derived values or local offsets.
7. Preserve screwless vertical assembly:
   - the cover must lower onto the tray with primarily vertical pin insertion,
   - the cover must not need clip hooks to flex over tray catches,
   - the cover must remain removable by hand,
   - the connection must not depend on Pi Zero stack fasteners.
8. Preserve separation from other mechanisms:
   - keep cover-to-tray pins/sockets distinct from the IR pod-to-cover slide/clip interface,
   - keep pins/sockets distinct from the four Pi Zero stack mounting holes,
   - keep pins/sockets distinct from anti-slide features.
9. Review local geometry by source inspection so the new pins, sockets, and reinforcement do not block or weaken:
   - Pi Zero microSD opening,
   - camera access opening,
   - Pi Zero and Waveshare USB/opening set,
   - Waveshare RJ45/front USB-A openings,
   - top ventilation/access holes,
   - main cable exit,
   - IR pod attachment,
   - stack standoffs and stack screw holes.
10. Update `README.md`:
    - describe the plug-in male-pin/female-socket cover connection,
    - remove stale claims that the top cover uses clip hooks, latch catches, or strengthened short-end clips as the default connection,
    - document the new pin/socket adjustable parameters and default fit guidance,
    - document thicker walls or local socket reinforcement,
    - keep existing render mode, printable-layout, Waveshare connector, microSD, USB, IR pod, and electronics documentation unchanged unless wording must be corrected around the cover connection.
11. Keep OpenSCAD 2021.01-compatible syntax and existing named-module style.
12. Do not add generated STL, STEP, 3MF, OFF, or similar files to source control.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Run OpenSCAD inspection renders to temporary files:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

Expected result: each command exits successfully. Generated `.off` artifacts remain under `/tmp` and are not added to source control.

If OpenSCAD is unavailable or a render fails, report the failure and mark delivery as draft unless the user explicitly accepts source-review-only validation.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- default cover-to-tray clip hooks and tray catch receivers are removed, disabled, or fully refactored into pin/socket behavior,
- top-cover male pins are present, count at least four, and are rooted into the top cover through broad supported geometry,
- male pins default to at least `3.0 mm` diameter or equivalent narrowest cross-section,
- male pin root/boss support defaults to at least `4.5 mm` diameter or equivalent broad support,
- bottom-tray female sockets are present, count matches the pins, and are integrated into reinforced tray walls, corner regions, or local bosses,
- socket holes are true receiving holes with adjustable clearance and depth,
- default socket clearance is within `0.25 mm` to `0.45 mm` per diameter,
- wall thickness is increased to at least `2.8 mm` or equivalent named local reinforcement is present around the sockets and pin roots,
- cover insertion is primarily vertical and does not require flexing clip hooks over tray catches,
- cover remains screwless, removable by hand, and independent from Pi Zero stack fasteners,
- pins/sockets are distinct from Pi Zero stack mounting holes, IR pod attachment, and anti-slide features,
- pins/sockets and reinforcement do not interfere with required ports, microSD, camera access, vents, cable path, stack standoffs, or IR pod attachment,
- `bottom_tray`, `top_cover`, `assembly`, and `printable_layout` render paths include the expected pin/socket geometry,
- all new or changed adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it documents the plug-in male-pin/female-socket cover connection,
- it no longer describes cover hooks, tray catches, or strengthened short-end clips as the default cover connection,
- it documents pin/socket tuning parameters and physical test-fit expectations,
- it documents wall thickening or local reinforcement for socket/pin strength,
- existing documentation for unrelated behavior remains consistent with the source.

## QA Requirements

Main-agent QA is manual review plus the validation commands above:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- run the OpenSCAD inspection renders listed above or report why they could not be run,
- confirm temporary OpenSCAD artifacts are under `/tmp`,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Pi Zero USB Grove IR enclosure section updates for plug-in cover pins and bottom-tray sockets.
- `README.md` adjustable parameter and print notes updates for pin/socket fit, socket clearance, and thicker walls or local reinforcement.
- README manual inspection guidance updates if existing guidance still mentions clip hooks, tray catches, or strengthened short-end clips as the default cover connection.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- stale clip/hook/catch geometry still active as the default cover connection,
- stale README text describing clips as the default cover connection,
- weak or thin pins below approved defaults,
- pin roots joined by only small contact patches,
- socket walls or bosses too thin for plausible FDM print strength,
- socket clearances outside approved defaults without documented rationale,
- cover-to-tray connection that cannot plausibly assemble vertically by code review,
- interference with required ports, cable paths, vents, stack standoffs, or IR pod attachment,
- OpenSCAD syntax/render failures,
- README/source mismatch,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
