# A time value carries minutes and seconds

Wherever a datetime written into a file includes a **time of day**, that time is
written to **seconds** — `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.

The rule governs the **resolution** of the time and nothing else. Which fields
precede it, whether it is local or UTC, and how it is punctuated are each settled
by the convention that specifies the datetime; this rule only fixes how finely the
time is resolved when one is written.

The two datetime conventions in this package both satisfy it:

- The **ISO-8601-UTC filename prefix** — `2026-07-01T20-40-00Z-some-name.md` —
  already carried seconds (see the file-names rule).
- The **provenance footer** — `Mon Jan 1 2026 at 3:45:12 PM PT` — carries them
  because this rule requires it (see the record-rule-authorship-in-a-footer rule).

**A date alone is not a time.** Where a convention records only a date — a design's
**Settled** resolutions, for instance — there is no time of day to resolve, and this rule
adds none. It applies when a time is written.

**A record's title is the one exception.** A dated record title is written
`Mon Jan 1 2026 18:06` — 24-hour, minutes, no seconds (see the record-title-date-format
rule). The defect this rule corrects is a **repeated line within one file**: a running
history whose entries collide at the same resolution, so a later one cannot be told from
the one before it and goes unwritten rather than looking like a duplicate. A title occurs
**once** per file, so that collision cannot arise there — and the seconds-precise UTC
instant for the same moment is already carried by the record's filename. The exception is
bounded to titles and reaches no other written time.

**A recorded datetime is never revised to a resolution it never had.** The minutes
and seconds of a past event are not recoverable, and supplying them would falsify
the record. So this rule reaches **new values only**, and coarser values already
written stay as they are — including where a convention independently forbids
rewriting them, as the provenance footer's running history does.

**Why:** a timestamp is useful only while its resolution stays finer than the rate
of what it records, and hour resolution had already fallen below that on the
provenance footer. Two edits an hour apart were indistinguishable, and an edit made
in the same hour as the one before it produced a line identical to its predecessor —
which reads as an error rather than as provenance, so the entry went unwritten
instead of being recorded. A format that cannot express its own instances is a
defect, not merely a coarse choice, and minutes and seconds remove it at every
scale a person actually works at for the cost of a few characters.

**How to apply:** when writing a datetime that includes a time of day — into a rule,
a working-state artifact, a log entry, or any other file — write the seconds. When
specifying a new datetime format, specify it to seconds. Leave date-only conventions
as they are, and do not revise a datetime already recorded at a coarser resolution.
Related: the record-rule-authorship-in-a-footer rule (the human-readable local
datetime this corrects), the file-names-use-iso8601-utc-prefix rule (the
machine-sortable UTC filename prefix), and the
working-state-artifacts-carry-a-provenance-footer rule (the artifacts that carry a
footer).

---

Authored by Scott Bellware on Sun Jul 26 2026 at 11:53:08 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:41:09 AM PT
