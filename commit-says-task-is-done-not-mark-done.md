# Commit messages: never say "mark ... done" — state the fact ("Task 9 is done")

A commit message must not use the phrasing "mark ... done" (or "mark ... complete"). State the accomplishment as a fact about the work, not as an act of bookkeeping on a checkbox. For example, write **"Task 9 is done"** — not "mark Task 9 done" / "mark Task 9 as complete".

| Don't | Do |
|---|---|
| `Log: mark Task 9 done (green-on-arrival)` | `Log: Task 9 is done (green-on-arrival)` |
| `mark the predicate task complete` | `the predicate task is done` |

**Why:** "Mark ... done" describes the act of ticking a box; the commit should describe the state of the work — the task *is* done. The fact is what matters and what reads well in the log, not the clerical gesture of marking it.

**How to apply:** When a commit records that a task or item is finished, phrase the subject/body as the task *being* done ("Task N is done", "X is complete"), never as "mark ... done/complete". Applies to the commit subject and body; the same plain-statement preference extends to prose addressed to the user. Related: the no-slang terminology rule and the decision-log-format conventions.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 11 AM PT
