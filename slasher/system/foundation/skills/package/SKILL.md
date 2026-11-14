---
name: package
description: Activate or deactivate an installed package, refresh the packages, or install Slasher.
argument-hint: "[activate <package> | deactivate <package> | refresh [<package>...] | install | help]"
disable-model-invocation: true
---

The engineer typed `/package $ARGUMENTS`.

1. Load each rule this skill names with the loader. From the project root, run `slasher/system/foundation/load-rules.sh <rule-name>`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh <rule-name>`. Follow the rule it prints, and the rules its triggers then name.
2. Read the first word typed as the subcommand. The words after it are its arguments.
3. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
4. Where nothing was typed, ask which subcommand is meant, through the selection interface, in these groups. Then ask again within the group selected, where it holds more than one.
   - **Package set:** `activate`, `deactivate`
   - **Refresh:** `refresh`
   - **Install:** `install`
   - **Help:** `help`
5. **`activate <package>`** or **`deactivate <package>`**: change the package set by that one package. Load a-project-declares-which-installed-packages-are-active. Where no package was named, ask which, through the selection interface, from the packages installed.
6. **`refresh [<package>...]`**: refresh the packages named, or every installed package. Load package-refresh-and-install-run-foundations-scripts.
7. **`install`**: install Slasher into the project the session is in. Load package-refresh-and-install-run-foundations-scripts. Never run it in the Slasher authoring source.
8. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, as step 4 does.
