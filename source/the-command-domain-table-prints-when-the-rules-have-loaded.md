# The command domain table prints when the rules have loaded

**When the session-start read concludes, print the plugin's startup table, word for word, then the current line.** The startup table is `command-table-startup.md`, in the plugin's root directory, `.claude/skills/slasher/`: the startup table's rows, a sentence naming the other commands, and the help line. The current line stands one blank line below it, and ends what the read prints: *Type /current for open and active work.* It names `/current`, which lists the current items, then the current features and experiments. Print it in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

**The tables are built, not written here.** The plugin build joins the command table from each active package's rows, and writes the startup table's sentence from it, so a package that is not active adds no row. `/command-table`, `/;`, and `/commands` print the joined command table, and `/shortcuts`, `/sc`, and `/:` the shortcuts table, each as it stands and with no rule loaded. How a command's rows are written is the a-command-domain-carries-its-rows-of-the-command-table rule's, which loads when a command is written.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Why:** the engineer sees the commands at the moment they can start using them. The startup table is small, so the start of a session fits on the screen. Its sentence still names every command, `/;` prints the full table, and `/slasher help` gives the detail. The current line tells the engineer where to see the work under way, without the time a listing would take at the start of every session.

**How to apply:** at the end of the session-start read, print the plugin's `command-table-startup.md` once, then the current line, and then turn to the engineer's request or wait for one.

## History

Until Fri Nov 13 2026 `/sc` was the only alias of `/shortcuts`. The engineer added `/:`.

Until Tue Nov 10 2026 the help line ended what the read prints. The engineer added the current line below it.

Until Tue Nov 10 2026, for part of that day, `/'` was an alias of `/items`, and its rows named `/items` and read *Lists the current items.* The engineer made `/'` an alias of `/current`.

Until Tue Nov 10 2026 the `/', /items` rows read *Lists the current items, features, and experiments.* in the startup table and *Lists the current items, then the current features and experiments.* in the full table, and the shortcuts table's `/'` row read *Lists the current items and implementations*. The engineer made a bare `/items` list the current items alone, and gave the list of current items and implementations to `/current`.

Until Tue Nov 10 2026 the read ran `/items 10` after the help line, and printed the ten most recently created current items and the current implementations. The engineer removed it, because it made the start of a session take too much time.

Until Tue Nov 10 2026 this rule wrote out the startup table, its sentence, the full command table, and the shortcuts table, with the conventions for every row. The engineer settled that each package carries its rows and the build joins them. The tables moved into the packages and the plugin build, and the conventions for a row moved into the a-command-domain-carries-its-rows-of-the-command-table rule.

Until Tue Nov 10 2026 `/unattended` had no shortcut alias, and its row stood below the `/process` row. The engineer made `/!` its alias, and its row moved up among the shortcut rows.

Until Tue Nov 10 2026, for part of that day, `/???` was the alias of `/estimate-confidence`. The engineer changed it to `/#`.

Until Tue Nov 10 2026 the `/recent` description was *Says what was recently done, and what's next.* The engineer changed it to *Brief summary of recent work, and what's next.*

Until Tue Nov 10 2026, for part of that day, the `/next?` row's description ended with *Equivalent to "what are we doing?" or "what's next?"*. The engineer moved the two questions to its start.

Until Tue Nov 10 2026, for part of that day, `/shortcuts` and `/sc` had no row in the full table. The engineer added one just above the `/load` row.

Until Tue Nov 10 2026 there was no shortcuts table, and no `/shortcuts` or `/sc` command.

Until Tue Nov 10 2026, for part of that day, `/??` was the alias of `/estimate-confidence`, and `/>` the alias of `/clarify`. The engineer replaced them with `/???` and `/??`.

Until Tue Nov 10 2026 the `/next?` row's description ended at *the step that has been interrupted*. The engineer added *Equivalent to "what are we doing?" or "what's next?"*.

Until Tue Nov 10 2026 `/#` was an alias of `/estimate-confidence`, beside `/??`. The engineer removed it.

Until Mon Nov 9 2026 `/<` was the alias of `/clarify`. The engineer replaced it with `/>`.

Until Mon Nov 9 2026, for part of that day, `/>` was the alias of `/next` again. The engineer replaced it with `/>>`.

Until Mon Nov 9 2026, for part of that day, `/???` was the alias of `/command-table`. The engineer changed it to `/;`.

Until Mon Nov 9 2026, for part of that day, `/>>` was the alias of `/next`, and `/>` an alias of `/next?` beside `/?`. The engineer changed `/>>` to `/>`, so `/>` takes the next step and `/?` alone names it.

