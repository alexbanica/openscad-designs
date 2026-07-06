# PLAN: Raspberry Pi 5 Five-Stack Enclosure

Status: Approved

## Approved Spec

- `specs/SPEC-pi5-five-stack-enclosure.md`

## Scope

Implement the approved five-stack enclosure as a new OpenSCAD design and update
README documentation. The default five-position stack uses PCB 4 as the
Raspberry Pi 5 reference/access level.

Do not implement behavior outside the approved spec.

## Branch

- Work may continue on `main`, because repository instructions allow direct
  commits to `main` when otherwise unspecified.
- Do not create a feature branch unless the user explicitly requests one before
  implementation starts.

## Affected Files

- `designs/pi5_five_stack_enclosure.scad`
- `README.md`
- `specs/SPEC-pi5-five-stack-enclosure.md`
- `specs/PLAN-pi5-five-stack-enclosure.md`

Generated OpenSCAD outputs must be written only under `/tmp` and must not be
committed.

## Ownership Boundaries

- `designs/pi5_five_stack_enclosure.scad`: new printable enclosure source only.
- `README.md`: document the new design source, assumptions, manually entered
  dimensions, render modes, adjustable parameters, base-board mounting,
  inter-board spacing, airflow, anti-slip behavior, male/female connection,
  printability, and validation commands.
- Spec and plan files: status and planning artifacts only.

Do not change existing Pi Zero, Grove, Waveshare, Raspberry Pi 5 reference,
Raspberry Pi 5 active cooler, AI HAT+ reference, AI HAT+ enclosure, or any
existing enclosure behavior unless implementation discovers a strict OpenSCAD
visibility blocker. If such a blocker requires helper/accessor changes, stop and
request plan amendment before editing existing sources.

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
     - relevant pin/socket, tray/cover, and anti-slide modules from
       `designs/pi_zero_usb_grove_ir_enclosure.scad`,
     - relevant mirrored Pi 5 port/cutout, socket-boss, anti-slide, ventilation,
       and README patterns from `designs/rpi5_ai_hat_plus_26t_enclosure.scad`,
     - relevant README sections.

3. Add test-first/check-first coverage.
   - Because this repository has no unit-test framework, use deterministic
     source checks and OpenSCAD render validation rather than adding a
     persistent test harness.
   - Before production implementation, the test-focused subagent must define
     source assertions for:
     - required render modes,
     - five-board stack parameters/modules,
     - Raspberry Pi 5 stack index controls,
     - per-gap PCB spacing controls,
     - top-cover clearance parameter,
     - spacing-derived board positions,
     - spacing-derived airflow gap centers,
     - bottom-tray base-PCB standoffs,
     - bottom-tray screw pilot or insert parameters/modules,
     - top-cover male pin parameters/modules,
     - bottom-tray female socket parameters/modules,
     - bottom anti-slip recess parameters/modules,
     - Raspberry Pi 5 port/service access terms,
     - inter-PCB airflow parameters/modules,
     - printable-layout two-part constraint,
     - README documentation entries.
   - Permanent test files are not required unless the implementation command
     determines a small scoped script is worthwhile.

4. Create `designs/pi5_five_stack_enclosure.scad`.
   - Use OpenSCAD 2021.01-compatible syntax and no external libraries.
   - Add grouped `Adjustable Parameters` near the top:
     - render controls and visibility toggles,
     - five-board stack count and per-gap spacing values,
     - top-of-stack clearance value,
     - Raspberry Pi 5 board and port source values or local mirrors,
     - configured Pi 5 board index defaulting to PCB 4,
     - enclosure wall/floor/roof/clearance values,
     - shallow bottom-tray and taller top-cover split values,
     - base-board mounting/support values,
     - screw pilot and optional insert values,
     - bottom anti-slip recess values,
     - top-cover male pin and bottom-tray socket values,
     - inter-PCB side airflow values,
     - optional top/bottom ventilation values if implemented,
     - printable layout values,
     - visual settings.
   - Add a separate `Derived Values` section for board positions, inter-PCB gap
     centers, enclosure envelope, stack height, internal dimensions, cutout
     centers, printable-layout placement, and pin/socket centers.
   - Keep all linear variables suffixed `_mm` and angle variables suffixed
     `_deg`.

5. Implement reference/electronics integration.
   - `use <rpi5.scad>` for Raspberry Pi 5 visual reference modules.
   - Provide an electronics/reference render that can show all five PCB
     positions using the same footprint and coordinate frame, with the
     Raspberry Pi 5 reference at PCB 4 by default and generic placeholders for
     the other PCB positions.
   - Include toggles for showing the five-board reference stack and any
     rpi5-reference options exposed through module parameters.
   - Do not duplicate or alter existing reference modules.
   - If OpenSCAD `use` visibility prevents direct use of source variables,
     mirror the current Raspberry Pi 5 dimensions and connector values locally,
     name them clearly as mirrors, and document that relationship in README.

