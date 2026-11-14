# Rules may establish a mindset rather than a mechanic

**Trigger:** When writing or changing a rule file

A rule's package — `language`, `testing`, `git`, and the others — names the **surface** a rule acts on (words, commits, tests, code), not the **purpose** it serves. A large share of rules exist to establish a **mental stance**, which is a way of thinking about the code and the work. They do not exist to standardize a mechanic. Purpose is not confined to category. Two rules in different packages can be doing the same work, and a rule's real justification is often not visible from its package.

- **Terminology is the purest case.** Every terminology rule is an X-not-Y substitution (controls-not-factories, name-concepts-literally-not-by-analogy-code-or-jargon rule). None change what the code *does*. Each swaps a word to swap the concept the word installs. Vocabulary is the most direct lever on a mental model.
- **The same purpose recurs under other categories, through other levers.** The subject-first commit-message rule sits in the `git` package, but its point — state what changed about the code, not what the engineer did, because centering the engineer reinforces anthropocentrism — is a mindset rule reached through a *grammar* lever (passive voice, indicative mood) rather than a vocabulary one.
- **The reach can exceed the artifact.** The no-slang rule extends to conversation with the user, not only what goes into the codebase, because the mindset it preserves lives in the person, not the artifact.

**Why:** Read as local conventions, these rules look like an arbitrary list of do-this-not-that. Read for purpose, they are one stance expressed through many levers. Naming the purpose keeps them coherent, and prevents contradictory rules from accreting in other packages. It also gives the right test for judging a rule. A rule that establishes a stance is judged by the mindset it produces, not by surface conformance. A rule that is technically obeyed while the intended stance is absent has failed.

**How to apply:** When writing or evaluating a rule, ask first *"what stance does this establish?"*. Do not ask only *"what does it standardize?"*. Place it by the surface it acts on, which is its package.

State its purpose, the mindset, in the rule's body. Cross-reference sibling rules that establish the same stance through a different lever, even where they live in other packages. When two rules seem to conflict, reconcile at the level of purpose, not surface. Do not treat package membership as the whole of a rule's meaning.

## Compressed

1. A rule's package names the surface it acts on, such as words, commits, tests, or code. It does not name the purpose the rule serves.
2. Many rules exist to establish a mental stance, a way of thinking about the code and the work, rather than to standardize a mechanic.
3. Purpose is not confined to category. Rules in different packages can serve the same purpose.
4. A rule's real justification is often not visible from its package.
5. Terminology rules are the purest case. Each is an X-not-Y substitution (controls-not-factories, name-concepts-literally-not-by-analogy-code-or-jargon rule) that swaps a word to swap the concept it installs.
6. Terminology rules do not change what the code does.
7. The same purpose recurs under other packages through other levers. The `git` subject-first commit-message rule is a mindset rule reached through grammar (passive voice, indicative mood).
8. That rule states what changed about the code, not what the engineer did, because centering the engineer reinforces anthropocentrism.
9. A rule's reach can exceed the artifact. The no-slang rule extends to conversation with the user, because the mindset it preserves lives in the person.
10. When writing or evaluating a rule, first ask *"what stance does this establish?"*. Do not ask only *"what does it standardize?"*.
11. Place a rule in a package by the surface it acts on.
12. State the rule's purpose, the mindset, in its body.
13. Cross-reference sibling rules that establish the same stance through a different lever, including rules in other packages.
14. When two rules seem to conflict, reconcile them at the level of purpose, not surface.
15. Do not treat package membership as the whole of a rule's meaning.
16. Judge a stance-establishing rule by the mindset it produces, not by surface conformance.
17. A rule that is technically obeyed while the intended stance is absent has failed.

## Compression

- 2026-10-24, compressed: compression 0.15, change 0.62, solubility 61 → 78, clarity 0.54 → 0.81, 12 directives, 12 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 78 → 80, clarity 0.81 → 0.85; checked: 9 directives, 9 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When writing, evaluating, placing, or reconciling conflicting rules*, which was not a safe one.

Until Sun Oct 25 2026 this rule was named rules-establish-a-mindset-purpose-over-category and titled "A rule's purpose is not confined to its category — many rules establish a mindset".

Until Mon Oct 26 2026 this rule was named a-rules-purpose-is-not-confined-to-its-category and titled "A rule's purpose is not confined to its category".

Related:

- the subject-first commit-message rule in the `git` package
- the `language` package's rules as a set
- its `name-concepts-literally-not-by-analogy-code-or-jargon` and `no-slang` rules in particular

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
Changed by Scott Bellware on Tue Oct 20 2026 at 12:49:37 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:42 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:19:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
