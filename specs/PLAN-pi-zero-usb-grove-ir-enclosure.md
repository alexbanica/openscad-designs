# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes.

## Affected Files

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Read `designs/grove_infrared_emitter.scad` only as the approved local source of truth for the IR pod PCB, connector, cable-clearance, LED, and mounting-hole defaults.
- Keep generated mesh/export files out of source control.
- Do not edit electronics reference files unless a direct syntax or import issue blocks validation.
- Preserve existing board stack geometry, Waveshare/Pi Zero port cutouts, top-cover pin/socket connection, top-cover-owned pod slide attachment, detachable IR pod top service panel, IR LED aperture pass-through behavior, Grove cable path, anti-slide features, render modes, and printable orientations except where directly required to refresh the IR pod PCB source-of-truth defaults.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved implementation plan,
- repository instructions,
- `designs/grove_infrared_emitter.scad` for current IR emitter reference defaults,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section.

Implementation must not perform additional product, architecture, scope, or planning research. It may inspect only the affected files, the source-of-truth reference file named above, and local syntax/render output needed to execute and validate this plan.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- identify the current Grove Infrared Emitter reference defaults for PCB width, length, thickness, mounting-hole layout, Grove connector placement/envelope, cable clearance, and IR LED extension,
- identify the enclosure's current IR pod PCB, boss, pilot-hole, retainer/service-window, connector, cable-guide, and LED-aperture parameters and derived values,
- identify every enclosure assumption that still encodes the stale 20.0 mm x 24.0 mm PCB or four-hole Grove 20 mm-class layout,
- identify README text and manual inspection guidance that must change to describe the refreshed IR pod defaults,
- map each approved source-of-truth refresh behavior to source, README, validation, or manual review.

## Implementation Steps

1. In `designs/pi_zero_usb_grove_ir_enclosure.scad`, refresh IR pod PCB defaults from `designs/grove_infrared_emitter.scad`:
   - default PCB width `20.25 mm`,
   - default PCB length `23.75 mm`,
   - default PCB thickness `1.6 mm`.
2. Replace the stale four-corner IR PCB mounting-hole derivation with the reference model's two-hole layout:
   - one left mounting hole and one right mounting hole,
   - both centered on the PCB length centerline,
   - X placement derived from the current 20.25 mm PCB width and 2.5 mm edge offset.
3. Ensure IR pod support bosses and default-enabled pilot holes instantiate only the refreshed two mounting positions, unless additional non-hole support geometry is explicitly needed and named as support rather than a mounting-hole default.
4. Rebase derived IR pod geometry that depends on board size or mounting layout onto the refreshed values, including retainer/service-window sizing, pilot-hole positions, support boss placement, emitter reference pose, cable endpoint, and cutout guides.
5. Refresh or confirm the enclosure's IR LED local defaults against the Grove reference:
   - `5.0 mm` LED diameter,
   - `4.0 mm` LED center height above PCB bottom,
   - `7.5 mm` LED extension beyond the PCB edge,
   - positive-Y LED direction before pod rotation.
6. Refresh or confirm the enclosure's Grove connector and cable-clearance defaults against the Grove reference:
   - connector local center `x = 0.0 mm`, `y = -8.1 mm`,
   - `9.65 mm` total connector top envelope from PCB bottom,
   - cable/plug clearance values consistent with the reference while preserving enclosure-specific fit allowances where they are intentionally larger.
7. Preserve enclosure-specific pod wall, service-panel, retainer, cable-entry, aperture, and slide-attachment clearances when they are fit allowances rather than source-of-truth component dimensions.
8. Preserve the existing default `enable_ir_mount_optional_pilot_holes = true` behavior or replace it only with an equivalently clear default that enables pilot holes for the refreshed two-hole layout.
9. Update `README.md` so the Pi Zero USB Grove IR enclosure section states that IR pod PCB dimensions, two-hole mounting pattern, Grove connector placement/envelope, cable clearance, and LED extension defaults come from `designs/grove_infrared_emitter.scad`.
10. Remove or rewrite README/manual-inspection language that describes the IR pod as using a 20.0 mm x 24.0 mm PCB or a four-hole IR PCB mounting pattern by default.
11. Keep OpenSCAD 2021.01-compatible syntax and existing named-module style.
12. Do not add generated STL, STEP, 3MF, OFF, or similar files to source control.

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

Review `designs/grove_infrared_emitter.scad` and confirm the current source-of-truth values used by the enclosure:

- PCB dimensions are `20.25 mm x 23.75 mm x 1.6 mm`,
- mounting-hole layout is exactly two holes centered on the board length centerline with X placement derived from a 2.5 mm edge offset,
- Grove connector local center, total top envelope, cable clearance, LED diameter, LED center height, and LED extension match the values used by the enclosure.

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- IR pod PCB defaults match the current Grove reference dimensions,
- the stale 20.0 mm x 24.0 mm IR pod PCB default is gone,
- IR pod support bosses and pilot holes default to exactly the refreshed two-hole layout,
- no four-hole Grove 20 mm-class IR PCB mounting pattern remains as the default mounting-hole behavior,
- retainer/service-window sizing, pilot holes, support bosses, emitter reference pose, IR LED aperture, pod cable entry, cable endpoint, and cutout guides remain aligned after the refresh,
- enclosure-specific clearances remain intentional fit allowances rather than stale PCB source-of-truth dimensions,
- `enable_ir_mount_optional_pilot_holes` still defaults to enabled or an equivalent enabled default exists,
- IR pod support bosses, emitter reference pose, IR LED aperture, cable entry, pod-to-cover attachment, detachable top service panel, retainer behavior if retained, and printable layout separation still exist,
- `assembly`, `ir_pod`, and `printable_layout` retain their approved behavior,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it documents that the IR pod PCB defaults come from `designs/grove_infrared_emitter.scad`,
- it documents the refreshed 20.25 mm x 23.75 mm x 1.6 mm PCB, two-hole layout, 9.65 mm connector envelope, cable-clearance source, and 7.5 mm LED extension behavior,
- it does not describe the IR pod as using a 20.0 mm x 24.0 mm PCB or four-hole IR PCB mounting pattern by default,
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

- `README.md` Pi Zero USB Grove IR enclosure updates for the refreshed IR pod PCB source-of-truth behavior.
- `README.md` assembly and tuning guidance updates for the two-hole IR PCB mounting pattern and reference-derived connector/cable/LED defaults.
- Removal or rewrite of README text that describes stale 20.0 mm x 24.0 mm IR PCB dimensions or a four-hole IR PCB mounting pattern by default.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- stale 20.0 mm x 24.0 mm IR pod PCB defaults left behind,
- stale four-hole IR PCB mounting-hole behavior left behind,
- stale README/source mismatch,
- pilot holes not enabled by default for the refreshed two-hole layout,
- IR pod support bosses, panel, aperture, cable entry, retainer if retained, or pod attachment accidentally removed,
- OpenSCAD syntax/render failures,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
