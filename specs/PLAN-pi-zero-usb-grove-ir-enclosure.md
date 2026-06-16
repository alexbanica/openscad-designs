# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes.

## Affected Files

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Keep generated mesh/export files out of source control.
- Do not edit electronics reference files unless a direct syntax or import issue blocks validation.
- Preserve existing board stack geometry, port cutouts, top-cover pin/socket connection, pod-to-top-cover attachment, detachable IR pod top service panel, IR LED aperture, Grove cable path, anti-slide features, render modes, and printable orientations except where directly required to enable IR PCB pilot holes by default and remove unused locator behavior.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved implementation plan,
- repository instructions,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section.

Implementation must not perform additional product, architecture, scope, or planning research. It may inspect only the affected files and local syntax/render output needed to execute and validate this plan.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- identify current IR pod board-mount parameters and derived values,
- identify all uses of IR PCB side/front locator parameters and `pi_zero_usb_grove_ir_pod_board_locators()`,
- identify current `enable_ir_mount_optional_pilot_holes` behavior,
- identify README text that describes IR PCB pilot holes, locators, retainer, and detachable top service panel,
- map each approved cleanup behavior to source, README, validation, or manual review.

## Implementation Steps

1. Preserve the existing default `enable_ir_mount_optional_pilot_holes = true` behavior, or replace it only with an equivalently clear default that enables IR PCB pilot holes in the pod support bosses.
2. Remove unused locator-specific adjustable parameters from the IR emitter pod board-mount parameter group when they no longer drive printable geometry:
   - `ir_pcb_side_locator_width_mm`,
   - `ir_pcb_side_locator_height_mm`,
   - `ir_pcb_front_locator_depth_mm`,
   - `ir_pcb_front_locator_height_mm`.
3. Remove `pi_zero_usb_grove_ir_pod_board_locators()` if it is no longer called by any intended render path.
4. Remove any derived values, helper modules, comments, or references that exist only to support the removed locator geometry.
5. Preserve IR pod support bosses, default pilot-hole subtraction, emitter reference pose, IR LED aperture, pod cable entry, pod-to-top-cover slide attachment, detachable top service panel, printable layout separation, and render-mode behavior.
6. Decide whether the existing separate IR PCB retainer remains useful after pilot holes are enabled by default:
   - if retained, keep it as an intentional separate printable/installed part with clear README wording;
   - if no longer useful, remove its source parameters/modules/rendering and README references as part of the same stale-retention cleanup.
7. Update `README.md` so it no longer says pilot holes are disabled by default and no longer documents removed side/front locator behavior.
8. Update `README.md` to state that the detachable pod top service panel provides access to screw the IR PCB into the pod support bosses with the Grove cable connected.
9. Keep OpenSCAD 2021.01-compatible syntax and existing named-module style.
10. Do not add generated STL, STEP, 3MF, OFF, or similar files to source control.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

Run OpenSCAD inspection renders to temporary files:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_pod.off -D 'render_mode="ir_pod"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

Expected result: each command exits successfully. Generated `.off` artifacts remain under `/tmp` and are not added to source control.

If OpenSCAD is unavailable or a render fails, report the failure and mark delivery as draft unless the user explicitly accepts source-review-only validation.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- IR PCB pilot holes are enabled by default,
- removed locator parameters and modules are no longer referenced,
- no unused locator-only geometry remains in any render mode,
- IR pod support bosses, pilot holes, emitter reference pose, IR LED aperture, cable entry, pod-to-cover attachment, detachable top service panel, and printable layout separation still exist,
- any retained IR PCB retainer is intentionally rendered and documented as distinct from the pod body and detachable top service panel,
- `assembly`, `ir_pod`, and `printable_layout` retain their approved behavior,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it documents that IR PCB pilot holes are enabled by default,
- it documents that the detachable pod top service panel provides screw access,
- it does not document removed side/front locator behavior,
- any retained IR PCB retainer is described accurately and is not confused with the detachable top service panel or pod-to-cover attachment.

## QA Requirements

Main-agent QA is manual review plus the validation commands above:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- run the OpenSCAD inspection renders listed above or report why they could not be run,
- confirm temporary OpenSCAD artifacts are under `/tmp`,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Pi Zero USB Grove IR enclosure updates for default enabled IR PCB pilot holes.
- `README.md` assembly and tuning guidance updates for detachable-panel screw access.
- Removal or rewrite of README text that describes disabled pilot holes or removed locator geometry.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- stale locator parameters or modules left behind,
- stale README/source mismatch,
- pilot holes not enabled by default,
- IR pod support bosses, panel, aperture, cable entry, or pod attachment accidentally removed,
- OpenSCAD syntax/render failures,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
