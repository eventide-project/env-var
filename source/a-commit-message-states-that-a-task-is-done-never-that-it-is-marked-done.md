# A commit message states that a task is done, never that it is marked done

**Trigger:** When writing a commit message

A commit message must not use the phrasing "mark ... done" (or "mark ... complete"). State the accomplishment as a fact about the work, not as an act of bookkeeping on a checkbox. For example, write **"Task 9 is done"** — not "mark Task 9 done" / "mark Task 9 as complete".

| Don't | Do |
|---|---|
| `Log: mark Task 9 done (already passing)` | `Log: Task 9 is done (already passing)` |
| `mark the predicate task complete` | `the predicate task is done` |

**Why:** "Mark ... done" describes the act of ticking a box. The commit should describe the state of the work — the task *is* done. The fact is what matters and what reads well in the log, not the clerical gesture of marking it.

**How to apply:** A commit records that a task or a piece of work is finished. Phrase the subject and the body as the task *being* done. Say "Task N is done", or "X is complete". Never phrase it as "mark ... done/complete". Applies to the commit subject and body. The same plain-statement preference extends to prose addressed to the user.

## Compressed

1. A commit message never uses "mark ... done" or "mark ... complete".
2. State the accomplishment as a fact about the work.
3. Do not phrase it as bookkeeping on a checkbox.
4. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete".

| Don't | Do |
|---|---|
| `Log: mark Task 9 done (already passing)` | `Log: Task 9 is done (already passing)` |
| `mark the predicate task complete` | `the predicate task is done` |

5. Phrase finished work as the task being done. Say "Task N is done" or "X is complete".
6. This applies to the commit subject and the commit body.
7. Prose addressed to the user follows the same preference.
8. In prose addressed to the user, state the plain fact. Do not describe the act of marking it.

## Compression

- 2026-10-22, compressed: compression 0.23, change 0.61, solubility 86 → 85, clarity 0.76 → 0.73, 8 directives, 8 kept, 0 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-27, re-checked: 5 directives, 5 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 85 → 93, clarity 0.73 → 0.91; checked: 5 directives, 5 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named commit-says-task-is-done-not-mark-done and titled "Commit messages: never say "mark ... done" — state the fact ("Task 9 is done")".

Until Mon Oct 26 2026 this rule's example commit carried "(green-on-arrival)", a term since replaced by a literal phrase.

Related:

- the no-slang rule terminology rule
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule

---

Authored by Scott Bellware on Mon Jun 29 2026 at 11 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Mon Oct 19 2026 at 3:35:00 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:26 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:34:57 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:18:12 PM PT
