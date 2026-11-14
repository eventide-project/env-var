---
name: commands
description: Print the command domain table. An alias of /command-table.
disable-model-invocation: true
---

The engineer typed `/commands $ARGUMENTS`. `/commands` is an alias of `/command-table`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the text of `command-table.md`, in the plugin's root directory, two levels above this skill's directory, exactly as it stands, and nothing else. It is the command table, which the plugin build joins from each active package's rows. Load no rule, and do not run `/items`.
