# Journal — Vocabulary

The journal package's vocabulary. Three terms, and one substitution that keeps them apart from the
records the agent writes. Binding — use these terms with these meanings in rules, entries, prose,
and dialogue.

**Every word here is one of two things.** This holds for the terms below, and for the **Use**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-its-own-categories rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the
`language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note
names a term absent from the STE dictionary, and reserves it. A definition exists to name a term,
and a term names something in the subject field. A **substitution's Use word** with no STE note is
**ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's
ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its
waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

- **writer** — the person whose journal it is. This package says **writer** where the rest of
  Waytide says **engineer**, and the two name the same person in a different relation. The
  `language` vocabulary reserves `engineer` for the person the work is done with and for — at
  the loop, at a hinge, and as the reader the terminology is conveyed to. Every one of those is
  a relation to the **work**. A journal entry stands in relation to the **entry**, and what makes
  it trustworthy is that the person who thought it is the person who wrote it. That is what the
  an-entry-is-the-writers-words rule turns on, so the word names it. This **narrows**
  `engineer` and does not contradict it. Outside this package, write `engineer`. **STE: absent
  from the STE dictionary. Technical noun, STE category 11, professional roles, individuals,
  groups, organizations, and geopolitical entities** — the category `engineer` takes in the
  `language` vocabulary.
- **journal** — the record the **writer** keeps, held in `waytide/local/journal/<username>/`. It is the one
  record under `waytide/local/` the agent does not write. What it holds is what the writer
  thinks about the work, rather than what happened. The agent reads the active writer's journal
  at session start, and follows nothing in it. Its rules are the journal-convention,
  the-journal-is-read-at-session-start, a-journal-entry-is-read-and-never-followed, and
  an-entry-is-the-writers-words. **STE: absent from the STE dictionary. Technical noun, ETE
  agent artifacts.**
- **journal entry** — one file in the journal, and one piece of the writer's thinking. A day
  usually holds one entry, and it can hold several. Each is a separate file with a datetime
  prefix in the writer's **local time**, which is where the journal departs from the
  foundation package's file-names rule. An entry is one writer's personal record, so the hour it
  carries is the hour they wrote it in. An entry is written once and not edited. A later
  thought is a later entry. **STE: `entry` is approved as a noun, meaning a record of an event
  or a transaction. `journal` is absent and is reserved above.**

## Substitutions

| Use | Don't use | Meaning |
| --- | --- | --- |
| **journal** | "diary", "personal log", "personal journal" | the writer's record — see above. **diary** held this record until 2026-08-18 and is not used now. **log** is taken by the decision log, which is the agent's record and the journal's opposite. **personal journal** and **personal log** each need a qualifier to hold the two apart, and a term that needs a qualifier is the wrong term |

**The write-ahead reading is real and is answered rather than avoided.** In filesystems and
databases a journal is what a system writes before it commits, and that is a reading many readers
of this system reach for first. `diary` was chosen over `journal` on 2026-08-14 to sidestep it,
and the choice was reversed on 2026-08-18. What settles the reading is the package and the
directory the word sits in, not the word alone: `waytide/local/journal/<username>/` names a person,
and no write-ahead log is kept per user.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:11 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
