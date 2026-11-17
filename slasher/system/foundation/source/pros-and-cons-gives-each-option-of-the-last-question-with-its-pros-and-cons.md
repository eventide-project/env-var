# Pros and cons gives each option of the last question with its pros and cons

**Trigger:** When the engineer types `/pros-and-cons` or `/??`, or asks for the pros and cons of the last question's options

**`/pros-and-cons` gives each option of the last question with its pros and cons.** The last question is the one the agent last put through the selection interface, answered or escaped. `/??` is its shortcut alias, and does exactly what it does. It is in the PROCESS command domain, so `/pros-and-cons help` says that the command takes no `help`, and names `/process help`.

**As the engineer stated it:** A Pros and Cons command that refers to the last question. It pairs with ask-again.

**The answer leads with the trade between the options, in a sentence or two.** It says what one option gains and the other gives up, in plain words. Then each option follows under its label, as the question showed it, with a **Pros** list and a **Cons** list.

**Each pro and each con is a fact about what the option does or causes.** It could be false, and it names a concrete effect, such as a file changed, a case caught or missed, or work the engineer must do. It is not a judgment of the option, such as *simpler* or *cleaner*, where the fact behind the judgment can be given instead. Give the cons as plainly as the pros. An option that is the agent's recommendation gets no softer cons.

**Words after the command say what the engineer wants weighed.** `/pros-and-cons the printed list` weighs that option first. Answer those words first, then give the rest.

**Where the last question held several questions, give each one's options**, each under its own question. Where no question has been put, say so, and give nothing.

**The command does not put the question again.** It answers, and stops. `/ask-again` puts the question again, once the engineer has weighed it. The two are used together: escape the question, read its pros and cons, then `/ask-again`.

**Why:** a question asks the engineer to decide between options whose effects the option's description can only name. The engineer who cannot decide needs to see what each option gains and gives up, not the agent's account of the question or its preference. Facts the engineer can check let the engineer decide, where a recommendation asks the engineer to defer.

**How to apply:** on `/pros-and-cons` or `/??`, find the last question. Lead with the trade between its options. Then give each option's pros and cons as lists of facts, answering any words typed after the command first. Put nothing again, and stop.

Related:

- the ask-again-puts-the-last-question-again rule — puts the question again, once it has been weighed
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — an escaped selection is not put again unasked
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — a list item states a fact and does not narrate

---

Authored by Scott Bellware on Mon Nov 16 2026 at 3:11:23 PM PT
