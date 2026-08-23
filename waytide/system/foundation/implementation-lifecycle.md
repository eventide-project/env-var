# An implementation runs on a branch, from a working location chosen at the start, to a declared end

An implementation is bounded work with a lifecycle. It runs on a branch created for it, it is
designed through the five hinges, and it reaches one of a fixed set of declared states. It is
never left silently open.

**Its tag decides the parts that differ.** An `[experiment]` is built to a **question** and a
`[feature]` to an **intent** (see the implementations-convention). Every clause below that names
one kind names it because of that difference, and no other clause varies.

## The branch

- **Name it `experiment/<subject>` or `feature/<subject>`**, matching the tag. `<subject>` is a
  short dash-separated, lower-case name of what is under test or what is being built, named
  literally. Add a `-run-<n>` suffix only where an experiment actually has multiple runs.
- **Where the work has a worktree, the name carries `worktree/`** — `feature/worktree/<subject>`
  and `experiment/worktree/<subject>`. A branch checked out in a worktree cannot be checked out
  again in the main working tree, and nothing in `git branch` says which those are. The segment
  says it in the one listing where the question comes up.
- **Adding a worktree to work already under way renames the branch**, and that act is already a
  confirmed one the record carries. A name that says where the work is has to keep saying it, or
  it is worse than a name that never claimed to.
- **The upstream branch is not encoded in the name.** A branch can outlive a change of upstream
  target, so the record names it.
- **Record the base — no tag.** The baseline is captured in the record as the base commit SHA and
  the ref it came from. A later run branches straight from the recorded commit. Tags would
  accumulate as clutter in `git tag` and on any remote, and the record already names the base.

**The worktree segment is an exception to the upstream clause, and it is one deliberately.** The
upstream target is kept out of the name because a name that goes stale misleads, and a worktree can
be added or removed the same way. What separates them is where each fact is asked about. An
upstream target is asked about when the work is merged, and the record is open at that moment. The
existence of a worktree is asked about in `git branch`, where the record is not. So the one that
has no other answer at the point of asking is the one the name carries — and the rename is what
keeps it from becoming the stale name the other clause refuses.

## The working location, chosen at the start

**Put it through the selection interface at every start, with no standing default.** The trade is
situational: work that resolves in a sitting favours branch only, and work that has to coexist
with other work favours a worktree.

**Each option states what it creates:**

> **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
> working tree switches back.
>
> **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.
>
> **The current branch** — Build it where the working tree already is, creating nothing. There is
> no branch to switch back to and nothing to merge.

**The current branch is a `[feature]`'s alone, and it is offered last.** An experiment is a
controlled deviation from the main line: it may be refuted or abandoned, and until it is affirmed
its changes must not reach the branch it deviates from. The branch is what makes that reversible,
so it is not optional there. A feature **is** the main line, and a branch prevents nothing already
ordinary.

**Last, because a first option reads as recommended** whatever a rule says about defaults, and the
current branch is the option that gives up isolation.

**What the current branch costs, stated plainly.** There is no isolation: partial work sits on the
branch others read, and abandoning means reverting rather than deleting a branch. The record still
carries the intent, the state, and the confirmations, so only the containment differs.

**A worktree is a sibling of the repository directory**, named `<repository-name>-<branch with its
slash written as a dash>` — `constant-feature-upload-retries`,
`waytide-experiment-state-suffix-legibility`. The kind comes before the subject, so every
experiment sorts together and every feature does. Sibling placement keeps the path outside the
repository working tree, where a worktree created inside would appear as untracked content in the
work's own `git status`.

**The commands are `git switch -c <branch>` and `git worktree add -b <branch> <path>`.** The `-b`
is not optional — `git worktree add <path> <branch>` fails on a branch that does not exist, and is
the right form only when a worktree is added to work already under way.

**The working location changes on two triggers, and only by adding a worktree.** One is external:
other work arrives that the engineer intends to work alongside this. One is internal — the work is
**escalated**, judged to need more isolation than the single working tree gives it, having proved
larger than it was taken for. Either way the addition is confirmed and recorded, the record
**gains a line** rather than having its original rewritten, and the conclusion dispatches on the
current location. Collapsing a worktree back has no motivation and is not done.

## The human's level of participation, chosen at the start

**Attended or unattended, put through the selection interface beside the working location.** Both
are decisions about how the work will be conducted, each made once and held for its duration, so
they sit at one gate. Attended is the default. DBE is in effect either way — only the stopping
changes. See the design-by-efferent attended-or-unattended-is-chosen-at-the-start rule.

## The end

**Every implementation ends in a declared state**, or is suspended, which is paused rather than
ended. The words are the implementations-convention's.

**An `[experiment]` is affirmed only on the engineer's explicit declaration.** On affirmation its
log is **copied into the project decision log**, so the durable record carries what it established.
Where it produced implementation, the branch also merges to the upstream branch — waiting on the
tests, and on specific confirmation where no test covers what was built. An observation-only
experiment has nothing to merge, and affirmation is the log copy alone.

