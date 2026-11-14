---
name: sc
description: Print the shortcuts table. An alias of /shortcuts.
disable-model-invocation: true
---

The engineer typed `/sc $ARGUMENTS`. `/sc` is an alias of `/shortcuts`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the text of `shortcuts.md`, in the plugin's root directory, two levels above this skill's directory, exactly as it stands, and nothing else. It is the shortcuts table, which the plugin carries from foundation. Load no rule, and do not run `/items`.
