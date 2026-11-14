#!/bin/sh
# Usage:
#
#   private-session.sh <state-directory> <now>
#
# Reads a UserPromptSubmit event on standard input. A prompt of /private session, or
# /slasher:private session, starts a private session by writing the session's state file, named
# for the session, in <state-directory>. /private session end removes it.
#
# The state file holds the time of the session's last prompt, in seconds since the epoch. Each
# prompt in a private session writes <now> there. Where more than 4 minutes passed since the last
# prompt, it prints the instruction to ask the engineer whether to continue the private session
# or end it.
#
# The plugin's hooks/private-session runs this. See the
# anything-given-to-private-is-recorded-only-in-the-private-directory rule.

state_directory=${1:?usage: private-session.sh <state-directory> <now>}
now=${2:?usage: private-session.sh <state-directory> <now>}

read_event() {
  python3 -c 'import json, sys
event = json.load(sys.stdin)
print(event.get("session_id", ""))
print(event.get("prompt", "").replace("\n", " "))'
}

{ read -r session_id; read -r prompt; } <<EVENT
$(read_event)
EVENT

state=$state_directory/$session_id
[ -n "$session_id" ] || exit 0

case $prompt in
  "/private session end"*|"/slasher:private session end"*)
    rm -f "$state"
    exit 0 ;;
  "/private session"*|"/slasher:private session"*)
    mkdir -p "$state_directory"
    printf '%s\n' "$now" > "$state"
    exit 0 ;;
esac

[ -f "$state" ] || exit 0

last_prompt=$(cat "$state")
printf '%s\n' "$now" > "$state"

if [ $((now - last_prompt)) -gt 240 ]; then
  echo "The private session has had no prompt for more than 4 minutes. Before anything else, ask the engineer, through the selection interface, whether to continue the private session or end it. Where the engineer ends it, delete $state."
fi
