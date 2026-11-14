# A time value carries minutes and seconds

Wherever a datetime written into a file includes a **time of day**, that time is written to **seconds**. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.

The rule governs the **resolution** of the time and nothing else. Which fields precede it, whether it is local or UTC, and how it is punctuated are each settled by the convention that specifies the datetime. This rule only fixes how finely the time is resolved when one is written.

The two datetime conventions in this package satisfy it:

- The **ISO-8601-UTC filename prefix** — `2026-07-01T20-40-00Z-some-name.md` — already carried seconds (see the file-names rule).
- The **provenance footer** — `Mon Jan 1 2026 at 3:45:12 PM PT` — carries them because this rule requires it (see the record-a-rules-authorship-in-a-provenance-footer rule).

**A date alone is not a time.** A convention may record only a date, as a design's **Settled** resolutions do. There is no time of day to resolve there, and this rule adds none. It applies when a time is written.

**A record's title is one of two exceptions.** A dated record title is written `Mon Jan 1 2026 18:06` — 24-hour, minutes, no seconds (see the a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time rule). The defect this rule corrects is a **repeated line within one file**: a running history whose entries collide at the same resolution. A later one cannot be told from the one before it and goes unwritten rather than looking like a duplicate.

The record's filename already carries the seconds-precise UTC instant for the same moment. A title occurs **once** per file, so that collision cannot arise there. The exception is bounded to titles and reaches no other written time.

**A journal entry's filename stamp is the second.** It stops at the minute, and carries seconds only where the writer stated seconds (see the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule). The same collision argument applies, since a journal is one file per entry rather than a running history inside one. What that rule adds is a second ground: the entry's own time is the writer's to state, and a clock's seconds are not a value they gave.

**Both exceptions are named here, and a third is not assumed.** Each is stated in the rule that takes it, and each argues from what this rule's defect does not reach. A format wanting a third states its own case the same way.

**A recorded datetime is never revised to a resolution it never had.** The minutes and seconds of a past event are not recoverable, and supplying them would falsify the record. So this rule reaches **new values only**. Coarser values already written stay as they are. That includes where a convention independently forbids rewriting them, as the provenance footer's running history does.

**Why:** a timestamp is useful only while its resolution stays finer than the rate of what it records. Hour resolution had already fallen below that on the provenance footer. Two edits an hour apart were indistinguishable. An edit made in the same hour as the one before it produced a line identical to its predecessor.

That reads as an error rather than as provenance, so the entry went unwritten instead of being recorded. A format that cannot express its own instances is a defect rather than merely a coarse decision. Minutes and seconds remove it at every scale a person actually works at, for the cost of a few characters.

**How to apply:** when writing a datetime that includes a time of day, write the seconds, except where this rule names an exception. That holds for a rule, a working-state artifact, a log entry, and any other file. When specifying a new datetime format, specify it to seconds. Leave date-only conventions as they are, and do not revise a datetime already recorded at a coarser resolution.

## History

Until 2026-10-25 How to apply said to write the seconds in every datetime that includes a time of day, naming no exception, while the body names two: a dated record title and a journal entry's filename stamp. The engineer settled that How to apply points to the exceptions the rule names, without listing them. The `Related:` label had also run into the end of How to apply's paragraph, and now stands on its own line.

Related:

- the record-a-rules-authorship-in-a-provenance-footer rule — the human-readable local datetime this corrects
- the dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not rule — the machine-sortable UTC filename prefix
- the working-state-artifacts-carry-a-provenance-footer rule — the artifacts that carry a footer
- the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the second exception, and its own grounds for it

## Compressed

1. When a datetime written into a file includes a time of day, write that time to seconds.
2. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.
3. This rule governs only the time's resolution.
4. The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation.
5. The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds (see the file-names rule).
6. The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it.
7. A date alone is not a time. A date-only convention, such as a design's **Settled** resolutions, gets no time added.
8. This rule applies only when a time is written.
9. A record's title is the first exception. A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds (see the a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time rule).
10. The title exception covers titles only. It reaches no other written time.
11. A journal entry's filename stamp is the second exception. It stops at the minute (see the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule).
12. A journal filename stamp carries seconds only where the writer stated seconds. Do not supply a clock's seconds.
13. Only these two exceptions exist. Do not assume a third.
14. A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach. The defect is a repeated line within one file, whose entries collide at the same resolution.
15. Never revise a recorded datetime to a resolution it never had, and do not supply minutes or seconds for a past event. Supplying missing minutes or seconds would falsify the record.
16. This rule applies to new values only. Leave coarser values already written as they are.
17. When specifying a new datetime format that includes a time of day, specify it to seconds.
18. This applies to rules, working-state artifacts, log entries, and any other file, except where this rule names an exception.

## Compression

- 2026-10-24, compressed: compression 0.48, change 0.72, solubility 30 → 78, clarity 0.26 → 0.77, 14 directives, 14 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-25, revised: point 18 takes "except where this rule names an exception"; not checked
- 2026-10-27, re-checked: 14 directives, 13 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 78 → 69, clarity 0.77 → 0.75; checked: 14 directives, 14 kept, 0 less precise, 0 lost

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
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:13:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:10 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:52:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:05:00 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:58 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
