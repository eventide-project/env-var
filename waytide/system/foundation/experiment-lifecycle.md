# An experiment runs on its own branch and ends affirmed, refuted, inconclusive, abandoned, or superseded

An experiment is a bounded unit of work with a lifecycle. It runs on a branch created for it. It is governed by the design method, and it reaches one of a fixed set of declared states. The experiment record tracks that lifecycle. The states name a verdict on the experiment's **question**, not a judgment of the work.

- **Always on a branch.** Every experiment is done on a branch created for the experiment — never directly on the branch it will merge into.
- **Name the branch `experiment/<subject>`.** The `experiment/` prefix marks it as an experiment (so it is never mistaken for main-sequence topic work — see main-sequence drift below). `<subject>` is a short dash-separated, lower-case name of *what is under test*, named literally. Add a `-run-<n>` suffix **only when the experiment actually has multiple runs** (`experiment/<subject>-run-1`). The default single-branch experiment carries no run suffix. The upstream branch is **not** encoded in the name — a branch can outlive a change of upstream target — it lives in the record.
- **Record the base — no tag.** The baseline the experiment branched from is captured **in the record** (the base commit SHA and the ref it came from), never pinned with a tag. A later run branches straight from the recorded commit (`git switch -c experiment/<subject>-run-<n> <base-sha>`). Tags are avoided deliberately — experiment tags would accumulate as clutter in `git tag` and on any remote, and the record already names the base, so a tag adds nothing.
- **Track the upstream branch.** The branch merges back into its **upstream branch**, which is **not always `master`** — it may be another topic branch. The experiment record names the upstream branch (whether `master` or not), along with the experiment branch and its base, so the merge target is never ambiguous.
- **The working location is chosen at the start — branch only, or branch and worktree.** Every experiment branches. The decision is only how many working directories the branch is worked in. **Each option states what it creates.** The two create the branch — it does not exist yet at the start — and the second creates a working directory as well. The labels say so outright rather than leaving it to be inferred:

> **Branch only** — Create the branch `experiment/<subject>` and switch this working tree to it. At the conclusion this working tree switches back.
>
> **Branch and worktree** — Create the branch `experiment/<subject>` and check it out in a new worktree: a second working directory at `<path>`. This working tree stays on `<upstream branch>`.

**Branch only says nothing about the working tree.** What distinguishes the two options is whether a working directory is added. The branch-only option is presented as the branch it creates and the return at the conclusion. It is not presented as a movement of the working tree, which is immaterial to it. The worktree option is where a working directory is worth naming, because it is what that option adds.

