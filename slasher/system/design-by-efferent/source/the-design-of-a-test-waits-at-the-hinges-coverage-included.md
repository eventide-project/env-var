# The design of a test waits at the hinges, coverage included

**Trigger:** When creating or editing a file under `test/`

The five hinges are actuation, observation, controls, implementation, and naming. They are where **design decisions** wait, and *designing a test* is itself a design act. That holds whether behavior is being designed (DBE) or existing behavior is being covered (testing). So the hinges are in play when writing coverage, not only when designing.

When adding coverage for behavior that already exists, all five are in play:

- **Actuation** — confirm the actuation's shape.
- **Controls** — a real decision: how to construct the situation the test needs (e.g. an inherited-only constant via an `include` relationship).
- **Observation** — a real decision: what to read about the behavior's effect, and how.
- **Naming** — the outcome contexts, settled at the close.
- **Implementation** — in play but **degenerate**: there is no new code to write and no red to drive. It reduces to running the test against the existing implementation and confirming it passes. **Solubility is still judged** — if the test reads awkwardly against clean code, the fix goes to the **test** (its control / actuation / observation), never to the implementation.

**Why:** the hinges are the mechanism for handing each design decision to the human at its gate. A coverage test has genuine design decisions — especially its controls and observations — so it justifies the same wait. What separates coverage from design is **not** the absence of hinges. It is that no behavior is being designed and no red is driven. See the companion rule: TDD designs, coverage prevents, and an implementation is never broken to introduce a test.

**How to apply:** design a coverage test through the hinges as usual. They are actuation, controls, observation, and naming, with a wait at each for the human. Treat the implementation hinge as a confirmation step: run it, and show it verified. Send any awkwardness back to the test, not to the implementation.

## Compressed

1. The five hinges are actuation, observation, controls, implementation, and naming.
2. Designing a test is a design act, so the design of a test waits at the hinges.
3. This holds both when designing behavior (DBE) and when covering existing behavior (testing).
4. The hinges apply when writing coverage, not only when designing.
5. When adding coverage for existing behavior, all five hinges are in play.
6. Wait for the human at each hinge.

## Hinges when adding coverage

1. **Actuation**: confirm the actuation's shape.
2. **Controls**: decide how to construct the situation the test needs. An example is an inherited-only constant set up through an `include` relationship.
3. **Observation**: decide what to read about the behavior's effect, and how to read it.
4. **Naming**: settle the outcome contexts at the close.
5. **Implementation**: this hinge is in play but degenerate. There is no new code to write and no red to drive.
6. At the implementation hinge, run the test against the existing implementation and confirm that it passes.
7. Show the implementation hinge as verified.
8. Solubility is still judged at the implementation hinge.
9. If the test reads awkwardly against clean code, fix the test's control, actuation, or observation.
10. Never change the implementation to resolve that awkwardness.

## Compression

- 2026-10-24, compressed: compression 0.14, change 0.57, solubility 71 → 89, clarity 0.63 → 0.93, 14 directives, 14 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 89 → 91, clarity 0.93 → 0.98; checked: 10 directives, 10 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When writing a test to cover behavior that already exists*, which was not a safe one.

Until Sun Oct 25 2026 this rule was named the-design-of-a-test-waits-at-the-hinges-including-coverage and titled "The design of a *test* waits at the hinges — they apply to coverage too, with the implementation hinge degenerate".

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule
- the companion tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation rule

---

Authored by Scott Bellware on Wed Jul 1 2026 at 6 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:39:25 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:01 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:09 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
