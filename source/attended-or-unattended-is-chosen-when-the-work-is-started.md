# Attended or unattended is chosen when the work is started

**Trigger:** When starting a feature or an experiment

Work designed through DBE runs in one of two modes, chosen when a feature or an experiment is started and held for its duration:

- **Attended** — human-in-the-loop. The loop **waits** at every hinge, and the engineer deliberates each one. **This is the default.**
- **Unattended** — the loop does not wait. The agent determines each hinge and decides it, generating through to the end of the work.

**DBE is in effect either way, and that is what makes this a cadence rather than a switch.** Unattended is not DBE off. The **cradle** still holds — the efferent test written before the implementation, the actuation designed from the use site, the code generation steered toward **solubility**. Every hinge is still determined.

What changes is who decides it. The method is untouched. Only the stopping is.

**The decision is batch size.** Attended is **small-batch**. The engineer's attention is spent continuously, and a wrong turn is caught at the hinge where it was taken. So rework stays near zero.

Unattended is **big-batch**: no attention is spent until the end. A wrong turn is found with everything built on top of it. Rework is the cost.

Which is cheaper depends on how load-bearing the work is, and on how likely the first pass is to be right. That is a judgment about *this* piece of work.

**It is asked at the start, through the selection UI, beside the working location.** The two are decisions about how the work will be conducted. Each is made once and holds for its duration. So they are put at the same gate rather than adding one. The default is attended.

**The question is asked in these words:**

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

**The question carries the agent's confidence in doing the work unattended, as three percentages, and the risk of redo that follows from them.** Each is on a line of its own, followed by a sentence in parentheses that says what it measures, so the engineer does not have to know the terms to read it. The question is plain text, with no `**` around a figure, because the selection UI does not render markdown and prints the asterisks as characters. The figures above are examples. Each is the agent's own estimate for this piece of work, made at the moment it asks.

- **The overall score** comes first, labeled *Agent's confidence*. It is the agent's confidence that the unattended work comes out as the engineer would accept it: it works, and it is what the engineer would have done. It is the score the decision is made on.
- **The risk of redo** comes second. It is 100% minus the overall score: the chance that the engineer has to redo some of the work. It is computed, not estimated. It puts the same figure in the terms of what the engineer stands to lose.
- **Works**, labeled *It'll work*, is the agent's confidence that the work it builds alone works: its tests pass, and it does what the work was started to do. Works is high when the work is well understood and the tests can say when it is done. It is low when the agent cannot know how something behaves until it is built.
- **Voice**, labeled *Your approval*, is the agent's confidence that, working alone, it does what the engineer would do. It names things as the engineer would name them, shapes each actuation as the engineer would shape it, and decides each hinge as the engineer would decide it. Voice is high when the project already shows how the engineer decides work of this kind, in its code, its rules, and its records. It is low when the work makes decisions the engineer has not made before, or when the engineer's intent can be read more than one way.

**Works and voice are shown apart because they fail apart.** Work can pass every test and still be work the engineer would undo. A works failure is caught by the tests. A voice failure is caught only by the engineer, and under unattended work the engineer sees it only at the end, with everything built on top of it.

**The overall score is estimated directly, not computed.** It is not the product or the average of the other two. The two are often related. A misread intent, for example, lowers both. The agent is the party that can judge how they relate in this piece of work. The overall score is never higher than the lower of the two, because unattended work has to come out right in both ways.

**Why the figures are in the question:** the decision rests on how likely the first pass is to be right, and the agent is the party that has looked at the work. Putting its estimate in the question puts that judgment in view where the engineer makes the decision. A low *voice* figure says the engineer would change what the agent decides alone.

**When the overall score is 70% or lower, the question carries a warning, and Attended is the recommendation.** The warning is the question's last line, in these words:

> When the agent's confidence is 70% or lower, intervention is indicated.

and the Attended option is marked as the recommendation, and moves first:

> **Attended (Recommended, Confidence: 90%)** — You decide. The agent automates.
>
> **Unattended** — The agent makes the decisions and generates through if you accept the plan it'll propose.

Above 70%, the question carries no warning, neither option is marked, and Unattended is first. The engineer still chooses either way.

