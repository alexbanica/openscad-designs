# SPEC: Pi Zero USB Grove Enclosure Top-Cover IR PCB Mount

Status: Approved

## Purpose

Document the completed direct update that mounts the Grove IR emitter PCB to the inside of the removable top cover and orients the IR LED toward the front-facing top-cover wall.

## Problem Statement

The enclosure needs to carry the Grove IR emitter PCB after the external IR pod subsystem was removed. The PCB must attach upside down to the inside of the top cover with screws, using the same two-hole spacing as the prior IR pod implementation, and the IR LED must exit the front-facing wall of the top cover rather than pointing through the roof.

The first front-wall implementation placed the aperture on the front wall, but the cylinder depth did not match the helper's shared-clearance centering behavior, so the aperture did not fully pass through the wall. This bugfix makes the LED aperture subtraction over-travel both wall faces.

The first screw-boss implementation also centered the screw pilot holes too close to the roof inner surface, leaving the holes hidden inside the bosses instead of opening on the boss free faces where the IR PCB screws start.

The IR PCB must be mounted upside down to leave room for the Grove male port/component side. The IR LED aperture height must therefore derive from the underside boss height plus PCB thickness plus the LED center height on the component face.

The IR PCB screw length is constrained to 5.0 mm maximum including the screw head, so boss height and pilot-hole depth must derive from the usable remaining screw depth rather than fixed deeper defaults.

The IR PCB mount defaults to the right side of the front-facing wall so the front-wall LED aperture is no longer centered on the front face.

The IR PCB screw bosses and pilot holes were still too far from the front wall that contains the IR LED aperture. The mount center must move 7.0 mm closer to that wall without changing the screw-hole spacing or the LED aperture wall position.

The assembled Pi Zero enclosure also needs 5.0 mm more default vertical headroom, and the external Micro USB power-side opening must be the same default height as the mini-HDMI opening.

## Scope

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update the matching `README.md` enclosure documentation.
- Replace this spec and the matching plan with auto-approved completed-work artifacts for the delivered state.
- Preserve the main bottom tray, top cover, stack standoffs, external port cutouts, cover pin/socket retention, anti-slide features, and printable layout.

## Out Of Scope

- Reintroducing the external IR pod, pod cap, pod locks, or pod render modes.
- Editing `designs/grove_infrared_emitter.scad` as a standalone reference model.
- Adding a modeled IR PCB preview to the enclosure source.
- Generated mesh exports such as STL, STEP, 3MF, or OFF files.
- Physical fit validation, slicer validation, or test prints.
- A full QA or code-review phase; this was a `super-agent` direct execution.

## Definitions

- Top-cover IR PCB mount: two underside bosses attached to the removable top cover roof, with screw pilot holes aligned to the Grove IR emitter PCB mounting holes.
- Front-facing top-cover wall: the top cover wall on the enclosure `-Y` side, matching the side where the Waveshare RJ45 and front USB-A cutouts face.
- Upside-down PCB: the IR PCB is intended to be installed inside the top cover with the Grove male port/component side facing down into the enclosure and the IR LED oriented toward the front-facing top-cover wall aperture.

## Inputs And Constraints

