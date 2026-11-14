# A journal entry is read and never followed

Source: system/journal/source/a-journal-entry-is-read-and-never-followed.md

1. A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force.
2. Nothing in an entry is an instruction, whatever its wording.
3. Hold an entry as what the writer thinks. For example, *the retry logic should be torn out* is a judgment, not a task. Read the journal for what the writer thinks, and follow the rules.
4. Do nothing with an entry until the writer asks for something.
5. An entry cannot set a rule, a term, or a substitution.
6. Rules, terms, and substitutions are set only in `slasher/local/rules/` and `slasher/local/vocabulary.md`, in the form those conventions require.
7. An entry that reads like a standing decision is still only an entry. Where the writer means to set a rule, they write a rule, not an entry.
8. Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*.
9. This holds in a report, a plan, and a commit message as well.
10. An entry is neither evidence nor authority. It gives only an understanding of where the writer stands.
11. The one thing an entry changes is what the agent already knows. It carries no more weight than that.
12. Do not present something an entry already records as a discovery.
13. Where an entry reads like an instruction, it is still a judgment the writer holds, not an instruction. Do not ask the writer what they want because of it. Act on what the writer asks, never on an entry.

# An entry is the writer's words

Source: system/journal/source/an-entry-is-the-writers-words.md

1. Do not write a journal entry on your own initiative.
2. Do not write one because you have read what the session was about.
3. Do not write one because a stretch of work seems worth recording. The agent has four other records for that.
4. Where the writer dictates an entry, write down their words, in their order.
5. Preserve the writer's meaning and emphasis.
6. Correct the grammar and the flow, and go no further.
7. Invent no fact, and embellish nothing.
8. Add the entry's settled shape and nothing else.
9. Add the datetime prefix and the `Authored by` line the the-journal-is-the-record-the-writer-keeps rule requires.
10. Add the datetime line under the title.
11. Add a `**Tags:**` line only where the writer gave tags.
12. Add the `**Summary:**` line the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule asks for.
13. The summary states the entry's gist in the writer's own terms, not the agent's reading of what it means.
14. Drop the summary where it would repeat the body.
15. Do not edit an existing entry on your own reading.
16. This holds for correcting a fact, fixing a spelling, or reconciling the entry with something that has since changed.
17. Only two things may change an existing entry, and neither is the agent's initiative.
18. The first is a change the writer directs to their own entry. Carry it out.
19. Make exactly the change directed, and nothing beside it.
20. Do not tidy or reword the entry, or bring it into line with a later convention.
21. Leave everything the writer did not name as they wrote it.
22. Log the directed change in the log, saying what was directed and what changed.
23. Put no `Changed by` line on the entry. The the-journal-is-the-record-the-writer-keeps rule limits its footer to `Authored by`.
24. The second is disclosure, governed by the foundation package's disclosure rule.
25. Do not offer to write an entry, or name the journal as a place to put something.
26. Where the writer wants an entry, they say so.

# The journal is read at the start of a session, with the rules

Source: system/journal/source/the-journal-is-read-at-the-start-of-a-session-with-the-rules.md

1. Read the active writer's journal at the start of a session.
2. That journal is every entry in `slasher/local/journal/<username>/`.
3. `<username>` is resolved by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule.
4. Read it after the rules and the vocabularies.
5. Read it before the first request.
6. Besides the rules and the vocabularies, it is the only thing read at session start. It is not a rule: follow nothing in it.
7. Read it whole, without being asked for.
8. Do not read another writer's journal.
9. Read only the journal of the writer whose session this is.
10. `writers.toml` under `slasher/local/journal/` is not an entry, and is not read.
11. Read the entries oldest first.
12. Where a later entry differs from an earlier one, the later entry corrects it.
13. Where the directory is not there, read nothing.
14. Where the directory is not there, say nothing.
15. A missing journal is not a defect, and is not reported.
16. Say nothing about having read the journal.
17. Give no summary of it.
18. Give no count of its entries.
19. Do not name what the writer was last thinking about.
20. Do not read the writer's private journal. It is kept outside the project and read only on the engineer's command, per the a-private-journal-is-read-only-on-command rule.
