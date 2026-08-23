# Don't inline method calls as arguments — bind the result to a variable first

Do not pass the result of a method call directly as an argument to another call. Bind it to an explaining local variable, then pass the variable.

```ruby
# No
Upload::Result.build(http_client.post(file))

# Yes
response = http_client.post(file)
Upload::Result.build(response)
```

**Why:** The intermediate value is a meaningful domain object. Naming it documents what it is at the call site and gives a single place to inspect it (debugging, logging, a breakpoint). Inlining hides the value behind a nested expression and forces the reader to parse the call inside-out. A named local reads top-to-bottom and states the intent.

**How to apply:** An argument may otherwise be a method-call result. Assign it to a local named for the value, such as `response` or `result`. Then pass that local.

This is the same impulse as the test convention. That convention binds the actuation result to an explaining variable before asserting on it. (Plain variables, constants, and literals as arguments are fine — the rule is about *method-call results*.) Related: the show-the-test/explaining-variable conventions.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 12 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
