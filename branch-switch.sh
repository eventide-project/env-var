#!/bin/sh
# Report a branch switch to the agent: record the branch before a shell command, and after it,
# tell the agent to print the branch-switch block where the branch changed.
#
# Run by the harness as a PreToolUse and a PostToolUse hook on the Bash tool, not by the agent.
# The harness sends the tool use as JSON on standard input. Given before, the script records the
# branch of the repository it runs in. Given after, it compares the branch with the recorded one,
# and where they differ it prints the instruction as additionalContext, which the harness gives to
# the agent. A hook cannot know why the switch was made, so the agent prints the block, with the
# reason, as the announce-a-branch-switch-in-a-bordered-block rule describes.
#
# The record is kept under TMPDIR, one file for each tool use, named for its session and its
# tool use, so commands run at the same time do not read each other's record.
#
# The hook never disrupts a command: any problem exits quietly with no output.
#
# Invocation:
#
#   printf '{"session_id":"some-session","tool_use_id":"some-tool-use"}' | slasher/system/git/branch-switch.sh before
#   printf '{"session_id":"some-session","tool_use_id":"some-tool-use"}' | slasher/system/git/branch-switch.sh after
#
# Nobody types these. The Slasher plugin's hooks run them on every shell command. The lines are
# recorded because a script whose invocation is not written down is one nobody can reproduce when
# the wiring breaks.

# Never let the hook break a command.
set +e

field() {
  printf '%s' "$event" | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" | tr -cd 'A-Za-z0-9_-'
}

# The branch, or the short commit where HEAD names no branch. A double quote, which a branch name
# may hold, is escaped for the JSON it is printed in.
branch() {
  name=$(git symbolic-ref --short -q HEAD 2>/dev/null) || name=$(git rev-parse --short HEAD 2>/dev/null)
  printf '%s' "$name" | sed 's/"/\\"/g'
}

event=$(cat)
session=$(field session_id)
tool_use=$(field tool_use_id)
[ -n "$session" ] || exit 0

records="${TMPDIR:-/tmp}/slasher-branch"
record="$records/$session-$tool_use"

case "$1" in
  before)
    current=$(branch)
    [ -n "$current" ] || exit 0
    mkdir -p "$records" && printf '%s' "$current" > "$record"
    ;;
  after)
    [ -f "$record" ] || exit 0
    previous=$(cat "$record")
    rm -f "$record"
    current=$(branch)
    [ -n "$current" ] || exit 0
    [ "$current" = "$previous" ] && exit 0
    printf '{"hookSpecificOutput": {"hookEventName": "PostToolUse", "additionalContext": "The last command switched the branch from %s to %s. Before anything else, print the branch-switch block, as the announce-a-branch-switch-in-a-bordered-block rule describes, with from %s, to %s, and the reason for the switch."}}\n' \
      "$previous" "$current" "$previous" "$current"
    ;;
esac

exit 0
