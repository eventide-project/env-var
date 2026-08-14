# A rule's purpose is not confined to its category — many rules establish a mindset

Rule folders — `terminology/`, `methodology/`, `git/`, `test-writing/`, `code/` — name the **surface** a rule acts on (words, commits, tests, code), not the **purpose** it serves. A large share of rules exist to establish a **mental stance**, which is a way of thinking about the code and the work. They do not exist to standardize a mechanic. Purpose is not confined to category. Two rules in different folders can be doing the same work, and a rule's real justification is often not visible from its folder.

- **Terminology is the purest case.** Every terminology rule is an X-not-Y substitution (controls-not-factories, name-literally-not-by-analogy). None change what the code *does*. Each swaps a word to swap the concept the word installs. Vocabulary is the most direct lever on a mental model.
- **The same purpose recurs under other categories, through other levers.** The subject-first commit-message rule sits under `methodology/`, but its point — state what changed about the code, not what the engineer did, because centering the engineer reinforces anthropocentrism — is a mindset rule reached through a *grammar* lever (passive voice, indicative mood) rather than a vocabulary one.
- **The reach can exceed the artifact.** The no-slang rule extends to conversation with the user, not only what goes into the codebase, because the mindset it preserves lives in the person, not the artifact.

**Why:** Read as local conventions, these rules look like an arbitrary list of do-this-not-that. Read for purpose, they are one stance expressed through many levers. Naming the purpose keeps them coherent, and prevents contradictory rules from accreting in other folders. It also gives the right test for judging a rule. A rule that establishes a stance is judged by the mindset it produces, not by surface conformance. A rule that is technically obeyed while the intended stance is absent has failed.

**How to apply:** When writing or evaluating a rule, ask first *"what stance does this establish?"*. Do not ask only *"what does it standardize?"*. File it by the surface it acts on, which is its folder.

State its purpose, the mindset, in the rule's body. Cross-reference sibling rules that establish the same stance through a different lever, even where they live in other folders. When two rules seem to conflict, reconcile at the level of purpose, not surface. Do not treat folder membership as the whole of a rule's meaning.

Related:

- the subject-first commit-message rule in the `git` package
- the `language` package's rules as a set
- its `name-literally-not-by-analogy` and `no-slang` rules in particular

---

Authored by Scott Bellware on Mon Jul 13 2026 at 2 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:52:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:50:46 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
