# Binding rules live in `waytide/system/` (installed) and `waytide/local/rules/` (the project's own)

The project's **binding** rules — naming conventions, terminology, plan-writing norms, commit conventions, and the like — are read at the start of every session and followed. They live in two directories, split by source:

- **`waytide/system/`** — the **installed system packages**, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …). These are installed with `git subtree` and refreshed by pulling. A package's `vocabulary.md` glossary is part of its rules — the terms are binding and can't be applied unread.
- **`waytide/local/rules/`** — the project's **own local rules**, one per file. The project's own conventions, not installed from a package.

- **Read every rule file under both `waytide/system/` and `waytide/local/rules/` at the start of a session and follow them.** They override default behavior where they conflict; explicit user instructions still win. Read `waytide/system/foundation/` first — it defines the system.
- **Rules are kept separate from work artifacts.** `waytide/system/` and `waytide/local/rules/` hold only rules. The project's working state lives beside `rules/` under `waytide/local/` — `log/`, `deferred/`, `observations/`, `design/`, `plans/`, `sessions/`, `loops/`, `experiments/` — worked with as their own conventions describe, not read as binding rules at session start.
- **A rule's purpose may cut across its category.** Folder names name the *surface* a rule acts on, not the purpose it serves; judge a stance-installing rule by the mindset it installs, not by surface conformance. See the rules-install-a-mindset rule.
- **Format:** frontmatter-free markdown — a `# <title>` stating the rule, the rule in prose, then short `**Why:**` and `**How to apply:**` lines. A **system package** rule is named by a dash-separated, lower-case name; a project's **own local rule** in `waytide/local/rules/` takes the ISO-8601-UTC datetime prefix (see the agent-file-names rule).
- **Recording a new local rule:** when the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`, and add a matching one-line entry to `waytide/local/log/`. (A rule that belongs to a system package is edited in that package and re-published, not added here.)

**Why:** the rules are the project's durable, in-repo conventions, committed alongside the code and read fresh each session rather than recalled — so they stay authoritative and current. One rule per file keeps each convention individually readable, referenceable, and revisable. Splitting the installed packages (`waytide/system/`) from the project's own rules (`waytide/local/rules/`) keeps installed content distinct from the project's own work, so refreshing a package never touches a local rule.

**How to apply:** read the rule files under `waytide/system/` and `waytide/local/rules/` at session start and hold to them. When a new binding convention is set, write it in `waytide/local/rules/` in the format above and log it. Prefer an observation over a rule when the thinking hasn't stabilized (see the observations rule). Related: the agent-file-names rule, the rules-install-a-mindset rule, and the decision-log rule.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:35:51 PM PT
