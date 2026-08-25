# A commit named by its SHA is a reference to the work it carries, not to the commit

**When the engineer names a commit by its SHA, they are asking about the substance the commit carries.** That is the idea, the implementation, the rule, or the change to the code. They are not asking about the commit's own mechanics — its message, its file list, its diff statistics, or the log entry that travelled with it.

**Answer from what the commit added or changed.** Where it carries an idea, an implementation record, or a rule, read that file and answer from its content. Where it changes code, answer from what the code now does. The SHA is the handle nearest to hand for a piece of work, and it is used because it is unambiguous rather than because the commit object is the subject.

## What the mechanics are, and when they are the answer

**The mechanics are how the work was recorded rather than what the work is.** A commit message states the change, a stat says which files moved, and a log entry says a decision was made. All three are true and none of them is the substance.

**They are the answer when the question is actually about them.** *Was it pushed*, *what did it touch*, *is it on master*, *what does its message say* — each asks about the commit, and each is answered directly.

**They are also the answer when they are the substance.** A merge, a revert, a rename, a force-push, and a rebase are commits whose content is the operation. There is nothing behind them to read.

**Where it is genuinely unclear, ask.** A SHA in a sentence with no verb — just the SHA — is the ordinary case this rule governs, and the substance is what to give.

**Why:** a SHA is the shortest unambiguous name for a piece of work, so it is what an engineer reaches for when they want to talk about that work. Answering with the commit's own bookkeeping answers a question nobody asked, and it costs a second turn to get to the one that was.

The failure is easy to miss because the answer is correct. A file list and a commit message are true statements about the SHA. They are simply about the wrong thing, and the engineer has to ask again in different words.

**How to apply:** when a SHA appears in a question, read what the commit introduced and answer from that. Open the files it added or changed rather than reporting their names.

Give the message, the stat, or the log entry when the question is about the commit, or when the commit's whole content is a git operation. Ask which is wanted only where the sentence genuinely does not say.

Related:

- the subject-first-commit-messages rule — what a commit message states, which is the mechanics this rule sets aside
- the `foundation` decision-log-convention — the log entry that travels with a change, and which is not what a SHA reference asks for
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, where this rule governs its subject

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:14:50 AM PT
