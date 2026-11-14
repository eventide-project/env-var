# The harness announces Slasher's installation, and the agent never prints the notice

**Trigger:** When changing the session-start notice, the startup display, the status line, or their hooks or scripts

- **Solubility:** 24
- **Original rank:** 10 of 106
- **Unclarity:** 0.52

A project running Slasher announces the system's presence through **three surfaces the harness renders**, not through anything the agent says:

- **A session-start notice.** The Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`. That script reads the package directories actually present and emits a notice. The notice says what is installed:

```
Slasher installed at slasher/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
```

  Below the install line, after a blank line, the notice reports **experiments and features that have not concluded**. They take one further line together, when there are any:

```
Slasher installed at slasher/system/ — 5 packages: foundation, language, testing, design-by-efferent, git

3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)
```

  **The notice carries no mark of its own.** The startup display, which holds the mark, leads the same message, ahead of the notice. `session-start.sh` takes it from `startup-display.sh message`. See the the-startup-display-prints-as-the-session-starts rule.

  A mark stands for the system being brought into force, and a hook runs before the session. So this was the one surface that could only ever show it at a moment when nothing was being loaded. The mismatch was already written into the notice's own wording, which says **installed** and never *loaded* for exactly that reason.

  **The move took a hazard with it.** The mark's backslashes had to be doubled here. The notice is interpolated into a JSON string by `printf` with no escaping, and a lone backslash begins a JSON escape sequence. `\_` is not a valid one, the harness fails to parse the output, and **the notice disappears with no error at all**. That constraint is now off the art entirely. It still governs everything else this hook emits, and the load line's no-quotation-marks rule below is the same hazard arriving through a different character.

  Each record under `slasher/local/implementations/` is read for its canonical `**State:**` line (see the the-implementations-directory-holds-one-record-per-implementation rule). An implementation whose state is **Affirmed**, **Refuted**, **Inconclusive**, **Completed**, **Abandoned**, or **Superseded** has concluded, whatever its kind. Those are not reported. **Active**, **Suspended**, and a record carrying no state line are. When every implementation has concluded that line is absent entirely, so the notice grows only when there is something open.

  **Why the notice carries it.** The lifecycle requires that an implementation never be left silently open, but nothing was enforcing that in every session. The working directories under `slasher/` are not read at session start, so an open experiment goes unnoticed unless something names it. An experiment worked in a **worktree** leaves no trace at all in the main working tree, which stays on the upstream branch. So not even the branch name gives it away. The configuration that best isolates an experiment is the one that most easily loses track of it.

- **A status line.** `slasher/system/foundation/statusline.sh` keeps the system's presence on screen for the whole session, alongside the working directory and git branch. The fact then stays available instead of scrolling away:

```
slasher · master :: Slasher
slasher · master · uncommitted changes :: Slasher
slasher · master · untracked files :: Slasher
slasher · master · uncommitted changes · untracked files · unpushed commits :: Slasher
```

  **The repository's name leads the line, in bold.** It is the first orientation the line gives — which repository this is. Every segment after it annotates that: the branch, the uncommitted and unpushed work, and the system in force. Bold separates the subject from its annotations, so the line is read at a glance rather than parsed left to right. It is a terminal escape sequence, which the harness passes through. Only the repository name takes one, since a line where several segments are emphasized emphasizes nothing.

  **The Slasher segment is one word and carries no package count.** The count told an engineer nothing they act on. It changed only when a package was installed or removed, and it competed for width with the segments that do change. What the line is for here is the standing fact that the system is in force.

  Presence is still read from disk: at least one directory carrying a `README.md`, the same test for a package the notice uses. So only the display drops the number. The on-demand detail is the status report's job (see the a-status-report-prints-a-fixed-whole-project-report rule).

  **The Slasher segment trails after a double colon.** A hyphen would also join words. So it would read as punctuation inside the sentence of segments, not as the break between the engineer's own state and the system standing behind it. The double colon separates and does nothing else, which is the whole of what is wanted there.

  The middle dot between the engineer's own segments is unaffected. The two marks now differ from each other. That is what makes the trailing segment read as an annotation on the line rather than another segment in it.

  **The uncommitted changes segment** appears only when the working tree has something not committed. That is a modified tracked file, a staged change, or an untracked file that is not ignored. All three are uncommitted, and the untracked case is the point rather than noise. A file left untracked is usually one that should be added or ignored. Absence is the clean signal, as it is for the notice's open experiments and features. It is words rather than a mark on the branch — `master*` is the conventional form and means nothing until a reader is taught it.

  **The untracked files segment** names the one of those three states whose remedy differs. A modified tracked file is committed. An untracked file is added or ignored, and until it is, it is the file most easily lost. Before this segment existed the line reported `uncommitted changes` over a tree where nothing had been modified at all. That was true on the axis the segment names, and still misleading: it sent the engineer looking for an edit that was not there.

  **An untracked file raises the two segments, deliberately.** `uncommitted changes` names the **axis** — work that is not in the history — and an untracked file is on it. Narrowing that segment to tracked modifications would make the two of them a partition and cost the axis. An engineer scanning for whether anything at all is uncommitted would have to read two segments to answer one question. The overlap is the cost of keeping one segment that answers it alone.

  **The unpushed commits segment** is the next state along the same axis. It is work that is committed but exists only in this working copy, and would be lost with it just the same. The two segments can be present at once, so each is named in words that read distinctly.

  It carries **no count**, matching the uncommitted segment. The fact worth surfacing is that unpushed work exists at all, and git answers "how much" precisely on request. It **never reaches the network**: the line renders every turn, so fetching is out of the question. It compares against the remote-tracking ref, which reflects the **last fetch** rather than the remote as it stands. What it reports is the last known remote state and a stale tracking ref can leave it silent when the remote has moved.

**A branch with no upstream reports nothing.** "Unpushed" is a claim relative to somewhere, and with no upstream configured there is nowhere for it to be relative to. A branch that was never going to be pushed is ordinary, and calling it unpushed would be false. That does leave an upstream missing *by accident* unreported. It is a different fact from the one this segment names, and it is deliberately not folded in.

**A second line names the implementation under way.** Where a feature or an experiment is Open, Active, or Suspended, the line beneath shows its branch, or the branch of its phase under way, as `feature/receipt.tax-line`. `slasher/system/foundation/current-implementation.sh` finds it, in this repository's arrangement or an installed project's. A phase is under way where its branch exists, and a phase's commits count as work on its implementation. Where more than one implementation is current, the line shows the one most recently acted upon: the one whose branch, or a phase's branch, has the latest commit. Where none is current, there is no second line.

- **A startup display, in two parts.** As the session starts, the session-start part frames the notice: the title and the copyright and license ahead of it, and the load line after it, last. The loading part, the loading line and then the figure, prints on the session's first prompt, whatever it is: the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh` on every prompt, and it prints on the first only. Both read them from the the-startup-display-prints-as-the-session-starts rule, which governs the display.

