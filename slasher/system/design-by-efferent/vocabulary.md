# The Design By Efferent vocabulary: use these terms with these meanings

The lexicon of **Design By Efferent** (DBE) — use this vocabulary, with these meanings, in code, tests, rules, designs, commits, and prose. This is the canonical glossary. The deeper docs defer to it.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## The one-liner

> The AI **generates** straight through, and **waits** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**. Everything else is **mechanical**.

## Terms

| Term | Role | Meaning |
|---|---|---|
| **Design By Efferent** / **DBE** | the methodology | The name of the whole approach these rules, this lexicon, and the loop describe. A **design** discipline (tests drive design, not "development"), driven **by the efferent** — the use-site view. A variant *of* TDD (tests are the vehicle). The name foregrounds what makes it distinct: design driven from the efferent reference. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **loop** | the cycle | The DBE cycle — a *distributed* OODA loop (Boyd): the AI **observes** and **acts** (mechanized), the human **orients** and **decides** at the gates. Orientation — design judgment — is the irreplaceable phase, kept with the human. **STE: `LOOP (n)` is approved, meaning *a circular shape made in a flexible material*, which is not this. `loop (v)` is not approved and gives LOOP (n). Technical noun, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule.** |
| **cycle** | the unit of the loop | **One traversal of the loop**: a hinge surfaced, decided, and acted on. It is the unit a loop record is written in — one section per cycle, carrying that cycle's hinge, the options put at the gate, and the decision. **STE: `CYCLE (n)` is approved, meaning *one complete sequence of operation*, which names a machine's repetition rather than a design cycle. `cycle (v)` is not approved and gives CYCLE (n). Technical noun, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule.** |
| **hinge** | the object | A decision the design turns on — one that is **subtle** *and* **load-bearing**. Where the human's judgment belongs. **STE: absent from the STE dictionary as a noun. The STE dictionary lists `hinge (v)` and gives TURN for it. Slasher does not use the verb. Technical noun, ETE engineering, design, process, and method.** |
| **attended** / **unattended** | the human's level of participation | Whether the loop **stops** at each hinge for the engineer (attended, the default) or the agent decides each hinge and generates through (unattended). Chosen at a feature's or experiment's start and held for its duration. **DBE is in effect either way** — the cradle, the efferent-first actuation, and the solubility standard hold in the two. Only the stopping changes. A batch-size trade: attention spent continuously against rework paid at the end. **STE: absent from the STE dictionary. Technical adjectives, ETE human-computer interaction.** |
| **gate** | the mechanism | Where the loop stops and responsibility transfers to the human. The interrupt. The loop *waits* at a gate, and `gate` is a noun and never a verb. It is the mirror of **transfer**, which is a verb and never a noun. **STE: absent from the STE dictionary in this sense. The standard lists `gate` in category 5 as an airport gate. Technical noun, ETE engineering, design, process, and method.** |
| **deliberation** | the human's act | What the human does at a gate: weighs the hinge and decides. *Deliberate* = carefully weighed **and** intentional — the opposite of the AI's averaging. **STE: absent from the STE dictionary. Technical noun, ETE deliberation and speech.** |
| **code generation** | what the agent produces between hinges | The code the agent writes straight through, without stopping. The complement of **deliberation**, which is what the human does at a gate, and the substance of what is **mechanical**. `product generation` in the `versioning` vocabulary is an unrelated term. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **mechanical** / **mechanics** | the complement | Everything that isn't a hinge — the AI generates it straight through. **STE: `MECHANICAL (adj)` is approved, meaning *related to or operated with a mechanism*, which is not this. Technical noun and technical adjective, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule.** |
| **subtle** (vs **crude**) | first mark of a hinge | The decision takes design judgment that isn't written in the code or tests — it lives in the person. Crude = a tool/pattern/answer you can read off the artifacts. (Per Bellware's subtle/crude-knowledge distinction: https://madabout.software/articles/subtle-knowledge-crude-knowledge/) **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.** |
| **cradle** | the constraint | The efferent test, held during code generation — it holds the implementation in position without gripping it rigid, steering toward solubility. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **efferent** | the perspective | Designing a unit from the use site. DBE is the method built on designing from this view: the test is the first efferent reference, the interface designed from the efferent side. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **actuation** | the act | The invocation of the unit under test — the first efferent reference. In DBE it is written before any implementation, forcing the interface to be designed from the use site, and is the first and highest-leverage gate. **STE: not approved. The STE dictionary gives OPERATION, which names the running of a thing rather than its invocation from a use site. Technical noun, ETE engineering, design, process, and method.** |
| **observation** | the act of reading the outcome | What the test observes about the outcome of the actuation. An **assertion** is the mechanism by which an observation is implemented, not the thing itself. **STE: absent from the STE dictionary. `observe (v)` is not approved and gives MONITOR (v), which names watching rather than reading a result. Technical noun, ETE engineering, design, process, and method.** |
| **load-bearing** | second mark of a hinge | Other work rests on the decision, so a wrong one spreads and sticks: cheap to fix now, costly later. **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.** |
| **solubility** | the quality | The general design-quality term: how readily a unit dissolves into the reader's understanding. **In DBE it is the focus of the actuation hinge.** The particular expression of solubility is judged from the use site, which is the **efferent** view. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **mean-bias** | the AI's failure mode | The AI's pull toward the average of the code it has seen — most of which is poorly designed. It acts on the human too: a single AI proposal put up for approval drags the human's judgment down toward that average. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |


