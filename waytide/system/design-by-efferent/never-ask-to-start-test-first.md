# Never ask whether to start a task test-first — test-first is the default

Test-first is the standing default for starting any task. Do not ask "shall I start it test-first?" or otherwise put the test-first decision to the human — there is nothing to deliberate at that point; the answer is always yes unless told otherwise. If the human wants a task started some other way, they will give a different instruction.

**What this does not cover: the gating cadence.** Test-first is the method's **substance** —
that design is driven from the efferent side, the test written before the implementation — and
it is never put to the developer, because the answer is always yes. **Attended or unattended**
is a different question: it asks how often the loop **stops**, not what it builds. DBE is in
effect either way, so nothing about the method is being confirmed or declined; what is chosen
is a batch size, and the trade has two real sides — small batches spend attention continuously
and keep rework near zero, big batches spend none until the end and pay in rework. A question
with a genuinely situational answer is a decision rather than a settled default, so this rule's
reasoning does not reach it. See the attended-or-unattended-is-chosen-at-initiation rule.

**Why:** Asking confirms a settled default and spends a turn on a non-decision. The human's attention belongs at the hinges — the actuation and the solubility verdict — not on whether to follow the method itself (see the human-in-the-loop and DBE-as-design-tool rules). Re-asking the standing default is ceremony, the same failure DBE retires.

**How to apply:** When the next task is clear, begin it test-first without asking. Offer the next-task choice if useful, but never frame it as a test-first/not question. Deviate from test-first only on an explicit instruction to do so. Related: the human-in-the-loop rule, the DBE-as-design-tool rule, and the attended-or-unattended-is-chosen-at-initiation rule (the cadence question this does not forbid).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 11 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
