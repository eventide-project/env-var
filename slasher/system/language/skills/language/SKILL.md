---
name: language
description: Print the help of the commands that work on language, with /language help.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/language $ARGUMENTS`.

1. `/language` prints the help of its command domain: `/clarify`, `/expand`, `/reserve`, and `/ete`. It takes only `help`.
2. Where the first word is `help`, or nothing was typed, print the text of `help.md`, in this skill's directory, and do nothing more.
3. Any other first word is not guessed at. Say it is not one of this command's subcommands, and that `/language` takes only `help`.
