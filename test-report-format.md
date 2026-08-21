# "Test report" classifies the suite and prints the two-level context hierarchy

When the user asks for a **test report**, classify the automated suite along the lenses below, then print the context hierarchy two levels deep. **Re-derive everything from the current files** — read the tests and recompute membership and counts. Do not report stale buckets from memory. The lenses are the frame. The specific buckets are whatever the current suite yields.

Produce these sections, in order:

1. **Generations / styles** — the suite may have **coexisting conventions**, an older style alongside a newer one. Split the files by which they follow, and name the cleanest mechanical tell. One such tell is actuation placement, captured in the controls against performed inside the test block. If the suite is uniform, say so and skip.

2. **By subject under test** — group by the unit each test targets. Give the file count per group.

3. **By structural style**:
   - single-outcome leaf — one capability, one assertion
   - multi-outcome with fan-out — a loop generating one sub-context per case
   - multi-outcome flat — sibling outcomes, no loop

4. **By assertion kind** — affirmative `assert`, refutation `refute`, error-raising `assert_raises`. Note the error classes in play.

5. **Other factors** — topology pairs (e.g. top-level vs nested for the same method), normal-path vs error outcomes, and controls usage.

6. **Context hierarchy, two levels deep** — each distinct top-level context with its distinct second-level contexts nested beneath, rendered as an indented tree (`├─`/`└─`). See the status-report rule (in `foundation`) for the rendering. Stop at two levels.

**This section alone is derived from a suite run, not from the source**. The sections above are source analysis, and this one is not, for the reasons the test-tree rule gives. A dynamic `context <expr> do` reads as a placeholder in the source and as its expanded real value in a run. A bare unnamed `test do` appears in the source and emits no line at all. A tree read off the declarations is wrong in the two cases.

Keep each section tight.

**Why:** a suite has a discoverable structure worth surfacing on demand. Fixing the report's shape makes it repeatable and steers reading to the test files rather than recollection.

**How to apply:** on a test-report request, read the automated suite and render the sections from current state. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out) rather than asserting it. Derive the **hierarchy** differently from the rest. Run the suite and take the first two levels from its output, never from the `context "…"` declarations.

Companion to the `lib-report` command in `tools/ruby-lang`, and to the `test-tree` command. That one produces the same tree at full depth, and states why it comes from a run. Neither report is written to a file.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 12 AM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:53:02 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:58:40 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
