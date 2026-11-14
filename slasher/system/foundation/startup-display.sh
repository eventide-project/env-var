#!/bin/sh
# Print the Waytide startup display when the engineer types load waytide.
#
# Run by the harness as a UserPromptSubmit hook, not by the agent. The harness sends the
# prompt as JSON on standard input, and renders the systemMessage this prints as its own
# message, so the display does not depend on the agent following an instruction.
#
# The display is read from the initialization-rule's fenced blocks — the title, the copyright
# and license, the loading line, and the figure — so the rule stays the one copy of it. The
# package-set example block is skipped: the agent prints the package set, in markdown.
#
# The display never disrupts a prompt: any problem exits quietly with no output.
#
# Invocation:
#
#   printf '{"prompt":"load waytide"}' | waytide/system/foundation/startup-display.sh
#
# Nobody types that. It is wired into .claude/settings.json as the UserPromptSubmit hook
# command, and the harness runs it on every prompt. The line is recorded because a script whose
# invocation is not written down is one nobody can reproduce when the wiring breaks.

# Never let the display break a prompt.
set +e

# Locate the system: waytide/system/ in a consuming project, system/ in the Waytide authoring
# source. Checked in that order — a consuming project may have a system/ directory of its own.
if [ -d waytide/system ]; then
  system=waytide/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  exit 0
fi

rule=$system/foundation/initialization-rule.md
[ -f "$rule" ] || exit 0

# Only the exact command. The closing quote is what makes the match exact.
case "$(cat)" in
  *'"prompt":"load waytide"'*|*'"prompt": "load waytide"'*) ;;
  *) exit 0 ;;
esac

# Fenced blocks 1, 3, 4, and 5, with one blank line between them. Block 2 is the package-set
# example, which the agent prints.
display=$(awk '
  /^```/ {
    if (inside) { inside = 0; next }
    inside = 1; block++
    if (block != 2 && shown) print ""
    next
  }
  inside && block != 2 { print; shown = 1 }
' "$rule")

[ -n "$display" ] || exit 0

# The harness renders a systemMessage as plain text, so a line wrapped in markdown emphasis
# loses its asterisks rather than showing them. Then backslashes and double quotes are escaped
# and the lines joined with a literal backslash-n, which is what a JSON string can carry.
escaped=$(printf '%s\n' "$display" |
  sed 's/^\*\(.*\)\*$/\1/' |
  sed 's/\\/\\\\/g; s/"/\\"/g' |
  awk 'BEGIN { ORS = "" } NR > 1 { print "\\n" } { print }')

printf '{"systemMessage": "%s"}\n' "$escaped"
