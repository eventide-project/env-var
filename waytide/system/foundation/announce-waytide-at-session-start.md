# The harness announces Waytide's installation; the agent never prints the notice

A project running Waytide announces the system's presence through **two surfaces the harness renders**, not through anything the agent says:

- **A session-start notice.** A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories actually present and emits a notice — what is installed, and what the developer can type to have it read:

```
Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git

Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

To load them now, type: load waytide.
```

  Between the install line and the closing ask the notice reports **experiments and features
  that have not concluded**, on a further line each, when there are any:

```
Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
2 experiments open: shipped-test-tree-script (suspended), gate-forecasting (no state recorded)
1 feature open: upload-retries (suspended)

Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

To load them now, type: load waytide.
```

  **The notice carries no mark.** Waytide's mark led it, immediately above the install line,
  from 2026-08-05 until 2026-08-06, and it now heads the **rule read** instead, printed by the
  agent — see the initialization-rule. A mark stands for the system
  being brought into force, and a hook runs before the session, so this was the one surface that
  could only ever show it at a moment when nothing was being loaded. The mismatch was already
  written into the notice's own wording, which says **installed** and never *loaded* for exactly
  that reason.

  **The move took a hazard with it.** The mark's backslashes had to be doubled here, because the
  notice is interpolated into a JSON string by `printf` with no escaping and a lone backslash
  begins a JSON escape sequence — `\_` is not a valid one, the harness fails to parse the output,
  and **the notice disappears with no error at all**. That constraint is now off the art
  entirely; it still governs everything else this hook emits, and the load line's
  no-quotation-marks rule below is the same hazard arriving through a different character.

  **`WAYTIDE_QUIET` still silences the mark**, but no longer by silencing this notice. The agent
  prints the mark and cannot read the environment, so the opt-out reaches it as a sentence
  appended to the read instruction. The read instruction itself stays unsilenced, as it always
  has.

  Each record under `waytide/local/experiments/` and `waytide/local/features/` is read for its
  canonical `**State:**` line (see the experiments-convention and the
  features-convention). An experiment whose state is **Affirmed**, **Refuted**,
  **Inconclusive**, **Abandoned**, or **Superseded** has concluded, as has a feature that
  is **Completed**, **Abandoned**, or **Superseded**; those are not reported. **Suspended**
  and a record carrying no state line are. When every
  experiment has concluded the second line is absent entirely, so the notice grows only
  when there is something open.

  **Why the notice carries it.** The lifecycle requires that an experiment never be left
  silently open, but nothing was enforcing that across sessions. The working directories
  under `waytide/` are not read at session start, so an open experiment goes unnoticed
  unless something names it — and an experiment worked in a **worktree** leaves no trace
  at all in the main working tree, which stays on the upstream branch, so not even the
  branch name gives it away. The configuration that best isolates an experiment is the
  one that most easily loses track of it.

- **A status line.** `waytide/system/foundation/statusline.sh` keeps the system's presence on screen for the whole session, alongside the working directory and git branch, so the fact stays available instead of scrolling away:

