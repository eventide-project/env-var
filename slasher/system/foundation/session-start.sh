#!/bin/sh
# Print the Slasher session-start notice.
#
# Run by the harness as a SessionStart hook, not by the agent — see the
# the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule. It reads the package directories
# actually present and emits the notice as JSON on stdout, which the harness
# renders as its own message.
#
# The notice never disrupts a session: any problem exits quietly with no output.
#
# Invocation:
#
#   slasher/system/foundation/session-start.sh
#   slasher/system/foundation/session-start.sh instruction
#
# Nobody types the first. The second prints the read instruction alone, as plain text, and is
# run by the /load skill, so /load follows the same text load rules acts on rather than a copy.
# install.sh wires the first into .claude/settings.json as the SessionStart hook command,
# and the harness runs it. The line is recorded because a script whose
# invocation is not written down is one nobody can reproduce when the wiring breaks.

# Never let a notice break a session start.
set +e

# Locate the system: slasher/system/ in a consuming project, system/
# in the Slasher authoring source. Checked in that order — a consuming project
# may have a system/ directory of its own.
if [ -d slasher/system ]; then
  system=slasher/system
elif [ -d system ] && [ -d system/foundation ]; then
  system=system
else
  exit 0
fi

# A package is a directory carrying a README.md. That distinguishes a package
# from a grouping directory: system/ext/ has no README and is not a package,
# system/ext/ruby-lang/ has one and is. Depth 2 finds a top-level package's
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
# notice is what a engineer sees before any other package is added.
noun=packages
if [ "$count" = "1" ]; then
  noun=package
fi

# "installed", not "loaded": the hook runs before the session, so at the moment the
# notice prints, no rule file has been read. "Loaded" means brought into a runtime —
# read in — which is the one thing this notice cannot report. Installation and a live
# configuration are what the script can actually observe, so they are what it claims.
#
# What the the-startup-display-prints-as-the-session-starts rule carries is not here. It led this line from 2026-08-05 until
# 2026-08-06, and it moved to the agent, which prints it at the head of the response that begins
# the rule read — see the the-startup-display-prints-as-the-session-starts rule. It stands for a loading, and this hook runs before
# the session, so it could only ever appear here at a moment when nothing was being loaded. The
# move takes the doubled-backslash hazard with it: nothing of it is interpolated into JSON any
# more.
notice=$(printf 'Slasher installed at %s/ — %s %s: %s' \
  "$system" "$count" "$noun" "$list")

