# A feature runs on its own branch and ends completed, abandoned, superseded, or suspended

A feature is a bounded unit of main-line work with a lifecycle: it runs on a branch
created for it, is designed through the five hinges, and reaches one of four declared
states. The feature record tracks that lifecycle. A feature is built to an **intent**, not
a question — nothing is being tested — which is what separates it from an experiment and
what accounts for every place this rule departs from the experiment's.

- **Always on a branch.** Every feature is built on a branch created for it — never
  directly on the branch it will merge into. Name it `feature/<subject>`, where `<subject>`
  is a short dash-separated, lower-case name of *what is being built*, named literally. The
  upstream branch is not encoded in the name; it lives in the record.
- **Record the base and the upstream branch.** The baseline the feature branched from is
  captured in the record — the base commit SHA and the ref it came from — never pinned with
  a tag. The upstream branch it merges back into is **not always `master`**; it may be
  another topic branch, and the record names it so the merge target is never ambiguous.
- **The working location is chosen at initiation — single working tree or worktree.** Every
  feature branches; this chooses only how many checkouts the branch is worked in. **Single
  working tree** switches the one tree to the feature branch and back. **Worktree** adds a
  second checkout while the main working tree stays on the upstream branch. The choice is
  put to the user at **every** initiation, through the **AskUserQuestion** selection UI,
  with no standing default — as it is for an experiment. The choice, and for a worktree its
  **path**, go in the record; the conclusion executes the mechanics that match it.
- **A worktree is a sibling of the repository directory, named
  `<repository-name>-<subject>-feature`.** For a repository at `…/projects/waytide/waytide`
  and the branch `feature/upload-retries`, that is
  `…/projects/waytide/waytide-upload-retries-feature`. The shared repository-name prefix
  and the sibling placement put the worktree in the same lexical vicinity as its repository
  when the parent directory is listed. Sibling placement also keeps the path **outside the
  repository working tree**, where it must be: a worktree created inside it appears as
  untracked content in the feature's own `git status`.
- **The working location changes on two triggers.** Adding a worktree for a feature already
  under way is the only change the working location undergoes after initiation. **One is
  external:** other work arrives that the user intends to work alongside the feature. **One
  is internal — the feature is *escalated*:** it turns out to need more isolation than the
  single working tree gives it, having been begun ad hoc and proved larger than it was
  taken for. Either way the addition is confirmed and recorded, the record **gains a line**
  rather than having its original rewritten, and the conclusion dispatches on the current
  location.
- **DBE governs the inside.** The five hinges — actuation, observation, controls,
  implementation, naming — govern how the feature is designed, and the loop record captures
  each pass. This rule governs only the outside: how the feature begins, where it is
  worked, and how it ends.
- **The states.** A feature **ends** in one of three states — **completed** (integrated
  into the upstream branch, the ordinary conclusion), **abandoned** (dropped before
  completion), or **superseded** (replaced by a different design) — or it is **suspended**
  (paused, not ended). Every feature reaches one of these; it is never left silently open.
  There is no *affirmed*, *refuted*, or *inconclusive*: those judge a question, and a
  feature has an intent.
- **Verified before integrating; nothing gates the merge.** A feature's tests are verified
  before it is integrated, which `run-suite-before-commit` already achieves — every commit
  on the branch having been verified. **No further gate applies at the merge.** The merged
  result is a combination neither branch ran, so a feature whose commits all passed can
  still break the suite on integration. That is ordinary and is fixed from there. There is
  also **no affirmation step**: a feature has no finding to promote into the decision log,
  so completion is the conclusion.
- **Abandoned and superseded keep the record.** In either the branch is not merged and the
  record is maintained, marked with its state. When one feature supersedes another, **both
  records name the counterpart**.
- **Suspension keeps the branch.** A suspended feature's branch is not removed and its
  record is marked suspended. Under the **single working tree** the tree switches back to
  the upstream branch and the branch sits dormant; under a **worktree** the worktree is kept
  in place and checked out, so the feature resumes where it stands.
- **Conclude in the main working tree, on the upstream branch.** However a feature
  concludes, the user should end up on the upstream branch — under the single working tree
  by switching back, and under a worktree in the main working tree, which never left it.
- **Branch deletion is user-confirmed, and the worktree is removed first.** Deleting the
  feature branch, local or remote, requires explicit user confirmation put through the
  selection UI. Where the feature was worked in a worktree, removing the worktree precedes
  deleting the branch — git refuses to delete a branch checked out in a worktree — and
  **one confirmation covers both**. Suspension never deletes.
- **Record every confirmation** the lifecycle requires — the working-location choice at
  initiation, adding a worktree to a feature under way, branch deletion and worktree
  removal — in the feature record, so the work's authority is auditable.
- **There is no instruction to watch for other work.** The experiment rule asks the agent
  to watch for main-sequence work starting while an experiment is open. That has no
  counterpart here: during a feature, other work is normally **another feature**, and
  starting one is ordinary rather than a problem, so there is nothing to detect. A feature
  being *forgotten* is still a real risk, and the **session-start notice** covers it by
  reporting features that have not concluded.

**Why:** a feature that starts and stops without a declared state leaves the project unable
to say what is in flight and what concluded — the same gap the experiment lifecycle closed,
in the far more common case. Mirroring the experiment's structure gives feature work a
beginning, a recorded place, and an end without inventing a second vocabulary for the same
facts. The four departures are what keep it honest: an experiment's forecast, verdict
states, merge gate, and affirmation all exist to answer a **question**, and a feature does
not ask one. Copying them across would install ceremony where the justification does not
reach — the failure the design method exists to retire.

**How to apply:** branch every feature as `feature/<subject>`, and record the upstream
branch, the feature branch, and the base. Put the working location to the user at every
initiation, and place a worktree as a sibling of the repository directory named
`<repository-name>-<subject>-feature`. Design the feature through the hinges. End it in a
state: **completed** on integration, **abandoned** if dropped, **superseded** if replaced
(cross-referencing both records), or **suspended** if paused. Verify before integrating and
add no gate at the merge; fix a post-merge failure from there. Leave the user on the
upstream branch in the main working tree, confirm before deleting any branch — removing the
worktree first, under one confirmation — and record every confirmation in the feature
record. Related: the agent-features-convention (the record), the
experiment-runs-on-its-own-branch rule (the capability this mirrors, and where it
deliberately differs), the announce-waytide-at-session-start rule (which reports features
that have not concluded), the design-by-efferent hinge-cycle and loop-records rules (which
govern the feature's design), and the `git` run-suite-before-commit rule.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:33:40 AM PT
