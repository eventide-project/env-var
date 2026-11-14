# The logs directory holds the contemporaneous, historical records

**Trigger:** When writing a record under local/logs/ or deciding which directory a new kind of record belongs in

**A project keeps more than one contemporaneous, historical record, and they sit together.** `slasher/local/logs/` holds them:

- **`slasher/local/logs/log/`** — the log, one file per entry, a one-line title (`the-log-holds-one-file-per-entry-with-a-one-line-title`).
- **`slasher/local/logs/loops/`** — the loop records, one file per feature, the cycles through the loop (`design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule).
- **`slasher/local/logs/work-sessions/`** — the narrative record of a work session (`the-work-sessions-directory-holds-one-record-per-work-session`).

**What makes a record belong here is that it accrues chronologically and is never revised.** Each is a running account of something that happened, entry after entry, in the order it happened. A reader reaches one by date. Nothing here is a statement of what is currently true, which is what separates these from an item, an implementation record, or a migration record.

**A migration record is not one of these, and the distinction is the sharpest test of the rule.** It is one document rather than entries that accrue, it is revised while the migration runs, and it is **prospective** — a sequence of steps written to be executed. The three records above are retrospective accounts of what happened. That a migration record is *kept* afterward makes it durable, not chronological, and durability is not what this directory is for.

**The three keep their own names and their own conventions.** This rule groups them and settles nothing else. `log` stays `log` rather than becoming `decisions`, because every rule that says *write a log entry* means that directory and a rename would reach all of them for nothing.

## A fourth contemporaneous, historical record goes here

**A convention that adds one names its directory under `slasher/local/logs/`.** That is the whole of what this rule asks of a later convention.

## The grouping crosses a package boundary, and does not invert it

**`logs/loops/` is contributed by `design-by-efferent`**, which includes `foundation` rather than the reverse. Foundation names the parent directory here, and that is a **citation** — it requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it. A project installing `foundation` alone has `logs/log/` and no `logs/loops/`, and nothing is missing.

**Why:** the three were siblings of `items/`, `implementations/`, and `migration/` under `slasher/local/`, which put a chronological account beside a statement of current state and made the directory listing say nothing about which was which. Grouping them says it in the path.

The grouping also gives a later contemporaneous, historical record somewhere obvious to go, in a place that names it as the same kind of thing as the others.

**How to apply:** write a decision entry to `slasher/local/logs/log/`, a loop record to `slasher/local/logs/loops/`, and a work session record to `slasher/local/logs/work-sessions/`. Put a contemporaneous, historical record this rule does not name under `slasher/local/logs/` too, and say so in the convention that adds it.

## Compressed

1. `slasher/local/logs/` holds the project's contemporaneous, historical records, together. Every record here takes the ISO-8601-UTC prefix of the file-names rule.
2. `slasher/local/logs/log/` holds the log, one file per entry, with a one-line title (`the-log-holds-one-file-per-entry-with-a-one-line-title`).
3. `slasher/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop (`design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule).
4. `slasher/local/logs/work-sessions/` holds the narrative record of a work session (`the-work-sessions-directory-holds-one-record-per-work-session`).
5. Write a decision entry to `slasher/local/logs/log/`.
6. Write a loop record to `slasher/local/logs/loops/`.
7. Write a work session record to `slasher/local/logs/work-sessions/`.
8. A record belongs here only when it accrues chronologically and is never revised.
9. Each record here is a running account, entry after entry, in the order things happened, and it is reached by date.
10. Nothing here states what is currently true. Items, implementation records, and migration records do not belong here.
11. A migration record does not belong here. It is one document, revised while the migration runs, and prospective: steps written to be executed.
12. Keeping a record afterward makes it durable, not chronological. Durability does not qualify a record for this directory.
13. The three records keep their own names and their own conventions. This rule only groups them.
14. `log` stays `log`. Do not rename it to `decisions`, because every rule that says *write a log entry* means that directory.

## A fourth contemporaneous, historical record goes here

1. Put a contemporaneous, historical record this rule does not name under `slasher/local/logs/` too.
2. The convention that adds it names its directory under `slasher/local/logs/`.
3. That is all this rule asks of a later convention.

## The grouping crosses a package boundary, and does not invert it

1. `logs/loops/` is contributed by `design-by-efferent`, which includes `foundation`, not the reverse.
2. Foundation's naming of `logs/loops/` is only a citation.
3. Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it.
4. A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing.

## Compression

- 2026-10-24, compressed: compression 0.19, change 0.55, solubility 40 → 73, clarity 0.27 → 0.82, 14 directives, 14 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-27, re-checked: 14 directives, 12 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-27, revised: the log is one file per entry, of short entries, not one line or one file per decision, a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 73 → 70, clarity 0.82 → 0.85; checked: 13 directives, 11 kept, 2 less precise, 0 lost

## History

A migration record was moved here on 2026-08-18 and moved back out the same day.

Until Sun Oct 25 2026 this rule was named logs-directory and titled "`waytide/local/logs/` — the running records, grouped".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Mon Oct 26 2026 this rule was named the-logs-directory-groups-the-running-records and titled "The logs directory groups the running records".

Until 2026-08-18 `log/` was the only log directory.

Until Tue Oct 27 2026 this rule said the log holds one file per decision. Not every entry records a decision, so the engineer settled that it holds one file per entry.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule, the the-work-sessions-directory-holds-one-record-per-work-session rule, and `design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — the three records this groups
- the the-migration-directory-holds-the-plans-for-moving-or-restructuring-content rule — the record that is not one of these, and why
- the file-names rule — the ISO-8601-UTC prefix every record here takes

---

Authored by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:13:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:16:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 10:02:47 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
