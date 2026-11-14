# An implementation runs on a branch to a declared end

**Trigger:** When starting, adding a worktree to, suspending, or concluding an experiment or feature implementation

- **Solubility:** 21
- **Original rank:** 6 of 106
- **Unclarity:** 0.58

An implementation is bounded work with a lifecycle. It runs on a branch created for it, it is designed through the five hinges, and it reaches one of a fixed set of declared states. It is never left silently open.

**Whether the work states a forecast decides the parts that differ while it runs, and whether it reaches a verdict is asked at its end. The tag decides neither.** Either kind opens with a question or an intent. A forecast is stated at the start only where the engineer gives one. Only work with a forecast is asked the verdict question, and the engineer can conclude any work with a verdict word (see the the-implementations-directory-holds-one-record-per-implementation rule). Every clause below that names work with a forecast, or work with or without a verdict, names it because of those two. No clause varies by kind. The tag names the branch and the record, and nothing else.

**As the engineer stated it:** change features and experiments so that both can have either an intent or a question.

## The branch

**`new` writes the record `Open`, then creates the branch.** `start` makes the record `Active` when the work starts.

**The first record is committed on the upstream branch before the implementation branch is created.** `new` writes the record `Open`, with its log entry, and commits both on the upstream branch, `master` in the ordinary case. Then it creates the implementation branch from that commit. The implementation branch's copy of the record takes every update made during the work. Its first update records the base, the commit holding the first record, which that record cannot name itself. The upstream branch's copy stays as first written until the work merges, so the upstream branch shows the implementation as current while it runs. Where the working location is the current branch, the record is written there, and there is no second copy.

**As the engineer stated it:** When an implementation starts, an initial implementation record should be recorded on master. Then the branch is made, and the branch's version takes updates added during the course of the implementation, but the initial record remains on master

- **Name it `experiment/<subject>` or `feature/<subject>`**, matching the tag. `<subject>` is a short dash-separated, lower-case name of what is under test or what is being built, named literally. Add a `-run-<n>` suffix only where the work actually has multiple runs.
- **Where the work has a worktree, the name carries `worktree/`** — `feature/worktree/<subject>` and `experiment/worktree/<subject>`. A branch checked out in a worktree cannot be checked out again in the main working tree, and nothing in `git branch` says which those are. The segment says it in the one listing where the question comes up.
- **Adding a worktree to work already under way renames the branch**, and that act is already a confirmed one the record carries. A name that says where the work is has to keep saying it, or it is worse than a name that never claimed to.
- **The upstream branch is not encoded in the name.** A branch can outlive a change of upstream target, so the record names it.
- **Record the base — no tag.** The baseline is captured in the record as the base commit SHA and the ref it came from. A later run branches straight from the recorded commit. Tags would accumulate as clutter in `git tag` and on any remote, and the record already names the base.

**The worktree segment is an exception to the upstream clause, and it is one deliberately.** The upstream target is kept out of the name because a name that goes stale misleads, and a worktree can be added or removed the same way. What separates them is where each fact is asked about. An upstream target is asked about when the work is merged, and the record is open at that moment. The existence of a worktree is asked about in `git branch`, where the record is not. So the one that has no other answer at the point of asking is the one the name carries — and the rename is what keeps it from becoming the stale name the other clause refuses.

## An implementation in phases

**An experiment or a feature may run in phases.** Each phase is a question or an intent of its own that serves the implementation's. The record names the phases and their order at the start, and, as each phase starts, the commit it branched from. **Whether a phase states a forecast is asked when it is added**, whatever its implementation chose, with the options the implementation's forecast question has: *No forecast*, then *State a forecast*. A phase with a forecast states it before its work, and a phase without one states none. **A phase with a forecast is asked the verdict question when its work is complete**, with the implementation's three options. A phase without one concludes Completed, unasked. **As the engineer stated it:** chosen per phase.

**As the engineer stated it:** features should have phases as well.

