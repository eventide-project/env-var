# A vocabulary entry says what a term means, not what it was or where to read more

**Trigger:** When writing or revising an entry in a vocabulary.md file

**A vocabulary entry states the term's current meaning and stops there.** Two things are barred.

**It records no lifecycle history.** Not what the term used to name, what directory it used to sit in, when it changed, or what governed it before. That belongs to the log.

**As the engineer stated it:** vocabulary entries should not record the lifecycle history of an entry.

**It carries no pointers.** Not *Its rule is …*, not *see the … rule*, and not a reference sending the reader to another vocabulary or to a section elsewhere in the file. A reader came for the meaning, and a pointer answers a question they did not ask.

**As the engineer stated it:** there should be no pointers in vocabulary entries.

## What is not lifecycle history

**The reason a substitution exists is the substitution.** *`log` is taken by the project's log, and `personal journal` needs a qualifier to hold the two apart* says why one word is written and another is not. A substitution names two words, and saying why is what the entry is for.

**The STE note stays whole.** What the STE dictionary says about a word, the category it is reserved in, and the reservation mechanism its note names are facts about the term as it stands. The note's own citation is part of the note rather than a pointer out of the entry.

**A distinction against a neighbouring term stays**, and it is not a pointer even when it names one. **As the engineer stated it:** these are fine, they provide meaning through contrast, which can be useful in a vocabulary. Naming the neighbour is how the contrast is drawn, and the contrast is meaning rather than a direction to read elsewhere.

**The test is the tense.** An entry written in the present says what the term means. A clause carrying a date, a *until*, a *was*, or a *no longer* is recording a change, and the change is the log's.

## Where the history goes

**The log.** A term that changes meaning, moves, or stops being used is a decision, and the the-log-holds-one-file-per-entry-with-a-one-line-title rule already carries it. A reader wanting to know when a word changed reads the log or the git history, and both answer better than a sentence in a glossary can.

**A discontinuation is not an exception.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule gives a discontinuation its own heading — a word taken out of use with nothing in its place. That entry names the word and says it is not used, which is a statement about the present. It does not narrate when the word was dropped or what carried it before.

**Why:** a vocabulary is read to settle what a word means right now. A reader meets it mid-sentence, with a word in hand and a question about that word. History answers a question they did not ask, and it grows: every change adds a clause, and no clause is ever removed, so the entry drifts from being a definition toward being a record of its own edits.

The cost is not only length. An entry carrying *it was X until 2026-08-25* invites the reader to work out whether X still applies somewhere, which is exactly the doubt a definition exists to remove. The corpus had five such clauses across three vocabularies when this was written, and each one had been added by somebody being careful.

**How to apply:** write a vocabulary entry in the present tense, saying what the term means now. Give the STE note, the category, and any distinction against a neighbouring term. Say why a substitution substitutes.

Write no clause saying what the term used to be, when it changed, or what governed it before. When a term changes, write the change in the log and leave the entry saying only what is true.

Write no pointer. Name no rule the reader should go and read, and send them to no other vocabulary and to no other section. A reader who wants the rule finds it by the term.

## Compressed

1. A vocabulary entry states the term's current meaning and stops there.
2. Write the entry in the present tense, saying what the term means now.
3. Give any distinction against a neighbouring term.
4. An entry records no lifecycle history.
5. Do not record what the term used to name, or what directory it used to sit in.
6. Do not record when the term changed, or what governed it before.
7. When a term changes meaning, moves, or stops being used, write the change in the log, per the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
8. Leave the entry saying only what is true now.
9. An entry carries no pointers.
10. Do not write *Its rule is …* or *see the … rule*. Name no rule the reader should go and read.
11. Send the reader to no other vocabulary, and to no section elsewhere in the file.

## What is not lifecycle history

1. The reason a substitution exists is part of the entry. Say why a substitution substitutes.
2. Example: *`log` is taken by the project's log, and `personal journal` needs a qualifier to hold the two apart*.
3. The STE note stays whole: what the STE dictionary says, the reserved category, and the reservation mechanism its note names.
4. The STE note's own citation is part of the note, not a pointer.
5. A distinction against a neighbouring term stays, and is not a pointer even when it names the neighbour.
6. The test is the tense. A clause carrying a date, an *until*, a *was*, or a *no longer* records a change, and belongs in the log.

## Where the history goes

1. History goes to the log.
2. A discontinuation is not an exception.
3. A discontinuation's entry names the word and says it is not used.
4. It does not narrate when the word was dropped or what carried it before.

## Compression

- 2026-10-24, compressed: compression 0.48, change 0.72, solubility 34 → 70, clarity 0.36 → 0.67, 16 directives, 16 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 70 → 64, clarity 0.67 → 0.58; checked: 12 directives, 12 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 15 directives, 14 kept, 1 less precise, 0 lost, 1 repair

## History

Until Sun Oct 25 2026 this rule was named a-vocabulary-entry-says-what-a-term-means-not-what-it-was and titled "A vocabulary entry says what a term means — never what it used to be, and never where to read more".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule — what a vocabulary holds, and which one decides
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — where the history goes instead
- the `language` package's a-word-is-reserved-in-six-steps rule — the sequence that produces an entry, whose sixth step this constrains
- the disclosure-is-the-one-reason-to-edit-a-historical-record rule — the log entry, which is a historical record and is left as written

---

Authored by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