Until Mon Nov 9 2026 `/?` was the alias of `/command-table`, and `/next?` and `/estimate-confidence` had one shortcut alias each, `/>` and `/#`. The engineer settled `/???` for the table, `/?` for what's next, and `/??` for the estimate, and kept `/>` and `/#` beside them.

Until Mon Nov 9 2026 `/>` was the alias of `/next`, and `/>?` the alias of `/next?`. The engineer settled that `/>>` is the alias of `/next`, and `/>` the alias of `/next?`.

On Mon Nov 9 2026 the `/', /items` row stood for a time below the `/item` row, until the engineer restored it below the `/., /recent` row.

Until Mon Nov 9 2026, for part of that day, the `/', /items` row stood at the top of the full table, below the `/., /recent` row. The engineer moved it below the `/item` row.

Until Mon Nov 9 2026 the full table's `/.`, `/'`, `/features`, `/experiments`, `/projects`, `/release`, and `/load` descriptions opened with *This command*, as the help's do. The engineer removed it.

Until Mon Nov 9 2026, for part of that day, the rows that merged a shortcut alias stood where their commands' rows had stood, and `/?, /commands` was the last row. The engineer moved them to the top, where the alias rows had stood.

Until Mon Nov 9 2026 the full table gave `/?`, `/.`, `/>`, `/<`, and `/#` rows of their own, below the `/slasher help` row, and named `/'` and `/>?` in no row. The `/.` row read *An alias of /items*, though `/.` is an alias of `/recent`. The engineer merged each shortcut alias into its command's row.

Until Sun Nov 8 2026 the startup table's sentence also named `/>`, `/<`, and `/#`, ahead of `/item`.

Until Sun Nov 8 2026 the `/items` row stood below the `/experiment` row.

Until Sun Nov 8 2026 the full table had no `/observation` row.

Until Sun Nov 8 2026 the full table had no `/decision` row.

Until Sun Nov 8 2026 the help line read *Type /help for Slasher's full help, or <command> help for help for a particular command.*

Until Sun Nov 8 2026 the help line read *Type /help for more*.

Until Sun Nov 8 2026 the help line read *For more help, type /help*.

Until Sun Nov 8 2026 no help line followed either table.

Until Sun Nov 8 2026 the `/next?` row read *The next step in the current multi-step process*.

Until Sun Nov 8 2026 the `/next` row read *Proceed to the next step in the current multi-step process*.

Until Sun Nov 8 2026 the table had no `/#` or `/estimate-confidence` row.

Until Sun Nov 8 2026 the `/clarify` row stood below the `/language` row. The engineer moved it above the `/unattended` row.

Until Sun Nov 8 2026 the full table's last row named `/command-table`. The engineer replaced it with its alias `/commands`.

Until Sun Nov 8 2026 the `/unattended` row stood below the `/<` row, above `/item`. The engineer moved it beneath the PROCESS rows.

Until Sun Nov 8 2026 the `/>` row stood below the `/next` row, and the `/<` row below the `/clarify` row. The engineer moved both beneath the `/.` row.

Until Sun Nov 8 2026 the full table had fourteen rows, from `/slasher help, /help` to `/test`, and no row for the PROCESS, PROJECTS, RELEASE, PACKAGES, LANGUAGE, and LOAD domains. The engineer restored the rows the table had before the Sat Nov 7 2026 revision, as written, and added rows for `/next`, `/>`, `/next?`, `/clarify`, and `/<`.

Until Sun Nov 8 2026 the startup table's sentence named `/unattended`, `/item`, `/items`, `/feature`, `/experiment`, `/recent`, `/log`, `/journal`, `/brainstorm`, and `/test`, and the startup table kept the full table's first four rows.

Until Sat Nov 7 2026 the startup table's `/'` row named only `/'`.

Until Sat Nov 7 2026 the startup table's `/.` row named only `/.`.

Until Sat Nov 7 2026 the startup table's `/'` row took the `/items` row's description, *Lists the current items, then the current features and experiments.*

Until Sat Nov 7 2026 the startup table's `/?` row read *Print this table*, as the full table's does.

Until Sat Nov 7 2026 the startup table's `/.` and `/'` rows read *An alias of /recent* and *An alias of /items*, as the full table's do. The engineer gave them the descriptions of `/recent` and `/items`.

Until Sat Nov 7 2026 the session-start read printed the full table. The engineer abridged it to its first four rows, followed by a sentence naming the other commands.

Until Sat Nov 7 2026 the first row named only `/slasher help`. The engineer added its alias `/help` to the row.

Later on Sat Nov 7 2026 the engineer swapped `/.` and `/'` back, so `/.` is again an alias of `/recent` and `/'` of `/items`.

