# TDD designs behavior, coverage prevents regression, and neither breaks an implementation

Tests serve two different purposes in two different processes, and conflating them causes unnatural changes:

- **TDD is a design activity.** The failing-test-then-implement cycle is an instrument for *designing* behavior — tests used as **proofs for design**. The red is what drives the implementation into existence. This is the genus DBE belongs to, and the reason the methodology's name says *Design*.
- **Adding test coverage is a separate activity** — **preventing a regression in existing behavior**. It happens *past* the point TDD is concerned with: the behavior is already designed and correct. Here tests are **regression prevention**, not design proofs. It is a testing / final-inspection process, not TDD.

**When adding coverage, an uncontested test, one that passes without any implementation written to meet it, is inevitable and correct.** The behavior already exists, so the test passes immediately. That *is the point* — a regression in that behavior is now prevented. It is the nature of coverage, not a defect to engineer around, and the stance that such a test is coverage rather than design is a DBE concern that does not apply here.

**Never break, mutate, or otherwise invalidate a working implementation to introduce a test.** Do not do it to "see it go red first." That inverts the relationship, making correct code fail a ritual. It forces unnatural changes to shipped code, and muddies the distinction between designing with tests and preventing regression with tests. There is no red to manufacture when covering behavior that already exists.

**Why:** TDD's red→green belongs to design. Force-fitting it onto a coverage / final-inspection process is a category error. Keeping the two distinct keeps design honest and coverage honest. Design tests are proofs, and coverage tests are regression prevention. It also stops shipped implementations from being deformed to satisfy a misplaced ritual.

**How to apply:** when the behavior already exists and you are adding coverage, write the test and run it. Accept that it is verified, and leave the implementation untouched. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.

## Compressed

1. TDD is a design activity. Its failing-test-then-implement cycle designs behavior, and its tests are proofs for design.
2. In TDD, the red drives the implementation into existence.
3. Adding test coverage is a separate activity. It prevents regression in existing behavior that is already designed and correct.
4. Coverage tests are regression prevention, not design proofs. Adding coverage is a testing or final-inspection process, not TDD.
5. When adding coverage, an uncontested test, one that passes without any implementation written to meet it, is inevitable and correct. Do not treat it as a defect to work around.
6. The stance that such a test is coverage rather than design is a DBE concern. It does not apply to adding coverage.
7. Never break, mutate, or otherwise invalidate a working implementation to introduce a test.
8. Do not break working code to "see it go red first." There is no red to manufacture when covering existing behavior.
9. When the behavior already exists and you are adding coverage, write the test and run it.
10. Accept the passing coverage test as verification, and leave the implementation untouched.
11. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.

## Compression

- 2026-10-24, compressed: compression 0.36, change 0.64, solubility 68 → 85, clarity 0.65 → 0.86, 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-27, re-checked: 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-27, revised: *uncontested* replaces "passes when first run", a term the engineer settled; not checked
- 2026-10-28, revised: Why points removed, solubility 85 → 86, clarity 0.86 → 0.89; checked: 8 directives, 8 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named tdd-designs-coverage-prevents-never-break-implementation and titled "TDD designs behavior, and adding coverage prevents its regression — distinct activities, and an implementation is never broken to introduce a test".

Until Mon Oct 26 2026 this rule called a test that passes when first run "green-on-arrival". The engineer settled on the literal phrase.

Until Tue Oct 27 2026 this rule called such a test one that "passes when first run". The engineer settled on *uncontested*, reserved in the `testing` vocabulary.

Related:

- the companion rule "the design of a test waits at the hinges" — they still apply when writing coverage
- the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule — which offers a *contained* red as a candidate while designing new behavior
- the DBE-as-design-tool rule
- the a-test-of-behavior-that-already-exists-is-coverage-not-design rule
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- the `testing` vocabulary — *uncontested*

---

Authored by Scott Bellware on Wed Jul 1 2026 at 6 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:38:31 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:05 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:34:57 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:28:05 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:00:02 PM PT
