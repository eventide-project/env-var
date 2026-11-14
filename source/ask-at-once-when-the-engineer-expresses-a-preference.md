# Ask at once when the engineer expresses a preference

**When the engineer expresses a preference about how the work is done, interrupt the work and ask what it changes.** Ask through the selection interface, per the present-every-prompt-to-the-engineer-through-the-selection-ui rule. Do not carry the preference silently, and do not put the question off. Where the preference corrects what the agent just did, fix the output as well.

**A preference is not a rule until it is written.** An agent holds it for the rest of the session and loses it at the session boundary. The engineer states it again, and every restatement is evidence that nothing carried it. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule says so in its own **Why:** the preference had been stated three times in one week before it was written down.

## What counts

**A statement about how the work is done, rather than about the artifact in front of you.** *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each one.

**A statement about this one artifact is an instruction.** *Make that sentence shorter* is carried out rather than asked about.

**The test is whether it would still hold next week.** Where it would, it is a candidate for a rule. Where it would not, it is an instruction and nothing is asked.

## The candidates

Each is genuine, and the selection carries those that apply:

- **An amendment to an existing rule**, where a rule already covers the subject, changed in its own source with its History. It is offered only where such a rule exists.
- **A new rule**, in `slasher/local/rules/`, with the matching `slasher/local/logs/log/` entry the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule requires.
- **A note**, in `slasher/local/items/`, where the thinking has not stabilized. The a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule prefers this where there is doubt. Writing a rule later is cheap, and retracting a premature rule is not.
- **Neither**, where the engineer does not want it recorded. It is a real answer, and it is taken without argument.

**A preference the engineer declined to record is not asked about again in the same session.** The answer was given.

**The engineer's own words are what is recorded.** They are at hand at the moment they are said and are not at hand an hour later. An agent writing the rule from memory records its own reading of the preference rather than the preference.

**Deferring is the engineer's choice, not the agent's.** Where the engineer wants work put off, a correction or anything else, they record it as an idea. The agent does not put off a preference, or the question about it, on its own.

**Why:** the alternative to writing a preference down is holding it in an agent memory store, which the a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store rule forbids. So the path from a preference to a written rule has to be short enough that nothing needs holding. Asking at once is what makes it short, and the two rules are only sound together.

Interrupting is the cost, and it is one selection. Deferring the ask to the end of the task costs the wording, which is the part worth keeping, and leaves a deficiency the engineer has pointed out standing in the meantime.

**How to apply:** where the engineer states how the work should be done, stop and ask through the selection interface. Offer an amendment to the rule that covers it where there is one, a new rule, a note, and neither. Where it corrects what you just did, fix that too. Record their words rather than a paraphrase, and write the log entry with the rule per the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule.

Do not ask about an instruction that governs only the artifact at hand. Do not ask a second time about a preference the engineer has declined to record. Do not put a preference off: work the engineer wants deferred, they record as an idea.

## Compressed

1. When the engineer expresses a preference about how the work is done, interrupt the work and ask what it changes, through the selection interface.
2. Do not carry the preference silently, and do not put the question off.
3. Where the preference corrects what the agent just did, fix the output as well.
4. A preference is not a rule until it is written. Held by the agent, it is lost at the session boundary.

## What counts

1. A statement about how the work is done, rather than about the artifact at hand, is a preference. *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each one.
2. A statement about this one artifact, such as *make that sentence shorter*, is an instruction. Carry it out, and do not ask about it.
3. The test is whether it would still hold next week. Where it would, it is a candidate for a rule. Where it would not, it is an instruction and nothing is asked.

## The candidates

1. Each candidate is genuine, and the selection carries only those that apply.
2. An amendment to an existing rule, offered only where a rule covers the subject. It is made in that rule's source, with its History.
3. A new rule, in `slasher/local/rules/`, with the matching `slasher/local/logs/log/` entry.
4. A note in `slasher/local/items/`, where the thinking has not stabilized. It is preferred where there is doubt.
5. Neither, where the engineer does not want the preference recorded. It is taken without argument.
6. Do not ask again in the same session about a preference the engineer declined to record.
7. Record the engineer's own words, not a paraphrase or the agent's reading of them from memory.
8. Deferring is the engineer's choice, not the agent's. Work they want put off, a correction or anything else, they record as an idea.
9. The agent does not put off a preference, or the question about it, on its own.

## Compression

- 2026-10-24, compressed: compression 0.34, change 0.60, solubility 40 → 69, clarity 0.34 → 0.67, 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-27, revised: rewritten for preferences asked about at once, with an amendment among the candidates; not checked
- 2026-10-27, re-checked: 22 directives, 9 kept, 12 less precise, 1 lost, 14 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 69 → 72, clarity 0.67 → 0.80; checked: 17 directives, 17 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 19 directives, 18 kept, 1 less precise, 0 lost, 1 repair
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Sun Oct 25 2026 this rule was named ask-at-once-when-a-preference-is-expressed.

Until Tue Oct 27 2026 this rule was named ask-at-once-when-the-engineer-expresses-a-preference and titled "Ask at once when the engineer expresses a preference".

Until Tue Oct 27 2026 this rule interrupted the work to ask whether a preference was recorded, offering a rule, an observation, or neither. The engineer settled that the words are written at once as an observation, and that the question comes at the task's end, with an amendment to an existing rule among its candidates.

Until Tue Oct 27 2026 a correction of what the agent just did was treated as any other preference: written as an observation and asked about at the task's end. The engineer settled that a correction is acted on at once.

Until Tue Oct 27 2026 this rule was named record-a-preference-at-once-and-ask-about-it-at-the-tasks-end and titled "Record a preference at once, and ask about it at the task's end".

For part of Tue Oct 27 2026 this rule wrote a preference at once as an observation and put the question of what becomes of it off to the task's end, with a correction acted on at once. The engineer settled that deferring is the engineer's own choice, made by recording an idea, and that every preference is asked about at once.

Related:

- the a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store rule — the store this replaces, and which depends on this one
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the interface the ask uses
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the rule and its log entry
- the a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes rule — the softer landing, preferred where there is doubt
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the preference stated three times before it was written

---

Authored by Scott Bellware on Fri Aug 14 2026 at 11:32:29 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:34 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:17:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:33:49 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:34:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:37:58 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:39:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:39:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:33:07 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:39:15 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:45:17 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
