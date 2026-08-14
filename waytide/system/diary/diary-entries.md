# Diary entries live in `waytide/local/diary/<username>/`, one file per entry

The diary is kept as one markdown file per entry, in the writer's own diary directory
`waytide/local/diary/<username>/`. The `<username>` is the active writer, resolved by the
identity-resolution-contract rule — `waytide/local/diary/scott-bellware/`, for example. A
project may hold the diaries of more than one writer, and each writer's entries live under
their own directory. This is distinct from `waytide/local/log/`, the decision log the agent
writes, which is one record for the whole project.

Filename: `YYYY-MM-DDTHH-MM-SS-<name>.md`, with the timestamp computed in **local time** by
`date +%Y-%m-%dT%H-%M-%S`. The colons of ISO 8601 are written as dashes for filename safety.
Never use UTC for these entries, which is the writer's stated preference.

**The form carries no trailing `Z`.** In ISO 8601 that character designates UTC, and this stamp is
local time. It was kept until 2026-08-14, on the reasoning that it is a literal token of the form
rather than a claim about a zone. A reader meets the filename and not the rule that says so, so
every entry asserted something false and the correction sat somewhere they would never look. The
foundation package's file-names rule keeps its `Z`, because its stamps are UTC and the character
is true there.

**The local time reaches the diary entries alone.** The agent's own records keep UTC, as the
foundation package's file-names rule requires. Do not conflate the two.

**Entry format:**

- **Voice:** first person, the writer's perspective — *I raised the concern …*.
- **Editing:** lightly cleaned up. Preserve the writer's words, their meaning, and their
  emphasis. Correct the grammar and the flow. Invent no fact, and embellish nothing.
- **Structure:** a `# <title>`, then a bold `**Summary:**` one-line gist, then the narrative
  prose. The summary is what shows first in a Quick Look preview, so make it a standalone
  takeaway rather than a restatement of the title. **Omit the summary where it would be
  identical or nearly identical to the body**, as it is on a very short entry. The entry is
  then the title and the prose, with nothing repeated.

**The directive is *new entry*.** Where the writer opens with that phrase, write the entry by
this rule and by the datetime-stamp-line, diary-category-tags, omit-body-when-same-as-title, and
ask-for-entry-time-or-omit-it rules. Nothing else follows from it. Nothing beside the entry file
is written, and no index is maintained — see the timeline-view rule.

**Dating default:** an entry is about **today** unless the writer signals otherwise. Where the
writer refers to a different time, by an explicit date or by a phrase such as *last Tuesday's
meeting* or *back in April*, date and stamp the entry to that time instead. Opening with *Today*
is a signal, and it means today.

**This rule settles the date alone.** The **time** is the ask-for-entry-time-or-omit-it rule's,
and that ask fires wherever the writer gave no time — including where they gave a day, since
*yesterday* and *today* fix the day and say nothing about the hour.

**Why:** a consistent, sortable naming scheme keeps a long-running diary easy to skim, to sort
chronologically, and to reference. Keeping each writer's entries under
`waytide/local/diary/<username>/` separates one writer's record from another's. It separates
all of them from the records the agent writes. The summary pays off in a Quick Look preview,
which is where a reader meets the entry before opening it.

**How to apply:** when the writer dictates an event or an experience, resolve the active
`<username>` by the identity-resolution-contract rule. Create a new file in
`waytide/local/diary/<username>/` with the local-time filename stamp, a `# <title>` heading, a
`**Summary:**` line, and then the first-person narrative. Set the filename stamp to the referenced
past time where the entry is not about today. Where the writer gave no time, ask by the
ask-for-entry-time-or-omit-it rule and stamp the file to their answer. A day they named is not a
time.

Related:

- the identity-resolution-contract rule — how `<username>` is resolved
- the diary-convention — the directory, the provenance footer, and what one entry is
- the datetime-stamp-line rule — the datetime line under the title
- the diary-category-tags rule — the `**Tags:**` line
- the omit-body-when-same-as-title rule — the body dropped where the title says it already
- the ask-for-entry-time-or-omit-it rule — where the writer gives no time
- the timeline-view rule — the on-demand listing of the entries this writes
- the foundation package's file-names rule — the UTC normalization this departs from

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:05:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:01:46 PM PT
