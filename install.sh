#!/bin/sh
# Install (or refresh) the foundation package AND activate the system.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes waytide/system/, waytide/local/rules/, and
# waytide/local/vocabulary.md get read at session start,
# a CLAUDE.md that imports it (Claude Code reads CLAUDE.md, not AGENTS.md), and a
# .claude/settings.json whose SessionStart hook and status line print the session-start
# notice.
# Run from the root of the consuming project. This script lives inside the package it
# installs, so once foundation is present it is invoked by its path from that root — not
# as `./install.sh`, which would name a file in the project root that is not there.
#
# Usage:
#
#   waytide/system/foundation/install.sh
#     Install or refresh foundation, then place the bootstrap files.
#
#   waytide/system/foundation/install.sh agents-md
#     Place the bootstrap files only, foundation already being installed. The composite
#     install-all.sh uses this, so the bootstrap logic lives in one place rather than two.
#
#   waytide/system/foundation/install.sh bootstrap
#     Print the AGENTS.md bootstrap section and exit, placing nothing. refresh-packages.sh
#     compares it against the project's AGENTS.md, so the text has one source here.
set -e

prefix="waytide/system/foundation"
repo="https://github.com/waytide/foundation.git"

# The bootstrap section written into the project-root AGENTS.md.
#
# It does not name the planning directories, and that is deliberate: they depend on
# the project's mode — `design/` and `plans/` under formal, `aspiration/` and
# `intention/` under intuitive, `orientation/` and `action/` under OODA (see foundation's
# a-project-works-in-a-mode-chosen-at-the-start
# rule). This script cannot know which, because the mode is chosen by the agent at the
# project's start, which is after an install has run. Naming the formal pair here
# would write it back into a project in another mode every time the bootstrap was regenerated —
# which is what refresh-packages.sh tells a engineer to do when foundation's bootstrap
# changes, so a routine refresh would silently undo a migration.
#
# The list is illustrative rather than exhaustive — it omits `migration/` and
# `suspended/` too — and its claim is that these are working state rather than rules,
# which survives without naming every one. Do not add the planning directories back.
bootstrap() {
  cat <<'EOF'
## Waytide

This project's Waytide system and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/system/` and
`waytide/local/rules/`, and `waytide/local/vocabulary.md`, and follow them.**

`waytide/system/` holds the installed system packages —
`waytide/system/foundation/`, `waytide/system/language/`, and so on, including
each package's `vocabulary.md` glossary where it has one (its terms are binding and
can't be applied unread; not every package has one, and its absence is not a
defect). `waytide/local/rules/` holds this project's own local rules, and
`waytide/local/vocabulary.md` holds the terms and substitutions this project settles
for itself, which decide over every package's. That file may not exist, which is
ordinary and not a defect.
Read `waytide/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs
`waytide/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the `Waytide installed at … — N packages: …` notice, closing
with a line telling the engineer to type `load waytide` — the command that asks for the
read instruction the hook carries to be acted on now;
a status line keeps the system's presence on screen for the rest of the session, beside
the working directory, branch, and any uncommitted, untracked, or unpushed work.

`waytide/` holds exactly two directories, splitting what came from outside from what
is this project's own. `waytide/system/` is installed and never edited in place.
`waytide/local/` is everything this project writes: `rules/` and `vocabulary.md`
alongside the working state — `log/`, `deferred/`, `observations/`, `work-sessions/`,
`loops/`, `experiments/`, and the project's planning directories — each worked with as
its convention describes, and only `rules/` and `vocabulary.md` read as binding at
session start.
EOF
}

