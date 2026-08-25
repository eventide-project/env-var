# Waytide — foundation

The `waytide/` [artifact system](https://github.com/waytide/waytide) that every other package builds on.

All agent artifacts for a project live under a single top-level `waytide/` folder. So they are committed to git alongside the code, and read at the start of each session rather than recalled. It holds two directories, separating what came from outside from what is the project's own. **`waytide/system/`** holds the installed packages, never edited in place. **`waytide/local/`** holds everything the project writes.

Foundation defines the four core artifact directories and how to work with them. Each has its own rule in this package:

- **`waytide/system/`** and **`waytide/local/rules/`**. Binding project rules, one per file, read and followed every session — the installed system packages in `waytide/system/`, the project's own local rules in `waytide/local/rules/`.
- **`waytide/local/vocabulary.md`**. The project's own vocabulary, read with the rules and binding like them. Its terms and substitutions decide over every package's (`vocabulary-convention`). One file, no datetime prefix, and optional.
- **`waytide/local/ideas/`**. Working hypotheses and rule-candidates still under discovery. Not yet binding.
- **Work postponed mid-task is an ordinary idea** carrying a `**Waits for:**` line, and it may carry a `**Priority:**` rank (`ideas-convention`). It was a **deferred queue** with a convention, a reserved tag, a session-start print, and a command until 2026-08-25, when all four were suspended — what made it a queue was the print and the command, and the two lines are what remained.
**The log records the reasoning for an abandonment, and never conveys that something was done when it was not** (`the-log-never-says-undone-work-was-done`). When work is abandoned its branch goes, which leaves the log as the only durable trace and makes it tempting to pour the branch into it. What belongs there is the decision to stop and the reason given for it. What does not is the plan, the increments, or the design that was never built. **A careful tense is not enough** — every sentence can be conditional, every claim true, and the entry still leaves a reader believing the project worked something out.

- **`waytide/local/logs/`**. The **running records**, grouped (`logs-directory`) — records that accrue chronologically and are never revised, as against the directories that state what is currently true. It holds **`logs/log/`**, the decision log, one file per decision with a one-line title; **`logs/loops/`**, contributed by `design-by-efferent`; and **`logs/work-sessions/`**. The three sat directly under `waytide/local/` until 2026-08-18.

Three conventions govern all of them: the **ISO-8601-UTC filename prefix** (`file-names`) that makes every artifact sort chronologically and declare its timezone. **a time value carries minutes and seconds** (`a-time-value-carries-minutes-and-seconds`), wherever a datetime written into a file includes a time of day. Third is **purpose-over-category** (`rules-establish-a-mindset`). A rule's folder names the surface it acts on, not the purpose it serves.

Foundation also provides the project-wide **status report** command, a whole-project summary. **A report counts a hidden record rather than listing it** (`status-report-format`), and that reaches a brief as much as the fixed report. Two kinds are hidden today: a record whose `**State:**` line reads `Suspended`, and a log entry carrying the `[suspended]` tag. The state marks something the project **wanted** and set aside; the tag marks something it **did** and stopped. The count is what makes either askable for — a record dropped entirely leaves a reader believing they have seen everything.

**Every prompt to the engineer goes through the selection interface** (`present-every-prompt-through-askuserquestion`) — any selection, decision, or answer, never a prose question. The harness supplies the free-text option, so the agent adds none of its own. It does add an **`Explain`** option, which is the opposite half of it. The free-text option is how an engineer answers outside the options. `Explain` is how they ask what the question means before answering. **On the re-displayed prompt it reads `Explain briefly` and answers with the summary alone.** An engineer reaching for it a second time did not get what they needed at a normal length, so answering at that length again repeats the attempt that failed.

The rule lives here rather than in `design-by-efferent`, where it was written, because it governs **every** prompt. `foundation`'s own lifecycles put decisions through the interface, and so does the standalone `versioning` package. So a project installing `foundation` alone must receive the rule along with the instruction to follow it.

Beyond the four core directories, foundation defines the **work-artifact** directories for planning and running changes:

- `waytide/local/ideas/` — the project's planning records, whatever its tags name them
- `waytide/local/implementations/` — the lifecycle record of an experiment or a feature
- `waytide/local/migration/` — execution plans for transitions of content **across a repository boundary**, kept after the content has gone so the trail of where it went stays in the repository it left

**An implementation carries a full branch lifecycle**, in the `implementations-convention` and `implementation-lifecycle` rules — its own branch, a working location chosen at the start, a declared end, and recorded confirmations. **Two kinds, and a tag says which.** An `[experiment]` is built to a **question** and a `[feature]` to an **intent**, and that one difference accounts for every other: an experiment forecasts, reaches a verdict of affirmed, refuted, or inconclusive, merges through a test gate on the engineer's affirmation, and is watched for drift. A feature does none of those, ends **completed**, is simply verified before it integrates, and is the only kind that may be built on the current branch.

The four rules that stated this as two lifecycles were consolidated on 2026-08-18. They agreed on almost everything and had already drifted in their wording of the same clauses.

**The project's ideas** live in `waytide/local/ideas/`, one file per idea (`ideas-convention`). **An idea is an idea.** A tag may describe one — `[design]`, `[plan]`, `[aspiration]` — and nothing about it is strict: the set is open, an idea may carry several or none, no rule reads a kind tag, and **none is assigned by default**. `[aspiration]` in particular is written where an aspiration was asked for, never as the dress a design idea is put in. The six words the mode mechanism fixed as a planning vocabulary outlived it as a tag set that read as exhaustive, and that is the last of the mode gone with them.

- **The shape is thin.** A title, a `**State:**` line, a `**Tags:**` line, and whatever the idea has to say. A footer, a log entry, the ISO-8601-UTC prefix, and the state suffix. Nothing else is required, because an idea that settles nothing has no resolutions and an idea that sequences nothing has no tasks.
- **Nine states**, one set for every idea: **Open**, **Active**, **Realized**, **Deferred**, **Suspended**, **Superseded**, **Abandoned**, **Lapsed**, and **Stated**. **`Stated` is an observation's, and an observation's alone** — it is the one state that never changes, because an observation has no lifecycle (`observations-convention`). It is written when the observation is, and it stays. `Open` and `Active` are the two starting words. `Lapsed` and `Abandoned` differ in who acted — lapsing is what happens when nobody decides and the work moves past the idea.
- **Supersede rather than rewrite**, and amend by dated addition, so an idea reads as a history of thinking rather than as whatever is current. A settled idea is reconciled, never regenerated from the work downstream of it.

It replaces four rules — two conventions and two document formats — decommissioned with the mode mechanism on 2026-08-18. Those fixed a spine for a design and an element order for a plan, and an idea that was neither had nowhere to sit.

- **Plans contain no code samples**, and avoid committing to method or file names that are not yet decided (`plans-no-code-samples`).
- **A record carrying a state line ends its filename with that state in upper case** (`a-record-ends-with-its-state-in-upper-case`). It reaches every record that carries one — an experiment, a feature, and an idea — so a directory listing answers which of them concluded, in a file tree, a shell, or an editor sidebar. The upper case is the one stated exception to the file-names rule's lower-case name. The `**State:**` line stays the only authoritative statement, the name is derived from it, and a state change renames the file.
- **Each idea pairs with a log entry** — on creation, on each **Settled** resolution, and on each change of state (`an-idea-takes-a-log-entry`). A completed task takes none, and neither does prose that settles nothing. **The entry names the record and what happened to it**, and never states an unbuilt direction in the indicative mood — the grammar the `git` package asks for is right for a change to the software and wrong for a record that only settles one. That reaches the commit subject the entry travels in. It closes an asymmetry: four other conventions already stated their own pairing, and these two rested on the decision log's when-in-doubt clause.
- **An implementation record pairs with a log entry** too (`implementation-records-take-a-log-entry`), on creation and on each change of state. The concluding entry is a **summary marker** where the work merged and **carries the substance** where it did not — a refuted experiment's branch is deleted unmerged, so a record that lived only there is unreachable, which a file deleted from `master` never is.
- **A design section documenting a package dependency is titled "Package Dependency"**, never a bare "Dependency", which is overloaded (`package-dependency-heading`).

They live here because foundation defines the artifacts they format. Held separately, the citation ran in both directions. Foundation named the `plan` package for the shape of documents foundation itself governs. Every rule in that package was addressed to directories only foundation creates.

Other packages may contribute their own artifact directories (for example, design-by-efferent contributes `waytide/local/logs/loops/`). Foundation owns `rules`/`observations`/`deferred`/`log` and the `ideas`/`implementations`/`logs`/`migration` work-artifact directories.

Foundation also settles **what a package dependency is**, in the `a-citation-is-not-a-dependency` rule. A rule may name another package's rule freely. That citation becomes a dependency only where the citing rule **will not work** without the cited package. Motivation is not the test, and a "standalone" claim is about what must be installed rather than about what a rule's prose may name.

**A project's durable context lives in its committed artifacts, never in an agent memory store** (`project-context-lives-in-the-committed-artifacts`). The premise is the rules-convention's — the conventions are read fresh each session rather than recalled, and a store is recall. It reaches project context alone. A fact about the engineer rather than the project is machine-scoped, and per-machine configuration under `~/.config/` is where the `a-project-does-not-name-its-consumers` rule already sends one.

**A preference the engineer expresses is asked about at once** (`ask-at-once-when-a-preference-is-expressed`), through the selection interface, offering a rule, an observation, or neither. The two rules are only sound together: the first forbids holding a preference, and the second is what keeps forbidding it from costing anything. A preference is not a rule until it is written, and every restatement of one is evidence that nothing carried it.

**Work in a downstream project is never offered, and its pending state is not reported** (`downstream-work-is-never-offered`). A package change leaves every consuming project holding the previous version, and closing that gap is the engineer's instruction to give. The rule reaches **reporting** as well as asking, because that is where it fails: a trailing line naming what is unrefreshed or unpushed is a prompt whatever its grammar. Doing the work when asked, reporting it once done, and answering a question about downstream state are each unaffected.

**Any record takes square-bracket category tags** (`a-record-takes-category-tags`) — a `**Tags:**` line at the head, or a `[tag]` prefixing one list item. **The protocol is universal and has one form: no record is excluded, no rule excludes one, and no shape gets a second form.** A decision log entry that carries tags is a title, a blank line, and a `**Tags:**` line. Freeform and lower-case, with no controlled vocabulary and nothing derived from a **freeform** tag, which is what separates one from the `**State:**` line beside it. A **reserved** tag is one a rule names and states what follows from — the reserved set is small, each member findable in a rule, and the freeform space untouched around it. The decision log was exempted until 2026-08-18, when the exemption was removed — `[suspended]` is the first tag its entries carry. A leading-tag form for one-line records was written the same day and superseded within it. The protocol was the `journal` package's until 2026-08-18, and it was lifted here because nothing in it was ever about journals.

**A list of records presented on request is a table** (`a-record-list-is-a-table`) — the handle first with no heading, then the commit that created the record and the last to touch it, then the title, then one column for the fact that was asked about. A record showing the same SHA twice has not been touched since it was written. It reaches any record, and it does **not** reach the session-start deferred queue print, which its own rule fixes as rows because that one carries a one-line summary. Where a field runs to a sentence, rows are the form. The two are not in competition: they answer to the length of what is in them.

**A historical record is edited for one reason only** — that it discloses what should not have been disclosed (`disclosure-is-the-one-reason-to-edit-a-historical-record`). The correction removes the disclosure and keeps every claim true by stating it at a lower resolution. It never makes the record say something that did not happen. The engineer is the authority on what counts, and the git history is not reached by the edit.

**The mode mechanism was decommissioned on 2026-08-18.** A project worked in one of three modes — formal, intuitive, or OODA — chosen at its start, and the mode decided what the two planning artifacts were called and where they lived. Six directories existed for one kind of work.

**One directory replaces it, `waytide/local/ideas/`, and the kind is a tag.** A design is an idea and an idea is a design. An aspiration is an idea tagged `[aspiration]`, and the kind set is open. The mode may now change mid-stream, which the mechanism forbade, because its two unanswered questions were both questions about directories.

**A project does not name its downstream consumers** in its own files (`a-project-does-not-name-its-consumers`) — not in the installed packages, not in its own working state. A consumer list inverts the dependency direction, drifts silently, and publishes other people's projects to everyone who reads the file. A project named because a **decision was about it** is unaffected. What a tool needs in order to reach the consuming projects lives in per-machine configuration under `~/.config/`, outside the repository.

**A prose line is not hard-wrapped** (`prose-is-not-hard-wrapped`). A paragraph is one line and the reader's editor wraps it to the width they chose. A heading, a list item, a table row, a blockquote line, a horizontal rule, a fenced block's contents, and each line of the provenance footer keep their own lines. The hard wrap buys the reader nothing, since the rendering is identical either way, and it costs a diff: editing a sentence mid-paragraph reflows every line after it, so a one-word change reads as a paragraph rewritten.

**A vocabulary entry says what a term means — never what it used to be, and never where to read more** (`a-vocabulary-entry-says-what-a-term-means-not-what-it-was`). Two things are barred. **Lifecycle history** belongs to the decision log, and the test is the tense: a clause carrying a date, an *until*, or a *no longer* records a change rather than states a meaning. **A pointer** — *Its rule is …*, *see the … rule*, a reference to another vocabulary or to a section elsewhere — answers a question the reader did not ask. What stays is the reason a substitution substitutes, the STE note whole, and **a distinction against a neighbouring term**, which gives meaning through contrast and is not a pointer even when it names one.

**Vocabulary** (`vocabulary.md`): the terms every other package and every project uses, since foundation defines the artifacts they all write into. It states **deferred**, **suspended**, and **out of scope** beside each other: *not yet*, *no longer*, *not here*. They are confused most where nothing distinguishes them, and defines **projection**, **reconcile**, **working-state artifact**, **plain text data attribute line**, **distributable rule**, and **local rule**. The last two name how a rule travels and whose it is, and neither is `system rule`, which names where it sits. Its one substitution is **work session record**, never bare "session record".

This package includes no others — everything else includes it. It cites several, which is exactly the distinction the rule above draws.

```
foundation  →  (nothing — the base every other package builds on)
```

## Installing into a project

**Foundation carries the tooling a consuming project runs**, and it is the only package that does. Two facts settle that, and they decide all five of its scripts rather than only the installer:

- **`git subtree` can only place files inside a package directory.** So a tool a consuming project runs has to live in some package. There is nowhere else for it to be delivered.
- **It has to be a package that is always there.** Foundation is the only one — every other package includes it, so a project running Waytide at all has foundation.

So `install.sh`, `refresh-packages.sh`, `session-start.sh`, `statusline.sh`, and `read-consuming-projects.sh` are here. The **authoring** tools are not. `install-all.sh` and `report-direct-commits.sh` sit unpackaged at the root of the composite repository. Only the composite publishes, and a consuming project never runs them.

**`read-consuming-projects.sh` is packaged because it is not an authoring tool**, though it sat with them until 2026-08-07. It reports the Waytide projects **on this machine**, reading a per-machine registry at `~/.config/waytide/consuming-projects.toml`. So it is **machine-scoped** where the rest of this package is project-scoped. The engineer who wants it is anyone who installed Waytide into more than one project, rather than whoever maintains Waytide.

The authoring tools run **against the packages**. This one runs **beside projects**, which is a third position the earlier classification had no slot for. It detects nothing about a project's condition, reaches no network, and takes no action on what it finds. It also names no consuming project in its own source: the list is in the registry, outside any repository, per the `a-project-does-not-name-its-consumers` rule.

**Being installed into every project means a copy per project, and one registry.** Each copy reads the same file and reports the same set, so an engineer runs whichever copy is nearest rather than the right one.

**It is here for now, and a package of its own is the likely next position.** `foundation` is where it reaches every project from, being the package every project has — not because discovery is foundational. A package of its own would carry it to the engineers who want it and no others. It would be the first Waytide package that is a **tool** rather than a set of rules.

**`report-unrecognized-mode.sh` was decommissioned on 2026-08-18**, with the mode mechanism whose rule it read. It reported a mode rule in `waytide/local/rules/` naming a mode the installed rule no longer defined, and there is no such rule to read.

**`refresh-packages.sh` also checks the bootstrap.** The root `AGENTS.md` is written by `install.sh`, belongs to no package, and is therefore the one activated file no `git subtree pull` can reach. So a refresh updates the packages beneath it and leaves it behind.

The script used to print a reminder saying so. On 2026-08-06 every consuming project's bootstrap was found stale anyway, which is what a reminder is worth. It now compares the section against what the installed installer generates, at the moment the drift is created.

The comparison cannot always be made. There may be no `AGENTS.md`, or an installer predating the `bootstrap` subcommand it asks for. It then says the check did not happen rather than reporting agreement. It never invokes an installer that would treat the request as an install.

Foundation carries an **`install.sh`**, which also has to activate the system. Run it from your project root:

```
./install.sh
```

It installs foundation and then places a **root `AGENTS.md`** that tells the agent to read `waytide/system/`, `waytide/local/rules/`, and `waytide/local/vocabulary.md` at the start of every session. That root file is what actually activates the system. `git subtree` can only put files under `waytide/`, never at the project root. Without this step the rules are installed but nothing reads them. If you already have an `AGENTS.md`, the script shows you the exact text, explains the effect, and asks before appending. It never edits your file silently.

It also **renames `waytide/local/logs/work-sessions/` if your project still holds it under its old name**, `waytide/local/sessions/`. This is the one place the installer touches your project's own working state. It moves the directory only when the old name is present and the new one is absent. Where the two exist it reports them and changes nothing, leaving the merge to you.

You can install with plain `git subtree` instead, but then you must add the root `AGENTS.md` yourself or the system stays inactive:

```
git subtree add  --prefix waytide/system/foundation git@github.com:waytide/foundation.git master --squash
git subtree pull --prefix waytide/system/foundation git@github.com:waytide/foundation.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/waytide/foundation.git` in place of the address above. A script takes `WAYTIDE_ORIGIN=https://github.com/waytide` for the same reason.

This package has no dependencies. (The composite `install-all.sh` installs every package and runs this same bootstrap for you.)

**Refresh from upstream** periodically to pull the latest rules. Once foundation is installed, one command refreshes every installed package:

```
waytide/system/foundation/refresh-packages.sh
```

**A package's repository is its installed path with the slashes flattened to dashes**, so a nested `group/name` publishes to `group-name`. **A package may declare a different one**, on a `**Repository:**` line in its `README.md` — the plain text data attribute form the rest of the system reads. `refresh-packages.sh` reads that line where it is present and derives the name where it is not, which is every package but one.

The declaration exists because a repository name is met by people as well as by scripts. The Ruby package installs at `waytide/system/ext/ruby-lang/` and is published from `waytide/waytide-ruby`, which the flattening does not produce.

It reports each package that moved and the rule files that changed in it. Those files are binding, and a silent refresh would be a change of behavior nobody saw. Name packages to refresh only those (`… refresh-packages.sh testing git`). Set `WAYTIDE_ORIGIN` to refresh from a fork or a mirror instead of `https://github.com/waytide`. A single package can still be pulled directly:

```
git subtree pull --prefix waytide/system/foundation git@github.com:waytide/foundation.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
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