```
waytide · master :: Waytide
waytide · master · uncommitted changes :: Waytide
waytide · master · untracked files :: Waytide
waytide · master · uncommitted changes · untracked files · unpushed commits :: Waytide
```

  **The repository's name leads the line, in bold.** It is the first orientation the line
  gives — which repository this is — and every segment after it annotates that: the branch,
  the uncommitted and unpushed work, the system in force. Bold separates the subject from
  its annotations, so the line is read at a glance rather than parsed left to right. It is a
  terminal escape sequence, which the harness passes through; only the repository name takes
  one, since a line where several segments are emphasized emphasizes nothing.

  **The Waytide segment is one word and carries no package count.** It did carry one until
  2026-07-28. The count told a developer nothing they act on, changed only when a package
  was installed or removed, and competed for width with the segments that do change. What
  the line is for here is the standing fact that the system is in force. Presence is still
  read from disk — at least one directory carrying a `README.md`, the same test for a
  package the notice uses — so only the display drops the number; the on-demand detail is
  the status report's job (see the status-report-format rule).

  **The Waytide segment trails after a double colon.** It was a hyphen until 2026-07-28. A
  hyphen also joins words, so it read as punctuation inside the sentence of segments rather
  than as the break between the developer's own state and the system standing behind it. The
  double colon separates and does nothing else, which is the whole of what is wanted there.
  The middle dot between the developer's own segments is unaffected — the two marks now
  differ from each other, which is what makes the trailing segment read as an annotation on
  the line rather than another item in it.

  **The uncommitted changes segment** appears only when the working tree has something
  not committed — a modified tracked file, a staged change, or an untracked file that is
  not ignored. All three are uncommitted, and the untracked case is the point rather than
  noise: a file left untracked is usually one that should be added or ignored. Absence is
  the clean signal, as it is for the notice's open experiments and features. It is words
  rather than a mark on the branch — `master*` is the conventional form and means nothing
  until a reader is taught it.

  **The untracked files segment** names the one of those three states whose remedy differs.
  A modified tracked file is committed; an untracked file is added or ignored, and until it
  is, it is the file most easily lost. Before this segment existed the line reported
  `uncommitted changes` over a tree where nothing had been modified at all — true on the
  axis the segment names, and still misleading, because it sent the developer looking for
  an edit that was not there.

  **An untracked file raises both segments, deliberately.** `uncommitted changes` names the
  **axis** — work that is not in the history — and an untracked file is on it. Narrowing
  that segment to tracked modifications would make the two a partition and cost the axis: a
  developer scanning for whether anything at all is uncommitted would have to read two
  segments to answer one question. The overlap is the price of keeping one segment that
  answers it alone.

  **The unpushed commits segment** is the next state along the same axis: work that is
  committed but exists only in this working copy, and would be lost with it just the same.
  Both segments can be present at once, so each is named in words that read distinctly.

  It carries **no count**, matching the uncommitted segment — the fact worth surfacing is
  that unpushed work exists at all, and git answers "how much" precisely on request. It
  **never reaches the network**: the line renders every turn, so fetching is out of the
  question. It compares against the remote-tracking ref, which reflects the **last fetch**
  rather than the remote as it stands, so what it reports is the last known remote state
  and a stale tracking ref can leave it silent when the remote has moved.

  **A branch with no upstream reports nothing.** "Unpushed" is a claim relative to
  somewhere, and with no upstream configured there is nowhere for it to be relative to — a
  branch that was never going to be pushed is ordinary, and calling it unpushed would be
  false. That does leave an upstream missing *by accident* unreported. It is a different
  fact from the one this segment names, and it is deliberately not folded in.

Both are wired by a committed `.claude/settings.json` that `install.sh` places in the consuming project.

- **The hook also carries the read instruction to the agent, on a separate channel.** The
  `SessionStart` hook emits two things, addressed to two different readers. The **notice**
  goes in `systemMessage`, which the harness renders for the developer. The **instruction to
  read the rules** goes in `hookSpecificOutput.additionalContext`, which reaches the agent's
  context and is never displayed. They are not the same text, because they are not for the
  same reader: the developer does not need an instruction addressed to the agent restated
  every session.

  The instruction states that the read is **unconditional** — that the apparent size of the
  first request is not a reason to defer it. That is the failure it answers: a session opened
  with a one-line request, the read was judged not worth it, and the session grew into rule
  edits, a work session record, and two package publishes governed by rules that were never read.
  Reading on demand kept producing locally plausible results, so nothing ever announced the
  gap.

  **What it does not do is verify the read.** Nothing here can: the hook runs before the
  session and cannot observe what the agent then does. It removes one specific excuse — the
  instruction being buried in a prose file the agent may not open — and no more. The
  verification remains what it has always been, the work honoring the rules.

