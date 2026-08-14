# Never favor prepositions in method names

Do not put a preposition in a method name (`import_from`, `define_in`, `set_to`, `copy_into`). A preposition in a method name points at the **argument**. But arguments are **inherent to methods**, so nothing in the name needs to announce them. The parameter already says "what follows is an argument". A preposition-word adds no information the call site doesn't already carry. Name the method for the action alone (`import`, `define`, `set`, `copy`).

**The rubric argument (why "some" is not allowed):** a preposition refers to the argument, and a method's arguments are intrinsic to it. So any rationale that licenses a preposition in *one* method name licenses it in *every* method name that takes an argument. That is nearly all of them. A consistent rubric therefore has two stable points: prepositions in *all* names, or in *none*. "Some" is incoherent. We take *none*.

**Why:** Reaching for the preposition is a **bias toward the mean** — the average Ruby idiom — not a justifiable decision. The literal action is the whole meaning of the name. The preposition is ceremony.

**Scope — method names only.** This governs **method/initializer names**, not prose or terminology. Prose deliberately *does* use prepositional phrasing where it carries meaning. Inputs are described as **"sent to"** a method, per the "sent to" entry in the Word Substitutions rule, in `language`.

That is a description of a relationship, not an identifier. The preposition is load-bearing there and absent here. (The relation verb is the bare **"mediates"** — see the no-slang rule in `language` — so it is not an example of load-bearing prepositional prose.)

**How to apply:** When naming a method, name the action and stop. You may feel the pull to append `_from`, `_to`, `_in`, `_with`, `_into`, or `_for`. That is the mean-bias tell. The argument the preposition would point at is already the parameter.

Related:

- the name-literally-not-by-analogy rule
- the general `solubility` term — the two in `language`

---

Authored by Scott Bellware on Sat Jun 27 2026 at 11 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
