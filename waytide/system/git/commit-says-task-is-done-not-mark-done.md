# Commit messages: never say "mark ... done" — state the fact ("Task 9 is done")

A commit message must not use the phrasing "mark ... done" (or "mark ... complete"). State the accomplishment as a fact about the work, not as an act of bookkeeping on a checkbox. For example, write **"Task 9 is done"** — not "mark Task 9 done" / "mark Task 9 as complete".

| Don't | Do |
|---|---|
| `Log: mark Task 9 done (green-on-arrival)` | `Log: Task 9 is done (green-on-arrival)` |
| `mark the predicate task complete` | `the predicate task is done` |

**Why:** "Mark ... done" describes the act of ticking a box. The commit should describe the state of the work — the task *is* done. The fact is what matters and what reads well in the log, not the clerical gesture of marking it.

**How to apply:** A commit records that a task or item is finished. Phrase the subject and the body as the task *being* done. Say "Task N is done", or "X is complete". Never phrase it as "mark ... done/complete". Applies to the commit subject and body. The same plain-statement preference extends to prose addressed to the user.

Related:

- the no-slang terminology rule
- the decision-log-format conventions

---

Authored by Scott Bellware on Mon Jun 29 2026 at 11 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