- **A phase's branch is the implementation's branch name, a dot, and the phase's name** — `experiment/rule-reduction.flattening`, `feature/worktree/skills.slash-commands`. A slash cannot join them: git refuses a branch named beneath another branch's name, so `experiment/rule-reduction/flattening` cannot exist beside `experiment/rule-reduction`. The `worktree/` segment, where the implementation has one, carries into each phase's name.
- **A phase branches from the implementation's branch and concludes into it.** Where the phase is concluded with a verdict, it is affirmed, refuted, or inconclusive on the engineer's declaration, and an affirmed phase merges back into the implementation's branch. The record carries each phase's verdict and findings. Where the phase is concluded without a verdict, or has no forecast, it concludes **Completed** and merges back into the implementation's branch, with no verdict.
- **A phase's commits are squashed when the implementation concludes, not when the phase does.** While the work runs, a phase merges with its history, with `git merge --no-ff`, so the merge commit marks where it ends and its separate commits can be read on the implementation's branch. When the implementation concludes, and before it merges to its upstream branch, its branch is rebuilt so that each merged phase is one squashed commit, in the phases' order. Each phase's `--no-ff` merge commit is dropped, since its squashed commit takes its place. The rebuild reads each phase's commits from the commit the record names as its start to the phase's branch. A commit made on the implementation's branch outside any phase keeps its content and its message, in its place. Its SHA changes, since its parent does. Where the branch was pushed, the rebuilt branch is force-pushed with `--force-with-lease` against the pushed tip, which waits for the engineer's selection as every push does.
- **The squashed commit's subject summarizes what the phase built**, under the commit-message rules. Its body lists the phase's own commit subjects, oldest first, each on its own line after a dash, as `- Receipt tax rate`, so their history survives in the message. A refuted or inconclusive phase does not merge, so nothing of it is squashed.
- **A phase's branch is kept until the implementation concludes**, since the rebuild reads each phase's commits from it. It is deleted with the implementation's branch, under the same one confirmation.
- **The implementation concludes after its phases**, and only then merges to its upstream branch. A phase's commits reach no other branch.
- **One phase runs at a time, in the order the record names**, each starting from the implementation's branch as the phases before it left it.

## The working location, chosen at the start

**Put it through the selection interface at every start, with no standing default.** The trade is situational: work that resolves in a sitting favours branch only, and work that has to coexist with other work favours a worktree.

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

**The current branch is offered last, and choosing it rules out a forecast and a verdict.** Work with a forecast is a controlled deviation from the main line: it may be refuted or abandoned, and until it is affirmed its changes must not reach the branch it deviates from. The branch is what makes that reversible, so work built on the current branch states no forecast, concludes Completed, and is not asked the verdict question at its end. Work without a forecast **is** the main line, and a branch prevents nothing already ordinary. This holds whatever the kind.

**Last, because a first option reads as recommended** whatever a rule says about defaults, and the current branch is the option that gives up isolation.

**What the current branch costs, stated plainly.** There is no isolation: partial work sits on the branch others read, and abandoning means reverting rather than deleting a branch. The record still carries the intent, the state, and the confirmations, so only the containment differs.

**A worktree is a sibling of the repository directory**, named `<repository-name>-<branch with its slash written as a dash>` — `constant-feature-upload-retries`, `slasher-experiment-state-suffix-legibility`. The kind comes before the subject, so every experiment sorts together and every feature does. Sibling placement keeps the path outside the repository working tree, where a worktree created inside would appear as untracked content in the work's own `git status`.

**The commands are `git switch -c <branch>` and `git worktree add -b <branch> <path>`.** The `-b` is not optional — `git worktree add <path> <branch>` fails on a branch that does not exist, and is the right form only when a worktree is added to work already under way.

**The working location changes on two triggers, and only by adding a worktree.** One is external: other work arrives that the engineer intends to work alongside this. One is internal — the work is **escalated**, judged to need more isolation than the single working tree gives it, having proved larger than it was taken for. Either way the addition is confirmed and recorded, the record **gains a line** rather than having its original rewritten, and the conclusion dispatches on the current location. Collapsing a worktree back has no motivation and is not done.

