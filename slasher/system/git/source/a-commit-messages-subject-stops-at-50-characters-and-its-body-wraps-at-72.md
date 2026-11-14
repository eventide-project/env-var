# A commit message's subject stops at 50 characters and its body wraps at 72

**Trigger:** When writing a commit message

- **The subject line is at most 50 characters.**
- **The body is wrapped at 72 characters.**

**The two numbers are different budgets and are not one convention.**

- **50 is a display budget.** `git log --oneline` and a hosted commit list truncate near there, so a subject over it is a subject a reader meets cut off.
- **72 is a wrapping budget.** `git log` indents the body by four spaces, so 72 and the indent fit an 80-column terminal without the terminal reflowing the paragraph itself.

## When the subject will not fit

**Split the commit, or move the detail to the body.** Those are the two answers, in that order.

**A subject that will not fit is usually a commit doing too much.** That is the stronger reason for the limit and the one worth acting on. This repository's longest subject ran to 203 characters and named four separate deferred items, which was four commits written as one. The limit catches that at the moment it is being written.

**Do not abbreviate a subject into something a reader has to decode.** Fifty characters of plain words beats fifty characters of contractions, and the `language` package's rules hold in a commit message as they do everywhere. Where the subject genuinely needs more, the body has no such constraint on what it may say — only on how wide its lines run.

**A journal entry is the one record where neither remedy is available**, and it truncates instead. An entry is one commit, so there is nothing to split, and its subject is the writer's words, which the `journal` package bars the agent from shortening. Its commit subject is cut at the 50th character with an ellipsis, which marks the cut rather than hiding it. See that package's the-journal-is-the-record-the-writer-keeps rule.

**Truncation is not a general escape.** It is available for a journal entry alone. Everywhere else a subject that will not fit is a commit to split.

## What still governs the subject

**The write-subject-first-commit-messages rule is unchanged.** The subject is the software and never the engineer, stated as a fact in passive voice and indicative mood. The a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule is unchanged too.

**Those rules push length up, and that tension is real.** Naming the software and then its new state costs words that a leading verb would not. It is accepted: the limit is a budget the subject is written within, not a licence to drop the subject and lead with a verb.

**A prefix eats the budget, and the journal is the worked case.** A prefix of 13 characters and a date of 17 leave 20 of the 50 for what an entry is about. A date at the tail is where truncation takes it first, so it is carried at the subject's expense and no reader sees it. The journal's prefix is `Journal:`, which costs 9, and its subject carries no date. See the `journal` package's the-journal-is-the-record-the-writer-keeps rule.

## The history is not rewritten

**Every commit written before 2026-08-18 stands as written.** Of 734 subjects, 171 are within 50 and 218 exceed 72. Of the body lines, 3,092 exceed 72. A commit message is a historical record and is not revised to suit a later convention.

**Why:** the numbers are the ones git's own tooling is built around, so a message written to them is read as it was written wherever it is read. The subject limit does a second job the display argument does not reach: it makes a commit that has grown past one subject say so while it is still being written, which is the cheapest moment to split it.

Wrapping the body in the message itself rather than leaving it to the terminal keeps a paragraph looking the same to every reader.

**How to apply:** write a subject of at most 50 characters and wrap the body at 72. Where the subject will not fit, split the commit first and move detail to the body second. Do not abbreviate into shorthand, and do not revise a commit message already written.

## Compressed

1. The subject line is at most 50 characters.
2. The body is wrapped at 72 characters.
3. The two numbers are separate budgets, not one convention.
4. 50 is a display budget. `git log --oneline` and hosted commit lists truncate near there.
5. 72 is a wrapping budget. `git log` indents the body four spaces, so 72 fits an 80-column terminal.
6. Wrap the body in the message itself. Do not leave wrapping to the terminal.

## When the subject will not fit

1. Split the commit, or move the detail to the body. Try them in that order.
2. A subject that will not fit usually means the commit does too much. Treat that as the main reason to split.
3. Do not abbreviate a subject into something a reader must decode.
4. Use plain words, not contractions.
5. The `language` package's rules hold in commit messages too.
6. The body has no limit on what it says. Its only constraint is line width.
7. A journal entry is the one record where neither remedy is available. It truncates instead.
8. An entry is one commit, so there is nothing to split.
9. An entry's subject is the writer's words, which the `journal` package bars the agent from shortening.
10. Cut a journal entry's commit subject at the 50th character with an ellipsis. See that package's the-journal-is-the-record-the-writer-keeps rule.
11. Truncation is not a general escape. It is available for a journal entry alone.
12. Everywhere else, a subject that will not fit is a commit to split.

## What still governs the subject

1. The write-subject-first-commit-messages rule is unchanged.
2. The subject is the software, never the engineer.
3. The subject is a fact stated in passive voice and indicative mood.
4. The a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule is unchanged too.
5. Those rules push length up, and that is accepted.
6. Write the subject within the budget.
7. Do not drop the subject and lead with a verb to save space.
8. A prefix spends the budget.
9. The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date. See the `journal` package's the-journal-is-the-record-the-writer-keeps rule.

## The history is not rewritten

1. Every commit written before 2026-08-18 stands as written.
2. Do not revise a commit message already written to suit a later convention.

## Compression

- 2026-10-22, compressed: compression 0.39, change 0.57, solubility 33 → 72, clarity 0.35 → 0.76, 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-23, revised: truncation is for a journal entry alone; not checked
- 2026-10-24, revised: written as a numbered list; checked twice, every directive kept
- 2026-10-27, re-checked: 16 directives, 16 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 72 → 78, clarity 0.76 → 0.95; checked: 17 directives, 16 kept, 1 less precise, 0 lost

## History

Until 2026-10-23 the rule made truncation available wherever the subject was not the agent's to rewrite, which could reach beyond a journal entry.

Until Sun Oct 25 2026 this rule was named commit-message-widths.

Until 2026-08-18 the journal's commit message read `Diary entry: <subject> (Tue Jun 16 2026)`, which this rule gave as its worked case.

Related:

- the write-subject-first-commit-messages rule — what the subject says, which this constrains the width of
- the a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule — the other rule shaping the subject
- the `journal` package's the-journal-is-the-record-the-writer-keeps rule — the worked case of a prefix spending the budget

---

Authored by Scott Bellware on Mon Aug 17 2026 at 11:58:01 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:18:34 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:29:06 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:57:52 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:26:20 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 3:56:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:52 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
