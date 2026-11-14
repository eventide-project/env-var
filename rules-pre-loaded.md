# A package's vocabulary holds its terms, and the most specific one decides

Source: system/foundation/source/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md

1. A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces.
2. It is binding.
3. Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue, wherever Slasher's prose is written.
4. This rule governs using a vocabulary. Writing one, what it holds, and where a term goes are the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule's, which loads when a vocabulary file is written.

## Which vocabulary decides

1. Four levels hold terms, and a word can appear in more than one.
2. They stand in this order, from the most general to the most specific, which decides:
   1. **The STE dictionary**, and Slasher's reserved terms where the approved word means something else. The `language` package's slasher-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
   2. **The `language` package's vocabulary**: the terms and substitutions that belong to no domain. The `language` vocabulary says so itself.
   3. **An individual package's vocabulary**: the terms and substitutions of one domain.
   4. **The project's own vocabulary**, in `slasher/local/vocabulary.md`, which a project writes for itself.
3. When a word appears in two vocabularies, the more specific one decides.

## A project's own vocabulary binds

1. `slasher/local/vocabulary.md` is read at session start, with `slasher/system/` and `slasher/local/rules/`. That read makes it binding.
2. `session-start.sh` names it in the read instruction. The `AGENTS.md` bootstrap names it too.
3. It is optional, and its absence is not a defect.

## Specialization is not conflict

1. A package can narrow a general term rather than contradict it. The narrower entry rests on the general one and does not displace it.
2. Example: `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` adds that the actuation is written before any implementation.

# A paragraph is one line, and the reader's editor wraps it

Source: system/foundation/source/a-paragraph-is-one-line-and-the-readers-editor-wraps-it.md

1. Write each paragraph as a single line. This holds for vocabulary entries too.
2. Insert no newline to hold a column width.
3. Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen.
4. Re-wrap nothing after an edit.

## What still stands on its own line

1. A structural element is not prose and keeps its own line.
2. Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.
3. A list item is one line, however long.
4. Fold a list item's continuation into the item rather than leaving it hanging under it.
5. Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it.
6. Do not join the footer lines. They are a running history, and joining them would lose the record.

# A process question and its answer are logged

Source: system/foundation/source/a-process-question-and-its-answer-are-logged.md

1. Log every process question put through the selection interface, with the engineer's answer.
2. A process question asks the engineer to decide how the work is conducted or what it settles. Examples are *Human in the loop*, the working location, the verdict question, *Accept the plan?*, a wording, and a design.
3. A mechanical question is the opposite of a process question. It confirms an act whose outcome is already settled, such as a commit, a push, a merge, a branch deletion, or a worktree removal.
4. Do not log a mechanical question.
5. Mark a process question by setting the selection's `metadata.source` to `decision`, in the same call that asks the question.
6. Set no marker on a mechanical question.
7. The plugin's `PostToolUse` hook on `AskUserQuestion` runs foundation's `process-question-log.sh`. It writes one log entry to `slasher/local/logs/log/` for each marked question that was answered, and nothing for an unmarked one.
8. Do not write these entries yourself.
9. Each entry is an ordinary log entry, with `**Tags:** [decision]` under its title. Its title is the question's first line and the engineer's answer, as in `# Accept the plan? — Accept, selected by the engineer`.
10. Its body holds the question, the options with their descriptions, the answer, and any notes the engineer added.
11. Commit the entries the hook writes, in the same commit as the change they bear on or separately with a `Log:` prefix.

# A project declares which installed packages are active

Source: system/foundation/source/a-project-declares-which-installed-packages-are-active.md

## Declaring a set

1. A project may declare a package set.
2. The packages outside a declared set are deactivated.
3. Where no set is declared, every installed package is active, and nothing reports it.

## The record

1. A declaration is a record under `slasher/local/`.
2. Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `slasher/local/2026-08-23T09-30-00Z-content-package-set.md`.
3. A new declaration writes a new record.
4. A new declaration edits no existing record.
5. At session start, read the record with the latest prefix. It holds, and the earlier ones are history.
6. Reverting is a declaration naming `default`.

## Three lines carry it

1. A record without the first two lines is not a declaration.

