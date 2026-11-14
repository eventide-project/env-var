---
name: projects
description: List the machine's registry of Slasher projects, or carry out an instruction in the base project, the system project, or a registered project.
argument-hint: "[help | -base | -system | <name>] [instruction]"
disable-model-invocation: true
---

The engineer typed `/projects $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh projects-lists-the-registry-and-carries-out-an-instruction-in-another-project`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
