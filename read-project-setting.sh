#!/bin/sh
# Usage:
#
#   slasher/system/foundation/read-project-setting.sh <key>
#
# Run from the root of a Slasher project.
#
# Prints the value of <key> in the current project's own entry in the
# machine's project registry, ~/.config/slasher/projects.toml.
# SLASHER_REGISTRY names another file in its place, so a test can use its own.
#
# A project's own entry is a [[project]] table whose path is the project's
# root:
#
#   [[project]]
#   path = "~/src/checkout"
#   journal = "private"
#
# A value is a quoted string alone on its line. A leading ~ in a path is this
# machine's home directory. Whether the registry is in the form list-projects.sh
# accepts is that script's concern, not this one's.
#
# Where the project has no entry, the entry has no such key, or no registry
# exists, it prints nothing and succeeds. A machine without the setting is the
# ordinary case, not an error.

set -e

key=$1

registry=${SLASHER_REGISTRY:-$HOME/.config/slasher/projects.toml}

if [ ! -f "$registry" ]; then
  exit 0
fi

awk -v key="$key" -v root="$PWD" -v home="$HOME" '
  function trim(text) {
    sub(/^[[:space:]]+/, "", text)
    sub(/[[:space:]]+$/, "", text)
    return text
  }

  function conclude() {
    if (in_project && path == root && (key in values)) {
      print values[key]
      found = 1
      exit
    }
  }

  {
    line = trim($0)
  }

  line == "" || line ~ /^#/ {
    next
  }

  line == "[[project]]" {
    conclude()
    in_project = 1
    path = ""
    delete values
    next
  }

  line ~ /^\[/ || line ~ /=[[:space:]]*\[$/ {
    conclude()
    in_project = 0
    next
  }

  in_project && match(line, /^[A-Za-z0-9_-]+[[:space:]]*=[[:space:]]*"[^"]*"$/) {
    name = trim(substr(line, 1, index(line, "=") - 1))
    value = trim(substr(line, index(line, "=") + 1))
    value = substr(value, 2, length(value) - 2)

    if (name == "path") {
      if (value == "~") {
        value = home
      } else if (substr(value, 1, 2) == "~/") {
        value = home substr(value, 2)
      }

      while (value != "/" && substr(value, length(value)) == "/") {
        value = substr(value, 1, length(value) - 1)
      }

      path = value
    } else {
      values[name] = value
    }
  }

  END {
    if (!found) {
      conclude()
    }
  }
' "$registry"