**A `[feature]` is verified before integrating, and nothing gates the merge.**
`run-suite-before-commit` already achieves it, every commit on the branch having been verified. The
merged result is a combination neither branch ran, so a feature whose commits all passed can still
break the suite on integration. That is ordinary and is fixed from there. There is no affirmation
step, because a feature has no finding to promote.

**Refuted, inconclusive, abandoned, and superseded keep the record and do not merge.** The record is
maintained and marked, so the attempt and its findings survive as evidence.

**Supersession runs through suspension.** A superseded implementation stays **Suspended** until the
engineer explicitly concludes it as superseded, and its branch is kept until then. The two records
name the counterpart.

**A child supersedes its parent by preserving it.** Work created from another's branch already
holds that history. The child merges the parent first, which brings over every commit the parent
made after the child was created from it and makes deleting the parent branch lossless. Then the
parent is parked `Superseded`, the records name each other, the child's upstream becomes what the
parent's was, and the parent branch is deleted on confirmation. **This is the one supersession that
merges the superseded branch**, because a child already contains its parent and refusing the merge
would discard the parent's last commits rather than preserve them.

**Conclude in the main working tree, on the upstream branch.** With branch only, the working tree
switches back. Under a worktree the main working tree never left it, so the session must end there
rather than in a directory that has been removed. On the current branch there is nowhere to return
from.

**Branch deletion is engineer-confirmed, put through the selection interface, and the worktree is
removed first.** Git refuses to delete a branch checked out in a worktree, and **one confirmation
covers the two** — a single cleanup act with a forced order, which splitting would prompt twice
for. Suspension never deletes and never removes a worktree.

## The agent never raises the end of an `[experiment]`

**Do not offer to conclude, affirm, refute, or merge one.** Not as a next step, not as an option
among others, and not as a precondition for something else. The precondition form is the one that
slips through: *this cannot be published until it merges* states a true fact and points at the
ending. Report what is settled and what is open, and stop there.

**An experiment's length is the engineer's judgment** and is not readable from how much work the
branch holds. An agent that has just finished a stretch of work sees a natural stopping point where
the engineer sees a question still open. The prompt would arrive at the moment the agent's view is
narrowest.

**This does not reach a `[feature]`**, which has no verdict to press toward and whose completion is
the ordinary conclusion of main-line work.

## Drift, and the one lifecycle change the agent does raise

**While an `[experiment]` is open under branch only, watch for main-sequence work starting**, and
surface it rather than letting the branches silently diverge. Offer two recourses through the
selection interface — **suspend the experiment**, where the intent is to stop working it for now,
or **add a worktree**, where the intent is to keep working it alongside. Neither ends the
experiment, and the engineer's intent decides.

**What the watch rests on, stated plainly:** the branch name, which the status line carries every
turn, and a judgment of whether the work at hand answers the recorded question. Only the first is
mechanical, and a missed detection produces nothing at all — no alarm, no artifact, just the
divergence. It is a practice, not a guarantee.

**Under a worktree there is nothing to diverge and nothing to notice.** The main working tree stays
on the upstream branch and the experiment leaves no trace in it, so the configuration that isolates
best is the one that most easily loses track. That is what the **session-start notice** answers,
reporting every implementation that has not concluded.

**There is no counterpart for a `[feature]`.** Other work during a feature is normally another
feature, and starting one is ordinary rather than a problem, so there is nothing to detect. A
feature being forgotten is covered by the same notice.

**Why:** an experiment and a feature ran on two lifecycles that agreed on the branch, the working
location, the participation decision, the declared end, the confirmations, the conclusion in the
main working tree, and the confirmed branch deletion. They differed on the forecast, the verdict,
the merge gate, the affirmation, the current-branch option, and the drift watch — and every one of
those differences follows from a question against an intent.

Stating the shared lifecycle once
and conditioning six clauses on a tag is smaller than stating it twice, and it makes the asymmetry
legible instead of leaving a reader to diff two rules to find it.

**How to apply:** branch for every implementation, named for its tag. Record the upstream branch,
the branch, and the base. Ask the working location and the participation level at the start, through
the selection interface, and record both. Offer the current branch only for a feature, and offer it
last.

Follow DBE inside. End in a declared state. Copy an affirmed experiment's log into the
decision log and merge where it produced implementation. Verify a feature before integrating and
add no gate at the merge.

Raise no ending for an experiment. Leave the engineer on the upstream
branch in the main working tree. Confirm before deleting any branch, removing the worktree first
under one confirmation.

Related:

- the implementations-convention — the record, the tags, and the state words
- the design-by-efferent attended-or-unattended-is-chosen-at-the-start and hinge-cycle rules
- the announce-waytide-at-session-start rule — the notice reporting what has not concluded
- the `git` run-suite-before-commit and announce-a-branch-switch-in-a-bordered-block rules

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:34:20 AM PT
