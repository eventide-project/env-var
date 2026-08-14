# Binding rules live in `waytide/system/` (installed) and `waytide/local/rules/` (the project's own)

The project's **binding** rules are read at the start of every session and followed. Those are naming conventions, terminology, plan-writing norms, commit conventions, and the like. They live in two directories, separated by source:

- **`waytide/system/`** — the **installed system packages**, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …). These are installed with `git subtree` and refreshed by pulling. A package's `vocabulary.md` glossary is part of its rules — the terms are binding and can't be applied unread.
- **`waytide/local/rules/`** — the project's **own local rules**, one per file. The project's own conventions, not installed from a package.

- **Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session and follow them.** They override default behavior where they conflict. Explicit user instructions still win. Read `waytide/system/foundation/` first — it defines the system.
- **One file beside `rules/` is read with them and binds: `waytide/local/vocabulary.md`**, the project's own vocabulary. It is binding and its terms cannot be applied unread, exactly as a package's `vocabulary.md` is, and its terms decide over every package's. It is not a rule and does not live in `rules/`. The vocabulary-convention rule settles where it sits and why. Like `rules/`, it may not exist, and its absence is ordinary.
- **Rules are kept separate from work artifacts.** `waytide/system/` and `waytide/local/rules/` hold only rules. The project's working state lives beside `rules/` under `waytide/local/` — `log/`, `deferred/`, `observations/`, the project's planning directories, `work-sessions/`, `loops/`, `experiments/`, `migration/`, `suspended/` — worked with as their own conventions describe, not read as binding rules at session start. `waytide/local/vocabulary.md` sits beside them and is not working state: it is read at session start, and it is the one thing there that binds.
- **A rule's purpose is not confined to its category.** Folder names name the *surface* a rule acts on, not the purpose it serves. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-establish-a-mindset rule.
- **Format:** frontmatter-free markdown — a `# <title>` stating the rule, the rule in prose, then short `**Why:**` and `**How to apply:**` lines. A **system package** rule is named by a dash-separated, lower-case name. A project's **own local rule** in `waytide/local/rules/` takes the ISO-8601-UTC datetime prefix (see the file-names rule).
- **A paragraph leads with its claim in bold.** The sentences after it support that claim. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence is what marks it as continuation rather than a new claim. The six-sentence limit is STE Rule 6.6 (see the language package's waytide-prose-conforms-to-the-ste-writing-rules rule).
- **Recording a new local rule:** when the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`, and add a matching one-line entry to `waytide/local/log/`. (A rule that belongs to a system package is edited in that package and re-published, not added here.)
- **Reference a rule by its name, never by its file path.** Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`. A rule is renamed when its name stops saying what it says, and the filename changes with it — a path recorded elsewhere then points at nothing, while the rule is still the same rule and still findable by name. Every rule in the system already refers to its siblings this way. The one place a path was written instead is the one place that broke.
- **Removing a rule:** search for what cites it and reconcile the live artifacts that do, then remove it and log the removal. **Where the rule might be wanted again, suspend it rather than remove it** — moved into `waytide/local/suspended/` with the reconciliations recorded so the removal can be reversed. See the suspended-convention. A removed rule is **dropped** from a `Related:` list rather than marked — a Related list is a set of live pointers, and a permanent `(deleted)` entry there is clutter that every later reader must step over. The log entry is the durable trace. This differs from a resolved deferred item, whose deletion leaves a decision a reader still needs to find and so is marked in place. See the deferred-convention.

**Why:** the rules are the project's durable, in-repo conventions. They are committed alongside the code and read fresh each session rather than recalled, so they stay authoritative and current. One rule per file keeps each convention individually readable, referenceable, and revisable. The installed packages are in `waytide/system/`, and the project's own rules are in `waytide/local/rules/`. Separating the two keeps installed content distinct from the project's own work, so refreshing a package never touches a local rule.

**How to apply:** read the rule files under `waytide/system/` and `waytide/local/rules/` at session start. Read `waytide/local/vocabulary.md` too, where the project has one. Hold to them.

When a new binding convention is set, write it in `waytide/local/rules/` in the format above and log it. When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule. Prefer an observation over a rule when the thinking hasn't stabilized (see the observations rule).

Related:

- the file-names rule
- the vocabulary-convention — the project's own vocabulary and where it sits
- the rules-establish-a-mindset rule
- the decision-log rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:35:51 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 3:48:36 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:13:27 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:23:08 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:54:59 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
