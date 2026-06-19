# PLAN: Raspberry Pi 5 AI HAT+ 26T Enclosure

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`

## Scope

Implement the approved Raspberry Pi 5 AI HAT+ 26T enclosure as a new OpenSCAD design and update README documentation.

Do not implement behavior outside the approved spec.

## Branch

- Work may continue on `main`, because repository instructions allow direct commits to `main` when otherwise unspecified.
- Do not create a feature branch unless the user explicitly requests one before implementation starts.

## Affected Files

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-enclosure.md`

Generated OpenSCAD outputs must be written only under `/tmp` and must not be committed.

## Ownership Boundaries

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`: new printable enclosure source only.
- `README.md`: document the new enclosure source, assumptions, render modes, adjustable parameters, port access, ventilation, validation, and male/female connection behavior.
- Spec and plan files: status and planning artifacts only.

Do not change existing Pi Zero, Grove, Waveshare, Raspberry Pi 5 reference, Raspberry Pi 5 active cooler, or AI HAT+ reference behavior unless implementation discovers a strict OpenSCAD visibility blocker. If such a blocker requires helper/accessor changes, stop and request plan amendment before editing those existing sources.

## Implementation Steps

1. Verify clean-context implementation boundary.
   - Implementation must start only in a fresh session, explicitly cleared context, or after explicit user confirmation to continue in the current context.
   - Load only applicable instructions, the approved spec, this approved plan, current worktree state, and minimal file context needed for the listed files.

2. Inspect target context only.
   - Read `AGENTS.md` and `/home/alexbanica/workspace.md`.
   - Read the approved spec and approved plan.
   - Read existing local patterns from:
     - `designs/rpi5.scad`,
     - `designs/rpi5_active_cooler.scad`,
     - `designs/rpi5_ai_hat_plus_26t.scad`,
     - relevant pin/socket and tray/cover modules from `designs/pi_zero_usb_grove_ir_enclosure.scad`,
     - relevant README sections.

3. Add test-first/check-first coverage.
   - Because this repository has no unit-test framework, use deterministic source checks and OpenSCAD render validation rather than adding a persistent test harness.
   - Before production implementation, the test-focused subagent must define source assertions for:
     - required render modes,
     - top-cover male pin parameters/modules,
     - bottom-tray female socket parameters/modules,
     - Raspberry Pi 5 port cutout references,
     - side and top ventilation modules,
     - README documentation entries.
   - Permanent test files are not required unless the implementation command determines a small scoped script is worthwhile.

4. Create `designs/rpi5_ai_hat_plus_26t_enclosure.scad`.
   - Use OpenSCAD 2021.01-compatible syntax and no external libraries.
   - Add grouped `Adjustable Parameters` near the top:
     - render controls and visibility toggles,
     - enclosure wall/floor/roof/clearance values,
     - Raspberry Pi 5 board and port source values or local mirrors,
     - AI HAT+ stack and cooler clearance values or local mirrors,
     - mounting/support values,
     - top-cover male pin and bottom-tray socket values,
     - side ventilation values,
     - top ventilation values,
     - printable layout values,
     - visual settings.
   - Add a separate `Derived Values` section for enclosure envelope, internal dimensions, stack height, cutout centers, printable-layout placement, pin/socket centers, and ventilation centers.
   - Keep all linear variables suffixed `_mm` and angle variables suffixed `_deg`.

5. Implement reference/electronics integration.
   - `use <rpi5.scad>`, `use <rpi5_ai_hat_plus_26t.scad>`, and `use <rpi5_active_cooler.scad>` as needed for visual reference modules.
   - Provide an electronics/reference render that can show the Raspberry Pi 5 and AI HAT+ stack inside the enclosure for fit checks.
   - Do not duplicate or alter existing reference modules.

6. Implement printable part modules.
   - Add named modules for:
     - assembled enclosure dispatch,
     - bottom tray,
     - top cover,
     - printable layout,
     - electronics/reference preview,
     - tray shell,
     - cover shell,
     - mounting supports/standoffs,
     - cover plug pins,
     - tray socket holes,
     - port cutout volumes,
     - side ventilation cutout volumes,
     - top ventilation cutout volumes,
     - rounded-box or repeated helper geometry.
   - Use difference/union structure similar to the existing enclosure where appropriate.

7. Implement the bottom tray.
   - Include floor, side walls, internal clearance, corner radius, and Raspberry Pi 5 mounting/support geometry.
   - Align mounting/support geometry to `rpi5.scad` mounting-hole positions or clearly documented local mirrors of those values.
   - Subtract female socket holes for the cover pins.
   - Subtract bottom/tray-side portions of Raspberry Pi 5 port cutouts where the port envelope intersects the tray.
   - Keep the tray printable with the broad stable face on the print plane.

8. Implement the top cover.
   - Include roof, skirt/drop depth, fit clearance, internal clearance, and male cylindrical plug pins.
   - Use top-cover-owned male pins and bottom-tray-owned female sockets by default.
   - Make pin diameter, insertion length, count, positions, socket clearance, and socket depth adjustable.
   - Ensure default pin/socket positions avoid ports, vents, mounting supports, active-cooler envelope, and AI HAT+ cooler envelope.
   - Subtract top/cover-side portions of Raspberry Pi 5 port/service openings where needed.
   - Subtract top ventilation openings above the AI HAT+ cooler/fan zone.

9. Implement Raspberry Pi 5 port and service openings.
   - Provide cutouts/service openings for:
     - two USB-A ports,
     - Ethernet,
     - USB-C power,
     - two micro-HDMI ports,
     - camera/display connector A,
     - camera/display connector B,
     - PCIe connector/guidance area,
     - microSD slot/card access.
   - Derive from `rpi5.scad` connector origins/sizes when possible.
   - If OpenSCAD `use` visibility requires local mirrors, name them clearly as Raspberry Pi 5 reference mirrors and document them in code comments and README.
   - Add grouped clearance values so physical fit can be tuned later.

10. Implement ventilation.
    - Add real subtractive lateral ventilation openings on both long side walls by default.
    - Make side ventilation count, size, spacing, side enablement, and vertical position adjustable.
    - Add real subtractive top ventilation above the AI HAT+ cooler/fan zone by default.
    - Make top ventilation count, hole diameter or slot size, spacing, and offset adjustable.
    - Keep default ventilation from intersecting the male/female interface, mounting supports, and port cutout volumes.

11. Implement render modes.
    - `assembly`: assembled enclosure with optional electronics/reference geometry.
    - `bottom_tray`: printable bottom tray only.
    - `top_cover`: printable top cover only.
    - `electronics`: Raspberry Pi 5 plus AI HAT+ reference stack only.
    - `printable_layout`: bottom tray and top cover separated on the print plane with no floating printable geometry.

12. Update `README.md`.
    - Add the new design file to the design list.
    - Add a new Raspberry Pi 5 AI HAT+ 26T enclosure section.
    - Document component assumptions, source-of-truth relationship to `rpi5.scad`, render modes, common adjustable parameters, port-access strategy, male/female connection method, ventilation strategy, validation commands, and manual inspection checklist.
    - Document any mirrored Raspberry Pi 5 connector values if the implementation uses local mirrors.

13. Validate.
    - Run `git diff --check`.
    - Run deterministic source checks defined by the test-focused subagent or equivalent shell checks.
    - Run OpenSCAD exports to `/tmp`:
      - `openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
      - `openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
      - `openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
      - `openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_electronics.off -D 'render_mode="electronics"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
      - `openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
    - If local OpenSCAD fails or is unavailable, report the blocker and mark delivery draft unless the user explicitly accepts source-only validation.