## The human's level of participation, chosen at the start

**Attended or unattended, put through the selection interface beside the working location.** Attended is the default. See the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule, which states why the two sit at one gate and what changes between them.

## The forecast at the start, and the verdict at the end

**At the start, ask whether the work states a forecast, beside the working location and the participation, and record the answer as a confirmation.** A forecast is what is expected to happen, stated before the work. Its two options read *No forecast*, then *State a forecast*, in that order. Where the engineer states one, write it in the record. Where the working location is the current branch, do not ask: work there states none. Whether the work states a forecast follows neither the kind nor whether it opens with a question or an intent.

**At the end, ask the verdict question of work with a forecast, and of no other work.** It is asked when the work is complete, through the selection interface, and recorded as a confirmation. **Its two options read, in these words and in this order:** *Conclude without an engineer's verdict*, then *Conclude with an engineer's verdict*. A verdict is the engineer's declaration, so the options name whose it is. Work concluded without a verdict ends Completed. Work concluded with one ends Affirmed, Refuted, or Inconclusive, on the engineer's declaration. Work without a forecast is not asked. `complete` concludes it Completed, and the engineer can conclude it Affirmed, Refuted, or Inconclusive instead.

**A third option reads *What's a verdict?*** Selecting it explains, in a sentence or two, that a verdict is the engineer's declaration that the work is Affirmed, Refuted, or Inconclusive, against the forecast stated before the work, and that work without a verdict ends Completed. The question is then asked again, with the same three options.

**The verdict waits for the end because what the work shows is known only then.** A forecast keeps the verdict possible without deciding it.

**As the engineer stated it:** an intent can also bring a forecast and verdict.

## The end

**Every implementation ends in a declared state**, or is suspended, which is paused rather than ended. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.

**Work that reaches a verdict is affirmed only on the engineer's explicit declaration.** On affirmation its log is **copied into the project log**, so the durable record carries what it established. Where it produced implementation, the branch also merges to the upstream branch — waiting on the tests, and on specific confirmation where no test covers what was built. Observation-only work has nothing to merge, and affirmation is the log copy alone.

**Work that reaches a verdict and will merge brings what master needs to conform to it.** Before it merges, its branch holds every rule its practice needs, and every other change master needs to conform to what it developed. A practice it introduced reaches master already governed, not as work left over for after the merge.

**Work without a verdict is verified before integrating, and nothing gates the merge.** `run-the-test-suite-after-changes-before-considering-whether-to-commit` already achieves it, every commit on the branch having been verified. The merged result is a combination neither branch ran, so work whose commits all passed can still break the suite on integration. That is ordinary and is fixed from there. There is no affirmation step, because there is no finding to promote.

**Refuted, inconclusive, abandoned, and superseded keep the record and do not merge.** The record is maintained and marked, so the attempt and its findings survive as evidence.

**An implementation can be superseded at any time, without first being suspended.** Its branch is kept until the engineer confirms its deletion. The two records name the counterpart.

**A child supersedes its parent by preserving it.** Work created from another's branch already holds that history. The child merges the parent first, which brings over every commit the parent made after the child was created from it and makes deleting the parent branch lossless. Then the parent is parked `Superseded`, the records name each other, the child's upstream becomes what the parent's was, and the parent branch is deleted on confirmation. **This is the one supersession that merges the superseded branch**, because a child already contains its parent and refusing the merge would discard the parent's last commits rather than preserve them.

**Conclude in the main working tree, on the upstream branch.** With branch only, the working tree switches back. Under a worktree the main working tree never left it, so the session must end there rather than in a directory that has been removed. On the current branch there is nowhere to return from.

**Branch deletion is engineer-confirmed, put through the selection interface, and the worktree is removed first.** Git refuses to delete a branch checked out in a worktree, and **one confirmation covers the two**, and the phase branches the implementation kept — a single cleanup act with a forced order, which splitting would prompt twice for. A squashed phase's branch is deleted with `git branch -D`, since its own commits never reached the upstream branch and git refuses `-d`. Where the implementation's branch was pushed, the deletion covers its branch on the remote too, and that branch is deleted only after the upstream branch holding the work has been pushed. Deleting it sooner leaves the remote holding the work on no branch. Suspension never deletes and never removes a worktree.

