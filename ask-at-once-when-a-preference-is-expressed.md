# Ask at once when the engineer expresses a preference

**When the engineer expresses a preference about how the work is done, interrupt the work and
ask whether it is recorded.** Ask through the selection interface, per the
present-every-prompt-through-askuserquestion rule. Do not carry the preference silently, and do
not wait for the task to finish.

**A preference is not a rule until it is written.** An agent holds it for the rest of the
session and loses it at the session boundary. The engineer states it again, and every
restatement is evidence that nothing carried it. The `language` package's
an-answer-is-a-list-and-prose-must-justify-itself rule says so in its own **Why:** the
preference had been stated three times in one week before it was written down.

## What counts

**A statement about how the work is done, rather than about the artifact in front of you.**
*Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user*
are each one.

**A statement about this one artifact is an instruction.** *Make that sentence shorter* is
carried out rather than asked about.

**The test is whether it would still hold next week.** Where it would, it is a candidate for a
rule. Where it would not, it is an instruction and nothing is asked.

## The three candidates

Each is genuine, and the selection carries all three:

- **A rule**, in `waytide/local/rules/`, with the matching `waytide/local/log/` entry the
  rules-convention requires.
- **An observation**, in `waytide/local/ideas/`, where the thinking has not stabilized.
  The observations-convention prefers this where there is doubt. Promoting later is cheap, and
  retracting a premature rule is not.
- **Neither**, where the engineer does not want it recorded. It is a real answer, and it is
  taken without argument.

**A preference the engineer declined to record is not asked about again in the same session.**
The answer was given.

**The engineer's own words are what is recorded.** They are at hand at the moment they are said
and are not at hand an hour later. An agent writing the rule from memory records its own reading
of the preference rather than the preference.

**Why:** the alternative to writing a preference down is holding it in an agent memory store,
which the project-context-lives-in-the-committed-artifacts rule forbids. So the path from a
preference to a written rule has to be short enough that nothing needs holding. Asking at once
is what makes it short, and the two rules are only sound together.

Interrupting is the cost, and it is one selection. Deferring the ask to the end of the task
costs the wording, which is the part worth keeping.

**How to apply:** where the engineer states how the work should be done, stop and ask through
the selection interface. Offer a rule, an observation, and neither. Record their words rather
than a paraphrase, and write the log entry with the rule per the rules-convention.

Do not ask
about an instruction that governs only the artifact at hand. Do not ask a second time about a
preference the engineer has declined to record.

Related:

- the project-context-lives-in-the-committed-artifacts rule — the store this replaces, and which depends on this one
- the present-every-prompt-through-askuserquestion rule — the interface the ask uses
- the rules-convention — the rule and its log entry
- the observations-convention — the softer landing, preferred where there is doubt
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the preference stated three times before it was written

---

Authored by Scott Bellware on Fri Aug 14 2026 at 11:32:29 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
