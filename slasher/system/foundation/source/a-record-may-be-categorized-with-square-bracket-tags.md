# A record may be tagged with square-bracket tags

**Trigger:** When adding a tag to a record or a list item

**Any record may carry tags**, such as `[idea]`. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`. To tag one list item, prefix it: `- [idea] My idea`.

**Write a tag lower-case in square brackets**, with dashes between words: `[legal-matter]`.

**Tags are optional and freeform.** Add one when it is useful. Nothing checks them, and there is no fixed list.

**Some tags have lifecycle states**, such as `[experiment]`, `[feature]`, `[note]`, and `[work]`. Each one's own rule states its states.

**Why:** a tag costs nothing to add, shows in plain text, and is found by an ordinary search.

**How to apply:** where a record is worth marking, add a `**Tags:**` line at its head.

## Compressed

1. Any record may carry tags, such as `[idea]`.
2. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`.
3. To tag one list item, prefix it: `- [idea] My idea`.
4. Write a tag lower-case in square brackets, with dashes between words: `[legal-matter]`.
5. Tags are optional and freeform. Add one when it is useful.
6. Nothing checks tags, and there is no fixed list.
7. Some tags have lifecycle states, such as `[experiment]`, `[feature]`, `[note]`, and `[work]`. Each one's own rule states its states.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.53, solubility 28 → 60, clarity 0.37 → 0.90, 29 directives, 29 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-10-27, revised: the rule is rewritten, with no reserved tags and with lifecycle states left to each tag's rule, compression 0.09, change 0.17, solubility 92 → 94, clarity 0.97 → 1.00; checked: 12 directives, 12 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 94 → 95, clarity 1.00 → 1.00; checked: 8 directives, 8 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 8 directives, 8 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

**A leading-tag form was written on 2026-08-18 and superseded the same day.** It put a one-line record's tags inside its `# <title>` — `# [suspended] The rule is suspended, …` — on the reasoning that a short record had nowhere else to put them.

Until Sun Oct 25 2026 this rule was named a-record-takes-category-tags and titled "A record takes square-bracket category tags".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 this rule was titled "A record takes square-bracket category tags". It divided tags into reserved and freeform, said where a log entry puts its tags, and kept an account of the discontinued leading-tag form and of what the distinction cost. The engineer settled that a tag means what a rule about it says, so the rule needs no category of reserved tags, and that the rest is said elsewhere or is history.
- **Thu Oct 29 2026** — the tag for a piece of work to be done was `[work-item]`, and the record was called a work item. It is `[work]`, at the engineer's direction.

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — where a log entry's `**Tags:**` line goes
- the a-log-entry-recording-an-engineers-decision-is-tagged-decision rule — what `[decision]` means
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — what `[suspended]` means
- the the-implementations-directory-holds-one-record-per-implementation rule — the states of `[experiment]` and `[feature]`
- the the-items-directory-holds-one-file-per-item rule — the states of an item, and of `[work]`
- the a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule — the one state of `[note]`
- the `journal` package's a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule — where a journal entry's `**Tags:**` line sits

---

Authored by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:39:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:11:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:34:30 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
