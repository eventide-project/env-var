---
name: log
description: Write a log entry, or summarize the log.
argument-hint: "[<message> | summary | help]"
disable-model-invocation: true
---

The engineer typed `/log $ARGUMENTS`.

1. Load the rule that governs the log. From the project root, run `slasher/system/foundation/load-rules.sh the-log-holds-one-file-per-entry-with-a-one-line-title`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
2. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
3. Where the first word is `summary`, summarize the log in the response, as the rule says. Write no file.
4. Otherwise, the words typed are the message to log. Write a log entry for it, as the rule says.
5. Where no words were typed, write a log entry for the work the conversation is on, as the rule says for a bare `/log`.
