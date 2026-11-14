---
name: shortcuts
description: Print the shortcuts table, each shortcut alias and what it does.
disable-model-invocation: true
---

The engineer typed `/shortcuts $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the text of `shortcuts.md`, in the plugin's root directory, two levels above this skill's directory, exactly as it stands, and nothing else. It is the shortcuts table, which the plugin carries from foundation. Load no rule, and do not run `/items`.
