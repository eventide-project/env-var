# Testing — Vocabulary

The testing package's vocabulary: the terms it defines and the word substitutions it enforces, for controls-based test-writing. Binding — use these terms and swaps in tests, rules, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **controls** — the known, deterministic inputs a test is built from: the helpers that build example values, the example values themselves, and the pre-actuation setup that establishes them. A test reads **control → actuate → observe**. The conventions that hold the term in place — controls never "factories" / "fixtures" / "arrange", the `control_` variable prefix, and the "some" string value — are the package's control rules. **STE: absent from the STE dictionary as a plural. `CONTROL (n)` is approved, meaning something that controls, which is the singular sense this narrows. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**
- **precondition** — a bare `assert` or `refute` that is **not** a test. It is written to **document a factor that decides the test's outcome** where the test script does not express it. That factor is most often a property of a **control**, whose value is named rather than described. It documents by asserting, so the clarification is checked rather than merely claimed. It **qualifies** the test rather than preventing a regression: when a precondition fails, the test's result is *meaningless*, not wrong. It carries no name because its predicate reads inline as the name, and it sits immediately before what it qualifies. **STE: absent from the STE dictionary. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**
- **uncontested** — of a test: it passes without any implementation being written to meet it, because the behavior it checks already exists. A test is *contested* when it fails until code is written to satisfy it, which is how a DBE test drives a design. An uncontested test drives nothing, so it is coverage rather than design. The word is taken from a no-bid contract, which is awarded without a competing bid. Taxonomically such a test is a **confirming test**. **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.**

## Substitutions

Test-domain word substitutions. When the impulse is a word in the **Don't use** column, write the **Use** term.

| Use | Don't use | Meaning |
|---|---|---|
| **verified** | "green" | passing tests, and the report that tests pass — see below. **STE: absent from the STE dictionary. `verify (v)` is not approved and gives MAKE SURE (v). Technical verb, STE category 2b, computer processes and applications, user interface and application processes, where the dictionary's own list gives `validate`. `verified` is its past participle used as an adjective, which STE Rule 1.13 permits** |
| **prevent** | "guard" / "protect" | what a test does to a regression — see below. **STE: `PREVENT (v)` is approved, and used with its approved meaning** |

### Finer distinctions

- **verified** governs the *report*, not the cycle. Where "green" names a state in the red/green cycle rather than a claim that behavior is confirmed, it stands — the **red/green loop** keeps its name. Prefer "Verified: N tests" over "the suite is verified at N" (technobabble).
- **prevent** — a test **prevents** a regression (a regression in the behavior, the delegation, the seam). The STE dictionary replaces `protect` with PREVENT, and the two differ in what they take as an object: `protect` names the thing kept safe, `prevent` names the thing stopped. Write what is stopped. Keep "guard clause" for the early-return control-flow construct. A test's role is "prevent", never "guard".

## Compressed


## Terms

1. **controls**: the known, deterministic inputs a test is built from. They are the helpers that build example values, the example values themselves, and the pre-actuation setup that establishes them.
2. A test reads **control → actuate → observe**.
3. The package's control rules hold the term in place: the `control_` variable prefix and the "some" string value.
4. **precondition**: a bare `assert` or `refute` that is not a test. It documents a factor that decides the test's outcome, where the test script does not express it.
5. That factor is most often a property of a control. Name its value rather than describe it.
6. A precondition documents by asserting, so the clarification is checked.
7. A precondition qualifies the test. It does not prevent a regression. When it fails, the test's result is meaningless, not wrong.
8. A precondition carries no name. Its predicate reads inline as the name. It sits immediately before what it qualifies.
9. **uncontested**: of a test, it passes without any implementation written to meet it, because the behavior it checks already exists.
10. A test is **contested** when it fails until code is written to satisfy it, which is how a DBE test drives a design.
11. Taxonomically an uncontested test is a **confirming test**.

## Substitutions

1. Write **verified**, not "green", for passing tests and for the report that tests pass.
2. Write **prevent**, not "guard" or "protect", for what a test does to a regression.

## Finer distinctions

1. **verified** governs the report, not the cycle. Where "green" names a state in the red/green cycle rather than a claim that behavior is confirmed, it stands. The **red/green loop** keeps its name.
2. Write "Verified: N tests", not "the suite is verified at N".
3. A test **prevents** a regression: in the behavior, the delegation, or the seam.
4. `protect` names the thing kept safe, and `prevent` names the thing stopped. Write what is stopped.
5. Keep "guard clause" for the early-return control-flow construct.
6. A test's role is "prevent", never "guard".

## Compression

- 2026-10-29, compressed: 4004 → 3693 characters; checked: 39 directives, 38 kept, 0 less precise, 1 lost; nothing repaired, the items not kept being reasons or background
- 2026-10-29, revised: the head line saying every word is approved or reserved is left out of the compressed text, at the engineer's direction, since the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule states it in the read
- 2026-10-29, revised: the lines naming the vocabulary and saying it is binding are left out of the compressed text, at the engineer's direction; the loader names the file, and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says every vocabulary binds
- 2026-10-29, revised: the definitions of *controls* and *precondition* are restored, at the engineer's direction, since a vocabulary entry keeps its term's meaning
- 2026-11-05, revised: each entry's STE note is left out of the compressed text, at the engineer's direction; it matters only when a word is reserved or an entry written, and the full text keeps it

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 10:22:47 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:00:02 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:55:34 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:04:03 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:41:44 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:33:19 PM PT
