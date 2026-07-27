# Language — Vocabulary

The language package's vocabulary: the terms it defines and the word substitutions it enforces. Binding — use these terms and swaps in code, tests, rules, designs, commits, and prose.

The *principles* that govern word choice stay as rules — `name-literally-not-by-analogy`, `no-slang`, `communicate-plainly-name-the-thing`, `language-is-precise-here`. This file holds the settled lexicon those principles produce.

## Terms

- **solubility** — how readily a unit dissolves into use, judged from the use site; the design-quality a unit is judged against, and the quality the name-literally test serves. It is a **load-bearing methodological principle, not merely a term** — its full treatment is the standalone `solubility` rule; it is glossed here only as the vocabulary reference.
- **efferent** — the use-site perspective: designing a unit from the outside in, from the standpoint of what uses it — the view that conducts outward from the unit toward its use. A general design-vocabulary term; `design-by-efferent` is the method built on designing from this view, and specializes the term in its own vocabulary.
- **actuation** — the invocation of a unit, from its use site; the first efferent reference to it. A general term; `design-by-efferent` specializes it — there the actuation is written before any implementation, and is the first gate.

## Substitutions

General, domain-less word substitutions — the literal term in place of a slang, imported-jargon, or figurative one. When the impulse is a word in the **Don't say** column, write the **Say** term. (Domain-specific swaps live in their own package's vocabulary — `verified`/`protect` in `testing`.)

| Say | Don't say | What it names |
|---|---|---|
| **normal path** | "happy path" | the ordinary, non-error course through a method or feature; the raising cases are "error cases" / "exceptional cases", never "sad path" |
| **conform** (or *reconcile* / *propagate* where more exact) | "sweep" | bringing code or prose into line with a convention |
| **convey** (or plainly "pass … through") | "thread" | a value passed through layers of methods / APIs |
| **increment** | "cut" | a bounded slice of scope delivered as a step |
| **install packages** / "the installed bundle" | "vendor" | a plain installation of gem/package dependencies |
| **scenario** | "arm" | one variant or case a method or feature handles |
| a direct question — **"is that right?"**, "does that work?" | "does that land?" | a plain question, not dressed up — and see below for "land" in other uses |
| **impact** | "what it costs" | the effect or consequences of a change, named neutrally rather than presumed a cost |
| **examine** | "decode" | working through or inspecting something to understand it |
| **initiate** | "pick up" | beginning work on something — starting a task, a deferred item, or other queued work |
| **dash-separated, lower-case** | "kebab-case" | a name written in lower-case with its words joined by dashes |
| **name** | "slug" | the descriptive part of a filename |
| **mediates** | "wrap" / "wrapper" | an object that provides access to another through itself — see below |
| **obsolete** (or a more exact word) | "dead" | something no longer in force or in use — see below |
| **sent to** | "initialized with" / "passed to" | a value passed into a method or initializer — see below |
| **efferent** | "caller" (caller-side, caller-first, caller's-eye) | the use-site perspective — designing a unit from the outside in |
| **actuation** | "the call" (the call shape, the call site) | the invocation of a unit — the first efferent reference — see below |

### Finer distinctions

- **mediates.** The canonical form is the bare verb — *`X` mediates `Y`*, not *`X` mediates for `Y`*. "wrap"/"wrapper" reads as a generic decorator and hides the relationship; "mediates" names it exactly — the object stands between a user and the thing it fronts, providing access to it.
- **obsolete** is the fallback, not the goal — reach for the exact word when there is one: a reference whose target moved is **unresolvable**; a rule no longer in force is **retired** or **superseded**; a branch that can only go one way **has nothing to decide**; an assignment that never happens **never fires**. "dead" over-dramatizes — nothing died, and the drama distorts judgment, making routine tidying read as urgent repair.
- **sent to** frames a call as sending a message with arguments — an argument is *sent to* the method that receives it. "initialized with" and "passed to" are looser, mechanism-flavored phrasings for the same thing.
- **actuation** governs the invocation *noun*. "To call a method" in the pure-mechanism sense, and "call it X" meaning to *name* it, are different uses — not covered. Use "actuation shape" for its shape, and "use site" for where it is invoked.
- **land** is a figure in more than one use. As a question — "does that land?" — say a direct question ("is that right?"), per the row above. As an effect taking hold or a change being deployed — "what landed", "the change landed", "it landed on master" — say **what changed**, **what was affected**, or **took effect**.

**Applying it:** when the impulse is a **Don't say** word — in names, prose, comments, commit messages, logs, loop records, and dialogue — write the **Say** term. When a new substitution is settled, add a row here.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 7 PM PT
