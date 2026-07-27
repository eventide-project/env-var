#!/bin/sh
# Print the Waytide load notice at session start.
#
# Run by the harness as a SessionStart hook, not by the agent — see the
# announce-waytide-at-session-start rule. It reads the package directories
# actually present and emits the notice as JSON on stdout, which the harness
# renders as its own message.
#
# The notice never disrupts a session: any problem exits quietly with no output.

# Never let a notice break a session start.
set +e

# A non-empty WAYTIDE_QUIET silences the notice. The opt-out lives in the
# developer's own environment, never in committed project content.
if [ -n "$WAYTIDE_QUIET" ]; then
  exit 0
fi

# Locate the system: waytide/system/ in a consuming project, system/
# in the Waytide authoring source. Checked in that order — a consuming project
# may have a system/ directory of its own.
if [ -d waytide/system ]; then
  system=waytide/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  exit 0
fi

# A package is a directory carrying a README.md. That distinguishes a package
# from a grouping directory: system/code/ has no README and is not a package,
# system/code/ruby/ has one and is. Depth 2 finds a top-level package's
# README, depth 3 a grouped one's.
packages=$(
  cd "$system" 2>/dev/null || exit 0
  find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null |
    sed 's|^\./||; s|/README\.md$||' |
    sort
)

if [ -z "$packages" ]; then
  exit 0
fi

count=$(printf '%s\n' "$packages" | wc -l | tr -d ' ')
list=$(printf '%s\n' "$packages" | tr '\n' ',' | sed 's|,$||; s|,|, |g')

# Installing foundation alone is the ordinary first install, so the single-package
# notice is what a developer sees before any other package is added.
noun=packages
if [ "$count" = "1" ]; then
  noun=package
fi

notice=$(printf 'Waytide loaded from %s/ — %s %s: %s' \
  "$system" "$count" "$noun" "$list")

# Report work that has not reached a concluded state — experiments and features
# alike. Neither is ever left silently open (the experiment-runs-on-its-own-branch
# and feature-runs-on-its-own-branch rules), but nothing otherwise brings an open
# one to attention: the working directories under waytide/ are not read at session
# start, and work done in a worktree leaves no trace in the main working tree at
# all — it stays on the upstream branch, so even the branch name gives nothing away.
#
# The state is read from the record's canonical "**State:** <state>" line. The state
# words also appear throughout a record's prose, so only that line is authoritative;
# a record without one is still in flight.
#
# Prints "<n> <noun> open: <name> (<note>), ..." or nothing. Arguments: the
# directory, the singular noun, the plural noun, then the concluded state words.
report_open() {
  directory=$1
  singular=$2
  plural=$3
  shift 3

  [ -d "$directory" ] || return 0

  names=
  open_count=0

  for record in "$directory"/*.md; do
    [ -f "$record" ] || continue

    # The line is ordinarily a list item in the record's setup block, so an
    # optional leading dash is allowed.
    state=$(
      sed -n \
        's|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*State:\*\*[[:space:]]*\([A-Za-z]*\).*|\1|p' \
        "$record" |
        tail -1
    )

    concluded=
    for word in "$@"; do
      if [ "$state" = "$word" ]; then
        concluded=yes
        break
      fi
    done
    [ -z "$concluded" ] || continue

    case "$state" in
      Suspended)
        note=suspended
        ;;
      '')
        note='no state recorded'
        ;;
      *)
        note=$state
        ;;
    esac

    name=$(
      basename "$record" .md |
        sed 's|^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}T[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}Z-||'
    )

    open_count=$((open_count + 1))
    names="${names}${names:+, }${name} (${note})"
  done

  [ "$open_count" -gt 0 ] || return 0

  noun=$plural
  if [ "$open_count" = "1" ]; then
    noun=$singular
  fi

  printf '%s %s open: %s' "$open_count" "$noun" "$names"
}

# Locate the project's own working state: waytide/local/ in a consuming project,
# local/ in the Waytide authoring source — the same two-layout check the packages get.
if [ -d waytide/local ]; then
  own=waytide/local
elif [ -d local ]; then
  own=local
else
  own=
fi

experiments=
features=

if [ -n "$own" ]; then
  experiments=$(
    report_open "$own/experiments" experiment experiments \
      Affirmed Refuted Inconclusive Abandoned Superseded
  )

  features=$(
    report_open "$own/features" feature features \
      Completed Abandoned Superseded
  )
fi

# A literal backslash-n, so the JSON string carries a line break the harness
# renders — not an actual newline, which would be invalid inside a JSON string.
if [ -n "$experiments" ]; then
  notice="${notice}\\n${experiments}"
fi

if [ -n "$features" ]; then
  notice="${notice}\\n${features}"
fi

printf '{"systemMessage": "%s"}\n' "$notice"
