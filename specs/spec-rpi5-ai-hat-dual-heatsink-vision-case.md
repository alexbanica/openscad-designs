# Raspberry Pi 5 AI HAT+ Dual-Heatsink Vision Case Spec

Status: Approved

## Purpose

Define a parametric OpenSCAD 2021.01 design for a printable vertical AI vision tower enclosure that holds a Raspberry Pi 5, Raspberry Pi AI HAT+ or compatible Hailo module, two active heatsink/fan assemblies, and an official Raspberry Pi camera module on an adjustable forward stand.

## Problem Statement

A Raspberry Pi 5 with an AI HAT+ and two active coolers is taller and hotter than a normal single-board-computer case. A conventional closed or low-profile case can trap heat between the Pi active cooler and the AI HAT cooler, route hot exhaust into the camera area, and force tight CSI ribbon bends. The design needs an open, printable, editable enclosure architecture that prioritizes airflow, cable safety, and camera adjustability.

## Scope

- One primary OpenSCAD source file for the enclosure assembly.
- Parametric dimensions for board footprint, board stack height, cooler clearance, wall thickness, fastener clearances, vent geometry, camera arm geometry, and camera tilt.
- A clearly labeled top-level adjustable variables section in the OpenSCAD file.
- Printable component modules for:
  - vertical tower frame or base tray for Raspberry Pi 5 mounting,
  - open side wall structure,
  - bottom intake region,
  - top chimney or exhaust region,
  - removable or printable camera arm,
  - adjustable camera tilt bracket,
  - camera module holder,
  - CSI ribbon cable relief and routing features.
- Documentation files:
  - `README.md` with design intent, print guidance, parameter overview, and manual QA instructions.
  - `AGENTS.md` with repository-specific agent instructions for future OpenSCAD work.
- Compatibility with OpenSCAD 2021.01.
- Bambu Lab-friendly FDM printing constraints, including no reliance on exotic slicer features.

## Out Of Scope

- Electrical design, camera software, AI inference software, or Raspberry Pi OS setup.
- Thermal simulation or guaranteed temperature targets.
- Exact vendor-certified fit for every third-party AI HAT or heatsink variant.
- STEP, STL, or 3MF generated artifacts unless a future implementation plan explicitly adds them.
- Closed waterproofing, dust sealing, or acoustic isolation.
- Automated physical fit validation.

## Definitions

- Pi: Raspberry Pi 5 base board.
- AI HAT+: Raspberry Pi AI HAT+ or AI HAT+ 2 family board with the same nominal HAT footprint.
- Pi cooler: official Raspberry Pi 5 active cooler or equivalent CPU heatsink/fan assembly mounted on the Pi.
- AI cooler: official Raspberry Pi-style active heatsink/fan assembly mounted above the AI HAT.
- Tower: vertical enclosure orientation where the Pi lies horizontally and the board/cooler stack rises upward.
- Exhaust zone: open top region above the AI cooler intended to avoid blocking upward hot airflow.
- Intake zone: lower frame region with slots or open geometry for cooler intake air.
- Forward camera arm: camera support extending away from the tower so the camera is not directly above the hot exhaust path.

## Inputs And Constraints

- OpenSCAD compatibility target: 2021.01.
- Units: millimetres.
- Default Raspberry Pi 5 board dimensions: 85 mm x 56 mm, based on Raspberry Pi mechanical documentation.
- Default AI HAT+ board dimensions: approximately 66 mm x 56.5 mm, based on Raspberry Pi AI HAT documentation.
- Default official Camera Module 3 dimensions: 25 mm x 24 mm x 11.5 mm for the standard module, based on Raspberry Pi product documentation.
- The design must keep component dimensions and clearances as top-level configurable parameters.
- Parameter names must be descriptive and easy to adjust without reading the full model implementation.
- The design must not depend on OpenSCAD features introduced after 2021.01.
- The design should avoid library dependencies unless implemented with same-file helper modules or clearly documented optional includes.
- Geometry should be organized into named modules and functions with descriptive snake_case names.
- Top-level variable names should use descriptive snake_case names with units or purpose where helpful, such as `pi_board_length_mm`, `case_wall_thickness_mm`, `camera_arm_forward_offset_mm`, and `camera_tilt_angle_deg`.
- The design should use deterministic constructive solid geometry suitable for later Fusion 360 import or OpenSCAD modification.
- Vent and slot features must be sized for practical FDM printing and not rely on sub-nozzle-width details.

## Adjustable Variables Section

The OpenSCAD source must include a clearly marked section near the top of the file named `Adjustable Parameters` or equivalent. This section must group variables by purpose so future users and agents can adjust the design without hunting through implementation modules.

Required variable groups:

- Render controls:
  - full assembly versus individual printable parts,
  - electronics preview visibility,
  - optional cutaway or debug views if implemented.
- Board dimensions:
  - Raspberry Pi 5 length, width, thickness, mounting-hole offsets, and mounting-hole diameter.
  - AI HAT+ length, width, thickness, mounting-hole offsets, and mounting-hole diameter.
- Stack and cooler clearances:
  - Pi-to-HAT spacing,
  - Pi active cooler clearance height,
  - AI HAT cooler clearance height,
  - open air gap between coolers,
  - top exhaust clearance.
- Case structure:
  - wall thickness,
  - post diameter or rail width,
  - base thickness,
  - corner radius or chamfer size if used,
  - board clearance.
- Ventilation:
  - side opening count or spacing,
  - side rib width,
  - bottom intake slot dimensions,
  - top vent opening dimensions,
  - minimum printable rib and slot dimensions.
