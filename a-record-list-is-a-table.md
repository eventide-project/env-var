# A list of records presented on request is a table

**When the engineer asks for a list of records, render it as a table.** That reaches any record — ideas, implementation records, decision log entries, loop records, work session records, migration records, journal entries, and commits.

**The first column is the record's handle and carries no heading.** That is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit. The columns after it are headed.

**Two SHA columns follow the handle: the commit that created the record, and the last to touch it.** They are standing columns rather than chosen ones.

```
|              | created   | changed   | aspiration                        | state  |
|--------------|-----------|-----------|-----------------------------------|--------|
| `2026-08-10` | `f0b7769` | `e137863` | A Generalized Description         | Active |
| `2026-08-23` | `376e64a` | `376e64a` | Waytide for content and web       | Open   |
```

**A record never amended shows the same SHA twice, and that is the point.** The pair says whether a record has been touched since it was written. One that has not, and whose subject has moved since, is the stale case a reader is looking for.

**The last column is chosen for the question.** A list of ideas or implementations takes the state. A list of commits asked about for their subject widths takes the width. A column nobody asked for is padding.

**A list of commits takes no SHA columns**, because the handle is already the SHA and a commit has no creation distinct from itself.

## Keep every column short

**A field that is a sentence does not belong in a table.** Column widths are fixed against the widest cell, so one long field narrows every other column and wraps every row. What was a scannable grid becomes prose in boxes.

**Where a record's summary is wanted, the answer is rows rather than a table.** That is not a failure of this rule. Rows are the form where a field runs to a sentence, and the two forms answer to the length of what is in them.

## What this does not reach

**The status report's tables are already tables**, and the status-report-format rule says so. The two rules agree.

**An answer that is not a list of records.** The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's items. This rule governs how a **set of records** is presented, and the two do not overlap: a table is a list, rendered for a reader who is looking for one row.

**Why:** a record list is scanned rather than read. The reader has a record in mind and is looking for its row, or is comparing one field across rows. A table puts the same field in the same place on every row, so the eye goes down a column instead of parsing each line to find where the field sits.

Rows are the better form where a field is long, and that is the whole of the exception. The two forms are not in competition — they answer to the length of what is in them.

**How to apply:** on a request for a list of records, render a table. Put the handle first with no heading, then the creating commit and the last commit to touch it, then the title, then one column for the fact that was asked about. Give a list of commits no SHA columns.

Keep every column short. Where a field runs to a sentence, use rows instead.

Related:

- the status-report-format rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-sha-names-the-work-rather-than-the-commit rule — what a SHA in those columns refers to when the engineer names one back
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, which this does not displace

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:22:25 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:07:00 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
