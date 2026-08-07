#!/bin/sh
# Install (or refresh) the agent-norms packages this package depends on.
# Run from the root of the consuming project. This script lives inside the package whose
# dependencies it installs, so it is invoked by its path from that root.
#
# Usage:
#
#   waytide/system/code/ruby/install-dependencies.sh
#
set -e

add() {
  prefix="waytide/system/$1"
  repo="https://github.com/eventide-project/agent-norms-$1.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation
add language
