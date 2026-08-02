# A feature's working location is chosen at initiation, and it ends completed, abandoned, superseded, or suspended

A feature is a bounded unit of main-line work with a lifecycle: it is worked in a location
chosen when it begins, is designed through the five hinges, and reaches one of four declared
states. The feature record tracks that lifecycle. A feature is built to an **intent**, not
a question — nothing is being tested — which is what separates it from an experiment and
what accounts for every place this rule departs from the experiment's.

- **A branch is usual but not required.** Where a feature takes a branch it is named
  `feature/<subject>`, where `<subject>` is a short dash-separated, lower-case name of *what
  is being built*, named literally. The upstream branch is not encoded in the name; it lives
  in the record. **A feature may also be built directly on the current branch** — see the
  working location below.
- **Record the base and the upstream branch.** The baseline the feature branched from is
  captured in the record — the base commit SHA and the ref it came from — never pinned with
  a tag. The upstream branch it merges back into is **not always `master`**; it may be
  another topic branch, and the record names it so the merge target is never ambiguous.
- **The working location is chosen at initiation — branch only, branch and worktree, or the
  current branch.** Each option states what it creates, rather than leaving it to be
  inferred.
  **Branch only** — create the branch
  `feature/<subject>` and switch this working tree to it, switching back at the conclusion
  (`git switch -c feature/<subject>`). **Branch and worktree** — create the branch and
  check it out in a new worktree, a second working directory, while this working tree
  stays on the upstream branch (`git worktree add -b feature/<subject> <path>`). **The current
  branch** — build the feature where the working tree already is, creating nothing; there is
  no branch to switch back to at the conclusion and nothing to merge. The first two create the
  branch, since it does not exist yet at initiation. **Branch only says nothing
  about the working tree** — what distinguishes it from the worktree option is whether a
  working directory is added, so branch only is presented as the branch it creates and the
  return at the conclusion, not as a movement of the working tree, which is immaterial to it.
  The `-b` is required, and
  the plain `git worktree add <path> <branch>` form applies only when a worktree is added
  to a feature already under way. The choice is
  put to the user at **every** initiation, through the **AskUserQuestion** selection UI,
  with no standing default. The choice, and for a worktree its
  **path**, go in the record; the conclusion executes the mechanics that match it.
  **The current branch is offered last, after the two branching options.** A selection's first
  option reads as the recommended one whatever the rule says about defaults, and the current
  branch is the option that gives up isolation — so putting it first would recommend by
  position what the rule declines to recommend in words. Last is where it belongs: available
  without being urged.
- **The current-branch option is a feature's alone; an experiment never has it.** An
  experiment is a **controlled deviation from the main line** — it may be refuted or
  abandoned, and until it is affirmed its changes must not reach the branch it deviates from.
  The branch is what makes that reversible, so it is not optional there. A feature **is** the
  main line, and its changes are meant to land on it, so a branch protects it against nothing
  that is not already ordinary. The asymmetry is not a relaxation of the feature's discipline;
  it follows from what the two kinds of work are, which is the same reasoning that gives a
  feature no forecast, no verdict, and no merge gate.
- **What the current branch costs, stated plainly.** There is no isolation: partial work sits
  on the branch others read, and abandoning the feature means reverting rather than deleting a
  branch. The record still carries the intent, the state, and the confirmations, so the
  lifecycle is unchanged — only its containment is. Choose it where a branch would buy nothing:
  work small enough to finish in one sitting, or work whose intermediate states are harmless
  on the upstream branch.
- **A worktree is a sibling of the repository directory, named
  `<repository-name>-feature-<subject>`** — the branch name with its slash written as a
  dash, prefixed by the repository. For a repository at `…/projects/eventide/constant`
  and the branch `feature/upload-retries`, that is
  `…/projects/eventide/constant-feature-upload-retries`. The kind comes before the
  subject, so every feature sorts together under `<repository>-feature-` rather than
  interleaving with the experiments by subject. The shared repository-name prefix
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
- **DBE governs the inside, attended or unattended.** The five hinges — actuation,
  observation, controls, implementation, naming — govern how the feature is designed, and the
  loop record captures each cycle. What is chosen at initiation is the **gating cadence**:
  **attended**, where the loop stops at every hinge for the developer, or **unattended**, where
  the agent decides each hinge and generates through. Attended is the default, and the choice
  is put through the selection UI **beside the working location**, since both are decisions
  about how the work will be conducted and both hold for its duration. **DBE is in effect
  either way** — only the stopping changes. Record it as a confirmation and declare it at the
  top of the loop record. See the design-by-efferent
  attended-or-unattended-is-chosen-at-initiation rule. This rule governs only the outside: how
  the feature begins, where it is worked, and how it ends.
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
  record is marked suspended. With **branch only** the tree switches back to
  the upstream branch and the branch sits dormant; under a **worktree** the worktree is kept
  in place and checked out, so the feature resumes where it stands.
- **Conclude in the main working tree, on the upstream branch.** However a feature
  concludes, the user should end up on the upstream branch — with branch only
  by switching back, and under a worktree in the main working tree, which never left it. On
  the **current branch** there is nowhere to return from: the working tree never left, and
  the conclusion is the state being recorded.
- **On the current branch there is no merge and no branch to delete.** The work is already on
  the upstream branch as it is made, so **completed** means the intent is built rather than
  integrated, and **abandoned** means the work is reverted rather than a branch left unmerged.
  That is the substantive cost of the option and the reason it is chosen deliberately: an
  abandoned feature on a branch is discarded by deleting the branch, and on the current branch
  it has to be undone.
- **Branch deletion is user-confirmed, and the worktree is removed first.** Deleting the
  feature branch, local or remote, requires explicit user confirmation put through the
  selection UI. Where the feature was worked in a worktree, removing the worktree precedes
  deleting the branch — git refuses to delete a branch checked out in a worktree — and
  **one confirmation covers both**. Suspension never deletes.
- **Record every confirmation** the lifecycle requires — the working-location choice at
  initiation, the attended-or-unattended choice at initiation, adding a worktree to a feature
  under way, branch deletion and worktree removal — in the feature record, so the work's authority is auditable.
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

**How to apply:** put the working location to the user at every initiation — branch only,
branch and worktree, then the current branch last — and record the choice. Where a branch is taken,
name it `feature/<subject>` and record the upstream branch, the feature branch, and the base;
on the current branch, record that and the branch it is being built on. Place a worktree as a
sibling of the repository directory named
`<repository-name>-feature-<subject>`. Design the feature through the hinges. End it in a
state: **completed** on integration, **abandoned** if dropped, **superseded** if replaced
(cross-referencing both records), or **suspended** if paused. Verify before integrating and
add no gate at the merge; fix a post-merge failure from there. On the current branch there is
no merge, no branch to delete, and nothing to return to — completion is the intent being
built, and abandonment is a revert. Otherwise leave the user on the upstream branch in the
main working tree, confirm before deleting any branch — removing the worktree first, under one
confirmation — and record every confirmation in the feature record. Related: the features-convention (the record), the
experiment-lifecycle rule (the capability this mirrors, and where it
deliberately differs), the announce-waytide-at-session-start rule (which reports features
that have not concluded), the design-by-efferent hinge-cycle and loop-records rules (which
govern the feature's design), and the `git` run-suite-before-commit rule.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:33:40 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:12:37 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:18:09 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:31:18 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:34:01 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:03:25 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:12:40 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
