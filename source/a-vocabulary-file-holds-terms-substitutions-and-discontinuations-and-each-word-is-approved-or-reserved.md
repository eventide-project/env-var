# A vocabulary file holds terms, substitutions, and discontinuations, and each word is approved or reserved

**Trigger:** When writing, revising, or creating a `vocabulary.md` file

**This rule governs writing a vocabulary.** The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule governs using one: that it binds, and which vocabulary decides where two name the same word.

**A package gets a vocabulary only when it has a specialized vocabulary for its domain.** A package whose subject is written in ordinary words has none. The absence is correct rather than missing. `git` and `ext/ruby-lang` have none. Six packages do.

**Put a term in the vocabulary of the package whose domain it belongs to.** Put a domain-less term or substitution in `language`. Put a domain-specific substitution in its own package's vocabulary.

## What a vocabulary holds

- **Terms** — the concepts the package defines. `solubility`, `efferent`, `hinge`, `precondition`. A term is a glossary entry, and it says what the concept is.
- **Substitutions** — a word not to write, and the word to write instead. `conform` rather than "sweep". `verified` rather than "green".
- **Discontinuations** — a word removed from use with nothing in its place. `discriminator` went because the concept went, not because another word replaced it.

**A substitution and a discontinuation are different acts.** A substitution names two words. A discontinuation names one. Do not file one under the other's heading.

**A term Slasher did not coin is still a term.** `load-bearing` comes from structural engineering, `cradle` from a physical object, and `preserve` from the vocabulary of design. Each is a term, because the vocabulary says what it means. Where the word was taken rather than coined, the entry says so in its own prose. That is an **origin** and not a kind of entry.

## Every word in a vocabulary is approved or reserved

