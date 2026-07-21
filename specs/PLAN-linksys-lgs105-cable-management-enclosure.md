# PLAN: Linksys LGS105 Cable-Management Enclosure

Status: Approved

Approved Spec: `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`

## Objective

Deliver the final approved Linksys LGS105 enclosure with a fixed and serviceable
switch bay, covered cable-storage bay, exactly three lay-in cable-service
apertures, one round uplink cable, one shared bundle of four flat device cables,
passive ventilation, validated printable output, and matching documentation.

The existing partial implementation is an integration baseline, not accepted
delivery. Implementation must resolve all accepted independent-review findings
and validate the final state before commit or push.

## No-Research Boundary

Implementation must use only:

- the approved spec;
- applicable repository and workspace instructions;
- current branch and worktree state;
- the named affected files;
- the already researched flat-cable EAN data recorded in the spec;
- minimal OpenSCAD syntax and geometry patterns already present in the repository.

Do not reopen product, hardware-version, architecture, scope, or plan research.
If implementation needs an unapproved measured switch, connector, boot, cable,
or ventilation dimension, stop for a spec amendment rather than inventing it.

## Affected Files

- Complete `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Update `README.md` to match the final source and approved cable contract.
- Preserve the approved spec:
  `specs/SPEC-linksys-lgs105-cable-management-enclosure.md`.
- Preserve this approved plan after approval.

No STL, STEP, 3MF, OFF, PNG, or other generated artifact may be added to source
control. Temporary inspection artifacts belong only under `/tmp`.

## Branch And Worktree Policy

- Expected base and delivery branch: current `main`.
- Direct work on `main` is allowed by repository instructions.
- Verify `main` and inspect the complete worktree before resuming implementation.
- Preserve unrelated user changes; stop before touching any overlapping unrelated
  edit.
- Workers must not create or switch branches, commit, push, or revert unrelated
  changes.

## Test-First Applicability

Test-first development is not applicable. This work is printable OpenSCAD
geometry with no business/domain logic or configured automated test harness, and
the repository explicitly does not require unit tests. Geometry correctness is
instead checked through source inspection, bounded permitted renders, mesh and
visual inspection, and `git diff --check`.

## Dependency-Aware Execution Graph

```text
D1 enclosure fit and service corrections
  -> D2 round/flat cable and connector-access contract
    -> D3 length-aware cable storage and routing evidence
      -> D4 ventilation, keepouts, render modes, and printable layout
        -> D5 README final-state documentation
          -> R1 geometry/spec review ---------+
          -> R2 docs/parameter review --------+-> scoped fixes -> main-agent QA
