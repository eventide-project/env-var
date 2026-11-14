# A hinge question carries no decision marker

Source: system/design-by-efferent/source/a-hinge-question-carries-no-decision-marker.md

Trigger: When presenting a hinge to the engineer

**Trigger:** When presenting a hinge to the engineer

**A question put at a hinge carries no `decision` marker.** Do not set the selection's `metadata.source` to `decision` when the question puts a hinge to the engineer: the actuation, the observation, the controls, the implementation, or the naming. The foundation package's a-process-question-and-its-answer-are-logged rule logs a marked question, and a hinge question is not logged.

**The loop record holds the hinge.** A hinge, its options, and the engineer's selection are recorded in the feature's loop record, one cycle to a section, per the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule. A log entry for the same selection repeats the loop record in the log, and the loop record must not displace the log.

**A design decision made before the loop is not a hinge.** Where the engineer settles the design of a feature before its first hinge, such as what a configuration file is named or where a value is kept, that question is a process question, and it carries the marker.

**Why:** the log records what was decided, one entry to a decision. The loop record records how a feature was decided, cycle by cycle. A hinge selection logged by the hook puts a turn of the work in the log, and the log then holds the same selection twice, once as an entry and once in the loop record. The foundation rule names a design as a process question, and a hinge is a design decision, so without this rule a hinge question reads as one that is marked.

**How to apply:** when putting a hinge question through the selection interface, set no `metadata` marker. Record the hinge, its options, and the selection in the loop record.

# A loop record holds the cycles through the loop, one file per feature

Source: system/design-by-efferent/source/a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature.md

Trigger: When writing a loop record for a feature under slasher/local/logs/loops/

1. `slasher/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop.
2. The loop is the distributed OODA cycle, as defined in the DBE vocabulary.
3. A loop record captures how a feature was decided. The log captures what was decided.
4. A loop record holds the hinges the AI determined and, in attended work, the options it put to the engineer.
5. It also holds the engineer's decisions, or the chat that replaced them. In unattended work, it holds the agent's decisions, with its reasoning.
6. A loop record must not displace the log.
7. The log stays one line per entry. Keep its entries separate and intact.
8. When a feature's loop is worth preserving, add a file under `slasher/local/logs/loops/` in the format below.

## Format

1. Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
2. Begin with a `# Loop record — <feature>` title and a one-paragraph summary of the feature.
3. Declare the mode at the top, as **attended** or **unattended**, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.
4. State the mode once.
5. Write one section per cycle, in order.
6. Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined.
7. Each cycle records **Options**: the candidates put to the engineer at the gate.
8. When a hinge was handled without stopping, write Options explicitly as "none — no gate".
9. Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved.
10. Record the substance of the chat, not just its outcome.
11. Under an unattended mode, a cycle carries its hinge and the decision with its reasoning.
12. Under an unattended mode, write no Options line and no Decision / chat line.
13. The "none — no gate" form marks a skipped gate in an attended run. Do not use it in an unattended run.
14. Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit.
15. End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule.

## Live vs. backfill

1. Writing a loop record while doing the work is the default.
2. Mark a record reconstructed retroactively from memory as a **Backfill**, at the top.

# A test of behavior that already exists is coverage, not design

Source: system/design-by-efferent/source/a-test-of-behavior-that-already-exists-is-coverage-not-design.md

Trigger: When the test at an implementation hinge passes before any code is written

1. A test justifies itself in DBE by driving an implementation that did not exist.
2. DBE does not take an uncontested test as an outcome, and it is not part of the design loop.
3. The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this".
4. At a no-op implementation hinge, do not take the outcome as a design step. Move to the next outcome, rather than writing a test to confirm this one.
5. Behavior may already be present when its own outcome comes up. It may have come from a default value, a conveyed keyword, or a prevention written incidentally. Notice that the implementation ran ahead of its test, and do not take a confirming test as design.
6. Adding a test of existing behavior is a decision about coverage, and it is the engineer's.
7. The agent may suggest the test to the engineer as an increase to coverage, to accept or decline.

# After any implementation hinge, show the test output for the current feature

