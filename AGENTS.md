# Repository Instructions

## Scope

These instructions apply to this OpenSCAD design repository.

## Development Approach

- Behavior-changing work must start from an approved spec under `specs/`.
- Keep generated mesh exports such as STL, STEP, and 3MF files out of source control unless an approved plan explicitly adds them.
- Prefer one editable `.scad` source file per coherent design unless a spec approves a multi-file split.
- Design and printing guidance should maintain compatibility with the Bambu Lab P2S printer and AMS 2 Pro unless an approved spec explicitly narrows or changes printer support.
- If otherwise unspecified, committing and pushing directly to the `main` branch is acceptable for this repository.

## OpenSCAD Rules

- Target OpenSCAD 2021.01-compatible syntax for current and future `.scad` files.
- Avoid external library dependencies unless the approved spec and README document them.
- Keep user-adjustable variables near the top of each `.scad` file in a clearly labeled `Adjustable Parameters` section.
- Group adjustable variables by purpose and keep derived values in a separate `Derived Values` section.
- Use descriptive `snake_case` names.
- Use `_mm` for linear dimensions and `_deg` for angles.
- Do not redefine user-adjustable values inside modules.
- Use named modules for major printable parts, previews, and repeated helper geometry.
- Future `.scad` files that require Raspberry Pi Zero board geometry should use `designs/pi_zero.scad` as the fit and clearance reference instead of duplicating board models.
- Future `.scad` files that require Raspberry Pi 5 board geometry should use `designs/rpi5.scad` as the fit and clearance reference instead of duplicating board models.
- Dependent cases, supports, enclosures, and accessories should keep these Raspberry Pi reference models toggleable from child designs.

## Validation

This project does not require QA or unit tests unless a spec or user request explicitly asks for them.

OpenSCAD is installed in the local environment and may be used for implementation support, fit inspection, and QA.

Allowed OpenSCAD usage:

- Render `.scad` files locally to inspect whether geometry is connected, aligned, and plausibly printable.
- Export temporary preview artifacts to `/tmp` for review when helpful.
- Use OpenSCAD-generated previews to evaluate clip engagement, pod attachment, hole placement, cutout alignment, wall continuity, and other visible printability risks.
- Use OpenSCAD as a supplement to code review when a user asks for stronger confidence in fit or printability.

Constraints:

- Do not add generated mesh exports such as STL, STEP, 3MF, OFF, or similar artifacts to source control unless an approved spec explicitly requires them.
- Prefer temporary outputs under `/tmp` when generating local inspection artifacts.
- Treat OpenSCAD render review as visual validation, not as a substitute for physical measurement, slicer inspection, or test prints.

Minimum validation for repository changes remains `git diff --check`. When working in git, run:

```sh
git diff --check
```

When a change affects printable geometry and OpenSCAD-based inspection is useful, additionally run local OpenSCAD renders or exports as needed and report what was visually validated.

## Documentation

Update `README.md` when design behavior, render modes, parameters, printing guidance, or validation workflow changes, including when OpenSCAD-assisted validation guidance changes.
