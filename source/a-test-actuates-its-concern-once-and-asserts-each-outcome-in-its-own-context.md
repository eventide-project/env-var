# A test actuates its concern once, and asserts each outcome in its own context

**Trigger:** When creating or editing a file under `test/`

A test file is built in layers. There is a feature context, a shared control-and-actuation block at its top, and a series of inner contexts that each establish one outcome.

**Outer `context` names the feature.** Everything for the feature lives inside it.

**Set up the controls and actuate once, at the top of the outer context.** State the inputs just above the actuation — built through controls (`Controls::File.example()`) or stated as literals. Then actuate the unit under test a **single time** and bind its result to an explaining variable. The actuation is written from the efferent side — as use would express it. The variables read as the scenario.

```ruby
file = Controls::File.example()
upload = Controls::Upload.example()

result = upload.(file)
```

**Narrate the scenario with `comment`.** Right after the actuation, narrate the salient values — the inputs and the actuation result — for the reader of test output.

**One inner `context` per outcome.** Each inner context establishes one distinct outcome *of that single actuation*. Its title states the outcome. It derives an explaining variable, optionally narrates that variable locally with `detail`, then asserts it in a single `test` block.

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

- **Actuate once, assert many.** The concern is actuated a single time at the top. Each inner context asserts a separate facet of that one result.
- **Explaining variables carry the assertion.** The derivation producing the asserted value is named and bound on its own line. The `test` block asserts the variable, never an inline expression.
- **Narration is layered.** `comment` narrates scenario-wide values near the actuation. `detail` narrates a value local to one inner context.
- **One assertion per `test` block, one outcome per `context`.** Each inner context's title states the outcome it establishes, and its single assertion confirms it.

**Why:** Actuating once and asserting each facet separately keeps the efferent view of the unit in one place. It lets each outcome be read, named, and diagnosed on its own. Explaining variables and layered narration keep the test reading as a statement of the concern rather than a mechanical check. This is the structure the DBE first-turn rule grows into in subsequent turns.

**How to apply:** State the inputs and actuate the unit under test once, at the top of the outer feature context. Bind the result to an explaining variable. Narrate it with `comment`. For each outcome, add an inner `context` titled for that outcome. Derive an explaining variable, and assert it in a single `test` block. Never assert an inline expression.

## Compressed

1. A test file has three layers: a feature context, a shared control-and-actuation block at its top, and inner contexts that each establish one outcome.
2. The outer `context` names the feature.
3. Everything for the feature lives inside the outer context.
4. Set up the controls and actuate once, at the top of the outer context.
5. State the inputs just above the actuation, built through controls (`Controls::File.example()`) or stated as literals.
6. Actuate the unit under test a single time.
7. Bind the actuation's result to an explaining variable.
8. Write the actuation from the efferent side, as use would express it.
9. The variables read as the scenario.

```ruby
file = Controls::File.example()
upload = Controls::Upload.example()

result = upload.(file)
```

10. Right after the actuation, narrate the salient values with `comment` for the reader of test output.
11. The narrated values are the inputs and the actuation result.
12. Write one inner `context` per outcome.
13. Each inner context establishes one distinct outcome of that single actuation.
14. Each inner context's title states the outcome it establishes.
15. Each inner context derives an explaining variable from the result.
16. An inner context may narrate its variable locally with `detail`.
17. Each inner context asserts its variable in a single `test` block.

```ruby
context "Status" do
  status = result.status
  detail status.inspect
  test do
    assert(status == 201)
  end
end
```

18. `comment` narrates scenario-wide values near the actuation.
19. `detail` narrates a value local to one inner context.
20. Each `test` block's assertion confirms the outcome its inner context's title states.

## Compression

- 2026-10-24, compressed: compression 0.26, change 0.50, solubility 65 → 82, clarity 0.70 → 0.89, 20 directives, 20 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 82 → 84, clarity 0.89 → 0.91; checked: 15 directives, 15 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named tdd-test-structure and titled "Test structure: actuate the concern once at the top, assert each outcome in its own nested context".

Related:

- the DBE-as-design-tool rule
- the DBE first-turn rule
- the test-values-are-controls-never-factories-fixtures-or-arrange rule
- the `control_` test-variable prefix rule

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:52:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:26:52 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
