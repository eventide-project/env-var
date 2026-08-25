# A date in a record's title is written `Mon Jan 1 2026 18:06`

A working-state record's **title** may carry a date, as the work session record's `# Work Session — <name> (<date>)` does. In that record and any other whose title is dated, the date is written as:

```
Mon Jan 1 2026 18:06
```

Day-of-week, month, day, year, then the time as 24-hour hours and minutes. No `at`, no AM/PM, no seconds.

- **The time is the author's local time**, like the provenance footer's — an in-file date is written for a person to read. The form carries no timezone marker, so a reader takes it as local to whoever wrote the record. The footer beneath it names the zone, and the filename prefix carries the timezone-explicit instant.
- **The moment is the record's authoring time** — the same instant its ISO-8601-UTC filename prefix records, rendered in local time. For a record covering work that spanned more than one day, the title still names the single moment the record was written, not a range.
- **This is a third date format, and the three do not overlap.** The **filename** prefix is machine-sortable and UTC (`2026-07-24T18-16-22Z-…`, see the file-names rule). The **provenance footer** is human-readable local time with a zone abbreviation (`Fri Jul 24 2026 at 11 AM PT`, see record-rule-authorship-in-a-footer). The **title** is this form: compact, local, minute-precise. Each is used where it is specified and nowhere else.

- **It is the one exception to the seconds rule.** Every other datetime written into a file carries its time of day to seconds (see the a-time-value-carries-minutes-and-seconds rule). A title does not, and the exception is narrow. That rule exists because a running history's entries collide at a coarse resolution and the later one goes unwritten. A title appears once per file, so nothing can collide with it. The filename beside it already carries the same instant to the second, in UTC.

**Why:** a title is the first thing read, and the line a record is referred to by. So its date wants to be compact and precise at once. A bare month and year is too coarse to distinguish two records from the same day. The footer's `at 11 AM PT` form is too long to sit inside a title alongside the record's name.

Minute-precise 24-hour time is the shortest rendering that separates records written hours apart. Local time is chosen for the same reason the footer uses it. The title is for a reader, and the UTC instant is already carried, unambiguously, by the filename.

**How to apply:** when writing a record whose title takes a date, render it `Mon Jan 1 2026 18:06`. Use the author's local time, at the moment the record is written. The command is `date "+%a %b %-d %Y %H:%M"`. Do not add a timezone abbreviation, AM/PM, or seconds, and do not write a date range. Keep the filename's UTC prefix and the footer's local `at <hour> <zone>` form as they are.

Related:

- the file-names rule — the UTC filename prefix
- record-rule-authorship-in-a-footer — the footer's format
- the work-sessions-convention — the work session record's dated title
- working-state-artifacts-carry-a-provenance-footer

---

Authored by Scott Bellware on Sun Jul 26 2026 at 12 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:41:09 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 2:41:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:50:46 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
