# Journal — Vocabulary

The journal package's vocabulary. Five terms, and two substitutions: one keeps them apart from the records the agent writes, and one names the journal committed with the project. Binding — use these terms with these meanings in rules, entries, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **writer** — the person whose journal it is. This package says **writer** where the rest of Slasher says **engineer**, and the two name the same person in a different relation. The `language` vocabulary reserves `engineer` for the person the work is done with and for — at the loop, at a hinge, and as the reader the terminology is conveyed to. Every one of those is a relation to the **work**. A journal entry stands in relation to the **entry**, and what makes it trustworthy is that the person who thought it is the person who wrote it. That is what the an-entry-is-the-writers-words rule turns on, so the word names it. This **narrows** `engineer` and does not contradict it. Outside this package, write `engineer`. **STE: absent from the STE dictionary. Technical noun, STE category 11, professional roles, individuals, groups, organizations, and geopolitical entities** — the category `engineer` takes in the `language` vocabulary.
- **journal** — the record the **writer** keeps, held in `slasher/local/journal/<username>/`. It is the one record under `slasher/local/` the agent does not write. What it holds is what the writer thinks about the work, rather than what happened. The agent reads the active writer's journal at session start, and follows nothing in it. **STE: absent from the STE dictionary. Technical noun, ETE agent artifacts.**
- **journal entry** — one file in the journal, and one piece of the writer's thinking. A day usually holds one entry, and it can hold several. Each is a separate file with a datetime prefix in the writer's **local time**, which is where the journal departs from the foundation package's file-names rule. An entry is one writer's personal record, so the hour it carries is the hour they wrote it in. An entry is written once and not edited. A later thought is a later entry. **STE: `entry` is approved as a noun, meaning a record of an event or a transaction. `journal` is absent and is reserved above.**
- **project journal** — the journal committed with the project, in `slasher/local/journal/<username>/`, read by every writer on the project and by every reader of its repository. Bare **journal** means the project journal where nothing sets it against a private one. It is the opposite of a **private journal**: it is in the repository, and the agent reads it at session start. **STE: `project` is absent from the STE dictionary. `journal` is absent and is reserved above. Technical noun, ETE agent artifacts.**
- **private journal** — a journal kept outside the project's repository, in `~/.local/share/slasher/journal/<project>/`, one directory per project. It belongs to one user, so it has no `<username>` directory. Its entries are not committed, and the agent reads it only on the engineer's command. **Private** means kept out of the repository and out of the session-start read, and nothing more: an entry the agent writes or reads still passes through the session. It is the opposite of the **project journal**. **STE: `private` is absent from the STE dictionary. `journal` is absent and is reserved above. Technical noun, ETE agent artifacts.**

## Substitutions

| Use | Don't use | Meaning |
| --- | --- | --- |
| **project journal** | "shared journal" | the journal committed with the project. It names the place the journal is kept, the project, which is what sets it against a private journal |
| **journal** | "diary", "personal log", "personal journal" | the writer's record — see above. **log** is taken by the project's log, which is the agent's record and the journal's opposite. **personal journal** and **personal log** each need a qualifier to hold the two apart, and a term that needs a qualifier is the wrong term |

**The write-ahead reading is real and is answered rather than avoided.** In filesystems and databases a journal is what a system writes before it commits, and that is a reading many readers of this system reach for first. What settles the reading is the package and the directory the word sits in, not the word alone: `slasher/local/journal/<username>/` names a person, and no write-ahead log is kept per user.

## Compressed


## Terms

1. **writer** — the person whose journal it is. In this package, say **writer** where the rest of Slasher says **engineer**. The two name the same person in a different relation: `engineer` for the person the work is done with and for, a relation to the work; **writer** in relation to the entry. This narrows `engineer` and does not contradict it. Outside this package, write `engineer`.
2. **journal** — the record the writer keeps, in `slasher/local/journal/<username>/`. It is the one record under `slasher/local/` the agent does not write. It holds what the writer thinks about the work, not what happened. The agent reads the active writer's journal at session start, and follows nothing in it.
3. **journal entry** — one file in the journal, and one piece of the writer's thinking. A day usually holds one entry, and can hold several, each a separate file. Its datetime prefix is in the writer's local time, not UTC, which departs from the foundation package's file-names rule. An entry is written once and not edited. A later thought is a later entry.
4. **project journal** — the journal committed with the project, in `slasher/local/journal/<username>/`, read by every writer on the project and every reader of its repository. Bare **journal** means the project journal where nothing sets it against a private one. It is the opposite of a private journal: it is in the repository, and the agent reads it at session start.
5. **private journal** — a journal kept outside the project's repository, in `~/.local/share/slasher/journal/<project>/`, one directory per project. It belongs to one user, so it has no `<username>` directory. Its entries are not committed, and the agent reads it only on the engineer's command. **Private** means kept out of the repository and out of the session-start read, and nothing more: an entry the agent writes or reads still passes through the session. It is the opposite of the project journal.

## Substitutions

1. Use **journal** for the writer's record. Do not use "diary", "personal log", or "personal journal".
2. **log** is the project's log, the agent's record, and is not used for the journal.
3. Use **project journal** for the journal committed with the project. Do not use "shared journal".
4. Do not avoid the word journal for its write-ahead reading. Its package and directory settle it: `slasher/local/journal/<username>/` names a person.

## Compression

- 2026-10-29, compressed: 3294 → 2183 characters; checked: 30 directives, 24 kept, 4 less precise, 2 lost; 3 repairs, re-checked: 29 directives, 23 kept, 5 less precise, 1 lost; what is still not kept was judged reasons or background
- 2026-10-29, revised: the head line saying every word is approved or reserved is left out of the compressed text, at the engineer's direction, since the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule states it in the read
- 2026-10-29, revised: the lines naming the vocabulary and saying it is binding are left out of the compressed text, at the engineer's direction; the loader names the file, and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says every vocabulary binds
- 2026-10-29, merge from master re-checked: 30 directives, 27 kept, 1 less precise, 2 lost, 2 repairs
- 2026-11-05, revised: each entry's STE note is left out of the compressed text, at the engineer's direction; it matters only when a word is reserved or an entry written, and the full text keeps it

- 2026-11-06, revised: "project journal" replaces "shared journal", a swap of one term for another the engineer settled

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:11 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:55:34 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:04:03 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 4:36:21 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:33:19 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:58:37 PM PT
