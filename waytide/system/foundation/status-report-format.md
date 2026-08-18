# "Status report" prints a fixed whole-project report

When the user asks for a **status report** (or "project status"), produce a report with these parts, in order:

**The report reads the project's planning records** — the ideas that carry the work's tasks, whatever the project's kind tags name them. This rule names no directory and no kind, so it survives a change to either.

1. **Task table** — the tasks those records carry, as a table: number, task, status (done / next / pending), and a terse note. Mark the next task. Include any out-of-sequence extras already built.
2. **Deferred work table** — the ideas tagged `[deferred]`: name, date, kind (chore vs. open design question), one-line gist. These are parked, off the task line.
3. **Waytide-directory orientation** — a basic map of `waytide/`: `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`) and `waytide/local/rules/` holds the project's own local rules — each binding, each read at session start. Alongside `rules/` under `waytide/local/`, the running records under `logs/` (`log/`, `loops/`, `work-sessions/`), and the work-artifact directories `ideas/`, `implementations/`, and `migration/`. How to work with it: rules are enforceable conventions, and the log is title-only ISO-8601-UTC decision entries. A rule typically pairs with a log entry. An idea holds the task checklist where it sequences work, and the `[deferred]` tag marks parked work.
4. **Recent flows of work** — a brief of the recent direction, drawn from the latest log/commit entries (a few lines, not an exhaustive list).
5. **Test suite** — **convention-aware of the testing package.** If the project has adopted the testing conventions, run the suite and report the count and pass/fail line. Report the suite's **context tree two levels deep, rendered hierarchically**. Each distinct **top-level context** is a tree root, with its distinct **second-level contexts** indented as its branches. Use an indented tree, such as a fenced block with `├─`/`└─` branches. Stop at two levels — do not descend into per-assertion contexts. If the project has **not** adopted the testing conventions, degrade this section. Report whatever suite the project has, with its count and pass/fail, or note that there is none.

Keep each part tight. Read current state before printing — do not report stale task counts, suite numbers, contexts, or deferred items from memory.

**Why:** a status report is a recurring request with a known shape. Fixing the format makes the report repeatable and complete, and steers reading toward the in-repo sources of truth rather than recollection.

**How to apply:** on a status-report request, render the parts above from current files. Those are the project's ideas, `waytide/local/logs/log/`, and git. Confirm the suite count and the two-level context tree by running the suite rather than asserting them. Take the two levels from **the run's output**, not from the `context "…"` declarations in the source. A dynamic context reads as a placeholder in the source, and as its real value in a run. An unnamed test appears in the source and emits no line.

Related:

- the test-report and test-tree commands in the testing package
- which derive the same tree the same way — the test-tree rule states the reasons in full

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
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:48:55 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
