# `waytide/log/` — one file per decision, a one-line title

Record decisions made during sessions as one file per decision in `waytide/log/`.

- **Trigger:** detect — write an entry whenever a real decision is made (the user picks among alternatives, accepts or rejects an approach, or sets a rule that will guide future work). Don't wait to be asked. When in doubt, log it; over-logging is cheaper than under-logging here.
- **Filename:** the ISO-8601-UTC prefix convention (see the agent-file-names rule), computed with `date -u +%Y-%m-%dT%H-%M-%SZ`. Contributors are globally distributed, so UTC is mandatory — never local time.
- **Content:** one line — a `# <title>` that states the decision. No body, no template. Keep the title informative enough to skim. A log entry takes **no provenance footer** — it is the one working-state artifact exempt from the working-state-artifacts-carry-a-provenance-footer rule, because its one-line shape carries its author and time in the filename and commit already, and a footer would break that shape.
- **Commit:** include log entries in the same commit as the change they describe, or commit them separately with a `Log:` prefix. Don't sit on them.
- **The log is never consolidated on the agent's initiative.** Do not combine, merge, rewrite, or reformat log files, and do not propose doing so. The log is an append-only record of what was decided and when; consolidating it destroys that granular history. Consolidation happens **only on the explicit command of the user, and even then only after it is confirmed with the project's stakeholders**. One file per decision is the record, not a draft to be tidied later. For a readable overview of the log, ask Claude for a **summary** — a projection generated at read-time — rather than consolidating the files; the summary reads the record without destroying it.

**Why:** the reasoning and decisions of a project are easy to lose and expensive to reconstruct; a one-line-per-decision log, committed alongside the code, keeps a skimmable, durable record without the overhead of a template. Detecting and logging without being asked keeps the record complete rather than sampled.

**How to apply:** when a decision is made, write a titled one-line entry under `waytide/log/` with a UTC filename, and commit it with the change (or with a `Log:` prefix). Related: the agent-file-names rule (the shared filename convention), the agent-rules rule (a new rule pairs with a log entry), and the observations and deferred rules (their recording and resolution steps log too).

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