The notice and the display are wired by the hooks of the Slasher plugin, in `.claude/skills/slasher/`, which `install.sh` assembles in the consuming project. The status line is wired by a committed `.claude/settings.json`, which `install.sh` places too, because a plugin cannot set the main status line.

- **The hook also carries the read instruction to the agent, on a separate channel.** The `SessionStart` hook emits two things, addressed to two different readers. The **notice** goes in `systemMessage`, which the harness renders for the engineer. The **instruction to read the rules** goes in `hookSpecificOutput.additionalContext`, which reaches the agent's context and is never displayed. They are not the same text, because they are not for the same reader. The engineer does not need an instruction addressed to the agent restated every session.

  The instruction states that the read is **unconditional** — that the apparent size of the first request is not a reason to defer it. That is the failure it answers: a session opened with a one-line request, the read was judged not worth it. The session grew into rule edits, a work session record, and two package publishes governed by rules that were never read. Reading on demand kept producing locally plausible results, so nothing ever announced the gap.

  **What it does not do is verify the read.** Nothing here can: the hook runs before the session and cannot observe what the agent then does. It removes one specific excuse — the instruction being buried in a prose file the agent may not open — and no more. The verification remains what it has always been, the work honoring the rules.

- **The notice has no close of its own.** It ends with what it reports: the install, and any experiment or feature left open. The startup display's load line, printed after it in the same message, says when the rules load and that `/load` loads them now. See the the-startup-display-prints-as-the-session-starts rule.

  **Something the engineer types is required, whatever it says.** Nothing the hook supplies can execute on its own, since an agent produces nothing until the engineer speaks. So the read cannot happen before some first message exists. What the line settles is only what that first message should be.

  **The notice is plain text, not markdown.** The harness does not render `systemMessage` as markdown, so asterisks reach the engineer literally. Markup meant to put the typed words where the eye lands would draw the eye to punctuation instead.

  Emphasis is not available on this channel. The status line's bold repository name is a terminal escape sequence, which is a different mechanism and unaffected. And the line does not need it: the command already ends the sentence that points at it. Nothing else in the notice takes markup either, for the same reason.

  **What that gives up is attributability.** The alternative is a **foil request**: a message with no content of its own, such as `begin`, whose only purpose is to give the agent an occasion to act on an instruction already in its context. It is contentless on purpose.

  The agent never sees this notice, since `systemMessage` renders for the engineer alone. So `begin` would be the entire content reaching the agent, and the instruction to read would come from `hookSpecificOutput.additionalContext`. A read that followed could only have come from the hook. An agent that never received the instruction would get an opaque word and have to ask what it meant, which is a loud failure.

  A named command collapses that: the read now happens whether or not the hook's channel reached the agent, and no session distinguishes the two. The trade is deliberate: legibility to the engineer over observability of the mechanism. It means the hook's channel is no longer testable from ordinary use.