The commands are `git switch -c experiment/<subject>` and `git worktree add -b experiment/<subject> <path>`. The `-b` is not optional. `git worktree add <path> <branch>` fails on a branch that does not exist. It is the right form only when a worktree is added to an experiment **already under way**, where the branch is there to check out. The decision is put to the user at **every** start, through the **AskUserQuestion** selection UI. There is no standing default and no project-level default, because the trade-off is situational. An experiment that resolves in a sitting favors branch only, and one that has to coexist with main-sequence work favors a worktree. The selection, and for a worktree its **path**, go in the record beside the upstream branch, the experiment branch, and the base. The conclusion executes the mechanics that match it. **The worktree is a sibling of the repository directory, named for the repository and the branch.** It is `<repository-name>-experiment-<subject>`: the branch name with its slash written as a dash, prefixed by the repository. For a repository at `…/projects/eventide/constant` and the branch `experiment/upload-retries`, that is `…/projects/eventide/constant-experiment-upload-retries`. A run suffix carries through, giving `…/constant-experiment-<subject>-run-2`. **The kind comes before the subject**, so every experiment sorts together under `<repository>-experiment-` rather than interleaving with the features by subject. The shared repository-name prefix and the sibling placement put the worktree in the same lexical vicinity as its repository, when the parent directory is listed. So the two are seen together rather than found apart. That matters most for the experiment nobody has opened in a fortnight. Sibling placement also keeps the path **outside the repository working tree**, where it must be. A worktree created inside it appears as untracked content in the experiment's own `git status`. That corrupts the signal the experiment is read for.
- **The working location changes on two triggers.** Adding a worktree for an experiment already under way is the only change the working location undergoes after the start. Two circumstances call for it. **One is external to the experiment.** Main-sequence work arrives, and the user intends to keep working the experiment alongside it. That is the recourse described under main-sequence drift below. **One is internal to it — the experiment is *escalated*.** It turns out to need more isolation than the single working tree gives it. Begun ad hoc, it proved larger or longer-running than it was taken for. The main working tree should be clear of it for the remainder. This trigger needs no interruption to prompt it. The judgment arrives on its own. **Escalated** names the judgment that the experiment warrants the heavier apparatus. A support ticket is escalated to a more involved tier the same way, without the problem itself having worsened. It says nothing about the experiment's standing or importance, and **it does not describe the first trigger**. An interruption escalates nothing, since what changed is the surroundings rather than the experiment. Either way the addition is confirmed and recorded like any other lifecycle decision. The record **gains a line** rather than having its original rewritten, and the conclusion dispatches on the **current** location. The reverse, collapsing a worktree back into the single working tree, has no motivation and is not done.
- **DBE governs the inside, attended or unattended.** The design-by-efferent process is followed for every experiment. What is chosen at the start is **the human's level of participation**. Under **attended** the loop stops at every hinge for the engineer. Under **unattended** the agent decides each hinge and generates through. Attended is the default, and the decision is put through the selection UI beside the working location. **DBE is in effect either way**: the cradle, the efferent-first actuation, and the solubility standard all still hold, and only the stopping does not. The selection is recorded as a confirmation, and declared at the top of the loop record. See the design-by-efferent attended-or-unattended-is-chosen-at-the-start rule.
- **The states.** An experiment **ends** in one of five states, or it is **suspended**, which is paused rather than
  ended. The five:

  - **affirmed** — the question held
  - **refuted** — the question was disproven
  - **inconclusive** — it ran but gave no clear verdict either way
  - **abandoned** — dropped before a verdict
  - **superseded** — replaced by another experiment Every experiment reaches one of these. It is never left silently open.
- **Affirmed is user-declared.** An experiment is **affirmed only when the user explicitly confirms it**. On affirmation, the **experiment's log is copied into the project decision log** (`waytide/local/log/`), so the durable project record carries what the experiment established. When the experiment produced **implementation**, the experiment branch is also **merged into the upstream branch**. The merge waits for the experiment's tests to pass. Where **no tests cover the implementation done in the experiment**, it also waits on specific user confirmation to merge untested code. An **observation-only** experiment (one that produced findings but no code — e.g. an experiment about the *way of working*) has nothing to merge. Affirmation is the log copy alone.
- **The agent never raises the end of an experiment.** Do not offer to conclude, affirm, refute, or merge one. Do not name any of those as a next step, an option among others, or a precondition for something else. The precondition form is the one that slips through, and *"this cannot be published until it merges"* is an example. Report what is settled and what is open, and stop there. The one lifecycle change the agent raises on its own is the drift recourse below, which offers suspension rather than an ending.
- **Refuted, inconclusive, abandoned, and superseded keep the record.** In any of these the branch is **not merged**. The experiment record is **maintained, marked with the state**, so the attempt and its findings survive as evidence. They differ by *why* there is no affirmation — the question was disproven (refuted), it stayed unresolved (inconclusive), it was dropped before resolving (abandoned), or another experiment replaced it (superseded).
- **Suspension keeps the branch.** A suspended experiment's **branch is not removed**, and its record is **characterized as suspended** (see the experiments-convention). It resumes from the same branch. With **branch only** the working tree switches back to the upstream branch and the branch sits dormant until the experiment resumes. Under a **worktree** the worktree is kept too — left in place and checked out — so the experiment resumes exactly where it stands.
- **Supersession runs through suspension.** An experiment may be **superseded** by another experiment that replaces it. When one supersedes another, **the two records name the counterpart** — the superseded record notes what superseded it, the superseding record notes what it supersedes. A superseded experiment is **not concluded automatically**: it **remains suspended** until the **user explicitly concludes it** as superseded, and its branch is kept until then, then handled like any concluded experiment's.
- **A child experiment supersedes its parent by preserving it.** An experiment created from another
  experiment's branch already holds its parent's history. When the derivative goes further than the
  primitive, the child supersedes the parent, and the steps differ from supersession between two
  siblings. **The parent's divergent content is preserved on the child's branch first.** The child
  merges the parent, which brings over every commit the parent made after the child was created
  from it. That merge is what makes the next step safe: the parent's commits stay reachable from
  the child, so deleting the parent branch loses nothing. Then the parent record is parked with
  `**State:** Superseded`, the two records name the counterpart, the child's **upstream branch**
  becomes what the parent's was, and the parent branch is deleted on the user's confirmation.
  **This is the one supersession that merges the superseded branch.** The bullet above says a
  superseded branch is not merged, and that holds for two experiments that are siblings, where the
  superseded work is separate work. A child already contains its parent, so refusing the merge
  would discard the parent's last commits rather than preserve them. Recorded 2026-08-08, when the
  STE experiment — then named STE Spec — superseded the Simplified Technical English experiment it
  was created from.
