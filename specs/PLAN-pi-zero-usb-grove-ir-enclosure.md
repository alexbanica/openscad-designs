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

1. In `designs/pi_zero_usb_grove_ir_enclosure.scad`, identify the current detachable IR pod top service panel geometry, panel side retention tabs, panel retention socket cutouts, attachment-side panel relief, pod service window, and separate IR PCB retainer geometry.
2. Replace the detachable pod cap retention mechanism with a simple male/female insert interface:
   - cap-owned male insert pins/posts by default,
   - pod-body-owned matching female receiving sockets/holes by default,
   - adjustable insert diameter or size, insertion depth, socket clearance, socket depth, count, spacing, and placement,
   - no flexible clip tabs, side detents, hooks, latch tabs, rails, sliding lips, or flexing snap features as the default cap retention path.
3. Make the detachable cap cover the complete top surface footprint of the IR pod by default:
   - remove the attachment-side cap relief from the default cap,
   - remove service-window or retainer-access gaps from the installed cap state,
   - preserve only ordinary perimeter fit clearance needed for printable insertion/removal.
4. Remove the separate gray IR PCB retainer from the default printable design:
   - delete or disable the retainer printable object in `printable_layout`,
   - remove retainer-specific modules, derived values, adjustable parameters, holes, service windows, slots, bars, and cutouts when they no longer serve the final design,
   - ensure `render_mode = "ir_pod"` shows only the open-top pod body with cap insert receiving geometry,
   - ensure `render_mode = "printable_layout"` shows bottom tray, top cover, open-top IR pod body, and full-cover cap as separate non-intersecting printable objects.
5. Preserve the approved IR PCB retention path through support bosses plus enabled pilot holes:
   - keep `enable_ir_mount_optional_pilot_holes = true` or an equivalent default enabled screw-access behavior,
   - keep IR PCB support bosses aligned to the two-hole Grove IR emitter reference,
   - keep screw access available after the full-cover cap is removed.
6. Preserve unrelated approved enclosure behavior:
   - Pi Zero/Waveshare/Grove board stack geometry,
   - Pi Zero and Waveshare port cutouts,
   - top-cover-to-bottom-tray plug-in pins/sockets,
   - top-cover-owned pod attachment sockets and pod-owned male posts,
   - pod placement offset away from the RJ45/Ethernet opening,
   - pod side cable entry and main enclosure cable exit,
   - Grove cable path,
   - IR LED aperture full pass-through,
   - top ventilation holes,
   - anti-slide features,
   - render-mode names and printable orientations.
7. Keep cap insert sockets visually distinct from IR PCB pilot holes and from the pod-to-top-cover plug-in socket interface.
8. Keep OpenSCAD 2021.01-compatible syntax and existing named-module style.
9. Update `README.md` so the enclosure section describes:
   - the full-cover detachable IR pod cap,
   - cap-owned male inserts and pod-body-owned female sockets/holes,
   - cap insert tuning parameters,
   - removal of the separate gray IR PCB retainer component and retainer-specific holes/openings,
   - IR PCB retention through support bosses plus enabled pilot holes accessed after cap removal,
   - assembly order with the Grove cable entering through the side cable entry rather than through a missing cap section.
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
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

Expected result: each command exits successfully. Generated `.off` artifacts remain under `/tmp` and are not added to source control.

If OpenSCAD is unavailable or a render fails, report the failure and mark delivery as draft unless the user explicitly accepts source-review-only validation.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- the detachable pod cap uses only simple male/female insert retention by default,
- cap inserts and receiving sockets have adjustable fit parameters near the IR pod cap parameters,
- cap retention no longer uses side detents, flexible clip tabs, hooks, latch tabs, rail/slot retention, sliding lips, or flexing snap features,
- the installed cap covers the whole top surface footprint by default,
- attachment-side reliefs, service-window gaps, retainer-access openings, and other obsolete partial-top openings are removed from the default installed cap state,
- the separate gray IR PCB retainer is removed from `printable_layout`,
- retainer-specific service windows, slots, bars, holes, parameters, modules, and derived values are removed or no longer part of the default design,
- IR PCB support bosses and enabled pilot holes remain present and aligned to the two-hole Grove IR emitter reference,
- cap insert sockets are visually distinct from IR PCB pilot holes and pod-to-top-cover plug-in sockets,
- pod cable entry, main cable exit, Grove cable path, LED aperture, pod-to-top-cover attachment posts/sockets, top-cover-to-bottom-tray pins/sockets, port cutouts, and printable orientations remain preserved,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it describes the full-cover cap and male/female insert retention,
- it no longer describes cap side detents, retainer access gaps, attachment-side reliefs, or the separate gray IR PCB retainer as default behavior,
- it documents IR PCB retention through support bosses plus enabled screw pilot holes after cap removal,
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

- `README.md` Pi Zero USB Grove IR enclosure updates for the full-cover IR pod cap and male/female cap inserts.
- `README.md` assembly and tuning guidance for cap insertion/removal, socket clearance, and fit adjustment.
- Removal or rewrite of README text that describes the separate gray IR PCB retainer, retainer-specific openings, cap reliefs, or side-detent cap retention as default behavior.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- cap retaining clips, side detents, latch tabs, hooks, rails, sliding lips, or flexible snap features remaining as default cap retention,
- the cap still failing to cover the full top surface by default,
- the gray retainer component or retainer-specific holes/openings remaining in the default printable design,
- IR PCB support bosses or pilot holes accidentally removed,
- cap insert sockets confused with IR PCB pilot holes or pod-to-top-cover sockets,
- pod cable entry, LED aperture, or pod-to-top-cover attachment regressed by the full-cover cap,
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
