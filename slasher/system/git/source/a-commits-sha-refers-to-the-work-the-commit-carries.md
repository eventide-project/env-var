# A commit's SHA refers to the work the commit carries

**Trigger:** When the engineer gives a commit SHA

**When the engineer names a commit by its SHA, they are asking about the substance the commit carries.** That is the item, the implementation, the rule, or the change to the code. They are not asking about the commit's own mechanics — its message, its file list, its diff statistics, or the log entry that travelled with it.

**Answer from what the commit added or changed.** Where it carries an item, an implementation record, or a rule, read that file and answer from its content. Where it changes code, answer from what the code now does. The SHA is the handle nearest to hand for a piece of work, and it is used because it is unambiguous rather than because the commit object is the subject.

## What the mechanics are, and when they are the answer

**The mechanics are how the work was recorded rather than what the work is.** A commit message states the change, a stat says which files moved, and a log entry says a decision was made. All three are true and none of them is the substance.

**They are the answer when the question is actually about them.** *Was it pushed*, *what did it touch*, *is it on master*, *what does its message say* — each asks about the commit, and each is answered directly.

**They are also the answer when they are the substance.** A merge, a revert, a rename, a force-push, and a rebase are commits whose content is the operation. There is nothing behind them to read.

**Where it is genuinely unclear, ask.** A SHA in a sentence with no verb — just the SHA — is the ordinary case this rule governs, and the substance is what to give.

**Why:** a SHA is the shortest unambiguous name for a piece of work, so it is what an engineer reaches for when they want to talk about that work. Answering with the commit's own bookkeeping answers a question nobody asked, and it costs a second turn to get to the one that was.

The failure is easy to miss because the answer is correct. A file list and a commit message are true statements about the SHA. They are simply about the wrong thing, and the engineer has to ask again in different words.

**How to apply:** when a SHA appears in a question, read what the commit introduced and answer from that. Open the files it added or changed rather than reporting their names.

Give the message, the stat, or the log entry when the question is about the commit, or when the commit's whole content is a git operation. Ask which is wanted only where the sentence genuinely does not say.

## Compressed

1. A commit SHA from the engineer asks about the work the commit carries.
2. That work is the item, the implementation, the rule, or the code change.
3. The SHA does not ask about the commit's mechanics.
4. The mechanics are the commit's message, its file list, its diff statistics, and the log entry that came with it.
5. Answer from what the commit added or changed.
6. If the commit carries an item, an implementation record, or a rule, read that file. Answer from its content.
7. If the commit changes code, answer from what the code now does.
8. Open the files the commit added or changed, rather than reporting their names.
9. Give the mechanics when the question is about them. Answer each of *Was it pushed*, *what did it touch*, *is it on master*, and *what does its message say* directly.
10. Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content.
11. There is nothing behind those operations to read.
12. Ask only where it is genuinely unclear.
13. A bare SHA with no verb is the ordinary case. Give the substance for it.

## Compression

- 2026-10-22, compressed: compression 0.52, change 0.68, solubility 48 → 79, clarity 0.35 → 0.67, 9 directives, 8 kept, 1 less precise, 0 lost
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-28, revised: Why points removed, solubility 79 → 89, clarity 0.67 → 0.92; checked: 9 directives, 8 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named a-sha-names-the-work-rather-than-the-commit and titled "A commit named by its SHA is a reference to the work it carries, not to the commit".

Related:

- the write-subject-first-commit-messages rule — what a commit message states, which is the mechanics this rule sets aside
- the `foundation` the-log-holds-one-file-per-entry-with-a-one-line-title rule — the log entry that travels with a change, and which is not what a SHA reference asks for
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, where this rule governs its subject

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:14:50 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:08 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:06 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
