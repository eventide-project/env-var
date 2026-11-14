# DBE is a design tool, not a testing ritual

Design By Efferent is a design tool. Do not perform red-green-refactor as choreography.

A test written before its implementation exists is trivially going to fail. That failure teaches nothing — do not stop to observe it, and do not treat the red bar as a checkpoint. The point of the test was never the failure.

**What this rejects is the *unchosen* cycle, performed because the form calls for it.** An engineer may **choose** the red/green/refactor cycle at the implementation hinge, for a particular unit. They choose it where the design wants working out under a red, or where the test's discrimination is in doubt. See the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule. That is not choreography — the loop stopped, a person weighed two real alternatives, and the decision was theirs. Choreography is the cycle nobody decided to run.

The point is the cradle. Approach every unit from the efferent side first — the test is the first efferent reference. Authoring the actuation before the implementation exists forces the unit's interface to be designed from the use site. What the efferent view discovers is the unit's **solubility**: how readily it dissolves into the reader's understanding. The target is the greatest simplicity possible — maximum solubility, minimal necessary complexity, found rather than presumed.

The efferent test then acts as a jig or a harness. More precisely it is a **cradle**. It holds the implementation in position without gripping it rigid. It supports the code generation within the dictates of the efferent view, and leaves it free to move inside those bounds. It is not an after-the-fact filter and not a point to halt at. Keep the cradle present while you build, steering toward solubility, and generate straight through inside it.

Do not regress to the average of the code you have seen. Most code is poorly designed, and copying it is garbage in, garbage out. Condition on the well-designed, efferent-oriented, high-solubility code in the project and hold to its standard. Efferent in, efferent out.

**Why:** Design judgment — knowing in detail what good, soluble design looks like — stays with the human. The ceremony of red-green-refactor only ever existed to put a human's attention in the loop. Reproducing it as ritual wastes effort and teaches nothing. The job is to generate within the cradle the human sets, toward solubility, without performing the ceremony. This is what separates DBE from the TDD it is a variant of: tests are the vehicle, design is the point.

**How to apply:** Write the efferent test first. Treat it as a cradle for code generation rather than a pass/fail gate. Do not pause to watch the inevitable pre-implementation failure. Design each unit from the efferent side inward. Hold the test in context while generating the implementation, and steer toward maximum solubility. Condition on the project's high-solubility code, not on code in general.

## Compressed

1. Design By Efferent is a design tool.
2. Do not perform red-green-refactor as choreography.
3. A test written before its implementation will trivially fail. Do not stop to observe that failure.
4. Do not treat the red bar as a checkpoint.
5. What is rejected is the unchosen cycle, the one performed because the form calls for it.
6. An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit. See the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule.
7. They choose it where the design wants working out under a red, or where the test's discrimination is in doubt.
8. A cycle the engineer chose after weighing two real alternatives is not choreography. Only the engineer's choice makes the cycle legitimate.
9. Approach every unit from the efferent side first. The test is the first efferent reference.
10. Aim for the unit's greatest **solubility**.
11. Treat the efferent test as a **cradle**.
12. Generate code within the dictates of the efferent view, free to move inside those bounds.
13. The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at.
14. Keep the cradle in context while building, and generate straight through inside it, steering toward solubility. The human sets the cradle.
15. Do not regress to the average of the code you have seen. Do not copy poorly designed code.
16. Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard.
17. Leave design judgment with the human: knowing in detail what good, soluble design looks like.

## Compression

- 2026-10-24, compressed: compression 0.28, change 0.51, solubility 59 → 79, clarity 0.65 → 0.84, 16 directives, 15 kept, 1 less precise, 0 lost, after 4 repairs, re-checked kept; directive 16 less precise, judged immaterial
- 2026-10-28, revised: Why points removed, solubility 79 → 78, clarity 0.84 → 0.83; checked: 15 directives, 14 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named dbe-as-design-tool.

Related:

- the DBE vocabulary — cradle, efferent, solubility
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule
- the first-turn rule
- the tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation rule
- the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule — the chosen cycle this does not reject

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:39:25 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:05 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:28:05 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
