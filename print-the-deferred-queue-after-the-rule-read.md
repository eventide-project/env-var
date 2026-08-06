# Print the deferred queue as a list of rows, immediately after the rules are read

When the rules under `waytide/system/` and `waytide/local/rules/` have been read at the start
of a session, **print the deferred queue** before waiting for the developer's first real
request. It is the last thing the read produces.

**The form is a list, one row per item** under `waytide/local/deferred/` — not a rendered
table:

```
7 deferred items

- Ask whether the process is attended or unattended — 2026-08-01 — A batch-size trade:
  small-batch interruptions against big-batch rework cost.
- Package release rules — 2026-07-28 — Nothing settles how a release is made: the version
  schemes, the prompt, the commit message.
- Examine how Claude subagents support work with Waytide — 2026-07-28 — unranked — Whether a
  subagent is governed by the rules at all is the first question.
```

Each row carries three fields, in this order:

- **Title**, as the item's `# <title>` line states it.
- **Date**, from the ISO-8601-UTC filename prefix.
- **Summary** — one line saying what the item is about, read from the item.

**The rows are ordered by priority**, rank 1 first, from each item's `**Priority:**` line (see
the deferred-convention). The rank itself is not a fourth field — the order carries it, and
printing the number beside a row already in that position states it twice.

**Items with no rank sort last**, among themselves by filename prefix, oldest first, and are
**marked unranked**. The marking distinguishes an item awaiting a rank from one buried at the
bottom of the order.

**Where no item carries a rank, print in filename-prefix order and mark nothing.** This is the
state of every existing queue the moment a project refreshes the package, and of any project
that never ranks its items. Marking every row unranked says nothing and reads as a defect
rather than as a queue that has not been ranked. The marking is for the mixed case only.

**A row, not a table cell.** A rendered table fixes column widths against its widest cell, so
one long summary narrows the other two fields and wraps every row; the queue is read in a
terminal, where that turns a scannable list into a grid to be parsed. A row wraps as prose
and the fields stay in a fixed order, which is what a reader is actually using to scan.

**State the count.** The list is preceded by the number of items, so the size of
the queue is a fact the developer is given rather than one they count.

**An empty queue prints a line saying so.** It does not print an empty list and does not
print nothing. A queue that has been emptied is worth stating once; silence there would be
indistinguishable from the print having been skipped.

**This is not the session-start notice, and it is not an exception to the rule forbidding
one.** The announce-waytide-at-session-start rule prohibits the agent printing a **notice** —
the installation announcement the harness already emits, which an agent-printed copy would
duplicate. This is a different thing on a different surface:

- **The notice is emitted by a hook, which runs before the session.** It cannot report
  anything the session then does, and it renders every session regardless of context. A queue
  segment there would be present always, and a line that is always present is read once and
  never again.
- **This print happens after the read, inside the response that concludes it.** It is bounded
  to that one moment, it does not recur, and nothing about it competes with the notice.

**It is one of two things the agent prints around the read**, and the other is the **mark**,
at the read's head (see the initialization-rule). Both sit here
for the same reason: bounded to the read, printed once, and duplicating nothing the harness
emits. The queue is the closing bookend and the mark is the opening one.

**The agent reads the items, so nothing has to be machine-readable.** A script parsing
`waytide/local/deferred/` would need the `**Gated on:**` line in a fixed form to say anything
about what is actionable. The agent reads the prose, so the deferred convention's format is
unaffected by this rule.

**Why:** the deferred queue is where work goes so it is not lost, and it was the one working
directory nothing reported. The working directories are not read at session start, the
session-start notice covers only experiments and features that have not concluded, and the
`next-deferred-item` command reaches the queue only when someone thinks to ask — so an item
was surfaced only by deliberate looking. Printing it at the moment the rules are read costs
one list, once, at the point the developer is deciding what the session is for, which is
exactly when the queue is worth seeing. Putting it after the read rather than in the notice
is what keeps it from becoming furniture: the notice would carry it every session in the same
place, and the failure of a permanent line is that it stops being read.

**How to apply:** after reading the rule files at the start of a session, read
`waytide/local/deferred/` and print one row per item — title, date from the filename
prefix, and a one-line summary — ordered by the items' `**Priority:**` ranks with unranked
items last, and with the count stated. Where no item is ranked, order by filename prefix and
mark nothing. Where the queue is empty, print a
line saying so. Then wait for the developer's request. Do not print a Waytide installation
notice, which remains the harness's and is prohibited to the agent. Related: the
deferred-convention (the queue's format and its resolution step), the
next-deferred-item-command rule (the on-demand way into the queue), the status-report-format
rule (whose deferred table is a rendered table with a `kind` column, this one being neither),
the rules-convention (the read this follows), the
initialization-rule (the read's opening bookend), and the
announce-waytide-at-session-start rule (the notice this is not).

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:10:02 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:16:40 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:47:28 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:44:36 PM PT
