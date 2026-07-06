# PLAN: Raspberry Pi Tower Stack Enclosure

Status: Approved

## Approved Spec

- `specs/SPEC-raspberry-pi-tower-stack.md`

## Scope

Implement the approved Raspberry Pi tower stack enclosure as a new OpenSCAD
design and update README documentation.

Do not implement behavior outside the approved spec.

## Branch

- Work may continue on `main`, because repository instructions allow direct
  commits to `main` when otherwise unspecified.
- Do not create a feature branch unless the user explicitly requests one before
  implementation starts.

## Affected Files

- `designs/raspberry_pi_tower_stack.scad`
- `README.md`
- `specs/SPEC-raspberry-pi-tower-stack.md`
- `specs/PLAN-raspberry-pi-tower-stack.md`

Generated OpenSCAD outputs must be written only under `/tmp` and must not be
committed.

## Ownership Boundaries

- `designs/raspberry_pi_tower_stack.scad`: new printable tower-stack enclosure
  source only.
- `README.md`: document the new design source, assumptions, manually entered
  dimensions, render modes, adjustable parameters, Pi 5 access, ventilation,
  fan/display tuning, printability, and validation commands.
- Spec and plan files: status and planning artifacts only.

Do not change existing Pi Zero, Grove, Waveshare, Raspberry Pi 5 reference,
Raspberry Pi 5 active cooler, AI HAT+ reference, or existing enclosure behavior
unless implementation discovers a strict OpenSCAD visibility blocker. If such a
blocker requires helper/accessor changes, stop and request plan amendment before
editing existing sources.

## Implementation Steps

1. Verify clean-context implementation boundary.
   - Implementation must start only in a fresh session, explicitly cleared
     context, or after explicit user confirmation to continue in the current
     context.
   - Load only applicable instructions, the approved spec, this approved plan,
     current worktree state, and minimal file context needed for the listed
     files.

2. Inspect target context only.
   - Read `AGENTS.md` and `/home/alexbanica/workspace.md`.
   - Read the approved spec and approved plan.
   - Read existing local patterns from:
     - `designs/rpi5.scad`,
     - `designs/rpi5_active_cooler.scad`,
     - relevant pin/socket and tray/cover modules from
       `designs/pi_zero_usb_grove_ir_enclosure.scad`,
     - relevant mirrored Pi 5 cutout and README patterns from
       `designs/rpi5_ai_hat_plus_26t_enclosure.scad`,
     - relevant README sections.

3. Add test-first/check-first coverage.
   - Because this repository has no unit-test framework, use deterministic
     source checks and OpenSCAD render validation rather than adding a
     persistent test harness.
   - Before production implementation, the test-focused subagent must define
     source assertions for:
     - required render modes,
     - five-PCB stack parameters,
     - per-gap PCB spacing controls,
     - fourth-board Raspberry Pi 5 reference integration,
     - top-cover clearance parameter,
     - top-cover male pin parameters/modules,
     - bottom-tray female socket parameters/modules,
     - Raspberry Pi 5 access/cutout references,
     - Pi 5-zone ventilation modules,
     - two fan-mount parameters/modules,
     - display-cover and display-window parameters/modules,
     - header-splitter preview parameters/modules,
     - README documentation entries.
   - Permanent test files are not required unless the implementation command
     determines a small scoped script is worthwhile.

4. Create `designs/raspberry_pi_tower_stack.scad`.
   - Use OpenSCAD 2021.01-compatible syntax and no external libraries.
   - Add grouped `Adjustable Parameters` near the top:
     - render controls and visibility toggles,
     - generic PCB and stack dimensions,
     - per-gap PCB spacing and top-cover clearance,
     - Raspberry Pi 5 board and port source values or local mirrors,
     - enclosure wall/floor/roof/clearance values,
     - board mounting/support values,
     - top-cover male pin and bottom-tray socket values,
     - Raspberry Pi 5-zone ventilation values,
     - fan footprint, hole spacing, screw, boss, and placement values,
     - display body/window/cover placement values,
     - vertical/lateral header-splitter preview values,
     - printable layout values,
     - visual settings.
   - Add a separate `Derived Values` section for board positions, enclosure
     envelope, internal dimensions, stack height, cutout centers, fan centers,
     display-cover placement, printable-layout placement, and pin/socket
     centers.
   - Keep all linear variables suffixed `_mm` and angle variables suffixed
     `_deg`.

5. Implement reference/electronics integration.
   - `use <rpi5.scad>` for the fourth-board Raspberry Pi 5 visual reference.
   - Provide an electronics/reference render that can show:
     - all five board positions,
     - simplified placeholder boards for boards 1, 2, 3, and 5,
     - the Raspberry Pi 5 reference for board 4,
     - optional Raspberry Pi 5 active cooler if exposed by the reference,
     - simplified GPIO/header previews,
     - simplified vertical/lateral header splitter,
     - fan previews,
     - display preview.
   - Do not duplicate or alter existing reference modules.

