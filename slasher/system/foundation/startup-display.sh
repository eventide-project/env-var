#!/bin/sh
# Print the Slasher startup display: its loading part on a session's first prompt, or its
# session-start part, given message, for session-start.sh to put ahead of the notice.
#
# Run by the harness as a UserPromptSubmit hook, not by the agent. The harness sends the
# prompt as JSON on standard input, and renders the systemMessage this prints as its own
# message, so the display does not depend on the agent following an instruction.
#
# The display is read from the the-startup-display-prints-as-the-session-starts rule's fenced
# blocks, so the rule stays the one copy of it. The session-start part is the title, the
# copyright and license, and the load line. The loading part is the loading line, then the figure.
# The package-set example block is skipped: the agent prints the package set, in markdown.
#
# The display never disrupts a prompt: any problem exits quietly with no output.
#
# Invocation:
#
#   printf '{"session_id":"some-session","prompt":"some prompt"}' | slasher/system/foundation/startup-display.sh
#   slasher/system/foundation/startup-display.sh message
#   slasher/system/foundation/startup-display.sh load-line
#
# Nobody types the first. The Slasher plugin's UserPromptSubmit hook runs it on every prompt, and
# session-start.sh runs the second. The line is recorded because a script whose
# invocation is not written down is one nobody can reproduce when the wiring breaks.

# Never let the display break a prompt.
set +e

# Locate the system: slasher/system/ in a consuming project, system/ in the Slasher authoring
# source. Checked in that order — a consuming project may have a system/ directory of its own.
if [ -d slasher/system ]; then
  system=slasher/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  exit 0
fi

# The source rule, since the compiled rules are one file per package. Only its body is read, up to
# its Compressed section, whose fenced blocks would shift the count below.
rule=$system/foundation/source/the-startup-display-prints-as-the-session-starts.md
[ -f "$rule" ] || exit 0

# Given message, the title and the copyright and license, fenced blocks 1 and 3, are printed
# alone, as the systemMessage carries them, for session-start.sh to put ahead of the notice.
# Given load-line, the load line, block 4, is printed alone, for session-start.sh to put last,
# after the notice. Neither reads a prompt. Block 2 is the package-set example, which the agent
# prints.
#
# Otherwise this is the prompt hook, and the loading part, blocks 5 and 6, prints on the
# session's first prompt only, since that is when the read starts. A marker named for the
# session, under TMPDIR, records that the first prompt has passed. A prompt that names no
# session prints the loading part every time.
if [ "$1" = "message" ]; then
  blocks=" 1 3 "
elif [ "$1" = "load-line" ]; then
  blocks=" 4 "
else
  session=$(cat | sed -n 's/.*"session_id"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | tr -cd 'A-Za-z0-9_-')
  if [ -n "$session" ]; then
    markers="${TMPDIR:-/tmp}/slasher-first-prompt"
    [ -e "$markers/$session" ] && exit 0
    mkdir -p "$markers" && : > "$markers/$session"
  fi
  blocks=" 5 6 "
fi

# The chosen blocks, with one blank line between them.
display=$(awk -v blocks="$blocks" '
  /^## Compressed$/ { exit }
  /^```/ {
    if (inside) { inside = 0; next }
    inside = 1; block++
    wanted = index(blocks, " " block " ") > 0
    if (wanted && shown) print ""
    next
  }
  inside && wanted { print; shown = 1 }
' "$rule")

[ -n "$display" ] || exit 0

# The harness renders a systemMessage as plain text, so a line wrapped in markdown emphasis
# loses its asterisks rather than showing them. Then backslashes and double quotes are escaped
# and the lines joined with a literal backslash-n, which is what a JSON string can carry.
# The message opens with a backslash-n too: the harness prints its own label ahead of a
# systemMessage, and the line break puts the first line on a line of its own.
escaped=$(printf '%s\n' "$display" |
  sed 's/^\*\(.*\)\*$/\1/' |
  sed 's/\\/\\\\/g; s/"/\\"/g' |
  awk 'BEGIN { ORS = "" } { print "\\n" } { print }')

# The session-start part opens with one more backslash-n, so a blank line stands between the
# harness's label and the title.
if [ "$1" = "message" ]; then
  printf '\\n%s\n' "$escaped"
  exit 0
fi

# The load line follows the notice inside the same message, so it takes no break of its own.
if [ "$1" = "load-line" ]; then
  printf '%s\n' "${escaped#\\n}"
  exit 0
fi

# The loading part opens with one more backslash-n too, so a blank line stands between the
# harness's label and the loading line.
printf '{"systemMessage": "\\n%s"}\n' "$escaped"