```

D1-D4 are serialized because they consecutively own the same `.scad` file. D5
starts after the source parameter contract is final. R1 and R2 are read-only and
may run concurrently.

## Planned Work Units

### D1 - Enclosure Fit And Service Corrections

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: none.
- Boundary:
  - preserve the switch bay and two-part architecture;
  - add positive Y clearance to end stops using the approved fit clearance;
  - provide a usable power-side connector service cavity without inventing a
    measured connector dimension, deriving conservative space only from approved
    geometry such as the minimum bend radius;
  - strengthen the wall web between the LED sightline and lay-in slots;
  - use the adjustable switch corner radius in the preview envelope;
  - provide positive configured bed-edge margins in printable layout.
- Acceptance criteria:
  - switch remains constrained in X, Y, and Z and removable with the cover off;
  - the DC connector can be placed and connected in the open assembly without
    colliding with the power wall in the modeled default;
  - retention remains clear of central Ethernet, LED, DC, and ventilation areas;
  - front-wall continuous material is at least the configured wall thickness
    between the sightline and service slots;
  - both printable parts remain separate, stable, non-floating, and inside the
    configured P2S bed with positive margins.
- Validation: source dimension inspection and deferred D4 permitted renders.
- Subagent assignment: one clean-context implementation worker, at most five
  minutes active work.

### D2 - Round/Flat Cable And Connector-Access Contract

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: D1.
- Boundary:
  - replace the single round-cable abstraction with adjustable
    `uplink_cable_diameter_mm`, `device_cable_width_mm`, and
    `device_cable_thickness_mm` controls;
  - keep one round uplink aperture and one shared device aperture for all four
    flat cables, with the approved default usable envelopes;
  - represent the four flat device cables as one compact stacked bundle at the
    shared exit, never as four service holes;
  - add installed-cover skirt reliefs aligned with all three lay-in slots while
    retaining roof material as their upper closure;
  - keep every slot fully open from above with the cover removed so RJ45 heads
    are placed inside rather than passed through a closed hole.
- Acceptance criteria:
  - the default device slot has at least `8.0 mm x 7.0 mm` usable space and fits
    the approved `6.0 mm x 5.6 mm` four-flat-cable stack with clearance;
  - the uplink slot fits the round `4.0 mm` cable with approved clearance;
  - exactly three cable-service apertures remain: power, round uplink, and shared
    flat-device bundle;
  - the installed skirt does not reduce or pinch any approved cable envelope;
  - preview geometry visibly distinguishes round and flat cable profiles.
- Validation: source inspection of subtraction depth, cover relief alignment,
  cross-sections, and exact aperture count; deferred D4 permitted renders.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### D3 - Length-Aware Cable Storage And Routing Evidence

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: D2.
- Boundary:
  - consume the approved count and length inputs rather than leaving them inert;
  - assert one uplink, four devices, five total cables, and `1500 mm` total input;
  - model representative smooth storage routes for one round `500 mm` uplink and
    four flat `250 mm` device cables;
  - route references continuously between the switch-side service region,
    storage guides, and their correct lay-in apertures without crossing solid
    walls below the slots;
  - preserve the configured minimum bend radius and keep cable layers covered.
- Acceptance criteria:
  - length/count values participate in deterministic assertions or derived route
    construction;
  - all preview cables enter through their actual slots and avoid solid walls;
  - round and flat routes use no radius below `minimum_cable_bend_radius_mm`;
  - the four flat device routes share one exit and remain identifiable as a
    bundle;
  - modeled loops demonstrate plausible storage for the approved five-cable set
    while leaving individually selected exposed lengths outside.
- Validation: source-level route-length/count calculations, bend-radius checks,
  collision inspection, and preview-module wiring inspection without rendering
  the prohibited preview mode.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### D4 - Ventilation, Keepouts, Render Modes, And Printable Layout

- Type: development.
- Owned file: `designs/linksys_lgs105_cable_management_enclosure.scad`.
- Dependencies: D3.
- Boundary:
  - relocate any floor vents blocked by the switch into cable-storage regions
    that are clear of default guides and cable-contact paths, while preserving a
    passive path to the switch compartment;
  - retain elevated side inlets and top outlets as applicable;
  - keep vents clear of retention, cable guides, routes, apertures, and corners;
  - make switch service and ventilation keepout intent explicit in adjustable or
    derived geometry and preview/source structure without inventing hardware
    measurements;
  - finalize assembly cover orientation, individual-mode dispatch,
    cable-routing-preview wiring, and printable layout.
- Acceptance criteria:
  - every default vent fully pierces its wall and is not closed by the modeled
    switch, retention, guide, or default cable geometry;
  - cable and switch regions share an airflow path without a fourth service
    aperture;
  - `assembly` hides all references when toggles are false;
  - individual and cable-preview modes are correctly wired by source inspection;
  - printable layout has exactly two separated, stable parts with positive bed
    margins and no reference geometry.
- Validation:
  - bounded `assembly` render with references hidden;
  - bounded `printable_layout` render with references hidden;
  - stop either render at 15 seconds;
  - do not render individual-part or cable-routing-preview modes.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### D5 - README Final-State Documentation

- Type: documentation development.
- Owned file: `README.md`.
- Dependencies: D4.
- Boundary: document the final source, cable EAN/profile distinction, exact
  planning defaults, connector-access mechanism, routing, retention, power-side
  service space, ventilation, render modes, printing, and validation limits.
- Acceptance criteria:
  - exact defaults include round uplink `4.0 mm`, flat device `6.0 x 1.4 mm`,
    four-cable stack `6.0 x 5.6 mm`, shared slot `8.0 x 7.0 mm`, fit clearances,
    lengths, and minimum bend radius;
  - documentation clearly states that all four device cables share one slot;
  - assembly instructions say to remove the cover, place/connect RJ45 heads
    inside, then lower jackets into the open slots;
  - EAN data is identified as retailer-derived and measurement remains required;
  - only `assembly` and `printable_layout` render commands are documented for
    repository validation;
  - no claim implies physical, slicer, thermal, or test-print validation.
- Validation: targeted source/README parameter and behavior comparison.
- Subagent assignment: one new clean-context implementation worker, at most five
  minutes active work.

### R1 - Geometry And Spec-Conformance Review

- Type: read-only code review.
- Owned files: review of the final SCAD and approved spec.
- Dependencies: D5.
- Boundary: independently review aperture penetration and count, cover reliefs,
  cable profiles and paths, power service space, retention, ventilation,
  wall continuity, layout, connectivity, orientation, and OpenSCAD compatibility.
- Acceptance criteria: severity-ranked findings with exact locations; no edits.
- Subagent assignment: one clean-context reviewer, at most five minutes.

### R2 - Documentation And Parameter-Contract Review

- Type: read-only code/documentation review.
- Owned files: review of README, final SCAD, approved spec, and approved plan.
- Dependencies: D5.
- Boundary: independently compare defaults, EAN/profile disclosures, lengths,
  render commands, assembly procedure, and validation limitations.
- Acceptance criteria: severity-ranked findings with exact locations; no edits.
- Subagent assignment: one clean-context reviewer, at most five minutes.

## Concurrency And Supervision

- Test-focused concurrency: `0`; test-first is not applicable.
- Development-worker concurrency: `1`; D1-D4 share the same SCAD and D5 depends
  on its final public contract.
- Review-worker concurrency: up to `2`; R1 and R2 are independent and read-only.
- QA concurrency: not applicable; the main agent owns QA.
- At five minutes, stop any active worker, capture completed and partial work,
  inspect the worktree, and split the remainder into smaller clean-context units
  rather than retrying the same assignment unchanged.

## Main-Agent Review And QA

After development and independent review, the main agent must:

1. Inspect the complete diff against the approved spec and plan.
2. Route every accepted review or QA fix to a new scoped implementation worker.
3. Confirm exactly three default cable-service apertures.
4. Confirm all slots and vents fully pierce their walls and cover reliefs preserve
   the approved cable envelopes.
5. Confirm one round uplink and four flat device cables, with all four device
   cables sharing one slot and no cable reference crossing a solid wall.
6. Confirm length/count inputs are used and all modeled bends meet the configured
   minimum radius.
7. Confirm power connector service space, XYZ retention, service keepouts, LED
   wall strength, and passive airflow.
8. Confirm printable parts are stable, separate, connected, non-floating, and
   inside the P2S footprint with positive margins.
9. Confirm README matches source and does not overstate validation.
10. Complete final main-agent acceptance only after all required findings are
    resolved or explicitly documented as blockers.

## Validation Commands

Run from the repository root:

```sh
timeout 15 openscad -o /tmp/linksys_lgs105_enclosure_assembly.off \
  -D 'render_mode="assembly"' \
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
`bottom_tray`, `top_cover`, and `cable_routing_preview` dispatch and module wiring
without rendering those modes. Keep all temporary outputs under `/tmp`.

## Commit And Push Expectations

- Reconcile the complete worktree and classify every changed path.
- Stage only the accepted spec, plan, SCAD source, and README update.
- Inspect staged paths and staged diff before committing.
- Commit on `main` with
  `feature: Add Linksys LGS105 cable-management enclosure`.
- Include `DRAFT` if any required render, review, QA, documentation, or
  risk-reporting step is incomplete or failing.
- Push `main` to `origin` and verify the local branch is not ahead afterward.
- Preserve and report any unrelated user changes.

## Completion Report Requirements

Report implemented behavior, review and QA issues, resolved findings, validation
run and skipped, render timings and inspected evidence, remaining hardware/fit/
cable/airflow/slicer/test-print risks, documentation changes, commit and push
status, final or draft status, blocked or unvalidated steps, Definition of Done
status, and final main-agent acceptance.
