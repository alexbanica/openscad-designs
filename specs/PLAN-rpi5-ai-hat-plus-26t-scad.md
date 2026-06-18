# PLAN: Raspberry Pi AI HAT+ 26T OpenSCAD Reference Design

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-scad.md`

## Scope

Implement the approved Raspberry Pi AI HAT+ 26T OpenSCAD reference model, reusable Raspberry Pi 5 active-cooler helper extraction, README documentation updates, and validation required by the approved spec.

Do not implement behavior outside the approved spec.

## Branch

- Work may continue on `main`, because repository instructions allow direct commits to `main` when otherwise unspecified.
- Do not create a feature branch unless the user explicitly requests one before implementation starts.

## Affected Files

- `designs/rpi5.scad`
- `designs/rpi5_active_cooler.scad`
- `designs/rpi5_ai_hat_plus_26t.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-scad.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-scad.md`

Generated OpenSCAD outputs must be written only under `/tmp` and must not be committed.

## Ownership Boundaries

- `designs/rpi5_active_cooler.scad`: reusable active-cooler dimensions, derived values, and modules extracted from current `designs/rpi5.scad` behavior.
- `designs/rpi5.scad`: import/use the reusable cooler helper while preserving the public `rpi5_reference_model(...)` interface and current default active-cooler render behavior.
- `designs/rpi5_ai_hat_plus_26t.scad`: new AI HAT+ 26T reference model.
- `README.md`: document the new design and remove or replace stale references to missing AI HAT/case source files.
- Spec and plan files: status and planning artifacts only.

Do not change existing Pi Zero, Grove, Waveshare, or enclosure `.scad` behavior.

## Implementation Steps

1. Verify clean-context implementation boundary.
   - Implementation must start only in a fresh session, explicitly cleared context, or after explicit user confirmation to continue in the current context.
   - Load only applicable instructions, the approved spec, this approved plan, current worktree state, and minimal file context needed for the listed files.

2. Inspect target files.
   - Read `AGENTS.md` and `/home/alexbanica/workspace.md`.
   - Read the approved spec and approved plan.
   - Read `designs/rpi5.scad`, existing HAT sources for local style, and the relevant README sections.

3. Add focused test-first/check-first coverage.
   - Because this repository has no unit-test framework, create deterministic source checks before production implementation using shell assertions or reviewable command checks rather than adding a test harness.
   - Check for the required future symbols and defaults after implementation:
     - `rpi5_ai_hat_plus_26t_reference_model`,
     - `render_mode = "assembly"`,
     - `ai_hat_board_length_mm = 65.0`,
     - `ai_hat_board_width_mm = 56.5`,
     - `ai_hat_stack_distance_mm = 20.0`,
     - `ai_hat_header_pin_height_mm = 23.0`,
     - `ai_hat_npu_package_size_mm = [17.0, 17.0`,
     - `rpi5_active_cooler_reference`.
   - These checks may be executed after implementation as validation; no permanent test files are required unless the implementation command determines a small script is worthwhile and scoped to this spec.

4. Extract reusable Raspberry Pi 5 active-cooler helper.
   - Create `designs/rpi5_active_cooler.scad`.
   - Move or mirror the current active-cooler adjustable parameters, derived values, color settings, and modules from `designs/rpi5.scad` into the helper.
   - Expose a named `rpi5_active_cooler_reference(...)` module that can render the existing cooler geometry at the current default location.
   - Preserve OpenSCAD 2021.01-compatible syntax and no external dependencies.

5. Update `designs/rpi5.scad` to reuse the helper.
   - Use the helper source with `use <rpi5_active_cooler.scad>`.
   - Preserve existing render controls and public `rpi5_reference_model(...)` arguments.
   - Preserve current default Pi 5 active-cooler dimensions and placement.
   - Keep Raspberry Pi 5 board, GPIO, microSD, and component behavior unchanged.
   - Avoid redefining user-adjustable values inside modules.

6. Add `designs/rpi5_ai_hat_plus_26t.scad`.
   - Follow existing repository source layout:
     - file header,
     - `Adjustable Parameters`,
     - `Derived Values`,
     - render dispatch,
     - main reference modules,
     - helper modules,
     - standalone preview call.
   - Use `use <rpi5.scad>` for optional Raspberry Pi 5 reference rendering.
   - Use `use <rpi5_active_cooler.scad>` for cooler geometry or cooling visual grammar as needed.
   - Add render modes:
     - `assembly`,
     - `hat`,
     - `cooling`,
     - `printable_layout`.
   - Add visibility toggles:
     - `show_rpi5_reference`,
     - `show_rpi5_active_cooler`,
     - `show_ai_hat_electronics`,
     - `show_ai_hat_cooler`,
     - `show_gpio_stack`,
     - `show_pcie_guidance`,
     - `show_labels`,
     - `show_clearance_guides`.
   - Default dimensions must include:
     - AI HAT+ board `65.0 mm x 56.5 mm x 1.6 mm`,
     - Pi 5-to-AI-HAT+ PCB spacing `20.0 mm`,
     - AI module header/pin height `23.0 mm`,
     - Hailo-8 package footprint `17.0 mm x 17.0 mm`,
     - mounting-hole positions aligned to `designs/rpi5.scad`.
   - Model simplified geometry for:
     - AI HAT+ PCB and holes,
     - GPIO/header/socket stack,
     - Hailo-8 package,
     - AI HAT+ cooler with base, fins, fan body, fan opening, hub, thermal pad/contact area, fastener/push-pin markers, and fan-cable guidance,
     - PCIe FPC connector and cable guidance,
     - adjustable top-side component clearance blocks,
     - translucent stack/cooler/header clearance guides,
     - separated printable/fit-check layout with no floating objects.

7. Update `README.md`.
   - Add `designs/rpi5_ai_hat_plus_26t.scad` to the design file list.
   - Remove or correct stale current-design references to missing `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`.
   - Add a Raspberry Pi AI HAT+ 26T section documenting:
     - Hailo-8 26 TOPS variant,
     - approximate public mechanical-source warning,
     - default board dimensions,
     - `20.0 mm` PCB-to-PCB stack distance,
     - `23.0 mm` AI module header/pin height,
     - `17.0 mm x 17.0 mm` Hailo-8 package default,
     - use of `designs/rpi5.scad` as Pi 5 source of truth,
     - reusable active-cooler helper relationship,
     - render modes,
     - common adjustable parameters,
     - optional OpenSCAD commands using `/tmp`,
     - manual inspection checklist.

8. Validate.
   - Run `git diff --check`.
   - Run deterministic source checks for required symbols/defaults.
   - Run OpenSCAD renders or exports to `/tmp`:
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_reference_after_cooler_extract.off designs/rpi5.scad`
   - If local OpenSCAD fails or is unavailable, report the blocker and mark delivery draft unless the user explicitly accepts source-only validation.

9. Main-agent QA.
   - Inspect diffs for spec mapping and regression risk.
   - Inspect OpenSCAD outputs if generated successfully.
   - Confirm:
     - AI HAT+ holes align with Pi 5 mounting holes,
     - AI HAT+ board defaults are `65.0 mm x 56.5 mm x 1.6 mm`,
     - stack distance is `20.0 mm`,
     - header/pin envelope is `23.0 mm` from AI PCB,
     - Raspberry Pi 5 active cooler remains in its existing default envelope,
     - AI HAT+ cooler sits over the Hailo-8 package,
     - PCIe guidance is visible,
     - printable/fit-check layout has no floating reference objects,
     - README no longer advertises a missing current AI HAT source.

10. Final review and delivery.
    - Run a code-review pass against the approved spec and this plan.
    - Resolve in-scope review or QA findings before final delivery.
    - Commit only if implementation, review, QA, validation, and documentation are complete.
    - Use a non-draft commit message only if all required validation passes, for example:
      - `feature: Add Raspberry Pi AI HAT+ 26T reference`
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

Required source checks, implemented as simple shell checks or equivalent:

```sh
rg -n 'rpi5_ai_hat_plus_26t_reference_model|render_mode = "assembly"|ai_hat_board_length_mm = 65.0|ai_hat_board_width_mm = 56.5|ai_hat_stack_distance_mm = 20.0|ai_hat_header_pin_height_mm = 23.0|ai_hat_npu_package_size_mm = \\[17.0, 17.0|rpi5_active_cooler_reference' designs README.md
```

Required OpenSCAD inspection exports:

```sh
openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_reference_after_cooler_extract.off designs/rpi5.scad
```

Expected result:

- `git diff --check` exits 0.
- Source checks find the required public modules, render modes, and default dimensions.
- OpenSCAD commands exit 0 and write temporary outputs under `/tmp`.

## Documentation Requirements

- README updates are required.
- No generated mesh files may be documented as committed artifacts.
- README must clearly state that the AI HAT+ dimensions are approximate public reference values and should be measured before precision enclosure work.

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