6. Implement stack positioning.
   - Use a configurable list/vector for the four gaps between five PCBs.
   - Derive each PCB bottom/top Z position from the gap list, board thickness,
     and standoff/floor settings.
   - Ensure changing one gap affects only the intended adjacent board placement
     and downstream stack height.
   - Keep the fourth PCB defaulted to the Raspberry Pi 5 reference position.

7. Implement printable part modules.
   - Add named modules for:
     - render dispatch,
     - assembled enclosure,
     - bottom tray,
     - top cover,
     - display cover,
     - printable layout,
     - electronics/reference preview,
     - tray shell,
     - cover shell,
     - board supports/standoffs,
     - cover plug pins,
     - tray socket holes,
     - Raspberry Pi 5 port/service cutout volumes,
     - Raspberry Pi 5-zone ventilation cutout volumes,
     - fan mount bodies, bosses, holes, and airflow openings,
     - display cover body and display-window cutout,
     - header-splitter preview geometry,
     - rounded-box or repeated helper geometry.
   - Use difference/union structure similar to existing enclosures where
     appropriate.

8. Implement the bottom tray.
   - Include floor, side walls, internal clearance, corner radius, and stack
     support/mounting geometry.
   - Align mounting/support geometry to the Raspberry Pi-size mounting-hole
     pattern.
   - Subtract female socket holes for the top-cover pins.
   - Subtract tray-side portions of Raspberry Pi 5 port/service openings where
     the fourth-board service envelope intersects the tray.
   - Keep the tray printable with the broad stable face on the print plane.

9. Implement the top cover.
   - Include roof, skirt/drop depth, fit clearance, internal clearance, and male
     cylindrical plug pins.
   - Use top-cover-owned male pins and bottom-tray-owned female sockets by
     default.
   - Make pin diameter, insertion length, count, positions, socket clearance,
     and socket depth adjustable.
   - Derive enclosure height from the configured board stack and
     top-of-highest-PCB-to-cover clearance parameter.
   - Subtract top-cover portions of Raspberry Pi 5 access openings where needed.
   - Subtract fan airflow openings and top-cover ventilation.
   - Ensure default pin/socket positions avoid ports, Pi 5 ventilation, fan
     mounts, display cover geometry, and board supports.

10. Implement Raspberry Pi 5 access and service openings.
    - Provide openings or access paths for:
      - fourth-board mounting holes,
      - two USB-A ports,
      - Ethernet,
      - USB-C power,
      - two micro-HDMI ports,
      - camera/display connector A,
      - camera/display connector B,
      - PCIe connector/guidance area,
      - microSD slot/card access.
    - Derive from `rpi5.scad` connector origins/sizes when possible.
    - If OpenSCAD `use` visibility requires local mirrors, name them clearly as
      Raspberry Pi 5 reference mirrors and document them in code comments and
      README.
    - Add grouped clearance values so physical fit can be tuned later.

11. Implement Raspberry Pi 5-zone ventilation.
    - Add real subtractive side and/or top ventilation openings near the
      fourth-board Raspberry Pi 5 zone.
    - Make Pi 5-zone ventilation count, size, spacing, face/side enablement, and
      position adjustable.
    - Keep default ventilation from intersecting the male/female interface,
      board supports, fan screw bosses, and required port cutouts.

12. Implement the two top-cover fan mounts.
    - Add two configurable internal square fan footprints matching the supplied
      small axial fan style.
    - For each mount, include:
      - a fan body/envelope preview toggle,
      - a real airflow opening or grille through the top cover,
      - configurable screw holes or bosses aligned to fan-hole spacing,
      - configurable fan body size, thickness, hole spacing, screw-hole
        diameter, boss diameter, and mount center.
    - Defaults must allow only one fan to be populated physically while still
      providing a second compatible mount.
    - Keep the two fan mounts non-intersecting by default.

13. Implement the display cover and header splitter.
    - Add simplified vertical and lateral header-splitter preview geometry
      attached to the Pi 5 GPIO/header area.
    - Add a perpendicular display preview connected to the lateral header path.
    - Add printable display cover geometry around the display PCB/body.
    - Subtract a display-window opening sized to the active display face plus
      adjustable clearance.
    - Ensure the default display cover hides/covers the display PCB/body while
      leaving only the active display face/window exposed.
    - If the display cover is separate, include it in `display_cover` and
      `printable_layout`; if it is integrated, make `display_cover` isolate the
      printable region for inspection.