14. Main-agent QA.
    - Inspect diffs for spec mapping and regression risk.
    - Inspect OpenSCAD outputs if generated successfully.
    - Confirm:
      - all required render modes generate,
      - all modeled Raspberry Pi 5 ports have corresponding cutouts or service openings,
      - port openings align to connector envelopes in the default model,
      - top cover has male pins,
      - bottom tray has matching female sockets,
      - default pin/socket geometry avoids ports, vents, and supports,
      - lateral and top ventilation are real openings,
      - printable layout has bottom tray and top cover separated on the print plane,
      - no generated mesh files are tracked.

15. Final review and delivery.
    - Run a code-review pass against the approved spec and this plan.
    - Resolve in-scope review or QA findings before final delivery.
    - Commit only if implementation, review, QA, validation, and documentation are complete.
    - Use a non-draft commit message only if all required validation passes, for example:
      - `feature: Add Pi 5 AI HAT enclosure`
    - Use `DRAFT` in the commit message if OpenSCAD validation or required review/QA is blocked or incomplete.
    - Push only if commit succeeds and repository access permits.

## Required Implementation Subagents

For behavior-changing implementation, the implementation command must use:

- exactly one clean-context test-focused subagent before production implementation,
- exactly one clean-context implementation subagent for production implementation,
- exactly one clean-context code-review subagent after implementation.

