---
name: commit-and-push
description: Commit the work, then push the current branch.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/commit-and-push $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/push help` prints the help of its command domain. Do nothing more.
2. Where any other words were typed, say that this command takes none, and commit and push nothing.
3. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh commit-and-push-commits-the-work-then-pushes-the-current-branch`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