Source: system/design-by-efferent/source/after-any-implementation-hinge-show-the-test-output-for-the-current-feature.md

Trigger: When an implementation is accepted at the implementation hinge

1. After each implementation hinge, show the whole feature's test output without being asked.
2. First, write the accepted implementation and run the suite.
3. Then run every test file of the current feature.
4. The feature's tests are every outcome built so far for the unit, not only the new one.
5. Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show.
6. Put the output in the turn that reports the implementation.
7. The each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule shows the implementation and the new outcome's test. This rule adds the feature's full output.

# At the implementation hinge, the engineer chooses a direct implementation or red-green-refactor

Source: system/design-by-efferent/source/at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor.md

Trigger: When reaching the implementation hinge of an outcome

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

# Attended or unattended is chosen when the work is started

Source: system/design-by-efferent/source/attended-or-unattended-is-chosen-when-the-work-is-started.md

Trigger: When starting a feature or an experiment

1. Work designed through DBE runs in one of two modes: attended or unattended.
2. Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration.
3. **Attended** is human-in-the-loop. The loop waits at every hinge, and the engineer deliberates each one.
4. Attended is the default.
5. **Unattended**: the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work.
6. DBE is in effect in both modes. Unattended is not DBE off.
7. The cradle still holds under unattended work. The efferent test is written before the implementation.
8. The actuation is still designed from the use site. Code generation is still steered toward solubility.
9. Every hinge is still determined and run in both modes. Only who decides it changes, and whether the loop stops.
10. Attended is small-batch: a wrong turn is caught at its hinge. Unattended is big-batch: a wrong turn is found with everything built on it.
11. The choice is a judgment about this piece of work: how load-bearing it is, and how likely the first pass is to be right.
12. Ask the mode at the start, through the selection UI, beside the working-location selection.
13. Put both decisions at the same gate. Do not add a separate gate.
14. Ask the question in these exact words, with the agent's own figures:

> Human in the loop
>
> - Agent's confidence: 80% (how sure the agent is about working alone.)
> - Risk of redo: 20% (how likely it is that you will have to redo work the agent does.)
> - It'll work: 95% (how sure the agent is that what it builds on its own does what it says.)
> - Your approval: 85% (how sure the agent is that it does what you would do: naming, shaping, and deciding things as you would.)

with these options:

> **Unattended** — The agent makes the decisions and generates through if you accept the plan it'll propose.
>
> **Attended (Confidence: 95%)** — You decide. The agent automates.

15. These words are fixed. The figures are examples.
16. Put each figure on a line of its own, followed by its fixed sentence that says what it measures, in parentheses. Write no `**` around a figure. The selection UI prints them as characters.
17. The first figure is the overall score, the agent's confidence that the unattended work works and is what the engineer would have done.
18. **Works** is the agent's confidence that the work it builds alone works: its tests pass, and it does what the work was started to do.
19. **Voice** is the agent's confidence that, working alone, it does what the engineer would do: names things, shapes each actuation, and decides each hinge as the engineer would.
20. Give the agent's own three estimates for this piece of work, made at the moment it asks.
21. The second line is the risk of redo: 100% minus the overall score. Compute it. Do not estimate it.
22. Estimate the overall score directly. Do not compute it from works and voice.
23. Never give an overall score higher than the lower of works and voice.
24. When the overall score is 70% or lower, end the question with this line:

> When the agent's confidence is 70% or lower, intervention is indicated.

25. When the overall score is 70% or lower, mark the Attended option as the recommendation, and list it first:

> **Attended (Recommended, Confidence: 90%)** — You decide. The agent automates.
>
> **Unattended** — The agent makes the decisions and generates through if you accept the plan it'll propose.

26. Above 70%, give no warning, mark neither option, and list Unattended first.
27. The engineer may choose either option, whatever the score.
28. Name no reserved term, such as hinge, gate, or loop, in the question or in any option.
29. Name the hinges when the loop reaches the first one, not before.
30. Record the mode in the feature or experiment record, as a confirmation at the start, beside the working-location selection.
31. That confirmation records what was chosen, when, and by whom.
32. That confirmation also records the five figures the question showed, whether the warning was shown, and whether Attended was recommended. Write it in this form, with the actual date and figures in place of the example ones:

