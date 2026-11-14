---
name: install
description: Install Slasher into a project that does not have it yet, as the marketplace plugin's first command.
argument-hint: "[<package set> | <package>...]"
disable-model-invocation: true
---

The engineer typed `/install $ARGUMENTS`.

This skill loads no rule. It is the command that puts the rules into a project, so it runs where they are not yet installed. Work from the project root, the directory the session is in.

1. Where the first word is `help`, say that this command takes no `help`, and that `/package help` prints the help of its command domain. Do nothing more.
2. Where `slasher/system/foundation/` exists, say that Slasher is already installed here, and that `/package refresh` brings its packages up to date. Do nothing more.
3. Where `system/foundation/` exists and `slasher/system/` does not, this is the Slasher authoring source. Say that Slasher is not installed here, and do nothing more.
4. Where the directory is not a git repository, ask through the selection interface whether to run `git init` here, naming the directory: *Initialize a git repository here* or *Don't install*. Slasher's installer adds its packages with `git subtree`, which needs a repository. On *Don't install*, do nothing more. Otherwise run `git init`.
5. Where the repository has uncommitted changes to tracked files, say that `git subtree` installs only into a working tree with none, and do nothing more.
6. Where nothing was typed after `/install`, run `sh ${CLAUDE_PLUGIN_ROOT}/slasher-install --list`. It prints one line for each package set, its name and then its packages, and a last line, `other:`, naming the packages outside every set. Ask through the selection interface which set to install, one option for each set, giving its packages in the option's description, with the `default` set first and marked recommended. Then, where the listing names packages outside every set, ask through the selection interface, as a multiple selection, which of those to add, one option for each, with *None* as an option. The words for the install are the set selected, followed by the packages selected.
7. Run the installer this plugin carries, `sh ${CLAUDE_PLUGIN_ROOT}/slasher-install`, followed by the words typed, or by the words selected. Where it cannot fetch the packages over SSH, run it again as `SLASHER_ORIGIN=https://github.com/slasher-bot sh ${CLAUDE_PLUGIN_ROOT}/slasher-install`, with the same words.
8. Where `.claude/settings.json` has no `statusLine` key, add one, and change nothing else in the file: `"statusLine": { "type": "command", "command": "slasher/system/foundation/statusline.sh" }`. The installer leaves an existing settings file alone, and enabling this plugin for the project writes one before the installer runs. Where the file already has a `statusLine`, leave it, and say that Slasher's status line is not set.
9. Report what the installer printed: the packages installed and the files it placed. Say that Slasher's rules load when Claude Code is restarted in this project.