## The agent never raises the end of work with a forecast

**Do not offer to conclude, affirm, refute, or merge it.** Not as a next step, not as an option among others, and not as a precondition for something else. The precondition form is the one that slips through: *this cannot be published until it merges* states a true fact and points at the ending. Report what is settled and what is open, and stop there.

**The length of work with a forecast is the engineer's judgment** and is not readable from how much work the branch holds. An agent that has just finished a stretch of work sees a natural stopping point where the engineer sees a question still open. The prompt would arrive at the moment the agent's view is narrowest.

**This does not reach work without a forecast**, which has no verdict to press toward and whose completion is the ordinary conclusion of main-line work.

## Drift, and the one lifecycle change the agent does raise

**While work with a forecast is open under branch only, watch for main-sequence work starting**, and surface it rather than letting the branches silently diverge. Offer two recourses through the selection interface — **suspend the implementation**, where the intent is to stop working it for now, or **add a worktree**, where the intent is to keep working it alongside. Neither ends the implementation, and the engineer's intent decides.

**What the watch rests on, stated plainly:** the branch name, which the status line carries every turn, and a judgment of whether the work at hand serves the recorded question or intent. Only the first is mechanical, and a missed detection produces nothing at all — no alarm, no artifact, just the divergence. It is a practice, not a guarantee.

**Under a worktree there is nothing to diverge and nothing to notice.** The main working tree stays on the upstream branch and the implementation leaves no trace in it, so the configuration that isolates best is the one that most easily loses track. That is what the **session-start notice** answers, reporting every implementation that has not concluded.

**There is no counterpart for work without a forecast.** Other work during it is ordinary rather than a problem, so there is nothing to detect. Work being forgotten is covered by the same notice.

**Why:** an experiment and a feature share one lifecycle: the branch, the working location, the participation decision, the declared end, the confirmations, the conclusion in the main working tree, and the confirmed branch deletion. What differs is the forecast, the verdict, the merge gate, the affirmation, the current-branch option, and the drift watch — and every one of those follows from whether the work is judged against a forecast. Whether it states one is decided at the start, and whether it is judged is decided at the end.

Stating the shared lifecycle once and conditioning six clauses on the verdict choice is smaller than stating it twice, and it makes the asymmetry legible instead of leaving a reader to diff two rules to find it.

**How to apply:** branch for every implementation, named for its tag. Record the upstream branch, the branch, and the base. Ask the working location, the participation level, and whether the work states a forecast at the start, through the selection interface, and record all three. Offer the current branch last, and ask no forecast there. Ask the verdict question at the end, of work with a forecast only. Before work that reaches a verdict merges, write on its branch the rules and changes master needs to conform to it.

Follow DBE inside. End in a declared state. Copy affirmed work's log into the project's log and merge where it produced implementation. Verify work without a verdict before integrating and add no gate at the merge.

Raise no ending for work with a forecast. Leave the engineer on the upstream branch in the main working tree. Confirm before deleting any branch, removing the worktree first under one confirmation.

## Compressed

1. An implementation runs on its own branch, designed through the five hinges by DBE, to a declared state.
2. It is never left silently open.
3. Whether the work states a forecast decides the parts that differ while it runs. Whether it reaches a verdict is asked at its end. The tag names the record and the branch, and decides nothing else.
4. Either kind opens with a question or an intent. A forecast is stated at the start only where the engineer gives one. Only work with a forecast is asked the verdict question, and the engineer can conclude any work with a verdict word (see the the-implementations-directory-holds-one-record-per-implementation rule).
5. A clause below names work with a forecast, or with or without a verdict, only because of that difference. Every other clause holds for all.

## The branch

