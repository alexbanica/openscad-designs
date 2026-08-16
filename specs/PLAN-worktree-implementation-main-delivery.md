# PLAN: Worktree Implementation Main-Branch Delivery

Status: Approved

Approved Spec: `specs/SPEC-worktree-implementation-main-delivery.md`

## Affected Files

- `AGENTS.md`
- `specs/SPEC-worktree-implementation-main-delivery.md`
- `specs/PLAN-worktree-implementation-main-delivery.md`

## Implementation Steps Performed

1. Inspected the invoking checkout branch, registered worktrees, and staged and
   unstaged changes before editing.
2. Preserved the four pre-existing staged Voomy paths without modifying or
   unstaging them.
3. Replaced the permissive branch-delivery sentence in `AGENTS.md` with a
   mandatory rule for linked-worktree implementations.
4. Required the complete accepted implementation to be integrated into local
   `main`, committed there, and pushed to `origin/main` automatically after
   validation and final reconciliation.
5. Kept detached HEADs and task branches available only as temporary mechanics,
   and made an unsafe `main` update or push a reported blocker.
6. Preserved the existing permissive direct-to-`main` rule for implementations
   performed without a linked worktree.
7. Created the matching auto-approved completed-work spec and plan artifacts.

## Test-First Applicability

- Unit tests and conventional test-first work are prohibited by repository
  instructions and are not applicable to this documentation-only change.

## Validation Run

- `git diff --check`
- Manual inspection of the scoped guidance and artifact diff.
- Final staged-path and staged-diff inspection.

## Validation Skipped

- OpenSCAD rendering, slicer inspection, and physical printing were skipped
  because no design or geometry changed.
- No longer-running validation was applicable.

## QA And Code Review

- QA skipped as required by the explicit super-agent workflow.
- Independent code review skipped as required by the explicit super-agent
  workflow.

## Documentation Updates

- Updated repository workflow guidance in `AGENTS.md`.
- Added the matching completed-work artifacts.
- No `README.md` update was required.

## Staging Status

- The three accepted paths from this invocation are staged.
- The four pre-existing staged Voomy paths remain preserved and are unrelated
  to this invocation.

## Commit And Push Status

- Commit status: not committed; this super-agent invocation did not explicitly
  request committing its own policy edit.
- Push status: not pushed; this super-agent invocation did not explicitly
  request pushing its own policy edit.
- The new policy applies to future linked-worktree **implementation** delivery;
  it does not override super-agent's staged-only rule for this invocation.

## Residual Risk

- Future linked-worktree implementations can be blocked by branch divergence,
  push permissions, or unrelated local changes. The policy requires agents to
  report such a blocker rather than complete delivery on another branch.
- Default Definition of Done is not fully satisfied because super-agent skips
  independent QA and code review and this invocation remains uncommitted and
  unpushed.