**The hook still carries the whole instruction.** The engineer's command names the read. What the agent is to do with it reaches the agent only through `additionalContext`:

  - read `foundation/` first
  - read each `vocabulary.md` a package has
  - read the project's own `local/rules/` and `local/vocabulary.md` as well
  - leave the other working directories out of the read
  - wait for the engineer's request
  - print no package count

  **The instruction names the project's own `local/rules/`, unconditionally.** Naming only the installed packages would make it **narrower than the rule it exists to get followed**. a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule requires reading `slasher/system/` and `slasher/local/rules/`, and the `AGENTS.md` bootstrap `install.sh` generates names the two. So the two surfaces carrying the read would disagree, with the hook carrying less.

  It is the path this rule calls primary, the file route being the one it was written to stop depending on. A project's own rules are the half no package supplies and no refresh restores.

  It is named **whether or not the directory exists**, and the instruction says its absence is ordinary rather than an error. A conditional instruction would vary its text by project, which is a second thing to keep true. The binding rule and the bootstrap name it without a condition, and this now matches them.

  **It has the agent run the loader, `foundation/load-rules.sh`, in one command, and read its whole output.** The loader prints each package's `rules-pre-loaded.md` and `vocabulary.md`, the local rules, the project's vocabulary, and the journal. Each package's `source/` directory and its `README.md` are left out: the source rules are the same rules at full length, and a README summarizes rules the read already carries. The instruction tells the agent to read no rule file one by one, since the loader's output is the read. It also tells the agent what a package's ON DEMAND section is: a list of rules the loader does not print, each with its trigger and the command that loads it. When the act a trigger names comes up, the agent runs that command and follows the rule it prints before acting.

  **It names `local/rules/` and `local/vocabulary.md`, and nothing else beside the packages.** The working directories beside them are worked with as their own conventions describe and are **not** read as binding rules at session start. The instruction says so outright, naming each of them, because an instruction naming `local/` rather than the two would reverse that settled distinction.

**The vocabulary is a file rather than a directory, and it joined the read on 2026-08-10.** A project's own terms and substitutions decide over every package's, so they are binding and cannot be applied unread. The same reason each package's `vocabulary.md` is named. It is named **whether or not it exists**, like `local/rules/`, and its absence is ordinary. Where it sits, and why beside `rules/` rather than inside it, is the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule's.

  **This rule does not restate that list, and the omission is deliberate.** `session-start.sh` builds the instruction and is the only place the directories are enumerated. This rule described the instruction and wrote the same list out a second time. On 2026-08-06 the two copies disagreed. The script still named a single mode's planning directories after the rule had been corrected to name none.

  **Neither copy was wrong to exist — the second one was.** A reader wanting the list reads the script, which is what actually reaches the agent. A reader wanting to know what the instruction is *for* reads this rule. Describing a list and reproducing it are different jobs, and only the first belongs here.

**The instruction ends the read with the wait for the engineer's request.**

**After a compaction, the instruction opens with one more sentence.** The hook runs again when the context is compacted, and it reads the event's source from its input. Where the source is `compact`, the instruction first says that the rules read at the start now survive only as the compaction's summary, which does not hold them, and that the loader is to be run again before the next act. Without that sentence, the instruction given at the start reads as already done: the summary says the read happened, and most sessions went on from the summary. A start, a resume, and a clear get the instruction unchanged.

**After a compaction, the engineer sees one line in place of the startup display and the notice:** `Context compacted. Slasher is reloading its rules.` The session is already under way, so the title, the copyright and license, the install line, the open line, and the load line tell the engineer nothing new. The load line would also be wrong, since the agent reads the rules again without `/load`. The line says what the session does next, as the read instruction does, and reports no read, so it is no exception to *installed, never loaded*.

**The instruction carries the core rules after it, so they hold from the session's start, before the read.** `foundation/core-rules` names them, and the hook adds each as the loader prints it, under a line saying they hold before the read, which still runs in full. A hook can give the agent at most 10,000 characters, and Claude Code saves anything longer to a file the agent is not asked to read. So the core holds only the rules that shape the first answer, and the whole of what the hook gives the agent stays within 10,000 characters. The core rules hold quotation marks and backslashes, which the hook escapes, unlike the notice, which carries none.

**It tells the agent not to print the startup display, because the harness prints it.** Under a later model the display stopped reaching the engineer, skipped or written into the agent's thinking, and nothing reported it. The plugin's hooks now print it, as the session starts and on its first prompt (see the the-startup-display-prints-as-the-session-starts rule). The **art is not carried on this channel either**. The display hook reads it from that rule.

  **The instruction says the rules are to be read. The notice's install line still says installed.** They are different claims about different things. The install line reports what a pre-session hook can observe — that the packages are on disk and the configuration is live. The instruction describes what the session does next. It reports no read as having happened.

  **No quotation marks, and they must not be added.** The notice and the instruction are each interpolated into a JSON string built by `printf` with no escaping. A double quote would terminate the string, and the harness would fail to parse the output. The notice would disappear with no error at all, which is the silent failure this whole mechanism exists to avoid.

