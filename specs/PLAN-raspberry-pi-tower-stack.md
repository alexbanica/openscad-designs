# PLAN: Raspberry Pi Tower Stack Enclosure

Status: Approved

## Approved Spec

- `specs/SPEC-raspberry-pi-tower-stack.md`

## Scope

Implement the approved Raspberry Pi tower stack enclosure corrections in the
existing OpenSCAD design and update README documentation, including the
corrected board order: PCB 1 NVMe, PCB 2 placeholder, PCB 3 NVMe, PCB 4
Raspberry Pi 5, PCB 5 Cluster HAT-style top board.

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

- `designs/raspberry_pi_tower_stack.scad`: printable tower-stack enclosure source
  only.
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
     - PCB 1 and PCB 3 NVMe board parameters/modules,
     - per-gap PCB spacing controls,
     - fourth-board Raspberry Pi 5 reference integration,
     - fourth-board Raspberry Pi 5 alignment inside the shared tower footprint
       and enclosure envelope,
     - fifth-board Cluster HAT-style top-board parameters/modules,
     - top-cover clearance parameter,
     - top-cover male pin parameters/modules,
     - bottom-tray female socket parameters/modules,
     - shallow bottom-tray/taller top-cover split,
     - anti-slip bottom recess parameters/modules,
     - PCB mounting insert parameters/modules,
     - Raspberry Pi 5 access/cutout references,
     - Pi 5 USB-A/Ethernet and GPIO/HAT-pin access cutout modules,
     - Pi 5-zone ventilation modules,
     - under-Pi5 airflow parameters/modules for NVMe heatsinks and PCI splitter,
     - PCB 1 and PCB 3 NVMe airflow parameters/modules,
     - two usable fan-mount parameters/modules,
     - fan airflow openings/grilles for both mounts,
     - intake/exhaust fan direction parameters or documentation,
     - display-cover and display-window parameters/modules,
     - display cover inclusion in assembly and printable layout,
     - header-splitter preview parameters/modules,
     - README documentation entries.
   - Permanent test files are not required unless the implementation command
     determines a small scoped script is worthwhile.

4. Update `designs/raspberry_pi_tower_stack.scad`.
   - Use OpenSCAD 2021.01-compatible syntax and no external libraries.
   - Add grouped `Adjustable Parameters` near the top:
     - render controls and visibility toggles,
     - generic PCB and stack dimensions,
     - NVMe board and airflow values for PCB 1 and PCB 3,
     - per-gap PCB spacing and top-cover clearance,
     - Raspberry Pi 5 board and port source values or local mirrors,
     - Raspberry Pi 5 board transform/alignment offsets if needed,
     - Cluster HAT-style top-board values,
     - enclosure wall/floor/roof/clearance values,
     - shallow bottom-tray and taller top-cover split values,
     - board mounting/support and PCB insert values,
     - bottom anti-slip recess values,
     - top-cover male pin and bottom-tray socket values,
     - Raspberry Pi 5-zone ventilation values,
     - under-Pi5 NVMe/heatsink/PCI splitter airflow and clearance values,
     - fan footprint, hole spacing, screw, boss, and placement values,
     - fan intake/exhaust direction labels or flags,
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

5. Fix reference/electronics integration and PCB alignment.
   - `use <rpi5.scad>` for the fourth-board Raspberry Pi 5 visual reference.
   - Provide an electronics/reference render that can show:
     - all five board positions,
     - simplified NVMe board references for boards 1 and 3,
     - simplified placeholder board for board 2,
     - the Raspberry Pi 5 reference for board 4,
     - simplified Cluster HAT-style reference for board 5,
     - optional Raspberry Pi 5 active cooler if exposed by the reference,
     - simplified GPIO/header previews,
     - simplified vertical/lateral header splitter,
     - fan previews,
     - display preview.
   - Normalize the Raspberry Pi 5 reference transform to the same board-origin
     convention used by placeholder PCBs.
   - Confirm the Pi 5 board outline, mounting-hole positions, GPIO/header area,
     and port/service mirror references remain inside the tray/cover envelope.
   - Keep cutout/source mirror coordinates consistent with the corrected Pi 5
     transform.
   - Do not duplicate or alter existing reference modules.

6. Implement stack positioning.
   - Use a configurable list/vector for the four gaps between five PCBs.
   - Derive each PCB bottom/top Z position from the gap list, board thickness,
     and standoff/floor settings.
   - Ensure changing one gap affects only the intended adjacent board placement
     and downstream stack height.
   - Keep the fourth PCB defaulted to the Raspberry Pi 5 reference position.
   - Keep PCB 1 and PCB 3 defaulted to NVMe board references.
   - Keep PCB 5 defaulted to the Cluster HAT-style top board.

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
     - PCB mounting insert holes,
     - anti-slip bottom recesses,
     - cover plug pins,
     - tray socket holes,
     - Raspberry Pi 5 port/service cutout volumes,
     - Pi 5 GPIO/HAT-pin access and perpendicular branch cutout volumes,
     - Raspberry Pi 5-zone ventilation cutout volumes,
     - NVMe board airflow cutout volumes,
     - fan mount bodies, bosses, holes, and airflow openings,
     - display cover body and display-window cutout,
     - header-splitter preview geometry,
     - rounded-box or repeated helper geometry.
   - Use difference/union structure similar to existing enclosures where
     appropriate.