## The two results the gates rest on

Every gate's form follows from two results, and the rules refer to them by these names:

**Make the human produce the answer, not approve one.** A single proposal put up for approval ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer. Judging is not producing: the human ratifies, and their judgment is pulled toward the average rather than exercised above it. Offering several genuine alternatives keeps the human comparing real candidates, and producing an answer instead of ratifying one. So a gate presents alternatives, never a fait accompli.

**The best options are ones the AI can't produce.** The option set is the AI's own, drawn from the average. The best answer is often one only the human can produce.

The first result says *why there are options*. The second says *why the options are never enough*.

## "Cycle" is scoped by what precedes it

The word names three nested things, and **the word before it says which**. This is deliberate, and it is the one place this vocabulary lets a term carry more than one meaning:

- **a cycle** — one traversal of the loop: a hinge surfaced, decided, acted on. The unit a loop record is written in.
- **the hinge cycle** — the five hinges in order, actuation through naming, for one outcome's initial implementation. A hinge cycle is five cycles.
- **the DBE cycle** — the loop itself, the whole distributed OODA cycle. Interchangeable with **the loop**, which is the preferred term for it.

**Bare "cycle" is always the smallest of the three.** The larger two are never written without their qualifier, so an unqualified cycle is one traversal and nothing else.

**Why one word rather than three.** The three are the same shape at different scales — a traversal, a sequence of traversals for one outcome, and the whole. Naming them with unrelated words would hide that they nest. The qualifier carries the scale at the cost of a word. The alternative considered was to reserve "cycle" for the traversal and rename the other two. That is more edits for a distinction the qualifier already draws.

## "Load-bearing", explained

The two marks of a hinge — **subtle** and **load-bearing** — are independent, and a hinge needs **the two**. "Subtle" is about *who can make the call* (the judgment lives in the person vs. it can be read off the artifacts). "Load-bearing" is about *what depends on the call*.

**The metaphor is literal, not decorative.** In a building, a *load-bearing* wall carries the weight of the structure above it. A *partition* wall just divides a room. You can move a partition wall freely. Move or misplace a load-bearing wall, and everything resting on it shifts or collapses. The later you do it, the more has been built on top, and the more it costs.

**Applied to a decision:** a decision is load-bearing when **other work rests on it** — later code, the tests, and other decisions all assume it. So a wrong load-bearing decision has two properties:

