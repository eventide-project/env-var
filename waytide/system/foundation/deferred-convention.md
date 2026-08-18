# `waytide/local/deferred/` — postponed design changes, a queue not a record

Some work should not interrupt the task in progress, and must not be lost. `waytide/local/deferred/` holds it, **postponed until the current task is finished**.

- **When to use:** a design or convention change surfaces mid-task that is real and worth doing, but acting on it now would derail the current work. Register it here and keep going.
- **Format:** the same frontmatter-free markdown as rules and observations — a `# <title>` stating the change, then prose. Include a `**Waits for:**` line naming what must finish before the item is actionable, plus short `**Why:**` and `**How to apply:**` lines. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Priority:** an item may carry a **`**Priority:**` line** holding its rank in the queue — `- **Priority:** 3`. Ranks are **1 through N, contiguous**, one item per number: rank 1 is worked next. The queue is printed in this order at the start of every session (see the print-the-deferred-queue-after-the-rule-read rule).
  - **Renumbering is the cost, and it is accepted.** Inserting an item at a given rank moves every item below it, so a change of priority is a change to several files. That is the cost of each item stating its own position in a form that reads exactly as the order the engineer gave. A queue whose order is legible from any single item, rather than held somewhere else and applied to it.
  - **An item may carry no rank, and that is not a defect.** An item is registered mid-task, which is when its material is at hand and when a ranking decision is exactly what the engineer is deferring. An unranked item **sorts last and prints as unranked**, so it is visible as awaiting a rank rather than silently buried at the bottom. **Unranked items sort among themselves by their filename prefix**, oldest first — the order the queue had before ranking existed.
  - **A queue where nothing is ranked is ordinary, and is not marked.** Every existing queue is in this state the moment a project refreshes the package, and a project may simply never rank its items. Where **no** item carries a rank, the queue prints in filename-prefix order with **no unranked marking at all** — marking every row says nothing. A queue that reads as entirely unranked looks like a defect rather than a project that has not adopted ranking. The marking appears only where **some** items are ranked and others are not, which is the only case in which it distinguishes anything.
  - **Rank is not the wait.** `**Waits for:**` says what must finish before an item is *actionable*. Priority says what to work *next* among those that are. An item that is waiting may still be ranked, and a rank does not clear a wait.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Resolution:** when the task the item waits for is done, act on the item, then **delete the file** — the change itself is put into code or rules, and an `waytide/local/log/` entry records that it was carried out. Deferred items are a queue, not a permanent record.
- **An item's own content is point-in-time and is not maintained.** What an item says was true when
  it was written. It names the work that was in progress, the rules as they stood, and the artifacts
  that existed. **A reference inside an item that time has overtaken is not a defect and is not
  chased.** An item that waits for an experiment does not stop being correct when that experiment is
  superseded, because it records what it was waiting for. This is the same standing every other
  Waytide record has. What makes an item a queue entry rather than a permanent record is that it is
  **deleted when it is resolved**, not that its content is kept current.
- **The reconciliation below is about artifacts pointing at an item, never about an item's own
  content.** The two are different directions and only one is chased.
- **Before deleting, reconcile what points at the item.** Search for the item's name and correct the **live, forward-looking** artifacts that cite it — another deferred item, an observation, a plan, a design — since those are read as current. Write the correction as the name, `(deleted)`, and what the item decided: *the pending-release republish item (deleted) — carried out 2026-07-20: all seven component repositories were republished from the package layout*. The two parts are needed: without the mark the name reads as a live pointer, and without the decision the mark leaves a name that cannot be looked up. Where the item was **discarded** rather than carried out, say so and point at its log entry, which is the only durable trace.
- **Leave historical records alone**, unless one discloses what should not have been disclosed — the one exception, in the disclosure-is-the-one-reason-to-edit-a-historical-record rule. A work session record, an experiment record, or a log entry states what was true when it was written, and its date is on its face. Do not correct one, and do not annotate one either — an annotation is a live pointer added to a historical record, and it has to be maintained like any other. The one broken reference this convention has produced was an annotation of exactly that kind. A reader who follows an unresolvable reference in an old record uses git.
- **The search happens at deletion. There is no standing check.** A `[[link]]` to a nonexistent file is findable mechanically, but most references are prose or file paths and are not. Searching for the name at the moment of deletion is targeted, raises no false matches on prose that merely shows what a link looks like, and is done by the person who knows what the item became.
- **Recording one:** add the file. A matching `waytide/local/log/` entry is optional for the deferral itself but required when the item is resolved.
- **The queue is printed at the start of every session**, as a list of rows, immediately after the rules are read — see the print-the-deferred-queue-after-the-rule-read rule. That is what keeps a parked item from being lost by being unread. This convention's job is only that the item is written down and eventually resolved.

**Why:** a real improvement that surfaces mid-task is lost if not captured and disruptive if acted on immediately. A parked queue keeps it without derailing the task in progress. Deleting on resolution keeps the queue honest — what remains is exactly the outstanding work, not a history.

**How to apply:** when a worthwhile change surfaces mid-task, register it here with a `**Waits for:**` line. Continue the task. Leave an item's own content as written — a reference in it that time has overtaken is not a defect.

When the wait ends, carry it out. Search for what cites the item, and correct the live artifacts among them. Then delete the file, and log that it was done. Leave historical records as written.

Related:

- the decision-log rule
- the rules-convention — which carries the same reconciliation for a removed rule, and the instruction to reference a rule by name rather than by path
- the observations-convention — whose promotion keeps the record rather than deleting it, so it strands nothing

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 3:48:36 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:10:02 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:16:40 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 7:07:39 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:42:20 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 3:22:51 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:45:19 PM PT
