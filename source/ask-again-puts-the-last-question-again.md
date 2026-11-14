# Ask-again puts the last question again

**Trigger:** When the engineer types `/ask-again` or `/aa`, or asks for the last question again

**`/ask-again` puts the last question again, through the selection interface, whether the engineer answered it or escaped it.** The engineer escapes a question by refusing it, by stopping it to clarify, or by interrupting it. The agent does not put an escaped question again on its own, so `/ask-again` is how the engineer asks for it. An answered question is put again so the engineer can change the answer. `/aa` is its shortcut alias.

**As the engineer stated it:** Ask Again shourtcut

**As the engineer later stated it:** Ask again, of a question answered just before the work was interrupted.

**The question is put again as it was asked.** Its text, its options, and their descriptions are the same. A question that carried the decision marker carries it again, so its answer is logged as a process question.

**Where the conversation since has changed a candidate, the question carries the change.** A clarification the engineer asked for can show that an option was wrong, or that one was missing. Put the question with the options as they now stand, and say in one sentence what changed.

**A new answer replaces the earlier one.** Where the work has acted on the earlier answer, redo that part of the work from the new answer.

**Where no question has been put, say so, and put nothing.** Do not reach back past the last question to an earlier one.

**Why:** an escaped question is not put again unasked, so that the engineer has time to digest it. The engineer then needs a short way to say *I am ready, ask me again*. An answer given in haste needs the same short way back. A fixed command keeps that request from being read as something else.

**How to apply:** on `/ask-again` or `/aa`, find the last question, answered or escaped. Put it again through the selection interface, as it was asked, with any change the conversation since has made to its candidates. Where a new answer differs, redo the work that followed the earlier one. Where no question has been put, say so.

## History

Until Wed Nov 11 2026 at 10:48:44 AM PT this rule was named ask-again-puts-the-last-escaped-question-again. It put again only the last question the engineer escaped, and never a question the engineer had answered.

Until Wed Nov 11 2026 the shortcut alias of `/ask-again` was `/..`.

Until Wed Nov 11 2026 at 10:37:48 AM PT it was `/,`.

Related:

- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — an escaped selection is not put again unasked
- the a-process-question-and-its-answer-are-logged rule — the decision marker the question carries again
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Wed Nov 11 2026 at 12:30:49 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:33:27 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:37:48 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:48:44 AM PT
