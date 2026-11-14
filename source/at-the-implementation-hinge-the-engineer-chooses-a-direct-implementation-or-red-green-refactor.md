# At the implementation hinge, the engineer chooses a direct implementation or red-green-refactor

**Trigger:** When reaching the implementation hinge of an outcome

At the **implementation hinge** — the fourth of the five — the agent puts two candidates to the engineer:

1. **A complete implementation** — the code that satisfies the test, written directly.
2. **An implementation that lets the test fail**, and then the complete **red, green, refactor** cycle.

**The two options carry these labels, word for word, in this order, with the agent's own figures:** *One batch (Agent generates complete implementation - Confidence: 85%)*, then *Controlled and calibrated increments (Red, Green, Refactor - Confidence: 90%)*.

**Each label ends with the agent's confidence in that option**, inside the parentheses after a dash. The confidence is 100% minus the option's rework risk, computed and not estimated.

**As the engineer later stated it:** One batch (Agent generates full implementation - Confidence: 85%)

**As the engineer stated it:** When the user makes the choice of one batch vs red, greeen , refactor, it would seem that the confidence estimate percentage should be presented in the labels.

**Each option's description opens with the agent's estimate of its rework risk**, on a line of its own, in these words with the agent's own figure: *Rework risk: 30% (how likely it is that you will have to redo what this produces.)* The figure is the agent's estimate for this unit, made when it asks. It is an estimate, not a calculation: nothing yet records whether an accepted implementation was later redone. The labels' words stay as fixed.

The two answer the hinge's question. The hinge asks *how does this implementation come about*. These are two ways of arriving at the same place, one directly and one through the cycle. That is what makes the second a genuine **candidate** rather than a sequencing step. An engineer may prefer it, and preferring it is a design judgment about this unit. It is not a procedure applied to every one.

**This is where the decision is made, and the only place.** A red is not offered at a separate hinge preceding the implementation. One gate asks, so an engineer who declines is not asked again by another mechanism.

**The containment constraint governs the red, unchanged.** A deliberate red is permitted **only where its cause reaches no other stable test** — no existing, passing test may fail because of it. A red whose cause breaks working tests is breakage, not a driven test, and choosing the cycle at a gate does not make it otherwise. Before writing a deliberate red, know that its failure is local to the new test. Run the full suite after it. If a stable test failed, back it out and reach a passing implementation directly.

**The cycle is for the first implementation of a unit** — new behavior being designed. It is not available when **covering** behavior that already exists. There is no red to manufacture there without breaking working code, which the tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation rule forbids outright. The implementation hinge is degenerate in that case. See the the-design-of-a-test-waits-at-the-hinges-coverage-included rule. So the second candidate is offered only where it is actually available, rather than being offered and then refused.

**Choosing the cycle is not performing choreography.** The dbe-is-a-design-tool-not-a-testing-ritual rule opens by rejecting red-green-refactor **as choreography**. That is ritual performed because the form calls for it. The pre-implementation failure is treated as a checkpoint, and it teaches nothing.

What that rejects is the **unchosen** case. An engineer selecting the cycle at a gate, for this unit, has made a design judgment, which is the opposite of ceremony. The loop stopped, a person weighed two real alternatives, and the decision was theirs. The rule and this one do not conflict, and the dbe-is-a-design-tool-not-a-testing-ritual rule says so in its own words.

**Refactor is part of the cycle, and is why it is worth choosing.** The cycle has three parts:

- **Red** proves the test discriminates.
- **Green** makes it pass.
- **Refactor is where the design is actually improved**, with the test holding the behavior still. A cycle offered without it would be the half that dbe-is-a-design-tool-not-a-testing-ritual rule calls a ritual — motion with no design in it.

**The second candidate is real, which is what the two-option floor requires.** The present-every-prompt rule forbids manufacturing cosmetic options to reach two. The implementation hinge frequently has one obvious implementation, which makes it the hinge most tempted to pad. This candidate is not padding: it is a different way of producing the implementation, chosen for reasons that apply to some units and not others.

But it does not excuse the search. Where a hinge has a real second implementation, that is the option to surface. The cycle is not a substitute for looking.

**Why:** whether to drive a unit's implementation through a failing test is a judgment about that unit. It turns on how confident the design is, whether the test's discrimination is in doubt, and whether the shape wants working out under a red. It is subtle, in that it cannot be read off the code, and load-bearing, in that the implementation follows from it. That is a hinge's definition, and it belongs at the hinge where the implementation is decided rather than as a procedure attached to every one. Offering it as one of two candidates puts the engineer in the position the gates exist to create. They compare real alternatives rather than ratifying a single proposal.

**How to apply:** at the implementation hinge for a unit's **first** implementation, offer the two candidates through the selection UI. They are the complete implementation, and the red/green/refactor cycle. Where the cycle is chosen, write the red only if its cause reaches no stable test. Run the suite, then green, then refactor. Do not offer the cycle when covering behavior that already exists. Do not present a failing implementation as an option merely to reach the two-option floor.

## Compressed

