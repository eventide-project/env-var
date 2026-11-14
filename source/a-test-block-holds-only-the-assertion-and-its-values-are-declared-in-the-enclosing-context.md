# A test block holds only the assertion, and its values are declared in the enclosing context

**Trigger:** When creating or editing a file under `test/`

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

**The three parts govern a `test` block, and a precondition is not one.** A precondition is the one stated exception to them. The precondition rule states what a precondition is, and why the reasons here do not reach it.

**How to apply:** In the enclosing `context`, declare the controls. Bind the actuation to an explaining variable, and bind any compared-against or expected value to its own explaining variable. The `test` block contains exactly one `assert`, comparing those variables — no value-producing method call inside it. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays. A precondition is outside all of this and reads inline.

## Compressed

1. Never inline a method call in an assertion.
2. Assign every value the assertion examines to an explaining variable first. This includes the actuation result and whatever it is compared against.
3. The assertion references only those explaining variables and the comparison itself.
4. A `test` block contains only the assertion: exactly one `assert`.
5. A `test` block contains no controls setup, no actuation, no variable assignment, and no value-producing method calls.
6. Declare explaining variables in the enclosing `context` block.
7. When a test introduces explaining variables, encase its `test` block in a `context` block that declares them.
8. In the enclosing `context`, declare the controls.
9. In the enclosing `context`, bind the actuation to an explaining variable.
10. In the enclosing `context`, bind any compared-against or expected value to its own explaining variable.
11. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion.

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

## Compression

- 2026-10-24, compressed: compression 0.24, change 0.64, solubility 53 → 80, clarity 0.52 → 0.88, 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-27, re-checked: 17 directives, 16 kept, 0 less precise, 1 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 80 → 82, clarity 0.88 → 0.89; checked: 10 directives, 10 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named test-block-is-assertion-only and titled "A test block holds only the assertion. Every assertion operand is an explaining variable declared in the enclosing context".

Until Mon Oct 26 2026 this rule was named a-test-block-holds-only-the-assertion and titled "A test block holds only the assertion".

Until Mon Oct 26 2026 this rule restated what a precondition is and why it is exempt. The precondition rule states both, and this rule now cites it.

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
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:11 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:42 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