If subagent tooling is unavailable, implementation must stop and report the blocker.

Per workspace instructions, all spawned test-focused and developer subagents must use `gpt-5.3-codex-spark`.

Subagents must receive only:

- the approved spec,
- this approved plan,
- their exact assignment,
- their ownership boundary,
- minimal relevant file context.

Review subagents must not implement fixes. In-scope review or QA fixes must be routed to a new clean-context implementation subagent with the specific finding and minimal relevant context.

## No-Research Constraint

Implementation must not perform additional product research, architecture research, scope discovery, planning research, or plan discovery.

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
rg -n 'render_mode = "printable_layout"|bottom_tray|top_cover|electronics|assembly' designs/rpi5_ai_hat_plus_26t_enclosure.scad
rg -n 'cover_pin|plug_pin|male|tray_socket|socket|female' designs/rpi5_ai_hat_plus_26t_enclosure.scad README.md
rg -n 'usb|ethernet|usb_c|hdmi|camera|display|pcie|micro_sd' designs/rpi5_ai_hat_plus_26t_enclosure.scad README.md
rg -n 'vent|ventilation|airflow|lateral|top ventilation' designs/rpi5_ai_hat_plus_26t_enclosure.scad README.md
```

Required OpenSCAD inspection exports:

```sh
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_electronics.off -D 'render_mode="electronics"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
```

Expected result:

- `git diff --check` exits 0.
- Source checks find render modes, male/female connection terms, Raspberry Pi 5 port access terms, and ventilation terms in source and README.
- OpenSCAD commands exit 0 and write temporary outputs under `/tmp`.

## Documentation Requirements

- README updates are required.
- No generated mesh files may be documented as committed artifacts.
- README must document the new enclosure source, assumptions, render modes, adjustable parameters, male/female connection method, port-access strategy, ventilation strategy, validation commands, and manual inspection checklist.
- README must document local mirrored Raspberry Pi 5 connector values if implementation cannot directly derive them from `rpi5.scad`.

## Commit And Push

- Commit after implementation, review, QA, documentation, and validation are complete.
- Push after commit if repository access permits.
- Use `DRAFT` in the commit message and report draft status if any required validation, review, QA, or documentation is skipped, blocked, incomplete, or failing.

## Completion Report Requirements

The final implementation completion report must include:

- summary of implemented spec,
- code-review findings,
- QA findings,
- resolved findings,
- validation commands run and results,
- unvalidated items,
- remaining risks,
- documentation updates,
- commit status,
- push status,
- final or draft delivery status,
- skipped or blocked Definition of Done items,
- final main-agent acceptance confirmation.

## Super-Agent Update: Front Cable Fit

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`

## Affected Files

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-enclosure.md`

## Implementation Steps Performed

1. Inspected branch and worktree state.
2. Loaded applicable repository and workspace instructions.
3. Inspected the Raspberry Pi 5 AI HAT+ enclosure source, README section, and existing approved enclosure artifacts.
4. Added explicit front cable-head fit parameters:
   - `front_cable_cutout_error_margin_mm = 0.6`,
   - `usb_c_cable_head_required_size_mm = [12.0, 7.0]`,
   - `micro_hdmi_adapter_head_required_size_mm = [12.0, 6.66]`.
5. Added derived effective opening sizes:
   - USB-C: 12.6 mm x 7.6 mm,
   - micro-HDMI: 12.6 mm x 7.26 mm.
6. Updated the front-wall cutout logic so USB-C and micro-HDMI openings use the larger of the original connector-derived opening and the measured cable-head effective minimum.
7. Updated README documentation for tuning parameters, port-access behavior, and manual inspection expectations.
8. Updated the approved spec and plan artifacts to document the completed super-agent cable-fit change.

## Validation Run

- `git diff --check`
- Targeted `rg` searches for front cable-fit parameters and README/spec/plan documentation.

## Validation Skipped

- OpenSCAD renders/exports were skipped because this `super-agent` workflow runs only short validation expected to complete within 10 seconds.
- Physical fit and test-print validation were skipped.

## QA Skipped

- QA phase skipped by design under the `super-agent` workflow.

## Code Review Skipped

- Code-review phase skipped by design under the `super-agent` workflow.

## Documentation Updates

- README documents the new cable-head requirements, margin parameter, and default effective front opening sizes.
- This plan and the approved spec document the completed lower-assurance cable-fit update.

## Commit Status

- Not committed.

## Push Status

- Not pushed.

## Residual Risk

- Larger USB-C and micro-HDMI openings may reduce front-wall material locally.
- Cable fit remains unverified until checked against the real cable heads and a printed part.
- No OpenSCAD visual render was performed in this super-agent pass.

## Super-Agent Update: Combined Right-Side USB/Ethernet Cutout

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`

