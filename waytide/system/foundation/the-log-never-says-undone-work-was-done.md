# The log records the reasoning for an abandonment, and never conveys that something was done when it was not

**A decision log entry never conveys that something was done when it was not done.** That is the whole prohibition, and it holds whatever the entry is about.

**As the engineer stated it:** if work is abandoned, the decision log can record any reasoning given for the abandonment, but the decision log should never make a record that conveys that something was done when in fact it was not done. The log on `master` shouldn't convey that work from an abandoned branch landed on `master`.

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

Write no reason that was not given. Do not reproduce the plan, the increments, or the design the abandoned work produced. Where an entry needs more than a line, it takes a body — see the decision-log-convention.

Related:

- the decision-log-convention — the entry's shape, and when it takes a body
- the implementation-records-take-a-log-entry rule — the substance an unmerged **experiment's verdict** carries, which this holds apart from abandoned work
- the an-idea-takes-a-log-entry rule — the same prohibition for an idea, stated as the mood an entry is written in
- the implementation-lifecycle rule — the branch deletion that leaves the log as the only durable trace

---

Authored by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