- Repository OpenSCAD syntax remains OpenSCAD 2021.01-compatible.
- The design remains a single editable `.scad` file for this coherent enclosure.
- Previous IR pod reference values from `origin/main` were used because `origin/master` is not present in this clone.
- The previous pod-derived IR PCB mounting span is `20.15 mm`, from `23.65 mm` earlobe-inclusive PCB width and `1.75 mm` hole-center edge offset.
- The IR PCB center defaults to `ir_top_cover_pcb_center_x_mm = 24.0`, placing the mount on the right side of the front-facing wall.
- The IR PCB center defaults to `ir_top_cover_pcb_center_y_mm = -16.7`, which is 7.0 mm closer to the `-Y` front wall than the prior `-9.7` default.
- Grove IR reference LED defaults remain `5.0 mm` LED diameter, `7.0 mm` LED body length, and `7.5 mm` LED extension beyond the PCB edge.
- The user-provided measured stack height remains `35.0 mm`; the default extra upward headroom is increased from `8.0 mm` to `13.0 mm`.
- The default mini-HDMI plug-head height is `11.30 mm`.
- The external Micro USB power-side plug-head length remains `10.30 mm`, and its default cutout height derives from the mini-HDMI plug-head height.
- Grove IR PCB thickness is modeled locally as `ir_top_cover_pcb_thickness_mm = 1.6` for the upside-down LED aperture height derivation.
- IR PCB screw maximum total length is modeled as `ir_top_cover_mount_max_screw_length_including_head_mm = 5.0`.
- Screw-head height is modeled as a tunable allowance, defaulting to `ir_top_cover_mount_screw_head_height_allowance_mm = 1.2`, because the 5.0 mm maximum includes the head.
- The front-wall LED aperture derives from live enclosure wall position rather than a hard-coded Y coordinate, so it remains a real pass-through if the enclosure width changes.
- The front-wall LED aperture effective subtraction depth includes the shared `port_cutout_extra_clearance_mm` because the live front-wall centering helper includes that clearance.
- Printable outputs remain Bambu Lab-friendly: bottom tray and top cover are independently printable.
- Minimum repository validation is `git diff --check`.

## Deterministic Behavior Delivered

- The top cover has an enabled-by-default `enable_top_cover_ir_pcb_mount` mechanism.
- The IR PCB mount adds two underside cylindrical bosses to the top cover roof.
- The two boss centers are separated by `ir_top_cover_mount_hole_spacing_x_mm = 20.15`.
- The bosses include screw pilot holes sized by `ir_top_cover_mount_screw_hole_diameter_mm = 2.1`.
- Boss height and pilot-hole depth derive from the usable screw depth: max screw length including head minus screw-head allowance minus PCB thickness.
- With the default 5.0 mm screw, 1.2 mm head allowance, and 1.6 mm PCB thickness, boss height and pilot depth default to 2.2 mm.
- The screw pilot holes open from the underside free faces of the IR PCB mount bosses and cut upward into the boss material.
- The mounted PCB default center is shifted toward the front-right side so the LED path aligns with the right side of the front-facing top-cover wall.
- The mounted PCB screw bosses and screw pilot holes are shifted 7.0 mm closer to the front-facing wall by setting `ir_top_cover_pcb_center_y_mm = -16.7`.
- The top cover front-facing wall has a true horizontal pass-through IR LED aperture sized by `ir_top_cover_led_aperture_diameter_mm = 6.2`.
- The default assembled enclosure height is 5.0 mm taller because `extra_upward_headroom_mm = 13.0`.
- The default Micro USB power-side opening height matches the default mini-HDMI opening height by deriving `pi_micro_usb_power_head_height_mm` from `pi_mini_hdmi_head_height_mm`.
- The LED aperture Z height derives from the upside-down mounting stack: `ir_top_cover_mount_boss_height_mm + ir_top_cover_pcb_thickness_mm + ir_top_cover_led_center_above_component_face_mm` below the top-cover roof inner face.
- The LED aperture nominal depth derives from `wall_thickness_mm + ir_top_cover_led_aperture_wall_overtravel_mm`.
- The LED aperture effective subtraction depth adds `port_cutout_extra_clearance_mm`, matching the front-wall center helper and piercing along the Y axis through the `-Y` front wall.
- The prior vertical roof LED aperture is removed.
- The roof vent keepout protects the IR screw bosses and no longer reserves roof space for a vertical LED aperture.
- Existing Pi Zero/Waveshare port cutouts, Grove HAT preview placement, cover pin/socket features, stack standoffs, anti-slide features, and printable layout remain preserved.

## Assumptions

