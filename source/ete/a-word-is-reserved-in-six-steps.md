# A word is reserved in six steps

**Trigger:** When asked to reserve a word (e.g. "Slasher reserves the word, X", or `/reserve X`)

**Each step is stated in some rule, and the sequence is stated here.** A writer who reserves a word without the sequence reconstructs it, or picks a category by feel.

**The instruction that starts the sequence is "Slasher reserves the word, X", or the command `/reserve X`.** It names the word and asks for all six steps. So the sequence does not have to be spelled out each time a term is settled.

**The verb is `reserves`, and never `claims`.** STE Rules 1.5, 1.6, and 1.12 permit a project to add its own technical nouns and technical verbs. A reservation is made under those rules. A claim asserts a right that no rule granted, so it names the wrong act.

**1. Look the word up in the STE dictionary.** Three outcomes. The word is approved, with the one meaning it may carry. The word is not approved, and the dictionary names the approved word that replaces it. The word is absent from the STE dictionary. This step is mechanical.

**2. Ask what the word names.** A word that names something in the subject field is terminology, and the sequence continues. A word that qualifies, joins two statements, or does the sentence's grammatical work is ordinary vocabulary. Stop there and write no entry, per the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule.

**3. Decide noun or verb.** A word used both ways takes a category for each. STE Rule 1.7 forbids a technical noun used as a verb, and STE Rule 1.13 forbids a technical verb used as a noun. Two decisions, not one.

**4. Try an STE category first.** STE Rule 1.5 gives twenty-two noun categories and STE Rule 1.12 gives four verb categories. Slasher's terms land in a narrow band of them. That is noun categories 7, 11, 15, and 19, and verb category 2.

**5. Fall to an ETE category only where no STE category holds the word.** There are five, and the ete-declares-its-own-categories rule declares them. That rule also states this step in its own words: reach for an STE category first.

**6. Write the entry** in the vocabulary of the package whose domain the term belongs to, per the foundation a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved. The entry gives the definition, what the STE dictionary says about the word, and the category.

**A term is a design decision, so the engineer decides it.** Put the category to them through the selection UI. Bring the lookup in step 1 already done, and the candidate categories named. Steps 4 and 5 are judgment, and step 1 is not.

**The phrase reserves the word. It does not order a sweep.** A reservation settles what a word means in Slasher's prose from that point. Replacing some other word with it, wherever that other word already stands, is a separate instruction and is asked for separately. Conform no existing prose until it is.

**Why:** the six steps were settled one at a time, in three rules that each state their own part. A writer reserving a word had to read all three and infer the order. That is how a category gets picked by feel, and how the ETE categories become where every hard word goes.

The order is not arbitrary. Step 2 comes before step 3 because an ordinary word never reaches a part-of-speech decision. Step 4 comes before step 5 because an ETE category is a departure from the standard. A departure is taken only where the standard has nothing.

**How to apply:** run the six steps in order for every word reserved. Start them on the words *Slasher reserves the word, X*, and write `reserves` rather than `claims` for the act. Do not skip step 2, which is the one that keeps the ETE categories from absorbing the ordinary vocabulary. Do not reach step 5 until an STE category has been tried and refused.

Reserve the word and stop there. Conform existing prose to it only where that is asked for separately.

## Compressed

1. Reserve a word by following these six steps in order, every time a word is reserved.
2. The instruction that starts the sequence is "Slasher reserves the word, X", or the command `/reserve X`. It names the word and asks for all six steps.
3. The sequence does not have to be spelled out each time a term is settled.
4. Write the verb as `reserves`, and never `claims`.
5. A reservation is made under STE Rules 1.5, 1.6, and 1.12, which let a project add its own technical nouns and verbs.
6. Step 1: look the word up in the STE dictionary. This step is mechanical.
7. The lookup has three outcomes. The word is approved, with the one meaning it may carry.
8. Or the word is not approved, and the dictionary names the approved word that replaces it.
9. Or the word is absent from the STE dictionary.
10. Step 2: ask what the word names. Do not skip this step.
11. If the word is terminology, continue the sequence.
12. If the word is ordinary vocabulary, stop.
13. Step 3: decide noun or verb.
14. A word used both ways takes a category for each. These are two decisions, not one.
15. STE Rule 1.7 forbids a technical noun used as a verb. STE Rule 1.13 forbids a technical verb used as a noun.
16. Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories.
17. Slasher's terms land in noun categories 7, 11, 15, and 19, and verb category 2.
18. Step 5: use an ETE category only where no STE category holds the word.
19. Do not reach step 5 until an STE category has been tried and refused.
20. The five ETE categories are declared in the ete-declares-its-own-categories rule.
21. Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved.
22. The entry gives the definition.
23. The engineer decides the term's category, because a term is a design decision.
24. Put the category to the engineer through the selection UI.
25. Bring the step 1 lookup already done, and name the candidate categories.
26. Steps 4 and 5 are judgment. Step 1 is not.
27. The phrase reserves the word and does not order a sweep.
28. A reservation settles what the word means in Slasher's prose from that point on.
29. Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately.
30. Do not conform existing prose until that separate instruction is given.

## Compression

- 2026-10-28, revised: Why points removed, solubility 65, clarity 0.77; checked: 19 directives, 18 kept, 1 less precise, 0 lost
- 2026-11-05, revised: `/reserve X` is a command that starts the sequence; checked: 19 directives, 17 kept, 2 less precise, 0 lost. Left less precise, untouched by this revision: the test for ordinary vocabulary, which the Related rule gives, and that the entry records the STE result and the category

Related:

- the ete-declares-its-own-categories rule — the five ETE categories, and the reach-for-STE-first instruction
- the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule — where step 2 stops
- the ete-fixes-the-meaning-of-a-word-in-its-category rule — the meaning a reserved word takes
- the slasher-keeps-its-word-where-the-ste-word-means-something-else rule — the order the dictionary and Slasher's vocabulary decide in
- the foundation a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved — which vocabulary the entry is written in
- the foundation present-every-prompt-to-the-engineer-through-the-selection-ui rule — how the decision is put

---

Authored by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:11:32 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 5:52:32 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