- **The agent does not print a notice.** Not at session start, not before the first response, not at all. The harness has already printed it, and an agent-printed copy would only duplicate it. **The agent does not print the startup display either.** That is the third surface the harness renders. Its session-start part frames the notice's message as the session starts, and its loading part prints on the session's first prompt. See the the-startup-display-prints-as-the-session-starts rule. The agent prints two things at the start, because each needs markdown: the package set stanza, where a project shows one, and the command domain table, at the end of the session-start read. See the the-command-domain-table-prints-when-the-rules-have-loaded rule.
- **Enumerate what is actually on disk.** The scripts list the package directories under `slasher/system/` (or `system/` in the authoring source). A directory carrying a `README.md` is a package — which is what distinguishes a grouped package (one carrying a README) from the grouping directory above it. Nothing prints a fixed list. The notice reflects the real install because the directories must be read to produce it.
- **What the notice claims is narrow, and its wording says so.** It reports that the system is **installed** and its configuration is live. It says nothing about whether the rules were read or internalized — the agent is not its author, so it cannot vouch for the agent. That verification comes from the work honoring the rules, as it always did. **Carrying the read instruction does not widen this claim.** Instructing and vouching are different acts: the hook tells the agent to read the rules, and still reports nothing about whether it did.
- **The notice says "installed", never "loaded".** The two words claim different things, and only one of them is observable at the moment the notice prints. A hook runs **before** the session, so no rule file has been read yet. The notice and the read instruction are emitted in the same output. So the notice is printed at the very moment the reading is still being asked for. "Loaded" means brought into a runtime, read in. That is precisely the fact the hook cannot establish. The notice earlier used it anyway, so the rule's narrow claim and the script's wording disagreed, and the wide reading was the one an engineer actually saw. Nothing about the timing can be fixed — no message emitted before a session can report on what the session then does — so the correction is the verb, not the mechanism. The same holds for the term: this is the **session-start notice**, not "the load notice", and the status line reports the system **active**, which is a claim about the configuration rather than the agent.
- **A project that ignores `.claude/` is warned.** The notice travels only if the plugin is committed, and the status line only if `.claude/settings.json` is, so `install.sh` checks whether git is set to ignore either path. When it is, and the file is not already tracked, it prints how to correct it. Without the check the install reports success while the notice stays on one machine. It works for whoever ran the install and reaches nobody else on the team. Git cannot re-include a file inside an excluded directory, so a negation added under a `.claude/` rule does nothing. The rule has to become `.claude/*` plus `!.claude/settings.json` and `!.claude/skills/`, which keeps each engineer's personal `.claude/settings.local.json` ignored.
- **Adopting the status line replaces the engineer's own.** A project-level `statusLine` overrides whatever the engineer configured for themselves. That is why the script also renders the directory and branch, and why `install.sh` never merges into an existing `.claude/settings.json` — it prints the block and leaves the decision with the engineer.

**There is no opt-out.** An option whose whole purpose is to make the system invisible while it is in force sits against every reason these surfaces exist.

The notice, the status line, and the printed copyright and license are each there for one reason. A system read at the start of every session should say so. The `SLASHER_QUIET` variable was the one sanctioned way to have it in force and say nothing.

What it never silenced was the read instruction itself — quieting a display must not disable the mechanism that carries the rules. That guarantee is unaffected by its removal, since nothing about the read ever depended on it.

**What this costs:** the mechanism is specific to harnesses that load a plugin from `.claude/skills/` and read `.claude/settings.json`. Under any other harness there is no notice until equivalent glue is written for it. The system still loads through the `AGENTS.md` bootstrap, but silently. A harness setting that disables all hooks silences it too, and a newly placed plugin or `.claude/settings.json` may not take effect until the harness reloads its configuration.

**Why:** the notice was previously printed by the agent, on an instruction carried in the `AGENTS.md` bootstrap, and it failed in two ways at once. It was **unreliable**. It depended on the agent obeying a line buried in a long prose file, and when it did not fire, nothing revealed that. And it was **badly placed**. A line of plain text inside a reply either cluttered the response or was scrolled past. So it could be emitted correctly and still go unseen.

The two failures have one source: the party being announced was also the announcer. Moving the notice to the harness removes the dependence on agent compliance. It puts the message outside the response body, where it neither competes with an answer nor hides inside one. The ordering problem disappears with it. That is whether the notice precedes the first response, and a hook runs before the session rather than inside it.

**How to apply:** wire the notice and the display through the Slasher plugin's `SessionStart` and `UserPromptSubmit` hooks, and the status line through `.claude/settings.json`, each pointing at its foundation script. `install.sh` does this for a consuming project. Never print a session-start notice as an agent.

Keep the mark out of the notice's own text — the startup display carries it, ahead of the notice, and the the-startup-display-prints-as-the-session-starts rule governs it. Keep the scripts reading the real directories rather than asserting a list. Keep the notice claiming **installation** rather than a load. The word has to stay inside what a pre-session hook can observe.

Keep the notice and the read instruction on their separate channels. `systemMessage` is for the engineer, and `hookSpecificOutput.additionalContext` is for the agent. Keep the instruction firing unconditionally.

Keep the instruction naming the project's own `local/rules/` and `local/vocabulary.md` alongside the packages. Name them unconditionally, with the other working directories explicitly left out. Do not restate the instruction's list of working directories here. `session-start.sh` enumerates them, and this rule describes what the enumeration is for. A second copy is a second thing to keep true, and it has already drifted once.

