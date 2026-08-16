# SPEC: Worktree Implementation Main-Branch Delivery

Status: Approved

## Purpose And Requested Behavior

Require every implementation performed in a linked Git worktree to be
automatically committed on the repository's `main` branch and pushed to
`origin/main`.

## Scope

- Update repository agent guidance in `AGENTS.md`.
- Define the delivery branch and push requirement for future linked-worktree
  implementations.
- Record this completed super-agent change in matching approved spec and plan
  artifacts.

## Out Of Scope

- Changing any OpenSCAD design or printable geometry.
- Changing the branch, commit, or push state of an existing implementation.
- Retrofitting already completed task branches or detached worktree commits.
- Changing the super-agent command's staged-only delivery behavior for this
  invocation.

## Definitions

- **Linked-worktree implementation:** implementation work performed in a Git
  checkout registered through `git worktree` rather than in the invoking
  checkout.
- **Delivery branch:** the branch that contains the accepted implementation
  commit when delivery is reported complete.
- **Temporary implementation mechanics:** detached HEADs or task branches used
  while developing or validating a change before it is integrated into `main`.

## Inputs And Constraints

- Repository-level guidance may strengthen the global implementation delivery
  default for this repository.
- Unrelated user changes must remain preserved during reconciliation and
  integration.
- An agent must not force an unsafe integration or push when local `main`, the
  remote, or the worktree state prevents deterministic delivery.
- This is an instruction-only change; no geometry validation or generated mesh
  output is applicable.

## Deterministic Behavior Delivered

- Every future linked-worktree implementation uses `main` as its final delivery
  branch.
- After validation and reconciliation, the main agent automatically integrates
  the complete accepted change set into local `main`, commits it there, and
  pushes it to `origin/main`.
- Detached HEADs and task branches may exist only as temporary implementation
  states and do not satisfy delivery.
- Completion may be reported only after `origin/main` contains the accepted
  implementation commit.
- If local `main` cannot be safely updated or `origin/main` cannot be safely
  pushed, the agent stops and reports the blocker rather than substituting a
  different delivery branch.
- Implementations performed without a linked worktree retain the existing rule
  that direct commit and push to `main` is acceptable when otherwise
  unspecified.

## Assumptions And Impact

- "Committed automatically in the main branch and pushed" means the final
  accepted commit must be reachable from both local `main` and `origin/main`;
  merely pushing a task branch does not satisfy the request.
- The implementation may create a commit while temporarily detached and then
  integrate that exact commit into `main`, provided the completed delivery is
  recorded on `main` and pushed to `origin/main`.
- Future approved plans for linked-worktree implementation must align their
  delivery branch with this repository-level `main` requirement.

## Validation Performed

- Ran `git diff --check` for the scoped documentation changes.
- Manually inspected the repository guidance and completed-work artifacts for
  consistent branch, commit, push, and blocker semantics.

## Validation Skipped

- Unit tests are prohibited by repository instructions and not applicable.
- OpenSCAD rendering, slicer inspection, and physical printing were not run
  because no geometry changed.
- QA and independent code review were skipped as required by the explicit
  super-agent workflow.

## Documentation Changes

- Updated `AGENTS.md` with the mandatory worktree-to-`main` delivery policy.
- Added this approved completed-work spec and its matching approved plan.
- `README.md` was not updated because design behavior, render modes, printing
  guidance, and validation workflow did not change.

## Residual Risk

- The policy cannot guarantee that a future push will succeed when `main` has
  diverged, permissions are unavailable, or unrelated work prevents safe
  integration; those cases are explicitly blockers rather than alternate-branch
  delivery paths.
