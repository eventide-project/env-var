# After any implementation hinge, show the test output for the current feature

**Trigger:** When an implementation is accepted at the implementation hinge

- **Solubility:** 91
- **Original rank:** 105 of 106
- **Unclarity:** 0.06

Every time an implementation hinge is satisfied, **show the test output for the current feature**, without being asked. The hinge is satisfied when the just-accepted implementation is written and the suite is run. Do not show only the single outcome's test. Run and display the **whole feature's** tests, meaning every outcome built so far for the unit under development. The human then sees the feature's accumulated behavior at each implementation step.

Run the feature's tests with verbose output, so the context tree, the `comment` and `detail` narration, and pass/fail are visible. Show that output in the same turn as reporting the implementation.

**Why:** the implementation hinge is where solubility is judged, and solubility is judged against behavior, not code. Showing the *feature's* output, all its outcomes together, keeps the growing efferent contract in view as it accumulates. The human then deliberates the new outcome in the context of the ones already established, rather than in isolation. Surfacing it automatically keeps the loop's load-bearing artifact present without the human asking each turn.

**How to apply:** write an accepted implementation and run the suite. Then run the current feature's test files with verbose output. Include that output in the turn that reports the implementation. The engineer then judges solubility on what is shown. The each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule shows the implementation and the just-satisfied test. This one requires the **feature's full test output** at **every** implementation hinge.

## Compressed

1. After each implementation hinge, show the whole feature's test output without being asked.
2. First, write the accepted implementation and run the suite.
3. Then run every test file of the current feature.
4. The feature's tests are every outcome built so far for the unit, not only the new one.
5. Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show.
6. Put the output in the turn that reports the implementation.
7. The each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule shows the implementation and the new outcome's test. This rule adds the feature's full output.

## Compression

- 2026-10-21, compressed: compression 0.54, change 0.78, solubility 91 → 62, clarity 0.94 → 0.28
- 2026-10-22, checked: 8 directives, 8 kept, 0 less precise, 0 lost
- 2026-10-22, revised: rewritten in short sentences, compression 0.55, solubility 62 → 93, clarity 0.28 → 0.89; checked: 8 directives, 8 kept, 0 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 93 → 88, clarity 0.89 → 0.82; checked: 8 directives, 7 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named show-feature-test-output-after-implementation-hinge.

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule
- the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule
- the advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work rule

---

Authored by Scott Bellware on Mon Jun 29 2026 at 9 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:50:46 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 8:55:06 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:27:37 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:38:48 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:27:16 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:34 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
