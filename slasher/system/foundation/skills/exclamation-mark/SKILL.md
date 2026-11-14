---
name: "!"
description: Carry out a request on the agent's own, after a plan is proposed. An alias of /unattended.
argument-hint: "<request>"
disable-model-invocation: true
---

The engineer typed `/! $ARGUMENTS`. `/!` is an alias of `/unattended`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, the words typed are the request. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh unattended-carries-out-a-request-without-stopping-for-the-engineer`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