# Report work that has not reached a concluded state. An implementation is never
# left silently open (the an-implementation-runs-on-a-branch-to-a-declared-end rule), but nothing otherwise
# brings an open one to attention: the working directories under slasher/ are not read at session
# start, and work done in a worktree leaves no trace in the main working tree at
# all — it stays on the upstream branch, so even the branch name gives nothing away.
#
# The state is read from the record's canonical "**State:** <state>" line. The state
# words also appear throughout a record's prose, so only that line is authoritative.
# Active is the in-progress state. A record without a line is reported too, since it
# has not concluded.
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
      Open)
        note=open
        ;;
      Active)
        note=active
        ;;
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

    # The name is the filename without its datetime prefix and without its state suffix,
    # which an open record carries as -OPEN, -ACTIVE, or -SUSPENDED.
    name=$(
      basename "$record" .md |
        sed -e 's|^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}T[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}Z-||' \
          -e 's|-[A-Z][A-Z]*$||'
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

# Locate the project's own working state: slasher/local/ in a consuming project,
# local/ in the Slasher authoring source — the same two-layout check the packages get.
if [ -d slasher/local ]; then
  own=slasher/local
elif [ -d local ]; then
  own=local
else
  own=
fi

implementations=

if [ -n "$own" ]; then
  # One directory, one call. The concluded words are the union of the two kinds':
  # any implementation may reach a verdict or Completed, and may be abandoned or
  # superseded. A deferred, discontinued, or obsolete implementation is not current work,
  # so it is not reported. Open and Suspended are deliberately absent — an open
  # implementation has its branch, and a suspended one is paused rather than concluded,
  # and both are still reported.
  implementations=$(
    report_open "$own/implementations" implementation implementations \
      Affirmed Refuted Inconclusive Completed Abandoned Superseded Discontinued Deferred Obsolete
  )
fi

# Literal backslash-ns, so the JSON string carries line breaks the harness renders — not
# actual newlines, which would be invalid inside a JSON string. A blank line sets the open
# implementations apart from the install line.
if [ -n "$implementations" ]; then
  notice="${notice}\\n\\n${implementations}"
fi

# The notice has no close of its own. The startup display's load line, printed after it, says
# when the rules load and that /load loads them now. A close here said the same until
# 2026-11-04, and the notice ends with what it reports: the install, and any experiment or
# feature left open.

# The read instruction, carried to the agent rather than to the engineer. It goes in
# additionalContext, not in the notice: the notice is rendered for a person, and an
# instruction addressed to the agent is not something the engineer needs to read every
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
# binding rule (the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule) and the AGENTS.md bootstrap both name it without a
# condition, and an instruction narrower than the rule it exists to get followed is the defect
# being corrected. A project with no local rules yet is the ordinary case, not an error, and a
# fixed instruction is one string rather than one per project layout.
#
# The path defaults to the consuming-project layout, which is what an install produces; the
# authoring source is detected the same way the packages and the open-work scan are.
own_rules=${own:-slasher/local}

# A package's rules are compiled from its source/ directory, by compile.sh in the authoring
# source. The compiled rules at the package root are what is read. The source rules and the
# README.md are not: the first are the same rules with their footers, and the second
# summarizes rules the read already carries.
#
# The instruction does not ask the agent to print the startup display. The harness prints it, from
# startup-display.sh, as the session starts and on its first prompt — see the
# the-startup-display-prints-as-the-session-starts rule. The
# agent printed it until 2026-10-10, on an instruction here naming the the-startup-display-prints-as-the-session-starts rule as the
# first file to open, and under a later model the display stopped reaching the engineer: it was
# skipped, or written into the agent's thinking where it is not shown. Nothing reported either.
instruction=$(printf 'Slasher is installed at %s/. Before your first substantive action in this session, run %s/foundation/load-rules.sh from the project root, in one command, and read its whole output; where the output is saved to a file because it is long, read that file to its end. It prints, each under a line naming it, every package'\''s rules-pre-loaded.md and vocabulary.md, foundation first, since it defines the system; the vocabularies'\'' terms are binding and cannot be applied unread. It then prints the local rules this project adds, in %s/rules/, which are binding in the same way, this project'\''s own vocabulary, %s/vocabulary.md, whose terms and substitutions decide over every package'\''s, and the journal. Follow the rules. Read no rule file one by one; the loader'\''s output is the read. Each package'\''s ON DEMAND section lists rules it does not print, each with its trigger and the command that loads it. When the act a trigger names comes up, run that command and follow the rule it prints before acting. Read only those two beside the packages, unless an installed package'\''s own rule directs another read: the working directories next to them — logs, items, implementations, migration — are worked with as their own conventions describe and are not read as binding rules at session start. The read is unconditional: the apparent size of the first request is not a reason to defer it, because the size of the opening request predicts nothing about where the session goes. Do not print the startup display the the-startup-display-prints-as-the-session-starts rule describes. The harness prints it. Once the rules are read, wait for the engineer to make a request. The engineer may open with /load, or with the command load rules, which ask for exactly that and nothing more. Do not restate the session-start notice or print a package count; the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule reserves that to the harness.' \
  "$system" "$system" "$own_rules" "$own_rules")

# The package set, where the project has declared one. It goes to the agent and not into the
# notice: the notice is displayed as plain text, and what is printed about a set is emphasized —
# see the a-project-declares-which-installed-packages-are-active rule, which puts it at the head of the agent's
# response that carries the read, where markdown renders.
#
# The record with the latest time prefix is the one that holds, which a plain sort gives, because
# the prefix is ISO-8601-UTC and sorts lexically in time order.
declaration=
if [ -n "$own" ]; then
  declaration=$(ls "$own"/*-package-set.md 2>/dev/null | sort | tail -1)
fi

if [ -n "$declaration" ]; then
  # Read one plain text data attribute line. The leading list marker is optional, so a record may
  # carry the lines as a list or as bare lines.
  #
  # The value is stripped of everything but the characters a package name and a separator need.
  # This is interpolated into a JSON string by a printf with no escaping at all, so a double quote
  # or a backslash reaching here would produce output the harness cannot parse and the whole
  # notice would vanish with no error — the hazard the double-quote comment below records. A
  # declaration is hand-written, so it is the one input here that is not this system's own output.
  attribute() {
    sed -n "s|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*$1:\*\*[[:space:]]*\(.*\)$|\1|p" "$declaration" |
      head -1 |
      tr -cd 'A-Za-z0-9,./ _-'
  }

  declared=$(attribute 'Package set')
  active=$(attribute 'Packages')

  # The Packages line is authoritative, so what is inactive is every installed package it does
  # not name. The Inactive line records what was installed and not active when the set was
  # declared, and a package installed since is on neither line, so the line is not read here.
  inactive=$(
    printf '%s\n' "$packages" | while read -r package; do
      printf '%s\n' "$active" | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' |
        grep -qx "$package" || printf '%s\n' "$package"
    done | tr '\n' ',' | sed 's|,$||; s|,|, |g'
  )

  # Both of the first two are required. A record naming a set but resolving to nothing would
  # deactivate everything, which no engineer means by declaring one, so it is treated as no
  # declaration at all rather than obeyed.
  if [ -n "$declared" ] && [ -n "$active" ]; then
    # The word for what is not active, when nothing is. Declaring a set that happens to cover
    # everything installed is an ordinary thing to do, and "Inactive: " followed by nothing reads
    # as a record with a piece missing.
    if [ -z "$inactive" ]; then
      inactive="none"
    fi

    set_instruction=$(printf ' This project has declared a package set: %s. The active packages are %s, and the deactivated ones are %s. The loader does not print a deactivated package'\''s rules; its DEACTIVATED section names the command that loads it. If the engineer reactivates a deactivated package during the session, run that command and follow its rules from then on. Follow only the active packages'\'' rules.' \
      "$declared" "$active" "$inactive")

    # The set is printed unless it is `default` with nothing deactivated, where the initialization
    # rule has it print nothing. Telling the agent to print it there would leave each session to
    # settle the conflict itself.
    if [ "$declared" != "default" ] || [ "$inactive" != "none" ]; then
      set_instruction="${set_instruction} Print the package set at the head of the response that carries the read, per the a-project-declares-which-installed-packages-are-active rule."
    fi

    instruction="${instruction}${set_instruction}"
  fi
fi

# The read instruction alone, for /load. It is the instruction a session start carries, with no
# compaction preface, since /load is typed rather than run after a compaction.
if [ "$1" = "instruction" ]; then
  printf '%s\n' "$instruction"
  exit 0
fi

# On a compaction, the rules read at the start survive only as the compaction's summary. The
# event's input names its source; a hook run by hand at a terminal has no input, and is not
# waited on.
event=
[ -t 0 ] || event=$(cat)
source=$(printf '%s' "$event" | sed -n 's/.*"source"[[:space:]]*:[[:space:]]*"\([a-z]*\)".*/\1/p')

if [ "$source" = "compact" ]; then
  instruction="The context has just been compacted. The rules read at the start of this session now survive only as the compaction's summary, which does not hold them. Before your next act, whatever the next request is, run the loader again and read its whole output, as follows. ${instruction}"
fi

# After a compaction the session is under way, so the engineer sees one line in place of the
# startup display and the notice.
if [ "$source" = "compact" ]; then
  notice="Context compacted. Slasher is reloading its rules."
else
  # The startup display's title and license lead the message, and its load line ends it, so the
  # notice stands between them. startup-display.sh prints each ready for a JSON string, and prints
  # nothing where its rule is missing, which leaves the notice alone.
  display=$(sh "$system/foundation/startup-display.sh" message 2>/dev/null)
  if [ -n "$display" ]; then
    notice="${display}\\n\\n${notice}"
  fi

  load_line=$(sh "$system/foundation/startup-display.sh" load-line 2>/dev/null)
  if [ -n "$load_line" ]; then
    notice="${notice}\\n\\n${load_line}"
  fi
fi

# The core rules, carried after the instruction, so they hold from the session's start, before
# the read that loads the rest. core-rules names them, and the loader prints each as the read
# does. A hook can give the agent at most 10,000 characters, so the list holds only the rules
# that shape the first answer. Unlike the notice, these rules hold quotation marks and
# backslashes, so they are escaped for the JSON string, and their lines joined with
# backslash-n.
core=
if [ -f "$system/foundation/core-rules" ] && [ -f "$system/foundation/load-rules.sh" ]; then
  while IFS= read -r name; do
    [ -n "$name" ] || continue
    entry=$(sh "$system/foundation/load-rules.sh" "$name" 2>/dev/null) || continue
    core="${core}

${entry}"
  done < "$system/foundation/core-rules"
fi

if [ -n "$core" ]; then
  escaped_core=$(printf 'These rules hold from the start of the session, before the read, which still runs in full.%s\n' "$core" |
    sed 's/\\/\\\\/g; s/"/\\"/g; s/	/\\t/g' |
    awk 'BEGIN { ORS = "" } NR > 1 { print "\\n" } { print }')
  instruction="${instruction}\\n\\n${escaped_core}"
fi

hook_output=$(printf '"hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": "%s"}' \
  "$instruction")

printf '{"systemMessage": "%s", %s}\n' "$notice" "$hook_output"
