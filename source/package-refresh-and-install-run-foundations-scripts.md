# Package refresh and install run foundation's scripts

**Trigger:** When the engineer asks to refresh or install Slasher's packages, as with `/package refresh` or `/package install`

**`/package refresh [<package>...]` refreshes the installed packages from their repositories.** It runs foundation's `refresh-packages.sh`, with the packages named, or with none to refresh every one. It reports each package that moved and the rule files that changed in it, as the script prints them.

**A refresh runs in the project the session is in, and in no other.** Refreshing another project is the engineer's to ask for there, per the work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported rule.

**`/package install` installs Slasher into the project the session is in.** It runs foundation's `install.sh` from the project's root, and the installer asks before it changes a file the project already has. It is not run in the Slasher authoring source, whose root `AGENTS.md` it would overwrite with a consuming project's bootstrap.

**Each changes what the project reads at its next session.** A refreshed or installed rule is read when the rules are next loaded, so the report says that a session restart, or a `load rules`, takes it up.

**Why:** a refresh and an install are each a script that already does the work and reports it. A command that runs the script, in the right place, and passes on its report, keeps the engineer from typing a path and keeps the agent from guessing at the work the script does.

**How to apply:** on `/package refresh`, run `refresh-packages.sh` with the packages named, or none, and report what moved. On `/package install`, run `install.sh` from the project's root, never in the authoring source. Say that the change is read at the next load of the rules. Act on no other project.

## Compressed

1. `/package refresh [<package>...]` refreshes the installed packages from their repositories. Run foundation's `refresh-packages.sh` with the packages named, or none for every one. Report each package that moved and its changed rule files, as the script prints them.
2. `/package install` installs Slasher into the project the session is in. Run foundation's `install.sh` from that project's root. The installer asks before changing a file the project already has.
3. Act only on the project the session is in. Refreshing or installing in another project is the engineer's to ask for there.
4. Never run `/package install` in the Slasher authoring source, whose root `AGENTS.md` it would overwrite with a consuming project's bootstrap.
5. Say that a refreshed or installed rule is read at the next load of the rules: a session restart, or `load rules`.

## Compression

- 2026-11-02, compressed: checked: 12 directives, 7 kept, 5 less precise, 0 lost, 5 repairs; re-checked: 12 directives, 11 kept, 1 less precise, 0 lost. Left less precise: running install.sh directly in the authoring source, which the repository's own AGENTS.md forbids
- 2026-11-04, revised: the typed command `load slasher` is `load rules`, a term swap the engineer settled; not re-checked

## History

Until Wed Nov 4 2026 the typed command was `load waytide`.

Related:

- the work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported rule — why no other project is touched
- the a-project-declares-which-installed-packages-are-active rule — `/package activate` and `/package deactivate`

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:22:26 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
