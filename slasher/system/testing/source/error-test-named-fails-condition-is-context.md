# An error test is named "Fails" (or "Doesn't fail"). Its condition is promoted to a context

When a test's assertion is that the actuation raises an error (an `assert_raises`), the `test` block's name is **"Fails"** — the actuation fails. The complementary assertion, that the actuation does **not** raise, is named **"Doesn't fail"**. The **condition** under which the actuation fails (or doesn't) is **not** part of the test name. It is promoted to a **`context`** that encloses the test and names that condition.

**The tell:** a `test` name may want the word **"when"**. That "when" clause is a *condition*. Lift it into a `context`, and name the `test` "Fails", or "Doesn't fail".

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

**Why:** an error outcome establishes "*under condition X*, the actuation **fails**." Those are two different things — the **scenario** (a context) and the **fact observed** (the test). "Fails" and "Doesn't fail" name the actuation's behavior directly, and keep the test name uniform. They let several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`.

Naming an error test for its behavior rather than a value comparison is fully consistent with the "Is"-naming rule. That rule reserves "Is" for value-equals. "Fails" is a plain outcome name, not an "Is" case.

**Relation to the context rule:** the context-only-for-local-instrumentation rule says don't enclose a single-assertion test in a context that holds nothing. An error test is the deliberate exception: the enclosing context isn't empty. It carries the **condition**, which is real information. It is the only place the condition can live, since the test name is fixed as "Fails" or "Doesn't fail".

**How to apply:** name any `assert_raises` test "Fails". Name the non-raising assertion "Doesn't fail". Put it inside a `context` named for the condition, the "when …".

Related:

- the test-name-is-prefix rule
- the context-only-for-local-instrumentation rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 7 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