```
- **Package set:** content
- **Packages:** foundation, git, journal, language, versioning
- **Inactive:** design-by-efferent, testing
```

2. `**Package set:**` is what the engineer declared: a set name, package names, or both, in the grammar `install` takes.
3. `**Packages:**` is what that resolved to, recorded when declared rather than computed at session start.
4. `**Packages:**` is authoritative.
5. A package installed later is in neither line, so it stays inactive until a new declaration takes it up.
6. `**Inactive:**` is what was installed and not active then.
7. `**Inactive:**` is recorded, not inferred, so the record states the whole state it was made against.

## An include activates what it names

1. Where an active package's README includes another package, that package is active, named or not.
2. An include states a dependency, and `install` already treats it so.

## A deactivated package is listed, not read

1. The loader does not print a deactivated package's rules at session start.
2. It prints the package's name in a `DEACTIVATED` section, with the command that loads it: `slasher/system/foundation/load-rules.sh --package <name>`.
3. The read is still unconditional. The declaration decides what it holds.
   Follow only the active packages' rules.
4. Where the engineer reactivates a package during the session, run its command and follow its rules from then on. No restart is needed.
5. `refresh-packages.sh` refreshes a deactivated package like any other, so nothing loaded is stale.

## What is printed

1. Print the packages at the head of the response that carries the read, because that text renders markdown.
2. The session-start notice and the startup display print none of it.
3. List every installed package, and hide none.
4. Show active packages in bold and deactivated packages in italic.
5. Follow the list with the set's name: `package set: content`.
6. Close with a count line: `(5 active of 8 installed)`.
7. The hidden-record rule does not apply, because nothing is withheld.

## When nothing is printed

1. Where no set is declared, print nothing about a set, not even a line saying so.
2. A declaration of `default` prints nothing where it deactivates nothing.
3. A declaration of `default` does print where the project holds a package that `default` does not name.

## Declaring during a session

1. A set declared during a session takes effect at the next session.
2. A declaration does not unload rules already read.
3. When the engineer declares a set, write the record.
4. Then say that the deactivated packages' rules stay in force for this session.
5. Also say that Claude must be restarted for those rules to stop applying.

## Activating or deactivating one package

1. `/package activate <package>` and `/package deactivate <package>` write a new declaration that changes the set by one package.
2. Its `**Package set:**` line names the earlier set and the change, as `content, +testing` or `default, -design-by-efferent`. Its `**Packages:**` and `**Inactive:**` lines record what that resolves to.
3. A package already in the state asked for is left as it is, and nothing is written.

# A project does not name its downstream consumers in its own files

Source: system/foundation/source/a-project-does-not-name-its-downstream-consumers-in-its-own-files.md

1. A project's own files do not name the projects that consume it.
2. This covers the installed packages under `slasher/system/`, the working state under `slasher/local/`, and the code and documentation beside them.
3. It holds for a library, a package, a rule system, or anything else other projects install.
4. A consumer is a project named only because it installed this one. That is the whole test.
5. Do not add a list of consumers for convenience.

## What it does not reach

1. The test is why the name is there, not whether the named project consumes this one.
2. A project named because a decision was about it may be named. Leave its name.
3. A project that is part of this project at large may be named, such as Slasher's `website`.
4. A reference project the method is shown through may be named, such as Slasher's `constant`.
5. Leave a historical record that already names a consumer as written. It is not revised to suit a later convention.
6. The one exception is disclosure, governed by the disclosure rule, not this one. A consumer's name already in a record is that rule's concern.
7. That correction removes the name and keeps every claim true by stating it at a lower resolution.
8. The engineer is the authority on what counts as a consumer.
9. This rule governs what is written from now on. It does not license going back through the records.

## Where the operational need goes instead

1. Where a tool must reach the consuming projects, such as to survey or refresh them, it reads per-machine configuration outside the repository.
2. That configuration lives under `~/.config/`, not in a gitignored file inside the repository.
3. Commit the tool. It names no consumer and only reads the configuration.

# A project's binding rules are recorded in its packages and its local rules directory

Source: system/foundation/source/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md

## Where binding rules live

