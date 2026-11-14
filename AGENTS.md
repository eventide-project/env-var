## Slasher

This project's Slasher system and working conventions live under `slasher/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `slasher/system/` and
`slasher/local/rules/`, except each package's `source/` directory and `README.md`,
and `slasher/local/vocabulary.md`, and follow them.**

`slasher/system/` holds the installed system packages —
`slasher/system/foundation/`, `slasher/system/language/`, and so on, including
each package's `vocabulary.md` glossary where it has one (its terms are binding and
can't be applied unread; not every package has one, and its absence is not a
defect). `slasher/local/rules/` holds this project's own local rules, and
`slasher/local/vocabulary.md` holds the terms and substitutions this project settles
for itself, which decide over every package's. That file may not exist, which is
ordinary and not a defect.
Read `slasher/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in the Slasher plugin, `.claude/skills/slasher/`, runs
`slasher/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the `Slasher installed at … — N packages: …` notice, followed
by a line telling the engineer the rules load on the first prompt, or to type `/load` — the
command that asks for the read instruction the hook carries to be acted on now;
a status line keeps the system's presence on screen for the rest of the session, beside
the working directory, branch, and any uncommitted, untracked, or unpushed work.

`slasher/` holds exactly two directories, splitting what came from outside from what
is this project's own. `slasher/system/` is installed and never edited in place.
`slasher/local/` is everything this project writes: `rules/` and `vocabulary.md`
alongside the working state — `logs/` (holding `log/`, `loops/`, and
`work-sessions/`), `items/`, `implementations/`, and `migration/` — each worked with as
its convention describes, and only `rules/` and `vocabulary.md` read as binding at
session start.