- **The notice closes by naming the command that loads the rules.** `Waytide's rules are
  loaded before your first instruction will be processed. Loading the rules will take a few
  moments.` then, on its own line, `To load them now, type: load waytide.` The close is
  always present, and it is the one part of the notice that asks for something rather than
  reporting.

  **A blank line precedes it.** Everything above the close reports — what is installed, and
  what has been left open. The close is the only part of the notice that asks the developer
  to do something, and run together with the report it reads as one more reported fact, with
  the command to type sitting at the bottom of an undifferentiated block. The blank line
  marks the change of purpose. It falls **after** the open-experiment and open-feature
  lines, not between them and the install line: those lines are part of the report, so
  breaking there would separate the report from itself and leave the ask still joined to
  half of it.

  **A second blank line stands the command sentence on its own line.** The two closing
  sentences were one line until 2026-07-30, so the command ended it but was still the tail
  of a paragraph, and reaching the words to be typed meant reading the caveat ahead of them
  first. On its own line the command is the whole of the notice's last line — read and
  copied without reading past anything — which is what putting it last was for. It costs a
  line of height, and buys the one thing the notice asks for standing where nothing else
  competes with it.

  **Something the developer types is required, whatever it says.** Nothing the hook supplies
  can execute on its own — an agent produces nothing until the developer speaks — so the
  read cannot happen before some first message exists. What the line settles is only what
  that first message should be.

  **The command names the read outright, and carries no emphasis markup.** `load waytide`
  says what it does, so a developer who has never seen this system can act on it without
  being told what the word stands for. The line also
  states the two facts a developer needs before deciding whether to type it: that the rules
  load ahead of their first instruction either way, and that loading takes a few moments.

  **The caveat says a few moments, not a moment.** It read `a moment` until 2026-07-28. A
  moment describes an interval short enough to wait through without noticing it, and the
  read is not that: it opens every rule file in every installed package, which is a wait a
  developer sees. Understating it makes the notice's one caveat the part of the line least
  worth trusting. The plural says the length the wait actually has while staying informal,
  which is the register the rest of the line is in.

  **The command sentence comes last.** Until 2026-07-28 the two closing sentences ran the
  other way — the command, then the caveat that loading takes a moment — so the close ended
  on its cost and the words to be typed sat in the middle of it. Swapping them puts the
  caveat where a developer reads it before deciding and leaves the command last, which is
  where the eye settles and where it can be copied without reading past it. The order of the
  two is the whole of that change; both sentences are still present, and the first sentence
  still leads. Standing the command on its own line came later, and finishes the same work
  — the order put it last, the break leaves nothing beside it.

  **The notice is plain text, not markdown.** The command was written in markdown bold until
  2026-07-28, on the assumption that the harness renders `systemMessage` as markdown. It does
  not: the asterisks reached the developer literally, so the markup that was to put the typed
  words where the eye lands drew the eye to punctuation instead. Emphasis is not available on
  this channel — the status line's bold repository name is a terminal escape sequence, which
  is a different mechanism and unaffected — and the line does not need it: the command already
  ends the sentence that points at it. Nothing else in the notice takes markup either, for the
  same reason.

  **What that gives up is attributability.** Until 2026-07-28 the line asked for a **foil
  request** — a message with no content of its own, whose only purpose was to give the agent
  an occasion to act on an instruction already in its context. The word was `begin`, and it
  was contentless on purpose: the agent never sees this notice (`systemMessage` renders for
  the developer alone), so `begin` was the entire content reaching the agent and the
  instruction to read came from `hookSpecificOutput.additionalContext`. A read that followed
  could therefore only have come from the hook, and an agent that never received the
  instruction got an opaque word and had to ask what it meant — a loud failure. A named
  command collapses that: the read now happens whether or not the hook's channel reached the
  agent, and no session distinguishes the two. The trade is deliberate — legibility to the
  developer over observability of the mechanism — and it means the hook's channel is no
  longer testable from ordinary use.

  **The hook still carries the whole instruction.** The developer's command names the read,
  but what the agent is to do with it — read `foundation/` first, read each `vocabulary.md`
  a package has,
  read the project's own `local/rules/` as well, leave the other working directories out of
  the read, print the mark at the read's head, print the deferred queue when the read is done,
  wait for the developer's request,
  print no package count — reaches the agent only through `additionalContext`.

  **The instruction names the project's own `local/rules/`, unconditionally.** It named only
  the installed packages until 2026-08-01, which made it **narrower than the rule it exists to
  get followed**: rules-convention requires reading both `waytide/system/` and
  `waytide/local/rules/`, and the `AGENTS.md` bootstrap `install.sh` generates names both. So
  the two surfaces carrying the read disagreed, and the hook — the path this rule calls
  primary, the file route being the one it was written to stop depending on — was the one
  carrying less. A project's own rules are the half no package supplies and no refresh
  restores.

  It is named **whether or not the directory exists**, and the instruction says its absence is
  ordinary rather than an error. A conditional instruction would vary its text by project,
  which is a second thing to keep true; the binding rule and the bootstrap both name it
  without a condition, and this now matches them.

  **It names `local/rules/` and nothing else beside the packages.** The working directories
  beside it are worked with as their own conventions describe and are **not** read as binding
  rules at session start. The instruction says so outright, naming each of them, because an
  instruction naming `local/` rather than `local/rules/` would reverse that settled
  distinction.

  **This rule does not restate that list, and the omission is deliberate.** `session-start.sh`
  builds the instruction and is the only place the directories are enumerated. This rule
  described the instruction and wrote the same list out a second time, and on 2026-08-06 the two
  copies disagreed: the script still named a single mode's planning directories after the rule
  had been corrected to name none. **Neither copy was wrong to exist — the second one was.** A
  reader wanting the list reads the script, which is what actually reaches the agent; a reader
  wanting to know what the instruction is *for* reads this rule. Describing a list and
  reproducing it are different jobs, and only the first belongs here.

  **The instruction also carries the deferred-queue print.** It formerly said the `load
  waytide` command asks for *read the rules, say only that the read is done, and wait for the
  real request* — which, once the print-the-deferred-queue-after-the-rule-read rule existed,
  **forbade what that rule requires**. The instruction now names the print as the last thing
  the read produces.

  **And it names the mark print, and the one file the agent opens ahead of the others.** The
  mark heads the read (see the initialization-rule), and the agent
  has read nothing at the instant it prints — so the instruction names
  `foundation/initialization-rule.md` as the first file to open, which is
  what puts the figure in hand. The **art is not carried here**: it lives in that rule, which is
  what takes it off this JSON channel and out from under the doubled-backslash constraint.

  **It also requires the response that opens that file to carry no prose** — the tool call and
  nothing else, no preamble and no account of what is about to be read. **The initialization-rule cannot
  ask for this**, and that is why the sentence is here: the response it governs is the one that
  reads that rule, so nothing in it is in hand when the agent writes there. This channel is the
  only one that reaches the agent before any file is opened, which is the same reason it names
  the file at all. Without the sentence the read opens on a line of the agent's narration
  standing exactly where the mark is meant to stand — one rule file read ahead of the mark is
  the concession that rule accepted, and a line of prose ahead of it is not.

  **And it carries the prohibition on the agent referring to what that rule carries** — no name
  for it, no substitute word, no description standing in for one, and no citation of the rule by
  name. It travels here for the same reason as the sentence above: the failure it answers is a
  response written **before** the rule is in hand, so a requirement stated only in the rule
  arrives too late to prevent it. The two failures have one cause and now travel on one channel.

  **`WAYTIDE_QUIET` reaches the agent through this instruction, for the mark alone.** Everything
  else the opt-out governs is rendered by the harness from this hook's output, so withholding
  the output silences it. The mark is not — the agent prints it, and cannot read the
  environment. So when the variable is set, the instruction gains a sentence saying to print no
  mark, and says in the same breath that the read and the deferred queue are unaffected. That is
  the opt-out's existing boundary restated where it now has to be enforced, not a new one.

  **The line says the rules are loaded; the notice's first line still says installed.** They
  are different claims about different things. The first line reports what a pre-session hook
  can observe — that the packages are on disk and the configuration is live. This line
  describes what the session does next, and offers the command that does it now; it reports
  no read as having happened.

  **No quotation marks, and they must not be added.** The notice and the instruction are
  both interpolated into a JSON string built by `printf` with no escaping, so a double quote
  would terminate the string and the harness would fail to parse the output — the notice
  would disappear with no error at all, which is the silent failure this whole mechanism
  exists to avoid.

