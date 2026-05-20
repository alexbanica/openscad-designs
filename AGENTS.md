# Repository Instructions

## Scope

These instructions apply to this OpenSCAD design repository.

## Development Approach

- Behavior-changing work must start from an approved spec under `specs/`.
- Keep generated mesh exports such as STL, STEP, and 3MF files out of source control unless an approved plan explicitly adds them.
- Prefer one editable `.scad` source file per coherent design unless a spec approves a multi-file split.

## OpenSCAD Rules

- Target OpenSCAD 2021.01-compatible syntax for current and future `.scad` files.
- Avoid external library dependencies unless the approved spec and README document them.
- Keep user-adjustable variables near the top of each `.scad` file in a clearly labeled `Adjustable Parameters` section.
- Group adjustable variables by purpose and keep derived values in a separate `Derived Values` section.
- Use descriptive `snake_case` names.
- Use `_mm` for linear dimensions and `_deg` for angles.
- Do not redefine user-adjustable values inside modules.
- Use named modules for major printable parts, previews, and repeated helper geometry.

## Validation

When OpenSCAD is installed, validate changed `.scad` files with syntax or preview/export checks for each documented render mode. For this design, useful checks are:

```sh
openscad -o /tmp/rpi5_ai_hat_dual_heatsink_vision_case.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_tower.off -D 'render_mode="tower"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_camera_arm.off -D 'render_mode="camera_arm"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_camera_holder.off -D 'render_mode="camera_holder"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
git diff --check
```

If OpenSCAD is unavailable, report that geometry validation was not run and provide the manual inspection checklist from the README.

## Documentation

Update `README.md` when design behavior, render modes, parameters, printing guidance, or validation workflow changes.