1. `new` writes the record `Open`, then creates the branch. `start` makes it `Active`.
2. Name it `experiment/<subject>` or `feature/<subject>`, matching the tag.
3. The subject is short, lower-case, and dash-separated, and names literally what is tested or built.
4. Add `-run-<n>` only where the work has more than one run.
5. With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`.
6. A branch checked out in a worktree cannot be checked out in the main working tree, and `git branch` is where that question comes up.
7. Adding a worktree to work under way renames the branch.
8. The rename is confirmed, and the record carries it.
9. Keep the upstream branch out of the name, since a branch can outlive its upstream target. The record names it.
10. A worktree is the one fact the name carries, because `git branch` has no other answer for it.
11. The rename keeps that fact current.
12. Record the branch, its upstream, and its base. Record the base as its commit SHA and the ref it came from.
13. Make no git tag for the base.
14. A later run branches from the recorded commit.
15. Except on the current branch, `new` commits the first record, `Open`, and its log entry on the upstream branch, `master` in the ordinary case, then creates the implementation branch from that commit.
16. Make every later update to the record on the implementation branch. The first records the base, the commit that holds the first record, which that record cannot name. Leave the upstream branch's copy as first written until the work merges.
17. Where the working location is the current branch, write the record there. There is no second copy.

## Phases

1. An experiment or a feature may run in phases. Each phase is a question or an intent that serves the implementation's.
2. The record names the phases and their order at the start, and, as each phase starts, the commit it branched from.
3. When a phase is added, ask whether it states a forecast, whatever its implementation chose: *No forecast*, then *State a forecast*. A phase with a forecast states it before its work. When its work is complete, ask it the verdict question, with the implementation's three options. A phase without a forecast is not asked.
4. A phase's branch is the implementation's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`, `feature/worktree/skills.slash-commands`.
5. Git refuses a slash here, because no branch can sit beneath another branch's name.
6. A `worktree/` segment carries into each phase's name.
7. A phase branches from the implementation's branch and concludes into it.
8. Where the phase is concluded with a verdict, it is affirmed, refuted, or inconclusive only on the engineer's declaration.
9. An affirmed phase merges back into the implementation's branch.
10. The record carries each phase's verdict and findings.
11. Where the phase is concluded without a verdict, or has no forecast, it concludes Completed, with no verdict, and merges back into the implementation's branch.
12. One phase runs at a time, in the record's order, each from the implementation's branch as the earlier phases left it.
13. A phase's commits reach no other branch.
14. The implementation concludes after its phases, and only then merges to its upstream branch.
15. Merge a concluded phase with `git merge --no-ff`. Squash a phase's commits when the implementation concludes, not when the phase does. Read each phase's commits from the start the record names to the phase's branch. Drop each phase's `--no-ff` merge commit, since its squashed commit takes its place. Before the implementation merges to its upstream branch, rebuild its branch so each merged phase is one squashed commit, in the phases' order.
16. A commit made outside any phase keeps its content and its message, in its place. Its SHA changes. Where the branch was pushed, force-push the rebuilt branch with `--force-with-lease` against the pushed tip, on the engineer's selection.
17. The squashed commit's subject summarizes what the phase built, under the commit-message rules. Its body lists the phase's own commit subjects, oldest first, each on its own line after a dash.
18. A refuted or inconclusive phase does not merge, so nothing of it is squashed.
19. Keep a phase's branch until the implementation concludes. Delete it with the implementation's branch.

## The working location

1. Put the working location through the selection interface at every start, with no default.
2. Each option states what it creates:

> **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
> working tree switches back.
>
> **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.
>
> **The current branch** — Build it where the working tree already is, creating nothing. There is
> no branch to switch back to and nothing to merge.

