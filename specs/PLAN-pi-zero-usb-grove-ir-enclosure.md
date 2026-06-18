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

For the current 2026-06-18 artifact synchronization and fit-tuning update, the user explicitly instructed not to use implementation skills or create subagents. No subagents are required or permitted for this update.

## Implementation Subagents

No implementation subagents are used for the current 2026-06-18 update because the user explicitly prohibited subagent creation for this work.

## Implementation Steps

Current approved narrow update: make the top-cover-owned IR pod female attachment holes direct see-through holes along the pod male-post insertion axis. Implementation must keep the existing pod-owned male post size, placement, and top-cover reinforcement, and must only extend the socket subtraction enough to pass through the reinforced top-cover socket/sleeve instead of ending as a blind pocket.

Current approved collision fix: move the pod-to-top-cover attachment holes far enough apart to avoid intersecting the main cable exit/cable box while preserving the pod center, cable path, post diameter, and see-through socket behavior.

Current approved cap insert collision fix: move the removable IR pod cap female receiver/socket volumes to the lateral outside faces of the IR pod enclosure cavity, with matching cap-side lateral support tabs for the male inserts, so the male inserts can fully pass through after insertion. Preserve pod outer width, cap insert diameter, insertion depth, positive-retention parameters, pod-to-top-cover attachment, cable path, LED aperture, and board mount defaults.

Current approved cap insertion fix: remove the removable IR pod cap insert retention shoulder/interference section completely. The cap-to-pod interface must use straight male insert pins into straight female socket bores, with fit controlled by insert diameter, insertion depth, socket clearance, and socket depth only.

Current approved physical fit tuning:

- Increase `pod_cap_insert_insertion_depth_mm` from `3.0` to `6.0`; this includes the follow-up increase from the prior `4.5` value after physical assembly showed the two top-hat male pins still did not reach the female receiver lock holes.
- Keep the pod-side female `pod_cap_insert_socket_depth_mm` unchanged at the prior `5.1`; this follow-up changes only the cap/top-hat male pin length.
- Keep the pod-side female U-lock cross-hole centerline compatible with the already-printed receiver by deriving it from the prior `4.5` cap insert depth.
- Move only the reprinted cap/top-hat male insert U-lock hole near the free end of the longer `6.0 mm` male pin, leaving at least one lock-hole radius of material below the cut.
- Add `render_mode = "ir_pod_cap"` so only the full-cover IR pod cap/top hat can be exported for reprint.
- Increase both U-shaped lock receiving-hole clearances from `0.2` to `0.45` while keeping the printed U-lock leg diameters unchanged:
  - `pod_cap_insert_keeper_pin_clearance_mm`,
  - `pod_attachment_post_lock_pin_clearance_mm`.
- Increase the IR PCB support-boss/pilot-hole center spacing by `1.5 mm` total by changing `ir_mounting_hole_edge_offset_x_mm` from `2.5` to `1.75`.
- Increase `pod_outer_width_mm` from `29.0` to `31.8` so the widened IR PCB support bosses and pilot holes retain printable side margin. The cap/top-hat width remains derived from `pod_outer_width_mm` and `pod_cap_fit_clearance_mm`.
- Change `render_mode = "ir_pod"` from a body-only standalone view to a pod assembly view showing the pod body with the seated cap/top cover. Keep `printable_layout` as the separate printable-parts view.

1. In `designs/pi_zero_usb_grove_ir_enclosure.scad`, update the IR emitter pod board-fit parameter group so the enclosure has an explicit earlobe-inclusive IR PCB width defaulting to `23.65 mm`.
2. Keep `ir_pcb_length_mm = 23.75`, `ir_pcb_thickness_mm = 1.6`, the two-hole layout, Grove connector defaults, cable-clearance defaults, and LED extension behavior aligned with the intended Grove emitter reference behavior.
3. Update the derived IR mounting-hole spacing so IR PCB support bosses and optional pilot holes derive from the `23.65 mm` earlobe-inclusive width, with the existing adjustable edge inset or an equivalently clear measured hole-center parameter retained for physical tuning.
   - For the 2026-06-18 physical fit tuning, decrease the default X edge inset by `0.75 mm` per side so the two-hole center spacing increases by `1.5 mm` total.
