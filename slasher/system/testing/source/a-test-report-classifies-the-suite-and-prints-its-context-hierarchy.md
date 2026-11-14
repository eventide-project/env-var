# A test report classifies the suite and prints its context hierarchy

**Trigger:** When the user asks for a test report, as with `/test report` or `/test-report`

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

**This section, like the others, is read from the test files, not from a suite run.** The hierarchy is the `context "…"` declarations as written. A dynamic `context <expr> do` shows as its expression, and a bare unnamed `test do` adds no context line. A report on what a run produced is the test-tree command's, not this one's.

Keep each section tight.

**Why:** a suite has a discoverable structure worth surfacing on demand. Fixing the report's shape makes it repeatable and steers reading to the test files rather than recollection.

**How to apply:** on a test-report request, read the automated suite and render every section from the current files, the hierarchy included. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out) rather than asserting it. Do not run the suite for this report.

Companion to the `lib-report` command in `ext/ruby-lang`, and to the `test-tree` command. That one produces the tree of a run at full depth, and states why it comes from a run. Neither report is written to a file.

## Compressed

1. This rule applies when the user asks for a **test report**.
2. Classify the automated suite along the lenses below.
3. Then print the context hierarchy two levels deep.
4. Re-derive everything from the current files, the context hierarchy included.
5. Read the tests and recompute membership and counts.
6. Do not report stale buckets from memory.
7. The lenses are fixed. The buckets are whatever the current suite yields.
8. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out), rather than asserting it.
9. Produce the sections below, in the order given.
10. Keep each section tight.
11. Do not write the report to a file.

## 1. Generations / styles

1. The suite may have coexisting conventions, an older style alongside a newer one.
2. Split the files by which convention they follow.
3. Name the cleanest mechanical tell.
4. One such tell is actuation placement: captured in the controls, or performed inside the test block.
5. If the suite is uniform, say so and skip this section.

## 2. By subject under test

1. Group by the unit each test targets.
2. Give the file count per group.

## 3. By structural style

1. Use these styles:
   - single-outcome leaf — one capability, one assertion
   - multi-outcome with fan-out — a loop generating one sub-context per case
   - multi-outcome flat — sibling outcomes, no loop

## 4. By assertion kind

1. Classify as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`.
2. Note the error classes in play.

## 5. Other factors

1. Report topology pairs (e.g. top-level vs nested for the same method).
2. Report normal-path vs error outcomes.
3. Report controls usage.

## 6. Context hierarchy, two levels deep

1. Show each distinct top-level context, with its distinct second-level contexts nested beneath.
2. Render it as an indented tree (`├─`/`└─`), as the status-report rule (in `foundation`) describes.
3. Stop at two levels.
4. Do not run the suite for this report.
5. Take the hierarchy from the `context "…"` declarations as written.
6. A dynamic `context <expr> do` shows as its expression.
7. A bare unnamed `test do` adds no context line.
8. A report on what a run produced is the test-tree command's, not this one's.

## Compression

- 2026-10-24, compressed: compression 0.12, change 0.43, solubility 66 → 77, clarity 0.68 → 0.83, 23 directives, 23 kept, 0 less precise, 0 lost
- 2026-10-24, revised: the context hierarchy is read from the test files, not from a suite run; not checked
- 2026-10-27, re-checked: 26 directives, 26 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 77 → 79, clarity 0.83 → 0.84; checked: 26 directives, 26 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 its trigger read *When the user asks for a test report*, which was not a safe one.

Until 2026-10-24 the context hierarchy alone was derived from a suite run, not from the source, while the opening said to re-derive everything from the current files. A test report is a report on the test files, so the hierarchy is now read from them as well.

Until Sun Oct 25 2026 this rule was named test-report-format and titled ""Test report" classifies the suite and prints the two-level context hierarchy".

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
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:32 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:45:29 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:27 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:41:02 PM PT
