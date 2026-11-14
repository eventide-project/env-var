# The log records why work was abandoned, and never says undone work was done

**Trigger:** When writing a log entry, especially one recording abandoned work

**A log entry never conveys that something was done when it was not done.** That is the whole prohibition, and it holds whatever the entry is about.

**As the engineer stated it:** if work is abandoned, the log can record any reasoning given for the abandonment, but the log should never make a record that conveys that something was done when in fact it was not done. The log on `master` shouldn't convey that work from an abandoned branch landed on `master`.

## What an abandonment entry carries

**The reasoning, where reasoning was given.** Why the work stopped is what a later reader reconsidering it decides against, and it is the part nothing else on `master` holds once the branch is gone.

**Where no reason was given, the entry says so and invents none.** An agent's reading of why the engineer stopped is not the engineer's reason.

**What it does not carry is the unfinished work.** Not the plan that was never executed, not the increments that were never run, not the design that was never built. Those were produced on a branch that is gone, and reproducing them in the log makes the project appear to hold as settled knowledge what it holds as nothing at all.

## Why the mood is not enough

**Careful tense is necessary and does not settle it.** *It would have taken the package to `ext/`* claims nothing was done, and an entry written entirely that way still puts a body of unexecuted planning into the durable record.

**The reader's question is what the project knows**, and the log is where they ask it holding nothing else. A plan recorded at length reads as a plan the project has, however conditionally each sentence is phrased.

**So the test is not the grammar but the subject.** Reasoning for stopping belongs in the log. Work that stopped does not.

**Why:** the log is the one durable record on `master` for work whose branch is deleted, which is what makes it tempting to pour the branch into it. That temptation runs directly at what the log is for. A reader reaches the log to learn what this project decided, and an abandonment is a decision — the decision to stop, and the reason for it. The steps that were never taken are not a second decision, and putting them there converts a record of what the project did into a record of what it considered.

The failure it prevents is specific and hard to see from inside. Every sentence can be conditional, every claim true, and the entry can still leave a reader believing the project worked something out. Nothing in the entry says otherwise, because the reader has no branch to compare it against.

**How to apply:** when work is abandoned, write the log entry as the decision to stop and the reasoning given for it. Say plainly that nothing merged and where the work was.

Write no reason that was not given. Do not reproduce the plan, the increments, or the design the abandoned work produced. Where an entry needs more than a line, it takes a body — see the the-log-holds-one-file-per-entry-with-a-one-line-title rule.

## Compressed

1. A log entry never conveys that something was done when it was not done.
2. This prohibition holds whatever the entry is about.
3. The log on `master` never conveys that work from an abandoned branch landed on `master`.

## What an abandonment entry carries

1. When work is abandoned, write the entry as the decision to stop and the reasoning given for it.
2. Where no reason was given, the entry says so.
3. Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason.
4. Say plainly that nothing merged.
5. Say plainly where the work was.
6. Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design.
7. Where an entry needs more than a line, it takes a body, as the the-log-holds-one-file-per-entry-with-a-one-line-title rule describes.

## Why the mood is not enough

1. Careful tense is necessary but not sufficient.
2. An entry written entirely in conditional mood, such as *It would have taken the package to `ext/`*, still must not record unexecuted planning.
3. The test is the entry's subject, not its grammar.
4. Reasoning for stopping belongs in the log. Work that stopped does not.

## Compression

- 2026-10-24, compressed: compression 0.55, change 0.79, solubility 39 → 75, clarity 0.29 → 0.67, 12 directives, 12 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 75 → 68, clarity 0.67 → 0.57; checked: 10 directives, 10 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named the-log-never-says-undone-work-was-done and titled "The log records the reasoning for an abandonment, and never conveys that something was done when it was not".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's shape, and when it takes a body
- the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule — the substance an unmerged **experiment's verdict** carries, which this holds apart from abandoned work
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the same prohibition for an item, stated as the mood an entry is written in
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the branch deletion that leaves the log as the only durable trace

---

Authored by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:55:37 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
