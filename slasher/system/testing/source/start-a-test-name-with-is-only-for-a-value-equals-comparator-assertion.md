# Start a test name with "Is" only for a value-equals-comparator assertion

**Trigger:** When creating or editing a file under `test/`

A test or context name should begin with "Is" only when the test asserts that a value **is** some other comparator. That is an equality or identity comparison of a value against another value. Do not start the name with "Is" for any other kind of assertion. That is a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect. Name it for what it establishes.

Good examples — tests each asserting `value == <comparator>`:

- `context "Is the final segment of the qualified name as a String"` → `assert(name == control_inner_constant_name.to_s)`
- `context "Is the whole name as a String"` → `assert(name == control_value.name)`

Counter-examples, where "Is" is not used:

- a predicate result — `context "Defined"` → `assert(defined)`
- a returned value — `context "The defined constant is returned"`
- a raised error — named `Fails`, per the an-error-test-is-named-fails-and-its-condition-is-a-context rule
- an exclusion — `context "Excludes non-module inner constants"`

**Why:** "Is X" reads as a claim of equality/identity. Using it for a non-equality assertion misdescribes what the test establishes — the name promises a comparison the assertion doesn't make. Reserving "Is" for value-equals-comparator tests keeps each test name faithful to the shape of its assertion.

**How to apply:** Before naming a context "Is …", look at its assertion. If it is `assert(a == b)` (or identity), "Is …" fits. Otherwise name the context for the outcome it establishes (the predicate, the presence, the exclusion, the behavior. A raised error is named "Fails" — see the an-error-test-is-named-fails-and-its-condition-is-a-context rule).

## Compressed

1. Begin a test or context name with "Is" only when the test asserts that a value is some other comparator.
2. Such an assertion is an equality or identity comparison of a value against another value.
3. Do not begin the name with "Is" for any other kind of assertion.
4. Other kinds include a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect.
5. Name such a test for what it establishes.
6. Good examples, each asserting `value == <comparator>`:
   - `context "Is the final segment of the qualified name as a String"` → `assert(name == control_inner_constant_name.to_s)`
   - `context "Is the whole name as a String"` → `assert(name == control_value.name)`
7. Counter-examples, where "Is" is not used:
   - a predicate result — `context "Defined"` → `assert(defined)`
   - a returned value — `context "The defined constant is returned"`
   - a raised error — named `Fails`, per the an-error-test-is-named-fails-and-its-condition-is-a-context rule
   - an exclusion — `context "Excludes non-module inner constants"`
8. Before naming a context "Is …", look at its assertion.
9. If the assertion is `assert(a == b)`, or an identity comparison, "Is …" fits.
10. Otherwise, name the context for the outcome it establishes: the predicate, the presence, the exclusion, or the behavior.
11. Name a context for a raised error "Fails", per the an-error-test-is-named-fails-and-its-condition-is-a-context rule.

## Compression

- 2026-10-24, compressed: compression 0.05, change 0.29, solubility 63 → 67, clarity 0.40 → 0.46, 6 directives, 6 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 67 → 65, clarity 0.46 → 0.44; checked: 5 directives, 4 kept, 1 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named test-name-is-prefix.

Related:

- the test-structure rule and the `control_` test-variable prefix rule — in this package
- the "sent to" entry in the `language` vocabulary

---

Authored by Scott Bellware on Fri Jun 26 2026 at 2 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:46:47 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:22 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
