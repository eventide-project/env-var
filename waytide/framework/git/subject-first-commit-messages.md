# Write subject-first commit messages

The subject of a commit message is **the software** — never the developer. A commit log is a journal of the changes made to the software and their effects, not a personal journal of what the developer did. So the first line leads with *the thing that changed and its new state*, stated as a fact in passive voice and indicative mood.

Developers gravitate toward recounting their exploits — "Fixed the parser", "Added the tests", "Refactored the module". A leading verb, whether an imperative ("Fix…") or a past-tense report ("Fixed…"), puts the developer's work first. The subject must put the software first.

- **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
- **"is corrected"** for a defect; **"is clarified"** for a refactor or readability change.
- **Omit the verb for a new item.** "Widget tests", not "Widget tests are added".
- **Rename form:** "Widget, rather than sprocket".
- **Version bump form:** "Package version is increased from 1.1.1 to 1.2.0".
- **No 50-character limit** — let the first line run as long as it needs to state the subject clearly.

**Why:** the log records the history of the software, and it is scanned rather than read, so leading with the changed thing rather than the developer's action is both truer to what the log is for and easier to review. It is the Eventide house style, and it composes with the commit-wording rule — "Task 9 is done" already states the fact, software-first.

**How to apply:** name the software that changed, then state its new state in passive, indicative voice, subject leading. Never lead with a verb — not imperative and not past tense — because both put the developer's work ahead of the software. Related: the commit-says-task-is-done-not-mark-done rule, the no-Claude-coauthor rule, and the run-suite-before-commit rule.

---

Authored by Scott Bellware on Mon Jul 13 2026 at 1 PM PT
