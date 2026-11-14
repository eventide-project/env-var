---
name: "??"
description: Explain the previous answer again using what the agent knows of the engineer's understanding. An alias of /clarify.
disable-model-invocation: true
---

The engineer typed `/?? $ARGUMENTS`. `/??` is an alias of `/clarify`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh clarify-explains-the-previous-answer-using-what-the-agent-knows-of-the-engineers-understanding`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Explain the previous answer again using what the agent knows of the engineer's understanding, as the rule says. This is what the reply "I don't understand" asks for.
