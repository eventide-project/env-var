# A log entry is written for an implementation record, and the concluding entry depends on whether the work merged

**Trigger:** When creating an implementation record, or changing its **State:** line

An **implementation record** pairs with a one-line entry in `slasher/local/logs/log/`, on creation and on each change of the canonical `**State:**` line.

**The concluding entry takes one of two forms**, and which one is not a matter of taste. It is decided by whether the work merged.

- **Merged — the entry is a summary marker.** Affirmed work merges into its upstream branch, and completed work integrates, whatever the kind. The record travels with it, so `master` holds the substance already. The entry names the record and its state and stops there.
- **Not merged — the entry carries the finding, and only where there is one.** Refuted, inconclusive, abandoned, or superseded work is never merged, whatever the kind. The log is then the only durable trace on `master`.
  - **Work that reached a verdict has the verdict as its finding.** The entry states the question or the intent, the verdict, and what was found. That is knowledge the project has, produced by the run, and it survives the branch.
  - **Abandoned work reached no verdict — it stopped.** The entry states the intent, that it was abandoned, and the reasoning given for stopping. It does **not** reproduce the plan, the increments, or the design the work produced. See the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule, which states why a careful tense is not enough.

## Why an unmerged record is not covered by git

**A deleted file and an unmerged branch are not the same case.** A file removed from `master` sits in `master`'s own history, and a reader reaches it with `git log --` and a path. That is the ordinary case this system relies on everywhere it says a reader uses git.

**An unmerged branch is deleted on confirmation**, which the an-implementation-runs-on-a-branch-to-a-declared-end rule requires before the branch goes. A record that existed only there is reachable afterward from a reflog entry or a dangling object, on one machine, until it is garbage collected. That is not a record.

**So the states that keep the record as evidence are exactly the states that can lose it.** The the-implementations-directory-holds-one-record-per-implementation rule says a refuted, inconclusive, abandoned, or superseded record is *maintained, marked with the state, so the attempt and its findings survive as evidence*. That sentence assumes the record is somewhere a reader can find. Where the record never reached `master`, the log entry is what makes it true.

**A record committed to `master` while the work is on a branch is the ordinary practice here**, and it is what has kept this from biting. Practice is not the rule, and this rule does not rely on it: the entry carries the substance whenever the branch did not merge, whether or not the record happens to have reached `master` by another route.

## What is already required, and not restated

**Affirmed work copies its own log into the project's log.** The an-implementation-runs-on-a-branch-to-a-declared-end rule requires it, and that copy is the findings. The summary marker sits beside those entries rather than replacing them.

**Work without a verdict has no affirmation and no log copy.** Its completion is not a finding, so a completed implementation's marker is the whole of what its conclusion writes.

## What is not logged

**A confirmation the lifecycle records is not a log entry.** The working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion are recorded **in the record**, which is where the run's authority is audited. Logging each would move an audit trail into a log.

**A turn of the work is not a decision.** The hinges, the cycles, and the runs belong to the loop record and the implementation record.

**Why:** the log is what a reader finds without knowing an implementation ever happened. A record answers *what was tried and what came of it* to someone already holding it. The log answers *what has this project decided* to someone holding nothing.

For a merged record the two are one artifact reachable two ways, and a marker is enough. For an unmerged one they are not, and the difference between a marker and the substance is the difference between a trace and a record.

**How to apply:** when an implementation record is created, write a matching one-line entry. Write one for each change of its `**State:**` line.

At the conclusion, ask whether the work merged. Where it did, write a summary marker naming the record and its state. Where it did not, write the question or the intent, and the verdict or the outcome. Add the findings where there are any, and for abandoned work the reasoning given for stopping, so `master` holds them without the record.

Write no entry for a confirmation the record already holds, and none for a turn of the work.

## Compressed

## An implementation record takes a log entry