Keep it telling the agent not to print the startup display. Add no opt-out: these surfaces are not silenceable, and the read instruction is emitted every session. Keep the mark's art out of this hook's script: it belongs in the startup display rule, where it is not a JSON literal, and `session-start.sh` takes it from `startup-display.sh message`, which escapes it.

Keep the load command named in both channels. The startup display's load line, after the notice, tells the engineer to type `/load`. The instruction tells the agent that `/load`, or `load rules`, asks for the read and nothing more. `/load` is the same command delivered as a skill, typed `/load` or `/slasher:load`. It asks for the same read and nothing more. It takes the read instruction from `session-start.sh instruction`, which prints the instruction alone, as plain text, so `/load` and `load rules` follow one text.

Keep the notice ending with what it reports. The startup display's load line, after it, names `/load`.

Write the notice as plain text, with no markdown markup, since the harness renders it literally. Keep the repository name bold in the status line. It is a terminal escape sequence, the one emphasis that does render. Leave every other segment plain.

Keep the engineer's own segments separated by the middle dot. Set the trailing Slasher segment off by the double colon. Keep an untracked file raising the uncommitted segment as well as the untracked one.

## Compressed

1. The harness announces Slasher, through three surfaces it renders.
2. The agent prints no notice, at session start or at any other time.
3. An agent-printed copy would only duplicate the harness's.
4. The agent prints two things at the start, because each needs markdown: the package set stanza, where a project shows one, and the command domain table, at the end of the session-start read.

## The session-start notice

1. The Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice:

```
Slasher installed at slasher/system/ — 5 packages: foundation, language, testing, design-by-efferent, git

3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)
```

2. The install line enumerates what is on disk.
3. A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it.
4. Nothing prints a fixed list.
5. The open line, after a blank line below the install line, names experiments and features that have not concluded, read from each record's `**State:**` line under `slasher/local/implementations/`.
6. An implementation that is Affirmed, Refuted, Inconclusive, Completed, Abandoned, or Superseded has concluded, whatever its kind.
7. One that is Active, Suspended, or carries no state line is reported.
8. With nothing open, the open line is absent.
9. The open line exists because an implementation must never be left silently open. One worked in a worktree leaves no trace in the main working tree.
10. The notice has no close of its own. It ends with what it reports. The startup display's load line, after it in the same message, says when the rules load and that `/load` loads them now.
11. Something the engineer types is required in any case, since the agent produces nothing until the engineer speaks.
12. This gives up a contentless foil word whose only effect came through the hook's channel. So that channel is no longer testable from ordinary use.
13. The trade of observability for legibility is deliberate.
14. The notice says `installed`, never `loaded`.
15. A hook runs before the session. It can observe that the packages are on disk and the configuration is live, and not that any rule was read.
16. The read instruction describes what the session does next, and reports no read.
17. Call it the session-start notice, not the load notice.
18. The status line reports the system active, a claim about the configuration rather than the agent.
19. The notice is plain text. The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation.
20. The notice carries no mark of its own. The startup display, which holds it, leads the same message, taken from `startup-display.sh message` (see the the-startup-display-prints-as-the-session-starts rule).
21. Put no quotation marks, and no lone backslash, in anything the hook emits.
22. `printf` interpolates the notice and the instruction into a JSON string with no escaping.
23. A double quote ends the string, and a lone backslash begins an invalid escape.
24. Either way the harness fails to parse the output, and the notice disappears with no error.
25. After a compaction, one line stands in place of the startup display and the notice: `Context compacted. Slasher is reloading its rules.` It says what the session does next, and reports no read.

## The read instruction

1. The same hook carries the read instruction to the agent on a separate channel.
2. The notice goes in `systemMessage`, for the engineer.
3. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent and is never displayed.
4. They are different texts for different readers.
5. The read is unconditional. The apparent size of the first request is not a reason to defer it.
6. A session opened with a one-line request once skipped the read. It grew into rule edits and publishes governed by rules never read.
7. The hook carries the whole instruction, as the following points state.
8. The instruction tells the agent to run `foundation/load-rules.sh` in one command and read its whole output. The loader's output is the read, so no rule file is read one by one.
9. The loader prints each package's `rules-pre-loaded.md` and `vocabulary.md`, `foundation/` first, then the local rules, the project's vocabulary, and the journal. It leaves out each package's `source/` and `README.md`.
10. Its ON DEMAND section lists the rules it does not print, each with its trigger and the command that loads it. When the trigger's act comes up, the agent runs that command and follows the rule before acting.
11. Name `local/rules/` and `local/vocabulary.md` whether or not each exists, and say that the absence of either is ordinary, not an error. Never name `local/` as a whole.
12. Name the other working directories, as not read as binding rules at session start.
13. Do not print the startup display.
14. Print no package count.
15. Then wait for the engineer's request.
16. After a compaction, the instruction opens by saying the rules now survive only as the compaction's summary, and that the loader is to be run again before the next act. The hook reads the event's source from its input. A start, a resume, and a clear get the instruction unchanged.
17. The instruction carries the core rules after it, the rules `foundation/core-rules` names, each as the loader prints it, under a line saying they hold before the read, which still runs in full. The core holds only the rules that shape the first answer, so the whole of what the hook gives the agent stays within 10,000 characters, the most a hook can give. The hook escapes their quotation marks and backslashes.
18. `load rules` asks for exactly that read and nothing more. The startup display's load line names `/load`, and the instruction names both. `/load`, its skill, typed `/load` or `/slasher:load`, is the same command. It follows the instruction `session-start.sh instruction` prints, the one text both follow.
19. This rule does not restate the directory list.
20. `session-start.sh` is the only place the list is enumerated, since a second copy drifted once.
21. The mark's art is not carried on this channel, and is not written into this hook's script. `startup-display.sh` reads it from the the-startup-display-prints-as-the-session-starts rule and escapes it.
22. Nothing verifies the read. The hook cannot observe what the agent does.
23. The instruction removes one excuse: an instruction buried in a file the agent may not open.
24. Instructing is not vouching: the notice still reports nothing about whether the agent read the rules.
25. The work honoring the rules is the verification.

