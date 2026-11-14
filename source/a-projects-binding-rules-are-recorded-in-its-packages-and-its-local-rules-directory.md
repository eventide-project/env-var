# A project's binding rules are recorded in its packages and its local rules directory

The project's **binding** rules are read at the start of every session and followed. Those are naming conventions, terminology, plan-writing norms, commit conventions, and the like. They live in two directories, separated by source:

- **`slasher/system/`** — the **installed system packages**, each in its own subdirectory (`slasher/system/foundation/`, `slasher/system/language/`, …). These are installed with `git subtree` and refreshed by pulling. A package's `vocabulary.md` glossary is part of its rules — the terms are binding and can't be applied unread.
- **`slasher/local/rules/`** — the project's **own local rules**, one per file. The project's own conventions, not installed from a package.

- **Read the rules at the start of a session and follow them: run `slasher/system/foundation/load-rules.sh` and read its whole output.** It prints each package's `rules-pre-loaded.md` and `vocabulary.md`, `slasher/system/foundation/` first, since it defines the system, then the rules in `slasher/local/rules/`, `slasher/local/vocabulary.md`, and the journal. A package's `source/` holds its full rules, one per file, and is where a rule is edited. Its `rules-pre-loaded.md`, at the package root, holds each rule's title, the path of its source, and its compressed text. `./compile.sh` writes it, and it is what is read. A rule whose source carries a `**Trigger:**` line under its title goes instead to the package's `rules-on-demand.md`, with its trigger. The loader does not print an on-demand rule: it prints the rule's trigger and the command that loads it, `slasher/system/foundation/load-rules.sh <rule-name>`. When the act a trigger names comes up, run that command and follow the rule it prints before acting. **A rule takes a trigger only where the trigger is safe.** A safe trigger names a discrete act the agent itself takes, such as running a command, or creating or editing a named kind of file, so the agent cannot reach the act without knowing it. A missed load must also be cheap and visible. A trigger that names a judgment about a situation, such as giving a summary or working with tests, is not safe, and its rule stays pre-loaded. A package's `source/` and its `README.md` are not read at session start. The rules override default behavior where they conflict. Explicit user instructions still win.
- **One file beside `rules/` is read with them and binds: `slasher/local/vocabulary.md`**, the project's own vocabulary. It is binding and its terms cannot be applied unread, exactly as a package's `vocabulary.md` is, and its terms decide over every package's. It is not a rule and does not live in `rules/`. The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule settles where it sits and why. Like `rules/`, it may not exist, and its absence is ordinary.
- **Rules are kept separate from work artifacts.** `slasher/local/rules/` holds only rules. `slasher/system/` holds the packages' rules and what packages them: each package's `README.md`, `source/`, and `LICENSE`, its `vocabulary.md` where it has one, and its scripts. Neither holds any of the project's working state. The project's working state lives beside `rules/` under `slasher/local/` — `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/` — worked with as their own conventions describe, not read as binding rules at session start. `slasher/local/vocabulary.md` sits beside them and is not working state: it is read at session start, and it is the one thing there that binds.
- **A rule's purpose is not confined to its category.** A rule's package names the *surface* it acts on, not the purpose it serves. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-may-establish-a-mindset-rather-than-a-mechanic rule.
- **Format:** frontmatter-free markdown — a `# <title>` stating the rule, the rule in prose, then short `**Why:**` and `**How to apply:**` lines. A **system package** rule is named by a dash-separated, lower-case name. A project's **own local rule** in `slasher/local/rules/` takes the ISO-8601-UTC datetime prefix (see the file-names rule).
- **A rule's history goes in a `## History` section, placed before `Related:`.** History is what the rule used to say, when it changed, what it was named, and where it sat. The compiler leaves the section out of the package's rules file, so the session-start read does not carry it, and the full rule in `source/` keeps it. Reasoning the directive depends on is not history, even where it tells what failed before: it stays in the body, where the `**Why:**` passage is.
- **A paragraph leads with its claim in bold.** The sentences after it support that claim. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence is what marks it as continuation rather than a new claim. The six-sentence limit is STE Rule 6.6 (see the language package's slasher-prose-conforms-to-the-ste-writing-rules rule).
- **Recording a new local rule:** when the user states a rule, or a decision sets a rule for future work, add it as a new file in `slasher/local/rules/`, and add a matching one-line entry to `slasher/local/logs/log/`. (A rule that belongs to a system package is edited in that package and re-published, not added here.)
- **Reference a rule by its name, never by its file path.** Write "the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule", not `slasher/system/testing/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md`. A rule is renamed when its name stops saying what it says, and the filename changes with it — a path recorded elsewhere then points at nothing, while the rule is still the same rule and still findable by name. Every rule in the system already refers to its siblings this way. The one place a path was written instead is the one place that broke.
- **Removing a rule:** search for what cites it and reconcile the live artifacts that do, then remove it and log the removal. **Where the rule is being stopped rather than superseded, tag its log entry `[suspended]`** and name in that entry what it cost and what else changed. See the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule. A removed rule is **dropped** from a `Related:` list rather than marked — a Related list is a set of live pointers, and a permanent `(deleted)` entry there is clutter that every later reader must step over. The log entry is the durable trace. A rule removal is the only case that strands a citation, since an item is never deleted — its state changes and the record is kept.

**Why:** the rules are the project's durable, in-repo conventions. They are committed alongside the code and read fresh each session rather than recalled, so they stay authoritative and current. One rule per file keeps each convention individually readable, referenceable, and revisable. The installed packages are in `slasher/system/`, and the project's own rules are in `slasher/local/rules/`. Separating the two keeps installed content distinct from the project's own work, so refreshing a package never touches a local rule.

**How to apply:** at session start, run `slasher/system/foundation/load-rules.sh` and read its whole output: the packages' pre-loaded rules, the triggers of their on-demand rules, and their vocabularies, `slasher/local/rules/`, `slasher/local/vocabulary.md` where the project has one, and the journal. When a trigger's act comes up, load its rule and follow it before acting. Hold to them.

When a new binding convention is set, write it in `slasher/local/rules/` in the format above and log it. When the project settles a term or a substitution of its own, write it in `slasher/local/vocabulary.md`. Do not write it as a rule. Prefer a note over a rule when the thinking hasn't stabilized (see the notes rule).

## Compressed

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

## Compression

- 2026-10-24, compressed: compression 0.09, change 0.49, solubility 26 → 50, clarity 0.38 → 0.81, 49 directives, 49 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-10-25, revised: point 2 takes the new wording, that the system directory holds the rules and what packages them; not checked
- 2026-10-27, re-checked: 49 directives, 47 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 50 → 47, clarity 0.81 → 0.79; checked: 44 directives, 44 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the compiled rules are one file per package and the read runs the loader, solubility 47 → 47, clarity 0.79 → 0.81; checked: 47 directives, 47 kept, 0 less precise, 0 lost
- 2026-10-29, revised: on-demand rules, and what the loader prints, solubility 47 → 47, clarity 0.81 → 0.81; checked: 63 directives, 60 kept, 2 less precise, 1 lost, 1 repair, re-checked kept; the less precise directive left is that removing a rule is the only case that strands a citation
- 2026-11-05, revised: a rule takes a trigger only where the trigger is safe; checked: 48 directives, 44 kept, 4 less precise, 0 lost, 2 repairs, to the safe-trigger point; re-checked: 48 directives, 46 kept, 2 less precise, 0 lost. Left less precise, untouched by this revision: that the project's vocabulary decides over every package's, which the vocabulary rule it names states, and that the vocabulary file may be absent
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked

## History

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Thu Nov 5 2026 any rule could take a trigger.

Until 2026-10-25 the rule said `waytide/system/` and `waytide/local/rules/` "hold only rules", while each package under `waytide/system/` also holds its `README.md`, its `source/` directory, a license, and scripts. The engineer settled that `waytide/system/` holds the rules and what packages them, and that neither directory holds working state.

Until Sun Oct 25 2026 this rule was named rules-convention and titled "Binding rules live in `waytide/system/` (installed) and `waytide/local/rules/` (the project's own)".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule was named binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory and titled "Binding rules live in the installed packages and the project's own rules directory".

Until Mon Oct 26 2026 this rule was named a-projects-binding-rules-live-in-its-packages-and-its-local-rules-directory and titled "A project's binding rules live in its packages and its local rules directory".

Until Thu Oct 29 2026 the session-start read opened every rule file under `waytide/system/` and `waytide/local/rules/`, and each package's compiled rules sat at its root, one file per rule. Phase 2 of the rule-reduction experiment replaced them with one `rules-pre-loaded.md` per package and a loader that prints the whole read in one output.

Until Thu Oct 29 2026 every compiled rule was printed at session start. Phase 3 of the rule-reduction experiment, triggers, moved each rule whose source carries a trigger to its package's `rules-on-demand.md`, which the loader lists by trigger and prints by name.

Related:

- the file-names rule
- the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule — the project's own vocabulary, and which vocabulary decides
- the a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule — where the project's own vocabulary sits
- the rules-may-establish-a-mindset-rather-than-a-mechanic rule
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule

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
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 1:00:17 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:49:37 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:50:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:06 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:43:00 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:38:17 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
