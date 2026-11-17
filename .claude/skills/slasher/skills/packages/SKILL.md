---
name: packages
description: List the installed packages, whether each is active, and what each is, update them, or act on one package.
argument-hint: "[update [<package>...] | <package> [update | activate | deactivate] | help]"
disable-model-invocation: true
---

The engineer typed `/packages $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Where the first word is `update`, it is `/package update`, with the words after it as its arguments: refresh the packages named, or every installed package. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh package-refresh-and-install-run-foundations-scripts`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Otherwise, load the rule that governs `/packages`. From the project root, run `slasher/system/foundation/load-rules.sh packages-lists-the-installed-packages`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
4. Where nothing was typed, list the packages, as the rule says.
5. Where the first word names an installed package, act on that package, as the rule says. The word after it, where there is one, names the act.
6. Any other first word is not guessed at. Say it is neither a subcommand nor an installed package, and ask which is meant, through the selection interface: `update`, an installed package, or nothing, to list the packages.
