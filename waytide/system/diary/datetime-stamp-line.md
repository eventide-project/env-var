# A diary entry carries a human-readable datetime line under its title

Every diary entry carries a datetime stamp in its content, on its own line directly under the
`# <title>` heading. It sits above the `**Tags:**` line where there is one, above the
`**Summary:**` line where there is one, and above the body.

Format: `Ddd Mon D YYYY at HH:MM` — the abbreviated weekday, the abbreviated month, the day of
the month with no leading zero, the four-digit year, the literal word `at`, and the 24-hour
`HH:MM`. An example is `Mon Jun 1 2026 at 13:40`.

The datetime is derived from the entry's filename stamp, which is **local time**. See the
diary-entries rule. Parse the filename's `YYYY-MM-DDTHH-MM` as local time, and its
`YYYY-MM-DDTHH-MM-SS` form where the writer gave seconds. Convert no time zone. The filename
carries no zone designator, so nothing in it has to be discounted.

**The line reads to the minute whichever form the stamp takes.** A stamp carrying seconds is
parsed to the second and rendered without them, because this line's format has no seconds field.

The structure of a full entry is therefore the `# <title>`, then the datetime line, then the
optional `**Tags:**` line, then the optional `**Summary:**` line, and then the body. The body
is omitted where it would duplicate the title.

**Why:** it surfaces the entry's date and time in a readable form, in the content and in a
Quick Look preview, without making the reader decode the filename stamp.

**How to apply:** when creating an entry, compute the datetime line from the local-time
filename stamp with `date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"`, and
collapse any double space. Use `"%Y-%m-%d %H:%M:%S"` as the parse format where the stamp carries
seconds. Place the line under the title, above any `**Tags:**` or `**Summary:**` line.

Related:

- the diary-entries rule — the filename stamp this is derived from, and its local time
- the diary-category-tags rule — the `**Tags:**` line below it
- the omit-body-when-same-as-title rule — the body this line stands above

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
