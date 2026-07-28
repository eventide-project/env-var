#!/bin/sh
# Render the status line, carrying a persistent Waytide load indicator.
#
# Run by the harness as its statusLine command — see the
# announce-waytide-at-session-start rule. Where the SessionStart notice marks
# the moment the system loaded, this keeps the fact on screen for the whole
# session, outside the conversation.
#
# Because a project-level statusLine replaces whatever status line the developer
# configured for themselves, this renders the working directory and git branch
# too, so adopting it takes nothing away.

set +e

# The harness sends session context as JSON on stdin. Nothing here needs it, but
# it is consumed so the harness never writes into a closed pipe.
cat >/dev/null 2>&1

directory=$(basename "$PWD" 2>/dev/null)
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# Anything git would report as not committed — modified tracked files, staged changes,
# and untracked files that are not ignored. All three are uncommitted, and the last is
# not the noise it might seem: a file left untracked is usually one that should be added
# or ignored, so reporting it is the point rather than a cost.
#
# The segment is absent when the tree is clean, which is how the whole line works —
# a segment appears only when it has something to say.
changes=
if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
  changes="uncommitted changes"
fi

# Locate the system, as the session-start notice does.
if [ -d waytide/system ]; then
  system=waytide/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  system=
fi

waytide=
if [ -n "$system" ] && [ -z "$WAYTIDE_QUIET" ]; then
  count=$(
    cd "$system" 2>/dev/null &&
      find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null | wc -l | tr -d ' '
  )
  if [ -n "$count" ] && [ "$count" != "0" ]; then
    noun=packages
    if [ "$count" = "1" ]; then
      noun=package
    fi
    waytide="- Waytide system active ($count $noun)"
  fi
fi

# The directory and branch lead, separated by a middle dot; the Waytide segment
# trails after a hyphen, so the developer's own orientation comes first and the
# system indicator reads as an annotation on it.
line=
for segment in "$directory" "$branch" "$changes"; do
  if [ -n "$segment" ]; then
    if [ -z "$line" ]; then
      line="$segment"
    else
      line="$line · $segment"
    fi
  fi
done

if [ -n "$waytide" ]; then
  if [ -z "$line" ]; then
    line="$waytide"
  else
    line="$line $waytide"
  fi
fi

printf '%s\n' "$line"