1. The project's binding rules are read at the start of every session and followed.
2. Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like.
3. Binding rules live in two directories, separated by source.
4. **`slasher/system/`** holds the installed system packages, each in its own subdirectory (`slasher/system/foundation/`, `slasher/system/language/`, …).
5. Packages are installed with `git subtree` and refreshed by pulling.
6. A package's `vocabulary.md` glossary is part of its rules, and cannot be applied unread.
7. **`slasher/local/rules/`** holds the project's own local rules, one per file. Every rule, system or local, is kept one per file.
8. Local rules are the project's own conventions, not installed from a package.

## Reading the rules

1. At the start of a session, run `slasher/system/foundation/load-rules.sh` and read its whole output. Follow the rules it prints.
   It prints each package's `rules-pre-loaded.md` and `vocabulary.md`, `slasher/system/foundation/` first, then the rules in `slasher/local/rules/`, `slasher/local/vocabulary.md`, and the journal.
2. Do not read a package's `source/` directory or its `README.md` at session start.
3. A package's `source/` holds its full rules, one per file. Edit a rule there.
4. A package's `rules-pre-loaded.md`, at the package root, holds each rule's title, the path of its source, and its compressed text. `./compile.sh` writes it.
5. The package's `rules-pre-loaded.md` is what is read.
6. A package's `rules-on-demand.md`, at the package root, holds each rule whose source carries a `**Trigger:**` line under its title, with its trigger. `./compile.sh` writes it.
7. The loader does not print an on-demand rule. It prints the rule's trigger and the command that loads it: `slasher/system/foundation/load-rules.sh <rule-name>`.
8. When the act a trigger names comes up, run that command and follow the rule it prints before acting.
9. Give a rule a trigger only where it names a discrete act the agent itself takes, such as running a command or creating or editing a named kind of file, so the agent cannot reach the act without knowing it, and where a missed load is cheap and visible. A trigger naming a judgment about a situation, such as giving a summary or working with tests, is not safe, and its rule stays pre-loaded.
10. The rules override default behavior where they conflict.
11. Explicit user instructions still win over the rules.
12. Read `slasher/system/foundation/` first. It defines the system.
13. The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule settles where `slasher/local/vocabulary.md` sits and why.
14. `rules/` may not exist. Its absence is ordinary.

## Rules and work artifacts

1. Rules are kept separate from work artifacts.
2. `slasher/local/rules/` holds only rules. `slasher/system/` holds only the packages' rules and what packages them: each package's `README.md`, `source/`, and `LICENSE`, its `vocabulary.md` where it has one, and its scripts. Neither holds any of the project's working state.
3. The project's working state lives beside `rules/` under `slasher/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`.
4. Work with working state as its own conventions describe.
5. Do not read working state as binding rules at session start.
6. `slasher/local/vocabulary.md` sits beside working state but is not working state. It is the one thing there that binds.

## Purpose of a rule

1. A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category.
2. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-may-establish-a-mindset-rather-than-a-mechanic rule.

## Format

1. A rule is frontmatter-free markdown.
2. It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines.
3. Name a system package rule with a dash-separated, lower-case name.
4. Give a project's own local rule in `slasher/local/rules/` the ISO-8601-UTC datetime prefix in its file name. See the file-names rule.
5. Put a rule's history in a `## History` section, placed before `Related:`.
6. History is what the rule used to say, when it changed, what it was named, and where it sat.
7. The compiler leaves `## History` out of the package's rules file. The full rule in `source/` keeps it.
8. Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is.
9. A paragraph leads with its claim in bold. The sentences after it support that claim.
10. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim.
11. The six-sentence limit is STE Rule 6.6. See the language package's slasher-prose-conforms-to-the-ste-writing-rules rule.

## Recording a new local rule

1. When the user states a rule, or a decision sets a rule for future work, add it as a new file in `slasher/local/rules/`.
2. Add a matching one-line entry to `slasher/local/logs/log/`.
3. Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `slasher/local/rules/`.
4. When the project settles a term or a substitution of its own, write it in `slasher/local/vocabulary.md`. Do not write it as a rule.
5. Prefer a note over a rule when the thinking has not stabilized. See the notes rule.

## Referencing a rule

