# Slasher — foundation

The `slasher/` [artifact system](https://github.com/slasher-bot/slasher) that every other package builds on.

All agent artifacts for a project live under a single top-level `slasher/` folder. So they are committed to git alongside the code, and read at the start of each session rather than recalled. It holds two directories, separating what came from outside from what is the project's own. **`slasher/system/`** holds the installed packages, never edited in place. **`slasher/local/`** holds everything the project writes.

Foundation defines the four core artifact directories and how to work with them. Each has its own rule in this package:

- **`slasher/system/`** and **`slasher/local/rules/`**. Binding project rules, one per file, read and followed every session — the installed system packages in `slasher/system/`, the project's own local rules in `slasher/local/rules/`.
- **`slasher/local/vocabulary.md`**. The project's own vocabulary, read with the rules and binding like them. Its terms and substitutions decide over every package's (`a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides`). One file, no datetime prefix, and optional.
- **`slasher/local/items/`**. Working hypotheses and rule-candidates still under discovery. Not yet binding.
- **Work postponed mid-task is an ordinary item** carrying a `**Waits for:**` line, and it may carry a `**Priority:**` rank (`the-items-directory-holds-one-file-per-item`). It was a **deferred queue** with a convention, a reserved tag, a session-start print, and a command until 2026-08-25, when all four were suspended — what made it a queue was the print and the command, and the two lines are what remained.
**The log records the reasoning for an abandonment, and never conveys that something was done when it was not** (`the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done`). When work is abandoned its branch goes, which leaves the log as the only durable trace and makes it tempting to pour the branch into it. What belongs there is the decision to stop and the reason given for it. What does not is the plan, the increments, or the design that was never built. **A careful tense is not enough** — every sentence can be conditional, every claim true, and the entry still leaves a reader believing the project worked something out.

- **`slasher/local/logs/`**. The **contemporaneous, historical records**, grouped (`the-logs-directory-holds-the-contemporaneous-historical-records`) — records that accrue chronologically and are never revised, as against the directories that state what is currently true. It holds **`logs/log/`**, the log, one file per decision with a one-line title; **`logs/loops/`**, contributed by `design-by-efferent`; and **`logs/work-sessions/`**. The three sat directly under `slasher/local/` until 2026-08-18.

Three conventions govern all of them: the **ISO-8601-UTC filename prefix** (`file-names`) that makes every artifact sort chronologically and declare its timezone. **a time value carries minutes and seconds** (`a-time-value-carries-minutes-and-seconds`), wherever a datetime written into a file includes a time of day. Third is **purpose-over-category** (`rules-establish-a-mindset`). A rule's folder names the surface it acts on, not the purpose it serves.

Foundation also provides the project-wide **status report** command, a whole-project summary. **A report counts a hidden record rather than listing it** (`a-status-report-prints-a-fixed-whole-project-report`), and that reaches a brief as much as the fixed report. Two kinds are hidden today: a record whose `**State:**` line reads `Suspended`, and a log entry carrying the `[suspended]` tag. The state marks something the project **wanted** and set aside; the tag marks something it **did** and stopped. The count is what makes either askable for — a record dropped entirely leaves a reader believing they have seen everything.

**`/projects` lists the machine's registry of Slasher projects, and carries out an instruction in another project** (`projects-lists-the-registry-and-carries-out-an-instruction-in-another-project`), **`/package refresh` and `/package install` run foundation's scripts in the current project** (`package-refresh-and-install-run-foundations-scripts`), and **the skills reach a project as a plugin called Slasher and named `slasher`**, assembled from the active packages' skills (`the-slasher-skills-are-delivered-as-a-plugin-named-slasher`).

**`/next?` names the next step of the work under way, and `/next` takes it** (`next-takes-the-next-step-of-the-work-under-way`), in place of asking *What's next?* and saying *proceed*. Neither decides anything the rules leave to the engineer.

**Brainstorming records points as they are said, and organizes them at the end** (`brainstorming-records-points-as-they-are-said-and-organizes-them-at-the-end`). Each point goes word for word to a collection file outside the repository, and at the end the agent reframes them into an item.

**Anything given to `/private` is recorded only in the private directory** (`anything-given-to-private-is-recorded-only-in-the-private-directory`), under `~/.local/share/slasher/`, in one directory for each kind and project. It copies a file given by its path to the private directory, and writes a private item, log entry, or journal entry. **`/private session <instruction>` starts a private session**: until the session ends, every record the agent writes goes to the private directory, and code and rules still change in the project. After 4 minutes with no prompt, the agent asks whether to continue the private session or end it. A private record is not committed, not read at session start, and not logged, and it moves into the project only on the engineer's confirmed command.

**A Slasher command takes its subcommand first, asks when it has none, and its domain takes `help`** (`a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help`). An alias does exactly what the command it names does, and each subcommand hands its act to the rule that governs it.

**Every prompt to the engineer goes through the selection interface** (`present-every-prompt-to-the-engineer-through-the-selection-ui`) — any selection, decision, or answer, never a prose question. The harness supplies the free-text option, so the agent adds none of its own. It does add an **`Explain`** option, which is the opposite half of it. The free-text option is how an engineer answers outside the options. `Explain` is how they ask what the question means before answering. **On the re-displayed prompt it reads `Explain briefly` and answers with the summary alone.** An engineer reaching for it a second time did not get what they needed at a normal length, so answering at that length again repeats the attempt that failed.

The rule lives here rather than in `design-by-efferent`, where it was written, because it governs **every** prompt. `foundation`'s own lifecycles put decisions through the interface, and so does the standalone `versioning` package. So a project installing `foundation` alone must receive the rule along with the instruction to follow it.

Beyond the four core directories, foundation defines the **work-artifact** directories for planning and running changes:

- `slasher/local/items/` — the project's planning records, whatever its tags name them
- `slasher/local/implementations/` — the lifecycle record of an experiment or a feature
- `slasher/local/migration/` — execution plans for transitions of content **across a repository boundary**, kept after the content has gone so the trail of where it went stays in the repository it left

**An implementation carries a full branch lifecycle**, in the `the-implementations-directory-holds-one-record-per-implementation` and `an-implementation-runs-on-a-branch-to-a-declared-end` rules — its own branch, a working location chosen at the start, a declared end, and recorded confirmations. **Two kinds, and a tag says which.** An `[experiment]` is built to a **question** and a `[feature]` to an **intent**, and that one difference accounts for every other: an experiment forecasts, reaches a verdict of affirmed, refuted, or inconclusive, merges through a test gate on the engineer's affirmation, and is watched for drift. A feature does none of those, ends **completed**, is simply verified before it integrates, and is the only kind that may be built on the current branch.

**An experiment may run in phases, and each phase starts by stating its goal** (`a-phase-starts-by-stating-its-goal`) — what the phase is to establish, and how that serves the experiment's question — beside a list of the experiment's phases with the current one marked.

The four rules that stated this as two lifecycles were consolidated on 2026-08-18. They agreed on almost everything and had already drifted in their wording of the same clauses.

**The project's items** live in `slasher/local/items/`, one file per item (`the-items-directory-holds-one-file-per-item`). **An item is an item.** A tag may describe one — `[design]`, `[plan]`, `[aspiration]` — and nothing about it is strict: the set is open, an item may carry several or none, no rule reads a kind tag, and **none is assigned by default**. `[aspiration]` in particular is written where an aspiration was asked for, never as the dress a design item is put in. The six words the mode mechanism fixed as a planning vocabulary outlived it as a tag set that read as exhaustive, and that is the last of the mode gone with them.

- **The shape is thin.** A title, a `**State:**` line, a `**Tags:**` line, and whatever the item has to say. A footer, a log entry, the ISO-8601-UTC prefix, and the state suffix. Nothing else is required, because an item that settles nothing has no resolutions and an item that sequences nothing has no tasks.
- **Nine states**, one set for every item: **Open**, **Active**, **Realized**, **Deferred**, **Suspended**, **Superseded**, **Abandoned**, **Obsolete**, and **Recorded**. **`Recorded` is a note's, and a note's alone** — it is the one state that never changes, because a note has no lifecycle (`a-note-is-a-remark-worth-keeping-whose-one-state-recorded-never-changes`). It is written when the note is, and it stays. `Open` and `Active` are the two starting words. `Obsolete` and `Abandoned` differ in who acted — an item becomes obsolete when nobody decides and the work moves past it.
- **Supersede rather than rewrite**, and amend by dated addition, so an item reads as a history of thinking rather than as whatever is current. A settled item is reconciled, never regenerated from the work downstream of it.
- **When the work diverges from the plan, the work is definitive** (`when-the-work-diverges-from-the-plan-the-work-is-definitive`). A plan that did not predict what happened is not defective, and a divergence is not a pending reconciliation. A plan whose direction proves wrong is corrected, and the engineer may still amend one by dated addition.

It replaces four rules — two conventions and two document formats — decommissioned with the mode mechanism on 2026-08-18. Those fixed a spine for a design and an element order for a plan, and an item that was neither had nowhere to sit.

- **Plans contain no code samples**, and avoid committing to method or file names that are not yet decided (`an-item-that-sequences-work-contains-no-code-samples`).
- **A record carrying a state line ends its filename with that state in upper case** (`a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case`). It reaches every record that carries one — an experiment, a feature, and an item — so a directory listing answers which of them concluded, in a file tree, a shell, or an editor sidebar. The upper case is the one stated exception to the file-names rule's lower-case name. The `**State:**` line stays the only authoritative statement, the name is derived from it, and a state change renames the file.
- **Each item pairs with a log entry** — on creation, on each **Settled** resolution, and on each change of state (`a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state`). A completed task takes none, and neither does prose that settles nothing. **The entry names the record and what happened to it**, and never states an unbuilt direction in the indicative mood — the grammar the `git` package asks for is right for a change to the software and wrong for a record that only settles one. That reaches the commit subject the entry travels in. It closes an asymmetry: four other conventions already stated their own pairing, and these two rested on the log's when-in-doubt clause.
- **An implementation record pairs with a log entry** too (`a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged`), on creation and on each change of state. The concluding entry is a **summary marker** where the work merged and **carries the substance** where it did not — a refuted experiment's branch is deleted unmerged, so a record that lived only there is unreachable, which a file deleted from `master` never is.
- **A design section documenting a package dependency is titled "Package Dependency"**, never a bare "Dependency", which is overloaded (`a-design-section-documenting-a-package-dependency-is-titled-package-dependency`).

They live here because foundation defines the artifacts they format. Held separately, the citation ran in both directions. Foundation named the `plan` package for the shape of documents foundation itself governs. Every rule in that package was addressed to directories only foundation creates.

Other packages may contribute their own artifact directories (for example, design-by-efferent contributes `slasher/local/logs/loops/`). Foundation owns `rules`/`notes`/`deferred`/`log` and the `items`/`implementations`/`logs`/`migration` work-artifact directories.

**A project's durable context lives in its committed artifacts, never in an agent memory store** (`a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store`). The premise is the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule's — the conventions are read fresh each session rather than recalled, and a store is recall. It reaches project context alone. A fact about the engineer rather than the project is machine-scoped, and per-machine configuration under `~/.config/` is where the `a-project-does-not-name-its-downstream-consumers-in-its-own-files` rule already sends one.

**A preference the engineer expresses is asked about at once** (`ask-at-once-when-the-engineer-expresses-a-preference`), through the selection interface, offering a rule, a note, or neither. The two rules are only sound together: the first forbids holding a preference, and the second is what keeps forbidding it from costing anything. A preference is not a rule until it is written, and every restatement of one is evidence that nothing carried it.

**Work in a downstream project is never offered, and its pending state is not reported** (`work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported`). A package change leaves every consuming project holding the previous version, and closing that gap is the engineer's instruction to give. The rule reaches **reporting** as well as asking, because that is where it fails: a trailing line naming what is unrefreshed or unpushed is a prompt whatever its grammar. Doing the work when asked, reporting it once done, and answering a question about downstream state are each unaffected.

**Any record takes square-bracket category tags** (`a-record-may-be-categorized-with-square-bracket-tags`) — a `**Tags:**` line at the head, or a `[tag]` prefixing one list item. **The protocol is universal and has one form: no record is excluded, no rule excludes one, and no shape gets a second form.** A log entry that carries tags is a title, a blank line, and a `**Tags:**` line. Freeform and lower-case, with no controlled vocabulary and nothing derived from a **freeform** tag, which is what separates one from the `**State:**` line beside it. A **reserved** tag is one a rule names and states what follows from — the reserved set is small, each member findable in a rule, and the freeform space untouched around it. The log was exempted until 2026-08-18, when the exemption was removed — `[suspended]` is the first tag its entries carry, and **`[decision]` marks an entry recording a decision the engineer made** (`a-log-entry-recording-an-engineers-decision-is-tagged-decision`). A leading-tag form for one-line records was written the same day and superseded within it. The protocol was the `journal` package's until 2026-08-18, and it was lifted here because nothing in it was ever about journals.

**A list of records presented on request is a table** (`a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`) — the handle first with no heading, then the commit that created the record and the last to touch it, then the title, then one column for the fact that was asked about. A record showing the same SHA twice has not been touched since it was written. It reaches any record, and it does **not** reach the session-start deferred queue print, which its own rule fixes as rows because that one carries a one-line summary. Where a field runs to a sentence, rows are the form. The two are not in competition: they answer to the length of what is in them.

**A historical record is edited for one reason only** — that it discloses what should not have been disclosed (`disclosure-is-the-one-reason-to-edit-a-historical-record`). The correction removes the disclosure and keeps every claim true by stating it at a lower resolution. It never makes the record say something that did not happen. The engineer is the authority on what counts, and the git history is not reached by the edit.

**The mode mechanism was decommissioned on 2026-08-18.** A project worked in one of three modes — formal, intuitive, or OODA — chosen at its start, and the mode decided what the two planning artifacts were called and where they lived. Six directories existed for one kind of work.

**One directory replaces it, `slasher/local/items/`, and the kind is a tag.** A design is an item and an item is a design. An aspiration is an item tagged `[aspiration]`, and the kind set is open. The mode may now change mid-stream, which the mechanism forbade, because its two unanswered questions were both questions about directories.

**A project does not name its downstream consumers** in its own files (`a-project-does-not-name-its-downstream-consumers-in-its-own-files`) — not in the installed packages, not in its own working state. A consumer list inverts the dependency direction, drifts silently, and publishes other people's projects to everyone who reads the file. A project named because a **decision was about it** is unaffected. What a tool needs in order to reach the consuming projects lives in per-machine configuration under `~/.config/`, outside the repository.

**A prose line is not hard-wrapped** (`a-paragraph-is-one-line-and-the-readers-editor-wraps-it`). A paragraph is one line and the reader's editor wraps it to the width they chose. A heading, a list item, a table row, a blockquote line, a horizontal rule, a fenced block's contents, and each line of the provenance footer keep their own lines. The hard wrap buys the reader nothing, since the rendering is identical either way, and it costs a diff: editing a sentence mid-paragraph reflows every line after it, so a one-word change reads as a paragraph rewritten.

**A vocabulary entry says what a term means — never what it used to be, and never where to read more** (`a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more`). Two things are barred. **Lifecycle history** belongs to the log, and the test is the tense: a clause carrying a date, an *until*, or a *no longer* records a change rather than states a meaning. **A pointer** — *Its rule is …*, *see the … rule*, a reference to another vocabulary or to a section elsewhere — answers a question the reader did not ask. What stays is the reason a substitution substitutes, the STE note whole, and **a distinction against a neighbouring term**, which gives meaning through contrast and is not a pointer even when it names one.

**Vocabulary** (`vocabulary.md`): the terms every other package and every project uses, since foundation defines the artifacts they all write into. It states **deferred**, **suspended**, and **out of scope** beside each other: *not yet*, *no longer*, *not here*. They are confused most where nothing distinguishes them, and defines **projection**, **reconcile**, **working-state artifact**, **plain text data attribute line**, **distributable rule**, and **local rule**. The last two name how a rule travels and whose it is, and neither is `system rule`, which names where it sits. Its one substitution is **work session record**, never bare "session record".

This package includes no others — everything else includes it. It cites several, which is exactly the distinction the rule above draws.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

**Foundation carries the tooling a consuming project runs**, and it is the only package that does. Two facts settle that, and they decide all six of its scripts rather than only the installer:

- **`git subtree` can only place files inside a package directory.** So a tool a consuming project runs has to live in some package. There is nowhere else for it to be delivered.
- **It has to be a package that is always there.** Foundation is the only one — every other package includes it, so a project running Slasher at all has foundation.

So `install.sh`, `refresh-packages.sh`, `session-start.sh`, `startup-display.sh`, `statusline.sh`, and `read-consuming-projects.sh` are here. The **authoring** tools are not. `install-all.sh` and `report-direct-commits.sh` sit unpackaged at the root of the composite repository. Only the composite publishes, and a consuming project never runs them.

**`read-consuming-projects.sh` is packaged because it is not an authoring tool**, though it sat with them until 2026-08-07. It reports the Slasher projects **on this machine**, reading a per-machine registry at `~/.config/slasher/consuming-projects.toml`. So it is **machine-scoped** where the rest of this package is project-scoped. The engineer who wants it is anyone who installed Slasher into more than one project, rather than whoever maintains Slasher.

The authoring tools run **against the packages**. This one runs **beside projects**, which is a third position the earlier classification had no slot for. It detects nothing about a project's condition, reaches no network, and takes no action on what it finds. It also names no consuming project in its own source: the list is in the registry, outside any repository, per the `a-project-does-not-name-its-downstream-consumers-in-its-own-files` rule.

**Being installed into every project means a copy per project, and one registry.** Each copy reads the same file and reports the same set, so an engineer runs whichever copy is nearest rather than the right one.

**It is here for now, and a package of its own is the likely next position.** `foundation` is where it reaches every project from, being the package every project has — not because discovery is foundational. A package of its own would carry it to the engineers who want it and no others. It would be the first Slasher package that is a **tool** rather than a set of rules.

**`report-unrecognized-mode.sh` was decommissioned on 2026-08-18**, with the mode mechanism whose rule it read. It reported a mode rule in `slasher/local/rules/` naming a mode the installed rule no longer defined, and there is no such rule to read.

**`refresh-packages.sh` also checks the bootstrap.** The root `AGENTS.md` is written by `install.sh`, belongs to no package, and is therefore the one activated file no `git subtree pull` can reach. So a refresh updates the packages beneath it and leaves it behind.

The script used to print a reminder saying so. On 2026-08-06 every consuming project's bootstrap was found stale anyway, which is what a reminder is worth. It now compares the section against what the installed installer generates, at the moment the drift is created.

The comparison cannot always be made. There may be no `AGENTS.md`, or an installer predating the `bootstrap` subcommand it asks for. It then says the check did not happen rather than reporting agreement. It never invokes an installer that would treat the request as an install.

Foundation carries an **`install.sh`**, which also has to activate the system. Run it from your project root:

```
./install.sh
```

It installs foundation and then places a **root `AGENTS.md`** that tells the agent to read `slasher/system/`, `slasher/local/rules/`, and `slasher/local/vocabulary.md` at the start of every session. That root file is what actually activates the system. `git subtree` can only put files under `slasher/`, never at the project root. Without this step the rules are installed but nothing reads them. If you already have an `AGENTS.md`, the script shows you the exact text, explains the effect, and asks before appending. It never edits your file silently.

It also **renames `slasher/local/logs/work-sessions/` if your project still holds it under its old name**, `slasher/local/sessions/`. This is the one place the installer touches your project's own working state. It moves the directory only when the old name is present and the new one is absent. Where the two exist it reports them and changes nothing, leaving the merge to you.

You can install with plain `git subtree` instead, but then you must add the root `AGENTS.md` yourself or the system stays inactive:

```
git subtree add  --prefix slasher/system/foundation git@github.com:slasher-bot/foundation.git master --squash
git subtree pull --prefix slasher/system/foundation git@github.com:slasher-bot/foundation.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/slasher-bot/foundation.git` in place of the address above. A script takes `SLASHER_ORIGIN=https://github.com/slasher-bot` for the same reason.

This package has no dependencies. (The composite `install-all.sh` installs every package and runs this same bootstrap for you.)

**Refresh from upstream** periodically to pull the latest rules. Once foundation is installed, one command refreshes every installed package:

```
slasher/system/foundation/refresh-packages.sh
```

**A package's repository is its installed path with the slashes flattened to dashes**, so a nested `group/name` publishes to `group-name`. **A package may declare a different one**, on a `**Repository:**` line in its `README.md` — the plain text data attribute form the rest of the system reads. `refresh-packages.sh` reads that line where it is present and derives the name where it is not, which is every package but one.

The declaration exists because a repository name is met by people as well as by scripts. The Ruby package installs at `slasher/system/ext/ruby-lang/` and is published from `slasher-bot/slasher-ruby`, which the flattening does not produce.

It reports each package that moved and the rule files that changed in it. Those files are binding, and a silent refresh would be a change of behavior nobody saw. Name packages to refresh only those (`… refresh-packages.sh testing git`). Set `SLASHER_ORIGIN` to refresh from a fork or a mirror instead of `https://github.com/slasher-bot`. A single package can still be pulled directly:

```
git subtree pull --prefix slasher/system/foundation git@github.com:slasher-bot/foundation.git master --squash
```


## License

Slasher is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:38:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:27:51 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:33:53 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 9:08:02 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 12:32:17 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 12:37:43 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 1:04:10 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:12:15 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 9:36:21 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:23:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:59:23 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:01:04 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:07:00 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:38:02 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 9:37:58 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:18:21 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:19:08 AM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:50 PM PT