- It **spreads** — everything built on it inherits the mistake.
- It **sticks** — once things rest on it, undoing it means undoing them too.

Together these give the **asymmetry that justifies the gate**. A load-bearing decision is **cheap to fix now**, before anything rests on it, and **costly to fix later**. The human's judgment has the most leverage *before* the weight is added — which is exactly why the loop waits there and not afterward.

**How to recognize it:** ask what happens if this decision is wrong. *How far does the damage spread, and how expensive is it to reverse once we have built on it?* Wide spread + expensive reversal → load-bearing. Local + cheap to change → not.

**Why the two marks are required:**

- Load-bearing **but crude** (the right answer is readable off the code/tests/patterns) → the AI can make it. No gate needed, even though much rests on it.
- Subtle **but not load-bearing** (takes judgment, but the decision is local and cheaply changed) → not worth stopping the human. A wait there is ceremony.
- **Subtle *and* load-bearing** → a hinge. Gate it.

**Example:** the **actuation** — the efferent shape of the invocation — is load-bearing: the test, the observations. The implementation all rest on it. So a wrong shape spreads into all of them, and gets costly to change once code depends on it. That is why it is the first and highest-leverage gate. By contrast, the wording of a `comment` line is not load-bearing — nothing rests on it, and it is changed in seconds.

## The loop, as a distributed OODA cycle

"The loop" — the DBE cycle — is a **distributed OODA loop** (John Boyd: **O**bserve, **O**rient, **D**ecide, **A**ct). Boyd's loop is one mind's decision cycle. Here the four phases are **split between two agents**, and the split is the whole point.

| OODA phase | Owner | In the loop |
|---|---|---|
| **Observe** | AI | surfaces the state — the proposed actuation, the candidate options, the test, the run result |
| **Orient** | **human** | **deliberates** — weighs the hinge against design judgment (the standard of solubility, subtle knowledge, experience) |
| **Decide** | **human** | chooses at the **gate** — selects an option, dictates, or accepts |
| **Act** | AI | **generates** within the cradle |

**Orient is the load-bearing phase — which is why the human owns it.** Boyd held that Orient dominates the loop: it shapes what you observe, what you decide, and how you act. This method's thesis is identical — the human's **orientation** (design judgment) is the irreplaceable locus, while Observe and Act are mechanized to the AI. The AI's failure mode, "regressing to the average," is a **degraded orientation**: oriented to the mean of all code rather than the well-designed subset. The loop exists to route through the human's orientation at the moments it bears weight — the hinges.

**Implicit guidance = mechanical.** Boyd's loop has a fast path — *implicit guidance and control* — where action flows straight from orientation, bypassing explicit Decide. That is exactly **mechanical** code generation: once orientation is settled (the cradle set, solubility clear), the AI generates straight through. The **gate** — an explicit Decide — fires only at a **hinge**.

**The four phase names are reserved, as nouns and as verbs.** `Observe`, `Orient`, `Decide`, and `Act` are John Boyd's words, quoted rather than coined. Slasher writes the noun in capitals for the phase and the verb in lower case for the act — *the AI observes and acts*. **The two forms are reserved**, settled 2026-08-09.

**The STE dictionary lists all four as verbs and names a replacement for each.** It gives MONITOR for `observe`, POINT for `orient`, and SELECT for `decide`. For `act` it gives the guidance to use an accurate verb. None of the four nouns is in the STE dictionary. **Slasher keeps the two forms**, because replacing the verb would break the quotation and cost the reader Boyd's reference. See the `language` package's slasher-keeps-its-word-where-the-ste-word-means-something-else rule.

**What does not transfer.** OODA is best known for its *adversarial, tempo* use — cycle faster than an opponent, get "inside" their loop, collapse their orientation. There is no adversary in DBE. Speed-as-weapon does not apply, and importing it would mislead. What transfers is the **structure** — the four phases and the primacy of Orient — not the **contest**.

