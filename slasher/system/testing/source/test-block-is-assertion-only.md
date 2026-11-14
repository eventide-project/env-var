# A test block holds only the assertion. Every assertion operand is an explaining variable declared in the enclosing context

Three bound parts:

1. **Never inline a method call in an assertion.** Every value the assertion examines — the actuation result *and* whatever it is compared against — is assigned to an explaining variable first. The assertion then references only those variables (and the comparison itself).
2. **The only thing in a `test` block is the assertion.** No controls setup, no actuation, no variable assignment, no method calls that produce values — just the one `assert`.
3. **Explaining variables are declared in the enclosing `context` block.** If a test introduces explaining variables (it does), encase the `test` block in a `context` block where those variables are declared.

```ruby
# No — method call inlined in the assertion
test do
  assert(result == Upload::Result.build(control_response))
end

# Yes — operands are explaining variables declared in the context; test asserts only
context "..." do
  control_response = Controls::HTTP::Response.example
  control_file = Controls::File.example

  upload = Controls::Upload.example
  result = upload.(control_file)
  expected_result = Upload::Result.build(control_response)

  test do
    assert(result == expected_result)
  end
end
```

**Why:** The test block should read as a pure statement of the asserted truth, a single relation among named values. It should not read as a computation mixed with a check. Every operand is named in the context, where the controls are established. That documents what each value is, and gives each an inspection point. It cleanly separates *control*, the context, from *observe*, the test block.

An assertion with an inlined `Upload::Result.build(...)` buries a value inside the predicate and forces the reader to parse it inside-out. This is the assertion-specific form of the no-inline-method-call-arguments rule, and it sharpens the DBE first-turn rule's "assert an explaining variable" to *the two* operands.

**The three parts govern a `test` block, and a precondition is not one.** A **precondition**. A bare `assert` or `refute` that is not a test, documenting a factor that decides the test's outcome where the script does not express it. It reads its predicate **inline**, with no explaining variable, and is the one stated exception to the parts above.

The reasons here do not reach it. It has a single operand, so nothing is buried inside a nested expression to be parsed inside-out. A name bound for it would only restate the predicate. See the precondition rule.

**How to apply:** In the enclosing `context`, declare the controls. Bind the actuation to an explaining variable, and bind any compared-against or expected value to its own explaining variable. The `test` block contains exactly one `assert`, comparing those variables — no value-producing method call inside it. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays. A precondition is outside all of this and reads inline.

Related:

- the DBE first-turn rule
- the no-inline-method-call-arguments rule
- the test-structure rule
- the `control_` test-variable prefix rule
- the precondition rule — the stated exception

---

Authored by Scott Bellware on Sun Jun 28 2026 at 8 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 4:14:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
