#!/bin/sh
# Render the status line, carrying a persistent Waytide installation indicator.
#
# Run by the harness as its statusLine command — see the
# announce-waytide-at-session-start rule. Where the SessionStart notice marks
# the moment the system loaded, this keeps the fact on screen for the whole
# session, outside the conversation.
#
# Invocation:
#
#   waytide/system/foundation/statusline.sh
#
# Nobody types that either. install.sh wires it into .claude/settings.json as the
# statusLine command, and the harness runs it every turn.
#
# Because a project-level statusLine replaces whatever status line the developer
# configured for themselves, this renders the working directory and git branch
# too, so adopting it takes nothing away.

set +e

# The harness sends session context as JSON on stdin. Nothing here needs it, but
# it is consumed so the harness never writes into a closed pipe.
cat >/dev/null 2>&1

# The repository's own name leads the line and is set in bold, so the developer's first
# orientation — which repository this is — separates from the segments annotating it. The
# harness passes terminal escape sequences through, and printf builds them here because a
# literal escape byte cannot be written into a shell string portably.
bold=$(printf '\033[1m')
plain=$(printf '\033[0m')

directory=$(basename "$PWD" 2>/dev/null)
if [ -n "$directory" ]; then
  directory="${bold}${directory}${plain}"
fi

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

# Files git has never been told about — untracked and not ignored. They already raise the
# uncommitted segment, and they still do: uncommitted names the axis, work that is not in
# the history, and an untracked file is on it. This segment names the particular state,
# because its remedy is the one that differs — an untracked file is added or ignored, where
# a modified tracked file is committed. Without it the line reported uncommitted changes
# over a tree where nothing had been modified at all, which sends the developer looking for
# an edit that does not exist.
#
# So an untracked file raises both segments, deliberately. The alternative — narrowing
# uncommitted to tracked modifications — would make the two segments a partition and cost
# the axis: a developer scanning for whether anything is uncommitted would have to read two
# segments to answer one question.
untracked=
if [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
  untracked="untracked files"
fi

# Commits that exist only here — the next state along the same axis as uncommitted work,
# and work that would be lost with this working copy just the same. Nothing else announces
# them; the count is otherwise noticed only when someone thinks to ask.
#
# It reads only local refs and never reaches the network. The status line renders on every
# turn, so fetching is out of the question. What this compares against is the
# remote-tracking ref, which reflects the last fetch rather than the remote as it stands
# now — so the segment reports the last known remote state, and a stale tracking ref can
# leave it silent when the remote has in fact moved.
#
# No count, matching the uncommitted segment. The line already carries one number, and the
# fact worth surfacing is that unpushed work exists at all; how much is a question for git,
# which answers it precisely on request.
#
# A branch with no upstream reports nothing. "Unpushed" is a claim relative to somewhere,
# and with no upstream configured there is no somewhere for it to be relative to — a branch
# that was never going to be pushed is ordinary, and calling it unpushed would be false.
# That leaves an upstream missing by accident unreported, which is a different fact than
# this segment names and is not folded into it.
unpushed=
if git rev-parse --abbrev-ref --symbolic-full-name @{upstream} >/dev/null 2>&1; then
  ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
  if [ -n "$ahead" ] && [ "$ahead" != "0" ]; then
    unpushed="unpushed commits"
  fi
fi

# Locate the system, as the session-start notice does.
if [ -d waytide/system ]; then
  system=waytide/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  system=
fi

# The segment names the system and nothing else. It carried a package count until
# 2026-07-28; the count told a developer nothing they act on, changed only when a package
# was installed, and competed for width with the segments that do change. What the line is
# for here is the standing fact that Waytide is in force — one word says it.
#
# Presence is still read from disk rather than assumed: at least one directory carrying a
# README.md, the same test for a package that the session-start notice uses. Only the
# display drops the number.
waytide=
if [ -n "$system" ]; then
  package=$(
    cd "$system" 2>/dev/null &&
      find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null | head -1
  )
  if [ -n "$package" ]; then
    waytide=":: Waytide"
  fi
fi

# The directory and branch lead, separated by a middle dot; the Waytide segment
# trails after a double colon, so the developer's own orientation comes first and the
# system indicator reads as an annotation on it. The double colon separates more firmly
# than the hyphen it replaced on 2026-07-28: a hyphen also joins words, so it read as
# punctuation inside the sentence of segments rather than as the break between the
# developer's own state and the system standing behind it.
line=
for segment in "$directory" "$branch" "$changes" "$untracked" "$unpushed"; do
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
