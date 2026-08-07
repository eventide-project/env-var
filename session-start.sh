#!/bin/sh
# Print the Waytide session-start notice.
#
# Run by the harness as a SessionStart hook, not by the agent — see the
# announce-waytide-at-session-start rule. It reads the package directories
# actually present and emits the notice as JSON on stdout, which the harness
# renders as its own message.
#
# The notice never disrupts a session: any problem exits quietly with no output.
#
# Invocation:
#
#   waytide/system/foundation/session-start.sh
#
# Nobody types that. install.sh wires it into .claude/settings.json as the SessionStart
# hook command, and the harness runs it. The line is recorded because a script whose
# invocation is not written down is one nobody can reproduce when the wiring breaks.

# Never let a notice break a session start.
set +e

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

# "installed", not "loaded": the hook runs before the session, so at the moment the
# notice prints, no rule file has been read. "Loaded" means brought into a runtime —
# read in — which is the one thing this notice cannot report. Installation and a live
# configuration are what the script can actually observe, so they are what it claims.
#
# What the initialization-rule carries is not here. It led this line from 2026-08-05 until
# 2026-08-06, and it moved to the agent, which prints it at the head of the response that begins
# the rule read — see the initialization-rule. It stands for a loading, and this hook runs before
# the session, so it could only ever appear here at a moment when nothing was being loaded. The
# move takes the doubled-backslash hazard with it: nothing of it is interpolated into JSON any
# more.
notice=$(printf 'Waytide installed at %s/ — %s %s: %s' \
  "$system" "$count" "$noun" "$list")

# Report work that has not reached a concluded state — experiments and features
# alike. Neither is ever left silently open (the experiment-lifecycle
# and feature-lifecycle rules), but nothing otherwise brings an open
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

# The load-command line, always present. The notice states what is installed; this states
# when the rules are read and what the developer types to have it happen now.
#
# The command names the read outright: "load waytide". It is a command, not the contentless
# foil request the line carried until 2026-07-28 — the developer's message now carries the
# instruction rather than only the occasion for it. What that gives up is attributability:
# with a contentless word, a read that followed could only have come from the hook's
# additionalContext channel, and with a named command it could have come from either. The
# command is legible to a developer who has never seen the system, which is what it buys.
#
# The command carries no emphasis markup. It was written with markdown asterisks until
# 2026-07-28, on the assumption that the harness renders the notice as markdown; it does not
# — the systemMessage is displayed as plain text, so the asterisks reached the developer
# literally and drew the eye to punctuation rather than to the words they were meant to
# emphasize. Emphasis is unavailable on this channel, and the line stands without it: it
# already ends with the command in the position the sentence points at.
#
# The command sentence is last. Until 2026-07-28 the cost of typing it — that loading takes
# a moment — followed the command, so the line ended on a caveat and the words to be typed
# sat mid-line. The two sentences are swapped so the command ends the line: the caveat is
# read before the developer decides, and the thing to type is the last thing on the line,
# which is where the eye lands and where a command can be copied without reading past it.
#
# No quotation marks, deliberately. The notice is interpolated into a JSON string built by
# printf with no escaping, so a double quote here would terminate the string and produce
# output the harness cannot parse — the notice would vanish with no error at all.
#
# A blank line precedes it. Everything above is what the notice reports — the install, and
# any experiment or feature left open — and this line is the only part that asks the
# developer to do something. Run together, the ask reads as one more reported fact and the
# command to type sits at the bottom of an undifferentiated block. The blank line falls
# after the open-work lines rather than between them and the install line, so the report
# stays one block and the break marks the change of purpose rather than a change of subject.
#
# A second blank line sets the command sentence apart from the caveat ahead of it. Ending
# the line with the command put the words to be typed in the position the eye settles on,
# but they were still the tail of a two-sentence paragraph, so finding them meant reading
# the caveat first. On its own line the command is the one thing on the notice's last line,
# and it can be read and copied without reading past anything. The caveat keeps its place
# ahead of it, where a developer reads it before deciding whether to type the command.
notice="${notice}\\n\\nWaytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.\\n\\nTo load them now, type: load waytide."

# The read instruction, carried to the agent rather than to the developer. It goes in
# additionalContext, not in the notice: the notice is rendered for a person, and an
# instruction addressed to the agent is not something the developer needs to read every
# session. The two channels have different audiences, so they carry different text.
#
# It states the read is unconditional because the failure it answers was conditional —
# a session opened with a small request, the read was judged not to be worth it, and the
# session then grew into rule edits and package publishes governed by rules never read.
#
# This does not verify that the rules were read. Nothing here can: the hook runs before
# the session and has no way to observe what the agent then does. It removes the excuse
# of the instruction being buried in a file the agent may not open, and no more.
# The local rules are named unconditionally, whether or not the directory is there. The
# binding rule (rules-convention) and the AGENTS.md bootstrap both name it without a
# condition, and an instruction narrower than the rule it exists to get followed is the defect
# being corrected. A project with no local rules yet is the ordinary case, not an error, and a
# fixed instruction is one string rather than one per project layout.
#
# The path defaults to the consuming-project layout, which is what an install produces; the
# authoring source is detected the same way the packages and the open-work scan are.
own_rules=${own:-waytide/local}

# The instruction names the initialization-rule as the first file to open, and it has to: what
# that rule carries is printed at the head of the read, and the agent has read nothing at the
# moment it prints. One rule file read ahead of the others is what supplies it. The block itself
# is not carried here — it lives in that rule, where it is edited as prose rather than as a
# doubled-backslash JSON literal.
#
# It also requires the response that opens that one file to carry no prose. The initialization-rule
# cannot ask for this: the response in question is the one that reads it, so at the moment the
# agent writes there, the rule is not yet in hand. This instruction is the only channel that
# reaches the agent before any file is opened, which is the same reason it names the file at all.
# Without the sentence the read opens on a line of narration standing in the one position that
# rule reserves.
instruction=$(printf 'Waytide is installed at %s/. Before your first substantive action in this session, read every rule file under %s/ and follow them — %s/foundation/ first, since it defines the system, then the other packages, including each package vocabulary.md, whose terms are binding and cannot be applied unread; not every package has one, and its absence is not a defect. Read the local rules this project adds as well, in %s/rules/, which are binding in the same way and which no package supplies; that directory may not exist yet, which is ordinary and not an error. Read only that one directory beside the packages: the working directories next to it — log, deferred, the project'\''s planning directories, work-sessions, experiments, loops, migration, suspended — are worked with as their own conventions describe and are not read as binding rules at session start. The read is unconditional: the apparent size of the first request is not a reason to defer it, because the size of the opening request predicts nothing about where the session goes. Open %s/foundation/initialization-rule.md ahead of every other rule file, and print what it carries at the head of the response that carries the rest of the read, per that rule. The response that opens that one file carries the tool call and nothing else: print no preamble there, and no account of what you are about to read, so what that rule carries is the first text of the read. Say nothing about it in any response — no name for it, no substitute word, no description standing in for one — and do not cite that rule by name. Once the rules are read, print the deferred queue as a list of rows, one row per item under %s/deferred/, per the print-the-deferred-queue-after-the-rule-read rule, and then wait for the developer to make a request. The developer may open with the command load waytide, which asks for exactly that and nothing more. Do not restate the session-start notice or print a package count; the announce-waytide-at-session-start rule reserves that to the harness.' \
  "$system" "$system" "$system" "$own_rules" "$system" "$own_rules")

hook_output=$(printf '"hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": "%s"}' \
  "$instruction")

printf '{"systemMessage": "%s", %s}\n' "$notice" "$hook_output"
