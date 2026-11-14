# A status report prints a fixed whole-project report

When the user asks for a **status report** (or "project status"), produce a report with these parts, in order:

**The report reads the project's planning records** — the items that carry the work's tasks, whatever the project's kind tags name them. This rule names no directory and no kind, so it survives a change to either.

1. **Task table** — the tasks those records carry, as a table: number, task, status (done / next / pending), and a terse note. Mark the next task. Include any out-of-sequence extras already built.
2. **Waiting work table** — the items carrying a `**Waits for:**` line: name, date, what it waits for, one-line gist. These are off the task line until the wait ends. Order them by their `**Priority:**` rank where they carry one. **A hidden record is not listed here** — see below.
3. **Slasher-directory orientation** — a basic map of `slasher/`: `slasher/system/` holds the installed rule packages (e.g. `foundation/`, `language/`) and `slasher/local/rules/` holds the project's own local rules — each binding, each read at session start. Alongside `rules/` under `slasher/local/`, the contemporaneous, historical records under `logs/` (`log/`, `loops/`, `work-sessions/`), and the work-artifact directories `items/`, `implementations/`, and `migration/`. How to work with it: rules are enforceable conventions, and the log is title-only ISO-8601-UTC decision entries. A rule typically pairs with a log entry. An item holds the task checklist where it sequences work, and a `**Waits for:**` line marks work that is not yet actionable.
4. **Recent flows of work** — a brief of the recent direction, drawn from the latest log/commit entries (a few lines, not an exhaustive list).
5. **Test suite** — **convention-aware of the testing package.** If the project has adopted the testing conventions, run the suite and report the count and pass/fail line. Report the suite's **context tree two levels deep, rendered hierarchically**. Each distinct **top-level context** is a tree root, with its distinct **second-level contexts** indented as its branches. Use an indented tree, such as a fenced block with `├─`/`└─` branches. Stop at two levels — do not descend into per-assertion contexts. If the project has **not** adopted the testing conventions, degrade this section. Report whatever suite the project has, with its count and pass/fail, or note that there is none.

## A hidden record is counted rather than listed

**A hidden record is one a report states the number of and does not otherwise show.** It is omitted from the table or the passage it would ordinarily sit in, and a line there gives the count and the kind. **The line says no more than that** — no *not listed*, no *withheld*, no explanation. A count standing alone already says the records exist and are not shown.

```
3 suspended items
12 suspension log entries
```

**This reaches a brief as well as the report.** The fixed status report above is one surface. Any summary of the project's state is another — including the *Recent flows of work* brief in part 4, and any ad-hoc account of where things stand. A record hidden from one is hidden from all of them.

**Two kinds are hidden today.**

- **A record whose `**State:**` line reads `Suspended`.** A suspended thing is paused rather than ended, so it is neither current work nor concluded work, and listing it among current work overstates what is live.
- **A record carrying the `[suspended]` tag.** That is a log entry recording that the project stopped doing something, per the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule. A run of them would otherwise fill a brief of recent direction with what the project stopped rather than what it did.

**The two are different records and take the same treatment.** The state marks something the project **wanted** and set aside. The tag marks something the project **did** and stopped. That rule holds them apart deliberately, and nothing here merges them — they are hidden for the same reason and by the same means.

**A later rule may name another kind**, and it becomes hidden by saying so. What this rule fixes is the treatment rather than the membership: counted, not listed, and named by kind in the count.

**They are shown when they are asked for.** *Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing. The count is what makes the request possible — a reader cannot ask for what nothing told them was there.

**Hiding is not the same as omitting.** A record that is not reported at all leaves the reader believing they have seen everything. The count is the whole difference, and it is why a hidden record is never simply dropped.

Keep each part tight. Read current state before printing — do not report stale task counts, suite numbers, contexts, or deferred items from memory.

**Why:** a status report is a recurring request with a known shape. Fixing the format makes the report repeatable and complete, and steers reading toward the in-repo sources of truth rather than recollection.

**How to apply:** on a status-report request, render the parts above from current files. Those are the project's items, `slasher/local/logs/log/`, and git. Confirm the suite count and the two-level context tree by running the suite rather than asserting them. Take the two levels from **the run's output**, not from the `context "…"` declarations in the source. A dynamic context reads as a placeholder in the source, and as its real value in a run. An unnamed test appears in the source and emits no line.

