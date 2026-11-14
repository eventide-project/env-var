# A date in a record's title is written as the day, the date, and the 24-hour time

**Trigger:** When writing a date into a working-state record's title

A working-state record's **title** may carry a date, as the work session record's `# Work Session — <name> (<date>)` does. In that record and any other whose title is dated, the date is written as:

```
Mon Jan 1 2026 18:06
```

Day-of-week, month, day, year, then the time as 24-hour hours and minutes. No `at`, no AM/PM, no seconds.

- **The time is the author's local time**, like the provenance footer's — an in-file date is written for a person to read. The form carries no timezone marker, so a reader takes it as local to whoever wrote the record. The footer beneath it names the zone, and the filename prefix carries the timezone-explicit instant.
- **The moment is the record's authoring time** — the same instant its ISO-8601-UTC filename prefix records, rendered in local time. For a record covering work that spanned more than one day, the title still names the single moment the record was written, not a range.
- **This is a third date format, and the three do not overlap.** The **filename** prefix is machine-sortable and UTC (`2026-07-24T18-16-22Z-…`, see the file-names rule). The **provenance footer** is human-readable local time with a zone abbreviation (`Fri Jul 24 2026 at 11:58:56 AM PT`, see the record-a-rules-authorship-in-a-provenance-footer rule). The **title** is this form: compact, local, minute-precise. Each is used where it is specified and nowhere else.

- **It is the one exception to the seconds rule.** Every other datetime written into a file carries its time of day to seconds (see the a-time-value-carries-minutes-and-seconds rule). A title does not, and the exception is narrow. That rule exists because a running history's entries collide at a coarse resolution and the later one goes unwritten. A title appears once per file, so nothing can collide with it. The filename beside it already carries the same instant to the second, in UTC.

**Why:** a title is the first thing read, and the line a record is referred to by. So its date wants to be compact and precise at once. A bare month and year is too coarse to distinguish two records from the same day. The footer's `at 11:58:56 AM PT` form is too long to sit inside a title alongside the record's name.

Minute-precise 24-hour time is the shortest rendering that separates records written hours apart. Local time is chosen for the same reason the footer uses it. The title is for a reader, and the UTC instant is already carried, unambiguously, by the filename.

**How to apply:** when writing a record whose title takes a date, render it `Mon Jan 1 2026 18:06`. Use the author's local time, at the moment the record is written. The command is `date "+%a %b %-d %Y %H:%M"`. Do not add a timezone abbreviation, AM/PM, or seconds, and do not write a date range. Keep the filename's UTC prefix and the footer's local time to the second as they are.

## Compressed

1. A working-state record's title may carry a date, as the work session record's `# Work Session — <name> (<date>)` does.
2. In any record whose title is dated, write the date in this form:

```
Mon Jan 1 2026 18:06
```

3. The order is day-of-week, month, day, year, then 24-hour hours and minutes.
4. Do not write `at`, AM/PM, or seconds.
5. Do not add a timezone abbreviation or any other timezone marker.
6. The time is the author's local time.
7. The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time.
8. For a record covering work over more than one day, the title still names the single moment the record was written.
9. Do not write a date range.
10. Render the date with the command `date "+%a %b %-d %Y %H:%M"`.
11. This title form is distinct from the other two record date formats. Each format is used only where it is specified.
12. The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule.
13. The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per the record-a-rules-authorship-in-a-provenance-footer rule.
14. The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds.
15. The exception is narrow and covers only the title's date.

## Compression

- 2026-10-24, compressed: compression 0.41, change 0.71, solubility 53 → 75, clarity 0.49 → 0.67, 19 directives, 19 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 75 → 76, clarity 0.67 → 0.69; checked: 13 directives, 13 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named record-title-date-format and titled "A date in a record's title is written `Mon Jan 1 2026 18:06`".

Until Mon Oct 26 2026 this rule was named a-date-in-a-records-title-takes-the-day-the-date-and-the-24-hour-time and titled "A date in a record's title takes the day, the date, and the 24-hour time".

Related:

- the file-names rule — the UTC filename prefix
- record-a-rules-authorship-in-a-provenance-footer rule — the footer's format
- the the-work-sessions-directory-holds-one-record-per-work-session rule — the work session record's dated title
- working-state-artifacts-carry-a-provenance-footer rule

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
Changed by Scott Bellware on Thu Oct 15 2026 at 1:19:52 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:10 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:38:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:05:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
