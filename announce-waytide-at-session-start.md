# The harness announces Waytide's load; the agent never prints the notice

A project running Waytide announces the framework's presence through **two surfaces the harness renders**, not through anything the agent says:

- **A session-start notice.** A `SessionStart` hook runs `waytide/framework/foundation/session-start.sh`, which reads the package directories actually present and emits a one-line notice:

```
Waytide loaded from waytide/framework/ — 5 packages: foundation, language, testing, design-by-efferent, git
```

- **A status line.** `waytide/framework/foundation/statusline.sh` keeps the same count on screen for the whole session, alongside the working directory and git branch, so the fact stays available instead of scrolling away.

Both are wired by a committed `.claude/settings.json` that `install.sh` places in the consuming project.

- **The agent does not print a notice.** Not at session start, not before the first response, not at all. The harness has already printed it, and an agent-printed copy would only duplicate it.
- **Enumerate what is actually on disk.** The scripts list the package directories under `waytide/framework/` (or `framework/` in the authoring source). A directory carrying a `README.md` is a package — which is what distinguishes `code/ruby` (a package) from `code/` (a grouping directory). Nothing prints a fixed list; the notice reflects the real install because the directories must be read to produce it.
- **What the notice claims is now narrower, and true.** It reports that the framework is installed and its configuration is live. It says nothing about whether the rules were read or internalized — the agent is not its author, so it cannot vouch for the agent. That verification comes from the work honoring the rules, as it always did.
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

**Opt-out:** set the `WAYTIDE_QUIET` environment variable to any non-empty value and both surfaces go quiet. A developer sets it however they like — shell profile, `direnv`, or a personal `.claude/settings.json` `env` block. The opt-out lives in the developer's own environment, never in committed project content, so silencing is a personal preference and the default-on behavior travels with the repository to everyone who checks it out.

**What this costs:** the mechanism is specific to harnesses that read `.claude/settings.json`. Under any other harness there is no notice until equivalent glue is written for it — the framework still loads through the `AGENTS.md` bootstrap, but silently. A harness setting that disables all hooks silences it too, and a newly placed `.claude/settings.json` may not take effect until the harness reloads its configuration.

**Why:** the notice was previously printed by the agent, on an instruction carried in the `AGENTS.md` bootstrap, and it failed in two ways at once. It was **unreliable** — it depended on the agent obeying a line buried in a long prose file, and when it did not fire, nothing revealed that. And it was **badly placed** — a line of plain text inside a reply, which either cluttered the response or was scrolled past, so it could be emitted correctly and still go unseen. Both failures have one source: the party being announced was also the announcer. Moving the notice to the harness removes the dependence on agent compliance and puts the message outside the response body, where it neither competes with an answer nor hides inside one. The ordering problem — whether the notice precedes the first response — disappears with it, because a hook runs before the session rather than inside it.

**How to apply:** wire the notice through `.claude/settings.json`, pointing the `SessionStart` hook and `statusLine` at the two foundation scripts; `install.sh` does this for a consuming project. Never print a load notice as an agent. Keep the scripts reading the real directories rather than asserting a list. Related: the agent-rules-convention (the rule format and where the bootstrap lives), the foundation `install.sh` that places the bootstrap files, and the status-report-format rule (the on-demand report that answers in detail what is installed).

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 2 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 3 PM PT
