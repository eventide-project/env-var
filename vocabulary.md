# Language — Vocabulary

The language package's vocabulary: the terms it defines and the word substitutions it enforces. Binding — use these terms and swaps in code, tests, rules, designs, commits, and prose.

**Every word here is one of two things.** This holds for the terms below, and for the **Use**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-its-own-categories rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the
`language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note
names a term absent from the STE dictionary, and reserves it. A definition exists to name a term,
and a term names something in the subject field. A **substitution's Use word** with no STE note is
**ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's
ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its
waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

The *principles* that govern word selection stay as rules — `name-literally-not-by-analogy`, `no-slang`, `communicate-plainly-name-the-thing`, `language-is-precise-here`. This file holds the settled lexicon those principles produce.

## Terms

- **solubility** — how readily a unit dissolves and disappears smoothly into the reader's cognition and understanding. It is cognitive, and the ideal is immediate comprehension with minimal interpretive work. That is knowledge at a glance. The design-quality a unit is judged against, and the quality the name-literally test serves. It is a **load-bearing methodological principle, not merely a term** — its full treatment is the standalone `solubility` rule. It is glossed here only as the vocabulary reference. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **efferent** — the use-site perspective: the view that conducts outward from the unit doing the using to the unit being used. **`caller`, and its compounds `caller-side`, `caller-first`, and `caller's-eye`, are the common software-development patois for this view.** A general design-vocabulary term. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **Eventide Technical English (ETE)** — Waytide's implementation of ASD-STE100 Simplified Technical English: the STE dictionary and the STE writing rules, with Waytide's reserved terms and its substitutions, in the precedence the `ete/` rules state. **`Say it in ETE` is the instruction to write that way**, and it differs from `say it in STE`, which asks for the raw standard — that one forbids `efferent`, `cradle`, `hinge`, and every other term Waytide reserved. The rules are in `waytide/system/language/ete/`. **STE: absent from the STE dictionary, and approved here as a technical noun in the official documents, standards, and guidelines category, per STE Rules 1.5 and 1.8.**
- **actuation** — the invocation of a unit from its use site. **STE: not approved. The STE dictionary gives OPERATION, which names the running of a thing rather than its invocation from a use site. Technical noun, ETE engineering, design, process, and method.**
- **preserve** — to keep something that already exists, rather than putting it there or serving it. A rule preserves a mindset. Clarity is preserved. **Waytide did not coin it.** It is the word structural design and software design already use, kept because the extant term says the thing exactly, which is what the language-is-precise-here rule asks for. **STE: not approved. The STE dictionary gives PRESERVATION, a technical noun for a maintenance procedure, which does not carry this. Technical verb, ETE engineering, design, process, and method.**

## Substitutions

General, domain-less word substitutions. Each puts the literal term in place of a slang, imported-jargon, or figurative one. Each puts the unambiguous term in place of one that leaves a reader to guess which system it belongs to. When the impulse is a word in the **Don't use** column, write the **Use** term. (Domain-specific swaps live in their own package's vocabulary — `verified`/`prevent` in `testing`.)

