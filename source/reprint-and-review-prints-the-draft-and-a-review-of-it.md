# Reprint-and-review prints the draft and a review of it

**Trigger:** When the engineer types `/reprint-and-review` or `/rr`, or asks for the draft to be reprinted and reviewed

**`/reprint-and-review` prints the draft as it now stands, then a review of it.** `/rr` is its shortcut alias. The draft is the text the conversation is working on, such as an article, a page, a message, or a rule, with every change made to it so far. `/rr <file>` names a file, and the draft is that file's text.

**As the engineer stated it:** "/reprint-and-review" command with a "/rr" shortcut alias. This is useful typically in content editing when working a draft of a text. It asks the agent to reprint the text so far, and to follow it with a review or critique.

**The draft is printed whole and unchanged.** Print it as it stands, in a fenced block where it is markdown or code, so its form is seen as written. Do not correct it while printing it.

**The review follows the draft, as a numbered list of findings, most important first.** Each finding quotes the passage it is about, says what is wrong with it, and suggests a change in the words the change would use. The numbers are handles, so the engineer can answer *take 2 and 4*.

**The review judges the draft by its purpose and its reader.** It asks whether the draft says what it means to, in the order a reader needs, in words the reader holds. Where the draft is Slasher's own prose, such as a rule or a record, it is also judged by the `language` package's rules. Where nothing needs to change, say so in one line, and give no findings to fill the list.

**The command changes nothing.** It does not edit the draft or its file. The engineer decides which findings to act on, and asks for the change.

**Where no draft is under way, and no file is named, say so, and ask which text is meant**, through the free-text option.

**Why:** a draft worked on in conversation is changed a piece at a time, and its whole is not seen again until it is asked for. Seeing the whole and a critique of it together lets the engineer judge the next change against the text as it is, not as remembered.

**How to apply:** on `/reprint-and-review` or `/rr`, find the draft, or read the file named. Print it whole and unchanged. Then give a numbered list of findings, each quoting its passage, naming what is wrong, and suggesting the change. Change nothing.

Related:

- the an-answer-is-a-list-and-prose-must-justify-itself rule — the review is a numbered list, its numbers handles
- the communicate-plainly-and-name-the-actual-thing rule — what the review asks of the words

---

Authored by Scott Bellware on Fri Nov 13 2026 at 4:16:43 PM PT