- **The agent does not print a notice.** Not at session start, not before the first response, not at all. The harness has already printed it, and an agent-printed copy would only duplicate it. **What this forbids is the notice**, not everything the agent prints at the start of a session. Two things it prints are not the notice and duplicate nothing the harness emits: the **mark**, at the head of the read, and the **deferred queue**, once the read is done. See the initialization-rule and the print-the-deferred-queue-after-the-rule-read rule. Both are bounded to the read and neither recurs, which is the reason each sits there rather than in this notice — a segment here renders every session and would stop being read.
- **Enumerate what is actually on disk.** The scripts list the package directories under `waytide/system/` (or `system/` in the authoring source). A directory carrying a `README.md` is a package — which is what distinguishes `code/ruby` (a package) from `code/` (a grouping directory). Nothing prints a fixed list; the notice reflects the real install because the directories must be read to produce it.
- **What the notice claims is narrow, and its wording says so.** It reports that the system is **installed** and its configuration is live. It says nothing about whether the rules were read or internalized — the agent is not its author, so it cannot vouch for the agent. That verification comes from the work honoring the rules, as it always did. **Carrying the read instruction does not widen this claim.** Instructing and vouching are different acts: the hook tells the agent to read the rules, and still reports nothing about whether it did.
- **The notice says "installed", never "loaded".** The two words claim different things, and only one of them is observable at the moment the notice prints. A hook runs **before** the session, so no rule file has been read yet — the notice and the read instruction are emitted in the same output, which means the notice is printed at the very moment the reading is still being asked for. "Loaded" means brought into a runtime, read in; that is precisely the fact the hook cannot establish. The notice earlier used it anyway, so the rule's narrow claim and the script's wording disagreed, and the wide reading was the one a developer actually saw. Nothing about the timing can be fixed — no message emitted before a session can report on what the session then does — so the correction is the verb, not the mechanism. The same holds for the term: this is the **session-start notice**, not "the load notice", and the status line reports the system **active**, which is a claim about the configuration rather than the agent.
- **A project that ignores `.claude/` is warned.** The notice travels only if
`.claude/settings.json` is committed, so `install.sh` checks whether git is set to
ignore that path and — when it is, and the file is not already tracked — prints how to
correct it. Without the check the install reports success while the notice stays on one
machine: it works for whoever ran the install and reaches nobody else on the team. Git
cannot re-include a file inside an excluded directory, so a negation added under a
`.claude/` rule does nothing; the rule has to become `.claude/*` plus
`!.claude/settings.json`, which keeps each developer's personal
`.claude/settings.local.json` ignored.
- **Adopting the status line replaces the developer's own.** A project-level `statusLine` overrides whatever the developer configured for themselves. That is why the script also renders the directory and branch, and why `install.sh` never merges into an existing `.claude/settings.json` — it prints the block and leaves the choice with the developer.