# Ensure the project-root AGENTS.md activates the system. Creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when it's already there. Idempotent.
place_agents_md() {
  if [ -f AGENTS.md ] && grep -q 'waytide/system/' AGENTS.md; then
    echo "AGENTS.md already points at waytide/system/ — left unchanged."
  elif [ ! -f AGENTS.md ]; then
    # No root AGENTS.md yet — creating one takes nothing away, so do it directly.
    bootstrap > AGENTS.md
    echo "Created AGENTS.md with the Waytide bootstrap."
  else
    # An AGENTS.md you maintain already exists. Explain the effect, show the exact
    # text, and ask before touching it — never append silently.
    echo "You already have an AGENTS.md at the project root."
    echo
    echo "Appending the Waytide bootstrap will add a section that tells the agent,"
    echo "at the start of every session, to read every rule file under waytide/system/ and waytide/local/rules/,"
    echo "and waytide/local/vocabulary.md, and follow"
    echo "it. Those rules then OVERRIDE the agent's default behavior where they conflict"
    echo "(your explicit instructions still win). Your existing AGENTS.md content is left"
    echo "exactly as it is; the section is added at the end, after a blank line."
    echo
    echo "Exact text to be appended:"
    echo "----------------------------------------------------------------------"
    bootstrap
    echo "----------------------------------------------------------------------"
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so AGENTS.md was NOT modified."
      echo "Re-run this in a terminal to be prompted, or paste the section above yourself."
      return 0
    fi
    printf 'Append this to your AGENTS.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n' >> AGENTS.md
        bootstrap >> AGENTS.md
        echo "Appended the Waytide bootstrap to AGENTS.md."
        ;;
      *)
        echo "Left AGENTS.md unchanged. Paste the section above into it to activate the system."
        ;;
    esac
  fi
}

# Ensure a project-root CLAUDE.md imports AGENTS.md. Claude Code loads CLAUDE.md,
# not AGENTS.md, so without this the bootstrap never reaches a Claude Code session
# and the system does not load. A one-line `@AGENTS.md` import bridges the two
# without duplicating the bootstrap. Same care as place_agents_md: creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when the import is already there. Idempotent.
place_claude_md() {
  if [ -f CLAUDE.md ] && grep -q '@AGENTS.md' CLAUDE.md; then
    echo "CLAUDE.md already imports AGENTS.md — left unchanged."
  elif [ ! -f CLAUDE.md ]; then
    # No root CLAUDE.md yet — creating one takes nothing away, so do it directly.
    printf '@AGENTS.md\n' > CLAUDE.md
    echo "Created CLAUDE.md importing AGENTS.md (Claude Code reads CLAUDE.md, not AGENTS.md)."
  else
    # A CLAUDE.md you maintain already exists. Explain the effect and ask before
    # touching it — never append silently.
    echo "You already have a CLAUDE.md at the project root."
    echo
    echo "Claude Code reads CLAUDE.md, not AGENTS.md. For the Waytide bootstrap in AGENTS.md"
    echo "to load at session start under Claude Code, CLAUDE.md needs to import it with a line"
    echo "reading: @AGENTS.md. Your existing CLAUDE.md content is left exactly as it is; the"
    echo "import is added at the end, after a blank line."
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so CLAUDE.md was NOT modified."
      echo "Re-run this in a terminal to be prompted, or add a line reading '@AGENTS.md' to CLAUDE.md yourself."
      return 0
    fi
    printf 'Append "@AGENTS.md" to your CLAUDE.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n@AGENTS.md\n' >> CLAUDE.md
        echo "Appended '@AGENTS.md' to CLAUDE.md."
        ;;
      *)
        echo "Left CLAUDE.md unchanged. Add a line reading '@AGENTS.md' to it to load the system under Claude Code."
        ;;
    esac
  fi
}

# The .claude/settings.json content that makes the harness print the session-start notice.
settings_json() {
  cat <<'EOF'
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "waytide/system/foundation/session-start.sh"
          }
        ]
      }
    ]
  },
  "statusLine": {
    "type": "command",
    "command": "waytide/system/foundation/statusline.sh"
  }
}
EOF
}

# Warn when git is configured to ignore .claude/settings.json. The notice is meant to
# travel with the project, and it only does that if the file is committed — so an
# ignored settings.json works for whoever ran the install and reaches nobody else.
# Projects commonly ignore the whole .claude/ directory, in which case the install
# would otherwise report success while the notice silently stays on one machine.
# A file that is already committed is unaffected by an ignore rule, so a tracked
# settings.json draws no warning. Outside a git repository, check-ignore fails and
# nothing is printed.
warn_ignored_settings_json() {
  if ! git check-ignore -q .claude/settings.json 2>/dev/null; then
    return
  fi

  if git ls-files --error-unmatch .claude/settings.json >/dev/null 2>&1; then
    return
  fi

  echo
  echo "WARNING: git is set to ignore .claude/settings.json."
  echo
  echo "The file is in place and the notice works for you, but git will not commit it,"
  echo "so it will not reach anyone else who checks this project out."
  echo
  echo "If your .gitignore excludes the whole .claude/ directory, a negation alone will"
  echo "not rescue the file — git cannot re-include anything inside an excluded"
  echo "directory. Replace the '.claude/' line with these two:"
  echo
  echo "    .claude/*"
  echo "    !.claude/settings.json"
  echo
  echo "Or leave the ignore rule alone and commit the file explicitly:"
  echo
  echo "    git add -f .claude/settings.json"
}

