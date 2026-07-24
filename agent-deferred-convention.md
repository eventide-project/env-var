# `waytide/deferred/` — postponed design changes, a queue not a record

`waytide/deferred/` holds design changes that have been identified but intentionally **postponed until the current task is finished** — work that shouldn't interrupt the task in flight but must not be lost.

- **When to use:** a design or convention change surfaces mid-task that is real and worth doing, but acting on it now would derail the current work. Register it here and keep going.
- **Format:** the same frontmatter-free markdown as rules and observations — a `# <title>` stating the change, then prose. Include a `**Gated on:**` line naming what must finish before the item is actionable, plus short `**Why:**` and `**How to apply:**` lines. The filename follows the ISO-8601-UTC prefix convention (see the agent-file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Resolution:** when the gating task is done, act on the item, then **delete the file** — the change itself is put into code or rules, and an `waytide/log/` entry records that it was carried out. Deferred items are a queue, not a permanent record.
- **Recording one:** add the file; a matching `waytide/log/` entry is optional for the deferral itself but required when the item is resolved.

**Why:** a real improvement that surfaces mid-task is lost if not captured and disruptive if acted on immediately; a parked queue keeps it without derailing the task in flight. Deleting on resolution keeps the queue honest — what remains is exactly the outstanding work, not a history.

**How to apply:** when a worthwhile change surfaces mid-task, register it here with a `**Gated on:**` line and continue the task. When the gate clears, carry it out, delete the file, and log that it was done. Related: the decision-log rule and the agent-rules rule.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
