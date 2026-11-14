# A journal entry has a human-readable datetime line under its title

**Trigger:** When writing a journal entry

Every journal entry carries a datetime stamp in its content, on its own line directly under the `# <title>` heading. It sits above the `**Tags:**` line where there is one, above the `**Summary:**` line where there is one, and above the body.

Format: `Ddd Mon D YYYY at HH:MM` — the abbreviated weekday, the abbreviated month, the day of the month with no leading zero, the four-digit year, the literal word `at`, and the 24-hour `HH:MM`. An example is `Mon Jun 1 2026 at 13:40`.

The datetime is derived from the entry's filename stamp, which is **local time**. See the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule. Parse the filename's `YYYY-MM-DDTHH-MM` as local time, and its `YYYY-MM-DDTHH-MM-SS` form where the writer gave seconds. Convert no time zone. The filename carries no zone designator, so nothing in it has to be discounted.

**The line reads to the minute whichever form the stamp takes.** A stamp carrying seconds is parsed to the second and rendered without them, because this line's format has no seconds field.

The structure of a full entry is therefore the `# <title>`, then the datetime line, then the optional `**Tags:**` line, then the optional `**Summary:**` line, and then the body. The body is omitted where it would duplicate the title.

**Why:** it surfaces the entry's date and time in a readable form, in the content and in a Quick Look preview, without making the reader decode the filename stamp.

**How to apply:** when creating an entry, compute the datetime line from the local-time filename stamp with `date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"`, and collapse any double space. Use `"%Y-%m-%d %H:%M:%S"` as the parse format where the stamp carries seconds. Place the line under the title, above any `**Tags:**` or `**Summary:**` line.

## Compressed

1. Every journal entry carries a datetime stamp line in its content.
2. The line sits on its own line, directly under the `# <title>` heading.
3. It sits above the `**Tags:**` line, where there is one.
4. It sits above the `**Summary:**` line, where there is one.
5. It sits above the body.
6. Format: `Ddd Mon D YYYY at HH:MM`. An example is `Mon Jun 1 2026 at 13:40`.
7. The fields are the abbreviated weekday, then the abbreviated month, then the day of the month with no leading zero.
8. Next come the four-digit year, the literal word `at`, and the 24-hour `HH:MM`.
9. Derive the datetime from the entry's filename stamp, which is local time, per the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule.
10. Parse the filename's `YYYY-MM-DDTHH-MM` as local time.
11. Parse its `YYYY-MM-DDTHH-MM-SS` form as local time, where the writer gave seconds.
12. Convert no time zone.
13. The line reads to the minute, whichever form the stamp takes.
14. Parse a stamp that carries seconds to the second, and render it without the seconds.
15. A full entry is the `# <title>`, the datetime line, the optional `**Tags:**` line, the optional `**Summary:**` line, then the body.
16. Omit the body where it would duplicate the title.
17. When creating an entry, compute the line from the local-time filename stamp with this command:

```
date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"
```

18. Collapse any double space in the output.
19. Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format.

## Compression

- 2026-10-24, compressed: compression 0.06, change 0.45, solubility 67 → 85, clarity 0.53 → 0.87, 17 directives, 17 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 85 → 83, clarity 0.87 → 0.89; checked: 15 directives, 15 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named datetime-stamp-line.

Until Mon Oct 26 2026 this rule was named a-journal-entry-carries-a-human-readable-datetime-line-under-its-title and titled "A journal entry carries a human-readable datetime line under its title".

Related:

- the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the filename stamp this is derived from, and its local time
- the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule — the `**Tags:**` line below it, and the tag protocol every artifact shares
- the where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone rule — the body this line stands above

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:46 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:58 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
