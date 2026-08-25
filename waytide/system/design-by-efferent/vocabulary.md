# The Design By Efferent vocabulary: use these terms with these meanings

The lexicon of **Design By Efferent** (DBE) — use this vocabulary, with these meanings, in code, tests, rules, designs, commits, and prose. This is the canonical glossary. The deeper docs defer to it.

**Every word here is one of two things.** This holds for the terms below, and for the **Use** column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required, and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An ETE category is reserved under the ete-declares-its-own-categories rule. STE Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it with a meaning Waytide does not use. The last of the three is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the `language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note names a term absent from the STE dictionary, and reserves it. A definition exists to name a term, and a term names something in the subject field. A **substitution's Use word** with no STE note is **ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## The one-liner

> The AI **generates** straight through, and **waits** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**. Everything else is **mechanical**.

## Terms

| Term | Role | Meaning |
|---|---|---|
| **Design By Efferent** / **DBE** | the methodology | The name of the whole approach these rules, this lexicon, and the loop describe. A **design** discipline (tests drive design, not "development"), driven **by the efferent** — the use-site view. A variant *of* TDD (tests are the vehicle). The name foregrounds what makes it distinct: design driven from the efferent reference. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **loop** | the cycle | The DBE cycle — a *distributed* OODA loop (Boyd): the AI **observes** and **acts** (mechanized), the human **orients** and **decides** at the gates. Orientation — design judgment — is the irreplaceable phase, kept with the human. **STE: `LOOP (n)` is approved, meaning *a circular shape made in a flexible material*, which is not this. `loop (v)` is not approved and gives LOOP (n). Technical noun, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning rule.** |
| **cycle** | the unit of the loop | **One traversal of the loop**: a hinge surfaced, decided, and acted on. It is the unit a loop record is written in — one section per cycle, carrying that cycle's hinge, the options put at the gate, and the decision. **STE: `CYCLE (n)` is approved, meaning *one complete sequence of operation*, which names a machine's repetition rather than a design cycle. `cycle (v)` is not approved and gives CYCLE (n). Technical noun, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning rule.** |
| **hinge** | the object | A decision the design turns on — one that is **subtle** *and* **load-bearing**. Where the human's judgment belongs. **STE: absent from the STE dictionary as a noun. The STE dictionary lists `hinge (v)` and gives TURN for it. Waytide does not use the verb. Technical noun, ETE engineering, design, process, and method.** |
| **attended** / **unattended** | the human's level of participation | Whether the loop **stops** at each hinge for the engineer (attended, the default) or the agent decides each hinge and generates through (unattended). Chosen at a feature's or experiment's start and held for its duration. **DBE is in effect either way** — the cradle, the efferent-first actuation, and the solubility standard hold in the two. Only the stopping changes. A batch-size trade: attention spent continuously against rework paid at the end. **STE: absent from the STE dictionary. Technical adjectives, ETE human-computer interaction.** |
| **gate** | the mechanism | Where the loop stops and responsibility transfers to the human. The interrupt. The loop *waits* at a gate, and `gate` is a noun and never a verb. It is the mirror of **transfer**, which is a verb and never a noun. **STE: absent from the STE dictionary in this sense. The standard lists `gate` in category 5 as an airport gate. Technical noun, ETE engineering, design, process, and method.** |
| **deliberation** | the human's act | What the human does at a gate: weighs the hinge and decides. *Deliberate* = carefully weighed **and** intentional — the opposite of the AI's averaging. **STE: absent from the STE dictionary. Technical noun, ETE deliberation and speech.** |
| **code generation** | what the agent produces between hinges | The code the agent writes straight through, without stopping. The complement of **deliberation**, which is what the human does at a gate, and the substance of what is **mechanical**. `product generation` in the `versioning` vocabulary is an unrelated term. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **mechanical** / **mechanics** | the complement | Everything that isn't a hinge — the AI generates it straight through. **STE: `MECHANICAL (adj)` is approved, meaning *related to or operated with a mechanism*, which is not this. Technical noun and technical adjective, ETE engineering, design, process, and method, with its meaning fixed here per the ete-fixes-the-meaning rule.** |
| **subtle** (vs **crude**) | first mark of a hinge | The decision takes design judgment that isn't written in the code or tests — it lives in the person. Crude = a tool/pattern/answer you can read off the artifacts. (Per Bellware's subtle/crude-knowledge distinction: https://madabout.software/articles/subtle-knowledge-crude-knowledge/) **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.** |
| **cradle** | the constraint | The efferent test, held during code generation — it holds the implementation in position without gripping it rigid, steering toward solubility. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **efferent** | the perspective | Designing a unit from the use site. DBE is the method built on designing from this view: the test is the first efferent reference, the interface designed from the efferent side. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **actuation** | the act | The invocation of the unit under test — the first efferent reference. In DBE it is written before any implementation, forcing the interface to be designed from the use site, and is the first and highest-leverage gate. **STE: not approved. The STE dictionary gives OPERATION, which names the running of a thing rather than its invocation from a use site. Technical noun, ETE engineering, design, process, and method.** |
| **observation** | the act of reading the outcome | What the test observes about the outcome of the actuation. An **assertion** is the mechanism by which an observation is implemented, not the thing itself. **STE: absent from the STE dictionary. `observe (v)` is not approved and gives MONITOR (v), which names watching rather than reading a result. Technical noun, ETE engineering, design, process, and method.** |
| **load-bearing** | second mark of a hinge | Other work rests on the decision, so a wrong one spreads and sticks: cheap to fix now, costly later. **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method.** |
| **solubility** | the quality | The general design-quality term: how readily a unit dissolves into the reader's understanding. **In DBE it is the focus of the actuation hinge.** The particular expression of solubility is judged from the use site, which is the **efferent** view. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |
| **mean-bias** | the AI's failure mode | The AI's pull toward the average of the code it has seen — most of which is poorly designed. It acts on the human too: a single AI proposal put up for approval drags the human's judgment down toward that average. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.** |


## The two results the gates rest on

Every gate's form — options plus a mandatory free-text option — follows from two results, and the rules refer to them by these names:

**Make the human produce the answer, not approve one.** A single proposal put up for approval ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer. Judging is not producing: the human ratifies, and their judgment is pulled toward the average rather than exercised above it. Offering several genuine alternatives keeps the human comparing real candidates, and producing an answer instead of ratifying one. So a gate presents alternatives, never a fait accompli.

**The best options are ones the AI can't produce.** The option set is the AI's own, drawn from the average. The best answer is often one only the human can produce.

A closed list tempts the human to pick from it instead of producing their own. So every gate keeps the free-text option there — the human dictating outright, or a chat to work the answer out. It is mandatory, at every gate, without exception. It is what keeps the human above the AI's mean when the right answer is not on the list.

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

**The four phase names are reserved, as nouns and as verbs.** `Observe`, `Orient`, `Decide`, and `Act` are John Boyd's words, quoted rather than coined. Waytide writes the noun in capitals for the phase and the verb in lower case for the act — *the AI observes and acts*. **The two forms are reserved**, settled 2026-08-09.

**The STE dictionary lists all four as verbs and names a replacement for each.** It gives MONITOR for `observe`, POINT for `orient`, and SELECT for `decide`. For `act` it gives the guidance to use an accurate verb. None of the four nouns is in the STE dictionary. **Waytide keeps the two forms**, because replacing the verb would break the quotation and cost the reader Boyd's reference. See the `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

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
| **the human's level of participation** | "gating cadence" | whether the human is in the loop. Attended is in the loop, and unattended is out of it. Attended and unattended cause a cadence and are not one. **STE: `level` is approved with a meaning Waytide does not use.** `LEVEL (n)` is *a horizontal line, plane, surface, or condition*. Waytide's sense is degree, which STE Rule 1.3 forbids, so `level` is reserved |

## Discontinuations

A word removed from use with nothing in its place. **This is not a substitution.** A substitution names two words. A discontinuation names one, because the concept went rather than the name.

- **discriminator** — there is no test-noun. The test is just "is this a hinge?"
- **capability-independent** — state it plainly. Subtlety is about the design, not the model.

**Why:** The terminology is the conveyable output of this work — it is how the approach is taught to other engineers. Scattering it over observations and a digest left no authoritative source and risked drift. One binding glossary keeps usage consistent and avoids the overloaded or academic words this method rejects (e.g. discriminator, intrinsic, "given", "non-hinge"). Each term was chosen for solubility: plain, positive where possible, and free of programming collisions. Two competing "the name" declarations would drift, so DBE is the single canonical name.

**How to apply:** Use these words, with these meanings, wherever you write about DBE. Prefer them over synonyms. Do not reintroduce a discontinued term.

Related:

- the DBE-as-design-tool
- first-turn
- human-in-the-loop
- hinge-cycle
- "TDD designs
- coverage prevents" rules. The `language` package's solubility rule and its name-literally standard

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