# Ensure .claude/settings.json carries the SessionStart hook and status line that
# print the session-start notice. Unlike AGENTS.md and CLAUDE.md, this file cannot be safely
# appended to — merging JSON needs a JSON tool that may not be installed, and a
# corrupted settings.json silently disables every setting in it. So an existing file
# is never modified: the exact block is printed for the engineer to merge. Note
# that adopting the status line replaces whatever status line they had configured.
# Idempotent.
place_settings_json() {
  if [ -f .claude/settings.json ] && grep -q 'foundation/session-start.sh' .claude/settings.json; then
    echo ".claude/settings.json already runs the Waytide session-start notice — left unchanged."
  elif [ ! -f .claude/settings.json ]; then
    # No settings file yet — creating one takes nothing away, so do it directly.
    mkdir -p .claude
    settings_json > .claude/settings.json
    echo "Created .claude/settings.json with the Waytide session-start notice (SessionStart hook and status line)."
    echo "Commit it so the notice travels to everyone who checks the project out."
  else
    echo "You already have a .claude/settings.json."
    echo
    echo "It is not modified here: JSON cannot be safely appended to, and a malformed"
    echo "settings.json silently disables every setting in it. Merge these two keys into"
    echo "your file yourself — 'hooks' prints the session-start notice, and"
    echo "'statusLine' keeps the package count on screen. Note that setting 'statusLine'"
    echo "REPLACES any status line you have already configured; leave that key out if you"
    echo "would rather keep yours."
    echo
    echo "----------------------------------------------------------------------"
    settings_json
    echo "----------------------------------------------------------------------"
  fi

  warn_ignored_settings_json
}

# Rename a project's waytide/local/sessions/ to waytide/local/work-sessions/. The
# directory carried the bare name sessions/ until 2026-07-30, when it was renamed for
# what a session is here — a work session. A rule change names the new directory but
# cannot move a project's own files, so the installer does it.
#
# This is the ONLY place the installer touches waytide/local/, a project's own working
# state, and it stays narrow accordingly: it moves only when the old directory is
# present and the new one is absent, so there is exactly one reading of what should
# happen. Anything else is reported and left alone — an installer guessing at a merge
# of two directories of records is worse than a engineer doing it deliberately. The
# move is a plain mv rather than git mv, which would fail on records that were never
# committed; git detects the rename when the engineer commits it.
migrate_work_sessions() {
  old_dir="waytide/local/sessions"
  new_dir="waytide/local/work-sessions"

  if [ ! -d "$old_dir" ]; then
    return 0
  fi

  if [ -d "$new_dir" ]; then
    echo "Both waytide/local/sessions/ and waytide/local/work-sessions/ are present — neither is touched."
    echo "waytide/local/sessions/ is the old name. Move its records into work-sessions/ and remove it."
    return 0
  fi

  mv "$old_dir" "$new_dir"
  echo "Renamed waytide/local/sessions/ to waytide/local/work-sessions/ — the directory's current name."
  echo "Commit the rename."
}

# 0. Print the bootstrap section and stop. Nothing is installed and nothing is placed,
#    so this is safe to run anywhere, including from the authoring source. It exists so
#    refresh-packages.sh can compare a project's AGENTS.md against the current text
#    without parsing this script's source.
if [ "$1" = "bootstrap" ]; then
  bootstrap
  exit 0
fi

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only mode.
if [ "$1" != "agents-md" ]; then
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the system, that CLAUDE.md
#    imports it so the bootstrap also reaches Claude Code sessions, and that
#    .claude/settings.json prints the session-start notice.
place_agents_md
place_claude_md
place_settings_json

# 3. Carry a project's own working state across the directory renames a rule change
#    cannot reach.
migrate_work_sessions
