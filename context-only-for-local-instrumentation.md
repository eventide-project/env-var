# Enclose a test in a context only when the outcome needs local instrumentation; otherwise name the test directly

A `test` block holds **exactly one assertion** and nothing else (per the
test-block-is-assertion-only rule). Naming an outcome does **not** require a
`context` block: TestBench lets a test carry its own name — `test "Outcome name" do … end`.

Use a named **`context`** to enclose a `test` when that outcome needs local
instrumentation — an **explaining variable derived for it**, or a
**`comment`/`detail`** specific to it — **or** when the context is a **leading
`When …` condition** (a condition promoted to a context, per the assert-raises
rule). The context exists to hold that local setup alongside the bare test, or to
name the condition.

**The `When` exception is narrow — a *leading* `When …` only.** A context named
`"When the file is empty"` stays a context (with `test "Fails"`
inside), even though it holds nothing but the test. But an **outcome name that
merely contains "when"** — e.g. `"Created when the file is accepted"`,
`"Located when the response carries a location"` — is *not* a condition context; it
is an outcome name, and it flattens to a directly-named `test "Created when
the file is accepted" do …`.

When the outcome is a **single assertion over values already in scope** (the
shared arrangement and actuation at the top of the feature context), **name the
`test` directly and use no context** — a context that only holds a bare test adds
a nesting level that carries no information; the name belongs on the test itself.

```ruby
# No local setup needed → named test, no context
test "Is the location the response carries" do
  assert(location == control_location)
end

# Local explaining variable / detail needed → context holds it
context "Status" do
  status = result.status
  detail status.inspect
  test do
    assert(status == 201)
  end
end
```

**Why:** a context should *mean something* — "there is local instrumentation
here." A bare `test` inside a `context "name"` whose only content is the
assertion wastes the context: the name could sit on the `test`. Reserving
contexts for outcomes that actually derive a local variable or add local
narration keeps the structure honest and flatter.

**How to apply:** name the `test` directly unless the outcome derives its own
explaining variable, adds an outcome-local `comment`/`detail`, or is a leading
`When …` condition; only then enclose it in a `context`. When flattening an
over-nested test, flatten **only** when there is no code between the context and
the `test` (the context holds nothing but the test) **and** the context is not a
leading `When …` condition. Related: the
test-block-is-assertion-only rule, the test-structure rule
(the per-outcome context is for outcomes that *derive* locally), and the
test-name-is-prefix rule.

---

Authored by Scott Bellware on Tue Jun 30 2026 at 12 PM PT
