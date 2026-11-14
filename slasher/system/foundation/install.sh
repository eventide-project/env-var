#!/bin/sh
# Install (or refresh) the foundation package AND activate the system.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes slasher/system/, slasher/local/rules/, and
# slasher/local/vocabulary.md get read at session start,
# a CLAUDE.md that imports it (Claude Code reads CLAUDE.md, not AGENTS.md), the Slasher plugin
# in .claude/skills/slasher/, whose SessionStart hook prints the startup display and the
# session-start notice, and a .claude/settings.json whose status line keeps the system on screen.
# Run from the root of the consuming project. This script lives inside the package it
# installs, so once foundation is present it is invoked by its path from that root — not
# as `./install.sh`, which would name a file in the project root that is not there.
#
# Usage:
#
#   slasher/system/foundation/install.sh
#     Install or refresh foundation, then place the bootstrap files.
#
#   slasher/system/foundation/install.sh agents-md
#     Place the bootstrap files only, foundation already being installed. The composite
#     install-all.sh uses this, so the bootstrap logic lives in one place rather than two.
#
#   slasher/system/foundation/install.sh bootstrap
#     Print the AGENTS.md bootstrap section and exit, placing nothing. refresh-packages.sh
#     compares it against the project's AGENTS.md, so the text has one source here.
set -e

# The origin foundation is fetched from. Override it to install over HTTPS where no SSH
# key is registered:
#
#   SLASHER_ORIGIN=https://github.com/slasher-bot ./install.sh
#
origin=${SLASHER_ORIGIN:-git@github.com:slasher-bot}

prefix="slasher/system/foundation"
repo="$origin/foundation.git"

# The directory this script runs from. migrate_layout updates it when it moves the directory.
here=$(dirname "$0")

# The bootstrap section written into the project-root AGENTS.md.
#
# It does not name the planning directory, and that is deliberate. It named none while the
# planning directories depended on a project's mode, and the mode mechanism was decommissioned
# on 2026-08-18. One directory replaces it, and the convention naming it is not yet written, so
# there is still nothing here for the bootstrap to assert.
#
# The list is illustrative rather than exhaustive, and its claim is that these
# are working state rather than rules,
# which survives without naming every one. Do not add the planning directories back.
bootstrap() {
  cat <<'EOF'
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
EOF
}