1. Reference a rule by its name, never by its file path.
2. Write "the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule", not `slasher/system/testing/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md`.
3. Rename a rule when its name stops saying what it says. Its filename changes with it, so a recorded path then points at nothing.

## Removing a rule

1. Search for what cites the rule, and reconcile the live artifacts that cite it.
2. Then remove the rule and log the removal.
3. Where the rule is stopped rather than superseded, tag its log entry `[suspended]`.
4. In a `[suspended]` entry, name what the suspension cost and what else changed. See the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule.
5. Drop a removed rule from every `Related:` list. Do not mark it, such as with `(deleted)`.
6. The log entry is the durable trace of the removal. An item is never deleted. Its state changes and its record is kept.

# A project's durable context is recorded in its committed artifacts, never in an agent memory store

Source: system/foundation/source/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md

1. Write every piece of context meant to survive a session into `slasher/`.
2. The rules bind that context, the working directories hold it, and git carries it.
3. An agent memory store is not one of those places.
4. Do not hold in a store anything that belongs in one of those places.
5. A binding convention is a rule in `slasher/local/rules/`. A decision is a one-line entry in `slasher/local/logs/log/`.
6. Thinking that has not stabilized is a note in `slasher/local/items/`.
7. The project's planning goes in an item.
8. Postponed work is a deferred item.
9. What the project stopped doing is suspended.
10. Each artifact follows its own convention.
11. A note on how the project's code is arranged belongs in an artifact. So does what was decided last week, or which approach was rejected.
12. Do not create an agent memory store.

## What it does not reach

1. A fact about the engineer rather than the project is outside this rule.
2. How the engineer wants to be answered, and what they want never offered, are such facts.
3. A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.
4. A preference not yet settled as a rule is outside this rule. Ask about it at once rather than holding it.
5. The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository.
6. Harness working state is not project context and is no substitute for an artifact.

# A reply that writes a record ends with the record's path

Source: system/foundation/source/a-reply-that-writes-a-record-ends-with-the-records-path.md

1. Before sending a reply, check whether it wrote a record. Where it did, end the reply with the line *Recorded in:*, then a list of each record's full, absolute path, as the file now stands. The path carries the state suffix where the record has one. Under the home folder, write `~/` in place of the home folder.
2. A record is an item, an implementation record, a rule, a log entry, a journal entry, a work session record, a loop record, or any other record the agent writes to disk.
3. Write each path as a list item, `- ` and then the path in backticks, so the terminal shows it in color. Put nothing else on the line: no label, and no sentence.
4. Where the reply wrote several records, give each path its own list item. Put the record the reply is about last, after its log entries and any other record written beside it. List a renamed record by its new path.
5. Do not list a record the agent did not write, such as a log entry a hook writes.
6. List a record written in a worktree by the worktree's path.
7. A reply that wrote no record ends as it otherwise would.

# A status report prints a fixed whole-project report

Source: system/foundation/source/a-status-report-prints-a-fixed-whole-project-report.md

1. When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order.
2. The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them.
3. Identify those records without naming a directory or a kind.
4. Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note.
5. Mark the next task in the task table.
6. Include any out-of-sequence extras already built in the task table.
7. Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist.
8. Waiting items are off the task line until the wait ends.
9. Order waiting items by their `**Priority:**` rank where they carry one.
10. Do not list a hidden record in the waiting work table.
11. Part 3, **Slasher-directory orientation**: a basic map of `slasher/`.
12. The map shows that `slasher/system/` holds the installed rule packages (e.g. `foundation/`, `language/`).
13. The map shows that `slasher/local/rules/` holds the project's own local rules.
14. The map states that both are binding and both are read at session start.
15. The map shows the contemporaneous, historical records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `slasher/local/`.
16. The map shows the work-artifact directories `items/`, `implementations/`, and `migration/`, also under `slasher/local/`.
17. The orientation says how to work with the directory. Rules are enforceable conventions.
18. The log is title-only ISO-8601-UTC decision entries.
19. A rule typically pairs with a log entry.
20. An item holds the task checklist where it sequences work.
21. A `**Waits for:**` line marks work that is not yet actionable.
22. Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries.
23. Keep the brief to a few lines, not an exhaustive list.
24. Part 5, **Test suite**: this part is convention-aware of the testing package.
25. If the project has adopted the testing conventions, run the suite and report the count and pass/fail line.
26. Report the suite's context tree two levels deep, rendered hierarchically.
27. Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches.
28. Use an indented tree, such as a fenced block with `├─`/`└─` branches.
29. Stop at two levels. Do not descend into per-assertion contexts.
30. If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail.
31. If the project has no suite, note that there is none.

