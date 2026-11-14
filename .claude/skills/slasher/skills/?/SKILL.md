---
name: "?"
description: Name the next step of the work under way, without taking it. An alias of /next?.
disable-model-invocation: true
---

The engineer typed `/? $ARGUMENTS`. `/?` is an alias of `/next?`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh next-takes-the-next-step-of-the-work-under-way`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, for `/next?`.
