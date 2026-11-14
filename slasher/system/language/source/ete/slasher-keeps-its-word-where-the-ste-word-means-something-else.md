# Slasher keeps its word where the STE word means something else

- **Solubility:** 50
- **Original rank:** 55 of 106
- **Unclarity:** 0.23

Slasher writes its prose in ASD-STE100 Simplified Technical English. The standard gives an approved dictionary and 53 writing rules. It also permits a project to add its own technical nouns and technical verbs. STE Rules 1.5 through 1.13 govern that.

**The rules in this directory are Eventide Technical English, or ETE.** That is Slasher's implementation of the standard. The STE dictionary and the STE writing rules, with Slasher's reserved terms and its substitutions, in the order this rule states. **`Say it in ETE` is the instruction to write that way.** It is not the same request as `say it in STE`. That one asks for the raw standard, and forbids `efferent`, `cradle`, `hinge`, and every other term Slasher reserved.

**This rule states the sequence.** The STE dictionary decides first. Slasher keeps its own word where the STE dictionary's approved word means something else.

**Three rules beside this one carry ETE's departures from the standard.** The ete-declares-its-own-categories rule adds five categories of Slasher's own, against STE Rule 1.5 and STE Rule 1.12. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take the meaning its entry gives, against STE Rule 1.3. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone, against STE Rule 1.1.

## The two answers the STE dictionary can give

The STE dictionary marks a word as approved or as not approved, or it does not list the word at all. For a word that is not approved, the STE dictionary names an approved alternative.

- **Use the alternative** where it carries the meaning. `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
- **Keep Slasher's word** where the approved word means something else. Reserve it as a technical noun or a technical verb, in a category the entry names. Record it in the package's `vocabulary.md`. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
- **A word the STE dictionary does not list is not a defect.** STE Rule 1.1 permits an absent word as a technical noun or a technical verb. `efferent`, `cradle`, and `solubility` are all absent.

**The worked instance is `sweep`.** The STE dictionary replaces `sweep (v)` with `SCAN`, as in `MAKE A SCAN OF THE …`. The `language` vocabulary discontinues `sweep` for **`conform`**. Neither `SCAN` nor `AGREE`, which the STE dictionary gives for `conform`, carries the meaning. The meaning is to bring code or prose into line with a convention. So `conform` is reserved and it wins.

## An absent word and a word that is not approved cost different things

**Absent is a gap.** The standard never considered the word. This is the ordinary case for a term Slasher coined for a concept the standard has no word for.

**Not approved is a disagreement.** The standard considered the word and named something else. A reservation there rejects a stated decision, so the record says which case a reserved term is in.

`reserve` is absent. `discontinue` is not approved, and the STE dictionary gives `STOP`.

## A substitution is not a reservation

The two are different acts. A **substitution** replaces a word Slasher rejects. A **reservation** keeps a word STE rejects. `conform` is the two, which is why it reads as one thing.

**Why:** the standard and Slasher's vocabulary disagree in a small number of places. Each disagreement is settled the same way every time it is met, unless a rule settles it once. The dictionary is right about the ordinary word. It is not right about a term Slasher coined for a concept the standard never addressed. Naming which decides, and when, keeps a writer from choosing a worse word out of deference.

**How to apply:** write to the STE dictionary. Where the STE dictionary names an alternative, use it. Where the approved word means something else, keep Slasher's word. Reserve it in the package's `vocabulary.md`, in a category the entry names. Record what the STE dictionary says about it.

## Compressed

1. Slasher writes its prose in ASD-STE100 Simplified Technical English, which has an approved dictionary and 53 writing rules.
2. STE Rules 1.5 through 1.13 let a project add its own technical nouns and technical verbs.
3. The rules in this directory are Eventide Technical English, or ETE, which is Slasher's implementation of the standard.
4. ETE is the STE dictionary and writing rules, with Slasher's reserved terms and its substitutions, in the sequence this rule states.
5. `Say it in ETE` asks for ETE.
6. `Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Slasher reserved.
7. The STE dictionary decides first.
8. For a word the STE dictionary does not approve, it names an approved alternative.
9. Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
10. Keep Slasher's word where the approved word means something else.
11. Reserve that word in the package's `vocabulary.md`.
12. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
13. A word the dictionary does not list is not a defect.
14. STE Rule 1.1 permits an unlisted word as a technical noun or a technical verb, as with `efferent`, `cradle`, and `solubility`.
15. The worked instance is `sweep`: the STE dictionary replaces `sweep (v)` with `SCAN`.
16. Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins.
17. A substitution replaces a word Slasher rejects.
18. A reservation keeps a word STE rejects.
19. A substitution and a reservation are different acts, and `conform` is both.
20. An absent word and a word that is not approved differ.
21. An absent word is a gap: the standard never considered it, as with most terms Slasher coined.
22. A word that is not approved is a disagreement: the standard considered it and named something else.
23. A reservation of a word that is not approved rejects the standard's decision.
24. So the record says which case a reserved term is in.
25. `reserve` is absent.
26. `discontinue` is not approved, and the dictionary gives `STOP`.
27. Three rules beside this one carry ETE's departures from the standard.
28. The ete-declares-its-own-categories rule adds five categories of Slasher's own, against STE Rules 1.5 and 1.12.
29. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3.
30. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1.

## Compression

- 2026-10-28, revised: Why points removed, solubility 64, clarity 0.83; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was titled "Waytide keeps its own word where the STE dictionary's approved word means something else".

Related:

- the slasher-prose-conforms-to-the-ste-writing-rules rule in this directory
- the a-word-is-reserved-in-six-steps rule — the sequence this rule's step sits in
- the ete-declares-its-own-categories rule — the categories a reserved word is named in
- the ete-fixes-the-meaning-of-a-word-in-its-category rule — the meaning a reserved word takes
- the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule — the words that are left alone
- the `language` package's `vocabulary.md` and its language-is-used-precisely-here-and-words-are-load-bearing rule
- the specification at `slasher/local/reference/`, which is the authority this rule defers to

---

Authored by Scott Bellware on Sat Aug 8 2026 at 8:11:28 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:50:31 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 2:01:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:09:30 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 6:24:18 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:34:11 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:40:50 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:32 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
