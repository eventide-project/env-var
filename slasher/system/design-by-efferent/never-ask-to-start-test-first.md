# Never ask whether to start a task test-first — test-first is the default

Test-first is the standing default for starting any task. Do not ask "shall I start it test-first?", or otherwise put the test-first decision to the human. There is nothing to deliberate at that point. The answer is always yes unless told otherwise. If the human wants a task started some other way, they will give a different instruction.

**What this does not cover: the human's level of participation.** Test-first is the method's **substance**. Design is driven from the efferent side, and the test is written before the implementation. It is never put to the engineer. The answer is always yes.

**Attended or unattended** is a different question: it asks how often the loop **stops**, not what it builds. DBE is in effect either way, so nothing about the method is being confirmed or declined. What is chosen is a batch size. The trade has two real sides. Small batches spend attention continuously and keep rework near zero, and big batches spend none until the end and take rework instead.

A question with a genuinely situational answer is a decision rather than a settled default, so this rule's reasoning does not reach it. See the attended-or-unattended-is-chosen-at-the-start rule.

**Why:** Asking confirms a settled default and spends a turn on a non-decision. The human's attention belongs at the hinges, which are the actuation and the solubility verdict. It does not belong on whether to follow the method itself. See the human-in-the-loop and DBE-as-design-tool rules. Re-asking the standing default is ceremony, the same failure DBE discontinues.

**How to apply:** When the next task is clear, begin it test-first without asking. Offer the next-task selection if useful, but never frame it as a test-first/not question. Deviate from test-first only on an explicit instruction to do so.

Related:

- the human-in-the-loop rule
- the DBE-as-design-tool rule
- the attended-or-unattended-is-chosen-at-the-start rule — the cadence question this does not forbid
