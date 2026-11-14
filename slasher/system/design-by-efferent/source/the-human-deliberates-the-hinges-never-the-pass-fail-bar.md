# The human deliberates the hinges, never the pass/fail bar

In DBE, place the human's attention only where design judgment lives — at the **hinges**. A hinge is a decision the design turns on, subtle and load-bearing (see the DBE vocabulary). Two hinges are the original pair: **setting the cradle** (the efferent shape of the actuation) and **judging solubility** (the result).

The loop **waits** at the hinges so the human can **deliberate** them. Everything between is code generation the agent does straight through. Never make the human wait at a red or green bar. That is the ceremony, and the ceremony only ever existed to insert human attention that now belongs at the hinges.

The spine of the whole thing is one pair: **the AI generates. The human deliberates.**

Division of labor: the human owns the efferent design — what the actuation looks like — and the solubility verdict on what comes back. The AI owns generating within the cradle, the test scaffolding and the implementation, steered toward solubility.

The loop, by turn:

1. **Human sets the cradle — the actuation.** The actuation is the contract and the highest-leverage hinge. The AI may propose it, but the human holds edit and veto power *specifically on the actuation*. When the efferent shape is uncertain, the AI asks rather than averaging toward common code.
2. **The three test hinges produce turn one.** The actuation, the observation, and the controls are each put to the human in turn, per the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule, and the test file is assembled once all three are accepted. **The whole test file is never produced at an earlier hinge**, unless the engineer chose unattended work at the start, where the agent decides each hinge and generates through (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). The human deliberates whether the actuation reads as soluble use, not the test mechanics: the testing framework and the ceremonies of using it. The actuation, observation, and controls, as well as the naming of things, are the test's content, not its mechanics. Fix the cradle now if not. It is cheapest before any implementation exists.
3. **AI generates the implementation inside the cradle, straight through**, and runs the test to *confirm* (verification, not the green half of a ceremony). The human deliberates the unit's solubility. If it only works by forcing an awkward actuation, the fix goes to the cradle, not the implementation.
4. **Loop by outcome.** Name the next distinct outcome of the same single actuation. The AI adds an inner `context` and extends the implementation just enough. The human deliberates solubility again.
5. **Exit on solubility, not coverage.** The stopping criterion is that the unit has dissolved into the reader's understanding, not an assertion count.

**Why:** Design judgment stays with the human, as the DBE-as-design-tool rule has it. The only places it applies are the hinges of the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule. The actuation and the resulting solubility are the original pair and carry the most leverage. Concentrating human attention there, and removing it from pass/fail theater and test mechanics, spends the human's judgment where it has leverage. It lets the AI generate inside the cradle without ceremony. The AI's failure mode is regressing toward the average of poorly-designed code, which announces itself first as an awkward actuation. A wait at that hinge catches it at the interface.

**How to apply:** Run the loop above. Keep turns small (one actuation, one outcome) so the cradle stays legible while the human deliberates. Hand the human the actuation to edit or approve. Let the AI fill everything else. Do not ask the human to confirm a failing or passing test. Stop when solubility is satisfied.

## Compressed

1. In DBE, place the human's attention only at the hinges, where design judgment lives.
2. The original pair of hinges is setting the cradle (the efferent shape of the actuation) and judging solubility (the result).
3. The loop waits at the hinges so the human can deliberate them.
4. The agent does all code generation between hinges straight through.
5. Never make the human wait at a red or green bar.
6. Never deliberate the pass/fail bar.
7. The AI generates. The human deliberates.
8. The human owns the efferent design, meaning what the actuation looks like.
9. The human owns the solubility verdict on what comes back.
10. The AI owns generating within the cradle: the test scaffolding and the implementation, steered toward solubility.
11. Let the AI fill everything other than the actuation and the solubility verdict.

## The loop, by turn

1. **Human sets the cradle, the actuation.** The actuation is the contract and the highest-leverage hinge.
2. The AI may propose the actuation.
3. The human holds edit and veto power specifically on the actuation.
4. When the efferent shape is uncertain, the AI asks rather than averaging toward common code.
5. **The three test hinges produce turn one.** Put the actuation, the observation, and the controls to the human in turn, per the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.
6. Assemble the test file once all three are accepted.
7. Never produce the whole test file at an earlier hinge.
8. The exception is when the engineer chose unattended work at the start. Then the agent decides each hinge and generates through (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
9. The human deliberates whether the actuation reads as soluble use, not the test mechanics: the testing framework and the ceremonies of using it. The actuation, observation, and controls, as well as the naming of things, are the test's content, not its mechanics.
10. If it does not, fix the cradle now, before any implementation exists.
11. **AI generates the implementation inside the cradle, straight through.**
12. The AI runs the test to confirm, as verification, not as the green half of a ceremony.
13. The human deliberates the unit's solubility.
14. If the unit only works by forcing an awkward actuation, fix the cradle, not the implementation.
15. **Loop by outcome.** Name the next distinct outcome of the same single actuation.
16. The AI adds an inner `context` and extends the implementation just enough.
17. The human deliberates solubility again.
18. **Exit on solubility, not coverage.** Stop when the unit has dissolved into the reader's understanding, not at an assertion count.
19. Keep turns small: one actuation, one outcome, so the cradle stays legible during deliberation.

## Compression

- 2026-10-24, compressed: compression 0.13, change 0.38, solubility 50 → 66, clarity 0.59 → 0.79, 28 directives, 28 kept, 0 less precise, 0 lost
- 2026-10-24, revised: point 9 takes the definition of test mechanics; not checked
- 2026-10-27, re-checked: 29 directives, 28 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 66 → 61, clarity 0.79 → 0.76; checked: 26 directives, 25 kept, 1 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 61 → 64, clarity 0.76 → 0.76; checked: 24 directives, 23 kept, 1 less precise, 0 lost

## History

Until 2026-10-24 the Why named the hinges as the actuation and the resulting solubility alone, from when those were the only two, and turn two left "test mechanics" undefined. The engineer set out that mechanics are the testing framework and the ceremonies of using it, while the actuation, observation, controls, and naming are the test's content. The rule now says so, and the Why names the hinges of the hinge-cycle rule.

Until Sun Oct 25 2026 this rule was named dbe-human-in-the-loop and titled "Human-in-the-loop: deliberate the hinges (the actuation and solubility), never the pass/fail bar".

Related:

- the DBE-as-design-tool rule
- the first-turn rule
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the two original hinges grown to five
- the test-structure rule
- the DBE vocabulary

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:34:03 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:32:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:29 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