> - **2026-11-06** — Participation: Attended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 90%, Your approval 65%, attended confidence 90%. The warning was shown, and Attended was recommended.

33. Declare the mode once, at the top of the loop record. Do not infer it cycle by cycle.
34. Under unattended work, the top-of-record declaration is what distinguishes the mode's ungated hinges from skipped gates.
35. Under unattended work, each cycle records its hinge, and what was decided and why.
36. The "why" is the reasoning the agent actually applied.
37. Under unattended work, write no Options line and no Decision / chat line.
38. Do not write an unattended cycle as though an engineer was consulted.
39. Do not mark unattended hinges with the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect.
40. Put the agent's estimate of its confidence if the work is attended in parentheses in the Attended option, as *Attended (Confidence: 95%)*, or *Attended (Recommended, Confidence: 90%)* where it is recommended. Estimate it as about the *It'll work* figure, or a little higher. Do not calculate it.

## Unattended presents a plan before it generates

1. Under unattended work, present a plan before generating.
2. Do not generate until the engineer accepts the plan. This is the one wait in unattended work.
3. Ask for acceptance through the selection UI. Open the question with *Accept the plan?*, and put the plan inside the question, after those words, as its list. For example:

> Accept the plan?
>
> 1. Write the test first.
> 2. Implement the script, so that the test passes.
> 3. Run the suite.

with these exact options:

> **Accept** — The agent makes the decisions and generates through.
>
> **Revise** — Say what to change. The agent revises the plan and shows it again.

4. If the engineer selects Revise, revise the plan as the engineer directs, and present it again. Take what to change from the selection's own text field, or from the reply after it.
5. Attended work needs no plan. Do not present one for it.
6. The plan is a list.
7. Use an ordered list where each step rests on the one above it.
8. Use a bullet list where the steps are independent.
9. Write the plan in ETE, per the `language` package's ETE rules in `ete/`. Slasher's reserved terms, such as hinge, actuation, cradle, and solubility, may be used in it.
10. Use short sentences and active voice in the plan.
11. Use no semicolon in the plan.
12. Put one idea in each list item.
13. Present the plan inside the selection's question, not only in the response.
14. Do not write the plan to a file. It is not a `foundation` planning record.

# Each hinge displays the actuation as its anchor, and the contexts once

Source: system/design-by-efferent/source/each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once.md

Trigger: When presenting a hinge to the engineer

1. Each hinge shows the human a specific amount of the test on screen.
2. The the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule owns the sequence of hinges and the acceptance mechanism. This rule owns what is displayed at each hinge.
3. Render each hinge per this table:

| Hinge | Displays |
|---|---|
| 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
| 2 — **observation** | the actuation + the observation — no contexts |
| 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |
| 4 — **implementation** | at the gate, the candidates. Once one is accepted, **the implementation itself**, then the feature's test output |
| 5 — **naming** | the candidate names, and the test whose outcome they name |

## The actuation is the anchor at every downstream hinge

1. Show the actuation at hinges 2 and 3, because what each one decides has no meaning apart from it.
2. The actuation shown at hinges 2 and 3 is context. It is not re-decided there. Everything shown from an earlier hinge is context, not an invitation to re-decide it.
3. At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block.
4. At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted.

## The contexts are shown once, where they are decided, and elided after

1. Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path.
2. Show the full `context` nesting at hinge 1, so the human judges where the outcome lives before anything else is built.
3. Do not repeat the contexts at the hinges after the first.
4. The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges.

## The implementation is shown before the loop moves on from its hinge

1. Hinge 4 is where solubility is judged. An awkward implementation signals that the actuation is wrong.
2. Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on.
3. Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output.
4. Show the test and the feature's output with the implementation, per the after-any-implementation-hinge-show-the-test-output-for-the-current-feature rule.
5. Do not advance to naming before the implementation is on screen.

# The actuation gate offers candidate actuations as options

