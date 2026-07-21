# PLAN: Linksys LGS105 Cable-Management Enclosure

Status: Approved

Approved Spec: `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`

## Objective

Deliver the final approved Linksys LGS105 enclosure with its existing switch fit,
cable storage, exactly three lay-in cable-service apertures, round-uplink and
flat-device routing, ventilation, horizontal use, and serviceability preserved,
plus:

- reduced-footprint vertical tabletop placement on either long tray side;
- two identical detachable stabilizer feet that keep cable walls and side vents
  clear of the tabletop;
- positive, tool-free cover capture that does not depend only on friction;
- horizontal and both vertical assembly previews and a four-object printable
  layout;
- matching documentation and explicit physical-validation limitations.

Implementation is complete only when the final source, documentation, approved
spec, and approved plan are reconciled, committed, and pushed. If the required
printed stability and latch-cycle checks cannot be performed, delivery and the
commit must remain `DRAFT`.

## No-Research Boundary

Implementation must use only:

- the approved spec and this approved plan;
- applicable repository and workspace instructions;
- current branch and worktree state;
- the named affected files;
- the existing Linksys enclosure geometry and local OpenSCAD patterns.

Do not reopen hardware, product, cable, architecture, scope, or planning
research. Do not invent new measured switch, cable, retention-force, or thermal
claims. If implementation requires behavior or dimensions outside the approved
spec, stop for a spec or plan amendment.

## Affected Files

- Update `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Update `README.md`.
- Include the approved iteration in
  `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`.
- Include this approved final-state plan.

No STL, STEP, 3MF, OFF, PNG, or other generated artifact may be added to source
control. Temporary inspection artifacts belong only under `/tmp`.

## Branch And Worktree Policy

- Expected base and delivery branch: current `main`.
- Direct work on `main` is allowed by repository instructions.
- Verify `main` and inspect the complete worktree before implementation.
- Preserve unrelated user changes and stop before touching any overlapping
  unrelated edit.
- Workers must not create or switch branches, commit, push, or revert unrelated
  changes.

## Test-First Applicability

Test-first development is not applicable. This is printable OpenSCAD geometry
with no business/domain logic or configured automated test harness, and the
repository explicitly does not require unit tests. Deterministic geometry
assertions, bounded permitted renders, visual inspection, independent review,
and `git diff --check` provide the applicable non-physical validation.

## Dependency-Aware Execution Graph

```text
D1 universal vertical-support feet
  -> D2 positive cover capture
    -> D3 orientation, assertions, and printable-layout integration
      -> D4 final README documentation
        -> R1 geometry/spec review ---------+
        -> R2 docs/parameter review --------+-> scoped fixes -> main-agent QA
