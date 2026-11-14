# An item that sequences work contains no code samples

**Trigger:** When writing or revising an item in slasher/local/items/ that sequences work

- **Solubility:** 88
- **Original rank:** 103 of 106
- **Unclarity:** 0.18

A planning record in `slasher/local/items/` must never contain code samples, whatever its tags name it. No code blocks, no literal method bodies, no "write this content" snippets. A plan describes the intended work and outcomes in prose. Code is produced later, interactively, when the user directs it.

Plans should also avoid over-prescription. Do not commit up front to specific method names, file names, or other implementation details. Those are not actually known or decided yet. Those emerge during the work. State the goal and the behavior at the altitude that's genuinely settled. Leave the rest open rather than inventing names to fill the plan.

**Why:** The user wants to direct code generation at their command rather than have plans pre-bake implementation. Code samples and premature naming lock in decisions early and remove the interactive, incremental control the user wants over how the work is shaped.

**How to apply:** When writing or revising a plan, describe each step's intent and expected outcome in prose only. Write no code, and invent no method or file names where those are not yet decided. When it's time to implement, generate code only on the user's explicit instruction, in the increments they choose.

## Compressed

1. An item in `slasher/local/items/` that sequences work must never contain code samples, whatever its tags name it.
2. Such a plan contains no code blocks.
3. It contains no literal method bodies.
4. It contains no "write this content" snippets.
5. Describe each step's intent and expected outcome in prose only.
6. Avoid over-prescription. Do not commit up front to specific method names, file names, or other implementation details not yet known or decided.
7. State the goal and the behavior only at the altitude that is genuinely settled.
8. Leave the rest open rather than inventing names to fill the plan.
9. This applies when writing a plan and when revising one.
10. At implementation time, generate code only on the user's explicit instruction.
11. Generate it in the increments the user chooses.

## Compression

- 2026-10-24, compressed: compression 0.22, change 0.59, solubility 88 → 92, clarity 0.82 → 0.87, 10 directives, 10 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 92 → 91, clarity 0.87 → 0.86; checked: 8 directives, 8 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named plans-no-code-samples.

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:03:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:43 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
