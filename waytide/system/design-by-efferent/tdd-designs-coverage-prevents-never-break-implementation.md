# TDD designs behavior, and adding coverage prevents its regression — distinct activities, and an implementation is never broken to introduce a test

Tests serve two different purposes in two different processes, and conflating them causes unnatural changes:

- **TDD is a design activity.** The failing-test-then-implement cycle is an instrument for *designing* behavior — tests used as **proofs for design**. The red is what drives the implementation into existence. This is the genus DBE belongs to, and the reason the methodology's name says *Design*.
- **Adding test coverage is a separate activity** — **preventing a regression in existing behavior against regression**. It happens *past* the point TDD is concerned with: the behavior is already designed and correct. Here tests are **regression regression prevention**, not design proofs. It is a testing / final-inspection process, not TDD.

**When adding coverage, green-on-arrival is inevitable and correct.** The behavior already exists, so the test passes immediately. That *is the point* — the a regression in that behavior is now prevented. It is the nature of coverage, not a defect to engineer around, and the no-green-on-arrival stance is a design concern that does not apply here.

**Never break, mutate, or otherwise invalidate a working implementation to introduce a test.** Do not do it to "see it go red first." That inverts the relationship, making correct code fail a ritual. It forces unnatural changes to shipped code, and muddies the distinction between designing with tests and preventing regression with tests. There is no red to manufacture when covering behavior that already exists.

**Why:** TDD's red→green belongs to design. Force-fitting it onto a coverage / final-inspection process is a category error. Keeping the two distinct keeps design honest and coverage honest. Design tests are proofs, and coverage tests are regression prevention. It also stops shipped implementations from being deformed to satisfy a misplaced ritual.

**How to apply:** when the behavior already exists and you are adding coverage, write the test and run it. Accept that it is verified, and leave the implementation untouched. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.

Related:

- the companion rule "the design of a test waits at the hinges" — they still apply when writing coverage
- the the-implementation-hinge-offers-the-red-green-refactor-cycle rule — which offers a *contained* red as a candidate while designing new behavior
- the DBE-as-design-tool rule
- the no-green-on-arrival rule
- the hinge-cycle rule

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