- **Conclude in the main working tree, on the upstream branch.** However an experiment concludes — affirmed, refuted, inconclusive, abandoned, superseded, or suspended — the user should end up **on the upstream branch**, not stranded on the experiment branch. With **branch only** that means switching the working tree back. Under a **worktree** the main working tree never left the upstream branch, so what the instruction requires there is that the session ends **in the main working tree** — never in a directory that has been removed.
- **Branch deletion is user-confirmed, and the worktree is removed first.** Deleting the experiment branch — **local or remote** — requires **explicit user confirmation**, and that confirmation is put through the **AskUserQuestion** selection UI, not asked as free-text prose. Where the experiment was worked in a **worktree**, removing the worktree **precedes** deleting the branch. Git refuses to delete a branch that is checked out in a worktree — and **one confirmation covers the two**: they are a single cleanup act with a forced order, so splitting them would prompt twice for one decision. Suspension never deletes and never removes a worktree. A concluded experiment's branch and worktree are removed only on confirmation.
- **Record every confirmation.** Any user confirmation the lifecycle requires. These are **recorded in the experiment's record**, so the run's authority is auditable:

    - the working-location selection at the start
  - the attended-or-unattended selection at the start
  - the affirmation declaration
  - concluding a superseded experiment
  - merging untested code
  - suspending the experiment
  - adding a worktree to an experiment under way
  - deleting the branch and removing its worktree
- **Watch for main-sequence drift, and offer the two recourses.** While an experiment is still active, the agent watches for the user proceeding with **main-sequence work**. It surfaces that rather than letting the branches silently diverge. **What that watch rests on, stated plainly:** the branch name. An experiment worked in the one working tree puts HEAD on `experiment/<subject>`, which the status line carries every turn. The second is a judgment of whether the work at hand answers the experiment's recorded **Question**. Only the first is mechanical, and a missed detection produces nothing at all: no alarm, no artifact, just the divergence the clause exists to prevent. The watch is a practice, not a guarantee, and the rule should not be read as promising more. Under a **worktree** the two lines are physically separated, so there is nothing to **diverge**. There is nothing to **notice** either. The main working tree stays on the upstream branch, and the experiment leaves no trace in it. So the configuration that isolates an experiment best is the one that most easily loses track of it. That is what the **session-start notice** answers, reporting every experiment that has not concluded (see the announce-waytide-at-session-start rule). With **branch only** there are **two recourses, distinguished by the user's intent**. **Suspend the experiment**, when the intent is to stop working it for now. Or **add a worktree for the experiment already under way**, when the intent is to keep working it alongside the main-sequence work. The two begin identically: the main working tree returns to the upstream branch. They differ by one command, and by whether the experiment stays workable or goes dormant. Neither is the default: surface the two through the selection UI and let the user's intent decide. **This is the one lifecycle change the agent raises unbidden, and neither recourse ends the experiment.**

**Why:** an experiment is a controlled deviation from the main line, so it must be three things. It must be **isolated**, on its own branch. It must be **reversible** — the branch survives suspension and is deleted only on confirmation. And it must be **honest about what it proved** before it rejoins. That is the test gate, and explicit confirmation when there is nothing to prove it.

