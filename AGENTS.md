## Waytide

This project's Waytide framework and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/framework/` and
`waytide/rules/`, and follow them.**

`waytide/framework/` holds the installed framework packages —
`waytide/framework/foundation/`, `waytide/framework/language/`, and so on, including
each package's `vocabulary.md` glossary (its terms are binding and can't be applied
unread). `waytide/rules/` holds this project's own local rules.
Read `waytide/framework/foundation/` first; it defines the framework. The rules
override default behavior where they conflict; explicit user instructions still win.

**The load notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs
`waytide/framework/foundation/session-start.sh`, which reads the package directories
actually present and emits the one-line `Waytide loaded from … — N packages: …`
notice; a status line carries the same count for the rest of the session. A developer
silences both by setting the `WAYTIDE_QUIET` environment variable to any non-empty
value in their own environment.

The other directories under `waytide/` hold the project's working state, kept
separate from the rules — `log/`, `deferred/`, `observations/`, `design/`,
`plans/`, `sessions/`, `loops/`, `experiments/` — and are worked with as their
conventions describe, not read as binding rules at session start.