## A hidden record is counted rather than listed

1. A hidden record is one a report states the number of and does not otherwise show.
2. Omit a hidden record from the table or passage it would ordinarily sit in.
3. Put a line there giving the count and the kind.
4. The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation.

```
3 suspended items
12 suspension log entries
```

5. Hiding applies to any summary of the project's state, not only the fixed status report.
6. That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand.
7. A record hidden from one surface is hidden from all of them.
8. Two kinds are hidden today.
9. A record whose `**State:**` line reads `Suspended` is hidden.
10. A record carrying the `[suspended]` tag is hidden. That is a log entry, per the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule.
11. The two are different records, hidden for the same reason, and take the same treatment. Do not merge them.
12. A later rule may name another kind, and it becomes hidden by saying so.
13. The treatment is fixed: counted, not listed, and named by kind in the count.
14. Show hidden records when they are asked for.
15. *Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing.
16. Never simply drop a hidden record. The count is what separates hiding from omitting.

## The report is rendered from current state

1. Keep each part tight.
2. Read current state before printing.
3. Do not report stale task counts, suite numbers, contexts, or deferred items from memory.
4. Render the parts from current files: the project's items, `slasher/local/logs/log/`, and git.
5. Confirm the suite count and the two-level context tree by running the suite, not by asserting them.
6. Take the two levels from the run's output, not from the `context "…"` declarations in the source.
7. A dynamic context reads as a placeholder in the source, and as its real value in a run.
8. An unnamed test appears in the source and emits no line.

# A time value carries minutes and seconds

Source: system/foundation/source/a-time-value-carries-minutes-and-seconds.md

1. When a datetime written into a file includes a time of day, write that time to seconds.
2. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.
3. This rule governs only the time's resolution.
4. The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation.
5. The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds (see the file-names rule).
6. The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it.
7. A date alone is not a time. A date-only convention, such as a design's **Settled** resolutions, gets no time added.
8. This rule applies only when a time is written.
9. A record's title is the first exception. A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds (see the a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time rule).
10. The title exception covers titles only. It reaches no other written time.
11. A journal entry's filename stamp is the second exception. It stops at the minute (see the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule).
12. A journal filename stamp carries seconds only where the writer stated seconds. Do not supply a clock's seconds.
13. Only these two exceptions exist. Do not assume a third.
14. A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach. The defect is a repeated line within one file, whose entries collide at the same resolution.
15. Never revise a recorded datetime to a resolution it never had, and do not supply minutes or seconds for a past event. Supplying missing minutes or seconds would falsify the record.
16. This rule applies to new values only. Leave coarser values already written as they are.
17. When specifying a new datetime format that includes a time of day, specify it to seconds.
18. This applies to rules, working-state artifacts, log entries, and any other file, except where this rule names an exception.

# Ask at once when the engineer expresses a preference

Source: system/foundation/source/ask-at-once-when-the-engineer-expresses-a-preference.md

1. When the engineer expresses a preference about how the work is done, interrupt the work and ask what it changes, through the selection interface.
2. Do not carry the preference silently, and do not put the question off.
3. Where the preference corrects what the agent just did, fix the output as well.
4. A preference is not a rule until it is written. Held by the agent, it is lost at the session boundary.

## What counts

1. A statement about how the work is done, rather than about the artifact at hand, is a preference. *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each one.
2. A statement about this one artifact, such as *make that sentence shorter*, is an instruction. Carry it out, and do not ask about it.
3. The test is whether it would still hold next week. Where it would, it is a candidate for a rule. Where it would not, it is an instruction and nothing is asked.

## The candidates

