# Advance one outcome at a time, and stop at every gate in attended work

The loop advances **one outcome at a time** and, in attended work, **stops at every gate** for the human. It does not run ahead. In particular, do **not batch-generate multiple test files** in one pass. A batch skips the gates where the human's judgment belongs, and accumulates unreviewed, pending mistakes. Generate one outcome's test, stop at its gate, and proceed only on the human's go. **Under unattended work the loop does not stop at the gates**, since the agent decides each hinge itself. It still advances one outcome at a time.

**Finishing the work means naming the test.** A test left with an empty (unnamed) outcome context is unfinished. The closing step ascribes its name. Do this one test at a time.

**The naming gate offers candidate outcome-context names, as every hinge offers its candidates.** See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for the mechanism and its reasons.

**Why:** Batch code generation moves fast, but it bypasses the gates that are the whole point of the loop. Each skipped gate is a place the human's judgment did not get to act, and mistakes hide in the pile. Naming is a hinge like the actuation, since the outcome-context name is a small contract on what the test establishes. So responsibility transfers there the same way, through options plus the free-text option, rather than through an AI fait accompli.

**How to apply:** Build one outcome's test at a time. After each, stop at each of its hinges (see the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule) and wait. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). Never write several test files at once, in either mode. To finish an unnamed test, present candidate names as options through the selection UI. Then apply the name chosen or dictated.

## Compressed

1. The loop advances one outcome at a time.
2. In attended work, the loop stops at every gate for the human.
3. Do not run ahead.
4. Do not batch-generate multiple test files in one pass.
5. Generate one outcome's test, then stop at its gate.
6. Proceed only on the human's go. Under unattended work, the loop does not stop at the gates. It still advances one outcome at a time.
7. Finishing the work means naming the test.
8. A test left with an empty, unnamed outcome context is unfinished.
9. The closing step ascribes the test's name.
10. Name one test at a time.
11. At the naming gate, present candidate outcome-context names, as every hinge presents its candidates. The AI does not name the test on its own.
12. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for the mechanism and its reasons.
13. Build one outcome's test at a time.
14. After each test, stop at each of its hinges (see the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule) and wait.
15. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
16. Never write several test files at once, in either mode.
17. To finish an unnamed test, present candidate names as options through the selection UI.
18. Then apply the name the human chose or dictated.

## Compression

- 2026-10-24, compressed: compression 0.19, change 0.51, solubility 72 → 80, clarity 0.68 → 0.77, 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-10-24, revised: points 2 and 6 name attended and unattended work; not checked
- 2026-10-27, re-checked: 16 directives, 15 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 80 → 79, clarity 0.77 → 0.76; checked: 16 directives, 16 kept, 0 less precise, 0 lost

## History

Until 2026-10-24 the opening said, without qualification, that the loop stops at every gate and proceeds only on the human's go. The rule predates unattended work, whose exception was added only to How to apply. The opening and the title now carry it too.

Until Sun Oct 25 2026 this rule was named one-outcome-at-a-time-name-via-options.

Until Mon Oct 26 2026 this rule was named advance-one-outcome-at-a-time-stop-at-every-gate-in-attended-work-and-name-via-options and titled "Advance one outcome at a time, stop at every gate in attended work, and name via options".

Until Mon Oct 26 2026 this rule restated, for the naming gate, the mechanism every hinge follows and its reasons. It now cites the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.

Related:

- the actuation-gate-options
- human-in-the-loop
- first-turn
- the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- present-every-prompt rules
- the testing package's test-naming rules

---

Authored by Scott Bellware on Sat Jun 27 2026 at 3 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:28:14 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:37:04 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:44:47 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:49 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:26:49 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
