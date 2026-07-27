# Never favor prepositions in method names

Do not put a preposition in a method name (`import_from`, `define_in`, `set_to`, `copy_into`). A preposition in a method name points at the **argument** — but arguments are **inherent to methods**, so nothing in the name needs to announce them. The parameter already says "what follows is an argument"; a preposition-word adds no information the call site doesn't already carry. Name the method for the action alone (`import`, `define`, `set`, `copy`).

**The rubric argument (why "some" is not allowed):** a preposition refers to the argument, and a method's arguments are intrinsic to it. So any rationale that licenses a preposition in *one* method name licenses it in *every* method name that takes an argument — i.e. nearly all of them. A consistent rubric therefore has two stable points: prepositions in *all* names, or in *none*. "Some" is incoherent. We take *none*.

**Why:** Reaching for the preposition is a **bias toward the mean** — the average Ruby idiom — not a choice that earns its keep. The literal action is the whole meaning of the name; the preposition is ceremony.

**Scope — method names only.** This governs **method/initializer names**, not prose or terminology. Prose deliberately *does* use prepositional phrasing where it carries meaning — e.g. inputs are described as **"sent to"** a method (the "sent to" entry in the Word Substitutions rule, in `language`). That is a description of a relationship, not an identifier; the preposition is load-bearing there and absent here. (The relation verb is the bare **"mediates"** — see the no-slang rule in `language` — so it is not an example of load-bearing prepositional prose.)

**How to apply:** When naming a method, name the action and stop. If you feel the pull to append `_from`/`_to`/`_in`/`_with`/`_into`/`_for`, that is the mean-bias tell — the argument the preposition would point at is already the parameter. Related: the name-literally-not-by-analogy rule and the general `solubility` term (both in `language`).

---

Authored by Scott Bellware on Sat Jun 27 2026 at 11 PM PT
