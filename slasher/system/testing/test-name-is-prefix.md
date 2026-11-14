# Start a test name with "Is" only for a value-equals-comparator assertion

A test or context name should begin with "Is" only when the test asserts that a value **is** some other comparator. That is an equality or identity comparison of a value against another value. Do not start the name with "Is" for any other kind of assertion. That is a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect. Name it for what it establishes.

Good examples — tests each asserting `value == <comparator>`:

- `context "Is the final segment of the qualified name as a String"` → `assert(name == control_inner_constant_name.to_s)`
- `context "Is the whole name as a String"` → `assert(name == control_value.name)`

Counter-examples, where "Is" is not used:

- a predicate result — `context "Defined"` → `assert(defined)`
- a returned value — `context "The defined constant is returned"`
- a raised error — named `Fails`, per the error-test-naming rule
- an exclusion — `context "Excludes non-module inner constants"`

**Why:** "Is X" reads as a claim of equality/identity. Using it for a non-equality assertion misdescribes what the test establishes — the name promises a comparison the assertion doesn't make. Reserving "Is" for value-equals-comparator tests keeps each test name faithful to the shape of its assertion.

**How to apply:** Before naming a context "Is …", look at its assertion. If it is `assert(a == b)` (or identity), "Is …" fits. Otherwise name the context for the outcome it establishes (the predicate, the presence, the exclusion, the behavior. A raised error is named "Fails" — see the error-test-naming rule).

Related:

- the test-structure rule and the `control_` test-variable prefix rule — in this package
- the "sent to" entry in the `language` vocabulary
