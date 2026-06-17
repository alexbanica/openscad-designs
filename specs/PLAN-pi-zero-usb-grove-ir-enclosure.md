# PLAN: Pi Zero USB Grove IR Enclosure

Status: Approved

Approved Spec: `specs/SPEC-pi-zero-usb-grove-ir-enclosure.md`

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes. The existing CRLF warning for `designs/pi_zero_usb_grove_ir_enclosure.scad` is not itself an implementation target.

## Affected Files

- Update `designs/pi_zero_usb_grove_ir_enclosure.scad`.
- Update `README.md`.
- Keep generated mesh/export files out of source control.
- Do not edit `designs/grove_infrared_emitter.scad` in this implementation unless the implementation command stops for an approved spec/plan amendment that explicitly adds that file.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved implementation plan,
- repository instructions,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section,
- the current `designs/grove_infrared_emitter.scad` values only as local reference context for explaining the previous source-of-truth mismatch.

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

1. In `designs/pi_zero_usb_grove_ir_enclosure.scad`, update the IR emitter pod board-fit parameter group so the enclosure has an explicit earlobe-inclusive IR PCB width defaulting to `23.65 mm`.
2. Keep `ir_pcb_length_mm = 23.75`, `ir_pcb_thickness_mm = 1.6`, the two-hole layout, Grove connector defaults, cable-clearance defaults, and LED extension behavior aligned with the intended Grove emitter reference behavior.
3. Update the derived IR mounting-hole spacing so IR PCB support bosses and optional pilot holes derive from the `23.65 mm` earlobe-inclusive width, with the existing adjustable edge inset or an equivalently clear measured hole-center parameter retained for physical tuning.
4. Review and adjust the IR pod envelope as needed so the wider `23.65 mm` PCB envelope, earlobes, support bosses, pilot holes, cap sockets, pod walls, cable entry, LED aperture, and pod-to-top-cover attachment do not collide:
   - increase `pod_outer_width_mm` only if needed,
   - preserve the approved pod offset away from the Waveshare RJ45/Ethernet opening,
   - preserve the pod cable entry, main cable exit, Grove cable path, LED aperture pass-through, and pod-to-top-cover plug-in attachment.
5. Strengthen the removable full-cover IR pod cap male insert elements:
   - increase insert diameter, reduce unsupported length, increase root overlap, add cap-side local root pads/gussets, or use an equivalent supported transition,
   - keep the insert interface visually distinct from cover-to-tray pins, pod-to-cover posts, and IR PCB pilot holes,
   - keep the cap printable as a separate object and hand-removable for IR PCB screw access.
6. Add inversion-safe positive cap retention to the cap-to-pod male/female insert interface:
   - tune socket clearance, insertion depth, insert/socket interference, small detent geometry, or equivalent simple printable male/female retention,
   - expose named adjustable parameters for retention force tuning,
   - do not reintroduce fragile flexible side clips, sliding rails, latch tabs, hooks, or the removed separate IR PCB retainer as default cap retention.
7. Preserve unrelated approved enclosure behavior:
   - Pi Zero/Waveshare/Grove board stack geometry,
   - Pi Zero and Waveshare port cutouts,
   - top-cover-to-bottom-tray plug-in pins/sockets,
   - top-cover-owned pod attachment sockets and pod-owned male posts,
   - Grove cable path,
   - IR LED aperture full pass-through,
   - top ventilation holes,
   - anti-slide features,
   - render-mode names and printable orientations.
8. Update source comments near the IR emitter pod board mount parameters to state that the previous defaults were copied from `designs/grove_infrared_emitter.scad`, but this enclosure now uses the user's `23.65 mm` earlobe-inclusive measured width as a local pod-fit override.
9. Update `README.md` so the enclosure section describes:
   - the answer that the previous IR pod holes were based on the Grove Infrared Emitter `.scad` values,
   - the new `23.65 mm` earlobe-inclusive IR PCB width used for pod fit, support-boss placement, and pilot-hole alignment,
   - whether the value is currently a local enclosure override rather than a Grove reference source change,
   - strengthened cap insert roots,
   - positive cap retention intended to prevent the cap falling out under inversion,
   - cap fit and retention tuning parameters,
   - continued screw access after cap removal and continued Grove cable serviceability.
10. Do not add generated STL, STEP, 3MF, OFF, or similar files to source control.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output except any pre-existing CRLF warning already present for untouched files.

Run OpenSCAD inspection renders to temporary files:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_pod.off -D 'render_mode="ir_pod"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

Expected result: each command exits successfully. Generated `.off` artifacts remain under `/tmp` and are not added to source control.

If OpenSCAD is unavailable or a render fails, report the failure and mark delivery as draft unless the user explicitly accepts source-review-only validation.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- IR pod support bosses and pilot holes derive from the `23.65 mm` earlobe-inclusive width by default,
- the two-hole mounting pattern is preserved,
- the exact hole-center spacing remains adjustable for later physical measurement,
- the wider PCB envelope does not collide with pod walls, cap sockets, cable entry, LED aperture, or pod-to-top-cover attachment by code review,
- any pod width increase is minimal and keeps the pod offset away from the Waveshare RJ45/Ethernet opening,
- cap insert male elements have visibly stronger roots or equivalent supported transitions,
- cap insert retention resists inversion in the modeled design through deeper engagement, tighter/interference fit, detent geometry, or equivalent simple male/female retention,
- cap retention remains adjustable and hand-removable for screw access,
- cap retention does not use fragile side clips, sliding rails, latch tabs, hooks, or the removed IR PCB retainer,
- cap insert sockets remain visually distinct from IR PCB pilot holes and pod-to-top-cover plug-in sockets,
- pod cable entry, main cable exit, Grove cable path, LED aperture, pod-to-top-cover attachment posts/sockets, top-cover-to-bottom-tray pins/sockets, port cutouts, and printable orientations remain preserved,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it answers that the previous IR pod holes were based on the Grove Infrared Emitter `.scad` values,
- it documents the `23.65 mm` earlobe-inclusive enclosure override and distinguishes it from the current Grove reference value if that reference remains unchanged,
- it documents strengthened cap insert roots and positive inversion-safe cap retention,
- it documents cap retention tuning parameters and continued hand-removable screw access,
- it distinguishes cap retention from pod-to-top-cover attachment, cover-to-tray attachment, and IR PCB support/pilot holes.

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

- `README.md` Pi Zero USB Grove IR enclosure updates for the corrected IR PCB width, screw-hole source clarification, cap insert strengthening, and positive cap retention.
- `README.md` assembly and tuning guidance for cap insertion/removal, socket clearance/interference, retention force, and first-print calibration.
- Removal or rewrite of README text that says IR pod PCB width is only `20.25 mm` for enclosure fit or implies the cap can rely on loose friction that falls out under inversion.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- IR pod support bosses or pilot holes still deriving from stale `20.25 mm` width,
- the `23.65 mm` value not being documented as a local override when the Grove reference remains unchanged,
- strengthened cap inserts still reading as fragile isolated rods,
- cap retention still able to fall out under inversion by code/design inspection,
- cap retention becoming non-removable or blocking screw access,
- cap retaining clips, slide rails, latch tabs, hooks, or the removed retainer reintroduced as default cap retention,
- IR PCB support bosses or pilot holes accidentally removed,
- pod cable entry, LED aperture, or pod-to-top-cover attachment regressed,
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