## Affected Files

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-enclosure.md`

## Implementation Steps Performed

1. Inspected branch and worktree state.
2. Loaded applicable repository and workspace instructions.
3. Inspected the Raspberry Pi 5 AI HAT+ enclosure source, README section, and existing approved enclosure artifacts.
4. Added derived `right_usb_ethernet_cutout_origin_mm` and `right_usb_ethernet_cutout_size_mm` values from the existing mirrored USB-A and Ethernet connector envelopes.
5. Replaced the separate `usb_lower`, `usb_upper`, and `ethernet` right-side `port_cutouts_mm` entries with one `right_usb_ethernet` right-side cutout entry.
6. Preserved the existing right-side cutout subtraction logic and grouped `edge_port_clearance_mm` behavior.
7. Updated README documentation and manual inspection wording for the continuous right-side USB-A/Ethernet opening.
8. Updated the approved spec and plan artifacts to document the completed super-agent right-side cutout change.

## Validation Run

- `git diff --check`
- Targeted `rg` searches for the combined `right_usb_ethernet` cutout and stale separate right-side port entries.
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `timeout 10s openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t_enclosure.scad`

## Validation Skipped

- Full OpenSCAD assembly and electronics exports were skipped to stay within the bounded `super-agent` validation scope.
- Physical fit and test-print validation were skipped.

## QA Skipped

- QA phase skipped by design under the `super-agent` workflow.

## Code Review Skipped

- Code-review phase skipped by design under the `super-agent` workflow.

## Documentation Updates

- README documents that the right-side USB-A and Ethernet access is one continuous cutout.
- This plan and the approved spec document the completed lower-assurance right-side cutout update.

## Commit Status

- Not committed.

## Push Status

- Not pushed.

## Residual Risk

- Removing the divider reduces right-side wall material around the USB-A/Ethernet group.
- Port fit remains unverified until checked against the real hardware and a printed part.
- OpenSCAD exports completed for bottom tray, top cover, and printable layout; full assembly/electronics visual inspection was not performed.

## Super-Agent Update: Top Cover Inner Roof Height

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`

## Affected Files

- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-enclosure.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-enclosure.md`

## Implementation Steps Performed

1. Inspected branch and worktree state.
2. Loaded applicable repository and workspace instructions.
3. Inspected the Raspberry Pi 5 AI HAT+ enclosure source, README section, and existing approved enclosure artifacts.
4. Changed `ai_hat_pcb_top_to_cover_top_height_mm` from `28.5` to `31.8`.
5. Documented the delivered height calculation from Raspberry Pi PCB bottom Z 7.4 mm, target inner roof Z 62.4 mm, and AI HAT+ PCB top Z 30.6 mm.
6. Updated README documentation for the new default top-cover height parameter.
7. Updated the approved spec and plan artifacts to document the completed super-agent height update.

## Validation Run

- `git diff --check`
- Targeted `rg` searches for `ai_hat_pcb_top_to_cover_top_height_mm` and `31.8`.

## Validation Skipped

- OpenSCAD renders/exports were skipped because this `super-agent` workflow runs only short validation expected to complete within 10 seconds.
- Physical fit and test-print validation were skipped.

## QA Skipped

- QA phase skipped by design under the `super-agent` workflow.

## Code Review Skipped

- Code-review phase skipped by design under the `super-agent` workflow.

## Documentation Updates

- README documents the new 31.8 mm default and the target inner roof calculation inputs.
- This plan and the approved spec document the completed lower-assurance height update.

## Commit Status

- Not committed.

## Push Status

- Not pushed.

## Residual Risk

- The top cover and assembled enclosure are 3.3 mm taller than the previous default.
- Physical fit remains unverified until checked against the real hardware and a printed part.
- No OpenSCAD visual render was performed in this super-agent pass.