## The status line

1. `slasher/system/foundation/statusline.sh` keeps the system's presence on screen all session:

```
slasher · master :: Slasher
slasher · master · uncommitted changes · untracked files · unpushed commits :: Slasher
```

2. The repository name leads, in bold. The bold is a terminal escape sequence the harness passes through.
3. The bold repository name is the only emphasis on the line.
4. A middle dot separates the engineer's segments.
5. The Slasher segment trails after a double colon, which separates and does nothing else. So the segment reads as an annotation on the line.
6. The Slasher segment is one word, with no package count.
7. Presence is read from disk, by the same README test the notice uses.
8. The detail is the status report's (see the a-status-report-prints-a-fixed-whole-project-report rule).
9. `uncommitted changes` appears only when there is a modified tracked file, a staged change, or an untracked file that is not ignored.
10. It is words, not a mark like `master*`.
11. `untracked files` names the case whose remedy differs: add or ignore, not commit.
12. An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted.
13. Segments that can show together are named in words that read distinctly.
14. `unpushed commits` appears when committed work exists only in this working copy. It carries no count and never reaches the network.
15. It compares against the remote-tracking ref, so it reflects the last fetch.
16. A branch with no upstream reports nothing, since unpushed is relative to an upstream.
17. An upstream missing by accident is a different fact, and is deliberately not folded into this segment.
18. Where a feature or an experiment is Open, Active, or Suspended, a second line shows its branch, or the branch of its phase under way, as `feature/receipt.tax-line`. `slasher/system/foundation/current-implementation.sh` finds it, in this repository's arrangement or an installed project's.
19. A phase is under way where its branch exists, and its commits count as work on its implementation. Where more than one implementation is current, show the one whose branch, or a phase's branch, has the latest commit.
20. Where none is current, print no second line.

## The startup display

