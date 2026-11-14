# Write subject-first commit messages

**Trigger:** When writing a commit message

The subject of a commit message is **the software** — never the engineer. A commit log is a record of the changes made to the software and their effects, not an account of what the engineer did. So the first line leads with *the thing that changed and its new state*, stated as a fact in passive voice and indicative mood.

Engineers gravitate toward recounting their exploits — "Fixed the parser", "Added the tests", "Refactored the module". A leading verb, whether an imperative ("Fix…") or a past-tense report ("Fixed…"), puts the engineer's work first. The subject must put the software first.

- **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
- **"is corrected"** for a defect. **"is clarified"** for a refactor or readability change.
- **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
- **Rename form:** "Widget, rather than sprocket".
- **Package version form:** "Package version is increased from 1.1.1 to 1.2.0" — the message states the current version and the next one, so the log line carries the transition without a reader reaching for the package specification. "Increased" holds even when a trailing segment resets, as it does here: what is increased is the version, not each segment.

**The subject's length is the a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule's**, which caps it at 50 characters and wraps the body at 72.

**The two rules pull against each other, and that is the point.** Naming the software and then its new state costs words a leading verb would not. Where the subject will not fit, the answer is to split the commit rather than to drop the subject and lead with a verb.

**Why:** the log records the history of the software. It is scanned rather than read. Leading with the changed thing rather than the engineer's action is truer to what the log is for, and easier to review. It is the Eventide house style, and it composes with the commit-wording rule — "Task 9 is done" already states the fact, software-first.

**How to apply:** name the software that changed, then state its new state in passive, indicative voice, subject leading. Never lead with a verb, because a verb puts the engineer's work ahead of the software. That is imperative and past tense alike.

## Compressed

1. The subject of a commit message is **the software**, never the engineer.
2. The log records changes to the software and their effects. It is not an account of what the engineer did.
3. The first line leads with the thing that changed and its new state.
4. State it as a fact, in passive voice and indicative mood.
5. **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
6. Use **"is corrected"** for a defect.
7. Use **"is clarified"** for a refactor or readability change.
8. **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
9. **Rename form:** "Widget, rather than sprocket".
10. **Package version form:** "Package version is increased from 1.1.1 to 1.2.0".
11. State both the current version and the next one.
12. "Increased" holds even when a trailing segment resets.
13. **Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike.
14. Name the software that changed, then its new state.
15. **The subject's length is the a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule's.** That rule caps the subject at 50 characters and wraps the body at 72.
16. **Split the commit when the subject will not fit.**
17. Do not drop the software subject and lead with a verb instead.

## Compression

- 2026-10-22, compressed: compression 0.39, change 0.56, solubility 58 → 81, clarity 0.45 → 0.72, 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 81 → 79, clarity 0.72 → 0.75; checked: 13 directives, 13 kept, 0 less precise, 0 lost

## History

This rule carried a *no 50-character limit* policy until 2026-08-18, licensing a first line as long as it needed. That policy is discontinued and the cap replaced it the same day.

Until Sun Oct 25 2026 this rule was named subject-first-commit-messages.

Related:

- the a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule
- the no-Claude-coauthor rule
- the a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule — the subject's 50 characters and the body's 72
- the run-the-test-suite-after-changes-before-considering-whether-to-commit rule

---

Authored by Scott Bellware on Mon Jul 13 2026 at 1 PM PT
Changed by Scott Bellware on Sat Jul 25 2026 at 11 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:08:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:56:19 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:58:01 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:44 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:35 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:52 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
