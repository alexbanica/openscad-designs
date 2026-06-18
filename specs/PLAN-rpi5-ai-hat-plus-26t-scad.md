# PLAN: Raspberry Pi AI HAT+ 26T OpenSCAD Reference Design

Status: Approved

## Approved Spec

- `specs/SPEC-rpi5-ai-hat-plus-26t-scad.md`

## Scope

Implement the approved Raspberry Pi AI HAT+ 26T PCIe connector correction, PCB side-margin centering update, README documentation update, and validation required by the approved spec.

Do not implement behavior outside the approved spec.

## Branch

- Work may continue on `main`, because repository instructions allow direct commits to `main` when otherwise unspecified.
- Do not create a feature branch unless the user explicitly requests one before implementation starts.

## Affected Files

- `designs/rpi5_ai_hat_plus_26t.scad`
- `README.md`
- `specs/SPEC-rpi5-ai-hat-plus-26t-scad.md`
- `specs/PLAN-rpi5-ai-hat-plus-26t-scad.md`

Generated OpenSCAD outputs must be written only under `/tmp` and must not be committed.

## Ownership Boundaries

- `designs/rpi5_ai_hat_plus_26t.scad`: remove the incorrect hanging/off-board PCIe guidance geometry, keep left-side on-board PCIe connector/routing reference geometry, and center the connector/routing on the middle of the PCB side margin by default.
- `README.md`: document that PCIe guidance is a left-side on-board connector/routing reference centered on the PCB side margin, not a separate hanging device.
- Spec and plan files: status and planning artifacts only.

Do not change existing Pi Zero, Grove, Waveshare, or enclosure `.scad` behavior.

## Implementation Steps

1. Verify clean-context implementation boundary.
   - Implementation must start only in a fresh session, explicitly cleared context, or after explicit user confirmation to continue in the current context.
   - Load only applicable instructions, the approved spec, this approved plan, current worktree state, and minimal file context needed for the listed files.

2. Inspect target files.
   - Read `AGENTS.md` and `/home/alexbanica/workspace.md`.
   - Read the approved spec and approved plan.
   - Read `designs/rpi5_ai_hat_plus_26t.scad` and the relevant README section.

3. Add focused test-first/check-first coverage.
   - Because this repository has no unit-test framework, create deterministic source checks before production implementation using shell assertions or reviewable command checks rather than adding a test harness.
   - Check that the implemented source no longer contains the incorrect hanging PCIe guidance variables:
     - `ai_hat_pcie_cable_origin_mm`,
     - `ai_hat_pcie_cable_path_size_mm`,
     - `ai_hat_pcie_flex_origin_mm`,
     - `ai_hat_pcie_flex_size_mm`.
   - Check that source and README include left-side/on-board PCIe wording.
   - These checks may be executed after implementation as validation; no permanent test files are required unless the implementation command determines a small script is worthwhile and scoped to this spec.

4. Update `designs/rpi5_ai_hat_plus_26t.scad`.
   - Remove the incorrect off-board hanging PCIe cable/flex guidance geometry.
   - Keep `show_pcie_guidance` as the visibility control.
   - Place the default PCIe FPC connector on the left part of the AI HAT+ PCB.
   - Replace the hanging PCIe guide with on-board connector/routing reference geometry only.
   - Keep PCIe dimensions adjustable near the existing PCIe parameter group.
   - Derive the PCIe connector and routing Y origins from a side-margin centerline based on `ai_hat_board_width_mm / 2`.
   - Preserve existing AI HAT+ board, mounting holes, stack distance, header height, Hailo-8 package, cooler, active-cooler, render modes, labels, and clearance guides unless directly affected by the PCIe correction.

5. Update `README.md`.
   - In the Raspberry Pi AI HAT+ 26T section, document that PCIe guidance is a left-side on-board connector/routing reference centered on the PCB side margin.
   - Remove wording that implies a separate hanging PCIe device or off-board vertical guidance object.

6. Validate.
   - Run `git diff --check`.
   - Run deterministic source checks for the PCIe correction.
   - Run OpenSCAD renders or exports to `/tmp`:
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad`
     - `openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad`
   - If local OpenSCAD fails or is unavailable, report the blocker and mark delivery draft unless the user explicitly accepts source-only validation.

7. Main-agent QA.
   - Inspect diffs for spec mapping and regression risk.
   - Inspect OpenSCAD outputs if generated successfully.
   - Confirm:
     - PCIe guidance is visible when `show_pcie_guidance = true`,
     - PCIe guidance is absent when `show_pcie_guidance = false`,
     - PCIe connector/guidance sits on the left part of the AI HAT+ PCB with the connector centerline at `ai_hat_board_width_mm / 2`,
     - no hanging/off-board vertical PCIe object remains at AI PCB level,
     - printable/fit-check layout has no floating PCIe reference objects,
     - existing AI HAT+ board, stack, Hailo-8, cooler, and active-cooler behavior remains intact.

8. Final review and delivery.
    - Run a code-review pass against the approved spec and this plan.
    - Resolve in-scope review or QA findings before final delivery.
    - Commit only if implementation, review, QA, validation, and documentation are complete.
    - Use a non-draft commit message only if all required validation passes, for example:
      - `fix: Correct AI HAT+ PCIe connector reference`
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
rg -n 'left-side|on-board|show_pcie_guidance|rpi5_ai_hat_plus_26t_pcie_reference' designs/rpi5_ai_hat_plus_26t.scad README.md
! rg -n 'ai_hat_pcie_cable_origin_mm|ai_hat_pcie_cable_path_size_mm|ai_hat_pcie_flex_origin_mm|ai_hat_pcie_flex_size_mm' designs/rpi5_ai_hat_plus_26t.scad
```

Required OpenSCAD inspection exports:

```sh
openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad
```

Expected result:

- `git diff --check` exits 0.
- Source checks find the corrected PCIe contract and no longer find the removed hanging PCIe guidance variables.
- OpenSCAD commands exit 0 and write temporary outputs under `/tmp`.

## Documentation Requirements

- README updates are required.
- No generated mesh files may be documented as committed artifacts.
- README must document the PCIe guidance as a left-side on-board connector/routing reference centered on the PCB side margin and not as a separate hanging device.

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
