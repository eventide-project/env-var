# A test block holds only the assertion; every assertion operand is an explaining variable declared in the enclosing context

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

**Why:** The test block should read as a pure statement of the asserted truth — a single relation among named values — not a computation mixed with a check. Naming every operand (in the context, where the arranging happens) documents what each value is, gives each an inspection point, and cleanly separates *arrange* (the context) from *assert* (the test block). An assertion with an inlined `Upload::Result.build(...)` buries a value inside the predicate and forces the reader to parse it inside-out. This is the assertion-specific form of the no-inline-method-call-arguments rule, and it sharpens the DBE first-turn rule's "assert an explaining variable" to *both* operands.

**How to apply:** In the enclosing `context`, declare the controls, bind the actuation to an explaining variable, and bind any compared-against/expected value to its own explaining variable. The `test` block contains exactly one `assert`, comparing those variables — no value-producing method call inside it. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays. Related: the DBE first-turn rule, the no-inline-method-call-arguments rule, the test-structure rule, and the `control_` test-variable prefix rule.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 8 AM PT