1. As the session starts, the display's session-start part frames the notice's message: the title and the copyright and license ahead of it, and the load line after it, last, read from the the-startup-display-prints-as-the-session-starts rule.
2. On every prompt, the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh`, which prints the loading part, the loading line and then the figure, on the session's first prompt only.
3. The first prompt is when the read starts, whatever the prompt is.
4. The agent does not print it.

## Wiring

1. The committed Slasher plugin, `.claude/skills/slasher/`, wires the notice and the display through its `SessionStart` and `UserPromptSubmit` hooks.
2. A committed `.claude/settings.json` wires the status line, since a plugin cannot set the main status line.
3. `install.sh` assembles the plugin and places `.claude/settings.json` in a consuming project.
4. `install.sh` warns when git ignores `.claude/settings.json` or the plugin and the file is not tracked, and prints how to correct it.
5. The fix is `.claude/*` with `!.claude/settings.json` and `!.claude/skills/`, since git cannot re-include a file inside an excluded directory.
6. The fix keeps `.claude/settings.local.json` ignored.
7. A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too.
8. `install.sh` never merges into an existing `.claude/settings.json`. It prints the block, or the hook entries to remove where the file still runs the session-start scripts, and leaves the decision to the engineer.

## There is no opt-out

1. These surfaces exist so that a system read every session says so.
2. The read instruction is emitted every session. Quieting a display never disables the mechanism that carries it.
3. Add no opt-out, such as a variable that quiets these surfaces.

## What this costs

1. The mechanism works only where a harness loads a plugin from `.claude/skills/` and reads `.claude/settings.json`.
2. Elsewhere the system loads through the `AGENTS.md` bootstrap, silently.
3. A setting that disables hooks silences it too.
4. A newly placed plugin or `.claude/settings.json` may not take effect until the harness reloads.

## Compression

- 2026-10-21, compressed: compression 0.71, change 0.91, solubility 24 → 32, clarity 0.48 → 0.58
- 2026-10-22, checked: 76 directives, 69 kept, 7 less precise, 0 lost
- 2026-10-22, revised: restored directive 28, compression 0.70, change 0.91
- 2026-10-24, revised: written as a numbered list; checked twice, 1 repair, re-checked kept
- 2026-10-27, re-checked: 68 directives, 62 kept, 6 less precise, 0 lost, 6 repairs, re-checked kept
- 2026-10-27, revised: an Active record is reported; checked: 72 directives, 70 kept, 2 less precise, 0 lost; directives 30 and 41 follow the source's wording
- 2026-10-28, revised: Why points removed, solubility 32 → 39, clarity 0.58 → 0.75; checked: 75 directives, 74 kept, 1 less precise, 0 lost
- 2026-10-29, revised: the compiled rules are one file per package and the read runs the loader, solubility 39 → 39, clarity 0.75 → 0.74; checked: 74 directives, 73 kept, 1 less precise, 0 lost; directive 60 left as it was, untouched by this revision
- 2026-10-29, revised: the read instruction's ON DEMAND section, solubility 39 → 39, clarity 0.74 → 0.74; checked: 96 directives, 95 kept, 1 less precise, 0 lost, 1 repair
- 2026-10-29, revised: the instruction after a compaction, solubility 39 → 39, clarity 0.74 → 0.74; checked: 101 directives, 100 kept, 1 less precise, 0 lost; the less precise directive, that the scripts enumerate the package directories, is untouched by this revision
- 2026-10-29, revised: concluded states read the same for both kinds; checked: 74 directives, 66 kept, 5 less precise, 3 lost, 7 repairs to the read instruction; re-checked: 72 kept, 2 less precise, 0 lost, 1 repair; re-checked: 74 directives, 73 kept, 1 less precise, 0 lost. Left less precise: the compaction sentence's wording, which keeps what the agent does
- 2026-11-03, revised: `/load` is the same command as `load slasher`; checked: 47 directives, 47 kept, 0 less precise, 0 lost
- 2026-11-03, revised: `/load` takes the instruction from `session-start.sh instruction`; checked: 67 directives, 64 kept, 3 less precise, 0 lost. Left less precise, none touched by this revision: that the read instruction, like the close, reports no read; that other harnesses need equivalent glue; and why the mark is kept out of the hook
- 2026-11-04, revised: the plugin's hooks carry the notice and the display, and the display leads the notice's message; checked: 64 directives, 64 kept, 0 less precise, 0 lost
- 2026-11-04, revised: the notice's close names `/load`; checked: 63 directives, 62 kept, 1 less precise, 0 lost. Left less precise, untouched by this revision: that a missing upstream is reported nowhere, not only kept out of the unpushed segment
- 2026-11-04, revised: the notice has no close, and the startup display's load line says what it said; checked: 71 directives, 69 kept, 2 less precise, 0 lost. Left less precise, untouched by this revision: that the two local files are the only things named beside the packages, and that `session-start.sh instruction` prints the instruction alone, as plain text
- 2026-11-04, revised: the loading part prints the figure, then the loading line, a change of order in two sentences; not checked, since the compressed point says the same in place
- 2026-11-04, revised: a blank line sets the open line apart from the install line; checked: 84 directives, 81 kept, 3 less precise, 0 lost. Left less precise, none touched by this revision: that the instruction itself states the read is unconditional, why the loader is run again after a compaction, and that other harnesses need equivalent glue
- 2026-11-04, revised: the startup display's load line follows the notice; checked: 79 directives, 76 kept, 3 less precise, 0 lost. Left less precise: that the loading part, like the session-start part, is read from the startup display rule, which the point that the script reads the art from that rule already gives; why the loader is run again after a compaction; and that other harnesses need equivalent glue
- 2026-11-04, revised: the loading part prints the loading line, then the figure, the order the engineer set; not re-checked
- 2026-11-04, revised: the typed command `load slasher` is `load rules`, a term swap the engineer settled; not re-checked
- 2026-11-05, revised: the instruction carries the core rules, within the hook's 10,000 characters; checked: 63 directives, 59 kept, 4 less precise, 0 lost, 2 repairs, to the core rules point; re-checked: 63 directives, 61 kept, 2 less precise, 0 lost. Left less precise: the status line example's in-between lines, which the prose states, and that the loading part is read from the startup display rule, as the art is
- 2026-11-06, revised: the agent prints the command domain table at the end of the session-start read, beside the package set stanza; checked: 103 directives, 99 kept, 4 less precise, 0 lost. Left less precise, none touched by this revision: that the uncommitted changes segment carries no count, that the loading part reads its content from the startup display rule, that the authoring source lists packages under `system/`, and that `session-start.sh instruction` prints the instruction alone, as plain text
- 2026-11-07, revised: the status line's second line names the implementation under way, as points 18 to 20 of the status line; checked: 46 directives, 40 kept, 6 less precise, 0 lost, 2 repairs; re-checked: 46 directives, 42 kept, 4 less precise, 0 lost. Directives 15, 19, 32, and 46, on a missing upstream, the loading part, the compaction, and `/load`, are less precise in text this revision did not change, and are left as they are
- 2026-11-08, revised: after a compaction the notice is one line in place of the startup display, as point 25 of the session-start notice; not re-checked
- 2026-11-09, revised: the second status line takes an Open implementation too; not re-checked
- 2026-11-09, checked: 85 directives, 81 kept, 3 less precise, 1 lost. The directive left lost is when the rule applies, which its Trigger line carries. The three less precise are in text this revision did not change

## History

Until Mon Nov 9 2026 the status line's second line named an Active or Suspended implementation only, since an implementation took no Open state.

Until Sun Nov 8 2026 the engineer saw the whole startup display and notice after a compaction, as at a session's start.

Until Sat Nov 7 2026 the status line was one line, and did not name the implementation under way.

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start. Its standing points are carried by the read instruction the hook gives every session.

Until Thu Nov 5 2026 the hook carried the read instruction alone, and no rule held before the read.

Until Wed Nov 4 2026 the typed command was `load waytide`.

Until Wed Nov 4 2026 the open line sat directly under the install line, with no blank line between them.

Until Wed Nov 4 2026 the notice closed with a caveat, `Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.`, then, on a line of its own, the command to type. The two blank lines ahead of them set the ask apart from the report and the command apart from the caveat.

Until Wed Nov 4 2026 the notice closed with `To load them now, type: load waytide.`, and the command was worded the same in the notice and the instruction.

Until Tue Nov 3 2026 a committed `.claude/settings.json` wired all three surfaces: a `SessionStart` hook ran `session-start.sh`, and a `UserPromptSubmit` hook ran `startup-display.sh` on `load waytide` alone. The display was kept out of the notice because a segment there renders every session and would stop being read. The engineer reversed that, and moved the two hooks into the Slasher plugin.

Until Tue Nov 3 2026 `load waytide` was the only command that asked for the read. `/load`, its skill, was added that day.

Until Thu Oct 29 2026 the concluded states were read by kind: an experiment's verdict words, and a feature's Completed. The engineer settled that the verdict is chosen at the start whatever the kind, so the six concluding words are read the same for both.

Waytide's mark led the notice, immediately above the install line, from 2026-08-05 until 2026-08-06.

The Waytide segment did carry a package count until 2026-07-28.

The caveat read `a moment` until 2026-07-28.

The instruction carried a deferred-queue print from 2026-08-01 until 2026-08-25, when that print was suspended. The clause is removed rather than left naming a rule that no longer exists, and it named `local/deferred/` — a directory removed on 2026-08-18 — for the last week of its life.

The instruction named `foundation/initialization-rule.md` as the first file to open, and asked the agent to print what that rule carries at the head of the read, until 2026-10-10.

A `WAYTIDE_QUIET` environment variable silenced the two surfaces, and what the agent prints at the head of the read, until 2026-08-07. It was removed.

Until Sun Oct 25 2026 this rule was named announce-waytide-at-session-start and titled "The harness announces Waytide's installation. The agent never prints the notice".

Until 2026-07-28 the Waytide segment trailed after a hyphen, the two closing sentences ran the command first and the caveat second, the command was written in markdown bold, and the notice asked for a foil request, the word `begin`, rather than a named command. Until 2026-07-30 the two closing sentences were one line. Until 2026-08-01 the read instruction named only the installed packages, and not the project's own `local/rules/`.

Until Thu Oct 29 2026 the read instruction told the agent to read every rule file under the system, leaving out each package's `source/` directory and `README.md`. Phase 2 of the rule-reduction experiment replaced the file-by-file read with the loader, which prints the whole read in one output.

Until Thu Oct 29 2026 the loader printed every compiled rule. Phase 3 of the rule-reduction experiment, triggers, added each package's ON DEMAND section, and the instruction says what to do with it.

Until Thu Oct 29 2026 the hook gave the same instruction after a compaction as at the start. Phase 4 of the rule-reduction experiment, re-read-after-compaction, added the sentence that asks for the read again.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the startup display, which this notice does not carry and the agent does not print
- the the-command-domain-table-prints-when-the-rules-have-loaded rule — the second thing the agent prints at the start
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the rule format and where the bootstrap lives
- the foundation `install.sh` that places the bootstrap files
- the a-status-report-prints-a-fixed-whole-project-report rule — the on-demand report that answers in detail what is installed

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 2 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 3 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 10:12:41 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:29:18 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 5:10:17 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:29:09 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 11:53:12 PM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:39:47 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:49:26 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:57:27 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 1:04:39 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 1:24:32 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 11:23:01 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 11:33:06 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 11:35:39 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 11:39:45 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 11:50:41 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 11:48:52 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 11:56:04 AM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:10:02 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:27:36 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:13:27 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:23:08 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:35:57 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:47:28 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:08:06 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:44:36 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 11:56:57 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 6:05:55 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:08:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:21:45 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:45:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:39:37 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:34:47 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:46:11 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:43:56 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:07:42 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:39:02 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:26 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:43:00 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:24:19 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:41:18 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 3:12:40 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 3:41:02 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:37:47 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:51:16 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 1:04:41 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 5:47:26 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:01:43 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:07:24 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:11:43 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:22:26 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:40:22 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:34:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:35:33 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:25:11 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:04:16 PM PT
Changed by Scott Bellware on Mon Nov 9 2026 at 9:33:14 PM PT
