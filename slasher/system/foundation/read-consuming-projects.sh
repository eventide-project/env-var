#!/bin/sh
# Read the consuming projects on this machine — the projects that have installed
# the Waytide packages — and print the actionable set, one path per line.
#
# Run from the root of any project that has installed Waytide. This script lives
# inside the package, so it is invoked by its path from that root:
#
#   waytide/system/foundation/read-consuming-projects.sh
#
# It is packaged rather than kept with the authoring tools because it is not one.
# It is machine-scoped rather than project-scoped: it reports the Waytide projects
# on this machine, and the engineer who wants that is anyone who installed
# Waytide into more than one project, not only whoever maintains Waytide. The
# authoring tools at the composite root run against the packages; this runs
# beside projects, which is a third position and the reason it is here.
#
# "All consuming projects" means the projects that are not excluded. An excluded
# path is not printed, not marked, and not counted; nothing is done to it, which
# is what excluding it does. So this output and that phrase are the same list.
#
# It only reads. It detects nothing about a project's condition — not what is
# installed, not what is behind, not whether a tree is clean — reaches no
# network, and takes no action on anything it finds. What is done with a project
# it reports is directed separately; refreshing packages is not a default.
#
# The registry it reads is per-machine and lives outside this repository:
#
#   ~/.config/waytide/consuming-projects.toml
#
# That placement is the foundation rule a-project-does-not-name-its-consumers: a
# project does not name the projects that consume it, so this script is
# committed and the list it reads is not.

set -e

# Overridable so the script can be exercised against a registry written for a
# test, without touching the engineer's own.
registry=${WAYTIDE_REGISTRY:-$HOME/.config/waytide/consuming-projects.toml}

# --- The registry ----------------------------------------------------------
#
# The accepted subset of TOML, and nothing else:
#
#   included = [
#     "~/projects",           # a trailing comment is allowed
#     "~/work/some-project",
#   ]
#
#   excluded = [
#     "~/projects/old-clone",
#   ]
#
# Blank lines and full-line comments are ignored. A path is a quoted string
# alone on its line, with an optional trailing comma. Both keys are optional.
#
# TOML permits more than this — an inline array on one line, multi-line strings,
# other keys — and none of it is read here. Anything outside the subset is
# REFUSED, naming the line that caused it, and never skipped: a registry read in
# part would report a partial set as though it were the whole one, which is the
# silent failure this script exists to remove.

if [ ! -f "$registry" ]; then
  echo "No registry at $registry" >&2
  echo >&2
  echo "Create it, naming the directories to walk:" >&2
  echo >&2
  echo "  included = [" >&2
  echo "    \"~/projects\"," >&2
  echo "  ]" >&2
  exit 1
fi

included=$(mktemp)
excluded=$(mktemp)
found=$(mktemp)
trap 'rm -f "$included" "$excluded" "$found"' EXIT

key=""
line_number=0

refuse() {
  echo "$registry, line $line_number: $1" >&2
  echo "  $line" >&2
  echo >&2
  echo "The accepted form is a quoted path alone on its line, inside" >&2
  echo "included = [ or excluded = [ and closed by ]. See the comments at the" >&2
  echo "top of this script for the whole of what is read." >&2
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
  esac

  if [ -z "$key" ]; then
    case $trimmed in
      included* | excluded*)
        name=${trimmed%%[![:alpha:]]*}
        rest=$(printf '%s' "$trimmed" | sed "s/^$name[[:space:]]*//")

        case $rest in
          '=['*)
            rest=$(printf '%s' "$rest" | sed 's/^=[[:space:]]*//')
            ;;
          '='*)
            rest=$(printf '%s' "$rest" | sed 's/^=[[:space:]]*//')
            ;;
          *)
            refuse "expected $name = [" ;;
        esac

        if [ "$rest" != "[" ]; then
          refuse "expected the array to open with [ alone; an inline array is not read"
        fi

        key=$name
        ;;
      *)
        refuse "expected included = [ or excluded = [" ;;
    esac

    continue
  fi

  if [ "$trimmed" = "]" ]; then
    key=""
    continue
  fi

  # A quoted path, an optional trailing comma, an optional trailing comment.
  path=$(
    printf '%s' "$trimmed" |
      sed -n 's/^"\([^"]*\)"[[:space:]]*,\{0,1\}[[:space:]]*\(#.*\)\{0,1\}$/\1/p'
  )

  if [ -z "$path" ]; then
    refuse "expected a quoted path, or ] to close $key"
  fi

  # A leading ~ is this machine's home directory. Nothing else is expanded.
  case $path in
    '~') path=$HOME ;;
    '~/'*) path=$HOME${path#\~} ;;
  esac

  # Trailing slashes would defeat the prefix test the exclusions use.
  while [ "$path" != "/" ] && [ "${path%/}" != "$path" ]; do
    path=${path%/}
  done

  case $key in
    included) printf '%s\n' "$path" >> "$included" ;;
    excluded) printf '%s\n' "$path" >> "$excluded" ;;
  esac
done < "$registry"

if [ -n "$key" ]; then
  echo "$registry: $key = [ is never closed by ]" >&2
  exit 1
fi

# --- Discovery -------------------------------------------------------------
#
# A consuming project is a git repository whose root holds waytide/system/ —
# the discriminator refresh-packages.sh already applies, reused rather than
# defined a second time. This repository is excluded by it without a special
# case: the authoring source holds system/foundation with no wrapper.
#
# Each included path is walked, and the path itself is tested before anything
# beneath it, so a path that IS a consuming project is found at depth zero and a
# path that CONTAINS them is walked. Nothing distinguishes the two kinds of
# entry, because nothing has to.
#
# A found project is not descended into: a consuming project does not hold
# another one, and pruning keeps the walk off its history and its dependencies.

while IFS= read -r root; do
  if [ ! -d "$root" ]; then
    echo "Not a directory, skipped: $root" >&2
    continue
  fi

  find "$root" -type d -path '*/waytide/system' -prune -print 2>/dev/null |
    while IFS= read -r match; do
      project=${match%/waytide/system}

      # .git is a directory in an ordinary clone and a file in a worktree.
      if [ -e "$project/.git" ]; then
        printf '%s\n' "$project" >> "$found"
      fi
    done
done < "$included"

# --- The actionable set ----------------------------------------------------
#
# An excluded path removes the project at it and every project beneath it, so
# excluding a directory excludes what it contains rather than only itself.

actionable=0

if [ -s "$found" ]; then
  sort -u "$found" | while IFS= read -r project; do
    skip=""

    if [ -s "$excluded" ]; then
      while IFS= read -r exclusion; do
        if [ "$project" = "$exclusion" ] || [ "${project#"$exclusion"/}" != "$project" ]; then
          skip=yes
          break
        fi
      done < "$excluded"
    fi

    if [ -z "$skip" ]; then
      printf '%s\n' "$project"
    fi
  done > "$found.actionable"

  actionable=$(wc -l < "$found.actionable" | tr -d '[:space:]')
  cat "$found.actionable"
  rm -f "$found.actionable"
fi

# Nothing found and everything excluded are different states with different
# remedies, so they are not reported with one message: the first sends the
# engineer to the included paths, the second to the exclusions.
if [ "$actionable" -eq 0 ]; then
  if [ -s "$found" ]; then
    echo "Every consuming project found is excluded by $registry" >&2
  else
    echo "No consuming projects found under the included paths in $registry" >&2
  fi
fi
