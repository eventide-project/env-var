---
name: package-set
description: Declare the project's package set, or show the active one.
argument-hint: "[<set or packages>]"
disable-model-invocation: true
---

The engineer typed `/package-set $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/package help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs package sets. From the project root, run `slasher/system/foundation/load-rules.sh a-project-declares-which-installed-packages-are-active`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. **Nothing typed**: show the active package set, and the packages active and deactivated, as the rule's latest declaration records them. Where no set is declared, say that every installed package is active.
4. **A set or packages named**, such as `default`, `content`, or `content, +testing`: declare that package set. The words typed are what the engineer declared, in the grammar `install` takes.
