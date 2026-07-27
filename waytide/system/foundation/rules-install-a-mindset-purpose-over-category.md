# A rule's purpose may cut across its category — many rules install a mindset

Rule folders — `terminology/`, `methodology/`, `git/`, `test-writing/`, `code/` — name the **surface** a rule acts on (words, commits, tests, code), not the **purpose** it serves. A large share of rules exist to install a **mental stance** — a way of thinking about the code and the work — rather than to standardize a mechanic. Purpose cuts across category: two rules in different folders can be doing the same work, and a rule's real justification is often not visible from its folder.

- **Terminology is the purest case.** Every terminology rule is an X-not-Y substitution (controls-not-factories, name-literally-not-by-analogy). None change what the code *does*; each swaps a word to swap the concept the word installs. Vocabulary is the most direct lever on a mental model.
- **The same purpose recurs under other categories, through other levers.** The subject-first commit-message rule sits under `methodology/`, but its point — state what changed about the code, not what the developer did, because centering the developer reinforces anthropocentrism — is a mindset rule reached through a *grammar* lever (passive voice, indicative mood) rather than a vocabulary one.
- **The reach can exceed the artifact.** The no-slang rule extends to conversation with the user, not only what goes into the codebase, because the mindset it protects lives in the person, not the artifact.

**Why:** Read as local conventions, these rules look like an arbitrary list of do-this-not-that. Read for purpose, they are one stance expressed through many levers. Naming the purpose keeps them coherent, prevents contradictory rules from accreting across folders, and gives the right test for judging a rule: a stance-installing rule is judged by the mindset it produces, not by surface conformance. A rule that is technically obeyed while the intended stance is absent has failed.

**How to apply:** When writing or evaluating a rule, ask first *"what stance does this install?"*, not only *"what does it standardize?"*. File it by the surface it acts on (its folder), but state its purpose — the mindset — in the rule's body, and cross-reference sibling rules that install the same stance through a different lever even when they live in other folders. When two rules seem to conflict, reconcile at the level of purpose, not surface. Do not treat folder membership as the whole of a rule's meaning. Related: the subject-first commit-message rule in the `git` package, the `language` package's rules as a set, and its `name-literally-not-by-analogy` and `no-slang` rules in particular.

---

Authored by Scott Bellware on Mon Jul 13 2026 at 2 PM PT