**Opt-out:** set the `WAYTIDE_QUIET` environment variable to any non-empty value and both surfaces go quiet, along with the mark the agent prints at the head of the read. **The two are silenced differently**: the harness renders them from this hook's output, so withholding the output is enough, while the mark is the agent's and is silenced by a sentence appended to the read instruction. **It does not silence the read instruction itself**, which is not a surface — the developer never sees it. Quieting a display must not disable the mechanism that carries the rules to the agent, or a personal preference would silently deactivate the system's governance, which is the class of failure the hook exists to answer. A developer sets it however they like — shell profile, `direnv`, or a personal `.claude/settings.json` `env` block. The opt-out lives in the developer's own environment, never in committed project content, so silencing is a personal preference and the default-on behavior travels with the repository to everyone who checks it out.

**What this costs:** the mechanism is specific to harnesses that read `.claude/settings.json`. Under any other harness there is no notice until equivalent glue is written for it — the system still loads through the `AGENTS.md` bootstrap, but silently. A harness setting that disables all hooks silences it too, and a newly placed `.claude/settings.json` may not take effect until the harness reloads its configuration.

**Why:** the notice was previously printed by the agent, on an instruction carried in the `AGENTS.md` bootstrap, and it failed in two ways at once. It was **unreliable** — it depended on the agent obeying a line buried in a long prose file, and when it did not fire, nothing revealed that. And it was **badly placed** — a line of plain text inside a reply, which either cluttered the response or was scrolled past, so it could be emitted correctly and still go unseen. Both failures have one source: the party being announced was also the announcer. Moving the notice to the harness removes the dependence on agent compliance and puts the message outside the response body, where it neither competes with an answer nor hides inside one. The ordering problem — whether the notice precedes the first response — disappears with it, because a hook runs before the session rather than inside it.

