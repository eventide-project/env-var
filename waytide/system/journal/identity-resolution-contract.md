# The writer's identity resolves through a fixed override chain ending at `~/.config/waytide/user`, and the display name alone is overridden per project

This is the binding contract every Waytide tool follows to determine **who is writing now**. Each tool names its own variable at the first level, and the journal's is `JOURNAL_WRITER`. The two levels below it are common to all of them. An identity set once on a machine then resolves the same person in each. What this rule fixes is the chain rather than any one tool's variable, so a tool built independently of this one agrees with it.

## What identity is

**A writer has a username, and may have a display name.** The username is a filesystem-safe id, such as `scott-bellware`, and it is the primary key. The display name, such as `Scott Bellware`, is presentation. It is optional, and a writer with none shows as their username, verbatim.

A display name is never computed from a username. The capitalization and the word boundaries are not recoverable, as `o-brien`, `van-der-berg`, and `mcdonald` each show. So the fallback is the username itself rather than a prettified form of it. Identity never comes from git.

**The two values resolve separately.** The username comes from the chain below and from nowhere else. The display name has its own order, stated further down. A file that carries a display name never selects the writer.

## Resolution order for the username (first match wins)

1. **`JOURNAL_WRITER` environment variable** — ephemeral/per-process override (CI, one-offs like `JOURNAL_WRITER=jane-doe <cmd>`).
2. **Project-local `.current-user`** — a gitignored file in the project root. It overrides the global default for this one checkout, and is rarely needed.
3. **`~/.config/waytide/user`** — the normal case. It is set once per machine and read by *all* Waytide tools, one shared file rather than one per tool.
4. **Error** — if none resolve, fail loudly (e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER"). Never guess.

**The active writer is declared in the user file and never in a project.** A project's `writers.toml` records display names and selects nobody. So a project holding no entry for the active writer is ordinary rather than a gap.

## The user file's location is platform-resolved

The tail is always `waytide/user`; only the base directory varies:

- If `$XDG_CONFIG_HOME` is set → `$XDG_CONFIG_HOME/waytide/user` (forces one location on any OS).
- Else by platform:
  - **Linux** → `~/.config/waytide/user`
  - **macOS** → `~/.config/waytide/user` (CLI convention; keeps Linux + macOS identical — chosen over `~/Library/Application Support`)
  - **Windows** → `%APPDATA%\waytide\user`

Tools agree on this **resolution rule**, not a raw path string.

**`waytide` is the namespace because the file is Waytide's.** It sat under `identity/` until 2026-08-14, on the reasoning that the file holds identity and is reusable beyond one tool. That took a top-level name on every machine Waytide is installed on, for a file only Waytide reads. A tool outside Waytide has its own idea of what identity is and no reason to accept this one's. The namespace now says what the file belongs to, and `~/.config/waytide/` already holds `consuming-projects.toml`, which `foundation`'s `read-consuming-projects.sh` reads.

## The user file's format

**TOML, with a `username` key and an optional `display-name` key.**

```toml
# ~/.config/waytide/user

username = "scott-bellware"
display-name = "Scott Bellware"
```

`username` is required, and this file is the only place the active writer is declared. `display-name` is optional. A file carrying the username alone is complete, and that writer shows as their username unless a project's `writers.toml` names them.

**TOML matches the namespace.** `consuming-projects.toml` and `writers.toml` are each TOML, so a tool reading this file reads no second format. The file is named `user` with no extension, so the format is not legible from the name. That cost is taken for the plainer name.

**`.current-user` is unchanged, and it is not TOML.** It holds the username only, on one line. Trim surrounding whitespace and a trailing newline on read, and allow `#` comment lines. It selects a writer for one checkout and carries no presentation.

**So the two files no longer share a reader.** They did until 2026-08-14, when each held a bare username. The user file gained a second value and `.current-user` did not, because a per-checkout override selects a person rather than renaming one.

## The display name resolves in this order (first match wins)

1. **The project's `writers.toml`**, where it holds an entry for the resolved username.
2. **`~/.config/waytide/user`**, where that file's `username` is the resolved username.
3. **The username itself**, verbatim.

**The project's entry wins, and that is the whole of the hierarchy.** It moves one value and no other. A project may need a writer to appear under a name the machine-level file does not give, such as a full legal name in one repository and a short one elsewhere.

**The user file's display name belongs to the user file's username.** `JOURNAL_WRITER` or `.current-user` may resolve some other writer. That display name then does not apply, because it names one person and the resolved writer is a different one. Their name comes from `writers.toml`, or from their username.

## Per-project registry

Each project is its own space of writers, and may commit a `writers.toml` giving display names. It lives at `waytide/local/journal/writers.toml`, beside the per-writer directories the journal is kept in.

**It records a display name and nothing else.** It refuses nobody, selects nobody, and declares no identity. The resolution chain *selects* a username, and this file supplies a name to show for it.

**It may omit the active writer.** Where `~/.config/waytide/user` already gives that writer's display name, a project entry would only repeat it. An entry is written where the project needs a different name.

**The file is optional.** A project without one works. Every writer in it then shows as the name their user file gives, or as their username.

**The shape is one TOML table per username.** The table header is the username, so TOML itself refuses a duplicate. That is the only check the file gets, now that nothing validates.

```toml
# The writers this project shows under a name their own
# ~/.config/waytide/user does not give. A writer absent from this
# file shows as that name, or as their username.

[scott-bellware]
display-name = "Scott Bellware"

[jane-doe]
display-name = "Jane Doe"
```

**A writer's table carries that writer's own settings** in any further key. The contract reads `display-name` and ignores the rest, so a tool keeps its own settings there without a change to this rule.

**What this costs is stated plainly.** Nothing refuses an unknown username, so a mistyped `JOURNAL_WRITER` resolves to a writer who does not exist. A journal directory is then created for them rather than refused. The chain's fourth level still fails loudly where no username resolves at all, and that is a different failure.

**Why:** the writer runs many tools across many projects and is always the same person. So identity belongs at the machine level, set once, with project-level and process-level overrides for the exceptions. A logical path contract rather than a literal one keeps the single shared file working on Linux, macOS, and Windows.

Separating the two values is what keeps the hierarchy small. Who is writing is one fact with one source, so no project can declare somebody. What a writer is called is presentation, and a project may legitimately need its own. Overriding the second alone gives a project what it needs and no authority it should not have.

**How to apply:** when implementing identity in any Waytide tool, resolve the active username through the chain above. Read the user file at `~/.config/waytide/user`, resolving its base directory by platform. Parse it as TOML and take its `username`.

Take the display name from the project's `writers.toml` where it holds one for that username. Take it from the user file where that file's `username` is the resolved one. Fall back to the username itself.

Never read git for identity. Never invent a username, and never compute a display name from one. Never take a username from `writers.toml`. Fail loudly where no username resolves.

Related:

- the journal-convention — the per-writer directories `writers.toml` sits beside
- the journal-entries rule — where `<username>` names the directory an entry is written in
- the `foundation` package's a-project-does-not-name-its-consumers rule — the same `~/.config/` placement, taken for the same machine-scoped reason

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:49:47 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:08 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:57 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:31:47 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
