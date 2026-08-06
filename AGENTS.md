## Waytide

This project's Waytide system and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/system/` and
`waytide/local/rules/`, and follow them.**

`waytide/system/` holds the installed system packages —
`waytide/system/foundation/`, `waytide/system/language/`, and so on, including
each package's `vocabulary.md` glossary where it has one (its terms are binding and
can't be applied unread; not every package has one, and its absence is not a
defect). `waytide/local/rules/` holds this project's own local rules.
Read `waytide/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs
`waytide/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the `Waytide installed at … — N packages: …` notice, closing
with a line telling the developer to type `load waytide` — the command that asks for the
read instruction the hook carries to be acted on now;
a status line keeps the system's presence on screen for the rest of the session, beside
the working directory, branch, and any uncommitted, untracked, or unpushed work. A developer
silences both by setting the `WAYTIDE_QUIET` environment variable to any non-empty
value in their own environment.

`waytide/` holds exactly two directories, splitting what came from outside from what
is this project's own. `waytide/system/` is installed and never edited in place.
`waytide/local/` is everything this project writes: `rules/` alongside the working
state — `log/`, `deferred/`, `observations/`, `work-sessions/`, `loops/`,
`experiments/`, and the project's planning directories — each worked with as its
convention describes, and only `rules/` read as binding at session start.
