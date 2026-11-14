# The Slasher skills are delivered as a plugin named slasher

**Trigger:** When writing a Slasher skill, or installing, refreshing, or activating the packages that carry skills

**The Slasher skills reach a project as one skills-directory plugin, called Slasher and named `slasher`.** It sits at `.claude/skills/slasher/` in the project, with a `.claude-plugin/plugin.json` whose `name` is `slasher` and whose `displayName` is `Slasher`. The `name` is the namespace every skill is typed under, and the `displayName` is what Claude Code shows in its place. A skill is typed `/slasher:<command>`, as in `/slasher:log`, and `/<command>` where no other command on the machine claims the name.

**Each package carries its own skills**, under `skills/` in the package: `skills/<command>/SKILL.md`, one directory per root command or alias. A skill belongs to the package whose rules it hands its act to. A command whose name cannot be a directory's, as `/.`, or whose directory would show as the same name as another's, as `/'` beside `/?`, takes a directory named for it in words, such as `dot` or `apostrophe`, and the skill's `name` field gives the command.

**The plugin directory is assembled from foundation's `plugin/` directory and the active packages' skills.** `plugin/` holds the plugin's manifest and its hooks: the session-start hooks, which the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule governs, and the hook that reports a branch switch, which the `git` package's announce-a-branch-switch-in-a-bordered-block rule governs. `assemble-plugin.sh` copies it, then each active package's `skills/`, into `.claude/skills/slasher/`, and leaves out a deactivated package's. `install.sh` and `refresh-packages.sh` run it in a consuming project, and `compile.sh` runs it in the Slasher authoring source. A package activated or deactivated takes its skills with it at the next assembly.

**The plugin directory is committed with the project**, as `.claude/settings.json` is, so every engineer who clones the project has the skills and the hooks. It is assembled rather than edited: a change to a skill is made in its package, and reaches the plugin at the next install or refresh.

**A skill's body stays thin.** It reads the words typed, loads the rule that governs the act with `load-rules.sh`, and follows it, per the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule. Where a script already prints the instruction the act follows, the skill runs that script and follows what it prints, so the instruction has one text. `/load` runs `session-start.sh instruction`.

**Why:** a plugin gives the skills one namespace, so a clash with another plugin's command is kept apart. Carrying each skill in its package means a deactivated package's commands go with its rules, and the assembled directory means a project needs nothing beyond the packages to have them.

**How to apply:** write a skill in its package's `skills/<command>/SKILL.md`, thin, handing its act to a rule. Assemble `.claude/skills/slasher/` from foundation's `plugin/` and the active packages' skills at install and refresh, with `plugin.json` giving `name` as `slasher` and `displayName` as `Slasher`, and commit it. Edit no skill in the assembled directory.

**Each command domain's help command carries the domain's help**, as `help.md` beside its `SKILL.md`: that domain's section of the help text. `/<command> help` prints it, as `/log help` prints the LOG section. A skill that is not its domain's help command carries no `help.md`. A domain with no root command of its own name, such as PROCESS or LANGUAGE, has a skill that takes only `help`, as `/process` and `/language`. `/slasher help` prints every active domain's help together, in the order of the help text. A bare `/slasher` offers topics to learn about, under the a-bare-slasher-offers-topics-to-learn-about rule.

## Compressed

1. The skills reach a project as one skills-directory plugin, called Slasher, at `.claude/skills/slasher/`, whose `.claude-plugin/plugin.json` gives `name` as `slasher`, the namespace, and `displayName` as `Slasher`, the name shown. A skill is typed `/slasher:<command>`, as in `/slasher:log`, or `/<command>` where no other command claims the name.
2. Each package carries its own skills, as `skills/<command>/SKILL.md`, one directory per root command or alias. A skill belongs to the package whose rule it hands its act to. A command whose name cannot be a directory's, as `/.`, or whose directory would show as the same name as another's, as `/'` beside `/?`, takes a directory named for it in words, such as `dot` or `apostrophe`, and gives the command in the skill's `name` field.
3. `assemble-plugin.sh` builds `.claude/skills/slasher/` from foundation's `plugin/` directory, which holds the manifest and the hooks, and the active packages' skills, leaving out a deactivated package's. `install.sh` and `refresh-packages.sh` run it, and `compile.sh` in the Slasher authoring source.
4. Commit the assembled directory, as `.claude/settings.json` is committed. Change a skill in its package, never in the assembled directory.
5. A skill's body stays thin: it only reads the words typed, loads the rule governing the act with `load-rules.sh`, and follows it. Where a script already prints the instruction the act follows, the skill runs it and follows its output instead, as `/load` runs `session-start.sh instruction`.
6. Each command domain's help command carries the domain's help, as `help.md` beside its `SKILL.md`: that domain's section of the help text. `/<command> help` prints it. A skill that is not its domain's help command carries no `help.md`.
7. `/slasher help` prints every active domain's help together, in the order of the help text. A bare `/slasher` offers topics to learn about.
8. A domain with no root command of its own name, such as PROCESS or LANGUAGE, has a skill that takes only `help`, as `/process` and `/language`.

## Compression

