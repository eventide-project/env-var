# A command domain carries its rows of the command table

**Trigger:** When writing or changing a Slasher command, its help, or a shortcut alias

**A command domain's rows live beside its skill, in `command-table-rows.md`.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. Its row names the domain's help command, and its description is the one under that heading. A domain with no root command of its own name has a skill named for the domain, as `/process` for PROCESS and `/language` for LANGUAGE, and its rows live beside that skill. A package carries the rows of the domains it holds, as `imap` carries `/email`'s.

**One row to a domain, and a few root commands have rows of their own.** `/features` has a row below `/feature`, `/experiments` below `/experiment`, `/decision` below `/log`, `/note` below `/decision`, `/notes` below `/note`, and `/packages` below `/package`, each in its domain's rows file. `/clarify, /??`, `/idk`, `/ask-again, /aa`, `/estimate-confidence, /%`, `/unattended, /!`, `/shortcuts, /sc, /:`, and `/load` have rows of their own, beside their skills, in that order at the bottom of the table. The PHASE domain has no row. Write no other root command, alias, or subcommand into a row.

**A description may open with *These commands*, as the help does.** No description opens with *This command*. Keep each row in line with the help: when a domain's heading, its help command, or its description changes in the help, change its row in the same commit.

**The table's top rows are foundation's.** `plugin/command-table-header.md` holds the heading and the rows that open the table: `/slasher help`, then each command with a shortcut alias. Their order is `/commands, /;`, `/recent, /.`, `/current, /', /c`, `/next, /proceed, /..`, and `/next?, /?`. A command of another package with a shortcut alias has its row beside its skill, as `/push, /p` in the `git` package, and `/reprint-and-review, /rr` in the `language` package.

**A row with a shortcut alias names the command first and the alias after it, as `/recent, /.`.** A command with an alias and a shortcut names the alias, then the shortcut last, as `/next, /proceed, /..`. A command with two shortcuts names both, in the order they were given, as `/current, /', /c`. This holds in the full table and in the startup table alike.

**The help's order is the table's order.** `plugin/help-order` lists the domains in the order the help and the table both follow. A domain it does not list follows, in name order. Add a new domain to it where its row belongs.

**A shortcut alias changes three files together.** Change its row in `command-table-header.md` or beside its skill, its row in `plugin/shortcuts.md`, and `plugin/command-table-startup.md` where it names the alias, in the same commit. `plugin/shortcuts.md` is foundation's, and lists another package's shortcut too, as `/p`.

**The startup table's four rows stand in `plugin/command-table-startup.md`.** The `/slasher help` row also names `/help`. The `/commands, /;` row reads *Print the list of Slasher commands*. The `/recent, /.` row takes `/recent`'s description from the help. The `/current, /', /c` row reads *Lists the current items, features, and experiments.* The plugin build writes the sentence below them, naming every other command, so the sentence is never written by hand.

**Each table is followed by the help line:** *Type /help for all of Slasher's help, or /<command> help for one command's.* The plugin build adds it.

**Why:** a package that is not installed should add no row, and a row kept beside its command changes with it. The order and the wording stay consistent because one rule states them, read when a command is written, not at every session start.

**How to apply:** when you write or change a command, its help, or a shortcut alias, change its row in its domain's `command-table-rows.md`, or foundation's plugin files for the top rows and the shortcuts, and run `./compile.sh` so the plugin's tables are rebuilt.

## History

Until Fri Nov 13 2026 the `/shortcuts` row read `/shortcuts, /sc`. The engineer added `/:`.

Until Fri Nov 13 2026 `/reprint-and-review` had no row.

Until Fri Nov 13 2026 the `/current` rows named only `/'`. The engineer gave `/current` a second shortcut, `/c`.

Until Fri Nov 13 2026 the shortcut of `/unattended` was `/#`, from Thu Nov 12 2026. The engineer changed it back to `/!`.

Until Fri Nov 13 2026 `/packages` had no row of its own.

Until Fri Nov 13 2026 `/notes` had no row of its own.

Until Fri Nov 13 2026 `/idk` had no row of its own.

Until Thu Nov 12 2026 the rows named `/estimate-confidence, /#` and `/unattended, /!`. The engineer changed the shortcut of `/unattended` to `/#`, and of `/estimate-confidence` to `/%`.

Until Thu Nov 12 2026 every shortcut alias was foundation's, and only the top rows carried one.

Until Thu Nov 12 2026 the shortcut of `/next` was `/>>`. The engineer changed it to `/..`.

Until Wed Nov 11 2026 the top rows named `/next, />>`, where they now name `/next, /proceed, />>`. For part of that day they named `/proceed, />>, /next`, and a command with two aliases named the shortcut first.

For part of Wed Nov 11 2026, `/!` was an alias of `/next`, `/#` the alias of `/unattended`, and `/%` the alias of `/estimate-confidence`, and a command with two aliases named both. The engineer reverted it, since `/>>` already proceeds.

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Wed Nov 11 2026 the rows of `/??, /clarify`, `/#, /estimate-confidence`, `/!, /unattended`, and `/.., /ask-again` stood among the table's top rows, in `plugin/command-table-header.md`.

Until Wed Nov 11 2026 a row of the full table named the shortcut alias first and the command after it, as `/., /recent`. The startup table's rows were the reverse.

Until Wed Nov 11 2026 the shortcut alias of `/ask-again` was `/..`.

Until Wed Nov 11 2026 at 10:37:48 AM PT it was `/,`.

Related:

- the the-command-domain-table-prints-when-the-rules-have-loaded rule — the startup table, printed at the end of the session-start read
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin the tables are built into

---

Authored by Scott Bellware on Tue Nov 10 2026 at 9:49:16 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:45:30 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:04:38 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:06:56 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:30:49 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:43:37 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:45:55 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:33:27 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:37:48 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 12:58:17 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:03:09 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:15:04 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 1:20:46 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:49:31 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:25:24 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:48:54 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 12:01:15 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 2:56:41 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:01:31 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:02:14 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 3:39:16 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:16:43 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:43:31 PM PT
