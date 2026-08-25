# Enclose a test in a context only when the outcome needs local instrumentation. Otherwise name the test directly

A `test` block holds **exactly one assertion** and nothing else (per the test-block-is-assertion-only rule). Naming an outcome does **not** require a `context` block: TestBench lets a test carry its own name — `test "Outcome name" do … end`.

Use a named **`context`** to enclose a `test` when that outcome needs local instrumentation. That is an **explaining variable of its own**, or a **`comment`** or **`detail`** specific to it. Use one **or** where the context is a **leading `When …` condition**. That is a condition promoted to a context, per the assert-raises rule. The context exists to hold that local setup alongside the bare test, or to name the condition.

**The `When` exception is narrow — a *leading* `When …` only.** A context named `"When the file is empty"` stays a context (with `test "Fails"` inside), even though it holds nothing but the test. But an **outcome name that merely contains "when"** — e.g. `"Created when the file is accepted"`, `"Located when the response carries a location"` — is *not* a condition context. It is an outcome name, and it flattens to a directly-named `test "Created when the file is accepted" do …`.

The outcome may be a **single assertion over values already in scope**, meaning the shared controls and actuation at the top of the feature context. There, **name the `test` directly and use no context**. A context that only holds a bare test adds a nesting level that carries no information. The name belongs on the test itself.

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

**Why:** a context should *mean something*, namely "there is local instrumentation here." A bare `test` inside a `context "name"` wastes the context, where its only content is the assertion. The name could sit on the `test`. Reserving contexts for outcomes that actually use a local variable or add local narration keeps the structure honest and flatter.

**How to apply:** name the `test` directly. Use a `context` only where the outcome:

- uses its own explaining variable
- adds an outcome-local `comment` or `detail`
- is a leading `When …` condition

When flattening an over-nested test, flatten **only** where there is no code between the context and the `test`. The context then holds nothing but the test. The context must **also** not be a leading `When …` condition.

Related:

- the test-block-is-assertion-only rule
- the test-structure rule — the per-outcome context is for outcomes that instrument locally
- the test-name-is-prefix rule

---

Authored by Scott Bellware on Tue Jun 30 2026 at 12 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:54:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
