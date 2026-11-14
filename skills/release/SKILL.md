---
name: release
description: Choose the next version of a package, put to the engineer.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/release $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rules that govern the act. From the project root, run `slasher/system/foundation/load-rules.sh the-next-version-is-put-to-the-engineer-never-decided-by-the-agent`, then the same with `a-version-is-semver-optionally-prefixed-by-a-product-generation-number`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule names. Follow the rules they print.
