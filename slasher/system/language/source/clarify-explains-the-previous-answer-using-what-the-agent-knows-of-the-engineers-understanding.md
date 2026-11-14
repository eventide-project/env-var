# Clarify explains the previous answer using what the agent knows of the engineer's understanding

**Trigger:** When the engineer asks for an answer to be clarified, as with `/clarify`

**`/clarify` does what the reply "I don't understand" does.** It explains the agent's previous answer again, using what the agent knows of the engineer's understanding. It does not shorten the answer or rewrite it in fewer words.

**As the engineer stated it:** have the `/clarify` command run "I don't understand".

**The explanation starts from what the agent knows of the engineer's understanding.** It covers the code, the test, the behavior the engineer has seen, and the words the engineer used. State the point in those terms, first, in a sentence or two of plain words. Then give each fact the point rests on, in the same terms. Replace each term that the answer took for granted with what it names.

**Where the previous answer put a question, explain the question the same way.** State what the question decides, in terms of what the agent knows of the engineer's understanding. Set out each option by what it would do and what it would not do. Recommend one option, and say why in a sentence. Then put the question again through the selection interface, with the same options.

**A clarified answer says the same thing as the answer it replaces.** It adds no new claim, drops no decision the engineer was asked to make, and changes no fact. The recommendation is the one addition it makes, and only where the answer put a question.

**The clarified answer may be longer than the answer it replaces.** An explanation needs the facts that the answer left out. It still leads with its point and follows the a-response-is-clarified-twice-before-it-is-sent rule in all else.

**Why:** in the Slasher rename feature, a design question put through the selection interface was not understood, twice. Asking for it to be clarified made the question smaller and led nowhere. The reply "I don't understand" led the agent to restate the question in terms of what the test sets up and does. It also set out each option by what it would catch and what it would not, and recommended one. The engineer then answered. An answer that was not understood is usually missing what connects it to the engineer's understanding, not too long.

**How to apply:** on `/clarify`, find what the agent knows of the engineer's understanding that the previous answer bears on. Explain the answer again from there, point first. Where the answer put a question, set out each option by what it would and would not do, recommend one, and put the question again.

## Compressed

1. `/clarify` does what the reply "I don't understand" does. It explains the previous answer again using what the agent knows of the engineer's understanding. It does not shorten the answer or the question.
2. Start from what the agent knows of the engineer's understanding that the answer bears on. It covers the code, the test, the behavior seen, and the engineer's own words. State the point first in those terms, in a sentence or two of plain words. Then give each fact the point rests on, in the same terms, including those the answer left out.
3. Replace each term the answer took for granted with what it names.
4. Where the previous answer put a question, state what the question decides in those terms. Set out each option by what it would and would not do. Recommend one option, with a sentence on why. Put the question again through the selection interface, with the same options.
5. Keep every claim, fact, and decision the engineer was asked to make. Add no new claim. The recommendation is the only addition, and only where the answer put a question.
6. The clarified answer may be longer than the previous one. It still leads with its point and follows the a-response-is-clarified-twice-before-it-is-sent rule in all else.

## Compression

- 2026-11-02, compressed: checked: 15 directives, 11 kept, 4 less precise, 0 lost, 4 repairs; re-checked: 15 directives, 14 kept, 1 less precise, 0 lost. Left less precise: "no decision dropped" without "the engineer was asked to make", which reads broader and keeps every decision
- 2026-11-06, revised: checked: 29 directives, 27 kept, 2 less precise, 0 lost, 2 repairs; re-checked: 29 directives, 27 kept, 2 less precise, 0 lost, 2 repairs; re-checked: 29 directives, 28 kept, 1 less precise, 0 lost. Left less precise: "keep every … fact" without "change no fact", since a fact kept is a fact unchanged, and two earlier checks judged it kept
- 2026-11-06, revised: "what the engineer already knows" is replaced by "what the agent knows of the engineer's understanding", a term the engineer settled, so no check was run

## History

1. Until 2026-11-06 the rule was named the clarify-rewrites-the-previous-answer-twice rule.
2. It said that `/clarify` rewrites the previous answer more plainly, then rewrites that once more, and shows only the second rewrite. Each rewrite followed the a-response-is-clarified-twice-before-it-is-sent rule. The clarified answer said the same thing in fewer words, and asked again any question the answer put.
3. On 2026-11-06 the engineer directed that `/clarify` run "I don't understand" instead. The `/clarify` does what the reply "I don't understand" does item recorded the difference: a shorter answer did not help where the answer was not understood.
4. On 2026-11-06 the engineer reworded it from "what the engineer already knows" to "what the agent knows of the engineer's understanding". It was named the clarify-explains-the-previous-answer-from-what-the-engineer-already-knows rule until then.

Related:

- the a-response-is-clarified-twice-before-it-is-sent rule — what every answer, the clarified one included, follows
- the an-answer-is-a-list-and-prose-must-justify-itself rule — `/expand`, which gives the previous answer at more length without changing where it starts

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:55:23 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:26:33 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:32:37 PM PT
