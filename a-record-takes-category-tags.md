# A record takes square-bracket category tags

**Any record may be categorized with square-bracket tags**, as in `[idea]`. This is the system's
one tagging protocol, and it is universal: no record is excluded from it, and no rule excludes
one. A tag applies to the **whole record** or to **one list item**.

**Universal means every record, of every kind, anywhere.** A working-state artifact under
`waytide/local/`, a decision log entry, a rule file under `waytide/system/` or
`waytide/local/rules/`, a journal entry, a README. Where a record exists, it may carry tags.

## Where the tag goes

**There is one form, and every record uses it.**

- **The whole record** — the tags go on a dedicated `**Tags:**` line among the canonical lines at
  the head, **after `**State:**` where there is one**. Several tags are separated by spaces —
  `**Tags:** [idea] [decision]`.
- **One list item** — the tag prefixes that item's text — `- [idea] My great idea is thus`.

**A record with no head gains one.** A decision log entry is a title and nothing else, so a
`**Tags:**` line under its title is the entry's whole head. The decision-log-convention states
that shape, and a tagged entry is two lines rather than one.

**A leading-tag form was written on 2026-08-18 and superseded the same day.** It put a one-line
record's tags inside its `# <title>` — `# [suspended] The rule is suspended, …` — on the reasoning
that a short record had nowhere else to put them. It is discontinued. A second form buys a line
saved and costs every reader and every search two shapes to know, and the tag is no longer in the
field the rest of the system reads it from.

**No record is excluded, and none is excluded by its shape.** Short, one-line, generated, or
historical, a record that carries tags carries them on a `**Tags:**` line.

**The form is lower-case, in square brackets.** A multiword tag is dash-separated and lower-case,
as `[legal-matter]` is.

**There is no controlled vocabulary.** Tags are freeform and a tag is introduced as it is needed.
Nothing validates one, nothing enumerates the set, and a tag used once is as legitimate as a tag
used a hundred times.

**Tags are optional at every level.** A record that is not categorized carries no `**Tags:**`
line and no leading tag, and a list that is not categorized carries no prefixes. Absence claims
nothing. **Optional is not the same as excluded** — every record may be tagged, and none must
be.

**It is the plain text data attribute form** the system already uses — a bold label, a colon,
and a value. See this package's vocabulary.

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
the record, after `**State:**` where there is one. Prefix a list item with `[tag]` to mark that item alone.

Write tags lower-case and dash-separated in square brackets. Introduce a freeform tag as it is
needed, and derive nothing from one. Exclude no record from tagging.

Reserve a tag by naming it in a rule and stating what follows from it. Where no rule names a tag,
it is freeform.

Related:

- the `journal` package's journal-convention and datetime-stamp-line rules — where a journal entry's `**Tags:**` line sits, which is under the datetime line and above the summary
- the decision-log-convention — the entry that gains a `**Tags:**` line under its title
- the a-suspension-is-a-log-entry rule — `[suspended]`, the reserved tag the log carries
- the working-state-artifacts-carry-a-provenance-footer rule — a separate obligation, which does
  exempt the log; a footer is lines the entry has nowhere to put, where a tag is not
- this package's vocabulary — the plain text data attribute line

---

Authored by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:39:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