6. Implement stack positioning.
   - Use a configurable four-value list/vector for the four gaps between five
     PCBs.
   - Derive each PCB bottom/top Z position from the gap list, board thickness,
     floor thickness, and base standoff height.
   - Ensure changing one gap affects the intended downstream board placement,
     inter-PCB airflow center, and top-cover height.
   - Keep `stack_board_count = 5` or an equivalent invariant/default.

7. Implement printable part modules.
   - Add named modules for:
     - render dispatch,
     - assembled enclosure,
     - bottom tray,
     - top cover,
     - printable layout,
     - electronics/reference preview,
     - tray shell,
     - cover shell,
     - base-board standoffs/supports,
     - screw pilot or insert holes,
     - anti-slip bottom recesses,
     - cover plug pins,
     - tray socket holes and receiver bosses,
     - Raspberry Pi 5 port/service cutout volumes,
     - inter-PCB side airflow cutout volumes,
     - optional top/bottom ventilation cutout volumes if implemented,
     - rounded-box or repeated helper geometry.
   - Use difference/union structure similar to existing enclosures where
     appropriate.

8. Implement the bottom cover/tray.
   - Include floor, shallow side wall or locating lip, internal clearance, corner
     radius, and base-board mounting/support geometry.
   - Keep the bottom cover/tray the smaller/shallow enclosure half by default.
   - Align base-board standoffs to the Raspberry Pi 5 mounting-hole pattern.
   - Add configurable screw pilot holes or insert holes in the standoffs.
   - Add configurable anti-slip recess holes on the tray underside.
   - Subtract female socket holes for the top-cover pins.
   - Add socket receiver bosses or thickened corner/wall regions where needed to
     keep socket material printable and strong.
   - Subtract any tray-side portions of Raspberry Pi 5 access openings where the
     bottom/base board service envelope intersects the tray.
   - Keep the tray printable with its broad stable face on the print plane.

9. Implement the top cover.
   - Include roof, tall side walls/skirt, fit clearance, internal clearance, and
     male cylindrical plug pins.
   - Keep the top cover the larger/taller enclosure half by default.
   - Use top-cover-owned male pins and bottom-tray-owned female sockets by
     default.
   - Make pin diameter, insertion length, count, positions, socket clearance,
     and socket depth adjustable.
   - Derive top-cover height from the configured five-board stack height and
     top-of-fifth-PCB-to-cover clearance parameter.
   - Subtract top-cover portions of Raspberry Pi 5 access openings where needed
     at the configured Raspberry Pi 5 board index.
   - Subtract inter-PCB side airflow openings through the top cover wall for all
     four board gaps.
   - Ensure default pin/socket positions avoid boards, standoffs, side/front
     port openings, and airflow slots.

10. Implement Raspberry Pi 5 access and service openings.
    - Provide side/front openings or access paths for Raspberry Pi 5 service
      zones where they would otherwise be blocked:
      - USB-A and Ethernet,
      - USB-C power,
      - two micro-HDMI ports,
      - base-position microSD access.
    - Keep the top cover roof fully closed with no roof service openings.
    - Derive from `rpi5.scad` connector origins/sizes when possible.
    - If OpenSCAD `use` visibility requires local mirrors, name them clearly as
      Raspberry Pi 5 reference mirrors and document them in code comments and
      README.
    - Add grouped clearance values so physical fit can be tuned later.
    - Preserve wall continuity where repeated five-level port openings would
      make the top cover too weak; document any intentionally limited access
      areas in README.

11. Implement mandatory inter-PCB airflow.
    - Add real subtractive lateral grate openings for every inter-board gap.
    - Place openings on at least two opposing side walls by default.
    - Derive airflow Z centers from the four inter-PCB gap centers.
    - Make airflow count, slot width, slot height, spacing, side enablement, and
      margins adjustable.
    - Keep default airflow from intersecting the male/female interface, socket
      receiver bosses, base standoffs, and major service openings.
    - Optional top or bottom ventilation may be added only as supplemental
      airflow and must not replace the required gap-aligned side openings.

12. Implement render modes.
    - `assembly`: assembled bottom tray/top cover with optional five-board
      reference stack and optional guides.
    - `bottom_tray`: printable bottom tray only.
    - `top_cover`: printable top cover only.
    - `electronics`: five-board Raspberry Pi 5 reference stack only.
    - `printable_layout`: bottom tray and top cover separated on the print plane
      with no floating printable geometry and no extra printable parts.

