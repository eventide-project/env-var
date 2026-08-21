#!/bin/sh
# Install (or refresh) the agent-norms packages this package depends on.
# Run from the root of the consuming project. This script lives inside the package whose
# dependencies it installs, so it is invoked by its path from that root.
#
# Usage:
#
#   waytide/system/language/install-dependencies.sh
#
set -e

# The origin the packages are fetched from. Override it to install over HTTPS where no
# SSH key is registered:
#
#   WAYTIDE_ORIGIN=https://github.com/waytide <this script>
#
origin=${WAYTIDE_ORIGIN:-git@github.com:waytide}

add() {
  prefix="waytide/system/$1"
  repo="$origin/$1.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation
