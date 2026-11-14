# A process question and its answer are logged

**Every process question put through the selection interface is logged, with the engineer's answer.** A process question asks the engineer to decide how the work is conducted or what it settles. Examples are *Human in the loop*, the working location, whether the work concludes with a verdict, *Accept the plan?*, a wording, and a design.

**A mechanical question is the opposite of a process question.** It confirms an act whose outcome is already settled, such as whether to commit, push, merge, delete a branch, or remove a worktree. It is not logged.

## The marker

**The agent marks a process question by setting the selection's `metadata.source` to `decision`:**

```json
"metadata": {"source": "decision"}
```

**A mechanical question carries no marker.** The engineer does not see the marker. It tells the hook which questions to log.

**The plugin's `PostToolUse` hook on `AskUserQuestion` writes the entries.** It runs foundation's `process-question-log.sh`, which writes one log entry to `slasher/local/logs/log/` for each marked question that was answered. Nothing is written for an unmarked one. The agent does not write these entries itself.

## The entry

**Each entry is an ordinary log entry, tagged `[decision]`.** Its title is the question's first line and the engineer's answer:

```
# Accept the plan? — Accept, selected by the engineer

**Tags:** [decision]
```

Its body holds the question, the options with their descriptions, the answer, and any notes the engineer added to the selection.

**The agent commits the entries the hook writes**, in the same commit as the change they bear on or separately with a `Log:` prefix, as the the-log-holds-one-file-per-entry-with-a-one-line-title rule requires of every entry.

**Why:** the engineer's answers to process questions are the decisions the work turns on. Logged by hand, an answer is logged only when the agent remembers to. Logged by a hook, every marked answer is logged, in the engineer's own selection. The marker is set in the same call that asks the question, so it is harder to forget than a separate step. Mechanical questions are left out because their answers settle nothing that a reader would reconsider.

**How to apply:** when putting a process question through the selection interface, set `metadata.source` to `decision`. Set no marker on a mechanical question. Commit the entries the hook writes.

## Compressed

1. Log every process question put through the selection interface, with the engineer's answer.
2. A process question asks the engineer to decide how the work is conducted or what it settles. Examples are *Human in the loop*, the working location, the verdict question, *Accept the plan?*, a wording, and a design.
3. A mechanical question is the opposite of a process question. It confirms an act whose outcome is already settled, such as a commit, a push, a merge, a branch deletion, or a worktree removal.
4. Do not log a mechanical question.
5. Mark a process question by setting the selection's `metadata.source` to `decision`, in the same call that asks the question.
6. Set no marker on a mechanical question.
7. The plugin's `PostToolUse` hook on `AskUserQuestion` runs foundation's `process-question-log.sh`. It writes one log entry to `slasher/local/logs/log/` for each marked question that was answered, and nothing for an unmarked one.
8. Do not write these entries yourself.
9. Each entry is an ordinary log entry, with `**Tags:** [decision]` under its title. Its title is the question's first line and the engineer's answer, as in `# Accept the plan? — Accept, selected by the engineer`.
10. Its body holds the question, the options with their descriptions, the answer, and any notes the engineer added.
11. Commit the entries the hook writes, in the same commit as the change they bear on or separately with a `Log:` prefix.

## Compression

- 2026-11-06, written: checked: 14 directives, 14 kept, 0 less precise, 0 lost, after 2 repairs, re-checked kept

## History

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's form, and committing it
- the a-log-entry-recording-an-engineers-decision-is-tagged-decision rule — the `[decision]` tag
- the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule — *Human in the loop* and *Accept the plan?*, both process questions

---

Authored by Scott Bellware on Fri Nov 6 2026 at 2:13:43 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