**The Attended option carries, in parentheses, the agent's confidence if the work is attended, after the word *Confidence:*.** Where Attended is the recommendation, the figure shares the parentheses: *Attended (Recommended, Confidence: 90%)*. Attended work removes most of the risk behind *Your approval*, since the engineer decides each point where the design could go more than one way. That leaves *It'll work* as the main limit, so the attended confidence is about that figure, and may be a little higher, since a wrong turn is caught when it is taken. It is estimated, not calculated, like the other figures.

**As the engineer stated it:** In each Attended option, put the confidence percentage in parentheses

**The options are listed Unattended first and Attended second, except where Attended is the recommendation.** A first option reads as recommended. So where Attended is marked as the recommendation, it is listed first, and the order does not contradict the mark.

**As the engineer stated it:** "Swap Attended and Unattended options"

**Why 70%:** at about 70%, the expected cost of fixing a wrong unattended result is about what attended work costs in attention as it goes. The estimate is in the log entry `2026-11-06T09-23-01Z-the-attended-floor-is-estimated-at-about-70-percent`. It has not yet been checked against how the work turns out. The warning puts the agent's doubt in front of the decision, rather than leaving it to show in the work.

**Neither the question nor an option names a hinge.** The words are fixed for that reason. The decision is put at a feature's or an experiment's **start**. An engineer meeting this system has not yet met a hinge, a gate, or the loop. So *the loop waits at each hinge* asks them to hold three reserved terms before they can answer. **Human in the loop** is a phrase an engineer knows before meeting this system, and it is the whole of what the decision settles.

**The option says what each party does, in that order.** *You decide. The agent automates.* names the engineer's part first, because that part is what the engineer is choosing to keep or to give up. The unattended option names what the agent does, and the one part left to the engineer: accepting the plan. After that, the engineer has no part. Naming the plan tells the engineer, while choosing, that they will see the intended path, and accept it, before any work is done.

**The vocabulary is not being avoided, only deferred.** The hinges are named the moment the loop reaches the first one, where the engineer sees an actuation rather than a definition.

**The mode is recorded in the two records.**

- **The feature or experiment record** carries it as a **confirmation at the start**, beside the working-location selection. It is a lifecycle fact: what was chosen, when, and by whom.

  **The confirmation also records the five figures the question showed, and whether the warning was shown.** For example:

  > - **2026-11-06** — Participation: Attended, selected by the engineer. Agent's confidence 60%, risk of redo 40%, It'll work 90%, Your approval 65%, attended confidence 90%. The warning was shown, and Attended was recommended.

  Recorded at the start, before the work, the figures can later be compared with how the work turned out. That comparison is the only way to learn whether the agent's estimates are accurate.
- **The loop record declares it at the top**, because it changes how every cycle below is read.

**An unattended cycle is not written as though an engineer was consulted.** A loop record's cycle ordinarily carries a hinge, the **options** put at the gate, and the **decision or chat** that resolved it. Under unattended work the last two did not happen. So:

- The record **declares the mode once**, at the top.
- Each cycle records its **hinge** and **what was decided and why** — the reasoning the agent actually applied.
- There is **no Options line and no Decision / chat line**. Writing them would be a false record of a deliberation that never occurred.

**This is not the same as a hinge with no gate in an attended run.** The a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule has a form for that — *"none — no gate"* — and it exists to **surface a skipped gate as a defect**. Under unattended work every hinge has no gate, by decision. Marking each one that way would report a run of failures where there was a declared mode. The mode declaration is what distinguishes them, and it is why it goes at the top rather than being inferred cycle by cycle.

## Unattended presents a plan before it generates

**The engineer is out of the loop, so the plan is the only place they see the intended path before the work is done.** Attended needs no plan. The loop waits at every hinge, and the sequence of those waits is the plan.

**This is the one cheap moment of attention in a big-batch arrangement.** Unattended spends no attention until the end, and a wrong turn is found with everything built on top of it. A plan read before the work costs one reading and can move the whole path.

**The agent generates only once the engineer accepts the plan.** It presents the plan and waits. If the engineer does not accept it, the agent revises it as the engineer directs and presents it again. This acceptance is the one wait in unattended work. It is put where a wait costs least, before anything is built.

