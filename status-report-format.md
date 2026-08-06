# "Status report" prints a fixed whole-project report

When the user asks for a **status report** (or "project status"), produce a report with these parts, in order:

**The report reads the project's sequencing artifact**, whatever the project's mode names it and wherever that mode puts it (see the a-project-works-in-a-mode-chosen-at-initiation rule). This rule names no directory, so it stays true whichever mode a project is in and survives a change to what the directories are called.

1. **Task table** — the sequencing artifact's tasks as a table: number, task, status (done / next / pending), and a terse note. Mark the next task. Include any out-of-sequence extras already built.
2. **Deferred work table** — the items under `waytide/local/deferred/`: name, date, kind (chore vs. open design question), one-line gist. These are parked, off the task line.
3. **Waytide-directory orientation** — a basic map of `waytide/`: `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`) and `waytide/local/rules/` holds the project's own local rules — both binding, both read at session start; alongside `rules/` under `waytide/local/`, the working directories `log/`, `observations/`, `deferred/`, the project's planning directories, and any package-contributed ones such as `loops/`. How to work with it: rules are enforceable conventions; the log is title-only ISO-8601-UTC decision entries; a rule typically pairs with a log entry; the sequencing directory holds the task checklist; deferred holds parked work.
4. **Recent flows of work** — a brief of the recent direction, drawn from the latest log/commit entries (a few lines, not an exhaustive list).
5. **Test suite** — **convention-aware of the testing package.** If the project has adopted the testing conventions, run the suite and report the count and pass/fail line, plus the suite's **context tree two levels deep, rendered hierarchically**: each distinct **top-level context** as a tree root, with its distinct **second-level contexts** indented as its branches, using an indented tree (e.g. a fenced block with `├─`/`└─` branches). Stop at two levels — do not descend into per-assertion contexts. If the project has **not** adopted the testing conventions, degrade this section: report whatever suite the project has (count and pass/fail), or note that there is none.

Keep each part tight. Read current state before printing — do not report stale task counts, suite numbers, contexts, or deferred items from memory.

**Why:** a status report is a recurring request with a known shape; fixing the format makes the report repeatable and complete, and steers reading toward the in-repo sources of truth rather than recollection.

**How to apply:** on a status-report request, render the parts above from current files (the project's sequencing artifact, `waytide/local/deferred/`, `waytide/local/log/`, git). Confirm the suite count and the two-level context tree by running the suite rather than asserting them, and take the two levels from **the run's output** rather than from the `context "…"` declarations in the source — a dynamic context reads as a placeholder in the source and as its real value in a run, and an unnamed test appears in the source and emits no line. Related: the test-report and test-tree commands in the testing package, which derive the same tree the same way (the test-tree rule states the reasons in full).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 11 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:35:51 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:53:02 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:03:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:57:02 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