## Substitutions

A word not to write, and the word to write instead. When the impulse is a word in the **Don't use** column, write the **Use** term.

| Use | Don't use | Meaning |
|---|---|---|
| **subtle** | "intrinsic" | the first mark of a hinge — the judgment lives in the person rather than in the artifacts |
| **load-bearing** | "asymmetric" | the second mark of a hinge — other work rests on the decision |
| **mechanical** | "non-hinge" | everything that is not a hinge, which the AI generates straight through |
| **cycle** | "pass" | one traversal of the loop — see "Cycle is scoped by what precedes it" |
| **wait** | "gate", as a verb | what the loop does at a hinge. `gate` is the noun for the mechanism and takes no verb form. **STE: `WAIT (v)` is approved, and used with its approved meaning** |
| **the human's level of participation** | "gating cadence" | whether the human is in the loop. Attended is in the loop, and unattended is out of it. Attended and unattended cause a cadence and are not one. **STE: `level` is approved with a meaning Slasher does not use.** `LEVEL (n)` is *a horizontal line, plane, surface, or condition*. Slasher's sense is degree, which STE Rule 1.3 forbids, so `level` is reserved |

## Discontinuations

A word removed from use with nothing in its place. **This is not a substitution.** A substitution names two words. A discontinuation names one, because the concept went rather than the name.

- **discriminator** — there is no test-noun. The test is just "is this a hinge?"
- **capability-independent** — state it plainly. Subtlety is about the design, not the model.

**Why:** The terminology is the conveyable output of this work — it is how the approach is taught to other engineers. Scattering it over observations and a digest left no authoritative source and risked drift. One binding glossary keeps usage consistent and avoids the overloaded or academic words this method rejects (e.g. discriminator, intrinsic, "given", "non-hinge"). Each term was chosen for solubility: plain, positive where possible, and free of programming collisions. Two competing "the name" declarations would drift, so DBE is the single canonical name.

**How to apply:** Use these words, with these meanings, wherever you write about DBE. Prefer them over synonyms. Do not reintroduce a discontinued term.

## Compressed

## The vocabulary

1. This is the canonical glossary. The deeper docs defer to it.
2. The one-liner:

> The AI **generates** straight through, and **waits** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**. Everything else is **mechanical**.

## Terms