14. Implement render modes.
    - `assembly`: assembled enclosure with optional electronics/reference
      geometry.
    - `bottom_tray`: printable bottom tray only.
    - `top_cover`: printable top cover only.
    - `display_cover`: display cover or isolated display-cover region.
    - `electronics`: five-board stack reference only.
    - `printable_layout`: all printable parts separated on the print plane with
      no floating printable geometry.

15. Update `README.md`.
    - Add the new design file to the design list.
    - Add a new Raspberry Pi tower stack enclosure section.
    - Document component assumptions, manually entered dimensions, source
      relationship to `rpi5.scad`, render modes, common adjustable parameters,
      per-gap stack spacing, top-cover clearance, Pi 5 access, Pi 5-zone
      ventilation, two-fan support, one-fan initial use, display cover/window
      behavior, header-splitter assumptions, Bambu-friendly printability, and
      validation commands.
    - Document any mirrored Raspberry Pi 5 connector values if the
      implementation uses local mirrors.

16. Validate.
    - Run `git diff --check`.
    - Run deterministic source checks defined by the test-focused subagent or
      equivalent shell checks.
    - Run OpenSCAD exports to `/tmp`:
      - `openscad -o /tmp/raspberry_pi_tower_stack_assembly.off -D 'render_mode="assembly"' designs/raspberry_pi_tower_stack.scad`
      - `openscad -o /tmp/raspberry_pi_tower_stack_bottom_tray.off -D 'render_mode="bottom_tray"' designs/raspberry_pi_tower_stack.scad`
      - `openscad -o /tmp/raspberry_pi_tower_stack_top_cover.off -D 'render_mode="top_cover"' designs/raspberry_pi_tower_stack.scad`
      - `openscad -o /tmp/raspberry_pi_tower_stack_display_cover.off -D 'render_mode="display_cover"' designs/raspberry_pi_tower_stack.scad`
      - `openscad -o /tmp/raspberry_pi_tower_stack_electronics.off -D 'render_mode="electronics"' designs/raspberry_pi_tower_stack.scad`
      - `openscad -o /tmp/raspberry_pi_tower_stack_printable_layout.off -D 'render_mode="printable_layout"' designs/raspberry_pi_tower_stack.scad`
    - If any OpenSCAD render takes more than 15 seconds, stop that render and
      report the timeout as required by repository instructions.
    - If local OpenSCAD fails or is unavailable, report the blocker and mark
      delivery draft unless the user explicitly accepts source-only validation.

17. Main-agent QA.
    - Inspect diffs for spec mapping and regression risk.
    - Inspect OpenSCAD outputs if generated successfully.
    - Confirm:
      - all required render modes generate,
      - five board positions exist and use configurable spacing,
      - fourth board is the Raspberry Pi 5 reference,
      - top-cover clearance parameter affects enclosure height,
      - all required Raspberry Pi 5 access openings exist,
      - extra Pi 5-zone ventilation is real subtractive geometry,
      - top cover has two fan mounts,
      - one-fan use remains valid,
      - display cover exposes only the display window by default,
      - header splitter has vertical and lateral preview geometry,
      - top cover has male pins,
      - bottom tray has matching female sockets,
      - default pin/socket geometry avoids ports, vents, fan mounts, display
        cover geometry, and supports,
      - printable layout has all printable parts separated on the print plane,
      - no generated mesh files are tracked.

18. Final review and delivery.
    - Run a code-review pass against the approved spec and this plan.
    - Resolve in-scope review or QA findings before final delivery.
    - Commit only if implementation, review, QA, validation, and documentation
      are complete.
    - Use a non-draft commit message only if all required validation passes, for
      example:
      - `feature: Add Raspberry Pi tower stack enclosure`
    - Use `DRAFT` in the commit message if OpenSCAD validation or required
      review/QA is blocked or incomplete.
    - Push only if commit succeeds and repository access permits.

## Required Implementation Subagents

For behavior-changing implementation, the implementation command must use:

- exactly one clean-context test-focused subagent before production
  implementation,
- exactly one clean-context implementation subagent for production
  implementation,
- exactly one clean-context code-review subagent after implementation.

If subagent tooling is unavailable, implementation must stop and report the
blocker.

Per workspace instructions, all spawned test-focused and developer subagents
must use `gpt-5.3-codex-spark`.

Subagents must receive only:

- the approved spec,
- this approved plan,
- their exact assignment,
- their ownership boundary,
- minimal relevant file context.

Review subagents must not implement fixes. In-scope review or QA fixes must be
routed to a new clean-context implementation subagent with the specific finding
and minimal relevant context.

## No-Research Constraint

Implementation must not perform additional product research, architecture
research, scope discovery, planning research, or plan discovery.

Implementation may inspect only:

- applicable instructions,
- the approved spec,
- this approved plan,
- current branch/worktree state,
- files named or directly implied by this plan,
- minimal local patterns needed to edit those files correctly.
