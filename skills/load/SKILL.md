---
name: load
description: Load the rules now, as typing load rules does.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/load $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, this is the `load rules` command. From the project root, run `slasher/system/foundation/session-start.sh instruction`. Where the project has no `slasher/` directory, run `system/foundation/session-start.sh instruction`. It prints the read instruction that a session start carries.
3. Follow that instruction, and nothing more.
4. Print no startup display and no session-start notice. The harness prints them.