3. Choosing the current branch rules out a forecast and a verdict. Work built there states no forecast, concludes Completed, and is not asked the verdict question.
4. The changes of work with a forecast must not reach the branch it deviates from before it is affirmed, and its own branch is what keeps them out.
5. Work without a forecast is the main line.
6. Offer the current branch last, because a first option reads as recommended, and the current branch gives up isolation.
7. The current branch's cost: there is no isolation, partial work sits where others read, and abandoning means reverting rather than deleting a branch.
8. On the current branch, the record still carries the intent, the state, and the confirmations.
9. Place a worktree beside the repository directory, named `<repository-name>-<branch, each slash as a dash>`, as in `slasher-experiment-state-suffix-legibility`.
10. A worktree inside the repository would show as untracked content in the work's own `git status`.
11. Create a branch-only implementation with `git switch -c <branch>`, and a worktree implementation with `git worktree add -b <branch> <path>`, where `-b` is required.
12. Use `git worktree add <path> <branch>` only to add a worktree to work under way, since it fails on a branch that does not exist.
13. Change the location only by adding a worktree.
14. Add one only on one of two triggers: other work arrives that the engineer means to work alongside.
15. Or the work is escalated, needing more isolation than it was taken for.
16. Confirm the addition.
17. Add a line to the record, and keep the original.
18. The conclusion follows the location as it then stands.
19. Never collapse a worktree back.

## Participation

1. Put attended or unattended through the selection interface beside the working location.
2. Attended is the default.
3. The design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule states why the two sit at one gate, and what changes between them.
4. Record both choices.

## The forecast and the verdict

1. At the start, ask whether the work states a forecast, through the selection interface, beside the working location and the participation. Its options read *No forecast*, then *State a forecast*, in that order. Record the answer as a confirmation, and write a stated forecast in the record.
2. Do not ask it where the working location is the current branch. Work there states no forecast.
3. Whether the work states a forecast follows neither the kind nor whether it opens with a question or an intent.
4. At the end, when the work is complete, ask the verdict question of work with a forecast, and of no other work. Record the answer as a confirmation.
5. Its two options read, in these words and in this order: *Conclude without an engineer's verdict*, then *Conclude with an engineer's verdict*.
6. Work concluded without a verdict ends Completed. Work concluded with one ends Affirmed, Refuted, or Inconclusive, on the engineer's declaration. Work without a forecast is not asked. `complete` concludes it Completed, and the engineer can conclude it with a verdict word instead.
7. A third option reads *What's a verdict?* Selecting it explains, in a sentence or two, that a verdict is the engineer's declaration that the work is Affirmed, Refuted, or Inconclusive, against the forecast stated before the work, and that work without a verdict ends Completed.
8. Then ask the question again, with the same three options.

## The end

1. Every implementation ends in a declared state, or is suspended, which pauses it.
2. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.
3. Work that reaches a verdict is affirmed only on the engineer's explicit declaration.
4. On affirmation, its log is copied into the project log.
5. Where it produced implementation, its branch merges to the upstream branch, after the tests pass.
6. Where no test covers the work, the merge also waits for specific confirmation.
7. Observation-only work's affirmation is the log copy alone.
8. Work that reaches a verdict and will merge brings what master needs to conform to it: every rule its practice needs, and every other change, on its branch before it merges.
9. Work without a verdict merges with no gate, because every commit was verified under the run-the-test-suite-after-changes-before-considering-whether-to-commit rule.
10. The merged result can still break the suite, and that is fixed from there.
11. Work without a verdict has no affirmation.
12. Refuted, inconclusive, abandoned, and superseded work keeps its record, marked with its state, so the attempt and its findings survive.
13. Refuted, inconclusive, abandoned, and superseded work does not merge.
14. Supersede an implementation at any time, without suspending it first.
15. Keep the superseded implementation's branch until the engineer confirms its deletion.
16. The two records name each other.
17. A child supersedes its parent by preserving it.
18. The child merges the parent first, taking every commit the parent made after the child branched.
19. The parent is then parked Superseded, and the records name each other.
20. The child takes the parent's upstream.
21. The parent branch is deleted only on confirmation.
22. This is the one supersession that merges the superseded branch.
23. Conclude in the main working tree, on the upstream branch.
24. Under branch only, the working tree switches back.
25. Under a worktree, end the session in the main working tree, never in the removed directory.
26. On the current branch there is nothing to return from.
27. Branch deletion takes one confirmation from the engineer, through the selection interface. It covers the worktree removal, the kept phase branches, and the implementation's branch on the remote where it was pushed. Delete the remote branch only after the upstream branch holding the work has been pushed. Do not prompt twice. Delete a squashed phase's branch with `git branch -D`, since git refuses `-d` for it.
28. Remove the worktree first, since git refuses to delete a branch checked out in a worktree.
29. Suspension deletes no branch and removes no worktree.

