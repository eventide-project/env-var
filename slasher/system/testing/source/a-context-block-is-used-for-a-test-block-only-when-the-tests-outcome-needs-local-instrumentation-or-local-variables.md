# A context block is used for a test block only when the test's outcome needs local instrumentation or local variables

**Trigger:** When creating or editing a file under `test/`

A `test` block holds **exactly one assertion** and nothing else (per the a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context rule). Naming an outcome does **not** require a `context` block: TestBench lets a test carry its own name — `test "Outcome name" do … end`.

Use a named **`context`** to enclose a `test` when that outcome needs local instrumentation. That is an **explaining variable of its own**, or a **`comment`** or **`detail`** specific to it. Use one **or** where the context is a **leading `When …` condition**. That is a condition promoted to a context, per the an-error-test-is-named-fails-and-its-condition-is-a-context rule. The context exists to hold that local setup alongside the bare test, or to name the condition.

**The `When` exception is narrow — a *leading* `When …` only.** A context named `"When the file is empty"` stays a context (with `test "Fails"` inside), even though it holds nothing but the test. But an **outcome name that merely contains "when"** — e.g. `"Created when the file is accepted"`, `"Located when the response carries a location"` — is *not* a condition context. It is an outcome name, and it is written as a directly-named `test "Created when the file is accepted" do …`.

The outcome may be a **single assertion over values already in scope**, meaning the shared controls and actuation at the top of the feature context. There, **name the `test` directly and use no context**. A context that only holds a bare test adds a nesting level that carries no information. The name belongs on the test itself.

**This is how the tests the agent writes are shaped. It is not a ban on a context that holds only a test.** It is a preference, and another engineer may hold a different one. So where the agent finds such a context, in a test it reads or is asked to change, it does not flatten it on its own. It warns the engineer instead:

- **The warning names the file and the context**, and says that the context holds only a test, whose name could sit on the test.
- **It offers two choices:** flatten the context, or suppress these warnings from then on. Several such contexts found in one turn take one warning.
- **A suppression is a local rule.** On the engineer's choice, the agent writes `local/rules/<timestamp>-a-lone-test-context-is-not-warned-about.md`, saying that this project gives no warning of a context that holds only a test. Local rules are read at every session start, so the suppression holds from then on. Deleting the file restores the warnings.
- **Where that local rule exists, give no warning.** The tests the agent writes still take the shape this rule describes.
- **A leading `When …` condition context is never warned of**, since it is not a context that holds only a test in this rule's sense.

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

**Why:** a context should *mean something*, namely "there is local instrumentation here." A bare `test` inside a `context "name"` wastes the context, where its only content is the assertion. The name could sit on the `test`. Reserving contexts for outcomes that actually use a local variable or add local narration keeps the structure honest and flatter. That is a preference about structure, not a defect in the test, so the context another engineer wrote is theirs to keep, and the warning leaves the choice with them.

**How to apply:** when writing a test, name the `test` directly. Use a `context` only where the outcome:

- uses its own explaining variable
- adds an outcome-local `comment` or `detail`
- is a leading `When …` condition

On finding a context that holds only a test, warn as above, unless the local rule suppresses it. Flatten only on the engineer's choice. When flattening an over-nested test, flatten **only** where there is no code between the context and the `test`. The context then holds nothing but the test. The context must **also** not be a leading `When …` condition.

## Compressed

1. Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`.
2. Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly.
3. Local instrumentation means an explaining variable of the outcome's own.
4. Local instrumentation also means a `comment` or `detail` specific to that outcome.
5. Also use a named `context` where it is a leading `When …` condition, promoted to a context per the an-error-test-is-named-fails-and-its-condition-is-a-context rule.
6. The `When` exception covers only a leading `When …`.
7. A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test.
8. An outcome name that merely contains "when" is not a condition context. Examples are `"Created when the file is accepted"` and `"Located when the response carries a location"`.
9. Such a name is written as a directly named test, as in `test "Created when the file is accepted" do …`.
10. When the outcome is a single assertion over values already in scope, name the `test` directly and use no context.
11. Values already in scope are the shared controls and actuation.

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

12. When flattening an over-nested test, flatten only where there is no code between the context and the `test`, so the context holds nothing but the test.
13. Do not flatten a context that is a leading `When …` condition.
14. This is how the tests the agent writes are shaped. It is not a ban on a context that holds only a test.
15. Where the agent finds such a context, in a test it reads or is asked to change, it does not flatten it on its own. It warns the engineer instead.
16. The warning names the file and the context. It says that the context holds only a test, whose name could sit on the test.
17. The warning offers two choices: flatten the context, or suppress these warnings from then on.
18. Several such contexts found in one turn take one warning.
19. Flatten only on the engineer's choice.
20. On the choice to suppress, write `local/rules/<timestamp>-a-lone-test-context-is-not-warned-about.md`. It says that this project gives no warning of a context that holds only a test.
21. Local rules are read at every session start, so the suppression holds from then on. Deleting the file restores the warnings.
22. Where that local rule exists, give no warning. The tests the agent writes still take this rule's shape.
23. A leading `When …` condition context is never warned of.

## Compression

- 2026-10-24, compressed: compression 0.19, change 0.52, solubility 57 → 72, clarity 0.53 → 0.70, 12 directives, 12 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-24, revised: the rule warns of a context that holds only a test, rather than banning it; checked: 19 directives, 19 kept, 0 less precise, 0 lost
- 2026-10-27, re-checked: 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 72 → 63, clarity 0.70 → 0.81; checked: 22 directives, 22 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until 2026-10-24 the rule was a ban: a context that held only a test was not to be written, and an over-nested test was flattened. The engineer decided that naming the test directly is a preference, not to be imposed on other engineers, so such a context now draws a warning that can be suppressed.

Until Sun Oct 25 2026 this rule was named context-only-for-local-instrumentation and titled "Enclose a test in a context only when the outcome needs local instrumentation. Otherwise name the test directly, and warn of a context that holds only a test".

Until Mon Oct 26 2026 this rule was named a-test-takes-a-context-only-when-its-outcome-needs-local-instrumentation and titled "A test takes a context only when its outcome needs local instrumentation".

Related:

- the a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context rule
- the test-structure rule — the per-outcome context is for outcomes that instrument locally
- the start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion rule

---

Authored by Scott Bellware on Tue Jun 30 2026 at 12 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:54:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:49:18 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:15 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:56:34 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:40 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:11 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:11:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:42 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