1. Each candidate is genuine, and the selection carries only those that apply.
2. An amendment to an existing rule, offered only where a rule covers the subject. It is made in that rule's source, with its History.
3. A new rule, in `slasher/local/rules/`, with the matching `slasher/local/logs/log/` entry.
4. A note in `slasher/local/items/`, where the thinking has not stabilized. It is preferred where there is doubt.
5. Neither, where the engineer does not want the preference recorded. It is taken without argument.
6. Do not ask again in the same session about a preference the engineer declined to record.
7. Record the engineer's own words, not a paraphrase or the agent's reading of them from memory.
8. Deferring is the engineer's choice, not the agent's. Work they want put off, a correction or anything else, they record as an idea.
9. The agent does not put off a preference, or the question about it, on its own.

# Present every prompt to the engineer through the selection UI

Source: system/foundation/source/present-every-prompt-to-the-engineer-through-the-selection-ui.md

1. Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool.
2. This holds for any prompt.
3. Never use a prose question or a hand-typed list.
4. Each genuine candidate is an option.
5. The UI requires at least two options. Do not invent an option to reach that floor.
6. Present every genuine candidate you find.
7. Do not search for options just to fill the second place.
8. Do not say that a lone candidate is the only possibility.
9. Where there is one genuine candidate, offer it and its negative, labelled *Something else — say what to change*. The negative is a real answer, not an invented option.
10. This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations.
11. Keep plain prose for statements, reports, and explanations that do not ask the engineer to choose.
12. Where the engineer escapes a selection, by refusing it, stopping it to clarify, or interrupting it, do not put it again on your own. Say where the work stopped, and wait. Put it again when the engineer asks, as with `/ask-again` or `/aa`, or after a clarification they asked for. Put the next question the work reaches without waiting.

# The command domain table prints when the rules have loaded

Source: system/foundation/source/the-command-domain-table-prints-when-the-rules-have-loaded.md

**When the session-start read concludes, print the plugin's startup table, word for word, then the current line.** The startup table is `command-table-startup.md`, in the plugin's root directory, `.claude/skills/slasher/`: the startup table's rows, a sentence naming the other commands, and the help line. The current line stands one blank line below it, and ends what the read prints: *Type /current for open and active work.* It names `/current`, which lists the current items, then the current features and experiments. Print it in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

**The tables are built, not written here.** The plugin build joins the command table from each active package's rows, and writes the startup table's sentence from it, so a package that is not active adds no row. `/command-table`, `/;`, and `/commands` print the joined command table, and `/shortcuts`, `/sc`, and `/:` the shortcuts table, each as it stands and with no rule loaded. How a command's rows are written is the a-command-domain-carries-its-rows-of-the-command-table rule's, which loads when a command is written.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Why:** the engineer sees the commands at the moment they can start using them. The startup table is small, so the start of a session fits on the screen. Its sentence still names every command, `/;` prints the full table, and `/slasher help` gives the detail. The current line tells the engineer where to see the work under way, without the time a listing would take at the start of every session.

**How to apply:** at the end of the session-start read, print the plugin's `command-table-startup.md` once, then the current line, and then turn to the engineer's request or wait for one.

# The log holds one file per entry, with a one-line title

Source: system/foundation/source/the-log-holds-one-file-per-entry-with-a-one-line-title.md

1. Record the log's entries made during sessions in `slasher/local/logs/log/`.
2. Write one file per entry.
3. Give each entry a one-line title.

## Trigger

1. Write an entry whenever a real decision is made.
2. A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work.
3. Do not wait to be asked.
4. When in doubt, log it.

## Filename

1. Use the ISO-8601-UTC prefix convention of the file-names rule.
2. Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`.
3. Use UTC, never local time.

## Content

1. Start the entry with a `# <title>` that states the decision.
2. Keep the title informative enough to skim.
3. One line is the ordinary case.
4. An entry takes a body only where it carries reasoning that will not fit a title.
5. An abandonment takes a body, giving the reason the work stopped.
6. A body is prose under the title, with no template.
7. A body never holds the work that did not happen, per the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule.
8. An entry that carries tags takes a `**Tags:**` line under the title, separated by a blank line, per the a-record-may-be-categorized-with-square-bracket-tags rule.
9. An untagged entry with no body is one line.
10. A log entry takes no provenance footer.
11. It is exempt from the working-state-artifacts-carry-a-provenance-footer rule, since its filename and commit already carry author and time.

