# Test-first is the default, so never ask whether to start a task that way

Test-first is the standing default for starting any task. Do not ask "shall I start it test-first?", or otherwise put the test-first decision to the human. There is nothing to deliberate at that point. The answer is always yes unless told otherwise. If the human wants a task started some other way, they will give a different instruction.

**What this does not cover: the human's level of participation.** Test-first is the method's **substance**. Design is driven from the efferent side, and the test is written before the implementation. It is never put to the engineer. The answer is always yes.

**Attended or unattended** is a different question: it asks how often the loop **stops**, not what it builds, and nothing about the method is being confirmed or declined.

A question with a genuinely situational answer is a decision rather than a settled default, so this rule's reasoning does not reach it. See the attended-or-unattended-is-chosen-when-the-work-is-started rule.

**Why:** Asking confirms a settled default and spends a turn on a non-decision. The human's attention belongs at the hinges, which are the actuation and the solubility verdict. It does not belong on whether to follow the method itself. See the human-in-the-loop and DBE-as-design-tool rules. Re-asking the standing default is ceremony, the same failure DBE discontinues.

**How to apply:** When the next task is clear, begin it test-first without asking. Offer the next-task selection if useful, but never frame it as a test-first/not question. Deviate from test-first only on an explicit instruction to do so.

## Compressed

1. Test-first is the standing default for starting any task.
2. Do not ask "shall I start it test-first?".
3. Do not otherwise put the test-first decision to the human.
4. The answer is always yes unless told otherwise.
5. If the human wants a task started another way, they will give a different instruction.
6. When the next task is clear, begin it test-first without asking.
7. You may offer the next-task selection if useful.
8. Never frame the next-task selection as a test-first/not question.
9. Deviate from test-first only on an explicit instruction to do so.

## What this does not cover: the human's level of participation

1. Test-first is the method's substance: design is driven from the efferent side, and the test is written before the implementation.
2. Test-first is never put to the engineer.
3. Attended or unattended is a different question. It asks how often the loop stops, not what it builds.
4. The choice neither confirms nor declines the method.
5. A question with a genuinely situational answer is a decision, not a settled default. This rule does not forbid asking it.
6. See the attended-or-unattended-is-chosen-when-the-work-is-started rule.

## Compression

- 2026-10-24, compressed: compression 0.13, change 0.43, solubility 77 → 78, clarity 0.71 → 0.70, 12 directives, 12 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-27, re-checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 78 → 82, clarity 0.70 → 0.74; checked: 8 directives, 8 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named never-ask-to-start-test-first and titled "Never ask whether to start a task test-first — test-first is the default".

Until Mon Oct 26 2026 this rule was named never-ask-whether-to-start-a-task-test-first and titled "Never ask whether to start a task test-first".

Until Mon Oct 26 2026 this rule restated the batch-size trade between attended and unattended work. The attended-or-unattended-is-chosen-when-the-work-is-started rule states it.

Related:

- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule
- the DBE-as-design-tool rule
- the attended-or-unattended-is-chosen-when-the-work-is-started rule — the cadence question this does not forbid

---

Authored by Scott Bellware on Sun Jun 28 2026 at 11 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:45:19 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:25:02 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