- 2026-11-02, compressed: checked: 18 directives, 16 kept, 2 less precise, 0 lost, 1 repair; re-checked: 18 directives, 16 kept, 2 less precise, 0 lost. Left less precise: the reason the assembled directory is committed, and when a changed skill reaches the plugin, which follows from the assembly point
- 2026-11-03, revised: each skill carries its own help; checked: 18 directives, 16 kept, 2 less precise, 0 lost. Left less precise: the name collision's scope on the machine, and the reason the directory is committed
- 2026-11-03, revised: the plugin is called Slasher and named slash; checked: 22 directives, 20 kept, 1 less precise, 1 lost, 0 repairs. Left less precise: the reason the directory is committed. Left lost: the reason one plugin is used, a shared namespace, which constrains nothing the one-plugin directive does not already require
- 2026-11-03, revised: plugin.json gives `name` as the namespace and `displayName` as Slasher, the name shown; checked: 18 directives, 16 kept, 2 less precise, 0 lost, 0 repairs. Left less precise: the reason the directory is committed, and that assembling is done by copying, which assembling already requires
- 2026-11-03, revised: the plugin is named slasher, a term swap the engineer settled; not re-checked
- 2026-11-03, revised: a skill may run a script that prints its act's instruction; checked: 18 directives, 17 kept, 1 less precise, 0 lost. Left less precise: the name collision's scope on the machine, as in earlier checks
- 2026-11-04, revised: the plugin carries foundation's plugin/ directory, with the session-start hooks, and assemble-plugin.sh builds it; checked: 25 directives, 21 kept, 4 less precise, 0 lost, 1 repair, the notice rule added to Related; re-checked: 25 directives, 20 kept, 5 less precise, 0 lost. Left less precise: that assembling copies plugin/ before the skills, that activation takes effect at the next assembly, the reasons the directory is committed and a skill runs a script, and that a changed skill reaches the plugin at the next install or refresh, each following from what the compressed text states
- 2026-11-05, revised: `/slasher help` prints the full help, and a bare `/slasher` does nothing, as the engineer directed; not re-checked
- 2026-11-06, revised: the plugin's hooks include the branch-switch hook; checked: 24 directives, 21 kept, 3 less precise, 0 lost, 0 repairs. Left less precise: that no other command on the machine claims the name, and the reasons the directory is committed and a skill runs a script, each as the 2026-11-04 check left them
- 2026-11-06, revised: each command domain's help command carries the domain's help, and `/process` and `/language` take only `help`; checked: 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-11-06, revised: the NEXT domain is named PROCESS, a term swap the engineer settled; not re-checked
- 2026-11-07, revised: a bare `/slasher` offers topics to learn about, in place of doing nothing, as the engineer directed; not re-checked
- 2026-11-07, revised: `/?` carries its act in its own body, the one skill that does, as the engineer directed; not re-checked
- 2026-11-07, revised: a command whose name cannot be a directory's takes a directory named for it in words; not re-checked
- 2026-11-07, revised: `/?` no longer carries its act in its own body, and a command whose directory would show as another's name takes a directory named in words; not re-checked

## History

Until Sat Nov 7 2026 `/?` carried its act in its own body, answering *What are we doing?*. It is now an alias of `/command-table`, and loads that rule.

Until Sat Nov 7 2026 every skill's directory was named for its command.

Until Sat Nov 7 2026 every skill loaded the rule that governs its act, or ran a script that prints it. The engineer made `/?` carry its prompt in its own body.

Until Sat Nov 7 2026 the rule said a bare `/slasher` does nothing, though it had printed the command domain table since Fri Nov 6 2026. It now offers topics to learn about.

Until Fri Nov 6 2026 each skill carried its own help, as `help.md` beside its `SKILL.md`, and `/<command> help` printed that command's own section.

On Thu Nov 5 2026 a bare `/slasher` printed the full help, until the engineer moved it to `/slasher help` the same day.

Until Wed Nov 4 2026 the plugin held only the skills and its manifest, which `install.sh` wrote, and `install.sh` assembled it itself.

Until Mon Nov 2 2026 no rule said where a skill's help came from.

Until Tue Nov 3 2026 the plugin was named `we`, at `.claude/skills/we/`, and a skill was typed `/we:<command>`. The rule was named the-waytide-skills-are-delivered-as-a-plugin-named-we.

From Tue Nov 3 2026 the plugin was named `slash`, at `.claude/skills/slash/`, and a skill was typed `/slash:<command>`, until it was named `slasher` the same day. The rule was named the-waytide-skills-are-delivered-as-a-plugin-named-slash.

Related:

- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help rule — the thin skill
- the a-project-declares-which-installed-packages-are-active rule — the active packages
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — the session-start hooks the plugin carries
- the `git` package's announce-a-branch-switch-in-a-bordered-block rule — the branch-switch hook the plugin carries

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 10:38:55 AM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 2:24:30 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 2:41:06 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 2:55:18 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 3:41:02 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:37:47 AM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:07:04 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:53:55 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:33 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:59:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:16:16 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:00:17 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:34:55 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:40:29 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:46:44 AM PT