4. Review and adjust the IR pod envelope as needed so the wider `23.65 mm` PCB envelope, earlobes, support bosses, pilot holes, cap sockets, pod walls, cable entry, LED aperture, and pod-to-top-cover attachment do not collide:
   - increase `pod_outer_width_mm` only if needed,
   - for the 2026-06-18 tuning, increase the default pod width enough to preserve side margin around the widened support bosses and pilot holes,
   - preserve the approved pod offset away from the Waveshare RJ45/Ethernet opening,
   - preserve the pod cable entry, main cable exit, Grove cable path, LED aperture pass-through, and pod-to-top-cover plug-in attachment.
5. Strengthen the removable full-cover IR pod cap male insert elements:
   - increase insert diameter, reduce unsupported length, increase root overlap, add cap-side local root pads/gussets, or use an equivalent supported transition,
   - keep the insert interface visually distinct from cover-to-tray pins, pod-to-cover posts, and IR PCB pilot holes,
   - keep the cap printable as a separate object and hand-removable for IR PCB screw access.
6. Remove the prior inversion-safe positive cap retention shoulder from the cap-to-pod male/female insert interface:
   - keep straight cap-side male inserts and straight pod-side female socket bores,
   - control cap fit only through socket clearance, insertion depth, insert diameter, and socket depth,
   - do not reintroduce insert/socket interference sections, detents, fragile flexible side clips, sliding rails, latch tabs, hooks, or the removed separate IR PCB retainer as default cap retention.
6a. Tune the pod-cap/top-hat insert and lock interface for the user's printed fit:
   - increase cap insert insertion depth,
   - increase socket depth to stay deeper than the longer insert,
   - increase pod-cap/top-hat U-lock receiving-hole clearance,
   - keep the pod-cap/top-hat U-lock leg diameter unchanged.
6b. Tune the pod-to-top-cover lock interface for the user's printed fit:
   - increase the receiving-hole clearance through the top-cover socket sleeve and pod post lock path,
   - keep the pod-to-top-cover U-lock leg diameter unchanged.
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
8. Update `render_mode = "ir_pod"` dispatch so the standalone IR pod render shows the pod body with the seated cap/top cover. Preserve `printable_layout` as separate printable pod body and cap objects.
9. Update source comments near the IR emitter pod board mount parameters to state that the previous defaults were copied from `designs/grove_infrared_emitter.scad`, but this enclosure now uses the user's `23.65 mm` earlobe-inclusive measured width as a local pod-fit override.
10. Update `README.md` so the enclosure section describes:
   - the answer that the previous IR pod holes were based on the Grove Infrared Emitter `.scad` values,
   - the new `23.65 mm` earlobe-inclusive IR PCB width used for pod fit, support-boss placement, and pilot-hole alignment,
   - whether the value is currently a local enclosure override rather than a Grove reference source change,
   - the `1.5 mm` wider IR PCB support-boss/pilot-hole spacing,
   - the increased pod width and derived cap/top-hat width used to preserve boss side margin,
   - strengthened cap insert roots,
   - removal of the prior cap retention shoulder/interference section,
   - cap fit tuning parameters, including longer insert insertion depth, deeper sockets, and larger U-lock receiving-hole clearances,
   - standalone `ir_pod` render mode showing the assembled pod body plus cap/top cover,
   - continued screw access after cap removal and continued Grove cable serviceability.
11. Do not add generated STL, STEP, 3MF, OFF, or similar files to source control.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output except any pre-existing CRLF warning already present for untouched files.

Do not run OpenSCAD inspection renders for this update while the user instruction to avoid OpenSCAD execution remains active. If the user later explicitly allows OpenSCAD, temporary inspection renders may be generated under `/tmp` and must not be added to source control.

## Manual Review Requirements

Review `designs/pi_zero_usb_grove_ir_enclosure.scad` and confirm:

