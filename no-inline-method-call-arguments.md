# Don't inline method calls as arguments — bind the result to a variable first

Do not pass the result of a method call directly as an argument to another call. Bind it to an explaining local variable, then pass the variable.

```ruby
# No
Upload::Result.build(http_client.post(file))

# Yes
response = http_client.post(file)
Upload::Result.build(response)
```

**Why:** The intermediate value is a meaningful domain object; naming it documents what it is at the call site and gives a single place to inspect it (debugging, logging, a breakpoint). Inlining hides the value behind a nested expression and forces the reader to parse the call inside-out. A named local reads top-to-bottom and states the intent.

**How to apply:** When an argument would otherwise be a method-call result, assign it to a local named for the value (e.g. `response`, `result`), then pass that local. This is the same impulse as the test convention of binding the actuation result to an explaining variable before asserting on it. (Plain variables, constants, and literals as arguments are fine — the rule is about *method-call results*.) Related: the show-the-test/explaining-variable conventions.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 12 AM PT