```

D1-D3 are serialized because they own the same `.scad` file. D4 begins only
after the source contract is final. R1 and R2 are independent read-only reviews
and may run concurrently. Shared-file fixes are assigned one at a time and
integrated by the main agent.

## Planned Work Units

### D1 - Universal Vertical-Support Feet

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: none.
- Behavior and component boundary:
  - add adjustable vertical-support parameters with the approved defaults:
    two feet, `60.0 mm` base width, `18.0 mm` along-enclosure foot length,
    `3.0 mm` tabletop vent gap, and `0.30 mm` fit clearance;
  - add one named `vertical_support_foot` printable module and the tray-side
    engagement geometry it requires;
  - make the two printed foot instances identical and usable on either long
    tray side, without a left/right-specific variant;
  - engage only the bottom tray, remain tool-free and detachable, and place the
    two feet apart along enclosure depth to resist rocking;
  - keep both side-vent banks, all three cable apertures, the LED sightline, and
    the cover removal path unobstructed;
  - preserve the existing horizontal tray contact and use when feet are removed.
- Acceptance criteria:
  - exactly two identical foot instances support either approved vertical side;
  - the configured support width is narrower than the horizontal enclosure width;
  - the downward-facing side wall retains at least the configured `3.0 mm`
    tabletop gap;
  - neither support nor attachment geometry overlaps a vent, cable-service
    aperture, retention feature, or cable envelope;
  - the foot is connected, non-floating, separable, and oriented on its broadest
    stable print face.
- Validation: source dimension/keepout inspection and deferred D3 renders.
- Subagent assignment: one clean-context implementation worker, at most five
  minutes active work.

### D2 - Positive Tool-Free Cover Capture

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: D1.
- Behavior and component boundary:
  - preserve the skirt and pin geometry as cover alignment features;
  - add at least two opposed positive snap catches with matching shoulders or
    undercuts and the approved default `0.20 mm` interference;
  - expose adjustable catch interference, flexure, engagement, and release
    geometry near the existing cover-retention parameters;
  - keep retention independent of the feet, switch body, and stored cables;
  - provide deliberate tool-free release access without destructive flexing;
  - keep catches clear of vents, service apertures, cable paths, switch pads,
    and printable stable faces.
- Acceptance criteria:
  - each catch has visible geometric capture and cannot be classified as smooth
    pin friction alone;
  - at least two opposed catches retain the installed cover in horizontal and
    either vertical placement;
  - catches remain printable in the approved tray and cover orientations and
    expose an accessible release action;
  - cover removal still exposes the complete switch, cable bay, connectors, and
    all three lay-in slots.
- Validation: source cross-section/engagement inspection and deferred D3 renders;
  physical force and wear remain subject to the approved printed checks.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### D3 - Orientation, Assertions, And Printable-Layout Integration

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: D2.
- Behavior and component boundary:
  - add `assembly_orientation` with `horizontal` as the default and `vertical` as
    the alternate value;
  - add `vertical_standing_side` with `left` and `right` values so the permitted
    long-side configurations can be inspected using the same support feet;
  - compose the assembled tray, cover, and both feet without transforming the
    individual printable modules away from their stable print orientations;
  - add deterministic derived values/assertions for foot count, supported
    orientation values, reduced bounding footprint, vent/attachment keepouts,
    positive cover engagement, and complete P2S layout bounds;
  - extend the render dispatcher with `vertical_support_foot` while preserving
    every existing render mode;
  - revise `printable_layout` to include one tray, one cover, and two separated
    foot instances, all within the configured P2S plate with positive margins;
  - preserve all existing switch, cable, aperture, routing, ventilation, and
    horizontal-layout assertions and behavior.
- Acceptance criteria:
  - horizontal assembly remains the default and matches the previously approved
    arrangement;
  - both vertical-side assemblies rest only through the feet, keep cable walls
    upright, and show no tray/cover/foot/tabletop collision;
  - default vertical bounding tabletop area is strictly smaller than default
    horizontal bounding tabletop area;
  - both downward-facing side-vent configurations retain the approved gap and
    all three cable-service apertures remain usable;
  - printable layout contains exactly four separated printable objects with no
    electronics or cable references and positive bed margins;
  - OpenSCAD remains compatible with 2021.01 and has no external dependency.
- Validation:
  - bounded horizontal `assembly` render with references hidden;
  - bounded left-side and right-side vertical `assembly` renders with references
    hidden;
  - bounded `printable_layout` render with references hidden;
  - source inspection of individual-part and cable-preview dispatch;
  - stop every render at 15 seconds.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### D4 - Final-State README Documentation

- Type: documentation development.
- Owned file: `README.md`.
- Dependencies: D3.
- Behavior and component boundary:
  - preserve existing hardware, cable-profile, routing, assembly, and ventilation
    guidance;
  - document horizontal use and vertical use on either long tray side, including
    installation and removal of the two identical feet;
  - document exact support and cover-latch defaults, tuning parameters, reduced
    footprint, vent gap, cable-wall prohibition, and cover release procedure;
  - document the horizontal, both vertical, and printable-layout validation
    commands using only repository-permitted render modes;
  - document the padded stability/cable-handling check and ten-cycle latch test;
  - state that vertical stability, retention force, material durability, airflow,
    slicer behavior, and physical fit are not validated by renders alone.
- Acceptance criteria:
  - README parameter names and defaults exactly match the final source;
  - users are told never to stand the enclosure on the Ethernet or power wall;
  - instructions distinguish rendered evidence from required physical checks;
  - no claim overstates hardware, thermal, slicer, test-print, or wear validation.
- Validation: targeted source/README contract comparison.
- Subagent assignment: one new clean-context documentation worker, at most five
  minutes active work.

### R1 - Geometry And Spec-Conformance Review

- Type: read-only code review.
- Owned files: review of final SCAD, approved spec, and approved plan.
- Dependencies: D4.
- Behavior and component boundary: independently review vertical stability
  geometry, universal foot fit, vent and aperture keepouts, positive catch
  engagement/release, horizontal regressions, part connectivity, print
  orientation, layout bounds, and OpenSCAD compatibility.
- Acceptance criteria: severity-ranked findings with exact file locations and
  spec/plan references; no edits.
- Validation: inspect the final diff and permitted render evidence.
- Subagent assignment: one clean-context reviewer, at most five minutes active
  work.

### R2 - Documentation And Parameter-Contract Review

- Type: read-only code/documentation review.
- Owned files: review of README, final SCAD, approved spec, and approved plan.
- Dependencies: D4.
- Behavior and component boundary: independently compare all support, latch,
  orientation, render, assembly, safety, and physical-validation contracts while
  checking that preserved cable and enclosure guidance remains accurate.
- Acceptance criteria: severity-ranked findings with exact file locations and no
  edits.
- Validation: exact source-to-document parameter and behavior comparison.
- Subagent assignment: one clean-context reviewer, at most five minutes active
  work.

## Concurrency And Supervision

- Test-focused concurrency: `0`; test-first is not applicable.
- Development-worker concurrency: `1`; D1-D3 share the SCAD file and D4 depends
  on its final parameter and render contract.
- Review-worker concurrency: up to `2`; R1 and R2 are independent and read-only.
- QA concurrency: not applicable; the main agent owns QA.
- At five minutes, stop any active worker, record completed work, partial work,
  changed files, validation, blockers, and remaining work, then inspect and split
  the remainder into smaller non-overlapping clean-context assignments.
- The main agent serializes all shared-file integration and routes each accepted
  review or QA fix to a new clean-context implementation worker.

## Main-Agent Review And QA

After development and independent review, the main agent must:

1. Inspect the complete diff against the approved spec and plan.
2. Confirm the same two feet fit both long-side configurations and engage only
   the tray.
3. Confirm the feet do not cover side vents, service apertures, cables, release
   points, or the LED sightline and preserve the configured tabletop gap.
4. Confirm positive cover capture has matching shoulders/undercuts, deliberate
   release access, and no dependence on smooth-pin friction or the feet.
5. Confirm horizontal use and every previously approved switch, cable, aperture,
   routing, service, and ventilation contract remain intact.
6. Confirm horizontal, left-vertical, right-vertical, and printable-layout render
   evidence and inspect non-rendered mode wiring.
7. Confirm all four printable objects are stable, connected, separated, and
   inside the P2S footprint with positive margins.
8. Confirm README matches source and distinguishes rendered from physical
   validation.
9. Record the physical stability and ten-cycle latch tests as passed only if they
   were actually performed; otherwise mark delivery and commit `DRAFT`.
10. Reconcile every changed path, resolve or document all findings, and complete
    final main-agent acceptance.

## Validation Commands

Run from the repository root:

```sh
timeout 15 openscad -o /tmp/linksys_lgs105_enclosure_horizontal.off \
  -D 'render_mode="assembly"' \
  -D 'assembly_orientation="horizontal"' \
  -D 'show_switch_reference=false' \
  -D 'show_cable_references=false' \
  designs/linksys_lgs105_cable_management_enclosure.scad