| Use | Don't use | Meaning |
|---|---|---|
| **normal path** | "happy path" | the ordinary, non-error course through a method or feature. The raising cases are "error cases" / "exceptional cases", and the course through one is the **exceptional path** — never "sad path", and never "exception path". **STE: `normal (adj)` is not approved and gives USUAL (adj), and `path` is absent. Technical noun, ETE engineering, design, process, and method** |
| **conform** (or *reconcile* / *propagate* where more exact) | "sweep" | bringing code or prose into line with a convention. **STE: not approved.** The STE dictionary gives AGREE, which does not carry it |
| **convey** (or plainly "pass … through") | "thread" | a value passed through layers of methods / APIs. **STE: not approved.** The STE dictionary gives MOVE |
| **increment** | "cut" | a bounded slice of scope delivered as a step — and see below for the word's other sense. **STE: `INCREMENT (n)` is approved, meaning one of a sequence, which names a step in a series rather than a slice of scope. Technical noun, ETE engineering, design, process, and method, with its meaning fixed here** |
| **created** / **branched from** | "cut" (a branch) | bringing a git branch into existence from a base — see below. **STE: `create (v)` is not approved and gives MAKE (v), which does not carry branching from a base. Technical verb, ETE engineering, design, process, and method** |
| **install packages** / "the installed bundle" | "vendor" | a plain installation of gem/package dependencies. **STE: `INSTALL (v)` is approved, and used with its approved meaning** |
| **scenario** | "arm" | one variant or case a method or feature handles. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method** |
| a direct question — **"is that right?"**, "does that work?" | "does that land?" | a plain question, not dressed up — and see below for "land" in other uses |
| **effect** | "what it costs" | the result or consequences of a change, named neutrally rather than presumed a cost. **STE: `EFFECT (n)` is approved, and used with its approved meaning. `effect (v)` is not approved and gives DO (v), and Waytide does not use the verb** |
| **examine** | "decode" | working through or inspecting something to understand it. **STE: `EXAMINE (v)` is approved, and used with its approved meaning** |
| **evaluate** / **evaluated** | "score" / "scored" | judging a thing against a criterion and reaching a verdict — a forecast item against what happened, a result against what it claims — see below. **STE: `evaluate (v)` is not approved. The STE dictionary gives EXAMINE (v), and MAKE AN ANALYSIS for its own example *Evaluate the test results*. Technical verb, ETE deliberation and speech** |
| **start** | "pick up" | beginning work on something — a task, a deferred item, or other queued work. **STE: `START (n)` and `START (v)` are approved, and used with their approved meanings** |
| **justified** / **justifiable** | "earns its keep" / "earns its place" | a thing being worth having. The figure is a lodger paying rent, and it says nothing about why the thing is worth having. |
| **selection** / **decision** | "choice" | what the engineer picks at a prompt is a **selection**, and the matter being settled is a **decision**. **STE: `choice (n)` is not approved. The STE dictionary gives SELECTION (n), whose approved meaning is the action or result of choosing.** |
| **required** | "owed" | what a rule asks of a thing. The figure is a debt, and a rule is not a creditor. |
| **in progress** | "in flight" | work that has been started and has not concluded. The figurative sense is an aircraft between takeoff and landing, and it says nothing the literal phrase does not. **STE: `progress` is not approved as a noun or a verb, and gives CONTINUE (v), which names carrying on rather than a state. Technical adjective, ETE engineering, design, process, and method** |
| **dash-separated, lower-case** | "kebab-case" | a name written in lower-case with its words joined by dashes. **STE: `dash` is absent, and `case (n)` is not approved and gives CONDITION (n). Technical adjective, ETE engineering, design, process, and method** |
| **name** | "slug" | the descriptive part of a filename. **STE: `NAME (n)` is approved, and used with its approved meaning** |
| **discontinue** | "retire" | taking a word or a rule out of use. **STE: not approved.** The STE dictionary gives STOP, whose approved meanings are terminal, and a discontinued word did not end |
| **engineer** | "developer" | the person the work is done with and for — at the loop, at a hinge, and as the reader the terminology is conveyed to. **STE: absent from the STE dictionary. Technical noun, STE category 11, professional roles, individuals, groups, organizations, and geopolitical entities** |
| **mediates** | "wrap" / "wrapper" | an object that provides access to another through itself — see below. **STE: absent from the STE dictionary, and `mediate` is absent too. Technical verb, ETE engineering, design, process, and method** |
| **obsolete** (or a more exact word) | "dead" | something no longer in force or in use — see below. **STE: absent from the STE dictionary. Technical adjective, ETE engineering, design, process, and method** |
| **sent to** | "initialized with" / "passed to" | a value passed into a method or initializer — see below. **STE: `SEND (v)` is approved, meaning to cause a thing to go to a place, and Waytide means a value reaching a method. Technical verb, ETE engineering, design, process, and method, with its meaning fixed here** |
| **efferent** | "caller" | the use-site perspective, and the unit doing the using — see below |
| **actuation** | "the call" (the call shape, the call site) | the invocation of a unit — the first efferent reference — see below |
| **activate** / **deactivate** | "switch on" / "switch off" | bringing a system or mechanism into force, or taking it out of force — see below. **STE: `ACTIVATE (v)` is approved, and used with its approved meaning** |
| **the standard's name, then the part** — *STE Rule 1.7*, *the STE dictionary* | "Rule 1.7", "the dictionary" | a reference to any part of an external standard — see below. **STE: this row fixes a citation form rather than reserving a word, so no category applies** |

