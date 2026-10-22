# Write subject-first commit messages

The subject of a commit message is **the software** — never the engineer. A commit log is a record of the changes made to the software and their effects, not an account of what the engineer did. So the first line leads with *the thing that changed and its new state*, stated as a fact in passive voice and indicative mood.

Engineers gravitate toward recounting their exploits — "Fixed the parser", "Added the tests", "Refactored the module". A leading verb, whether an imperative ("Fix…") or a past-tense report ("Fixed…"), puts the engineer's work first. The subject must put the software first.

- **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
- **"is corrected"** for a defect. **"is clarified"** for a refactor or readability change.
- **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
- **Rename form:** "Widget, rather than sprocket".
- **Package version form:** "Package version is increased from 1.1.1 to 1.2.0" — the message states the current version and the next one, so the log line carries the transition without a reader reaching for the package specification. "Increased" holds even when a trailing segment resets, as it does here: what is increased is the version, not each segment.

**The subject's length is the commit-message-widths rule's**, which caps it at 50 characters and wraps the body at 72.

**The two rules pull against each other, and that is the point.** Naming the software and then its new state costs words a leading verb would not. Where the subject will not fit, the answer is to split the commit rather than to drop the subject and lead with a verb.

**Why:** the log records the history of the software. It is scanned rather than read. Leading with the changed thing rather than the engineer's action is truer to what the log is for, and easier to review. It is the Eventide house style, and it composes with the commit-wording rule — "Task 9 is done" already states the fact, software-first.

**How to apply:** name the software that changed, then state its new state in passive, indicative voice, subject leading. Never lead with a verb, because a verb puts the engineer's work ahead of the software. That is imperative and past tense alike.

Related:

- the commit-says-task-is-done-not-mark-done rule
- the no-Claude-coauthor rule
- the commit-message-widths rule — the subject's 50 characters and the body's 72
- the run-suite-before-commit rule
