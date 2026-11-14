# The recent report says what was recently done, and what is next

**Trigger:** When the engineer types `/recent`, or asks what was recently done and what is next

**`/recent` answers two questions in a few lines: what was recently done, and what is next.**

**As the engineer stated it:** what was recently done, and what's next.

**What was recently done is read from the latest log entries and commits.** It is a short list of what changed, newest last, each a fact about the work: a skill built, a rule written, a decision recorded. It covers the branch the work is on, and `master` where work landed there too. It says which commits are not yet pushed, by branch, as a count.

**What is next is the next step of the work under way**, as the next-takes-the-next-step-of-the-work-under-way rule finds it for `/next?`. Where more than one piece of work is under way, the answer names the next step of each, the one the conversation is on first.

**The list of what was recently done is numbered.** Its items carry sequence numbers from 1, not bullets, so the engineer can refer to an item by its number. The part that gives the next step takes bullets, not numbers.

**The part that gives the next step is headed *What's next*, not *What is next*.** The engineer asks the question in those words, and the answer is headed as it was asked.

**It is not the status report.** The a-status-report-prints-a-fixed-whole-project-report rule's report adds a task table, a map of `slasher/`, and a run of the test suite. `/recent` carries none of them. Where the engineer wants the whole project, `/status-report` gives it.

**It is read from current state, never from memory.** The log, the commits, and the records are read when the command is typed. A record that summary rule hides, such as a suspended item, is counted rather than listed here too.

**Why:** a session that works through many changes asks *what's recent* and *what's next* again and again. One command answers both, in the same shape each time, without the full report's weight.

**How to apply:** on `/recent`, read the latest log entries and commits on the branches the work touches, list what was recently done, and give the next step of the work under way. Say what is not pushed. Keep it to a few lines, and leave the whole-project parts to `/status-report`.

## Compressed

1. `/recent` says in a few lines what was recently done and what is next.
2. What was recently done is read from the latest log entries and commits: a short list, newest last, each a fact about the work. It covers the branch the work is on, and `master` where work landed there too.
3. Say how many commits on each branch are not yet pushed.
4. What is next is the next step of the work under way, found as `/next?` finds it. Where more than one piece of work is under way, name the next step of each, the one the conversation is on first.
5. Carry no task table, no map of `slasher/`, and no suite run. Those belong to `/status-report`.
6. Read the log, the commits, and the records when the command is typed, never from memory. A record the status report rule hides is counted rather than listed.
7. Head the part that gives the next step *What's next*, not *What is next*.
8. Number the list of what was recently done from 1, not with bullets. Give the part that gives the next step bullets, not numbers.

## Compression

- 2026-11-04, compressed: checked: 16 directives, 15 kept, 1 less precise, 0 lost. Left less precise: the examples of a fact about the work, which the requirement carries without them
- 2026-11-04, revised: the `/status` alias is removed, as the engineer directed; not re-checked
- 2026-11-05, revised: the commands are `/next-work` and `/next-work?`, a term swap the engineer settled; not re-checked
- 2026-11-05, revised: the commands are `/next` and `/next?` again, a term swap the engineer settled; not re-checked
- 2026-11-06, revised: `/sup?` is its alias, in place of "It has no alias"; not re-checked
- 2026-11-06, revised: the part that gives the next step is headed *What's next*, as point 7; re-checked: 13 directives, 12 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the direction to `/status-report` for the whole project, which "Those belong to `/status-report`" carries without naming the redirect
- 2026-11-06, revised: the command is `/report brief`, with the alias `/brief`, a term swap the engineer settled; not re-checked
- 2026-11-06, revised: each part's list is numbered from 1, as point 8; re-checked: 13 directives, 11 kept, 2 less precise, 0 lost, 0 repairs. Left less precise: the direction to `/status-report` for the whole project, which point 5 carries without naming the redirect, as before
- 2026-11-06, revised: point 8 numbers the items in one sequence through both parts; re-checked: 18 directives, 14 kept, 4 less precise, 0 lost, 0 repairs. Left less precise: the trigger's asking form, which the trigger line carries; the examples of a fact about the work; the direction to `/status-report`; and *a few lines*, which point 1 carries
- 2026-11-06, revised: point 8 numbers only the list of what was recently done, and gives the next step bullets; re-checked: 20 directives, 15 kept, 5 less precise, 0 lost, 0 repairs. Left less precise: the trigger's asking form, which the trigger line carries; the examples of a fact about the work; the reason for the numbers; the direction to `/status-report`; and *a few lines*, which point 1 carries
- 2026-11-07, revised: the command is `/brief`, its own command, in place of `/report brief` and its alias, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: the command is `/recent`, in place of `/brief`, a term swap the engineer settled; not re-checked

## History

Until Sat Nov 7 2026 the command was `/brief`, and this rule was named the-brief-report-says-what-was-recently-done-and-what-is-next. The engineer renamed the command `/recent`, and the rule with it.

Until Sat Nov 7 2026 the command was `/report brief`, with the alias `/brief`. The engineer made `/brief` a command of its own when `/items` replaced `/report`.

Until Fri Nov 6 2026 the rule did not say how each part's list is marked, and the lists were bulleted. For a time on that day each part's list was numbered from 1, and then the numbers ran in one sequence through both parts, before only the list of what was recently done was numbered.

Until Fri Nov 6 2026 the command was `/work-status`, with the alias `/sup?`, and this rule was named work-status-says-what-was-recently-done-and-what-is-next. The engineer renamed the command `/report brief`, with the alias `/brief`, and dropped both earlier names.

Until Fri Nov 6 2026 the rule named no heading for the part that gives the next step. The engineer then asked that it read *What's next*, not *What is next*.

Until Fri Nov 6 2026 the rule said `/work-status` had no alias. The engineer then made `/sup?` its alias.

On Thu Nov 5 2026 the commands were renamed `/next-work` and `/next-work?`, and then named `/next` and `/next?` again the same day.

On Wed Nov 4 2026 `/status` was an alias of `/work-status`, typed `/slasher:status` where Claude Code's own `/status` claimed the bare name. The engineer removed it the same day.

Related:

- the next-takes-the-next-step-of-the-work-under-way rule — what is next
- the a-status-report-prints-a-fixed-whole-project-report rule — the whole-project report, and the hidden records
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Wed Nov 4 2026 at 8:49:42 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 9:07:44 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 1:03:01 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:09:56 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:41:59 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:33 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:36:40 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:08:55 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:45:14 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:52:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:54:57 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:04:28 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:27:22 AM PT