## Commit

1. Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix.
2. Do not hold entries uncommitted.

## Consolidation

1. Never consolidate the log on your own initiative.
2. Do not combine, merge, rewrite, or reformat log files. Treat the log as an append-only record of what was decided and when.
3. Do not propose doing so.
4. Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders.
5. For a readable overview, generate a summary of the log at read time instead.
6. Never write that summary to a file.
7. Give it in the response instead.

## Logging the work under way

1. A bare `/log` writes a log entry for the work the conversation is on. State as its title the decision or finding the work has just reached, with a body where the reasoning will not fit.
2. Where nothing has been reached, say so and write nothing. Where it is unclear which decision is meant, ask, through the selection interface.
3. The entry follows every convention of an entry the engineer dictates.

# The migration directory holds the plans for moving or restructuring content

Source: system/foundation/source/the-migration-directory-holds-the-plans-for-moving-or-restructuring-content.md

1. `slasher/local/migration/` holds migration records.
2. A migration record is the execution plan for moving or restructuring content, and the record of how the move actually went. A migration is a structural change: content moved across a repository boundary, or the layout of a project's files changed within one.
3. Plan and record here any content leaving this repository for another, or arriving from one, and any change to the structure content sits in.
4. Plan a move here when content ends up under a different root, or in a different structure.
5. Examples: a library extracted into its own repository, or work moved to a project that will own it.
6. Further examples: one repository split into several, several merged into one, existing conventions migrated into an installed system, or a directory renamed or regrouped.
7. A change to a norm or standard that existing content must be conformed to is a migration too: a tag renamed, a term substituted, or a format changed, where records already written carry the old form. Example: the `[work-item]` tag becoming `[work]`, in this repository or in a consuming project.
8. Do not use an ordinary item for a migration.
9. An item sequences a build, against something this repository settled.
10. A migration plan sequences a change to where existing content lives, or to the form it is written in. Across repositories, its increments land in two.
11. Its order matters because content is unavailable or duplicated in between, a reference to the old place breaks until it is reconciled, and content in the old form does not match its rules until it is conformed.
12. Across repositories, the plan is not finished when this repository's part is done.
13. A migration may realize a settled item, or be mechanical enough to need none.
14. A migration record is one document, not entries that accrue like the contemporaneous, historical records under `logs/`.
15. Revise the record while the migration runs.
16. Write it before moving content across a repository boundary, restructuring where it lives, or conforming it to a changed norm or standard.
17. Use the same frontmatter-free markdown as rules: a `# <title>`, then prose.
18. State the source and destination outright: the repositories, or the old and new places within one.
19. State the increments in order.
20. State what is true in between: what is duplicated, what is unavailable, and what is authoritative while the move is under way.
21. Record what actually happened against the plan as the work proceeds.
22. Keep the record after the content has moved. Do not delete it on completion.
23. End the file with the `Authored by … / Changed by …` footer, per the working-state-artifacts-carry-a-provenance-footer rule.
24. The filename follows the ISO-8601-UTC prefix convention of the file-names rule.
25. Records written before this convention reached a project keep their names. A datetime is not revised to a resolution it never had.

# The work-sessions directory holds one record per work session

Source: system/foundation/source/the-work-sessions-directory-holds-one-record-per-work-session.md

1. `slasher/local/logs/work-sessions/` holds work session records.
2. A work session record is the chronological narrative of one discrete work session between an engineer and Claude.
3. A work session is a unit of the engineer's work. It may last hours, a day, or longer.
4. The discrete piece of work sets a work session's boundaries, not a fixed clock.
5. A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order.
6. It defines settled vocabulary as that vocabulary arises.
7. It is written for a person to read. Its job is orientation and reasoning, not truth-of-record.
8. It is not the source of truth. The durable records are authoritative.
9. The durable records are the binding rules (`slasher/system/`, `slasher/local/rules/`), the items (`slasher/local/items/`), the log (`slasher/local/logs/log/`), and the implementation records (`slasher/local/implementations/`).
10. The record points to the durable records throughout. It does not restate them.
11. The record keeps the reasoning behind each fork in the work. It ties the durable records together as a narrative and keeps the arc.
12. Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative.
13. Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work.
14. A trivial work session needs no record. A record is not required for every session.
15. Also propose it when the agent concludes a feature, an experiment, or a phase, or takes an item to Done, Realized, Abandoned, or Superseded.
16. When the agent raises the question of recording, it asks through the AskUserQuestion selection UI, not as a prose question. The prompt offers three options, each naming a **work session record**: **write a new work session record**, **amend the previous work session record**, or **don't write a work session record**. The amend option names the previous record in a few words.
17. The engineer's selection decides.
18. The prompt says "work session", never the shortened "session".
19. A direct instruction from the engineer to write or amend a record needs no prompt.
20. Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a work session record