**Every word in a vocabulary is one of two things.** This holds for its terms, and for the **Use** column of any substitutions table in it.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required, and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An ETE category is reserved under the ete-declares-its-own-categories rule. STE Rule 1.8 requires a technical noun to be approved in the subject field, and the vocabulary that holds it is that approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it with a meaning Slasher does not use. The last of the three is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the `language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note names a term absent from the STE dictionary, and reserves it. A definition exists to name a term, and a term names something in the subject field. A **substitution's Use word** with no STE note is **ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its slasher-keeps-its-word-where-the-ste-word-means-something-else rule.

**A vocabulary states this by citing this rule, not by repeating it.** One line at its head says that every word in it is approved or reserved, and points here.

## A project's own vocabulary is `slasher/local/vocabulary.md`

**One file, beside `rules/`, named for what it is.** It holds the terms and substitutions a project settles for itself, in the same shape a package's `vocabulary.md` has. It takes **no datetime prefix**. It is a structural file rather than a dated decision, exactly as a package's `vocabulary.md` is. See the file-names rule.

**It is read at session start, and binds,** as the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says. That is the reason the file sits where it does rather than in a working directory.

**It is optional, and its absence is not a defect** — the same standing a package's `vocabulary.md` has. Most projects never write one.

**It is not a rule, and it does not live in `rules/`.** A rule states an obligation and takes the datetime prefix, because it is a dated decision in the project's history. A vocabulary accretes and is named for what it is. Putting it inside `rules/` would make the one directory hold two kinds of file under two naming conventions. Keeping it beside `rules/` avoids that.

## Saying how an entry relates to a general term

**Say which is happening.** Where a package narrows a term, its entry names the general term it narrows. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason. A reader must not have to work out which case an entry is.

**Why:** a vocabulary is written rarely and used constantly. What it holds and how its entries are written matter only while one is written, so they load then, and the rules for using a vocabulary stay in every session's read.

**How to apply:** when writing a vocabulary, put each term in its domain's package, keep substitutions and discontinuations under separate headings, and give every word an approval or a reservation. A project's own terms go in `slasher/local/vocabulary.md`, with no datetime prefix, written only once there is a term to write. Say whether an entry narrows or replaces a general term.

## Compressed

1. This rule governs writing a vocabulary. The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule governs using one.
2. Give a package a vocabulary only when its domain has specialized words.
3. A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing.
4. `git` and `ext/ruby-lang` have none. Six packages do.
5. Put a term in the vocabulary of the package whose domain it belongs to.
6. Put a domain-less term or substitution in `language`. Put a domain-specific substitution in its own package's vocabulary.

## What a vocabulary holds

1. **Terms** are the concepts the package defines, such as `solubility`, `efferent`, `hinge`, `precondition`.
2. A term is a glossary entry, and it says what the concept is.
3. **Substitutions** name a word not to write, and the word to write instead. Examples: `conform` rather than "sweep", `verified` rather than "green".
4. **Discontinuations** name a word removed from use with nothing in its place, because the concept went, as `discriminator` did.
5. A substitution names two words. A discontinuation names one.
6. Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading.
7. A word Slasher did not coin is still a term where the vocabulary says what it means, and is entered as one. Examples: `load-bearing`, `cradle`, `preserve`.
8. Where a word was taken rather than coined, the entry says so in its own prose.
9. That statement is an **origin**, not a kind of entry.

## Every word in a vocabulary is approved or reserved

1. Every word in a vocabulary is approved or reserved. This holds for its terms and for the Use column of its substitutions.
2. An approved word is approved in the STE dictionary and used with its approved meaning. Nothing further is required.
3. A reserved word is a technical noun or verb in a category its entry names: under STE Rule 1.5 for a noun the dictionary omits, STE Rule 1.6 for a noun it lists and refuses, STE Rule 1.12 for a verb, or an ETE category under the ete-declares-its-own-categories rule. The vocabulary that holds it is the approval STE Rule 1.8 requires.
4. A reserved word's entry states what the STE dictionary says about it: absent, refused with an alternative, or approved with a meaning Slasher does not use. The last is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule.
5. Reserve a word by the sequence the a-word-is-reserved-in-six-steps rule gives, in the `language` package's `ete/` directory.
6. A definition with no STE note reserves a term absent from the dictionary. A substitution's Use word with no STE note is ordinary vocabulary, which is not reserved and not rewritten.
7. One line at a vocabulary's head says that every word in it is approved or reserved, and cites this rule. The vocabulary does not repeat the rule.

## A project's own vocabulary is `slasher/local/vocabulary.md`

1. It is one file, beside `rules/`, holding the terms and substitutions a project settles for itself.
2. It has the same shape as a package's `vocabulary.md`.
3. It takes no datetime prefix. It is a structural file, not a dated decision. See the file-names rule.
4. It is read at session start and binds, as the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says. That is why it sits beside `rules/`, not in a working directory.
5. It is optional, and its absence is not a defect.
6. Write no such file until there is a term to write.
7. It is not a rule. Do not put it in `rules/`.

## Saying how an entry relates to a general term

1. Where a package narrows a term, its entry names the general term it narrows.
2. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason.
3. A reader must not have to work out which case an entry is. The entry says whether it narrows or replaces the general term.

## Compression

- 2026-11-05, written: split from the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule, carrying its writing part; checked: 37 directives, 31 kept, 6 less precise, 0 lost, 4 repairs, to the reservation categories, ordinary vocabulary, and discontinuations; re-checked: 37 directives, 34 kept, 3 less precise, 0 lost. Left less precise: that STE Rule 1.8 names a technical noun's subject field, why the project vocabulary is kept out of `rules/`, and that an entry says plainly when it keeps a word `language` substitutes away

## History

Until Thu Nov 5 2026 this rule's text was part of the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule, which was pre-loaded whole. The engineer had it split, so the part for writing a vocabulary loads only when one is written.

Related:

- the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule — using a vocabulary, and which one decides
- the a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more rule — what an entry says
- the `language` package's a-word-is-reserved-in-six-steps rule — reserving a word
- the file-names rule — why the project's file takes no prefix

---

Authored by Scott Bellware on Thu Nov 5 2026 at 9:09:06 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
