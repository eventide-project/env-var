# "Test report" classifies the suite and prints the two-level context hierarchy

When the user asks for a **test report**, classify the automated suite along the lenses below, then print the context hierarchy two levels deep. **Re-derive everything from the current files** — read the tests and recompute membership and counts; do not report stale buckets from memory. The lenses are the frame; the specific buckets are whatever the current suite yields.

Produce these sections, in order:

1. **Generations / styles** — if the suite has **coexisting conventions** (an older style alongside a newer one), split the files by which they follow, and name the cleanest mechanical tell (e.g. actuation placement — captured in setup vs. performed inside the assertion block). If the suite is uniform, say so and skip.

2. **By subject under test** — group by the unit each test targets (the class, module, or feature). Give the file count per group.

3. **By structural style** — single-outcome leaf (one capability, one assertion); multi-outcome with fan-out (a loop generating one sub-context per case); multi-outcome flat (sibling outcomes, no loop).

4. **By assertion kind** — affirmative `assert`, refutation `refute`, error-raising `assert_raises`. Note the error classes in play.

5. **Other factors** — topology pairs (e.g. top-level vs nested for the same method), normal-path vs error outcomes, and controls usage.

6. **Context hierarchy, two levels deep** — each distinct top-level context with its distinct second-level contexts nested beneath, rendered as an indented tree (`├─`/`└─`). See the status-report rule (in `foundation`) for the rendering. Stop at two levels.

Keep each section tight.

**Why:** a suite has a discoverable structure worth surfacing on demand. Fixing the report's shape makes it repeatable and steers reading to the test files rather than recollection.

**How to apply:** on a test-report request, read the automated suite and render the sections from current state. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out) rather than asserting it; derive the hierarchy from the first two nesting depths of the `context "…"` declarations. Companion to the `lib-report` command (in `code/ruby`) and the `test-tree` command; neither report is written to a file.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 12 AM PT
