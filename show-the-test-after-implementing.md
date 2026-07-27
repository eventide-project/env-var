# Always show the test once the unit has been implemented

In the loop, after the actuation gate — once the unit is brought into existence and the test is run to confirm — **display the just-satisfied test (and the run result) without being asked.** Do not wait for a "show me the test" request. At the moment of implementation, the human always sees the test the implementation now satisfies.

**Why:** the test is the cradle — the efferent contract the implementation answers to. Seeing it alongside the confirmed implementation is what lets the human judge **solubility** (how readily the unit dissolves into use) against the actual observed behavior, which is the next gate. Surfacing it automatically keeps the loop's load-bearing artifact in view instead of making the human ask for it each turn.

**How to apply:** when reporting that the unit is implemented and the test confirms, include the test file's content (and the run output) in the same turn, then hand over the solubility gate. Related: the first-turn / first-gate rule, the human-in-the-loop rule (gate on the actuation and on solubility), the show-feature-test-output rule (which sharpens this to the feature's full output at every implementation hinge), and the one-outcome-at-a-time rule.

---

Authored by Scott Bellware on Sat Jun 27 2026 at 4 PM PT
