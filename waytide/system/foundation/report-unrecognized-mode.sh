#!/bin/sh
# Report a mode rule naming a mode the installed Waytide no longer defines.
#
# A project works in a mode chosen at its initiation, recorded as a rule in
# waytide/local/rules/ whose filename carries the mode — 2026-08-05T07-32-03Z-intuitive-mode.md
# (see foundation's a-project-works-in-a-mode-chosen-at-initiation rule). The filename
# alone carries it, which is what lets the mode be read without the file being opened.
#
# Waytide's own vocabulary can change, and a rename reaches this project only as far as
# the packages: a project's own rules are its own, so no refresh rewrites them. A mode
# renamed upstream therefore leaves this file naming a mode that no longer exists, and
# nothing says so. The failure is silent and total — the mechanism that reads the mode
# from the filename finds nothing, so an agent concludes the mode question was never
# asked and asks it again, of a project that answered it.
#
# On 2026-08-06 every consuming project on one machine was in exactly that state, a mode
# having been renamed the day before. This reports it.
#
# Run from the root of the project:
#
#   waytide/system/foundation/report-unrecognized-mode.sh
#
# It only reads.

set -e

# The authoring source holds system/ and local/ without the waytide/ wrapper, and has no
# mode rule of the kind this checks — its own rules are the packages being written.
if [ -d system/foundation ] && [ ! -d waytide/system ]; then
  echo "This is the Waytide authoring source, not a project that installed Waytide." >&2
  exit 1
fi

rules="waytide/local/rules"
mode_rule_definition="waytide/system/foundation/a-project-works-in-a-mode-chosen-at-initiation.md"

if [ ! -d waytide/system ]; then
  echo "No packages installed — waytide/system/ is not present." >&2
  exit 1
fi

if [ ! -f "$mode_rule_definition" ]; then
  echo "The installed foundation has no a-project-works-in-a-mode-chosen-at-initiation rule," >&2
  echo "so there is nothing to check a mode against. Refresh the packages." >&2
  exit 1
fi

# The modes the installed rule defines, read from the rule rather than written here, so a
# mode added upstream needs no change to this script. The rule names them as the local
# rule filenames it requires — formal-mode, intuitive-mode, ooda-mode.
defined=$(
  grep -o '\*\*`[a-z-]*-mode`\*\*\|`[a-z-]*-mode`' "$mode_rule_definition" |
    tr -d '*`' |
    sort -u
)

if [ -z "$defined" ]; then
  echo "Could not read any mode name from $mode_rule_definition." >&2
  echo "The rule's wording has changed in a way this script does not follow." >&2
  exit 1
fi

# A project's mode rule is the one local rule whose name ends in -mode. There is at most
# one: the mode is chosen once and does not change.
found=$(ls "$rules" 2>/dev/null | grep -E '\-mode\.md$' || true)

if [ -z "$found" ]; then
  # Not a finding. The mode rule rule says an absent mode rule means the question has
  # never been asked — which is a true state, not a defect, and is answered by asking.
  echo "No mode rule in $rules/. The mode question has not been asked here."
  exit 0
fi

stale=""

for file in $found; do
  # The mode this file claims, taken from the filename, which is where the mode lives.
  claimed=$(printf '%s' "$file" | sed 's/\.md$//; s/^.*[0-9]Z-//')

  matched=""
  for mode in $defined; do
    [ "$claimed" = "$mode" ] && matched=yes
  done

  [ -n "$matched" ] || stale="$stale $file"
done

if [ -z "$stale" ]; then
  echo "The mode rule names a mode the installed foundation defines."
  exit 0
fi

for file in $stale; do
  claimed=$(printf '%s' "$file" | sed 's/\.md$//; s/^.*[0-9]Z-//')
  printf '%s\n' "$rules/$file"
  printf '    names the mode %s, which the installed foundation does not define\n' "$claimed"
done

cat <<REMEDY

Defined modes: $(printf '%s' "$defined" | tr '\n' ' ')

This file is this project's own, so no refresh will correct it and this script does not
either. Rename it for the mode it now is, and correct the mode named in its title and its
binding paragraph, and the rule name it cites. Leave the explanation below the binding
paragraph as written — a local rule is a dated snapshot, and only its first paragraph
binds, so an account of the system as it stood at this project's initiation is not made
wrong by a later change.
REMEDY

exit 1
