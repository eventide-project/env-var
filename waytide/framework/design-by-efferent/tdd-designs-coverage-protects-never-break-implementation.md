# TDD designs behavior; adding coverage protects it — distinct activities; never break an implementation to introduce a test

Tests serve two different purposes in two different processes, and conflating them
causes unnatural changes:

- **TDD is a design activity.** The failing-test-then-implement cycle is an
  instrument for *designing* behavior — tests used as **proofs for design**. The
  red is what drives the implementation into existence. This is the genus DBE
  belongs to, and the reason the methodology's name says *Design*.
- **Adding test coverage is a separate activity** — **protecting existing
  behavior against regression**. It happens *past* the point TDD is concerned
  with: the behavior is already designed and correct. Here tests are **regression
  protection**, not design proofs. It is a testing / final-inspection process, not
  TDD.

**When adding coverage, green-on-arrival is inevitable and correct.** The behavior
already exists, so the test passes immediately. That *is the point* — the
behavior is now protected. It is the nature of coverage, not a defect to engineer
around, and the no-green-on-arrival stance is a design concern that does not
apply here.

**Never break, mutate, or otherwise invalidate a working implementation to
introduce a test** — e.g. to "see it go red first." That inverts the relationship
(making correct code fail a ritual), forces unnatural changes to shipped code, and
muddies the distinction between designing with tests and protecting with tests.
There is no red to manufacture when covering behavior that already exists.

**Why:** TDD's red→green belongs to design; force-fitting it onto a
coverage / final-inspection process is a category error. Keeping the two distinct
keeps design honest (tests as design proofs) and coverage honest (tests as regression
protection), and stops shipped implementations from being deformed to satisfy a
misplaced ritual.

**How to apply:** when the behavior already exists and you are adding coverage,
write the test, run it, accept that it is verified, and leave the implementation untouched.
Reserve the failing-test-first cycle for design, where a test drives new behavior into
existence. Related: the companion rule "the hinges gate the design of a test" (they still
apply when writing coverage), the first-implementation-red-green rule (which permits a
*contained* red while designing new behavior), the DBE-as-design-tool rule, the
no-green-on-arrival rule, and the hinge-cycle rule.

---

Authored by Scott Bellware on Wed Jul 1 2026 at 6 PM PT
