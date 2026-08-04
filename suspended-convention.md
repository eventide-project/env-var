# `waytide/local/suspended/` — an undo queue for what the project stopped doing

`waytide/local/suspended/` holds things the project **stopped doing** and set aside rather than
deleted: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a step
that costs more than it protects. Anything the project stopped doing can be suspended, and
anything suspended can be **restored**.

**It is an undo queue, in the sense the Command Pattern means.** Each suspended thing carries
what it takes to **reverse its own suspension** — not merely a copy of itself, but the
information needed to put the world back as it was. Suspending is the command; the record is
what makes it undoable.

- **The thing itself moves.** The file is moved into `waytide/local/suspended/`, not copied and
  not deleted. Its content stays readable where a reader can find it, rather than being
  recoverable only by someone who knows to look in git and what to look for.
- **It gains a reason and a resumption note.** The reason states why it was set aside — what it
  cost, what it stopped buying. The resumption note states **what would bring it back**, which
  is the question a later reader actually has.

## The return address is canonical lines

A suspended file opens with the lines that say where it came from and what it takes to put it
back:

```
- **Origin:** waytide/system/foundation/some-rule.md
- **Kind:** rule
- **Suspended:** 2026-08-03T03-23-08Z
- **Reconciliations:**
  - waytide/system/foundation/other-rule.md — dropped from its Related list
  - waytide/system/foundation/README.md — its summary line removed
```

- **`**Origin:**`** — where the file came from, so restoring puts it back rather than somewhere
  plausible.
- **`**Kind:**`** — what it was, since restoring a rule, a script, and a report are not the same
  act.
- **`**Suspended:**`** — when, in the ISO-8601-UTC form.
- **`**Reconciliations:**`** — **the rest of the undo**, one entry per file changed and what was
  done to it. Setting something aside is never one file moving: removing a rule means dropping
  it from the Related lists that cite it and from the package README's summary, per the
  rules-convention. Those edits are part of the command, and a restore that does not reverse
  them leaves the thing back in place and uncited.

**This is the recognizable-content form the system already uses.** The experiments-convention
and features-convention define a canonical `**State:**` line that `session-start.sh` reads
mechanically, and the deferred queue carries `**Gated on:**` and `**Priority:**` the same way. A
bold label, a colon, a value, optionally as a list item — one protocol across the system rather
than a second one for this directory. Frontmatter is allowed and would also serve; it is not
used here because there is no reason to introduce a second form where the existing one fits.

**Suspension is not deletion, and restoration is not re-invention.** A thing deleted is
reconstructed later from memory and argument, and comes back different. A thing suspended comes
back as it was, with the record of why it left — which is what makes reconsidering it cheap
enough to actually happen.

**Suspension is recorded in the decision log**, like any decision, and so is restoration. The
suspended file is the artifact; the log entry is the fact that it happened.

**Why:** conventions accumulate and rarely leave. A rule that has stopped earning its keep is
ordinarily either endured, because removing it feels like losing something, or deleted, after
which reconsidering it means reconstructing it from nothing. Both outcomes are bad, and the
second is why the first happens. A reversible middle state makes setting something aside a small
act rather than a final one — the cost of being wrong is a restore rather than a rewrite — which
is what lets a project prune ceremony at the rate it accumulates it. Recording the reconciliations
is what makes the reversal real: without them, restoring returns a file and leaves the system
still arranged around its absence.

**How to apply:** when something the project does has stopped earning its keep, move it into
`waytide/local/suspended/`, add the `**Origin:**`, `**Kind:**`,
`**Suspended:**`, and `**Reconciliations:**` lines, and write the reason and what would bring it
back. Log the suspension. To restore, reverse each reconciliation, move the file back to its
`**Origin:**`, remove the return-address lines, and log that too. Do not delete what can be suspended, and do
not suspend what was never in use — that is not a reversal of anything. Related: the
rules-convention (removing a rule, and the reconciliation a suspension must record), the
deferred-convention (the other queue, which deletes on resolution rather than keeping),
the decision-log rule, and the file-names rule (the ISO-8601-UTC prefix a suspended file keeps).

---

Authored by Scott Bellware on Sun Aug 2 2026 at 8:23:08 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:26:41 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:28:55 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:33:47 PM PT