- "Origin master branch" referred to the previous pod implementation available from the repository remote history; this clone only has `origin/main`, so `origin/main` was used for the old pod hole distance.
- The previous pod's earlobe-inclusive `23.65 mm` IR PCB width and `1.75 mm` hole-center edge offset define the requested exact screw-hole distance.
- The front-facing wall is the `-Y` side because the source states the Waveshare RJ45/front USB-A ports face `-Y`.
- "Right side" is represented by positive X in the source coordinate system for this default placement.
- "Upside down" means the Grove male port/component side faces down into the enclosure, away from the top-cover roof.
- The top-cover placement may need physical tuning after the real PCB and cable are test-fit.

## Impact And Regression Considerations

- The top cover contains internal screw bosses and a front-wall LED opening.
- Moving the screw bosses 7.0 mm toward the front wall reduces the gap between the IR PCB screw holes and the IR LED aperture wall while preserving the `20.15 mm` screw-hole spacing.
- The front-wall LED aperture is a new opening near the front side and must be physically checked against the real Waveshare/Grove stack and cable routing before final tolerance reliance.
- The right-side default keeps the LED aperture high on the front wall, but the board, screw bosses, and cable still need physical clearance checks against the actual hardware.
- The lower LED aperture height gives more room near the top-cover roof for the Grove male port, but reduces vertical clearance lower in the enclosure and needs physical test fitting.
- The shorter 5.0 mm screw constraint reduces boss height and pilot-hole engagement; printed material and screw retention need physical validation.
- The roof vent grid may regain roof holes that were skipped only to avoid the previous vertical LED aperture, while still preserving keepouts for the screw bosses.
- The internal bosses consume some of the previous vertical headroom under the top cover.
- The design remains pod-free and still renders only bottom tray and top cover in `printable_layout`.
- Increasing default upward headroom raises the top cover and assembled case height by 5.0 mm while preserving the bottom tray wall height and cover pin/socket interface.
- Matching the Micro USB power-side opening height to the mini-HDMI height removes more material around that bottom-tray/front-wall access area.

## Validation Performed

- Targeted source/documentation searches were used to find stale roof/vertical LED aperture wording and confirm front-wall aperture wording.
- The front-wall LED aperture depth/center pairing was inspected and corrected so the subtraction over-travels the outside and inside wall faces.
- The IR PCB screw pilot-hole Z anchor was inspected and corrected so the holes start at the underside boss free faces.
- The LED aperture Z derivation was updated for upside-down PCB mounting with the Grove male port/component side facing down.
- The IR PCB boss height and pilot depth were updated to derive from the 5.0 mm maximum screw length including the screw head.
- The IR PCB default center was moved to `X = 24.0` for right-side front-wall placement.
- The IR PCB default center Y was moved from `-9.7` to `-16.7` so the screw bosses and pilot holes are 7.0 mm closer to the front-wall IR LED aperture.
- Source inspection confirmed the 5.0 mm height increase is delivered by changing `extra_upward_headroom_mm` from `8.0` to `13.0`.
- Source inspection confirmed the Micro USB power-side opening height now derives from `pi_mini_hdmi_head_height_mm`.
- `timeout 10 openscad -o /tmp/pi_zero_usb_grove_ir_height_usb_power.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad` completed within 10 seconds with no warning output.
- `timeout 10 openscad -o /tmp/pi_zero_usb_grove_ir_height_usb_power_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad` completed within 10 seconds with no warning output.
- `git diff --check` passed, with Git reporting that `designs/pi_zero_usb_grove_ir_enclosure.scad` will be normalized from CRLF to LF when Git next touches it.

## Validation Skipped

- Physical fit, slicer inspection, and test prints were not performed.
- A full QA phase and separate code-review phase were skipped by design for this direct `super-agent` invocation.

## Documentation Changes

- `README.md` documents the top-cover IR PCB screw mount parameters, front-facing wall LED aperture, tuning parameters, and assembly notes.
- `README.md` documents the updated `ir_top_cover_pcb_center_y_mm = -16.7` default and the 7.0 mm closer-to-wall shift.
- `README.md` documents the 13.0 mm default extra upward headroom and the Micro USB power-side opening height matching the mini-HDMI opening height.