timeout 15 openscad -o /tmp/linksys_lgs105_enclosure_vertical_left.off \
  -D 'render_mode="assembly"' \
  -D 'assembly_orientation="vertical"' \
  -D 'vertical_standing_side="left"' \
  -D 'show_switch_reference=false' \
  -D 'show_cable_references=false' \
  designs/linksys_lgs105_cable_management_enclosure.scad

timeout 15 openscad -o /tmp/linksys_lgs105_enclosure_vertical_right.off \
  -D 'render_mode="assembly"' \
  -D 'assembly_orientation="vertical"' \
  -D 'vertical_standing_side="right"' \
  -D 'show_switch_reference=false' \
  -D 'show_cable_references=false' \
  designs/linksys_lgs105_cable_management_enclosure.scad

timeout 15 openscad -o /tmp/linksys_lgs105_enclosure_printable_layout.off \
  -D 'render_mode="printable_layout"' \
  -D 'show_switch_reference=false' \
  -D 'show_cable_references=false' \
  designs/linksys_lgs105_cable_management_enclosure.scad

git diff --check
git status --short --branch
```

If a render reaches 15 seconds, stop it and report the timeout. Inspect
`bottom_tray`, `top_cover`, `vertical_support_foot`, and
`cable_routing_preview` dispatch and module wiring without rendering those
modes. Keep all temporary outputs under `/tmp`.

Physical validation, when the printed enclosure and hardware are available:

1. On a padded surface, install both feet and hold the populated enclosure for at
   least 60 seconds on each long side.
2. Reposition the connected cables normally and confirm the feet remain engaged,
   the enclosure does not rock or tip, no cable bears on the tabletop, and the
   cover remains fully caught.
3. Release and reinstall the cover ten times and confirm every positive catch
   remains intact, tool-free, and engaged.

## Commit And Push Expectations

- Reconcile the complete worktree and classify every modified, added, deleted,
  renamed, and untracked path.
- Preserve and identify unrelated user changes.
- Stage every accepted in-scope change: approved spec, approved plan, SCAD source,
  and README.
- Inspect the staged path list and staged diff before committing.
- Commit on `main` with `feature: Add vertical Linksys enclosure placement`.
- Include `DRAFT` in the commit subject when any required render, review, QA,
  documentation, physical validation, or risk-reporting step is skipped, blocked,
  incomplete, or failing.
- Push `main` to `origin` and verify the local branch is no longer ahead of its
  configured upstream.
- Inspect final `git status` and do not report completion while any accepted
  in-scope change remains outside the commit.

## Completion Report Requirements

Report the implemented final-state behavior; review and QA findings; resolved
issues; validation run and not run; render timing and visual evidence; physical
stability and latch-cycle status; remaining fit, retention, wear, airflow, slicer,
and test-print risks; documentation changes; complete changed-path
reconciliation; commit and push status; final or draft status; skipped, blocked,
or unvalidated steps; Definition of Done status; and final main-agent acceptance.
