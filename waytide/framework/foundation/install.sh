#!/bin/sh
# Install (or refresh) the foundation package AND activate the framework.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes waytide/framework/ and waytide/rules/ get read at session start,
# a CLAUDE.md that imports it (Claude Code reads CLAUDE.md, not AGENTS.md), and a
# .claude/settings.json whose SessionStart hook and status line print the load notice.
# Run from the root of the consuming project.
#
# Usage:
#   sh install.sh             install/refresh foundation, then place the bootstrap files
#   sh install.sh agents-md   place the bootstrap files only (foundation already
#                             installed; used by the composite install-all.sh so the
#                             bootstrap logic lives in one place, not two)
set -e

prefix="waytide/framework/foundation"
repo="https://github.com/waytide/foundation.git"

# The bootstrap section written into the project-root AGENTS.md.
bootstrap() {
  cat <<'EOF'
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
EOF
}

# Ensure the project-root AGENTS.md activates the framework. Creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when it's already there. Idempotent.
place_agents_md() {
  if [ -f AGENTS.md ] && grep -q 'waytide/framework/' AGENTS.md; then
    echo "AGENTS.md already points at waytide/framework/ — left unchanged."
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
    echo "at the start of every session, to read every rule file under waytide/framework/ and waytide/rules/ and follow"
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
        echo "Left AGENTS.md unchanged. Paste the section above into it to activate the framework."
        ;;
    esac
  fi
}

# Ensure a project-root CLAUDE.md imports AGENTS.md. Claude Code loads CLAUDE.md,
# not AGENTS.md, so without this the bootstrap never reaches a Claude Code session
# and the framework does not load. A one-line `@AGENTS.md` import bridges the two
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
        echo "Left CLAUDE.md unchanged. Add a line reading '@AGENTS.md' to it to load the framework under Claude Code."
        ;;
    esac
  fi
}

# The .claude/settings.json content that makes the harness print the load notice.
settings_json() {
  cat <<'EOF'
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "sh waytide/framework/foundation/session-start.sh"
          }
        ]
      }
    ]
  },
  "statusLine": {
    "type": "command",
    "command": "sh waytide/framework/foundation/statusline.sh"
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
# print the load notice. Unlike AGENTS.md and CLAUDE.md, this file cannot be safely
# appended to — merging JSON needs a JSON tool that may not be installed, and a
# corrupted settings.json silently disables every setting in it. So an existing file
# is never modified: the exact block is printed for the developer to merge. Note
# that adopting the status line replaces whatever status line they had configured.
# Idempotent.
place_settings_json() {
  if [ -f .claude/settings.json ] && grep -q 'foundation/session-start.sh' .claude/settings.json; then
    echo ".claude/settings.json already runs the Waytide session-start notice — left unchanged."
  elif [ ! -f .claude/settings.json ]; then
    # No settings file yet — creating one takes nothing away, so do it directly.
    mkdir -p .claude
    settings_json > .claude/settings.json
    echo "Created .claude/settings.json with the Waytide load notice (SessionStart hook and status line)."
    echo "Commit it so the notice travels to everyone who checks the project out."
  else
    echo "You already have a .claude/settings.json."
    echo
    echo "It is not modified here: JSON cannot be safely appended to, and a malformed"
    echo "settings.json silently disables every setting in it. Merge these two keys into"
    echo "your file yourself — 'hooks' prints the load notice at session start, and"
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

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only mode.
if [ "$1" != "agents-md" ]; then
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the framework, that CLAUDE.md
#    imports it so the bootstrap also reaches Claude Code sessions, and that
#    .claude/settings.json prints the load notice.
place_agents_md
place_claude_md
place_settings_json
