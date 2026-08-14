# Advance one outcome at a time, stop at every gate, and name via options

The loop advances **one outcome at a time** and **stops at every gate** for the human. It does not run ahead. In particular, do **not batch-generate multiple test files** in one pass. A batch skips the gates where the human's judgment belongs, and accumulates unreviewed, pending mistakes. Generate one outcome's test, stop at its gate, and proceed only on the human's go.

**Finishing the work means naming the test.** A test left with an empty (unnamed) outcome context is unfinished. The closing step ascribes its name. Do this one test at a time.

**The naming gate offers candidate names, and the free-text option among them.** Responsibility transfers there exactly as it does at the actuation gate (see the actuation-gate-options rule). Present a list of candidate outcome-context names. The free-text option lets the human input a name directly or discuss it.

The rationale carries over from the actuation gate: present alternatives, not a single pick. Make the human produce the answer, not approve one. The free-text option is mandatory. The best name may be one only the human can produce.

**Why:** Batch code generation moves fast, but it bypasses the gates that are the whole point of the loop. Each skipped gate is a place the human's judgment did not get to act, and mistakes hide in the pile. Naming is a hinge like the actuation, since the outcome-context name is a small contract on what the test establishes. So responsibility transfers there the same way, through options plus the free-text option, rather than through an AI fait accompli.

**How to apply:** Build one outcome's test at a time. After each, stop at its gate (actuation, solubility, naming) and wait. Never write several test files at once. To finish an unnamed test, present candidate names as options through the selection UI. Then apply the name chosen or dictated.

Related:

- the actuation-gate-options
- human-in-the-loop
- first-turn
- hinge-cycle
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
