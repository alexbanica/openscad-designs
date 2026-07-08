# PLAN: Raspberry Pi 5 Five-Stack Enclosure

Status: Approved

## Approved Spec

- `specs/SPEC-pi5-five-stack-enclosure.md`

## Scope

Implement the approved five-stack enclosure as a new OpenSCAD design and update
README documentation. The default five-position stack uses PCB 4 as the
Raspberry Pi 5 reference/access level. The upper cover includes two internal
30 mm fan mount positions with guarded roof airflow grilles for cooling PCB 5.
This completed direct iteration also adds an adjustable lateral GPIO/header
access opening for an outward-facing HAT header splitter/display branch and
omits front/back-face vent rows where they would collide with Pi 5 service
openings. This completed direct iteration also calibrates the five-stack
USB-C, micro-HDMI, USB-A, and Ethernet openings against the printed-good
Raspberry Pi 5 AI HAT+ enclosure service-port dimensions. This completed
direct iteration also applies the measured stack gaps `9.80`, `17.05`,
`19.39`, and `41.20` mm with a `0.50` mm default error margin, applies the
measured PCB 5-to-top clearance `35.82` mm with the same margin, and changes
the top fans to `30.0 mm x 30.0 mm x 7.0 mm` with a `24.0` mm screw-hole span.
This completed direct iteration also adds a PCB 5 micro-USB access opening on
the same front side as the Pi 5 USB-C opening, using the measured `8.85` mm
left-margin placement and the same front cable cutout margin behavior as the
Pi 5 front connector openings. This completed direct iteration also adds
`3.0` mm of extra left/right internal PCB-edge clearance for PCI/ribbon cables
without increasing the front/back clearance.

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
     - middle-cover male pin parameters/modules,
     - bottom-tray female socket parameters/modules,
     - upper-cover male pin parameters/modules,
     - middle-cover split-socket parameters/modules,
     - bottom anti-slip recess parameters/modules,
     - Raspberry Pi 5 port/service access terms,
     - inter-PCB airflow parameters/modules,
     - internal fan mount parameters/modules,
     - guarded fan grille parameters/modules,
     - printable-layout three-part constraint,
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
     - left/right-only PCI cable clearance margin,
     - shallow bottom-tray, middle-cover, upper-cover, and split-height values,
     - base-board mounting/support values,
     - screw pilot and optional insert values,
     - bottom anti-slip recess values,
     - middle-cover male pin and bottom-tray socket values,
     - upper-cover male pin and middle-cover socket values,
     - inter-PCB side/front/back airflow values,
     - upper top-cover wall airflow values,
     - internal 30 mm fan mount values, fan-body clearance, screw/pilot boss
       geometry, guarded roof grille pattern values, and fan center positions,
     - optional top/bottom ventilation values if implemented,
     - printable layout values,
     - visual settings.
   - Add a separate `Derived Values` section for board positions, inter-PCB gap
     centers, enclosure envelope, stack height, internal dimensions, cutout
     centers, printable-layout placement, pin/socket centers, fan mount centers,
     guarded fan grille placement, and fan-clearance-driven cover height.
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
     - middle cover,
     - upper cover,
     - combined top cover,
     - printable layout,
     - electronics/reference preview,
     - tray shell,
     - cover shell,
     - base-board standoffs/supports,
     - screw pilot or insert holes,
     - anti-slip bottom recesses,
     - cover plug pins,
     - tray socket holes and receiver bosses,
     - upper-cover split plug pins,
     - middle-cover split socket holes,
     - Raspberry Pi 5 port/service cutout volumes,
     - inter-PCB side/front/back airflow cutout volumes,
     - upper top-cover wall airflow cutout volumes,
     - internal fan mount bosses/posts,
     - fan screw/pilot holes,
     - guarded fan roof grille cutout volumes,
     - optional top/bottom ventilation cutout volumes if implemented,
     - rounded-box or repeated helper geometry.
   - Use difference/union structure similar to existing enclosures where
     appropriate.

8. Implement the bottom cover/tray.
   - Include floor, shallow side wall or locating lip, internal clearance, corner
     radius, and base-board mounting/support geometry.
   - Add the PCI/ribbon cable margin only to the left/right internal footprint
     clearance and leave the front/back margin unchanged.
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