1. Title the record `# Work Session — <name> (<date>)`.
2. Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them.
3. The parts appear in the order below.
4. **Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z.
5. **Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth.
6. **Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order.
7. Each section states what was asked and concluded at that step.
8. Each section defines settled vocabulary as it arises.
9. Each section points inline to the durable records that step produced.
10. **Takeaways**: the settled conclusions, compressed to a few bullets.
11. **Glossary**: the terms settled during the work session, each with its literal definition.
12. **Where the durable records live**: pointers to the rules, notes, log entries, experiments, and code the work session produced.
13. Optionally, a **reflective closing note** on the work session itself.
14. A **provenance footer**: the record ends with the `Authored by … / Changed by …` footer, like every working-state artifact.
15. The footer follows the working-state-artifacts-carry-a-provenance-footer rule and the record-a-rules-authorship-in-a-provenance-footer format.
16. A work session record is not shaped like a plan. It records the past. This convention defines that format, alongside the directory.

# When the work diverges from the plan, the work is definitive

Source: system/foundation/source/when-the-work-diverges-from-the-plan-the-work-is-definitive.md

1. When the work diverges from the plan, the work is definitive.
2. The plan need not be updated to reflect the work as if the plan had been perfectly prescient.
3. A plan that did not predict what happened is not defective.
4. A plan is not owed an amendment every time the work moves past it.
5. A divergence is not a pending reconciliation.
6. Where the work has simply gone further than the plan foresaw, nothing is outstanding.
7. Do not list such a plan as needing an update.
8. Leave such a plan as written. Do not list the divergence as a reconciliation, and do not offer to bring the plan into line.

## What this does not reach

1. Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan.
2. The test of whether the plan's direction is wrong is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be.
3. The engineer may amend a plan for their own reasons at any time. Amend it where the engineer asks. Every amendment, including a correction, is a dated addition.
4. This rule removes an obligation, not a permission.
5. Either side may be stale, and only the engineer can say which. A design may be right about a direction the work drifted from.
6. This rule settles the ordinary case and leaves that judgment with the engineer.

# Work in a downstream project is never offered, and its pending state is not reported

Source: system/foundation/source/work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported.md

1. A package change leaves every project that installed it on the previous version.
2. Do not offer to close that gap.
3. Do not report it.
4. This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete.
5. It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap.
6. It covers the projects a machine registry names, and any other repository that consumes this one.
7. After changing a package, report what changed and stop. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.
8. Carry out downstream work when the engineer asks, and report what happened once it is done.
9. Answer a question about downstream state plainly and in full.

## A pending state named is the same offer

1. A trailing line reporting what is not done is a prompt, whatever its grammar.
2. *The other three projects still hold their commits unpushed* is forbidden. It asks for a push.
3. *The root `AGENTS.md` is stale in all four* is forbidden. It asks for a regeneration.
4. A sentence counts as a prompt even when it contains no question.
5. The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*.
6. Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act.

## What this does not forbid

1. Doing the work, when the engineer asks for it.
2. Do it with no preamble weighing whether the instruction was wise.
3. Reporting what was done, after doing it.
4. A report of work carried out is a result. A report of work not carried out is a prompt.
5. To tell them apart, ask whether the sentence describes something that happened.
6. Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full.
7. Raising downstream state unbidden stays forbidden.
8. The session-start notice. The harness emits it, it reports only on the current project, and it names no other repository. See the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule.
