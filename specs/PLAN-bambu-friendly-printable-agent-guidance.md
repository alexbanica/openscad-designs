# PLAN: Bambu-Friendly Printable Agent Guidance

Status: Approved

Approved Spec: `specs/SPEC-bambu-friendly-printable-agent-guidance.md`

## Auto-Approved Super-Agent Work Record: Default Printable Layout (2026-07-24)

### Affected Files

- `AGENTS.md`
- `specs/SPEC-bambu-friendly-printable-agent-guidance.md`
- `specs/PLAN-bambu-friendly-printable-agent-guidance.md`

### Implementation Steps Performed

1. Interpreted "always default to printable_layout" as a repository rule for
   the source default of any `render_mode` control in new or modified `.scad`
   files.
2. Added the rule under `AGENTS.md` OpenSCAD guidance and preserved all other
   supported modes as explicit overrides.
3. Kept the invocation guidance-only: no existing design source, README text,
   or generated export was changed.
4. Updated the matching approved spec and this completed-work record.

### Validation And Delivery Record

- Validation run: `git diff --check` and manual inspection of the three-file
  guidance/artifact diff.
- Validation skipped: unit tests are prohibited and not applicable; OpenSCAD
  rendering, slicer inspection, and physical printing were not run because no
  geometry changed.
- QA skipped: required by the explicit super-agent workflow.
- Code review skipped: required by the explicit super-agent workflow.
- Documentation updated: repository OpenSCAD default-render guidance in
  `AGENTS.md`; no README update was required.
- Staging status: all three paths changed by this invocation staged; the four
  pre-existing staged Linksys paths were preserved and not modified.
- Commit status: not committed.
- Push status: not pushed.
- Residual risk: existing `.scad` files are not retroactively normalized and
  remain subject to their current defaults until a later in-scope edit.

## Target Branch

No dedicated branch is required. Repository instructions allow committing directly to `main` when otherwise unspecified.

Implementation must not revert unrelated dirty worktree changes present at implementation time.

## Affected Files

- Update `AGENTS.md`.
- Do not update `.scad` files.
- Do not update `README.md` unless implementation finds a direct contradiction with the approved spec.
- Do not add generated mesh/export files.

## No-Research Constraint

Implementation must use only:

- the approved spec,
- this approved plan after approval,
- current repository and workspace instructions,
- the current `AGENTS.md` file.

Implementation must not perform additional product, architecture, scope, or web research.

## Test-First Applicability

Automated tests are not applicable. This is an agent-instruction documentation change and repository instructions do not require QA or unit tests unless explicitly requested.

The test-first phase is replaced by deterministic pre-edit checklist review:

- identify the existing Bambu Lab print compatibility bullet in `AGENTS.md`,
- update the repository instructions near the existing development/design guidance,
- ensure the new wording is scoped to future printable versions and new spec files.

## Implementation Steps

1. Re-read `AGENTS.md` and the approved spec.
2. Update `AGENTS.md` in the `Development Approach` section or the nearest existing repository guidance section.
3. Preserve the existing Bambu Lab P2S and AMS 2 Pro compatibility target.
4. Add printable-version guidance requiring future printable versions to be Bambu Lab-friendly.
5. State that printable versions must avoid floating objects unless an approved spec explicitly allows a different layout.
6. State that every printable object should be separable and printable independently unless an approved spec explicitly requires objects to be joined or printed together.
7. State that every printable object should be oriented with its broadest, most material-heavy, or most stable face downward on the printer plate unless an approved spec documents a different print orientation.
8. Add new-spec dimension documentation guidance requiring every new spec file to document manually entered dimensions when used, including PCB dimensions, dimensions between components, and component sizes.
9. Keep wording concise and agent-actionable.
10. Do not modify existing `.scad` files, existing design specs, existing plans, generated outputs, or unrelated documentation.

## Validation Commands

Run:

```sh
git diff --check
```

Expected result: command exits successfully with no output.

## Manual Review Requirements

Review the `AGENTS.md` diff and confirm:

- Bambu Lab P2S and AMS 2 Pro compatibility remains present,
- printable versions are explicitly required to be Bambu Lab-friendly,
- no-floating-object guidance is present,
- separately printable object guidance is present,
- build-plate orientation guidance is present,
- approved-spec exceptions are documented where required,
- every new spec file must document manually entered dimensions when used, including PCB dimensions, dimensions between components, and component sizes,
- wording does not require retroactive edits to existing specs or designs.

Review the final diff and confirm:

- no `.scad` files changed,
- no generated mesh/export artifacts were added,
- unrelated untracked files or user changes were not modified.

## QA Requirements

Main-agent QA is manual review only:

- inspect the final diff against the approved spec,
- run `git diff --check`,
- confirm no generated mesh/export files were added,
- confirm no unrelated worktree changes were reverted or modified.

## Documentation Updates

Required:

- `AGENTS.md` repository guidance update.

Not required:

- `README.md`, unless a direct contradiction is found during implementation.

## Review And Acceptance

Implementation review must check for:

- mismatch with the approved spec,
- wording that over-constrains non-printable reference models,
- missing approved exception paths,
- unrelated file churn.

Final main-agent acceptance must be completed after validation and QA.

## Commit And Push Expectations

After implementation, review, QA, validation, documentation, and final main-agent acceptance:

- commit only the approved changes if project policy and worktree state permit a clean commit,
- direct commit to `main` is allowed by repository instructions,
- push if repository access exists and no validation/review/QA/documentation item is blocked.

If validation, review, QA, or documentation is incomplete or blocked, either do not commit or use a `DRAFT` commit message if committing is explicitly needed.
