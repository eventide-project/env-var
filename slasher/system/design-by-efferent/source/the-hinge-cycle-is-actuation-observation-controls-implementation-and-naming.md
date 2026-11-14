# The hinge cycle is actuation, observation, controls, implementation, and naming

**Trigger:** When starting the DBE loop on an outcome, before the first hinge

Building the initial implementation of an outcome runs a cycle of **five hinges**. Each is handed to the human separately, and accepted before moving to the next:

1. **Actuation** — the invocation of the unit under test (its efferent shape: name, arguments, arity, return).
2. **Observation** — what is asserted about the result (value-equality vs. identity vs. a raised error, and what the explaining variable is compared against). **What the test reads is the side effect the actuation produces.** A returned value is one such effect, and it is a **case rather than the rule**. An actuation that returns nothing still produces an effect somewhere. An actuation that returns a value frequently produces others beside it. So the hinge asks **which effect the test reads, and how it reads it**, rather than assuming the return.
3. **Controls** — the example constants the test is built from (which control form, nested vs. top-level, what inner constants, Array vs. Hash seeding, literals vs. controls).
4. **Implementation** — the code that satisfies the test. This hinge always has two candidates: the complete implementation written directly, or the **red/green/refactor cycle** (see the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule).
5. **Naming** — the outcome `context` that names what the observation establishes (the test's name).

The first three concern the test (turn one). The fourth is the implementation (turn two). Only after the actuation, observation, and controls are accepted does the AI assemble and show the turn-one test file (per the first-turn rule). Then it proposes the implementation as the fourth hinge. Once that is accepted it writes it, runs the suite, and shows the test with its result.

The fifth hinge, **naming**, is **deferred to the feature's close**. Per the first-turn rule, the cradle and its outcomes are developed unnamed. Once the feature's outcomes are implemented, each outcome's name is settled as its own hinge, via options, per the one-outcome-at-a-time naming rule. For a single-outcome feature, naming directly follows the implementation hinge.

## The five are named before the first one is put

**Before the first hinge, the agent gives a brief account of all five.** What a hinge is, the five in order with one line each, and what the loop does between them:

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

**It is given once**, when the loop starts on a piece of work — not at each cycle and not at each outcome. A passage repeated at every hinge stops being read, which is the failure the the-startup-display-prints-as-the-session-starts rule names about a permanent line.

**It does not apply under unattended work**, where no hinge is put to the engineer at all. There the plan takes its place (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).

**It comes after the participation decision, not before it.** That decision names no hinge on purpose, because it is asked at a feature's or an experiment's start and the engineer has met nothing yet. This account is where they meet the five, and it sits immediately ahead of the first one.

**Why:** the actuation hinge asks for a decision. An engineer answering it does not otherwise know that four more follow, what those cover, or what happens in between. Without the account they weigh the actuation as though it were the whole of what is being asked. Every question the account would have answered arrives at a later hinge instead. One at a time, in the middle of another decision. Six lines given once removes all of them.

**How responsibility transfers at every hinge:** where there are genuinely distinct options, present them **as options**. Where there is one, present that one the same way. Never pass a hinge without the human's acceptance. Every hinge is presented through the selection UI — see the present-every-prompt-to-the-engineer-through-the-selection-ui rule.

**An option is the artifact, not a label for it.** The option reads `assert(retries == 3)` or `Controls::Upload.example(client: control_client, retries: 3)` — the line that would be written, shown as it would be written. A gloss may follow it where the difference between two candidates is not visible in the code alone. **A label standing in place of the artifact is not an option.** `Accept — assert the returned count against 3` asks the engineer to approve a description of a thing rather than to read the thing. The engineer is judging a design, and the design is in the characters.

**So a hinge with one candidate is not an "accept" prompt.** It shows that candidate as its option, exactly as a hinge with three shows three, and selecting it is the acceptance. Nothing about the single case changes the form. The agent does not search for a second candidate to reach two.

**What is still forbidden is manufacturing a second candidate** to avoid the appearance of a foregone conclusion. Not every hinge has real alternatives. This generalizes the the-actuation-gate-offers-candidate-actuations-as-options rule, which states the same mechanism at the first gate.

**Why:** Each of the five is a real design hinge with its own failure mode. The implementation is where solubility is judged. An awkward implementation reveals a bad cradle, and the fix then goes to the cradle rather than the code. The naming is where a name that mis-describes what the observation establishes is a design error in its own right. The outcome taxonomy is a design artifact, settled deliberately rather than a label applied after the fact.

Bundling collapses separate deliberations into one judgment and puts the human in judge-mode on a fait accompli — the mean-bias failure. Separating them keeps the human producing an answer at every hinge, where the above-the-mean decision is introduced rather than ratified. The observation and the controls especially had been smuggled in under the actuation's gate.

The controls are a hinge in their own right. A non-discriminating example asserts nothing, and a top-level constant cannot distinguish a full name from a final segment.

**How to apply:** Give the brief account of the five hinges once, ahead of the first one, and not again. Then run the five in order (naming deferred to the feature's close).

At each hinge, present every genuine candidate as an option. Write it as the artifact itself rather than as a label for it. Present a lone candidate the same way.

What goes on screen at each hinge is the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule. That is the actuation as the anchor, and the contexts shown once.

Assemble and show the turn-one test after the three test hinges. Propose the implementation, then (on acceptance) write it and show the test + run result for the fourth. At the feature's close, settle the **naming** hinge — add each outcome's `context` via options, one outcome at a time.

This is the **initial**-implementation cycle for one outcome. Looping to further outcomes extends the implementation and re-enters at the relevant hinges. Naming is settled for all at the close.

## Compressed

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

## Compression

- 2026-10-24, compressed: compression 0.18, change 0.64, solubility 30 → 42, clarity 0.54 → 0.72, 33 directives, 33 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 42 → 42, clarity 0.72 → 0.70; checked: 28 directives, 28 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 42 directives, 38 kept, 1 less precise, 3 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule
- 2026-11-08, revised: the first candidate is a full implementation, not a working implementation, a term swap the engineer settled; not re-checked
- 2026-11-11, revised: the first candidate is a complete implementation, not a full implementation, a term swap the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 the implementation hinge's first candidate was named the full implementation. The engineer renamed it the complete implementation.

Until Sun Nov 8 2026 the implementation hinge's first candidate was named the working implementation. The engineer renamed it the full implementation.

Until Sun Oct 25 2026 this rule was named hinge-cycle and titled "The initial-implementation hinge cycle: actuation → observation → controls → implementation → naming".

Until Mon Oct 26 2026 this rule was named the-hinge-cycle-runs-from-actuation-to-naming and titled "The hinge cycle runs from actuation to naming".

Until Thu Oct 29 2026 this rule said every hinge always offers the free-text option, which is the selection UI's built-in Other answer and is how the human dictates or opens a chat, and that it keeps a lone candidate from foreclosing the answer. It also said a lone candidate is presented beside an `Explain` option, which fills the selection UI's second place.

Related:

- the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule
- the first-turn rule — the three test hinges produce turn one
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule — actuation and solubility were the original two hinges. The implementation hinge is that solubility judgment made an explicit acceptance
- the the-actuation-gate-offers-candidate-actuations-as-options rule — the same mechanism at the first gate
- the advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work rule

---

Authored by Scott Bellware on Sun Jun 28 2026 at 8 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:35:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 8:55:06 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:45:35 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:49:17 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:54:56 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:12 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:05 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:28:05 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:34:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:40:05 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:37:47 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:04:31 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:34:22 PM PT