## The agent never raises the end of work with a forecast

1. Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition.
2. Report what is settled and what is open, and stop.
3. The length of work with a forecast is the engineer's judgment, not readable from the work done.
4. Work without a forecast is not covered, because its completion is ordinary.

## Drift

1. While work with a forecast is open under branch only, watch for main-sequence work starting, and surface it.
2. Offer two recourses through the selection interface: suspend the implementation, where the intent is to stop working it for now, or add a worktree, where the intent is to keep working it alongside.
3. Neither recourse ends the implementation, and the engineer's intent decides.
4. The watch rests on the branch name in the status line and on a judgment of whether the work serves the recorded question or intent.
5. The watch is a practice, not a guarantee.
6. Under a worktree there is nothing to watch. The session-start notice reports every implementation that has not concluded.
7. Work without a forecast has no watch, since starting other work during it is ordinary.

## Compression

- 2026-10-22, compressed: compression 0.43, change 0.63, solubility 21 → 42, clarity 0.42 → 0.76
- 2026-10-24, revised: written as a numbered list; checked: 86 directives, 75 kept, 11 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-27, re-checked: 88 directives, 75 kept, 12 less precise, 1 lost, 13 repairs, re-checked kept; directive 58 left less precise, since the point gives its reason and the run-the-test-suite-after-changes-before-considering-whether-to-commit rule states the directive
- 2026-10-28, revised: Why points removed, solubility 42 → 41, clarity 0.76 → 0.79; checked: 85 directives, 84 kept, 1 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 88 directives, 86 kept, 2 less precise, 0 lost, 1 repair
- 2026-10-29, revised: a feature may run in phases; checked: 66 directives, 66 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the verdict choice, not the kind, decides the parts that differ; checked: 72 directives, 71 kept, 1 less precise, 0 lost, 1 repair; re-checked: 71 kept, 1 less precise, 1 repair; re-checked: 72 directives, 72 kept, 0 less precise, 0 lost
- 2026-11-02, revised: a phase's verdict is chosen for that phase; checked: 63 directives, 63 kept, 0 less precise, 0 lost. The body's forecast sentence was then made to say the phase, as the compressed text already did
- 2026-11-06, revised: the verdict question's options are fixed in words; checked: 72 directives, 71 kept, 1 less precise, 0 lost. Left less precise, untouched by this revision: that only an affirmed phase merges back, not a refuted or inconclusive one
- 2026-11-07, revised: the verdict question offers *What's a verdict*; checked: 61 directives, 59 kept, 2 less precise, 0 lost. Left less precise, untouched by this revision: that only an affirmed phase merges back, and that work without a verdict is verified before integrating, which the compressed text gives only as the reason for no gate
- 2026-11-07, revised: the option reads *What's a verdict?*, with a question mark, a wording the engineer settled; not re-checked
- 2026-11-07, revised: the without-verdict option is listed first; re-checked: 61 directives, 60 kept, 1 less precise, 0 lost. Left less precise, untouched by this revision: that work without a verdict is verified before integrating
- 2026-11-08, revised: a phase's commits are squashed into the implementation's branch, and its branch is kept until the implementation concludes; not re-checked
- 2026-11-08, revised: the squash happens when the implementation concludes, not when each phase does, and phases merge with their history meanwhile; not re-checked
- 2026-11-08, revised: phases merge with `--no-ff`, the record names each phase's start, the rebuild reads from it, a squashed phase's branch is deleted with `-D` and the remote branch with it, and the force-push uses `--force-with-lease`, from gaps a test run found; not re-checked
- 2026-11-08, revised: the merge commits are dropped in the rebuild, the body lists subjects after a dash, and the remote branch is deleted only after the upstream is pushed, from gaps a second test run found; not re-checked
- 2026-11-08, revised: a forecast is optional and asked at the start, the verdict question is asked at the end of work with a forecast, and the current branch rules out both; not re-checked
- 2026-11-08, revised: the forecast question lists *No forecast* first, at the engineer's direction; not re-checked
- 2026-11-08, revised: a phase is asked a forecast when added and the verdict when complete, as an implementation is, at the engineer's direction; not re-checked
- 2026-11-09, revised: new creates the branch and writes the record Open, supersession needs no suspension, and any work can take a verdict word; not re-checked
- 2026-11-09, checked: 103 directives, 102 kept, 1 less precise, 0 lost. Left less precise: that the verdict question goes through the selection interface, which its fixed options imply
- 2026-11-13, revised: the first record is committed on the upstream branch before the implementation branch is created, and the branch's copy takes the later updates; the new points checked: 15 directives, 11 kept, 2 less precise, 2 lost, 2 repairs; re-checked: 9 directives, 7 kept, 1 less precise, 1 lost, 2 repairs, not re-checked after. Left lost: that the upstream branch shows the implementation as current while it runs, a reason, which stays in the body

