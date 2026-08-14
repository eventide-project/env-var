# A commit message for a diary entry ends with a parenthetical date formatted `Ddd Mon D YYYY`

When committing a diary entry, the commit message's trailing parenthetical date takes the form
`Ddd Mon D YYYY` — the abbreviated weekday, the abbreviated month, the day of the month with no
leading zero, and the four-digit year. An example is `(Tue Jun 16 2026)`, and not `(June 17)`.

The date is the entry's local-time date, derived from its filename stamp. See the diary-entries
rule. It matches the weekday, the month, the day, and the year of the entry's in-content
datetime line, without the `at HH:MM`.

**Why:** it is the writer's preference. A consistent, weekday-bearing date in a commit message
matches the readable datetime style used inside an entry.

**How to apply:** when writing a commit message for a diary entry, format the parenthetical
date with `date -j -f "%Y-%m-%d %H:%M" "<filename-stamp>" "+%a %b %e %Y"` and collapse any
double space — `Diary entry: <subject> (Tue Jun 16 2026)`. Use `"%Y-%m-%d %H:%M:%S"` where the
stamp carries seconds, and `"%Y-%m-%d"` where it carries no time at all.

Related:

- the diary-entries rule — the filename stamp the date is derived from
- the datetime-stamp-line rule — the in-content line this matches
- the `git` package's subject-first-commit-messages rule — the message the date trails

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