A deviation should not become permanent by drift. It ends with a verdict on its question. An **affirmed** experiment promotes its findings into the durable project log. A **refuted**, **inconclusive**, **abandoned**, or **superseded** one keeps them as evidence.

Naming the states for the verdict on the question, rather than for "success/failure" of the work, keeps the record honest. An experiment that disproves its hypothesis did its job. Returning the user to the upstream branch on every conclusion, and recording each confirmation, keeps the branch topology and the run's authority unambiguous.

**Why the agent does not raise the ending:** an experiment's length is the engineer's judgment. It
is not readable from how much work the branch holds. An agent that has just finished a stretch of
work sees a natural stopping point, and the engineer sees a question still open. The prompt
arrives at the moment the agent's view of the work is narrowest.

Making affirmation engineer-declared does not cover this on its own. A prompt presses toward the
declaration without making it, and the engineer is then answering the agent rather than the
question. Barring the prompt is what leaves the judgment where it belongs.

**Why the working location is selected rather than fixed:** where an experiment is physically worked is a different question from how it is versioned. Branch only and branch-and-worktree both branch, record a base, and pass the same merge gate. Its answer is situational rather than general. So the rule puts the decision at the start instead of settling it once for every experiment. Recording the selection is what lets the conclusion execute the matching mechanics without asking again.

Keeping **suspension** and **adding a worktree mid-flight** as two recourses, rather than naming one of them the universal answer, preserves the distinction they actually mark. The distinction is whether the user intends to **stop** working the experiment for now, or to **keep** working it alongside the main-sequence work. They cost nearly the same. The two return the main working tree to the upstream branch, and the worktree is one further command. So the decision between them is about intent rather than effort.

Collapsing them would mislabel one of those intents. An experiment recorded as suspended while it is really still being worked is precisely the dishonesty the declared states exist to prevent. So is one left nominally active while it is really dormant.

**How to apply:** branch for every experiment as `experiment/<subject>`. Add `-run-<n>` only when running multiple runs. Record the upstream branch, the experiment branch, and the base.

At the start, ask the **working location** through the selection UI, every time. It is branch only, or branch and worktree. Record the selection with the branch topology. Place a worktree as a sibling of the repository directory, named `<repository-name>-experiment-<subject>`, and record its path.

Follow DBE for every experiment, putting the attended-or-unattended decision to the user at the start beside the working location. End every experiment in a state. On a user-confirmed **affirmed**, copy the experiment log into `waytide/local/log/`. Where the experiment produced implementation, merge to upstream. Tests must pass, and specific confirmation is needed to merge untested implementation. An observation-only experiment is just the log copy.

On **refuted**, **inconclusive**, or **abandoned**, keep the record marked with the state and do not merge. On **supersession**, cross-reference the two experiments' records. Keep the superseded one **suspended** until the user explicitly concludes it as superseded. On **suspension**, keep the branch and mark the record suspended.

Raise no ending. Where a report would name a merge or a conclusion as what something waits on,
leave it out and report the rest.

Leave the user on the upstream branch every time. Where the experiment was worked in a worktree, leave them in the main working tree. And confirm before deleting any branch, local or remote, removing the worktree first under one confirmation covering the two. Record each confirmation in the experiment record.

When main-sequence work starts during a **branch-only** experiment, surface the two recourses through the selection UI. They are to suspend the experiment, or to add a worktree for it. Let the user's intent decide.

**Escalate** a branch-only experiment to a worktree on the second trigger. That is when it is judged to need more isolation than the one working tree gives it. No interruption is involved. Either way, record the added worktree and its path as a new line in the record. Do not rewrite the original.

Related:

- the experiments-convention
- the decision-log rule — the project log an affirmed experiment copies into
- the design-by-efferent rules
- the `git` run-suite-before-commit rule

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 7:41:05 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 10:12:41 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:17:08 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:18:56 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:47:02 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:12:37 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:18:09 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:23:59 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:31:18 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:34:01 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:03:25 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:42:59 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:11:20 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:18:41 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:41:07 PM PT
