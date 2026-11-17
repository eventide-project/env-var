#!/bin/sh
# Succeed where Claude Code was started from the command line with /load as its prompt, and fail
# otherwise.
#
# Invocation:
#
#   slasher/system/foundation/started-with-load.sh
#
# Nobody types it. session-start.sh runs it to decide whether to print the startup display's
# load line, which tells the engineer to enter /load. Where the engineer already started Claude
# Code with /load, as in `claude /load`, the line tells them nothing. The line is recorded
# because a script whose invocation is not written down is one nobody can reproduce when the
# wiring breaks.
#
# The harness gives a hook no record of how Claude Code was started. The script reads the command
# lines of the processes above it instead, nearest first, and stops at the first that is Claude
# Code: a word whose last path part is `claude`, or `claude-code/cli.js`, where Claude Code runs
# under node. The words after it are its options and its prompt. The prompt loads the rules where
# a word is /load or /slasher:load and the next word is not help, or where two words read load
# rules. The command line joins the arguments with spaces, so a prompt that only mentions /load
# also counts. The cost of that is a missing load line, and nothing else.
#
# Where no Claude Code process is found, as in the desktop app or the cloud, or ps is not
# available, the script fails, and the load line prints as it always did.

set +e

pid=$PPID
depth=0

while [ -n "$pid" ] && [ "$pid" -gt 1 ] 2>/dev/null && [ "$depth" -lt 20 ]; do
  args=$(ps -o args= -p "$pid" 2>/dev/null)
  [ -n "$args" ] || exit 1

  verdict=$(printf '%s\n' "$args" | awk '
    {
      for (i = 1; i <= NF; i++) {
        name = $i
        sub(/.*\//, "", name)
        if (name == "claude" || $i ~ /claude-code\/cli\.js$/) { start = i; break }
      }
      if (!start) { print "none"; exit }
      for (i = start + 1; i <= NF; i++) {
        if (($i == "/load" || $i == "/slasher:load") && $(i + 1) != "help") { print "load"; exit }
        if ($i == "load" && $(i + 1) == "rules") { print "load"; exit }
      }
      print "other"
    }')

  case "$verdict" in
    load) exit 0 ;;
    other) exit 1 ;;
  esac

  pid=$(ps -o ppid= -p "$pid" 2>/dev/null | tr -d ' ')
  depth=$((depth + 1))
done

exit 1
