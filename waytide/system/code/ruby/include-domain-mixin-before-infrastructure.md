# Include the primary domain mixin before infrastructure mixins

When a class includes a **domain mixin** and an **infrastructure mixin**, list the
domain mixin **first**. A domain mixin is the type's defining abstraction, and an
infrastructure mixin is a mechanical capability, such as `Dependency`. The domain mixin has more primacy to what the
class *is*. The infrastructure mixin is a supporting mechanism. Reading order
should reflect that priority.

(Ruby requires only that `include Dependency` precede the `dependency` macro
call. The relative order of the two includes is otherwise free, so it is chosen
for primacy/readability, not mechanics.)

**Why:** The order in which includes are listed reads as a statement of what
matters most to the type. Leading with the domain mixin says "this is a domain
type, mechanically wired by its infrastructure." It does not say "this is an infrastructure
thing that also happens to be a domain type." Primacy first.

**How to apply:** In a class that mixes in the two, write the domain mixin's
`include` before any infrastructure mixin's. Put the `dependency` (or other
macro) call after the infrastructure `include` it depends on. Related: the
`build`-normalizes / `new`-is-strict rule.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 1 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 3:04:33 AM PT
