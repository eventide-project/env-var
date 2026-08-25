# An implementation record takes a log entry — and what the concluding entry carries depends on whether the work reached `master`

An **implementation record** pairs with a one-line entry in `waytide/local/logs/log/`, on creation and on each change of the canonical `**State:**` line.

**The concluding entry takes one of two forms**, and which one is not a matter of taste. It is decided by whether the record itself is on `master`.

- **Merged — the entry is a summary marker.** An affirmed experiment merges into its upstream branch, and a completed feature integrates. The record travels with it, so `master` holds the substance already. The entry names the record and its state and stops there.
- **Not merged — the entry carries the finding, and only where there is one.** A refuted, inconclusive, abandoned, or superseded experiment is never merged, and neither is an abandoned or superseded feature. The log is then the only durable trace on `master`.
  - **An experiment reached a verdict, and the verdict is the finding.** The entry states the question, the verdict, and what was found. That is knowledge the project has, produced by the run, and it survives the branch.
  - **Abandoned work reached no verdict — it stopped.** The entry states the intent, that it was abandoned, and the reasoning given for stopping. It does **not** reproduce the plan, the increments, or the design the work produced. See the the-log-never-says-undone-work-was-done rule, which states why a careful tense is not enough.

## Why an unmerged record is not covered by git

**A deleted file and an unmerged branch are not the same case.** A file removed from `master` sits in `master`'s own history, and a reader reaches it with `git log --` and a path. That is the ordinary case this system relies on everywhere it says a reader uses git.

**An unmerged branch is deleted on confirmation**, which the implementation-lifecycle rule requires before the branch goes. A record that existed only there is reachable afterward from a reflog entry or a dangling object, on one machine, until it is garbage collected. That is not a record.

**So the states that keep the record as evidence are exactly the states that can lose it.** The implementations-convention says a refuted, inconclusive, abandoned, or superseded record is *maintained, marked with the state, so the attempt and its findings survive as evidence*. That sentence assumes the record is somewhere a reader can find. Where the record never reached `master`, the log entry is what makes it true.

**A record committed to `master` while the work is on a branch is the ordinary practice here**, and it is what has kept this from biting. Every one of this project's sixteen implementation records is on `master` today. Practice is not the rule, and this rule does not rely on it: the entry carries the substance whenever the branch did not merge, whether or not the record happens to have reached `master` by another route.

## What is already required, and not restated

**An affirmed experiment copies its own log into the decision log.** The implementation-lifecycle rule requires it, and that copy is the findings. The summary marker sits beside those entries rather than replacing them.

**A feature has no affirmation and no log copy.** It is built to an intent rather than a question, so a completed feature's marker is the whole of what its conclusion writes.

## What is not logged

**A confirmation the lifecycle records is not a log entry.** The working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion are recorded **in the record**, which is where the run's authority is audited. Logging each would move an audit trail into a decision log.

**A turn of the work is not a decision.** The hinges, the cycles, and the runs belong to the loop record and the implementation record.

**Why:** the decision log is what a reader finds without knowing an experiment ever happened. A record answers *what was tried and what came of it* to someone already holding it. The log answers *what has this project decided* to someone holding nothing.

For a merged record the two are one artifact reachable two ways, and a marker is enough. For an unmerged one they are not, and the difference between a marker and the substance is the difference between a trace and a record.

**How to apply:** when an implementation record is created, write a matching one-line entry. Write one for each change of its `**State:**` line.

At the conclusion, ask whether the work merged. Where it did, write a summary marker naming the record and its state. Where it did not, write the question or the intent, the verdict or the outcome, and the findings, so `master` holds them without the record.

Write no entry for a confirmation the record already holds, and none for a turn of the work.

Related:

- the implementations-convention — the record, the two kinds, and the state words each takes
- the implementation-lifecycle rule — the merge, and the branch deletion that makes an unmerged record unreachable
- the an-idea-takes-a-log-entry rule — the same shape for an idea, which is never on a branch that is deleted and so has no equivalent fork
- the decision-log-convention — the entry's form, and the general trigger this makes specific

---

Authored by Scott Bellware on Sun Aug 16 2026 at 3:12:15 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