**How to apply:** wire the notice through `.claude/settings.json`, pointing the `SessionStart` hook and `statusLine` at the two foundation scripts; `install.sh` does this for a consuming project. Never print a session-start notice as an agent. Keep the mark out of the notice — it heads the rule read now, and the initialization-rule governs it. Keep the scripts reading the real directories rather than asserting a list, and keep the notice claiming **installation** rather than a load — the word has to stay inside what a pre-session hook can observe. Keep the notice and the read instruction on their separate channels — `systemMessage` for the developer, `hookSpecificOutput.additionalContext` for the agent — and keep the instruction firing when `WAYTIDE_QUIET` is set. Keep the instruction naming the project's own `local/rules/` alongside the packages, unconditionally and with the other working directories explicitly left out, and keep it naming the deferred-queue print as what follows the read. Do not restate the instruction's list of working directories here — `session-start.sh` enumerates them and this rule describes what the enumeration is for, so a second copy is a second thing to keep true and has already drifted once. Keep it naming the print and the initialization-rule as the one file opened ahead of the others, keep it requiring the response that opens that file to carry the tool call and no prose, keep it carrying the prohibition on the agent referring to what that rule carries, and keep the `WAYTIDE_QUIET` sentence appended to the instruction when the variable is set — that is the only channel the opt-out has to the mark. Keep the mark's art out of this hook: it belongs in the rule, where it is not a JSON literal. Keep the load command worded the same in both channels — the notice tells the developer to type `load waytide`, and the instruction tells the agent that command asks for the read and nothing more — and keep the command the notice's **last** sentence, on a line of its own, with the loading-takes-a-moment caveat ahead of it. Keep both blank lines — the one separating the notice's report from the closing ask, placed after any open-experiment and open-feature lines, and the one separating the caveat from the command sentence. Write the notice as plain text, with no markdown markup, since the harness renders it literally. Keep the repository name bold in the status line — a terminal escape sequence, the one emphasis that does render — and leave every other segment plain. Keep the developer's own segments separated by the middle dot and the trailing Waytide segment set off by the double colon, and keep an untracked file raising both the uncommitted and the untracked segment. Related: the initialization-rule (the mark, which this notice no longer carries), the print-the-deferred-queue-after-the-rule-read rule (the read's other bookend), the rules-convention (the rule format and where the bootstrap lives), the foundation `install.sh` that places the bootstrap files, and the status-report-format rule (the on-demand report that answers in detail what is installed).

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