- Camera system:
  - camera board dimensions,
  - lens clearance diameter,
  - camera arm forward offset,
  - camera arm height offset,
  - camera tilt angle,
  - hinge or pivot screw clearance,
  - camera holder clearance.
- CSI ribbon routing:
  - ribbon width clearance,
  - ribbon bend relief radius,
  - cable channel width and height.
- Fasteners and print tolerances:
  - screw clearance diameter,
  - heat-set insert diameter if supported,
  - standoff height,
  - general fit tolerance,
  - layer-friendly clearance.

Variable naming requirements:

- Use `snake_case`.
- Include `_mm` for linear dimensions and `_deg` for angles.
- Avoid terse names such as `w`, `h`, `d`, `x1`, `p1`, or `gap` for top-level adjustable variables.
- Use component prefixes where useful, such as `pi_`, `ai_hat_`, `camera_`, `case_`, `vent_`, `ribbon_`, and `fastener_`.
- Keep derived values separate from user-adjustable values and place them in a later `Derived Values` section.
- Do not redefine user-adjustable values inside modules.

## Deterministic Behavior

- The main assembly renders a vertical tower layout with the Raspberry Pi 5 at the base, the AI HAT+ above it, a Pi cooler clearance volume, an open air gap between coolers, and a top exhaust zone.
- The case frame leaves both long sides substantially open using ribs, posts, or rail geometry rather than continuous closed side panels.
- The bottom of the tower provides intake slots or open geometry below and around the Pi cooler intake path.
- The top exhaust region provides a large opening above the AI cooler and does not place the camera directly over that exhaust region.
- The camera arm places the camera holder forward of the tower by a configurable offset.
- The camera holder supports a configurable tilt angle around a printable hinge or screw axis.
- The camera holder exposes the lens area and provides mounting holes or clamp geometry for an official Raspberry Pi camera module.
- CSI ribbon routing includes a smooth clearance channel or strain-relief path from the camera arm back toward the Pi camera connector region.
- All major fit-critical dimensions are parameterized at the top of the file.
- Top-level adjustable variables are grouped, named descriptively, and documented with brief comments when the name alone does not make the intent clear.
- Derived helper values are separated from user-adjustable variables so future changes are predictable.
- The source exposes component render toggles so a user can render the full assembly or individual printable parts.
- Default clearances are conservative enough for typical FDM printing and can be adjusted by parameters.
- The OpenSCAD code follows official OpenSCAD language guidance for 2021.01-compatible modules, functions, transformations, and `use`/`include` behavior.
- The design favors printable flat faces and limited overhangs suitable for Bambu Lab printers.

## Assumptions Proposed For Approval

- Default camera target is Raspberry Pi Camera Module 3 Standard. The camera dimensions remain parameterized so Camera Module 2, Module 3 Wide, or similar official modules can be adjusted later.
- The AI HAT+ and AI HAT+ 2 share the same default footprint for enclosure planning.
- The second AI cooler is modeled as a configurable clearance volume rather than as an exact aesthetic replica of a specific fan/heatsink SKU.
- The first implementation will produce editable OpenSCAD geometry and documentation, not exported mesh files.
- Fastener support will target common M2.5 Raspberry Pi mounting hardware with configurable screw and standoff clearances.
- The first implementation will use one primary `.scad` file so Fusion 360 and OpenSCAD users can modify it easily.
- Printable outputs will be separate renderable parts with a full-assembly preview mode.
- The implementation will include simplified non-printing preview modules for the Pi, HAT, coolers, and camera, controlled by a `show_electronics` parameter.

## Impact And Regression Considerations

- This repository currently contains only a minimal `README.md`; the change will establish repository conventions for OpenSCAD source, specs, and agent instructions.
- Future OpenSCAD files should follow the documented parameter, module, naming, and compatibility conventions introduced by this work.
- The new `AGENTS.md` should preserve the adjustable-variable naming rules for current and future `.scad` files.
- Since there are no existing designs, regression risk is mainly repository organization and future maintainability rather than behavior breakage.
- Generated geometry cannot be proven physically correct without printing or importing into CAD; the spec therefore requires explicit manual QA steps.

## Validation Plan

- Run OpenSCAD 2021.01-compatible syntax validation if `openscad` is available locally.
- Render or preview the main assembly and individual parts in OpenSCAD.
- Verify all render toggles compile independently.
- Verify `git diff --check` passes.
- Manually inspect the model for:
  - open side airflow,
  - bottom intake clearance,
  - unobstructed top exhaust,
  - forward camera placement,
  - no camera directly over top exhaust,
  - CSI ribbon path without sharp-bend geometry,
  - printable orientation and overhang reasonableness.
- If OpenSCAD is not installed, mark automated geometry validation as not run and provide manual validation instructions.

## Documentation Requirements

- Update `README.md` with:
  - project overview,
  - component assumptions,
  - OpenSCAD version requirement,
  - main parameters,
  - rendering/export instructions,
  - Bambu Lab printing notes,
  - manual fit and thermal QA checklist.
- Add `AGENTS.md` with:
  - OpenSCAD 2021.01 compatibility rules,
  - coding style for current and future `.scad` files,
  - validation commands,
  - documentation expectations,
  - instruction to preserve specs for behavior-changing work.

## Resolved Planning Decisions

- Use one primary `.scad` file for the first design so Fusion 360 and OpenSCAD users can modify it easily.
- Design separate renderable printable parts with a full-assembly preview mode because the camera arm and tower frame have different optimal print orientations.
- Include non-printing preview modules controlled by a `show_electronics` parameter to make clearance inspection easier.