1. At the implementation hinge, the fourth of the five, put two candidates to the engineer through the selection UI.
2. The first candidate is **a complete implementation**: code that satisfies the test, written directly.
3. The second candidate is **an implementation that lets the test fail**, followed by the complete **red, green, refactor** cycle.
4. Both candidates answer the hinge's question: *how does this implementation come about*.
5. Treat the cycle as a design judgment about this unit, not a procedure applied to every unit.
6. This hinge is the only place the red decision is made.
7. Do not offer a red at a separate hinge before the implementation.
8. Do not ask again, by any other mechanism, an engineer who declined the cycle.

## The containment constraint governs the red, unchanged

1. A deliberate red is permitted only where its cause reaches no other stable test.
2. No existing, passing test may fail because of the red.
3. A red that breaks working tests is breakage, even when the cycle was chosen at a gate.
4. Before writing a deliberate red, know that its failure is local to the new test.
5. Run the full suite after writing the red.
6. If a stable test failed, back the red out and reach a passing implementation directly.

## The cycle is for the first implementation of a unit

1. Offer the cycle only for new behavior being designed.
2. Do not offer the cycle when covering behavior that already exists.
3. When covering, the implementation hinge is degenerate. See the the-design-of-a-test-waits-at-the-hinges-coverage-included rule.
4. Never offer the cycle and then refuse it; offer it only where it is available.

## Choosing the cycle is not performing choreography

1. The dbe-is-a-design-tool-not-a-testing-ritual rule rejects only the unchosen cycle, performed as ritual.
2. An engineer selecting the cycle at a gate for this unit has made a design judgment, which that rule permits.
3. Perform the cycle only where the engineer selected it at the gate for that unit, never as unchosen choreography.

## Refactor is part of the cycle

1. The cycle has three parts: red, green, and refactor.
2. Red proves the test discriminates.
3. Green makes the test pass.
4. Refactor improves the design, with the test holding the behavior still.
5. Never offer the cycle without refactor.
6. Where the cycle is chosen, run it in order: the red, then the full suite, then green, then refactor.

## The second candidate is real

1. The cycle counts as a real second candidate under the present-every-prompt two-option floor.
2. The cycle is not a substitute for searching for another implementation.

## The labels

1. Label the first option *One batch (Agent generates complete implementation - Confidence: 85%)*, and the second *Controlled and calibrated increments (Red, Green, Refactor - Confidence: 90%)*, word for word but for the figures, in that order.
2. Open each option's description with the agent's own estimate, as *Rework risk: 30% (how likely it is that you will have to redo what this produces.)*. The labels' words stay as fixed.
3. Each label's figure is the agent's confidence in that option: 100% minus the option's rework risk, computed.

## Compression

- 2026-10-24, compressed: compression 0.36, change 0.64, solubility 40 → 62, clarity 0.61 → 0.82, 16 directives, 16 kept, 0 less precise, 0 lost
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 62 → 58, clarity 0.82 → 0.81; checked: 19 directives, 16 kept, 2 less precise, 1 lost, 4 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 58 → 59, clarity 0.81 → 0.81; checked: 17 directives, 17 kept, 0 less precise, 0 lost
- 2026-11-08, revised: the first candidate is a full implementation, not a working implementation, a term swap the engineer settled; not re-checked
- 2026-11-08, revised: the two options' labels are stated, at the engineer's direction; not re-checked
- 2026-11-08, revised: each option's description opens with the agent's rework risk estimate, at the engineer's direction; not re-checked
- 2026-11-09, revised: each label ends with the agent's confidence in that option, at the engineer's direction; not re-checked
- 2026-11-09, revised: the first label is *One batch (Agent generates full implementation - Confidence: 85%)*, and the second takes the same form, at the engineer's direction; not re-checked
- 2026-11-11, revised: the first candidate is a complete implementation, not a full implementation, a term swap the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 the first candidate was named a full implementation, and the first label read *One batch (Agent generates full implementation - Confidence: 85%)*. The engineer renamed it a complete implementation.

Until Mon Nov 9 2026 the labels carried no confidence figure, and the first read *One batch, increased rework risk (agent generates full implementation)*.

Until Sun Nov 8 2026 the options showed no rework risk estimate.

Until Sun Nov 8 2026 the rule fixed no label for either option.

Until Sun Nov 8 2026 the first candidate was named a working implementation. The engineer renamed it a full implementation.

Until Sun Oct 25 2026 this rule was named the-implementation-hinge-offers-the-red-green-refactor-cycle and titled "The implementation hinge offers two candidates: the working implementation, or the red/green/refactor cycle".

Until Mon Oct 26 2026 this rule was named the-implementation-hinge-offers-the-working-implementation-or-the-red-green-refactor-cycle and titled "The implementation hinge offers the working implementation or the red-green-refactor cycle".

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the five hinges, of which this is the fourth
- the dbe-is-a-design-tool-not-a-testing-ritual rule — which rejects the cycle as choreography, not as a decision
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the two-option floor this must not be used to satisfy
- the tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation and the-design-of-a-test-waits-at-the-hinges-coverage-included rules — the coverage case where the cycle is unavailable
- the a-test-of-behavior-that-already-exists-is-coverage-not-design rule — the no-op implementation hinge, where there is nothing to drive

---

Authored by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:34:58 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:45 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:01 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:05 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:30:41 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:28:05 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:04:31 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:08:26 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:15:41 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:26:02 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:28:31 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:34:22 PM PT
