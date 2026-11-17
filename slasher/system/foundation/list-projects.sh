#!/bin/sh
# Read the Slasher projects on this machine — the projects that have installed
# the Slasher packages — and print them, one path per line.
#
# Run from the root of any project that has installed Slasher. This script lives
# inside the package, so it is invoked by its path from that root:
#
#   slasher/system/foundation/list-projects.sh
#
# It is packaged rather than kept with the authoring tools because it is not one.
# It is machine-scoped rather than project-scoped: it reports the Slasher projects
# on this machine, and the engineer who wants that is anyone who installed
# Slasher into more than one project, not only whoever maintains Slasher. The
# authoring tools at the composite root run against the packages; this runs
# beside projects, which is a third position and the reason it is here.
#
# It only reads. It detects nothing about a project's condition — not what is
# installed, not what is behind, not whether a tree is clean — reaches no
# network, and takes no action on anything it finds. What is done with a project
# it reports is directed separately; refreshing packages is not a default.
#
# The registry it reads is per-machine and lives outside this repository:
#
#   ~/.config/slasher/projects.toml
#
# That placement is the foundation rule a-project-does-not-name-its-downstream-consumers-in-its-own-files: a
# project does not name the projects that consume it, so this script is
# committed and the list it reads is not.

set -e

# Overridable so the script can be exercised against a registry written for a
# test, without touching the engineer's own.
registry=${SLASHER_REGISTRY:-$HOME/.config/slasher/projects.toml}

# --- The registry ----------------------------------------------------------
#
# Each Slasher project is one [[project]] entry, and the registry is nothing
# else:
#
#   [[project]]
#   path = "~/projects/some-project"   # a trailing comment is allowed
#   journal = "private"
#
# Blank lines and full-line comments are ignored. An entry's lines are a name,
# =, and a quoted string. Its path is the project's root, and a leading ~ is
# this machine's home directory. Its other lines are the project's own
# settings, which read-project-setting.sh reads, and none of them is read here.
#
# Anything outside this form is REFUSED, naming the line that caused it, and
# never skipped: a registry read in part would report a partial set as though it
# were the whole one. That includes the included and excluded lists an earlier
# registry used to name the folders to search. Each project is now named by its
# own entry.

if [ ! -f "$registry" ]; then
  echo "No registry at $registry" >&2
  echo >&2
  echo "Create it, with an entry for each project:" >&2
  echo >&2
  echo "  [[project]]" >&2
  echo "  path = \"~/projects/some-project\"" >&2
  exit 1
fi

paths=$(mktemp)
trap 'rm -f "$paths"' EXIT

in_project=""
line_number=0

refuse() {
  echo "$registry, line $line_number: $1" >&2
  echo "  $line" >&2
  echo >&2
  echo "Each project is a [[project]] entry, with its root as its path:" >&2
  echo >&2
  echo "  [[project]]" >&2
  echo "  path = \"~/projects/some-project\"" >&2
  exit 1
}

# The `|| [ -n "$line" ]` reads a final line that carries no newline.
while IFS= read -r line || [ -n "$line" ]; do
  line_number=$((line_number + 1))

  trimmed=$(printf '%s' "$line" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')

  case $trimmed in
    '' | '#'*)
      continue
      ;;
    '[[project]]')
      in_project=yes
      continue
      ;;
    included* | excluded*)
      refuse "the included and excluded lists are not read; name each project in a [[project]] entry"
      ;;
  esac

  if [ -z "$in_project" ]; then
    refuse "expected [[project]]"
  fi

  # A name, =, a quoted string, and an optional trailing comment.
  name=$(
    printf '%s' "$trimmed" |
      sed -n 's/^\([A-Za-z0-9_-]\{1,\}\)[[:space:]]*=[[:space:]]*"[^"]*"[[:space:]]*\(#.*\)\{0,1\}$/\1/p'
  )

  if [ -z "$name" ]; then
    refuse "expected a name = \"value\" line in a [[project]] entry"
  fi

  if [ "$name" != "path" ]; then
    continue
  fi

  path=$(printf '%s' "$trimmed" | sed 's/^[^"]*"\([^"]*\)".*$/\1/')

  # A leading ~ is this machine's home directory. Nothing else is expanded.
  case $path in
    '~') path=$HOME ;;
    '~/'*) path=$HOME${path#\~} ;;
  esac

  # A trailing slash would make one project read as two.
  while [ "$path" != "/" ] && [ "${path%/}" != "$path" ]; do
    path=${path%/}
  done

  printf '%s\n' "$path" >> "$paths"
done < "$registry"

# --- The projects ----------------------------------------------------------
#
# A Slasher project is a git repository whose root holds slasher/system/ — the
# discriminator refresh-packages.sh already applies, reused rather than defined
# a second time. This repository is not one: the authoring source holds
# system/foundation with no wrapper. An entry whose path is not a Slasher
# project is reported and skipped, and the others are still listed.

listed=0

sort -u "$paths" -o "$paths"

# Read from the file rather than a pipe, so the count is not lost in a subshell.
while IFS= read -r project; do
  # .git is a directory in an ordinary clone and a file in a worktree.
  if [ -d "$project/slasher/system" ] && [ -e "$project/.git" ]; then
    printf '%s\n' "$project"
    listed=$((listed + 1))
  else
    echo "Not a Slasher project, skipped: $project" >&2
  fi
done < "$paths"

if [ "$listed" -eq 0 ]; then
  echo "No Slasher projects are listed in $registry" >&2
fi
