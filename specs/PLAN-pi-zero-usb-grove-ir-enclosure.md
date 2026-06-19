# PLAN: Pi Zero USB Grove Enclosure Top-Cover IR PCB Mount

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Affected Files

- `designs/pi_zero_usb_grove_ir_enclosure.scad`
- `README.md`
- `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`
- `specs/PLAN-pi-zero-usb-grove-ir-enclosure.md`

## Implementation Steps Performed

1. Loaded the `super-agent` skill and proceeded directly after the user explicitly requested super-agent implementation.
2. Inspected the current branch and dirty worktree state.
3. Preserved the existing top-cover IR PCB screw-boss mechanism and `20.15 mm` hole spacing.
4. Changed the default IR PCB center and LED local Y direction so the mounted PCB aligns with the front-facing `-Y` top-cover wall.
5. Replaced the prior vertical roof LED aperture with a Y-axis horizontal aperture through the front-facing top-cover wall.
6. Derived the aperture Y center from `front_wall_cutout_center_y_mm(...)` and the aperture depth from `wall_thickness_mm + ir_top_cover_led_aperture_wall_overtravel_mm`.
7. Kept roof vent keepouts for the screw bosses while removing roof-vent reservation for the old vertical LED aperture.
8. Fixed an OpenSCAD undefined-value warning by avoiding use of `preview_overlap_mm` before it is defined.
9. Fixed the front-wall aperture pass-through bug by adding `ir_top_cover_led_aperture_effective_depth_mm`, which includes the shared port clearance expected by the front-wall center helper.
10. Fixed the hidden IR PCB screw-hole bug by moving the pilot-hole subtraction anchor to the underside free face of each top-cover boss.
11. Updated the LED aperture Z derivation for upside-down IR PCB mounting, with the Grove male port/component side facing down into the enclosure.
12. Added a 5.0 mm maximum IR PCB screw length constraint including screw head, with boss height and pilot depth derived from usable remaining screw depth.
13. Moved the default IR PCB center to `X = 24.0` for right-side placement on the front-facing wall.
14. Updated README documentation for component assumptions, tuning guidance, render-mode descriptions, and assembly notes.
15. Replaced the previous spec and plan with these auto-approved completed-work artifacts describing the delivered front-wall LED orientation and pass-through bugfixes.
16. Shifted the IR PCB top-cover mount center Y from `-9.7` to `-16.7`, moving the screw bosses and pilot holes 7.0 mm closer to the front-facing IR LED aperture wall while preserving the `20.15 mm` screw-hole spacing.
17. Updated README and these auto-approved artifacts to record the completed 7.0 mm closer-to-wall screw-hole shift.

## Validation Run

- Targeted `rg` searches for stale roof/vertical LED aperture wording and front-wall LED aperture wording.
- Source inspection of the front-wall aperture center/depth pairing.
- Source inspection of the IR PCB screw pilot-hole Z anchor.
- Source inspection of the upside-down PCB LED height derivation.
- Source inspection of the derived 5.0 mm including-head screw-depth constraint.
- Source inspection of the front wall cutout spans and right-side IR PCB placement.
- Source inspection confirming the IR PCB mount-hole centers derive from `ir_top_cover_pcb_center_y_mm = -16.7`.
- `timeout 10 openscad -o /tmp/pi_zero_usb_grove_ir_top_cover_holes_7mm_closer.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad` completed within 10 seconds with no warning output.
- `timeout 10 openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout_holes_7mm_closer.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad` completed within 10 seconds with no warning output.
- `git diff --check`.

## Validation Skipped

- Slicer inspection, physical fit validation, and test prints were not performed.

## QA Skipped

QA was skipped by design because this invocation used the `super-agent` direct execution workflow.

## Code Review Skipped

Code review was skipped by design because this invocation used the `super-agent` direct execution workflow.

## Documentation Updates

- `README.md` now documents the upside-down IR PCB mount, right-side front-facing wall placement, `ir_top_cover_pcb_center_y_mm = -16.7`, the 7.0 mm closer-to-wall screw-hole shift, front-facing `-Y` top-cover wall LED aperture, effective pass-through depth, 5.0 mm maximum screw length including head, top-cover IR PCB screw mount, prior-pod-derived `20.15 mm` screw-hole spacing, and assembly caveats.
- The approved spec and plan were replaced with completed-work artifacts that describe the delivered front-wall LED orientation.

## Commit Status

Not committed. The user did not ask for a commit.

## Push Status

Not pushed. No commit was created.

## Residual Risk

- `origin/master` is unavailable in this clone; the old pod hole spacing was taken from `origin/main`.
- The internal top-cover bosses, upside-down PCB, LED body, Grove male port, and cable path have not been slicer-inspected or physically test-fit.
- The default 2.2 mm screw engagement into printed bosses may need tuning after measuring the actual screw head height and testing retention.
- The PCB, LED body, Grove cable, and Grove HAT vertical clearance are not modeled as installed hardware in the current simplified enclosure source.
