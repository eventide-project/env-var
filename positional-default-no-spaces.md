# A positional-argument default is written tight — no spaces around `=`

A default for a **positional** parameter is written with no whitespace around the `=`: `def build(name, namespace=Object)`, never `def build(name, namespace = Object)`. The `=` binds the parameter to its default as a single unit.

This is distinct from two things that *do* carry spaces:

- a **keyword** default keeps its colon-space — `inherit: false`;
- an ordinary **assignment** statement keeps its spaces — `namespace = constant.namespace`.

**Why:** The default is part of the parameter declaration, not a statement. Spacing it like an assignment (`namespace = Object`) misreads it as one; the tight `=` keeps the parameter and its default visually a single token, the way a keyword's `key:` stays attached to its value. The library code already follows this — `def self.build(name_or_module, namespace_name_or_module=nil, inherit: nil)`; this rule codifies it and extends it to signatures quoted in prose (design docs, the plan).

**How to apply:** When defaulting a positional parameter — in code, or in a method signature quoted in documentation — write `param=default` with no surrounding spaces. Keyword defaults keep `key: default`. Plain assignments and equality keep their spaces. Related: the no-prepositions-in-method-names rule (method-signature conventions).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 4 PM PT
