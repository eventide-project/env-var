# A working-state artifact takes square-bracket category tags

Any working-state artifact under `waytide/local/` may be categorized with **square-bracket
tags**, as in `[idea]`. A tag applies to the **whole artifact** or to **one list item**.

- **Whole artifact:** the tag goes on a dedicated `**Tags:**` line among the canonical lines at
  the head of the record, **after `**State:**` where there is one**. Several tags are separated
  by spaces — `**Tags:** [idea] [decision]`.
- **List item:** the tag prefixes that item's text — `- [idea] My great idea is thus`.

**The form is lower-case, in square brackets.** A multiword tag is dash-separated and lower-case,
as `[legal-matter]` is.

**There is no controlled vocabulary.** Tags are freeform and a tag is introduced as it is needed.
Nothing validates one, nothing enumerates the set, and a tag used once is as legitimate as a tag
used a hundred times.

**Tags are optional at every level.** An artifact that is not categorized carries no `**Tags:**`
line, and a list that is not categorized carries no prefixes. Absence claims nothing.

**It is the plain text data attribute form** the system already uses — a bold label, a colon,
and a value. See this package's vocabulary.

## The one exception — the decision log

**A `waytide/local/log/` entry takes no tags.** A log entry is deliberately one line, a
`# <title>` with no body and no template, and a `**Tags:**` line would break that shape.

**This is the same exception, for the same reason, as the provenance footer's.** The
working-state-artifacts-carry-a-provenance-footer rule exempts the log on exactly this ground.
Where one obligation over the working-state artifacts exempts the log for its one-line shape, the
next one does too.

## A reserved tag and a freeform tag

**Most tags are freeform, and a few are reserved.** A **freeform tag** means only that the writer
put it there. A **reserved tag** is one whose meaning a rule settles, and something follows from
it.

**A rule reserves a tag by naming it and saying what follows.** Nothing else does. A tag that no
rule names is freeform, which is the ordinary case and the one the section above describes.

**Nothing is derived from a freeform tag** — no filename suffix, no report, no check. A rule that
wants a set of positions reserves the tags that carry them, or names a new line.

**The distinction is not a controlled vocabulary arriving by another route.** The reserved set is
small, each member is named in a rule a reader can find, and the freeform space is untouched
around them. A writer needs to know a tag is reserved only when they are using it for what the
rule says.

**Why the distinction is worth having rather than a second line.** A reserved tag and a freeform
tag sit in the same `**Tags:**` line, so a writer categorizing an artifact does one thing rather
than choosing between two mechanisms. The alternative — a second line beside `**Tags:**`, holding
the reserved words — splits one act across two fields and asks a writer to know which field a
given word belongs in.

**What it costs:** the `**Tags:**` line no longer means one thing. A reader who sees a tag cannot
tell from the line alone whether a rule turns on it, and finding out means knowing which rules
reserve tags. That is the price of one mechanism instead of two, and it is accepted rather than
hidden.

**Why:** categorization that costs nothing is categorization that gets done. A square-bracket tag
is visible in a raw-text preview, found by an ordinary text search, and imposes no taxonomy anyone
has to maintain. The alternative — a controlled vocabulary — has to be agreed before the first tag
is written, and the writer who wants to mark something as an idea at that moment does not have it.

**Freeform is the whole of the value here, and it is also the whole of the limit.** Two writers
tagging the same thing `[idea]` and `[ideas]` have categorized nothing together. That is accepted
rather than solved, because solving it costs the property the tags exist for.

**How to apply:** where a categorization is worth marking, add a `**Tags:**` line at the head of
the artifact, after `**State:**` where there is one. Prefix a list item with `[tag]` to mark that
item alone.

Write tags lower-case and dash-separated in square brackets. Introduce a freeform tag as it is
needed. Add none to a `waytide/local/log/` entry, and derive nothing from a freeform tag.

Reserve a tag by naming it in a rule and stating what follows from it. Where no rule names a tag,
it is freeform.

Related:

- the `diary` package's diary-convention and datetime-stamp-line rules — where a diary entry's `**Tags:**` line sits, which is under the datetime line and above the summary
- the working-state-artifacts-carry-a-provenance-footer rule — the same obligation shape, and the same log exception
- the decision-log-convention — the one-line entry this exempts
- this package's vocabulary — the plain text data attribute line

---

Authored by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:39:52 PM PT
