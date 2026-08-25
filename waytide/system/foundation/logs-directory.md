# `waytide/local/logs/` — the running records, grouped

**A project keeps more than one running record, and they sit together.** `waytide/local/logs/` holds them:

- **`waytide/local/logs/log/`** — the decision log, one file per decision, a one-line title (`decision-log-convention`).
- **`waytide/local/logs/loops/`** — the loop records, one file per feature, the cycles through the loop (`design-by-efferent`'s loop-records rule).
- **`waytide/local/logs/work-sessions/`** — the narrative record of a work session (`work-sessions-convention`).

**What makes a record belong here is that it accrues chronologically and is never revised.** Each is a running account of something that happened, entry after entry, in the order it happened. A reader reaches one by date. Nothing here is a statement of what is currently true, which is what separates these from an idea, an implementation record, or a migration record.

**A migration record is not one of these, and the distinction is the sharpest test of the rule.** It was moved here on 2026-08-18 and moved back out the same day. It is one document rather than entries that accrue, it is revised while the migration runs, and it is **prospective** — a sequence of steps written to be executed. The three records above are retrospective accounts of what happened. That a migration record is *kept* afterward makes it durable, not chronological, and durability is not what this directory is for.

**The three keep their own names and their own conventions.** This rule groups them and settles nothing else. `log` stays `log` rather than becoming `decisions`, because every rule that says *write a log entry* means that directory and a rename would reach all of them for nothing.

## A fourth running record goes here

**A convention that adds one names its directory under `waytide/local/logs/`.** That is the whole of what this rule asks of a later convention.

## The grouping crosses a package boundary, and does not invert it

**`logs/loops/` is contributed by `design-by-efferent`**, which includes `foundation` rather than the reverse. Foundation names the parent directory here, and that is a **citation** — it requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it. A project installing `foundation` alone has `logs/log/` and no `logs/loops/`, and nothing is missing. See the a-citation-is-not-a-dependency rule.

**Why:** the three were siblings of `ideas/`, `implementations/`, and `migration/` under `waytide/local/`, which put a chronological account beside a statement of current state and made the directory listing say nothing about which was which. Grouping them says it in the path.

The grouping also gives a later running record somewhere obvious to go. `log` was the only log directory until 2026-08-18, and a second one had no place that named it as the same kind of thing.

**How to apply:** write a decision entry to `waytide/local/logs/log/`, a loop record to `waytide/local/logs/loops/`, and a work session record to `waytide/local/logs/work-sessions/`. Put a running record this rule does not name under `waytide/local/logs/` too, and say so in the convention that adds it.

Related:

- the decision-log-convention, the work-sessions-convention, and `design-by-efferent`'s loop-records rule — the three records this groups
- the migration-convention — the record that is not one of these, and why
- the a-citation-is-not-a-dependency rule — why naming `logs/loops/` here is not a dependency
- the file-names rule — the ISO-8601-UTC prefix every record here takes

---

Authored by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