8. Implement the bottom tray.
   - Include floor, shallow side walls, internal clearance, corner radius, and
     stack support/mounting geometry.
   - Keep the bottom tray the small/shallow half and put the main enclosure
     stack height into the top cover.
   - Align mounting/support geometry to the Raspberry Pi-size mounting-hole
     pattern.
   - Add PCB mounting insert holes and screw pilot holes in the standoffs.
   - Add configurable anti-slip recess holes on the tray underside.
   - Subtract female socket holes for the top-cover pins.
   - Subtract tray-side portions of Raspberry Pi 5 port/service openings where
     the fourth-board service envelope intersects the tray.
   - Add under-Pi5 airflow cutouts/passages beneath the fourth board for NVMe
     heatsinks and the PCI splitter.
   - Add bottom-tray airflow cutouts for PCB 1 and side airflow cutouts for PCB
     1 and PCB 3 NVMe board zones.
   - Keep under-Pi5 cutouts adjustable and avoid weakening standoffs, socket
     receivers, cover-pin interfaces, and mounting supports.
   - Keep the tray printable with the broad stable face on the print plane.

9. Implement the top cover.
   - Include roof, skirt/drop depth, fit clearance, internal clearance, and male
     cylindrical plug pins.
   - Keep the top cover the larger/taller half of the enclosure.
   - Use top-cover-owned male pins and bottom-tray-owned female sockets by
     default.
   - Make pin diameter, insertion length, count, positions, socket clearance,
     and socket depth adjustable.
   - Derive enclosure height from the configured board stack and
     top-of-highest-PCB-to-cover clearance parameter.
   - Subtract top-cover portions of Raspberry Pi 5 access openings where needed.
   - Subtract explicit Pi 5 GPIO/HAT-pin top access and side pass-through
     openings for the perpendicular header/display branch.
   - Subtract fan airflow openings and top-cover ventilation.
   - Ensure the display cover geometry is visible in assembly and represented in
     printable layout.
   - Ensure default pin/socket positions avoid ports, Pi 5 ventilation, fan
     mounts, display cover geometry, and board supports.

10. Implement Raspberry Pi 5 access and service openings.
    - Provide openings or access paths for:
      - fourth-board mounting holes,
     - two USB-A ports,
     - Ethernet,
      - GPIO/HAT pin access for the perpendicular display branch,
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
   - Add lower-side and/or bottom-tray under-Pi5 airflow openings for the NVMe
     heatsink and PCI splitter area.
   - Make under-Pi5 airflow count, size, spacing, enablement, and position
     adjustable.
   - Preserve material around tray sockets, standoffs, and board supports.
   - Add NVMe board airflow openings for PCB 1 and PCB 3.
   - Make NVMe airflow count, size, spacing, enablement, and position
     adjustable.

12. Implement the two top-cover fan mounts.
   - Add two configurable internal square fan footprints matching the supplied
     small axial fan style.
   - For each mount, include:
     - a fan body/envelope preview toggle,
     - a real airflow opening or grille through the top cover,
     - configurable screw holes or bosses aligned to fan-hole spacing,
     - configurable fan body size, thickness, hole spacing, screw-hole diameter,
       boss diameter, and mount center.
   - Defaults must allow both fan mounts to be physically populated.
   - Add parameters or clear source documentation for one default intake fan and
     one default exhaust fan.
   - Ensure both fans mount on the inside face of the top cover.
   - Ensure both fan positions have through-cover airflow openings or grilles.
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
   - Ensure assembly mode shows the screen/display cover when display cover
     previews are enabled.
   - Ensure printable layout includes the display cover as a grounded, separated
     printable part unless the implementation explicitly keeps it integrated
     with another printable part.
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
   - Update the design file list entry as needed.
   - Update the Raspberry Pi tower stack enclosure section.
   - Document component assumptions, manually entered dimensions, source
     relationship to `rpi5.scad`, render modes, common adjustable parameters,
     corrected board order, per-gap stack spacing, top-cover clearance, Pi 5
     access, Pi 5-zone ventilation, under-Pi5 airflow for NVMe heatsinks/PCI
     splitter, PCB 1/PCB 3 NVMe airflow, two-fan intake/exhaust support, display
     cover/window behavior, header-splitter assumptions, Bambu-friendly
     printability, and validation commands.
   - Document any mirrored Raspberry Pi 5 connector values if the implementation
     uses local mirrors.

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
     - PCB 1 and PCB 3 are NVMe board references,
     - fourth board is the Raspberry Pi 5 reference and is aligned inside the
       tower footprint/enclosure envelope,
     - fifth board is the Cluster HAT-style top-board reference,
     - top-cover clearance parameter affects enclosure height,
     - bottom tray is shallow and top cover carries the larger height,
     - bottom tray includes anti-slip recesses,
     - bottom tray standoffs include PCB mounting insert holes,
     - all required Raspberry Pi 5 access openings exist,
     - Pi 5 USB-A/Ethernet and GPIO/HAT-pin openings exist,
     - extra Pi 5-zone ventilation is real subtractive geometry,
     - under-Pi5 airflow passages exist for the NVMe/heatsink/PCI splitter area,
     - NVMe airflow passages exist for PCB 1 and PCB 3,
     - top cover has two internally usable fan mounts,
     - both fan mounts have through-cover airflow openings,
     - one fan is documented as intake and one as exhaust,
     - display cover appears in assembly/printable layout and exposes only the
       display window by default,
     - header splitter has vertical and lateral preview geometry,
     - top cover has male pins,
     - bottom tray has matching female sockets,
     - default pin/socket geometry avoids ports, vents, fan mounts, display cover
       geometry, and supports,
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