1. An implementation record pairs with a one-line entry in `slasher/local/logs/log/`.
2. Write the entry when the record is created.
3. Write another entry on each change of the canonical `**State:**` line.

## The concluding entry depends on whether the work reached `master`

1. The concluding entry takes one of two forms. Which one is not a matter of taste.
2. The form is decided by whether the work merged.
3. Merged work means affirmed work merged into its upstream branch, or completed work integrated, whatever the kind.
4. For merged work, the entry is a summary marker. It names the record and its state, and stops there.
5. Unmerged work means refuted, inconclusive, abandoned, or superseded work, whatever the kind. That work is never merged, and its branch is deleted only on confirmation. Its record is kept, marked with its state, as evidence.
6. For unmerged work, the entry states the question or the intent, and the verdict or the outcome. It carries the finding, and only where there is one.
7. For unmerged work that reached a verdict, the entry states the question or the intent, the verdict, and what was found.
8. For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping.
9. An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced. A careful tense is not enough (see the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule).
10. The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route.
11. Do not rely on the practice of committing the record to `master` while the work is on a branch.
12. Write the findings, and for abandoned work the reasoning given for stopping, into the entry, so that `master` holds them without the record.

## What is already required, and not restated

1. Affirmed work still copies its own log into the project's log, as an-implementation-runs-on-a-branch-to-a-declared-end rule requires.
2. The summary marker sits beside those copied entries. It does not replace them.
3. Work without a verdict has no affirmation and no log copy. Completed work's marker is the whole of what its conclusion writes.

## What is not logged

1. Write no log entry for a confirmation the lifecycle records.
2. Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record.
3. Write no log entry for a turn of the work.
4. The hinges, the cycles, and the runs belong to the loop record and the implementation record.

## Compression

- 2026-10-24, compressed: compression 0.35, change 0.67, solubility 25 → 62, clarity 0.28 → 0.80, 20 directives, 20 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-25, revised: points 2 and 3 take the new wording, that the merge decides the concluding entry; not checked
- 2026-10-27, re-checked: 18 directives, 18 kept, 0 less precise, 0 lost
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 62 → 54, clarity 0.80 → 0.72; checked: 14 directives, 13 kept, 1 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 54 → 58, clarity 0.72 → 0.70; checked: 20 directives, 20 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 16 directives, 16 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-29, revised: entries worded by the verdict, whatever the kind; checked: 19 directives, 17 kept, 2 less precise, 0 lost, 2 repairs; re-checked: 19 directives, 19 kept, 0 less precise, 0 lost

## History

Until Thu Oct 29 2026 the concluding entry was worded by kind: an affirmed experiment or a completed feature merged, and an experiment's verdict was its finding. The engineer settled that the verdict is chosen at the start, whatever the kind, so the entry is worded by verdict.

Until 2026-10-25 the concluding entry's form was said to be decided by whether the record itself is on `master`, while a later paragraph and How to apply made the merge the test. How to apply also told every unmerged case to write the findings, which abandoned work does not have, and left out the reasoning for stopping. The engineer settled that the merge is the test, and that the findings are written where there are any, with the reasoning for stopping for abandoned work.

Until Sun Oct 25 2026 this rule was named implementation-records-take-a-log-entry and titled "An implementation record takes a log entry — and what the concluding entry carries depends on whether the work reached `master`".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule was named an-implementation-record-takes-a-log-entry-and-the-last-one-depends-on-the-merge and titled "An implementation record takes a log entry, and the last one depends on the merge".

Related:

- the the-implementations-directory-holds-one-record-per-implementation rule — the record, the two kinds, and the state words each takes
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the merge, and the branch deletion that makes an unmerged record unreachable
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the same shape for an item, which is never on a branch that is deleted and so has no equivalent fork
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's form, and the general trigger this makes specific

---

Authored by Scott Bellware on Sun Aug 16 2026 at 3:12:15 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:35:39 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:27:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:55:37 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:26:56 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:40:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
