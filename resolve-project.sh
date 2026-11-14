#!/bin/sh
# Usage:
#
#   slasher/system/foundation/resolve-project.sh -base
#   slasher/system/foundation/resolve-project.sh -system
#   slasher/system/foundation/resolve-project.sh <name>
#
# Run from the root of a Slasher project.
#
# -base prints the root of the project's base project: the directory
# beside it that slasher.toml, in their shared parent directory, names.
#
# -system prints the root of the machine's system project: the path that
# ~/.config/slasher/system-project.toml records. SLASHER_SYSTEM_PROJECT
# names another file in its place, so a test can use its own.
#
# <name> prints the root of the project in the machine's registry whose
# directory has that name, as read-consuming-projects.sh lists them. Where no
# registered project has that name, or more than one has, it prints nothing
# and exits non-zero.

set -e

case $1 in
  -base)
    parent=$(dirname "$PWD")

    name=$(
      sed -n 's/^[[:space:]]*base-project[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
        "$parent/slasher.toml"
    )

    printf '%s\n' "$parent/$name"
    ;;
  -system)
    config=${SLASHER_SYSTEM_PROJECT:-$HOME/.config/slasher/system-project.toml}

    sed -n 's/^[[:space:]]*path[[:space:]]*=[[:space:]]*"\([^"]*\)"[[:space:]]*$/\1/p' \
      "$config"
    ;;
  *)
    name=$1

    resolved=$(
      "$(dirname "$0")/read-consuming-projects.sh" |
        while IFS= read -r registered; do
          if [ "$(basename "$registered")" = "$name" ]; then
            printf '%s\n' "$registered"
          fi
        done
    )

    if [ -z "$resolved" ]; then
      echo "No project named $name is in the registry" >&2
      exit 1
    fi

    if [ "$(printf '%s\n' "$resolved" | wc -l)" -gt 1 ]; then
      echo "More than one project named $name is in the registry:" >&2
      printf '%s\n' "$resolved" | sed 's/^/  /' >&2
      exit 1
    fi

    printf '%s\n' "$resolved"
    ;;
esac
