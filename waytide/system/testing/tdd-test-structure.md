# Test structure: actuate the concern once at the top, assert each outcome in its own nested context

A test file is built in layers: a feature context, a shared arrangement-and-actuation block at its top, and a series of inner contexts that each establish one outcome.

**Outer `context` names the feature.** Everything for the feature lives inside it.

**Arrange and actuate once, at the top of the outer context.** Arrange inputs just above the actuation — built through controls (`Controls::File.example()`) or stated as literals. Then actuate the unit under test a **single time** and bind its result to an explaining variable. The actuation is written from the efferent side — as use would express it; the variables read as the scenario.

```ruby
file = Controls::File.example()
upload = Controls::Upload.example()

result = upload.(file)
```

**Narrate the scenario with `comment`.** Right after the actuation, narrate the salient values — the inputs and the actuation result — for the reader of test output.

**One inner `context` per outcome.** Each inner context establishes one distinct outcome *of that single actuation*: its title states the outcome, it derives an explaining variable, optionally narrates that variable locally with `detail`, then asserts it in a single `test` block.

```ruby
context "Status" do
  status = result.status
  detail status.inspect
  test do
    assert(status == 201)
  end
end
```

The pattern, abstracted:

- **Actuate once, assert many.** The concern is actuated a single time at the top; each inner context asserts a separate facet of that one result.
- **Explaining variables carry the assertion.** The derivation producing the asserted value is named and bound on its own line; the `test` block asserts the variable, never an inline expression.
- **Narration is layered.** `comment` narrates scenario-wide values near the actuation; `detail` narrates a value local to one inner context.
- **One assertion per `test` block, one outcome per `context`.** Each inner context's title states the outcome it establishes, and its single assertion confirms it.

**Why:** Actuating once and asserting each facet separately keeps the efferent view of the unit in one place and lets each outcome be read, named, and diagnosed on its own. Explaining variables and layered narration keep the test reading as a statement of the concern rather than a mechanical check. This is the structure the DBE first-turn rule grows into across subsequent turns.

**How to apply:** Arrange inputs and actuate the unit under test once at the top of the outer feature context, binding the result to an explaining variable; narrate it with `comment`. For each outcome, add an inner `context` titled for that outcome, derive an explaining variable, and assert it in a single `test` block — never assert an inline expression. Related: the DBE-as-design-tool rule, the DBE first-turn rule, the controls-not-factories rule, and the `control_` test-variable prefix rule.

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