On Sat Nov 7 2026 `/.` was for a time an alias of `/items` and `/'` an alias of `/recent`, after the engineer swapped them.

Until Sat Nov 7 2026 the `/test` row read *Run the project's tests and report on them.*

Until Sat Nov 7 2026 the `/items` row stood below the `/experiment` row, above `/recent`.

Until Sat Nov 7 2026 the `/items`, `/recent`, and `/test` rows opened with *This command* or *These commands*, as the help does.

Until Sat Nov 7 2026 the PROJECTS, RELEASE, and PACKAGES domains had the `/projects`, `/release`, and `/package` rows, below the `/test` row.

Until Sat Nov 7 2026 the LANGUAGE domain had a `/language` row, below the `/package` row.

Until Sat Nov 7 2026 the LOAD domain had a `/load` row, the last in the table.

Until Sat Nov 7 2026 the PROCESS domain had a `/process` row, below the `/recent` row.

Until Sat Nov 7 2026 `/command-table` had the last row of the table. The engineer removed it, and `/?` has the row that prints the table.

Until Sat Nov 7 2026 the `/unattended` row ended *after a plan is accepted*.

Until Sat Nov 7 2026 the table had no `/'` row.

Until Sat Nov 7 2026 `/.` was an alias of `/items`, and its row said so. The engineer made it an alias of `/recent`.

Until Sat Nov 7 2026 `/?` answered *What are we doing?*, and its row said so. The engineer made it an alias of `/command-table`.

Until Sat Nov 7 2026 the table had no `/.` row, and named no alias.

Until Sat Nov 7 2026 the `/?` row stood below the `/recent` row, and `/unattended` stood second.

Until Sat Nov 7 2026 the table had no `/?` row.

Until Sat Nov 7 2026 the `/recent` row named `/brief`.

Until Sat Nov 7 2026 the table had no `/unattended` row, and `/item` stood second.

Until Sat Nov 7 2026 the rows of `/items` and `/brief` named `/report` and `/report brief`, and the read ran `/report 10`.

Until Sat Nov 7 2026 a bare `/slasher` printed the table. It now offers topics to learn about, under the a-bare-slasher-offers-topics-to-learn-about rule, and selecting *Commands* there prints the table.

Until Fri Nov 6 2026 the table had a `/phase` row, below the `/experiment` row.

Until Fri Nov 6 2026 the table opened with the `/item` row, and no row named `/slasher help`.

Until Fri Nov 6 2026 the rows of `/report` and `/report brief` named `/current` and `/work-status`, and the read ran `/current 10`.

Until Fri Nov 6 2026 the read ran `/current 5`, and printed the five most recently created current items.

Until Fri Nov 6 2026 the items printed after the table took no heading of their own.

Until Fri Nov 6 2026 a bare `/slasher` printed nothing, and the table printed only when the rules loaded.

Until Fri Nov 6 2026 the `/process` row named only `/process`. For a time on that day it also named `/current` and `/work-status`, before each took a row of its own. Those rows stood below the `/process` row before they moved above it.

Until Fri Nov 6 2026 only a bare `/slasher` printed the table during a session. `/command-table` did not exist. When it was first added, it had no row in the table.

Until Fri Nov 6 2026 `/command-table` had no alias. The engineer then made `/commands` its alias.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the display the harness prints ahead of the read
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — what the agent prints at the start, and what it does not
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose help the table follows

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:34:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:49:50 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:37:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:32:53 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:36:16 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:52:38 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:55:31 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:56:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:58:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:02:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:03:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:00:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:08:55 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:35:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:36:20 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:00:17 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:04:28 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:17:53 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:27:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:34:55 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:42:33 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:43:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:46:44 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:48:15 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:46:02 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:47:52 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:22:34 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:30:01 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:33:05 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:34:20 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:36:02 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:38:03 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:41:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:49:57 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:57:29 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 1:59:32 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:00:18 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:01:25 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:30:59 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:33:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 2:34:17 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:31:46 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:34:48 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 6:58:17 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:01:58 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:04:23 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 7:07:26 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 8:30:26 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 10:26:09 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 10:53:56 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 12:48:53 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 12:52:41 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:02:10 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:05:30 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 1:09:02 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:36:17 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:41:08 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:42:14 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:44:49 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:46:25 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 11:47:11 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:37:27 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:41:04 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:43:22 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:45:39 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:48:20 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:51:43 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:52:54 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 10:53:54 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:18:35 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:21:33 AM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 9:48:54 PM PT
Changed by Scott Bellware on Tue Nov 10 2026 at 11:45:30 PM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 4:43:31 PM PT