- IR pod support bosses and pilot holes derive from the `23.65 mm` earlobe-inclusive width by default,
- the two-hole mounting pattern is preserved,
- the exact hole-center spacing remains adjustable for later physical measurement,
- the default two-hole center spacing is `1.5 mm` wider than before through the adjusted X edge inset,
- the wider PCB envelope does not collide with pod walls, cap sockets, cable entry, LED aperture, or pod-to-top-cover attachment by code review,
- the pod width increase preserves side margin around the widened support bosses and pilot holes and keeps the pod offset away from the Waveshare RJ45/Ethernet opening,
- the cap/top-hat width remains derived from pod width and cap fit clearance,
- cap insert male elements have visibly stronger roots or equivalent supported transitions,
- cap insert insertion depth and matching socket depth allow the male inserts to pass far enough through the pod-side receiver margins for the U-shaped lock path,
- both U-shaped lock interfaces use larger receiving-hole clearances while keeping their printed lock leg diameters unchanged,
- cap insert female receiver/socket volumes sit laterally outside the IR pod enclosure cavity and leave the male inserts a full insertion path,
- cap insert geometry uses straight male pins and straight female socket bores with no retention shoulder, interference section, or detent,
- cap fit remains adjustable and hand-removable for screw access,
- cap closure does not use fragile side clips, sliding rails, latch tabs, hooks, or the removed IR PCB retainer,
- cap insert sockets remain visually distinct from IR PCB pilot holes and pod-to-top-cover plug-in sockets,
- pod cable entry, main cable exit, Grove cable path, LED aperture, pod-to-top-cover attachment posts/sockets, top-cover-to-bottom-tray pins/sockets, port cutouts, and printable orientations remain preserved,
- `render_mode = "ir_pod"` shows the pod body assembled with the seated cap/top cover,
- `printable_layout` still shows the pod body and cap/top cover as separate printable objects,
- all remaining adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it answers that the previous IR pod holes were based on the Grove Infrared Emitter `.scad` values,
- it documents the `23.65 mm` earlobe-inclusive enclosure override and distinguishes it from the current Grove reference value if that reference remains unchanged,
- it documents strengthened cap insert roots and removal of the prior retention shoulder/interference section,
- it documents cap fit tuning parameters and continued hand-removable screw access,
- it documents the increased IR PCB pilot-hole spacing, increased pod width, and standalone `ir_pod` assembled render behavior,
- it distinguishes cap retention from pod-to-top-cover attachment, cover-to-tray attachment, and IR PCB support/pilot holes.

## QA Requirements

Main-agent QA is manual review plus the validation commands above:

- inspect the final diff against the approved spec and this plan,
- run `git diff --check`,
- do not run OpenSCAD inspection renders while the user's no-OpenSCAD instruction remains active,
- confirm no generated mesh/export files were added,
- confirm unrelated dirty worktree changes were not reverted.

## Documentation Updates

Required:

- `README.md` Pi Zero USB Grove IR enclosure updates for the corrected IR PCB width, screw-hole source clarification, cap insert strengthening, and removed cap retention shoulder.
- `README.md` assembly and tuning guidance for cap insertion/removal, socket clearance, and first-print calibration.
- `README.md` updates for the wider IR PCB pilot-hole/support-boss spacing, widened pod/cap default, larger U-lock receiving-hole clearances, and `ir_pod` assembled render mode.
- Removal or rewrite of README text that says IR pod PCB width is only `20.25 mm` for enclosure fit or implies the cap uses positive-lock retention by default.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- IR pod support bosses or pilot holes still deriving from stale `20.25 mm` width,
- the `23.65 mm` value not being documented as a local override when the Grove reference remains unchanged,
- strengthened cap inserts still reading as fragile isolated rods,
- cap fit becoming too loose for the user's preference after removing the retention shoulder,
- cap fit becoming non-removable or blocking screw access,
- cap retaining clips, slide rails, latch tabs, hooks, interference shoulders, detents, or the removed retainer reintroduced as default cap retention,
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
