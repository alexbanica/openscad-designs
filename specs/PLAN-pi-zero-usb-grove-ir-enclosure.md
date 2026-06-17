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
- Preserve existing board stack geometry, Waveshare/Pi Zero port cutouts, top-cover-to-bottom-tray pin/socket connection, detachable IR pod top service panel, IR PCB support/pilot-hole behavior, IR PCB retainer path, IR LED aperture pass-through behavior, Grove cable path, anti-slide features, render modes, and printable orientations except where directly required to replace the pod slide attachment with the approved plug-in attachment.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved implementation plan,
- repository instructions,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section.

Implementation must not perform additional product, architecture, scope, or planning research. It may inspect only the affected files, approved artifacts, repository instructions, and local syntax/render output needed to execute and validate this plan.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

For implementation-command compliance, behavior-changing implementation must still use exactly one clean-context test-focused subagent before production implementation if subagent tooling is available. The test-focused subagent must produce a deterministic inspection checklist mapped to the approved spec and this plan, not production source changes.

## Implementation Subagents

If implementation proceeds under the implementation command and subagent tooling is available, use:

- exactly one clean-context test-focused subagent before production implementation,
- exactly one clean-context implementation subagent for production source/doc edits,
- exactly one clean-context code-review subagent after implementation.

If required subagent tooling is unavailable, stop and report the blocker before production implementation.

Subagents must receive only the approved spec, this approved plan, their exact assignment, ownership boundary, and minimal relevant file context.

## Implementation Steps

1. In `designs/pi_zero_usb_grove_ir_enclosure.scad`, identify the current top-cover-owned pod slide rail/root/gusset/retention features and the matching pod slide slot/retention pocket features.
2. Replace the default pod-to-top-cover slide attachment with a plug-in male/female attachment:
   - top-cover-owned female sockets/holes by default,
   - pod-body-owned male pins/posts by default,
   - at least two engagement points by default,
   - `3.0 mm` or larger default narrowest male cross-section,
   - adjustable male size/diameter, insertion length, spacing, offsets, socket clearance, and socket depth.
3. Keep the plug-in pod attachment visually and mechanically separate from:
   - the top-cover-to-bottom-tray pins/sockets,
   - Pi Zero stack mounting holes,
   - IR PCB support bosses and pilot holes,
   - IR PCB retainer,
   - detachable pod top service panel retention,
   - IR LED aperture.
4. Integrate the pod attachment sockets into reinforced or thickened top-cover material while preserving cover strength around the top-cover-to-bottom-tray pins, ventilation holes, main cable exit, and top-cover margins.
5. Root the pod-owned male features visibly into the IR pod body using continuous parent material or local reinforcement while preserving pod wall strength around the cable entry, panel retention sockets, LED aperture, service opening, and PCB support geometry.
6. Remove or refactor obsolete pod slide attachment code and parameters when they no longer serve the final plug-in design, including slide rails, slide slots, slide retention bumps, slide pockets, slide reliefs, and slide-specific README language.
7. Preserve the existing pod placement defaults, including the X offset that keeps the pod away from the Waveshare RJ45/Ethernet opening, unless direct clearance correction is required to keep that approved behavior.
8. Preserve the main enclosure cable exit, pod cable entry, Grove cable guide, detachable pod top service panel, IR PCB retainer path, IR PCB two-hole support/pilot-hole behavior, and full IR LED pass-through aperture.
9. Preserve the existing top-cover-to-bottom-tray plug-in pins/sockets and do not reintroduce cover screws, pod attachment screws, long vertical screws, fragile clip tabs, front-face hardware near the opening-dense face, or a continuous top-cover alignment lip.
10. Update `README.md` so the enclosure section describes:
    - the pod-to-top-cover plug-in male/female attachment,
    - that the `top_cover` owns the female sockets and the IR pod owns the male pins/posts,
    - tuning parameters for male size, insertion length, socket clearance, and socket depth,
    - expected vertical insertion/removal behavior,
    - distinction between pod attachment, top-cover-to-bottom-tray attachment, IR PCB retention, and pod service panel retention,
    - removal of the previous pod slide rail/slot attachment as the default behavior.
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
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_pod.off -D 'render_mode="ir_pod"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

Expected result: each command exits successfully. Generated `.off` artifacts remain under `/tmp` and are not added to source control.

If OpenSCAD is unavailable or a render fails, report the failure and mark delivery as draft unless the user explicitly accepts source-review-only validation.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- the default pod-to-top-cover interface is plug-in male/female, not slide rail/slot,
- top-cover-owned sockets/holes have adjustable clearance and depth,
- top-cover sockets are integrated into reinforced or thickened top-cover material,
- pod-owned male pins/posts are simple, sturdy, and at least `3.0 mm` at the narrowest default cross-section,
- pod-owned male feature roots are visibly continuous with the IR pod body,
- obsolete slide rail/slot/detent/pocket/relief behavior is removed or no longer part of the default attachment path,
- pod attachment remains distinct from cover-to-tray pins/sockets, stack holes, IR PCB support/pilot holes, IR PCB retainer, pod panel retention, and LED aperture,
- cable exit, pod cable entry, cable path, panel, PCB retainer, PCB pilot holes, and LED aperture remain present and aligned,
- pod placement still avoids the Waveshare RJ45/Ethernet opening by default,
- render modes `top_cover`, `ir_pod`, `assembly`, and `printable_layout` retain their approved behavior,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it describes the pod plug-in male/female attachment,
- it no longer presents the slide rail/slot attachment as the default,
- it documents tuning values for insertion length, socket clearance, and plug-in fit,
- it distinguishes pod attachment from top-cover-to-bottom-tray attachment, IR PCB retention, and detachable pod panel retention.

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

- `README.md` Pi Zero USB Grove IR enclosure updates for the pod-to-top-cover plug-in male/female attachment.
- `README.md` assembly and tuning guidance for pod plug-in insertion/removal, socket clearance, and fit adjustment.
- Removal or rewrite of README text that describes the previous pod slide rail/slot attachment as the default.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- slide rail/slot attachment remaining as the default pod attachment,
- fragile tab-style pod attachment,
- pod attachment screws or cover screws introduced by mistake,
- top-cover sockets colliding with cover-to-tray pins, ventilation holes, main cable exit, or top-cover margins,
- pod male features colliding with panel retention, cable entry, PCB support, retainer, or LED aperture,
- pod placement regressing over the RJ45/Ethernet opening,
- stale README/source mismatch,
- OpenSCAD syntax/render failures,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
