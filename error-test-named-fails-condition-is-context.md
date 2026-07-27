# An error test is named "Fails" (or "Doesn't fail"); its condition is promoted to a context

When a test's assertion is that the actuation raises an error (an `assert_raises`), the `test` block's name is **"Fails"** — the actuation fails. The complementary assertion, that the actuation does **not** raise, is named **"Doesn't fail"**. The **condition** under which the actuation fails (or doesn't) is **not** part of the test name; it is promoted to a **`context`** that encloses the test and names that condition.

**The tell:** if a `test` name wants the word **"when"**, that "when" clause is a *condition* — lift it into a `context`, and name the `test` "Fails" (or "Doesn't fail").

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

**Why:** an error outcome establishes "*under condition X*, the actuation **fails**." Those are two different things — the **scenario** (a context) and the **fact observed** (the test). "Fails" / "Doesn't fail" name the actuation's behavior directly, keep the test name uniform, and let several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`. Naming an error test for its behavior (it fails) rather than a value comparison is fully consistent with the "Is"-naming rule (which reserves "Is" for value-equals) — "Fails" is a plain outcome name, not an "Is" case.

**Relation to the context rule:** the context-only-for-local-instrumentation rule says don't enclose a single-assertion test in a context that holds nothing. An error test is the deliberate exception: the enclosing context isn't empty — it carries the **condition**, which is real information (and is the only place the condition can live, since the test name is fixed as "Fails" / "Doesn't fail").

**How to apply:** any `assert_raises` test → name it "Fails" (or "Doesn't fail" for the non-raising assertion), inside a `context` named for the condition (the "when …"). Related: the test-name-is-prefix rule and the context-only-for-local-instrumentation rule.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 7 PM PT