13. Update `README.md`.
    - Add the new design file to the design list.
    - Add a new Raspberry Pi 5 five-stack enclosure section.
    - Document component assumptions, manually entered dimensions, source
      relationship to `rpi5.scad`, render modes, common adjustable parameters,
      per-gap stack spacing, top-cover clearance, base-PCB mounting, anti-slip
      recesses, male/female connection method, mandatory inter-PCB airflow,
      Raspberry Pi 5 access strategy, Bambu-friendly printability, validation
      commands, and manual inspection checklist.
    - Document any mirrored Raspberry Pi 5 connector values if the
      implementation uses local mirrors.

14. Validate.
    - Run `git diff --check`.
    - Run deterministic source checks defined by the test-focused subagent or
      equivalent shell checks.
    - Run OpenSCAD exports to `/tmp`, stopping any render that exceeds 15
      seconds:
      - `openscad -o /tmp/pi5_five_stack_enclosure_assembly.off -D 'render_mode="assembly"' designs/pi5_five_stack_enclosure.scad`
      - `openscad -o /tmp/pi5_five_stack_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi5_five_stack_enclosure.scad`
      - `openscad -o /tmp/pi5_five_stack_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/pi5_five_stack_enclosure.scad`
      - `openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad`
      - `openscad -o /tmp/pi5_five_stack_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/pi5_five_stack_enclosure.scad`
    - If local OpenSCAD fails or is unavailable, report the blocker and mark
      delivery draft unless the user explicitly accepts source-only validation.

15. Main-agent QA.
    - Inspect diffs for spec mapping and regression risk.
    - Inspect OpenSCAD outputs if generated successfully.
    - Confirm:
      - all required render modes generate,
      - exactly five PCB positions exist by default,
      - PCB 4 is the Raspberry Pi 5 reference/access level by default,
      - all five PCB positions share the same footprint and coordinate frame,
      - four independent inter-PCB spacing values exist,
      - changing spacing would move downstream board positions and gap airflow
        centers through derived values,
      - top-cover height derives from stack height and top clearance,
      - bottom tray is shallow and top cover carries the main height,
      - bottom tray includes base-PCB mounting standoffs,
      - bottom tray standoffs include screw pilot or insert holes,
      - bottom tray includes anti-slip recesses,
      - top cover has male pins,
      - bottom tray has matching female sockets,
      - every inter-board gap has real side airflow grate openings,
      - default airflow avoids pins, sockets, standoffs, and major access
        openings,
      - required Raspberry Pi 5 service/access openings exist or README
        documents intentional limits,
      - printable layout has exactly the two printable enclosure parts separated
        on the print plane,
      - no generated mesh files are tracked.

16. Final review and delivery.
    - Run a code-review pass against the approved spec and this plan.
    - Resolve in-scope review or QA findings before final delivery.
    - Commit only if implementation, review, QA, validation, and documentation
      are complete.
    - Use a non-draft commit message only if all required validation passes, for
      example:
      - `feature: Add Pi 5 five-stack enclosure`
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

## Validation Commands

Required:

```sh
git diff --check
```

Required source checks may be implemented as simple shell checks equivalent to:

```sh
rg -n 'render_mode = "printable_layout"|bottom_tray|top_cover|electronics|assembly' designs/pi5_five_stack_enclosure.scad
rg -n 'stack_board_count|rpi5_stack_index|pcb_stack_gap|inter.*gap|top.*clearance' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'cover_pin|plug_pin|male|tray_socket|socket|female' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'anti_slip|anti_slide|foot_recess|standoff|pilot|insert' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'airflow|vent|ventilation|gap_center|side.*opening' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'usb|ethernet|usb_c|hdmi|camera|display|pcie|micro_sd|gpio' designs/pi5_five_stack_enclosure.scad README.md
```

Required OpenSCAD inspection exports:

```sh
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_assembly.off -D 'render_mode="assembly"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/pi5_five_stack_enclosure.scad
```

Expected result:

- `git diff --check` exits 0.
- Source checks find render modes, five-stack spacing terms, male/female
  connection terms, anti-slip/standoff terms, airflow terms, Raspberry Pi 5 port
  access terms, and README documentation.
- OpenSCAD commands exit 0 within the repository's render-time guidance and
  write temporary outputs under `/tmp`.

## Documentation Requirements

- README updates are required.
- No generated mesh files may be documented as committed artifacts.
- README must document the new enclosure source, assumptions, manually entered
  dimensions, render modes, adjustable parameters, per-gap stack spacing,
  top-cover clearance, base-PCB mounting, anti-slip behavior, male/female
  connection method, mandatory inter-PCB airflow strategy, Raspberry Pi 5 access
  strategy, printability guidance, validation commands, and manual inspection
  checklist.
- README must document local mirrored Raspberry Pi 5 connector values if
  implementation cannot directly derive them from `rpi5.scad`.