Source: system/design-by-efferent/source/the-actuation-gate-offers-candidate-actuations-as-options.md

Trigger: When presenting the actuation hinge of an outcome

1. At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed.
2. Present the human a small set of candidate actuations as options to choose among.
3. The human chooses the option that reads as the more soluble use.
4. This is the form every hinge takes. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for it and the result it rests on.
5. Present each candidate as it would read at the use site.
6. A chosen candidate becomes the cradle. Where the human writes their own instead, take that actuation or enter a dialogue.
7. Settle the actuation before writing the test file. Do not proceed to the test body until it is settled.

## A candidate varies what the use site states

1. Make the candidates genuinely distinct efferent shapes, not cosmetic variants. Two actuations are distinct candidates when a reader at the use site sees different words.
2. Where the use site reads the same either way, the two are one candidate. Do not offer both. That pads the gate.
3. An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair.
4. The first makes the retry policy the object's own. The second makes every use site state the count.
5. An absent parameter is an interface decision, not the lack of one. Do not discard the shorter shape as the other with something missing.
6. A chained construction is not an actuation. `Upload.build(retries: 3).(file)` constructs and actuates in one expression.
7. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line, leaving no intermediate unbound.
8. Do not offer a construction here. Construction belongs to the controls hinge.
9. A varied receiver is not a candidate. `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways.
10. This hinge does not ask which interface carries the operation.
11. To apply the test, hold the receiver constant and ask what the use site states.

# The design of a test waits at the hinges, coverage included

Source: system/design-by-efferent/source/the-design-of-a-test-waits-at-the-hinges-coverage-included.md

Trigger: When creating or editing a file under `test/`

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

# The first DBE gate is the actuation and an unnamed assert

Source: system/design-by-efferent/source/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md

Trigger: When starting a feature by writing its first test file

1. Start a feature by writing a test file, not implementation.
2. The first turn produces that test file and nothing more.
3. The first turn begins at the first gate, where responsibility first transfers to the human.
4. The first gate puts down only the actuation and an unnamed assert.
5. Bind the actuation to an explaining variable.
6. State any inputs just above the actuation, via controls or literals.
7. The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value.
8. Write no inner outcome `context` yet, so no outcome is named.
9. Place the actuation and the unnamed `test` block inside the innermost `context`.

```ruby
context "Constant" do
  context "Module" do
    context "Namespace" do
      control_value = Controls::Constant.example

      constant = Constant::Module.new(control_value)

      namespace = constant.namespace
      control_namespace_constant = Constant::Module.new(Object)

      comment "Namespace: #{namespace.inspect}"

      test do
        assert(namespace == control_namespace_constant)
      end
    end
  end
