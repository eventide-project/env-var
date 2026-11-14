---
name: command-table
description: Print the command domain table, as a bare /slasher does.
disable-model-invocation: true
---

The engineer typed `/command-table $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the text of `command-table.md`, in the plugin's root directory, two levels above this skill's directory, exactly as it stands, and nothing else. It is the command table, which the plugin build joins from each active package's rows. Load no rule, and do not run `/items`.