## History

Until Fri Nov 13 2026 the first record was written on the implementation branch, and the upstream branch had no record of the implementation until the work merged.

Until Mon Nov 9 2026 supersession ran through suspension, the record was written Active when the branch was created, and only work with a forecast could reach a verdict.

Until Sun Nov 8 2026 whether a phase reached a verdict was chosen when it was added.

Until Sun Nov 8 2026 whether the work reached a verdict was asked at the start, beside the working location, and work that reached one forecast before its work. The current branch was offered only to work without a verdict.

Until Sun Nov 8 2026 a phase's commits stayed on the implementation's branch with their history through the conclusion, unsquashed, and a phase's branch was not named in the deletion at the end.

Until Sat Nov 7 2026 *Conclude with an engineer's verdict* was the first option and *Conclude without an engineer's verdict* the second.

Until Sat Nov 7 2026 the verdict question had two options, and none explained what a verdict is.

Until Fri Nov 6 2026 the verdict question's options had no fixed words.

Until Thu Nov 5 2026 its trigger read *When starting, working within, adding a worktree to, suspending, or concluding an experiment or feature implementation*, which was not a safe one.

Until Mon Nov 2 2026 a phase reached a verdict where its implementation did. The engineer settled that the choice is made for each phase.

Until Thu Oct 29 2026 the tag decided the parts that differ: an `[experiment]` took the forecast, the verdict, isolation, the merge on affirmation, the drift watch, and the bar on the agent raising its end, and a `[feature]` took none of them. The engineer settled that whether the work reaches a verdict is chosen at the start, and that those parts follow the choice, not the kind.

Until Thu Oct 29 2026 only an experiment ran in phases. The engineer settled that a feature may run in phases too, each phase an intent of its own.

Until Sun Oct 25 2026 this rule was named implementation-lifecycle and titled "An implementation runs on a branch, from a working location chosen at the start, to a declared end".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule restated why attended or unattended sits at one gate with the working location, and what changes between them. It now cites the attended-or-unattended-is-chosen-when-the-work-is-started rule.

Related:

- the the-implementations-directory-holds-one-record-per-implementation rule — the record, the tags, and the state words
- the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started and the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rules
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — the notice reporting what has not concluded
- the `git` run-the-test-suite-after-changes-before-considering-whether-to-commit and announce-a-branch-switch-in-a-bordered-block rules
- the a-phase-starts-by-stating-its-goal rule — what is said when a phase starts

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:34:20 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:50:42 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 2:08:32 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:18:23 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:18:23 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:18:21 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:02:31 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:40:11 PM PT
Changed by Scott Bellware on Mon Nov 2 2026 at 8:34:36 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:03:54 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 10:54:15 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 10:58:24 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 10:59:40 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:42:47 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:50:01 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:59:52 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:04:01 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:35:54 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:42:51 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:49:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:01:01 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:37:42 PM PT