9. Implement the split top cover.
   - Build the full cover envelope from roof, tall side walls/skirt, fit
     clearance, internal clearance, and male cylindrical plug pins, then split
     it into middle-cover and upper-cover printable sections.
   - Derive the middle/upper split height from the configured Pi 5 connector
     cutout tops plus a small configurable clearance so the middle cover owns
     the Pi 5 connector openings and the upper cover owns the tall headroom
     section.
   - Use middle-cover-owned male pins and bottom-tray-owned female sockets by
     default.
   - Add a second split interface with upper-cover-owned short downward male
     pins and matching top-open sockets subtracted from the middle cover at the
     middle/upper split.
   - Make pin diameter, insertion length, count, positions, socket clearance,
     and socket depth adjustable.
   - Derive top-cover height from the configured five-board stack height and
     top-of-fifth-PCB-to-cover clearance parameter, preserving PCB 5 headroom
     after adding the internal fan thickness and fan mounting bosses.
   - Subtract top-cover portions of Raspberry Pi 5 access openings where needed
     at the configured Raspberry Pi 5 board index.
   - Subtract inter-PCB airflow openings through the top cover side, front, and
     back walls for all four board gaps.
   - Subtract an additional upper-cover wall vent band above PCB 5 on vertical
     walls only.
   - Add two inside upper-cover fan mount positions for `30.0 mm x 30.0 mm x
     7.0 mm` fans by default.
   - Add adjustable fan screw/pilot bosses or posts using a configurable default
     screw-hole span of `24.0 mm` until the actual fans are measured.
   - Add guarded roof airflow grilles aligned with the two internal fans. The
     grille pattern must retain printed ribs/material and must not be a single
     full 30 mm opening.
   - Keep non-fan roof areas closed and keep the roof free of service openings.
   - Ensure default fan mounts and grille cutouts avoid middle/upper connector
     pins and sockets, tray/cover pins and sockets, roof edges, walls, major
     service openings, and PCB 5 clearance.
   - Ensure default pin/socket positions avoid boards, standoffs, side/front
     port openings, and airflow slots.

10. Implement Raspberry Pi 5 access and service openings.
    - Provide side/front openings or access paths for Raspberry Pi 5 service
      zones where they would otherwise be blocked:
      - USB-A and Ethernet,
      - USB-C power,
      - two micro-HDMI ports,
      - PCB 5 micro-USB cable output on the same front side as the Pi 5 USB-C
        opening,
      - GPIO/header-edge lateral access for an outward-facing HAT header
        splitter/display branch,
      - base-position microSD access.
    - Implement USB-A and Ethernet side access as one continuous cutout with no
      separator between connector openings.
    - Keep USB-A and Ethernet side access based on the same mirrored Raspberry
      Pi 5 connector extents used by the printed Raspberry Pi 5 AI HAT+
      enclosure.
    - Size front USB-C and micro-HDMI openings using the printed Raspberry Pi 5
      AI HAT+ enclosure cable-head requirements:
      - USB-C: `12.0 mm x 7.0 mm` plus `0.6 mm` total margin, producing at
        least `12.6 mm x 7.6 mm`,
      - micro-HDMI: `12.0 mm x 6.66 mm` plus `0.6 mm` total margin, producing
        at least `12.6 mm x 7.26 mm`.
    - Size the PCB 5 micro-USB front opening from the measured `8.85 mm`
      connector-left margin and a `10.30 mm x 11.30 mm` cable-head requirement
      plus the same `0.6 mm` total front cable cutout margin, producing at
      least `10.90 mm x 11.90 mm`.
    - Keep the top cover roof free of service openings. Only guarded fan airflow
      grilles may pierce the roof.
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
    - Place openings on both opposing side walls and the back face for every gap
      by default.
    - Skip front-face openings for gaps directly adjacent to the configured Pi 5
      board when they would intersect the Pi 5 front connector cutouts.
    - Skip front/back-face openings for gaps directly adjacent to the configured
      Pi 5 board when they would intersect the GPIO/header lateral access
      opening or other Pi 5 service openings.
    - Derive airflow Z centers from the four inter-PCB gap centers.
    - Make airflow count, slot width, slot height, spacing, face enablement, and
      margins adjustable.
    - Keep default airflow from intersecting the male/female interface, socket
      receiver bosses, base standoffs, and major service openings.
    - Optional top or bottom ventilation may be added only as supplemental
      airflow and must not replace the required gap-aligned side/back openings
      or non-conflicting front openings.
    - Add upper top-cover ventilation rows in the wall area above PCB 5 without
      piercing the roof, using slot dimensions at most half the inter-PCB vent
      dimensions by default.
    - Add guarded fan airflow through the upper-cover roof as supplemental forced
      airflow for PCB 5. It must not replace the required inter-PCB and wall
      airflow openings.