**Acceptance is asked through the selection UI, with the plan inside the question.** The question opens with *Accept the plan?*, and the plan follows it, as its list. For example:

> Accept the plan?
>
> 1. Write the test first.
> 2. Implement the script, so that the test passes.
> 3. Run the suite.

with these options:

> **Accept** — The agent makes the decisions and generates through.
>
> **Revise** — Say what to change. The agent revises the plan and shows it again.

**The plan goes inside the question because a selection may hide the response above it.** While a selection is open, the response may not be on screen. A plan put only in the response could go unread at the moment it is accepted. Inside the question, it is in view while the engineer chooses.

The question's opening words and the options are fixed. The plan's steps are the agent's. The engineer says what to change in the selection's own text field, or in the reply after it.

**The plan is a list.** Use an ordered list where each step rests on the one above it. Use a bullet list where the steps are independent. This is the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule, applied to a plan.

**Write the plan in ETE.** That is Eventide Technical English: the STE dictionary and the STE writing rules, with Slasher's reserved terms. Short sentences. Active voice. No semicolon. One idea in each list item. The STE dictionary does not approve `hinge`, `actuation`, `cradle`, or `solubility`. A plan written in the raw standard could not name any of them. See the `language` package's ETE rules, in `ete/`.

**This is not a planning record.** `foundation` governs the project's planning records, which are written to a directory and kept. This plan is presented inside the selection, before the agent generates, and it is not written to a file.

**Why:** the engineer's attention is the scarce thing the whole method is arranged around. The arrangement assumes it is always worth spending at a hinge. For work whose rework cost is negligible that assumption is wrong, and five waits buy nothing. That is the ceremony this method exists to discontinue, arriving by a different route.

Making the cadence a decision puts the trade where it belongs, with the person who knows what the work is worth. Keeping DBE in force in the two modes is what stops the decision from being a way out of the method. Unattended work is still designed from the efferent side, still cradled by a test written first, and still judged by solubility.

A record that showed options put to an engineer who was not there would be worse than no record. It would be believed, and recording the mode honestly is what prevents that.

**How to apply:** at a feature's or an experiment's start, ask **attended or unattended** through the selection UI. Ask it alongside the working location. Attended is the default.

Ask it in the words fixed above: *Human in the loop*, then the overall score, the risk of redo, works, and voice, each on a line of its own with its fixed sentence. Put your own three estimates for this piece of work in place of the example figures. Estimate the overall score directly, and give none higher than the lower of works and voice. Give the risk of redo as 100% minus the overall score. When the overall score is 70% or lower, end the question with the fixed warning line, and mark the Attended option *(Recommended)*. Use *You decide. The agent automates.* and *The agent makes the decisions and generates through if you accept the plan it'll propose.* as the options. Name no hinge in the question or in an option.

Record the selection as a confirmation in the feature or experiment record, with the five figures the question showed and whether the warning was shown. Declare it at the top of the loop record. Run the hinges either way.

**When unattended, write the plan as a list in ETE, and put it inside the *Accept the plan?* question, before generating, in the words fixed above.** Write each cycle as its hinge and the decision with its reasoning. Write no Options or Decision / chat line.

## Compressed

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

## Compression

