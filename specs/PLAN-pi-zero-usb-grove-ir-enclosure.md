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
- Preserve existing board stack geometry, port cutouts, main top-cover pin/socket connection, pod-to-top-cover attachment, IR LED aperture, Grove cable path, IR PCB loading path, IR PCB retainer, anti-slide features, and render modes except where directly required to split the IR pod roof into a detachable service panel.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved implementation plan,
- repository instructions,
- the current `designs/pi_zero_usb_grove_ir_enclosure.scad`,
- the current `README.md` enclosure section.

Implementation must not perform additional product, architecture, or scope research. It may inspect only the affected files and local syntax/render output needed to execute and validate this plan.

## Test-First Applicability

Automated unit tests are not applicable. This is an OpenSCAD design repository with no test framework, and repository instructions state QA/unit tests are not required unless explicitly requested.

The test-first phase is replaced by a deterministic pre-implementation checklist:

- identify current IR pod shell parameters, derived values, and modules,
- identify how the pod roof is currently formed and how the interior is subtracted,
- identify current printable wrappers for `ir_pod` and `printable_layout`,
- identify current IR PCB retainer placement and ensure the new detachable panel remains distinct from it,
- identify current README text for IR pod printing, assembly, render modes, and manual inspection,
- map each approved detachable-panel behavior to source, README, validation, or manual review.

## Implementation Steps

1. Add adjustable IR pod panel parameters near the existing IR pod parameters:
   - panel thickness,
   - panel fit clearance,
   - panel overlap/lip or equivalent seating dimension,
   - screwless retention feature dimensions and placement,
   - printable-layout spacing for the panel if needed.
2. Add derived values for the detachable panel:
   - panel outer size based on pod body dimensions and fit clearance,
   - panel installed Z position in the assembled pod,
   - any retention/tab/pin/socket positions,
   - printable placement values that keep the panel separate from the pod body and the existing IR PCB retainer.
3. Refactor the IR pod shell so the default pod body is open at the top:
   - remove the fused roof/top face from the printable pod body,
   - preserve pod floor, walls, slide slots, cable entry, service window, PCB locators, board supports, IR LED aperture, and internal cable clearance,
   - keep the pod body printable on its broad floor at `Z=0` in standalone printable output.
4. Add a named module for the detachable IR pod top service panel:
   - make it a separate printable closure part,
   - include screwless retention geometry by default,
   - keep retention geometry distinct from the pod-to-top-cover slide interface and the IR PCB retainer,
   - avoid requiring internal screwdriver access,
   - preserve enough material for plausible Bambu Lab P2S printing.
5. Add matching pod-body interface geometry if needed:
   - panel seating lips, shallow sockets, slots, snap receivers, or equivalent features,
   - ensure these features do not block the LED aperture, cable entry, service window, slide slots, PCB loading path, PCB retainer, or board locators.
6. Update render behavior:
   - `assembly` shows the IR pod with the detachable panel installed,
   - `ir_pod` shows only the printable open-top pod body by default unless an explicitly adjustable option is added,
   - `printable_layout` shows bottom tray, top cover, open-top IR pod body, detachable panel, and existing IR PCB retainer as separate non-intersecting build-plate objects,
   - `electronics` remains a reference/fit view and does not depend on printable panel placement.
7. Review printable orientation transforms:
   - pod body rests on its floor at `Z=0`,
   - detachable panel rests on a broad stable face at `Z=0`,
   - existing printable objects remain separated and independently printable,
   - no generated mesh/export artifacts are added.
8. Update `README.md`:
   - document the detachable IR pod top service panel and why it exists,
   - document that the pod body prints open-top to avoid trapped internal Bambu Studio tree supports,
   - distinguish the detachable panel from the IR PCB retainer and pod-to-top-cover slide attachment,
   - document assembly order for installing the IR PCB, Grove cable, PCB retainer, detachable pod panel, and pod-to-top-cover attachment,
   - document the new adjustable panel fit/retention parameters,
   - update render mode, printable-layout, print notes, and manual inspection guidance as needed.
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

- IR pod body no longer has a fused roof/top face by default,
- IR pod body remains a printable open-top object resting on its broad floor at `Z=0`,
- detachable IR pod top service panel is a separate named printable part,
- `assembly` installs the detachable panel and closes the pod,
- `printable_layout` places the pod body, detachable panel, and IR PCB retainer as distinct non-intersecting objects with independent build-plate contact,
- `ir_pod` standalone output shows the printable pod body only by default unless an explicit adjustable option includes the panel,
- panel retention is screwless and adjustable,
- panel retention is distinct from the cover-to-tray pin/socket interface, pod-to-cover slide attachment, and IR PCB retainer,
- panel installation does not require internal screwdriver access,
- panel installation does not require disconnecting the Grove cable after normal PCB installation,
- panel and pod-body interface geometry do not block the LED aperture, cable entry, service window, slide slots, PCB loading path, PCB retainer, board locators, or pod-to-top-cover attachment,
- IR LED aperture remains a true pass-through opening,
- main enclosure, top cover, bottom tray, existing pod attachment, PCB retainer, cable path, port cutouts, and anti-slide behavior remain preserved except for direct pod-panel changes,
- all new or changed adjustable linear values use `_mm`,
- no generated mesh/export artifacts are tracked.

Review `README.md` and confirm:

- it documents the detachable IR pod top service panel,
- it states the panel exists to avoid inaccessible Bambu Studio tree supports inside the pod,
- it distinguishes the detachable panel from the IR PCB retainer and pod-to-top-cover attachment,
- it documents the assembly order and new tuning parameters,
- render mode, printable-layout, print notes, and manual inspection guidance match the source.

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

- `README.md` Pi Zero USB Grove IR enclosure section updates for the detachable IR pod top service panel.
- `README.md` render mode and printable layout updates for the added panel object.
- `README.md` print notes explaining that the pod body prints open-top to avoid trapped internal supports.
- `README.md` assembly and manual inspection guidance updates distinguishing the detachable panel from the IR PCB retainer.

No `AGENTS.md` update is required.

## Review And Acceptance

Implementation review must check for:

- spec mismatch,
- accidental behavior outside approved scope,
- stale fused pod roof still present in default pod body,
- detachable panel missing from `assembly`,
- detachable panel missing from `printable_layout`,
- panel confused or intersecting with the IR PCB retainer,
- unsupported/floating printable objects,
- panel retention that requires internal screw access,
- panel or interface geometry blocking the LED aperture, cable path, PCB loading path, slide slots, or pod-to-cover attachment,
- OpenSCAD syntax/render failures,
- README/source mismatch,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