## Compressed

1. When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order.
2. The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them.
3. Identify those records without naming a directory or a kind.
4. Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note.
5. Mark the next task in the task table.
6. Include any out-of-sequence extras already built in the task table.
7. Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist.
8. Waiting items are off the task line until the wait ends.
9. Order waiting items by their `**Priority:**` rank where they carry one.
10. Do not list a hidden record in the waiting work table.
11. Part 3, **Slasher-directory orientation**: a basic map of `slasher/`.
12. The map shows that `slasher/system/` holds the installed rule packages (e.g. `foundation/`, `language/`).
13. The map shows that `slasher/local/rules/` holds the project's own local rules.
14. The map states that both are binding and both are read at session start.
15. The map shows the contemporaneous, historical records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `slasher/local/`.
16. The map shows the work-artifact directories `items/`, `implementations/`, and `migration/`, also under `slasher/local/`.
17. The orientation says how to work with the directory. Rules are enforceable conventions.
18. The log is title-only ISO-8601-UTC decision entries.
19. A rule typically pairs with a log entry.
20. An item holds the task checklist where it sequences work.
21. A `**Waits for:**` line marks work that is not yet actionable.
22. Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries.
23. Keep the brief to a few lines, not an exhaustive list.
24. Part 5, **Test suite**: this part is convention-aware of the testing package.
25. If the project has adopted the testing conventions, run the suite and report the count and pass/fail line.
26. Report the suite's context tree two levels deep, rendered hierarchically.
27. Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches.
28. Use an indented tree, such as a fenced block with `├─`/`└─` branches.
29. Stop at two levels. Do not descend into per-assertion contexts.
30. If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail.
31. If the project has no suite, note that there is none.

## A hidden record is counted rather than listed

1. A hidden record is one a report states the number of and does not otherwise show.
2. Omit a hidden record from the table or passage it would ordinarily sit in.
3. Put a line there giving the count and the kind.
4. The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation.

```
3 suspended items
12 suspension log entries
```

5. Hiding applies to any summary of the project's state, not only the fixed status report.
6. That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand.
7. A record hidden from one surface is hidden from all of them.
8. Two kinds are hidden today.
9. A record whose `**State:**` line reads `Suspended` is hidden.
10. A record carrying the `[suspended]` tag is hidden. That is a log entry, per the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule.
11. The two are different records, hidden for the same reason, and take the same treatment. Do not merge them.
12. A later rule may name another kind, and it becomes hidden by saying so.
13. The treatment is fixed: counted, not listed, and named by kind in the count.
14. Show hidden records when they are asked for.
15. *Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing.
16. Never simply drop a hidden record. The count is what separates hiding from omitting.

## The report is rendered from current state

1. Keep each part tight.
2. Read current state before printing.
3. Do not report stale task counts, suite numbers, contexts, or deferred items from memory.
4. Render the parts from current files: the project's items, `slasher/local/logs/log/`, and git.
5. Confirm the suite count and the two-level context tree by running the suite, not by asserting them.
6. Take the two levels from the run's output, not from the `context "…"` declarations in the source.
7. A dynamic context reads as a placeholder in the source, and as its real value in a run.
8. An unnamed test appears in the source and emits no line.

## Compression

- 2026-10-24, compressed: compression 0.10, change 0.41, solubility 28 → 51, clarity 0.40 → 0.83, 32 directives, 32 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 51 → 51, clarity 0.83 → 0.83; checked: 29 directives, 28 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 51 → 51, clarity 0.83 → 0.83; checked: 31 directives, 31 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule was loaded on demand, on the trigger *When the engineer asks for a status report, or when giving any summary of where the project stands*. Its trigger was not a safe one, so it is pre-loaded.

Until Sun Oct 25 2026 this rule was named status-report-format and titled ""Status report" prints a fixed whole-project report".

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Related:

- the the-items-directory-holds-one-file-per-item rule — the `Suspended` state a hidden record carries
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the `[suspended]` **tag**, which marks a log entry and is a different act from an item carrying the state
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — the form the report's tables take
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
Changed by Scott Bellware on Sun Aug 23 2026 at 12:59:23 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:01:04 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:16:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:26 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:14:47 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
