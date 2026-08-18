# The deferred queue is every idea tagged `[deferred]` — a queue held in the ideas directory, not a directory of its own

Some work should not interrupt the task in progress, and must not be lost. **Register it as an
idea tagged `[deferred]`** and keep going. The queue is exactly the ideas carrying that tag.

**When to use it:** a change surfaces mid-task that is real and worth doing, but acting on it now
would derail the current work.

**It is an ordinary idea** — the ideas-convention governs its directory, its filename, its
`**State:**` line, its footer, and its log entry. This rule adds only what makes it a queue.

## The tag is the queue membership

**`[deferred]` is a reserved tag.** The queue is read from it mechanically, so a project does not
repurpose the word. Every other tag on the idea stays what it was.

**The tag comes off when the item leaves the queue**, and that is what keeps the queue honest —
what carries the tag is exactly the outstanding work. **The record itself is kept**, with its
state changed to `Realized`, `Abandoned`, or `Lapsed` like any other idea's. A log entry records
that it was carried out.

**Nothing is deleted, so nothing is stranded.** This convention required a search for every
artifact citing an item before the item's file was removed, because removal left the citations
pointing at nothing. Keeping the record retires that search entirely: a citation still resolves,
and the state line says what became of the thing cited. That was the largest part of the old
convention and it is gone rather than moved.

**The tag is independent of the state.** A queued item is `Open` where its thinking is unsettled
and `Active` where it settles something and the work is outstanding. `Deferred` is a state of its
own, meaning parked indefinitely, and it is **not** what puts an idea in the queue. An idea may
carry the tag and that state at once — queued, and not expected soon.

## `**Waits for:**`

**An item states what must finish before it is actionable**, on a `**Waits for:**` line. That is
the whole of what the line does. It does not say what to work next.

## `**Priority:**`

An item may carry a **`**Priority:**` line** holding its rank in the queue — `- **Priority:** 3`.
Ranks are **1 through N, contiguous**, one item per number: rank 1 is worked next. The queue is
printed in this order at the start of every session (see the
print-the-deferred-queue-after-the-rule-read rule).

**Renumbering is the cost, and it is accepted.** Inserting an item at a given rank moves every
item below it, so a change of priority is a change to several files. That is the cost of each item
stating its own position in a form that reads exactly as the order the engineer gave — a queue
whose order is legible from any single item, rather than held somewhere else and applied to it.

**An item may carry no rank, and that is not a defect.** An item is registered mid-task, which is
when its material is at hand and when a ranking decision is exactly what the engineer is
deferring. An unranked item **sorts last and prints as unranked**, so it is visible as awaiting a
rank rather than silently buried at the bottom. **Unranked items sort among themselves by their
filename prefix**, oldest first.

**A queue where nothing is ranked is ordinary, and is not marked.** Every existing queue is in
this state the moment a project refreshes the package, and a project may simply never rank its
items. Where **no** item carries a rank, the queue prints in filename-prefix order with **no
unranked marking at all** — marking every row says nothing, and a queue that reads as entirely
unranked looks like a defect rather than a project that has not adopted ranking. The marking
appears only where **some** items are ranked and others are not, which is the only case in which
it distinguishes anything.

**Rank is not the wait.** `**Waits for:**` says what must finish before an item is *actionable*.
Priority says what to work *next* among those that are. An item that is waiting may still be
ranked, and a rank does not clear a wait.

## An item's content is point-in-time

**What an item says was true when it was written.** It names the work that was in progress, the
rules as they stood, and the artifacts that existed. **A reference inside an item that time has
overtaken is not a defect and is not chased.** An item that waits for an experiment does not stop
being correct when that experiment is superseded, because it records what it was waiting for. That
is the same standing every other Waytide record has, and it is the ordinary amend-by-dated-addition
practice the ideas-convention states.

**Why:** a real improvement that surfaces mid-task is lost if not captured and disruptive if acted
on immediately. Parking it keeps it without derailing the task in progress.

A separate directory
was never what made it a queue. What made it a queue was the wait, the rank, and the print at
session start, and each of those is carried by the item itself. One directory holds the project's
thinking whatever its status, and a tag says which of it is waiting its turn.

Deleting on resolution was the old convention's way of keeping the queue honest, and it cost a
reconciliation search on every deletion. Removing the tag does the same job for nothing.

**How to apply:** when a worthwhile change surfaces mid-task, write it as an idea in
`waytide/local/ideas/`, tagged `[deferred]`, with a `**Waits for:**` line. Continue the task.

When the wait ends, carry it out. Remove the `[deferred]` tag, set the state to what the work
reached, rename the file to match, and log that it was done. Leave the item's own content as
written — a reference in it that time has overtaken is not a defect.

Related:

- the ideas-convention — the record this is one of, and everything about it this rule does not add
- the print-the-deferred-queue-after-the-rule-read rule — the queue printed at the start of every
  session
- the next-deferred-item-command rule — the on-demand way into the queue
- the a-record-takes-category-tags rule — the tags, and what a reserved tag is
- the a-suspension-is-a-log-entry rule — the other reserved tag, which marks a log entry rather
  than an idea
- the decision-log-convention — the entry a resolution writes

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
