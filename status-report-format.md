# "Status report" prints a fixed whole-project report

When the user asks for a **status report** (or "project status"), produce a report with these parts, in order:

1. **Task plan table** — the active plan's tasks as a table: number, task, status (done / next / pending), and a terse note. Mark the next task. Include any out-of-sequence extras already built.
2. **Deferred work table** — the items under `waytide/deferred/`: name, date, kind (chore vs. open design question), one-line gist. These are parked, off the task line.
3. **Waytide-directory orientation** — a basic map of `waytide/`: `waytide/framework/` holds the installed rule packages (e.g. `foundation/`, `language/`) and `waytide/rules/` holds the project's own local rules — both binding, both read at session start; alongside them, under `waytide/`, the working directories `log/`, `plans/`, `observations/`, `deferred/`, and any package-contributed ones such as `loops/`. How to work with it: rules are enforceable conventions; the log is title-only ISO-8601-UTC decision entries; a rule typically pairs with a log entry; plans hold the task checklist; deferred holds parked work.
4. **Recent flows of work** — a brief of the recent direction, drawn from the latest log/commit entries (a few lines, not an exhaustive list).
5. **Test suite** — **convention-aware of the testing package.** If the project has adopted the testing conventions, run the suite and report the count and pass/fail line, plus the suite's **context tree two levels deep, rendered hierarchically**: each distinct **top-level context** as a tree root, with its distinct **second-level contexts** indented as its branches, using an indented tree (e.g. a fenced block with `├─`/`└─` branches). Stop at two levels — do not descend into per-assertion contexts. If the project has **not** adopted the testing conventions, degrade this section: report whatever suite the project has (count and pass/fail), or note that there is none.

Keep each part tight. Read current state before printing — do not report stale task counts, suite numbers, contexts, or deferred items from memory.

**Why:** a status report is a recurring request with a known shape; fixing the format makes the report repeatable and complete, and steers reading toward the in-repo sources of truth rather than recollection.

**How to apply:** on a status-report request, render the parts above from current files (`waytide/plans/`, `waytide/deferred/`, `waytide/log/`, git). Confirm the suite count and the two-level context tree by running the suite rather than asserting them; the two levels are the first two nesting depths of `context "…"` declarations, excluding comment and assertion lines. Related: the test-report and test-tree commands in the testing package.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 11 PM PT
