# A journal entry is read and never followed

**A journal entry binds nothing.** It is read at session start beside the rules and the vocabularies, and it carries none of their force. A rule states what the agent does. An entry states what the writer thinks. The two arrive in the same read and are not the same kind of thing.

**Nothing in an entry is an instruction, whatever its wording.** An entry that says *the retry logic should be torn out* is a judgment the writer holds, not a task. Read it, hold it as what the writer thinks, and do nothing with it until they ask for something.

**An entry cannot set a rule, a term, or a substitution.** Those are set in `slasher/local/rules/` and `slasher/local/vocabulary.md`, in the form those conventions require. An entry that reads like a standing decision is still an entry. Where the writer means to set a rule, they write a rule.

**Do not cite an entry back as grounds.** Not *your journal says the retry logic is wrong, so I removed it*, and not in a report, a plan, or a commit message. What an entry gives is understanding of where the writer stands. It is not evidence and it is not authority.

**The one thing an entry changes is what the agent already knows.** An entry saying the retry logic has been troubling for a week means the agent does not present that as a discovery. It carries no more weight than that.

**Why:** everything else read at session start binds, so the default reading of a file in that read is that it must be followed. The journal is the exception, and an exception nobody states is one nobody applies.

Left unstated, the journal becomes a rules directory with none of the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule's form. A passing thought and a settled decision look alike on the page. There is no `**Why:**` line, no `**How to apply:**` line, and no name saying what the rule says. A rule written that way cannot be found, cited, revised, or removed.

The writer's cost is the real one. Knowing that every entry is read, the writer writes for a reader. What keeps that cost bounded is this rule. An entry that can change nothing is one that can be written without weighing its effect.

**How to apply:** read the journal for what the writer thinks. Follow the rules. Where an entry reads like an instruction, it is still a judgment the writer holds, not an instruction. Act on what the writer asks, never on an entry.

## Compressed

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

## Compression

- 2026-10-24, compressed: compression 0.35, change 0.61, solubility 69 → 84, clarity 0.70 → 0.84, 15 directives, 14 kept, 1 less precise, 0 lost, after 1 repair, re-checked kept; directive 11 less precise, judged immaterial
- 2026-10-24, revised: point 13 takes the new How to apply wording; not checked
- 2026-10-27, re-checked: 15 directives, 14 kept, 1 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 84 → 81, clarity 0.84 → 0.84; checked: 12 directives, 12 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 13 directives, 13 kept, 0 less precise, 0 lost, 0 repairs

## History

Until 2026-10-24 How to apply said that where an entry reads like an instruction, the agent asks the writer what they want rather than acting on the entry. Asking because of an entry is still treating it as an instruction, which the body forbids. The engineer settled that a journal entry is not treated as an instruction, so the agent acts only on what the writer asks.

Related:

- the-journal-is-read-at-the-start-of-a-session-with-the-rules rule — the read this rule qualifies
- the the-journal-is-the-record-the-writer-keeps rule — where the journal lives and what one entry is
- the foundation package's a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the form a binding rule takes, and where one lives
- the foundation package's a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule — where a term is settled

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:07:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:51 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:06:58 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:50 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
