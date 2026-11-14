# Advance one outcome at a time, and stop at every gate in attended work

Source: system/design-by-efferent/source/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md

1. The loop advances one outcome at a time.
2. In attended work, the loop stops at every gate for the human.
3. Do not run ahead.
4. Do not batch-generate multiple test files in one pass.
5. Generate one outcome's test, then stop at its gate.
6. Proceed only on the human's go. Under unattended work, the loop does not stop at the gates. It still advances one outcome at a time.
7. Finishing the work means naming the test.
8. A test left with an empty, unnamed outcome context is unfinished.
9. The closing step ascribes the test's name.
10. Name one test at a time.
11. At the naming gate, present candidate outcome-context names, as every hinge presents its candidates. The AI does not name the test on its own.
12. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for the mechanism and its reasons.
13. Build one outcome's test at a time.
14. After each test, stop at each of its hinges (see the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule) and wait.
15. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
16. Never write several test files at once, in either mode.
17. To finish an unnamed test, present candidate names as options through the selection UI.
18. Then apply the name the human chose or dictated.

# DBE is a design tool, not a testing ritual

Source: system/design-by-efferent/source/dbe-is-a-design-tool-not-a-testing-ritual.md

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

# TDD designs behavior, coverage prevents regression, and neither breaks an implementation

Source: system/design-by-efferent/source/tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation.md

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

# Test-first is the default, so never ask whether to start a task that way

Source: system/design-by-efferent/source/test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way.md

1. Test-first is the standing default for starting any task.
2. Do not ask "shall I start it test-first?".
3. Do not otherwise put the test-first decision to the human.
4. The answer is always yes unless told otherwise.
5. If the human wants a task started another way, they will give a different instruction.
6. When the next task is clear, begin it test-first without asking.
7. You may offer the next-task selection if useful.
8. Never frame the next-task selection as a test-first/not question.
9. Deviate from test-first only on an explicit instruction to do so.

## What this does not cover: the human's level of participation

1. Test-first is the method's substance: design is driven from the efferent side, and the test is written before the implementation.
2. Test-first is never put to the engineer.
3. Attended or unattended is a different question. It asks how often the loop stops, not what it builds.
4. The choice neither confirms nor declines the method.
5. A question with a genuinely situational answer is a decision, not a settled default. This rule does not forbid asking it.
6. See the attended-or-unattended-is-chosen-when-the-work-is-started rule.

# The human deliberates the hinges, never the pass/fail bar

Source: system/design-by-efferent/source/the-human-deliberates-the-hinges-never-the-pass-fail-bar.md

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
