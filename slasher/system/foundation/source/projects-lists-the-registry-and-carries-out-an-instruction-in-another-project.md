# Projects lists the registry, and carries out an instruction in another project

**Trigger:** When the engineer asks for the Slasher projects on this machine, or asks for an instruction to be carried out in another project, as with `/projects`, `/projects -base`, `/projects -system`, or `/projects <name>`

**`/projects` lists the Slasher projects registered on this machine, from within any project on it.** It runs foundation's `read-consuming-projects.sh`, which reads the registry at `~/.config/slasher/consuming-projects.toml`, and prints what the script reports. Where no registry exists, it says there is none.

**`/projects` with a target carries out an instruction in another project.** The target is one of three: `-base`, the project's base project, `-system`, the machine's system project, or a project's name in the registry. The instruction is the rest of what was typed, as in `/projects -base add the receipt idea` or `/projects some-checkout show its recent log`.

**The target is resolved by foundation's `resolve-project.sh`, run from the root of the current project.** `slasher/system/foundation/resolve-project.sh -base`, `-system`, or `<name>` prints the target's root. Where the project has no `slasher/` directory, it is `system/foundation/resolve-project.sh`. Where the script fails, report its message and do nothing more. It fails where `slasher.toml` or `system-project.toml` is missing, where no registered project has the name, and where more than one has it.

**The target's own rules govern the act.** Before acting, run the target's loader, `slasher/system/foundation/load-rules.sh`, or `system/foundation/load-rules.sh` where it has no `slasher/` directory, from the target's root, and follow the rules it prints for that act. Then carry out the instruction under the target's root. A record written there is written by the target's conventions. A commit in the target waits for the engineer's selection, whatever the current project allows. Report what was done and where.

**With a target and no instruction, `/projects` prints the target's root.** It acts on nothing.

**The registry and the two configuration files are per-machine configuration, and stay outside every repository.** `slasher.toml` sits in the shared parent directory of a project and its base project, outside both. `/projects` does not change the registry or either file. It writes no project's name into the project the session is in, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.

**Why:** an engineer with Slasher in several projects asks which they are, and moves ideas, patterns, and corrections between them. The answer to the first is on the machine rather than in any project, and the second needs the other project addressed from where the engineer is working. Its own rules govern it, because its conventions are the ones its records must keep.

**How to apply:** on `/projects`, run `read-consuming-projects.sh` and print its report. On `/projects` with a target, run `resolve-project.sh` from the current project's root, then the target's loader from the target's root, and carry out the instruction under the target's root by its rules. Ask before any commit in the target.

## Compressed

1. `/projects` lists the Slasher projects registered on this machine, from within any project. Run foundation's `read-consuming-projects.sh`, which reads `~/.config/slasher/consuming-projects.toml`, and print its report. Where there is no registry, say so.
2. `/projects -base <instruction>`, `/projects -system <instruction>`, and `/projects <name> <instruction>` carry out the instruction in the base project, the machine's system project, or the registered project with that name.
3. Resolve the target from the current project's root with `slasher/system/foundation/resolve-project.sh -base`, `-system`, or `<name>`, or `system/foundation/resolve-project.sh` where there is no `slasher/` directory. It prints the target's root.
4. Where the script fails, report its message and do nothing more.
5. Before acting, run the target's loader from the target's root, and follow the rules it prints for the act.
6. Carry out the instruction under the target's root, by the target's conventions. Report what was done and where.
7. A commit in the target waits for the engineer's selection.
8. With a target and no instruction, print the target's root, and act on nothing.
9. Do not change the registry, `slasher.toml`, or `system-project.toml`. Write no project's name into the project the session is in.

## Compression

- 2026-11-02, compressed: checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-11-08, revised: `/projects` with a target carries out an instruction in that project; not re-checked

## History

Until Sun Nov 8 2026 this rule was named projects-lists-the-machines-registry-of-slasher-projects and titled "Projects lists the machine's registry of Slasher projects". Listing was the whole of what `/projects` did, and it acted on no project it listed.

Related:

- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — why the registry stays outside every repository

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:02:06 PM PT