12. Implement render modes.
    - `assembly`: assembled bottom tray, middle cover, upper cover, optional
      five-board reference stack, and optional guides.
    - `bottom_tray`: printable bottom tray only.
    - `middle_cover`: printable middle cover only.
    - `upper_cover`: printable upper cover only, including internal fan mounts
      and guarded roof fan grilles.
    - `top_cover`: printable middle cover and upper cover separated together.
    - `electronics`: five-board Raspberry Pi 5 reference stack only.
    - `printable_layout`: bottom tray, middle cover, and upper cover separated
      on the print plane with no floating printable geometry and no extra
      printable parts.

13. Update `README.md`.
    - Add the new design file to the design list.
    - Add a new Raspberry Pi 5 five-stack enclosure section.
    - Document component assumptions, manually entered dimensions, source
      relationship to `rpi5.scad`, render modes, common adjustable parameters,
      per-gap stack spacing, top-cover clearance, base-PCB mounting, anti-slip
      recesses, male/female connection method, mandatory inter-PCB airflow,
      guarded fan grilles, internal fan mount assumptions, Raspberry Pi 5 access
      strategy, Bambu-friendly printability, validation commands, and manual
      inspection checklist.
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
      - `openscad -o /tmp/pi5_five_stack_enclosure_middle_cover.off -D 'render_mode="middle_cover"' designs/pi5_five_stack_enclosure.scad`
      - `openscad -o /tmp/pi5_five_stack_enclosure_upper_cover.off -D 'render_mode="upper_cover"' designs/pi5_five_stack_enclosure.scad`
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
      - top-cover height preserves PCB 5 clearance after adding the two internal
        30 mm fans and mounting bosses,
      - bottom tray is shallow while the middle and upper covers carry the main
        height,
      - bottom tray includes base-PCB mounting standoffs,
      - bottom tray standoffs include screw pilot or insert holes,
      - bottom tray includes anti-slip recesses,
      - middle cover has male pins,
      - middle/upper split sits above the Pi 5 connector cutouts,
      - upper cover is independently printable above the Pi 5 connector zone,
      - upper cover has split-interface male pins,
      - middle cover has matching top-open split-interface female sockets,
      - bottom tray has matching female sockets,
      - every inter-board gap has real side and back airflow grate openings,
      - non-conflicting front-face airflow grate openings exist,
      - upper top-cover wall airflow exists with half-size slots while the roof
        keeps non-fan areas closed,
      - two guarded roof fan grille patterns exist and are not full 30 mm holes,
      - two internal fan mounting point sets exist inside the upper cover,
      - fan mount defaults avoid split-interface pins/sockets and PCB 5
        clearance,
      - default airflow avoids pins, sockets, standoffs, and major access
        openings,
      - required Raspberry Pi 5 service/access openings exist or README
        documents intentional limits,
      - PCB 5 micro-USB front access exists on the Pi 5 USB-C side and uses the
        measured left-margin placement plus the shared front cable margin,
      - left/right internal PCB-edge clearance includes the PCI cable margin and
        front/back clearance is not enlarged by that margin,
      - printable layout has exactly the three printable enclosure parts
        separated on the print plane,
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
rg -n 'render_mode = "printable_layout"|bottom_tray|middle_cover|upper_cover|top_cover|electronics|assembly' designs/pi5_five_stack_enclosure.scad
rg -n 'stack_board_count|rpi5_stack_index|pcb_stack_gap|inter.*gap|top.*clearance' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'cover_pin|plug_pin|male|tray_socket|socket|female|middle_upper_connector' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'anti_slip|anti_slide|foot_recess|standoff|pilot|insert' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'airflow|vent|ventilation|gap_center|side.*opening' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'fan|grille|guard|40\\.0|32\\.0|roof.*airflow|fan_mount' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'usb|ethernet|usb_c|hdmi|camera|display|pcie|micro_sd|gpio' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'gpio_header_lateral_access|front_back_airflow_conflicts_with_pi5_access' designs/pi5_five_stack_enclosure.scad README.md
rg -n 'usb_c_cable_head_required_size|micro_hdmi_adapter_head_required_size|front_cable_cutout_error_margin' designs/pi5_five_stack_enclosure.scad README.md
```

Required OpenSCAD inspection exports:

```sh
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_assembly.off -D 'render_mode="assembly"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_middle_cover.off -D 'render_mode="middle_cover"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_upper_cover.off -D 'render_mode="upper_cover"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad
timeout 15s openscad -o /tmp/pi5_five_stack_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/pi5_five_stack_enclosure.scad
```

Expected result:

- `git diff --check` exits 0.
- Source checks find render modes, five-stack spacing terms, male/female
  connection terms, anti-slip/standoff terms, airflow terms, Raspberry Pi 5 port
  access terms, internal fan/guarded grille terms, and README documentation.
- OpenSCAD commands exit 0 within the repository's render-time guidance and
  write temporary outputs under `/tmp`.

## Documentation Requirements

- README updates are required.
- No generated mesh files may be documented as committed artifacts.
- README must document the new enclosure source, assumptions, manually entered
  dimensions, render modes, adjustable parameters, per-gap stack spacing,
  top-cover clearance, base-PCB mounting, anti-slip behavior, male/female
  connection method, mandatory inter-PCB airflow strategy, internal 30 mm fan
  mounts, guarded roof fan grilles, Raspberry Pi 5 access strategy,
  printability guidance, validation commands, and manual inspection checklist.
- README must document local mirrored Raspberry Pi 5 connector values if
  implementation cannot directly derive them from `rpi5.scad`.

## Super-Agent Completed Plan: Lower Port Access Openings

Status: Approved

Approved Spec: `specs/SPEC-pi5-five-stack-enclosure.md`

### Affected Files

- `designs/pi5_five_stack_enclosure.scad`
- `README.md`
- `specs/SPEC-pi5-five-stack-enclosure.md`
- `specs/PLAN-pi5-five-stack-enclosure.md`

### Implementation Steps Performed

1. Added `pi5_service_port_cutout_lowering_mm = 5.0` in the service access
   adjustable parameters.
2. Added `pcb5_micro_usb_cutout_lowering_mm = 7.0` in the service access
   adjustable parameters.
3. Extended the right-side USB-A/Ethernet cutout helper with an optional
   `cutout_lowering_mm` argument and subtracted it from the cutout Z center.
4. Extended the front-side port cutout helper with an optional
   `cutout_lowering_mm` argument and subtracted it from the cutout Z center.
5. Passed the `5.0` mm Pi 5 lowering value to the USB-A/Ethernet, USB-C, and
   micro-HDMI cutouts in both top-cover access and base-tray access paths.
6. Passed the `7.0` mm PCB 5 lowering value to the PCB 5 micro-USB front
   cutout.
7. Updated README documentation for the new lowering controls and default
   physical-fit behavior.
8. Appended completed-work spec and plan entries for this direct super-agent
   change.

### Validation Run

```sh
git diff --check
timeout 10s openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad
```

### Validation Skipped

- Full OpenSCAD printable-part render/export validation was skipped because it
  is not expected to complete within the super-agent 10-second validation limit.
- QA was skipped by super-agent workflow.
- Code review was skipped by super-agent workflow.
- Physical fit and slicer inspection were not performed.

### Documentation Updates

- README now states that Pi 5 service openings are lowered by
  `pi5_service_port_cutout_lowering_mm = 5.0`.
- README now states that the PCB 5 micro-USB opening is lowered by
  `pcb5_micro_usb_cutout_lowering_mm = 7.0`.

### Commit Status

- Not committed.

### Push Status

- Not pushed.

### Residual Risk

- The lower cutouts should improve physical access but still need slicer
  inspection and a physical fit check before treating the geometry as
  print-validated.
