# Implementation plans contain no code samples — nor do intentions or actions

Implementation plans (`waytide/local/plans/*.md`) — and, under the other modes, intentions (`waytide/local/intention/*.md`) and actions (`waytide/local/action/*.md`), which this rule governs identically — must never contain code samples — no code blocks, no literal method bodies, no "write this content" snippets. A plan describes the intended work and outcomes in prose. Code is produced later, interactively, when the user directs it.

Plans should also avoid over-prescription. Don't commit up front to specific method names, file names, or other implementation details that aren't actually known or decided yet — those emerge during the work. State the goal and the behavior at the altitude that's genuinely settled; leave the rest open rather than inventing names to fill the plan.

**Why:** The user wants to direct code generation at their command rather than have plans pre-bake implementation. Code samples and premature naming lock in decisions early and remove the interactive, incremental control the user wants over how the work is shaped.

**How to apply:** When writing or revising a plan, describe each step's intent and expected outcome in prose only — no code, and no invented method/file names where those aren't yet decided. When it's time to implement, generate code only on the user's explicit instruction, in the increments they choose.

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:03:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
