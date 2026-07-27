# An applicative error extends `RuntimeError` directly

An **applicative error** — an error class the library defines for its own failures, as
distinct from one the platform raises — extends **`RuntimeError`**, and extends it
**directly**.

```ruby
# Yes
class Upload
  class Error < RuntimeError
  end
end

# No
class Upload
  class Error < StandardError
  end
end
```

**Not `StandardError`.** `StandardError` is the abstract root of the rescuable family, and
its direct subclasses are the platform's own categories — `ArgumentError`, `TypeError`,
`IOError`, `RuntimeError` itself. Extending it directly places a library's error among
those categories, claiming a kind of failure the language defines. A library's failure is
not a new category of that sort; it is the ordinary case of a running program declining to
proceed, which is what `RuntimeError` already names. `raise "message"` with no class
produces a `RuntimeError` for exactly that reason.

**Directly.** No intermediate base class between the applicative error and `RuntimeError`
— not a per-library `Base`, not a shared system error. Each applicative error class
states its own parentage where it is defined, so the class definition is the whole answer
to what it is.

An error family within a library is a separate matter and is unaffected: where a library's
errors genuinely form a family, the **family's own root** extends `RuntimeError` directly
and its members extend that root. What the rule forbids is an intermediate class inserted
for organization rather than for meaning.

**Why:** the parent of an error class is a claim about what kind of failure it is, and
`StandardError` overclaims. Its direct subclasses are the language's failure taxonomy;
joining that list says a library's error belongs beside `TypeError` as a category of its
own, which it does not. `RuntimeError` says the smaller, truer thing — the program ran and
would not continue. Taking it directly also keeps every applicative error one lookup from
its meaning: nothing sits between the class and the claim, so a reader is never sent up a
chain of intermediate classes that exist only to group.

**How to apply:** define an applicative error as `class Error < RuntimeError`. Do not
extend `StandardError`, and do not insert a base class between the error and
`RuntimeError` for organization. Where a library's errors form a real family, root the
family in one class that extends `RuntimeError` directly. Related: the `testing` package's
assert-error-message-only-as-sole-discriminator rule (which turns on error classes being
self-evidently the right failure) and the lib-report-format rule (whose **error taxonomy**
section reports the applicative error classes and which operations raise which).

---

Authored by Scott Bellware on Mon Jul 27 2026 at 1:26:45 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