### Finer distinctions

- **cut** is figurative in two senses, and each has its own substitution. As a **slice of scope**,
  say **increment** — the row above. As **making a branch**, say **created** or **branched from**:
  *this branch was created from `master`*, never *this branch was cut from `master`*. The
  `foundation` experiment-lifecycle rule already writes *branched from*, so the literal term was in
  use before the figure was noticed. The two senses share one word and nothing else, which is why
  the table carries two rows rather than one. **Neither is a discontinuation** — a discontinuation
  names one word and drops it, and each of these names a word to write instead.
- **evaluate** and **examine** are both in this table and do different work. Examining is
  inspecting a thing to understand it. Evaluating is setting it beside a criterion and reaching a
  verdict. A forecast item is examined by reading it and evaluated by putting it against what
  happened.
- **`score` carries an approved meaning Waytide does not use**, which is the most expensive case a
  substitution meets. `scored (adj)` is not approved, and the STE dictionary's `SCORE (TN)` is a
  groove or a scratch in a surface — *if the bearing race is scored, replace it*. A reader who
  meets the word believes they know it. So the substitution is not only a preference for the
  better word. It removes a false reading the dictionary itself supplies.
- **mediates.** The canonical form is the bare verb — *`X` mediates `Y`*, not *`X` mediates for `Y`*. "wrap"/"wrapper" reads as a generic decorator and hides the relationship. "mediates" names it exactly — the object stands between a user and the thing it fronts, providing access to it.
- **efferent** replaces the patois in every sense. The perspective is efferent, and so is the unit
  doing the using. A method has efferents, and a design has an efferent view.

- **obsolete** is the fallback, not the goal. Reach for the exact word when there is one:
  - a reference whose target moved is **unresolvable**
  - a rule no longer in force is **discontinued** or **superseded**
  - a branch that can only go one way **has nothing to decide**
  - an assignment that never happens **never fires**

   "dead" over-dramatizes — nothing died, and the drama distorts judgment, making routine tidying read as urgent repair.
- **sent to** frames a call as sending a message with arguments — an argument is *sent to* the method that receives it. "initialized with" and "passed to" are looser, mechanism-flavored phrasings for the same thing.
- **actuation** governs the invocation *noun*. "To call a method" in the pure-mechanism sense, and "call it X" meaning to *name* it, are different uses — not covered. Use "actuation shape" for its shape, and "use site" for where it is invoked.
- **activate** names what actually happens — a system is brought into force. "Switch on" borrows a light switch, and the borrowed image is wrong in the way that matters. A switch is binary, instantaneous, and reversible by the same gesture. Activating a system is a set of arrangements that can be partly in place. The same holds for **deactivate** over "switch off". This is not a preference for the longer word — "activate" is the extant term for the act, and the figure displaced it.
- **A reference to part of an external standard names that standard.** Waytide has rules of its own, so a bare *Rule 1.7* leaves a reader to work out which system it belongs to. The numbering gives them nothing to work it out from. **The same holds for the standard's
  dictionary**, because every `vocabulary.md` in Waytide is an approved-word dictionary for its
  package, so *the dictionary* names four things at once. Write the standard's name first —
  **STE Rule 1.7**, **STE Rules 1.5 through 1.13**, **the STE dictionary** — in prose, records,
  commits, and dialogue alike. This is a rule about ambiguity rather than about a figure of
  speech: neither word is wrong, and the reference is still incomplete without the name. A Waytide
  rule needs no such prefix, being referred to by its name.

- **land** is a figure in more than one use. As a question — "does that land?" — say a direct question ("is that right?"), per the row above. It is also a figure as an effect taking hold, or a change being deployed: "what landed", "the change landed", "it landed on master". Say **what changed**, **what was affected**, or **took effect**.

**Applying it:** when the impulse is a **Don't use** word, write the **Use** term. That holds in names, prose, comments, commit messages, logs, loop records, and dialogue. When a new substitution is settled, add a row here.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 7 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 5:04:19 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:59:32 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:17:44 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:08:29 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:50:31 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 2:01:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 4:53:01 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 7:25:35 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:50:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:52:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 3:22:51 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 6:24:18 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:31:07 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:12:33 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:53:50 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:19:04 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:47:50 PM PT
