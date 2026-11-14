# Idk answers the last question with "I don't know"

**Trigger:** When the engineer types `/idk`, or answers the agent's question with "I don't know"

**`/idk` answers the agent's last question with "I don't know".** The engineer cannot select an option, because they do not know enough to decide. `/idk` is not a selection. Do not take it as one, and do not choose an option for the engineer.

**As the engineer stated it:** "/idk" command that says "I don't know" to the agent

**The agent first explains the question.** Say in one or two plain sentences what the question decides. Then give each option in one line: what it does and what follows from it. Show an example where one makes the difference clear. Use no reserved term the engineer may not know without its plain meaning.

**Words after `/idk` say what the engineer does not know.** `/idk what a partial refund is` asks about the partial refund. Answer those words first, then explain only what else the decision needs.

**Then the agent gives its recommendation and its reason.** Name the option it recommends, and say in one sentence why. Where no option is better than another for this work, say so, and say what would make one better.

**Then the agent puts the question again.** Put it through the selection interface, with its text and its options as they were. List the recommended option first, with *(Recommended)* after its label. A question that carried the decision marker carries it again.

**Where no question has been put, say so, and put nothing.** Do not invent a question to answer.

**Why:** a selection asks the engineer to decide, and the engineer cannot decide what they do not understand. Without a way to say so, the engineer guesses an option or stops the question. A guess records a decision the engineer did not make. A stopped question waits for `/ask-again`, and the engineer still does not know. `/idk` turns the gap into an explanation, so the engineer decides with the knowledge they need.

**How to apply:** on `/idk`, find the last question put. Explain it and its options in plain words, answering any words typed after `/idk`. Give the recommendation and its reason. Put the question again through the selection interface, with the recommended option first. Where no question has been put, say so.

Related:

- the ask-again-puts-the-last-question-again rule — puts the last question again, without an explanation
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question is put again through the selection interface
- the a-process-question-and-its-answer-are-logged rule — the decision marker the question carries again
- the communicate-plainly-and-name-the-actual-thing rule — the explanation is in plain words with an example
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — how the command is read

---

Authored by Scott Bellware on Thu Nov 12 2026 at 11:44:03 PM PT