end
```

10. The shell of the cradle is the actuation and its unnamed assert.
11. Once the shell is implemented, leave the test unnamed through the rest of the feature's development.
12. Name the test only at the end of the feature.
13. Add the outcome `context` each observation establishes at that time, giving the test-structure rule's "one inner `context` per outcome" structure.
14. This naming step is the seam where the next feature begins.
15. A feature in progress carries bare unnamed asserts. A finished feature carries named outcome contexts.
16. The first gate's hinge is the actuation's shape and the truth of the one observation, not how outcomes are named or divided.
17. Before writing the file, settle the actuation, the observation, and the controls.
18. Do not write the implementation in the first turn.
19. Do not pause to run the inevitably-failing test.
20. The human accepts the first turn's content in separate hinges: actuation, then observation, then controls.
21. The implementation is the fourth hinge.
22. The naming is the fifth hinge, at the feature's close.
23. Propose each hinge and get it accepted before the next, per the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.
24. Do not present the whole test file for a single accept.
25. Settle the three test hinges first, then assemble and show the file.
26. The exception to points 24 and 25 is when the engineer chose unattended work at the start, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.

# The hinge cycle is actuation, observation, controls, implementation, and naming

Source: system/design-by-efferent/source/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md

Trigger: When starting the DBE loop on an outcome, before the first hinge

1. Building the initial implementation of an outcome runs a cycle of five hinges, in the order below.
2. Hand each hinge to the human separately. Get it accepted before moving to the next.
3. **Actuation** is the unit's efferent shape: name, arguments, arity, return.
4. **Observation** is what is asserted about the result. That covers value-equality vs. identity vs. a raised error, and what the explaining variable is compared against.
5. What the test reads is the side effect the actuation produces. A returned value is one such effect, a case rather than the rule.
6. An actuation that returns nothing still produces an effect somewhere. One that returns a value frequently produces others beside it.
7. The observation hinge asks which effect the test reads, and how it reads it. It does not assume the return.
8. **Controls** are the example constants the test is built from. That covers control form, nested vs. top-level, inner constants, Array vs. Hash seeding, and literals vs. controls.
9. **Implementation** is the code that satisfies the test.
10. The implementation hinge always has two candidates. One is the complete implementation written directly. The other is the red/green/refactor cycle (see the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule).
11. **Naming** is the outcome `context` that names what the observation establishes (the test's name).
12. The first three hinges concern the test (turn one). The fourth is the implementation (turn two).
13. Assemble and show the turn-one test file only after the actuation, observation, and controls are accepted, per the first-turn rule.
14. Then propose the implementation as the fourth hinge.
15. Once the implementation is accepted, write it, run the suite, and show the test with its result.
16. Defer the naming hinge to the feature's close. Per the first-turn rule, the cradle and its outcomes are developed unnamed.
17. Once the feature's outcomes are implemented, settle each outcome's name as its own hinge. Add each outcome's `context` via options, one outcome at a time, per the one-outcome-at-a-time naming rule.
18. For a single-outcome feature, naming directly follows the implementation hinge.
19. This is the initial-implementation cycle for one outcome. Looping to further outcomes extends the implementation and re-enters at the relevant hinges.
20. Naming is settled for all outcomes at the close.
21. When an awkward implementation reveals a bad cradle, the fix goes to the cradle rather than the code.
22. Settle the outcome taxonomy deliberately, as a design artifact. Do not treat it as a label applied after the fact.
23. Where a hinge has genuinely distinct options, present them as options.
24. Never pass a hinge without the human's acceptance.
25. An option is the artifact, not a label for it. It is the line that would be written, shown as it would be written.
26. For example, the option reads `assert(retries == 3)` or `Controls::Upload.example(client: control_client, retries: 3)`.
27. A gloss may follow an option where the difference between two candidates is not visible in the code alone.
28. A label standing in place of the artifact is not an option. For example, `Accept — assert the returned count against 3` is not an option.
29. A hinge with one candidate is not an "accept" prompt. It shows that candidate as its option, exactly as a hinge with three shows three.
30. Selecting the lone candidate is the acceptance. Nothing about the single case changes the form.
31. This generalizes the the-actuation-gate-offers-candidate-actuations-as-options rule, which states the same mechanism at the first gate.
32. What goes on screen at each hinge is the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule. That is the actuation as the anchor, and the contexts shown once.

## The five are named before the first one is put

1. Before the first hinge, give a brief account of all five.
2. The account says what a hinge is. It gives the five in order with one line each, and says what the loop does between them.
3. For example:

> The work runs through five hinges. A hinge is a decision the design turns on, and the loop stops
> at each one for you.
>
> 1. **Actuation** — the invocation of the unit, written as a use site would write it.
> 2. **Observation** — what the test reads about the effect the actuation produces.
> 3. **Controls** — the known inputs the test is built from.
> 4. **Implementation** — the code that satisfies the test.
> 5. **Naming** — the name of the outcome the test establishes.
>
> The first three build the test. The fourth writes the code. The fifth is settled at the close.
> Everything between the hinges I generate without stopping.

4. Give the account once, when the loop starts on a piece of work.
5. Do not repeat it at each cycle or at each outcome.
6. The account does not apply under unattended work, where no hinge is put to the engineer. There the plan takes its place (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
7. Give the account after the participation decision, not before it.
8. Place the account immediately ahead of the first hinge.
9. The participation decision names no hinge, on purpose.