1. **Design By Efferent** / **DBE** (the methodology): the name of the whole approach these rules, this lexicon, and the loop describe. A design discipline, where tests drive design, not "development". Driven by the efferent, the use-site view. A variant of TDD, with tests as the vehicle. DBE is the single canonical name.
2. **loop** (the cycle): the DBE cycle, a distributed OODA loop (Boyd). The AI observes and acts, mechanized. The human orients and decides at the gates. Orientation, design judgment, is the irreplaceable phase, kept with the human.
3. **cycle** (the unit of the loop): one traversal of the loop: a hinge surfaced, decided, and acted on. It is the unit a loop record is written in: one section per cycle, carrying that cycle's hinge, the options put at the gate, and the decision.
4. **hinge** (the object): a decision the design turns on, one that is subtle and load-bearing. Where the human's judgment belongs.
5. **attended** / **unattended** (the human's level of participation): whether the loop stops at each hinge for the engineer (attended, the default), or the agent decides each hinge and generates through (unattended). Choose it at a feature's or experiment's start and hold it for its duration. DBE is in effect either way: the cradle, the efferent-first actuation, and the solubility standard hold in both. Only the stopping changes.
6. **gate** (the mechanism): where the loop stops and responsibility transfers to the human. The interrupt. The loop waits at a gate. `gate` is a noun and never a verb. **transfer** is a verb and never a noun.
7. **deliberation** (the human's act): what the human does at a gate: weighs the hinge and decides. *Deliberate* means carefully weighed and intentional, the opposite of the AI's averaging.
8. **code generation** (what the agent produces between hinges): the code the agent writes straight through, without stopping. The complement of deliberation, and the substance of what is mechanical. It is unrelated to `product generation` in the `versioning` vocabulary.
9. **mechanical** / **mechanics** (the complement): everything that is not a hinge. The AI generates it straight through.
10. **subtle** (vs **crude**) (first mark of a hinge): the decision takes design judgment that is not written in the code or tests. It lives in the person. Crude is a tool, pattern, or answer that can be read off the artifacts. The distinction is Bellware's subtle and crude knowledge: https://madabout.software/articles/subtle-knowledge-crude-knowledge/.
11. **cradle** (the constraint): the efferent test, held during code generation. It holds the implementation in position without gripping it rigid, steering toward solubility.
12. **efferent** (the perspective): DBE is built on designing from this view: the test is the first efferent reference, and the interface is designed from the efferent side.
13. **actuation** (the act): the invocation of the unit under test, the first efferent reference. Write it before any implementation, so the interface is designed from the use site. It is the first and highest-leverage gate.
14. **observation** (the act of reading the outcome): what the test observes about the outcome of the actuation. An **assertion** is the mechanism that implements an observation, not the observation itself.
15. **load-bearing** (second mark of a hinge): other work rests on the decision, so a wrong one spreads and sticks: cheap to fix now, costly later.
16. **solubility** (the quality): in DBE it is the focus of the actuation hinge. Judge its particular expression from the use site, the efferent view.
17. **mean-bias** (the AI's failure mode): the AI's pull toward the average of the code it has seen, most of which is poorly designed. It acts on the human too: a single AI proposal put up for approval drags the human's judgment toward that average.

## The two results the gates rest on

1. The rules refer to two results by these names: **Make the human produce the answer, not approve one**, and **The best options are ones the AI can't produce**.
2. A gate presents several genuine alternatives. It never presents a single proposal for approval or a fait accompli.

## "Cycle" is scoped by what precedes it

1. The word before "cycle" says which of three nested things it names. This is the one place this vocabulary lets a term carry more than one meaning.
2. **a cycle**: one traversal of the loop: a hinge surfaced, decided, acted on. The unit a loop record is written in.
3. **the hinge cycle**: the five hinges in order, actuation through naming, for one outcome's initial implementation. A hinge cycle is five cycles.
4. **the DBE cycle**: the loop itself, the whole distributed OODA cycle. Interchangeable with **the loop**, which is the preferred term.
5. Bare "cycle" is always one traversal. Never write the larger two without their qualifier.

## "Load-bearing", explained

1. A hinge needs both marks, subtle and load-bearing. They are independent. Subtle is about who can make the call. Load-bearing is about what depends on the call.
2. The metaphor is literal, as a load-bearing wall carries the structure above it and a partition wall does not.
3. A decision is load-bearing when other work rests on it: later code, the tests, and other decisions assume it. A wrong one spreads, as everything built on it inherits the mistake, and sticks, as undoing it means undoing them.
4. A load-bearing decision is cheap to fix now and costly to fix later. The loop waits before the weight is added, not afterward.
5. To recognize it, ask: if this decision is wrong, how far does the damage spread, and how expensive is it to reverse once built on? Wide spread and expensive reversal is load-bearing. Local and cheap to change is not.
6. Load-bearing but crude, with the answer readable off the code, tests, or patterns: the AI makes it, with no gate.
7. Subtle but not load-bearing: do not stop the human. A wait there is ceremony.
8. Subtle and load-bearing: a hinge. The loop waits at a gate there.
9. The actuation is load-bearing. The wording of a `comment` line is not.

## The loop, as a distributed OODA cycle

1. The loop is a distributed OODA loop (John Boyd: Observe, Orient, Decide, Act), with the four phases split between the AI and the human.
2. **Observe**, the AI: surfaces the state: the proposed actuation, the candidate options, the test, the run result.
3. **Orient**, the human: deliberates, weighing the hinge against design judgment: the standard of solubility, subtle knowledge, experience.
4. **Decide**, the human: chooses at the gate: selects an option, dictates, or accepts.
5. **Act**, the AI: generates within the cradle.
6. Orient is the load-bearing phase, and the human owns it. The AI's regression to the average is a degraded orientation.
7. Boyd's implicit guidance and control is mechanical code generation: once orientation is settled, the AI generates straight through. The gate, an explicit Decide, fires only at a hinge.
8. The four phase names are reserved, as nouns and as verbs. Write the noun capitalized for the phase and the verb in lower case for the act: *the AI observes and acts*.
9. The STE dictionary lists all four as verbs: MONITOR for `observe`, POINT for `orient`, SELECT for `decide`, and for `act` the guidance to use an accurate verb. None of the four nouns is in it. Keep the two forms, so the Boyd quotation stays whole. See the `language` package's slasher-keeps-its-word-where-the-ste-word-means-something-else rule.
10. Do not import OODA's adversarial, tempo use. There is no adversary in DBE. Only the structure transfers: the four phases and the primacy of Orient.

## Substitutions

1. Write **subtle**, not "intrinsic": the first mark of a hinge, where the judgment lives in the person rather than in the artifacts.
2. Write **load-bearing**, not "asymmetric": the second mark of a hinge, where other work rests on the decision.
3. Write **mechanical**, not "non-hinge": everything that is not a hinge, which the AI generates straight through.
4. Write **cycle**, not "pass": one traversal of the loop.
5. Write **wait**, not "gate" as a verb: what the loop does at a hinge. `gate` is the noun for the mechanism and takes no verb form.
6. Write **the human's level of participation**, not "gating cadence": whether the human is in the loop. Attended is in the loop, and unattended is out of it. Attended and unattended cause a cadence and are not one.

## Discontinuations

1. **discriminator**: there is no test-noun. The test is "is this a hinge?"
2. **capability-independent**: state it plainly. Subtlety is about the design, not the model.

## Compression

- 2026-10-29, compressed: 17966 → 12759 characters; checked: 120 directives, 109 kept, 10 less precise, 1 lost; 6 repairs, re-checked: 85 directives, 81 kept, 3 less precise, 1 lost; what is still not kept was judged reasons or background
- 2026-10-29, revised: the head line saying every word is approved or reserved is left out of the compressed text, at the engineer's direction, since the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule states it in the read
- 2026-10-29, revised: the lines naming the vocabulary and saying it is binding are left out of the compressed text, at the engineer's direction; the loader names the file, and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says every vocabulary binds
- 2026-10-29, revised: the line "Prefer these words over synonyms. Do not reintroduce a discontinued term." is left out of the compressed text, at the engineer's direction, after an evaluation found the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule and the language rules already say to use a vocabulary's terms and no loose synonym, and the Discontinuations section takes a discontinued word out of use
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 111 directives, 96 kept, 6 less precise, 9 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule
- 2026-11-05, revised: each entry's STE note is left out of the compressed text, at the engineer's direction; it matters only when a word is reserved or an entry written, and the full text keeps it

## History

Until Thu Oct 29 2026, this file said that every gate's form is options plus a mandatory free-text option, and that every gate keeps the free-text option, for the human to dictate outright or open a chat, because a closed list tempts the human to pick from it instead of producing their own answer. The file said nothing about an `Explain` option.

Related:

- the dbe-is-a-design-tool-not-a-testing-ritual rule
- the the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert rule
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- the tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation rule
- the `language` package's solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding rule and its name-concepts-literally-not-by-analogy-code-or-jargon rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 4:53:01 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:59:35 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:40:54 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 2:04:52 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:31:07 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:38:29 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:41:07 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:55:34 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:04:03 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:09:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:34:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:40:05 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:33:19 PM PT