# Ensure the project-root AGENTS.md activates the system. Creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when it's already there. Idempotent.
place_agents_md() {
  # An AGENTS.md written before Waytide was renamed Slasher carries a section naming
  # waytide/system/. The section runs from its heading to the end of the file, the span
  # refresh-packages.sh compares, so that span is replaced and the text above it is kept.
  if [ -f AGENTS.md ] && grep -q 'waytide/system/' AGENTS.md &&
     grep -q '^## Waytide$' AGENTS.md; then
    replaced=$(mktemp)
    sed '/^## Waytide$/,$d' AGENTS.md > "$replaced"
    bootstrap >> "$replaced"
    mv "$replaced" AGENTS.md
    echo "Replaced AGENTS.md's Waytide section, which named waytide/system/."
  fi

  if [ -f AGENTS.md ] && grep -q 'slasher/system/' AGENTS.md; then
    echo "AGENTS.md already points at slasher/system/ — left unchanged."
  elif [ ! -f AGENTS.md ]; then
    # No root AGENTS.md yet — creating one takes nothing away, so do it directly.
    bootstrap > AGENTS.md
    echo "Created AGENTS.md with the Slasher bootstrap."
  else
    # An AGENTS.md you maintain already exists. Explain the effect, show the exact
    # text, and ask before touching it — never append silently.
    echo "You already have an AGENTS.md at the project root."
    echo
    echo "Appending the Slasher bootstrap will add a section that tells the agent,"
    echo "at the start of every session, to read every rule file under slasher/system/ and slasher/local/rules/"
    echo "(except each package's source/ directory and README.md),"
    echo "and slasher/local/vocabulary.md, and follow"
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
        echo "Appended the Slasher bootstrap to AGENTS.md."
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
    echo "Claude Code reads CLAUDE.md, not AGENTS.md. For the Slasher bootstrap in AGENTS.md"
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

# The .claude/settings.json content Slasher needs: the status line. The session-start notice and
# the startup display are the plugin's hooks, and a plugin cannot set the main status line, so
# this one key stays here.
settings_json() {
  cat <<'EOF'
{
  "statusLine": {
    "type": "command",
    "command": "slasher/system/foundation/statusline.sh"
  }
}
EOF
}

# Warn when git is configured to ignore .claude/settings.json or the plugin. The notice and the
# status line are meant to travel with the project, and they only do that if both are committed
# — so an ignored file works for whoever ran the install and reaches nobody else. Projects
# commonly ignore the whole .claude/ directory, in which case the install would otherwise report
# success while the notice silently stays on one machine. A file that is already committed is
# unaffected by an ignore rule, so a tracked file draws no warning. Outside a git repository,
# check-ignore fails and nothing is printed.
warn_ignored_claude_files() {
  ignored=
  for path in .claude/settings.json .claude/skills/slasher/.claude-plugin/plugin.json; do
    git check-ignore -q "$path" 2>/dev/null || continue
    git ls-files --error-unmatch "$path" >/dev/null 2>&1 && continue
    ignored=yes
  done

  [ -n "$ignored" ] || return 0

  echo
  echo "WARNING: git is set to ignore .claude/settings.json or .claude/skills/slasher/."
  echo
  echo "The files are in place and work for you, but git will not commit them, so the"
  echo "notice and the status line will not reach anyone else who checks this project out."
  echo
  echo "If your .gitignore excludes the whole .claude/ directory, a negation alone will"
  echo "not rescue the files — git cannot re-include anything inside an excluded"
  echo "directory. Replace the '.claude/' line with these three:"
  echo
  echo "    .claude/*"
  echo "    !.claude/settings.json"
  echo "    !.claude/skills/"
  echo
  echo "Or leave the ignore rule alone and commit the files explicitly:"
  echo
  echo "    git add -f .claude/settings.json .claude/skills/slasher"
}

# Ensure .claude/settings.json carries the status line. Unlike AGENTS.md and CLAUDE.md, this file
# cannot be safely appended to — merging JSON needs a JSON tool that may not be installed, and a
# corrupted settings.json silently disables every setting in it. So an existing file is never
# modified: the exact block, or the keys to remove, is printed for the engineer. Note that
# adopting the status line replaces whatever status line they had configured. Idempotent.
place_settings_json() {
  if [ -f .claude/settings.json ] && grep -q 'foundation/session-start.sh\|foundation/startup-display.sh' .claude/settings.json; then
    # Wired before the plugin carried the hooks. Both now run the session-start scripts, so the
    # notice and the read instruction print twice until these keys go. The file is still not
    # modified, for the reason given above.
    echo ".claude/settings.json still runs the Slasher session-start notice or startup display."
    echo
    echo "The Slasher plugin, in .claude/skills/slasher/, now runs both, so with these entries in"
    echo "place the notice prints twice. Remove from the 'hooks' object of your file yourself the"
    echo "'SessionStart' entry that runs slasher/system/foundation/session-start.sh and the"
    echo "'UserPromptSubmit' entry that runs slasher/system/foundation/startup-display.sh. Keep"
    echo "'statusLine'. Remove 'hooks' itself if nothing is left in it."
  elif [ -f .claude/settings.json ] && grep -q 'foundation/statusline.sh' .claude/settings.json; then
    echo ".claude/settings.json already runs the Slasher status line — left unchanged."
  elif [ ! -f .claude/settings.json ]; then
    # No settings file yet — creating one takes nothing away, so do it directly.
    mkdir -p .claude
    settings_json > .claude/settings.json
    echo "Created .claude/settings.json with the Slasher status line."
    echo "Commit it so the status line travels to everyone who checks the project out."
  else
    echo "You already have a .claude/settings.json."
    echo
    echo "It is not modified here: JSON cannot be safely appended to, and a malformed"
    echo "settings.json silently disables every setting in it. Merge this key into your file"
    echo "yourself. 'statusLine' keeps Slasher's presence on screen. Note that setting it"
    echo "REPLACES any status line you have already configured; leave it out if you would"
    echo "rather keep yours."
    echo
    echo "----------------------------------------------------------------------"
    settings_json
    echo "----------------------------------------------------------------------"
  fi
}

# Assemble the plugin, which carries the skills and the session-start hooks. The script beside
# this one does it, so compile.sh can run the same assembly in the authoring source.
place_plugin() {
  sh "$here/assemble-plugin.sh"
}

# Move a project's waytide/ to slasher/. The system was named Waytide until 2026-11-06, and the
# directory was named for it. A rule change names the new directory but cannot move a project's
# own files, so the installer does it.
#
# It runs before everything else the installer does: a full install would otherwise add a second
# copy of every package under slasher/system/, and every other move below reads slasher/local/.
#
# The same narrow semantics as the moves below: it moves only when waytide/ is present and
# slasher/ absent, and anything else is reported and left alone. Plain mv rather than git mv, for
# records that were never committed.
migrate_layout() {
  [ -d waytide ] || return 0

  if [ -e slasher ]; then
    echo "Both waytide/ and slasher/ are present — neither is touched."
    echo "waytide/ is the old name. Move its contents into slasher/ and remove it."
    return 0
  fi

  mv waytide slasher

  # The installer may have been run as waytide/system/foundation/install.sh, so the folder it
  # runs from has just moved.
  case "$here" in
    waytide/*) here="slasher/${here#waytide/}" ;;
    ./waytide/*) here="./slasher/${here#./waytide/}" ;;
  esac

  echo "Moved waytide/ to slasher/ — Waytide is renamed Slasher."
  echo "Commit the move."
}

# Move this machine's waytide folders to the slasher names: the configuration under ~/.config,
# which holds the project registry and the writer's name, and the data under ~/.local/share,
# which holds the private journals. The folders were named for Waytide until 2026-11-06.
#
# The same narrow semantics as the project's move: each folder moves only where the old one is
# present and the new one absent, and anything else is reported and left alone. The folders are
# outside the repository, so nothing is left to commit.
migrate_machine() {
  config_home=$HOME/.config
  data_home=$HOME/.local/share

  for base in "$config_home" "$data_home"; do
    old_dir="$base/waytide"
    new_dir="$base/slasher"

    [ -d "$old_dir" ] || continue

    if [ -e "$new_dir" ]; then
      echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
      echo "$old_dir/ is the old name. Move its contents into $new_dir/ and remove it."
      continue
    fi

    mv "$old_dir" "$new_dir"
    echo "Moved $old_dir/ to $new_dir/ — Waytide is renamed Slasher."
  done
}

# Rename a project's slasher/local/sessions/ to slasher/local/work-sessions/. The
# directory carried the bare name sessions/ until 2026-07-30, when it was renamed for
# what a session is here — a work session. A rule change names the new directory but
# cannot move a project's own files, so the installer does it.
#
# This is the ONLY place the installer touches slasher/local/, a project's own working
# state, and it stays narrow accordingly: it moves only when the old directory is
# present and the new one is absent, so there is exactly one reading of what should
# happen. Anything else is reported and left alone — an installer guessing at a merge
# of two directories of records is worse than a engineer doing it deliberately. The
# move is a plain mv rather than git mv, which would fail on records that were never
# committed; git detects the rename when the engineer commits it.
migrate_work_sessions() {
  old_dir="slasher/local/sessions"
  new_dir="slasher/local/work-sessions"

  if [ ! -d "$old_dir" ]; then
    return 0
  fi

  if [ -d "$new_dir" ]; then
    echo "Both slasher/local/sessions/ and slasher/local/work-sessions/ are present — neither is touched."
    echo "slasher/local/sessions/ is the old name. Move its records into work-sessions/ and remove it."
    return 0
  fi

  mv "$old_dir" "$new_dir"
  echo "Renamed slasher/local/sessions/ to slasher/local/work-sessions/."
  echo "Commit the rename."
}

# Move a project's contemporaneous, historical records under slasher/local/logs/. The log, the loop
# records, and the work session records sat directly under slasher/local/ until
# 2026-08-18, beside the directories that state what is currently true. The
# the-logs-directory-holds-the-contemporaneous-historical-records rule groups them, and a rule cannot move a project's own files.
#
# This runs after migrate_work_sessions, so a project still holding the pre-2026-07-30
# name reaches slasher/local/logs/work-sessions/ in two steps rather than needing a
# third case here.
#
# It keeps the same narrow semantics: each directory moves only when the old location is
# present and the new one is absent. Anything else is reported and left alone. Plain mv
# rather than git mv, for records that were never committed.
migrate_logs() {
  for name in log loops work-sessions; do
    old_dir="slasher/local/$name"
    new_dir="slasher/local/logs/$name"

    [ -d "$old_dir" ] || continue

    if [ -d "$new_dir" ]; then
      echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
      echo "$old_dir/ is the old location. Move its records into $new_dir/ and remove it."
      continue
    fi

    mkdir -p slasher/local/logs
    mv "$old_dir" "$new_dir"
    echo "Moved $old_dir/ to $new_dir/ — the contemporaneous, historical records are grouped under logs/."
    echo "Commit the move."
  done
}

# Rename a project's slasher/local/ideas/ to slasher/local/items/. The record kind was
# called an idea until 2026-10-21, and the directory was named for it. A rule change names
# the new directory but cannot move a project's own files, so the installer does it.
#
# The same narrow semantics as the migrations above: it moves only when the old directory
# is present and the new one absent, and anything else is reported and left alone. Plain mv
# rather than git mv, for records that were never committed. Each moved record that carries
# no tag is then tagged [idea].
migrate_items() {
  old_dir="slasher/local/ideas"
  new_dir="slasher/local/items"

  [ -d "$old_dir" ] || return 0

  if [ -d "$new_dir" ]; then
    echo "Both $old_dir/ and $new_dir/ are present — neither is touched."
    echo "$old_dir/ is the old name. Move its records into $new_dir/ and remove it."
    return 0
  fi

  mv "$old_dir" "$new_dir"

  # An item that carries no tag takes [idea], per the the-items-directory-holds-one-file-per-item: a Tags line is added under
  # its State line. A record that already has a Tags line is untouched.
  for record in "$new_dir"/*.md; do
    [ -f "$record" ] || continue
    awk '
      /\*\*Tags:\*\*/ { tagged = 1 }
      { line[NR] = $0 }
      /\*\*State:\*\*/ && !state { state = NR }
      END {
        for (i = 1; i <= NR; i++) {
          print line[i]
          if (i == state && !tagged) print "- **Tags:** [idea]"
        }
      }
    ' "$record" > "$record.tmp" && mv "$record.tmp" "$record"
  done

  echo "Moved $old_dir/ to $new_dir/ — the record kind is now called an item."
  echo "Commit the move."
}

# Carry a project's observations from the state Stated to Recorded. An observation's one state
# was Stated until 2026-10-28, and its filename ended -STATED. A rule change names the new word
# but cannot rename a project's own files, so the installer does it.
#
# The same narrow semantics as the migrations above: each observation moves only when its new
# name is absent, and a clash is reported and left alone. Plain mv rather than git mv, for
# records that were never committed. This runs after migrate_items, so an observation still in
# slasher/local/ideas/ is moved into items/ first.
migrate_observation_state() {
  items_dir="slasher/local/items"

  [ -d "$items_dir" ] || return 0

  migrated=0
  for stated in "$items_dir"/*-STATED.md; do
    [ -f "$stated" ] || continue
    recorded="${stated%-STATED.md}-RECORDED.md"

    if [ -e "$recorded" ]; then
      echo "Both $stated and $recorded are present — neither is touched."
      echo "The -STATED file is the old name. Reconcile the two and remove it."
      continue
    fi

    sed 's/^\(- \)\{0,1\}\*\*State:\*\* Stated$/\1**State:** Recorded/' "$stated" > "$recorded"
    rm "$stated"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Renamed $migrated observation(s) from -STATED to -RECORDED — an observation's state is now Recorded."
    echo "Commit the rename."
  fi
}

# Retag a project's observation items as notes. An item tagged [observation] became a
# note on 2026-11-11, and a rule change cannot retag a project's own files, so the
# installer does it. Only the Tags line changes, and the filename keeps -RECORDED.
migrate_note_tag() {
  items_dir="slasher/local/items"

  [ -d "$items_dir" ] || return 0

  migrated=0
  for item in "$items_dir"/*.md; do
    [ -f "$item" ] || continue
    grep -q '^\(- \)\{0,1\}\*\*Tags:\*\*.*\[observation\]' "$item" || continue

    sed '/^\(- \)\{0,1\}\*\*Tags:\*\*/s/\[observation\]/[note]/' "$item" > "$item.tmp"
    mv "$item.tmp" "$item"
    migrated=$((migrated + 1))
  done

  if [ "$migrated" -gt 0 ]; then
    echo "Retagged $migrated item(s) from [observation] to [note] — an observation item is now a note."
    echo "Commit the change."
  fi
}

# 0. Print the bootstrap section and stop. Nothing is installed and nothing is placed,
#    so this is safe to run anywhere, including from the authoring source. It exists so
#    refresh-packages.sh can compare a project's AGENTS.md against the current text
#    without parsing this script's source.
if [ "$1" = "bootstrap" ]; then
  bootstrap
  exit 0
fi

# Carry a project's waytide/ to slasher/ before anything reads or writes either.
migrate_layout
migrate_machine

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only mode.
if [ "$1" != "agents-md" ]; then
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the system, that CLAUDE.md
#    imports it so the bootstrap also reaches Claude Code sessions, that the plugin
#    prints the startup display and the session-start notice, and that
#    .claude/settings.json keeps the status line.
place_agents_md
place_claude_md
place_settings_json
place_plugin
warn_ignored_claude_files

# 3. Carry a project's own working state across the directory renames a rule change
#    cannot reach.
migrate_work_sessions
migrate_logs
migrate_items
migrate_observation_state
migrate_note_tag
