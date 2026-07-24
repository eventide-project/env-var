# DBE is a design tool, not a testing ritual

Design By Efferent is a design tool. Do not perform red-green-refactor as choreography.

A test written before its implementation exists is trivially going to fail. That failure teaches nothing — do not stop to observe it, and do not treat the red bar as a checkpoint. The point of the test was never the failure.

The point is the cradle. Approach every unit from the efferent side first — the test is the first efferent reference. Authoring the actuation before the implementation exists forces the unit's interface to be designed from the outside in. What the efferent view discovers is the unit's **solubility**: how readily it dissolves into use, how usable and transparent it is from the efferent side. The target is the greatest simplicity possible — maximum solubility, minimal necessary complexity, found rather than presumed.

The efferent test then acts as a kind of jig or harness — but more precisely a **cradle**: it holds the implementation in its proper position without gripping it rigid, supporting the generation within the dictates of the efferent view while leaving it free to move inside those bounds. It is not an after-the-fact filter and not a point to halt at. Keep the cradle present while you build, steering toward solubility, and generate straight through inside it.

Do not regress to the average of the code you've seen — most code is poorly designed, and copying it is garbage in, garbage out. Condition on the well-designed, efferent-oriented, high-solubility code in the project and hold to its standard. Efferent in, efferent out.

**Why:** Design judgment — knowing in detail what good, soluble design looks like — stays with the human. The ceremony of red-green-refactor only ever existed to put a human's attention in the loop; reproducing it as ritual wastes effort and teaches nothing. The job is to generate within the cradle the human sets, toward solubility, without performing the ceremony. This is what separates DBE from the TDD it is a variant of: tests are the vehicle, design is the point.

**How to apply:** Write the efferent test first and treat it as a cradle for generation, not a pass/fail gate — do not pause to watch the inevitable pre-implementation failure. Design each unit from the efferent side inward, hold the test in context while generating the implementation, and steer toward maximum solubility. Condition on the project's high-solubility code, not on code in general. Related: the DBE vocabulary (cradle, efferent, solubility), the human-in-the-loop rule, the first-turn rule, and the "TDD designs, coverage protects" rule.

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
