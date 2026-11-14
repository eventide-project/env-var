# A package's vocabulary holds its terms, and the most specific one decides

A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces. It is binding. Use its terms and its substitutions in code, tests, rules, designs, commits, records, and dialogue.

**This rule governs using a vocabulary.** Writing one, what it holds, and where a term goes are the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule's, which loads when a vocabulary file is written.

## Which vocabulary decides

**Four levels hold terms, and a word can appear in more than one.** They decide in this order, from the one that decides first:

1. **The STE dictionary**, and Slasher's reserved terms where the approved word means something else. The `language` package's slasher-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
2. **The `language` package's vocabulary** — the terms and substitutions that belong to no domain.
3. **An individual package's vocabulary** — the terms and substitutions of one domain.
4. **The project's own vocabulary**, in `slasher/local/vocabulary.md`, which a project writes for itself.

**The more specific decides.** A domain knows its own words, and a general vocabulary cannot anticipate what a domain needs. A project knows its own work, and Slasher cannot anticipate that either.

## A project's own vocabulary binds

**A project's own vocabulary, `slasher/local/vocabulary.md`, is read at session start**, with `slasher/system/` and `slasher/local/rules/`. That is what makes it binding. `session-start.sh` names it in the read instruction, and the `AGENTS.md` bootstrap names it too. It is optional, and its absence is not a defect.

**Most of the time the levels do not meet.** The `language` vocabulary holds the substitutions that belong to no domain, and it says so. A domain-specific substitution belongs in its own package. So two vocabularies rarely name the same word, and the order settles the case where they do.

## Specialization is not conflict

**A package can narrow a general term rather than contradict it.** `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` keeps that meaning and adds that the actuation is written before any implementation. The narrower entry does not displace the general one. It rests on it.

**Why:** several vocabularies bind the same prose. A reader who finds a word in two of them cannot choose without a stated order. The cost is not hypothetical. `actuation` is defined in `language` and in `design-by-efferent`, and which one governs rests today on a sentence one of them happens to carry. Naming the order once removes that from every future case.

**How to apply:** use a vocabulary's terms and substitutions wherever Slasher's prose is written. When a word appears in two vocabularies, the more specific one decides. Read a narrower entry as resting on the general one. When writing a vocabulary, follow the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule.

## Compressed

1. A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces.
2. It is binding.
3. Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue, wherever Slasher's prose is written.
4. This rule governs using a vocabulary. Writing one, what it holds, and where a term goes are the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule's, which loads when a vocabulary file is written.

## Which vocabulary decides

1. Four levels hold terms, and a word can appear in more than one.
2. They stand in this order, from the most general to the most specific, which decides:
   1. **The STE dictionary**, and Slasher's reserved terms where the approved word means something else. The `language` package's slasher-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
   2. **The `language` package's vocabulary**: the terms and substitutions that belong to no domain. The `language` vocabulary says so itself.
   3. **An individual package's vocabulary**: the terms and substitutions of one domain.
   4. **The project's own vocabulary**, in `slasher/local/vocabulary.md`, which a project writes for itself.
3. When a word appears in two vocabularies, the more specific one decides.

## A project's own vocabulary binds

1. `slasher/local/vocabulary.md` is read at session start, with `slasher/system/` and `slasher/local/rules/`. That read makes it binding.
2. `session-start.sh` names it in the read instruction. The `AGENTS.md` bootstrap names it too.
3. It is optional, and its absence is not a defect.

## Specialization is not conflict

1. A package can narrow a general term rather than contradict it. The narrower entry rests on the general one and does not displace it.
2. Example: `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` adds that the actuation is written before any implementation.

## Compression

- 2026-10-24, compressed: compression 0.29, change 0.50, solubility 40 → 54, clarity 0.62 → 0.79, 32 directives, 32 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-10-27, re-checked: 35 directives, 31 kept, 3 less precise, 1 lost, 4 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 54 → 49, clarity 0.79 → 0.79; checked: 38 directives, 34 kept, 4 less precise, 0 lost, 1 repair, re-checked with 0 lost
- 2026-11-05, revised: split, its writing part moved to the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule; checked: 16 directives, 14 kept, 2 less precise, 0 lost, 2 repairs; re-checked: 16 directives, 15 kept, 1 less precise, 0 lost. Left less precise: where a substitution goes, which the writing rule states

## History

Until Thu Nov 5 2026 this rule also held what a vocabulary holds, that every word in one is approved or reserved, where a term goes, the project's vocabulary file's form, and how an entry says it narrows a term. The engineer had those split into the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule, which loads when a vocabulary file is written.

A fourth kind held such words from 2026-08-10 until 2026-08-14. It had one entry, and that entry carried a definition, which was the test that was to have kept it out. See the suspended words-from-the-design-vocabulary section.

**What it cost to place it there.** The read instruction previously named `waytide/local/rules/` and said *read only that one directory beside the packages*. So a binding file anywhere else under `waytide/local/` would have gone unread. Placing the vocabulary beside `rules/` therefore reached `session-start.sh`, the announce-waytide-at-session-start rule, the rules-convention, the file-names rule, and the bootstrap `install.sh` generates. That cost was taken deliberately, for the reason above: the alternative put a glossary in the rules directory and named it like a decision.

Until Sun Oct 25 2026 this rule was named vocabulary-convention and titled "`vocabulary.md` — what a package's vocabulary is, which package has one, and which one decides".

Until Mon Oct 26 2026 the account of what every word in a vocabulary is stood in each vocabulary, nearly word for word, and not in this rule.

Related:

- the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule — writing a vocabulary
- the `language` package's `vocabulary.md` and its slasher-keeps-its-word-where-the-ste-word-means-something-else rule — the level above this one
- its language-is-used-precisely-here-and-words-are-load-bearing rule — the premise every vocabulary follows from
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule
- the file-names rule — why the project's file takes no prefix
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — the read instruction that names it

---

Authored by Scott Bellware on Sun Aug 9 2026 at 2:19:00 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:52:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:47:50 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 1:17:16 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:32 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:09:15 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:06 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
