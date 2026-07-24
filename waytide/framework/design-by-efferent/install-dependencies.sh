#!/bin/sh
# Install (or refresh) the agent-norms packages this package depends on.
# Run from the root of the consuming project.
set -e

add() {
  prefix="waytide/framework/$1"
  repo="https://github.com/waytide/$1.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation
add language
add testing
