# Packages lists the installed packages

**Trigger:** When the engineer types `/packages`, or asks which packages are installed

**`/packages` lists every package installed in `slasher/system/`, one row each.** `foundation` comes first, since it defines the system, and the others follow by name. A package is a directory there that holds a `README.md`. Where the project has no `slasher/` directory, as in the Slasher authoring source, read `system/` instead.

**Each row is the package's name, its state, and what it is.** The state is *Active* or *Deactivated*, as the latest package set declaration records it, per the a-project-declares-which-installed-packages-are-active rule. Where no set is declared, every package is Active. What it is is the first line of prose in the package's `README.md`, below its title, cut to its first sentence.

**As the engineer stated it:** "/packages" command

**Below the table, name the package set, as `package set: default`.** Where no set is declared, print nothing below the table.

**`/packages refresh [<package>...]` does what `/package refresh` does.** It refreshes the packages named, or every installed package, under the package-refresh-and-install-run-foundations-scripts rule. The words after `refresh` pass to it unchanged.

## One package

**`/packages <package>` acts on one installed package.** Where an act follows the name, carry it out. Where none does, show the package's row from the table, then ask which act is meant, through the selection interface, with the acts the package can take now:

- **refresh** — `/package refresh <package>`: refresh it from its repository, under the package-refresh-and-install-run-foundations-scripts rule.
- **deactivate** — `/package deactivate <package>`, offered only where the package is Active.
- **activate** — `/package activate <package>`, offered only where the package is Deactivated.

**Activating or deactivating writes a new package set declaration**, under the a-project-declares-which-installed-packages-are-active rule, and takes effect at the next session. An act the package cannot take now, such as `activate` for an Active package, changes nothing, and the command says so.

**Where the name is not an installed package, say so, and act on nothing.** Do not install it. Installing is `/install`.

## Reading

**Read the packages and the declaration when the command is typed, never from memory.** A package installed during the session is listed, whether its rules were read or not.

**Why:** the engineer asks what is installed, and what each package does, without opening each README. `/package-set` answers which are active, and `/packages` answers what each one is.

**How to apply:** on `/packages`, read the package directories and the latest package set declaration. Print a table of name, state, and the README's first sentence, `foundation` first, then the package set's name below it where one is declared. On `/packages <package>`, carry out the act named, or ask which, offering only the acts the package can take now.

## History

Until Fri Nov 13 2026 `/packages` took no package name.

Until Fri Nov 13 2026 `/packages` took no subcommand.

Related:

- the a-project-declares-which-installed-packages-are-active rule — which packages are active, and the package set, and what activating or deactivating one writes
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — how a list is presented
- the package-refresh-and-install-run-foundations-scripts rule — what `/packages refresh` does, and what refreshing one package does

---

Authored by Scott Bellware on Fri Nov 13 2026 at 3:02:14 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:18:09 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:19:28 PM PT
