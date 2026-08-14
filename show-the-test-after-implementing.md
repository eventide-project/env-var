# Always show the test once the unit has been implemented

In the loop, after the actuation gate, **display the just-satisfied test and the run result without being asked.** That is once the unit is brought into existence and the test is run to confirm. Do not wait for a "show me the test" request. At the moment of implementation, the human always sees the test the implementation now satisfies.

**Why:** the test is the cradle — the efferent contract the implementation answers to. Seeing it alongside the confirmed implementation is what lets the human judge **solubility** against the actual observed behavior. Solubility is how readily the unit dissolves into the reader's understanding, and it is the next gate. Surfacing it automatically keeps the loop's load-bearing artifact in view instead of making the human ask for it each turn.

**The implementation is shown with them, and leads.** The solubility verdict is made on the code, so the implementation goes on screen ahead of the test and the run output. The loop does not move on before it is there. See the what-each-hinge-displays rule, which carries this as hinge 4's display.

**How to apply:** report that the unit is implemented and the test confirms. Include the implementation in the same turn. Include the test file's content and the run output too. Then hand over the solubility gate.

Related:

- the first-turn / first-gate rule
- the human-in-the-loop rule — wait at the actuation and at solubility
- the what-each-hinge-displays rule — hinge 4's display, where the implementation leads
- the show-feature-test-output rule — which sharpens this to the feature's full output at every implementation hinge
- the one-outcome-at-a-time rule

---

Authored by Scott Bellware on Sat Jun 27 2026 at 4 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