- 2026-10-24, compressed: compression 0.48, change 0.72, solubility 36 → 59, clarity 0.62 → 0.86, 38 directives, 38 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 59 → 54, clarity 0.86 → 0.76; checked: 35 directives, 35 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the question renamed and given the unattended confidence; checked: 50 directives, 50 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept; the question's confidence heading then removed, and the question mark after *Human in the loop* removed, and *(the default)* removed from the Attended option with the directive that the option set show the default, as the engineer directed, not re-checked
- 2026-11-06, revised: a warning and the Attended recommendation at an overall score of 70% or lower; checked: 52 directives, 52 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept; the warning's words then set by the engineer, not re-checked; the overall score's label then set to *Agent's confidence* by the engineer, and the warning's words changed to match, not re-checked; the works figure's label then set to *It'll work* by the engineer, not re-checked; the voice figure's label then set to *Your style*, then to *Satisfactory*, then to *Approval*, then to *Your approval*, by the engineer, not re-checked; the warning's words then set again by the engineer, not re-checked
- 2026-11-06, revised: the risk of redo added, as the engineer directed; checked: 57 directives, 57 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the figures recorded in the start confirmation, as the engineer directed; checked: 58 directives, 58 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-11-06, revised: the Unattended option says the plan comes first, as the engineer directed; checked: 50 directives, 50 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-11-06, revised: unattended work waits for the engineer to accept the plan, and the Unattended option says so, as the engineer directed; checked: 61 directives, 61 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept; the Unattended option's words then set by the engineer, and *approve* made *accept* to match, not re-checked
- 2026-11-06, revised: acceptance asked through the selection UI, with Accept and Revise, as the engineer directed; checked: 69 directives, 69 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-11-06, revised: the plan put inside the *Accept the plan?* question, as the engineer directed; checked: 53 directives, 53 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the `**` marks removed from the question's figures, and a directive added that the question carries none, as the engineer directed; not re-checked
- 2026-11-07, revised: the confidence figure's sentence reads *How sure the agent is about working alone.*, wording the engineer gave; not re-checked
- 2026-11-07, revised: the options are listed Unattended first, and Attended moves first where it is recommended, as the engineer directed; checked: 51 directives, 51 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-07, revised: the warning reads *intervention is indicated*, wording the engineer gave, after a moment as *you're likely to redo the agent's work*, then *reworking the agent's work is recommended*, then *rework is likely*, then *intervention is likely*; not re-checked
- 2026-11-07, revised: the sentence that says what each figure measures is put in parentheses, as the engineer directed; not re-checked
- 2026-11-07, revised: each parenthetical starts with a lower-case letter, as the engineer directed; not re-checked
- 2026-11-07, revised: the *It'll work* sentence reads *how sure the agent is that what it builds on its own does what it says*, wording the engineer gave, after a moment ending *does what it says it does*; not re-checked
- 2026-11-07, revised: *It is 100% minus the agent's confidence.* is removed from the risk-of-redo line, as the engineer directed; not re-checked
- 2026-11-07, revised: the Attended option carries the attended confidence in parentheses, and the confirmation records it, as point 40 and point 32; checked: 51 directives, 51 kept, 0 less precise, 0 lost, 0 repairs
- 2026-11-08, revised: the Attended option's figure follows *Confidence:*, at the engineer's direction; not re-checked

## History

Until Sun Nov 8 2026 the Attended option gave its figure alone, as *Attended (95%)*.

Until Sat Nov 7 2026 the Attended option carried no figure, and the start confirmation recorded four figures.

Until Sat Nov 7 2026 the risk-of-redo line ended *It is 100% minus the agent's confidence.*

Until Sat Nov 7 2026 the *It'll work* figure's sentence read *How sure the agent is that what it builds alone works, and does what the work was started to do.*

Until Sat Nov 7 2026 the sentence that says what each figure measures followed the figure after a full stop, not in parentheses, and started with a capital letter.

Until Sat Nov 7 2026 the warning read *When the agent's confidence is 70% or lower, you may have to redo work the agent does.*

Until Sat Nov 7 2026 the options were listed Attended first and Unattended second, in every case.

Until Sat Nov 7 2026 the confidence figure's sentence read *How sure the agent is that, working alone, it does the work as you would have it done.*

Until Sun Oct 25 2026 this rule was named attended-or-unattended-is-chosen-at-the-start and titled "Attended or unattended is chosen when the work is started. DBE is in effect either way".

Until Fri Nov 6 2026 the question was asked as *Who decides?*, with no confidence figures.

Until Fri Nov 6 2026 each figure in the question was written in bold, between `**` marks, which the selection UI printed as characters.

Related:

- the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — the record's shape and the "none — no gate" form this is distinct from
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule — why attention is placed at the hinges
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the hinges that run either way
- the test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way rule — which forbids asking about the method's substance, where this asks about its cadence
- foundation's an-implementation-runs-on-a-branch-to-a-declared-end rule — the starts where the decision is put

---

Authored by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:02:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:04:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:35:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 6:24:18 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:41:07 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:45:19 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:00:33 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:29 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:25:02 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:12:13 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:07:02 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:16:42 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:46:52 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:52:31 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:57:53 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:58:31 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:59:54 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:06:32 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:18:41 AM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 9:44:58 PM PT
