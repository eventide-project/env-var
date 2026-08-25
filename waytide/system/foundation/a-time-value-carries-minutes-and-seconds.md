# A time value carries minutes and seconds

Wherever a datetime written into a file includes a **time of day**, that time is written to **seconds**. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.

The rule governs the **resolution** of the time and nothing else. Which fields precede it, whether it is local or UTC, and how it is punctuated are each settled by the convention that specifies the datetime. This rule only fixes how finely the time is resolved when one is written.

The two datetime conventions in this package satisfy it:

- The **ISO-8601-UTC filename prefix** — `2026-07-01T20-40-00Z-some-name.md` — already carried seconds (see the file-names rule).
- The **provenance footer** — `Mon Jan 1 2026 at 3:45:12 PM PT` — carries them because this rule requires it (see the record-rule-authorship-in-a-footer rule).

**A date alone is not a time.** A convention may record only a date, as a design's **Settled** resolutions do. There is no time of day to resolve there, and this rule adds none. It applies when a time is written.

**A record's title is one of two exceptions.** A dated record title is written `Mon Jan 1 2026 18:06` — 24-hour, minutes, no seconds (see the record-title-date-format rule). The defect this rule corrects is a **repeated line within one file**: a running history whose entries collide at the same resolution. A later one cannot be told from the one before it and goes unwritten rather than looking like a duplicate.

The record's filename already carries the seconds-precise UTC instant for the same moment. A title occurs **once** per file, so that collision cannot arise there. The exception is bounded to titles and reaches no other written time.

**A journal entry's filename stamp is the second.** It stops at the minute, and carries seconds only where the writer stated seconds (see the `journal` package's journal-entries rule). The same collision argument applies, since a journal is one file per entry rather than a running history inside one. What that rule adds is a second ground: the entry's own time is the writer's to state, and a clock's seconds are not a value they gave.

**Both exceptions are named here, and a third is not assumed.** Each is stated in the rule that takes it, and each argues from what this rule's defect does not reach. A format wanting a third states its own case the same way.

**A recorded datetime is never revised to a resolution it never had.** The minutes and seconds of a past event are not recoverable, and supplying them would falsify the record. So this rule reaches **new values only**. Coarser values already written stay as they are. That includes where a convention independently forbids rewriting them, as the provenance footer's running history does.

**Why:** a timestamp is useful only while its resolution stays finer than the rate of what it records. Hour resolution had already fallen below that on the provenance footer. Two edits an hour apart were indistinguishable. An edit made in the same hour as the one before it produced a line identical to its predecessor.

That reads as an error rather than as provenance, so the entry went unwritten instead of being recorded. A format that cannot express its own instances is a defect rather than merely a coarse decision. Minutes and seconds remove it at every scale a person actually works at, for the cost of a few characters.

**How to apply:** when writing a datetime that includes a time of day, write the seconds. That holds for a rule, a working-state artifact, a log entry, and any other file. When specifying a new datetime format, specify it to seconds. Leave date-only conventions as they are, and do not revise a datetime already recorded at a coarser resolution. Related:

- the record-rule-authorship-in-a-footer rule — the human-readable local datetime this corrects
- the file-names-use-iso8601-utc-prefix rule — the machine-sortable UTC filename prefix
- the working-state-artifacts-carry-a-provenance-footer rule — the artifacts that carry a footer
- the `journal` package's journal-entries rule — the second exception, and its own grounds for it

---

Authored by Scott Bellware on Sun Jul 26 2026 at 11:53:08 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:41:09 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:42:20 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
