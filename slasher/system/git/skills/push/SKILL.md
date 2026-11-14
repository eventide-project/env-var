---
name: push
description: Push the current branch to its remote.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/push $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Where any other words were typed, say that this command takes none but `help`, and push nothing.
3. Otherwise, load the rule that governs the push. From the project root, run `slasher/system/foundation/load-rules.sh push-pushes-the-current-branch-to-its-remote`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
