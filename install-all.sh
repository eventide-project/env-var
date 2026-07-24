#!/bin/sh
# Install (or refresh) every Waytide package into a consuming project, then
# activate the framework by placing the project-root AGENTS.md, a CLAUDE.md that
# imports it (Claude Code reads CLAUDE.md, not AGENTS.md), and a .claude/settings.json
# whose SessionStart hook and status line print the load notice.
# Run from the root of the consuming project.
set -e

add() {
  prefix="waytide/framework/$1"
  repo="https://github.com/waytide/$2.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation          foundation
add language            language
add testing             testing
add code/ruby           code-ruby
add git                 git
add plan                plan
add design-by-efferent  design-by-efferent

# Activate the framework: place the project-root AGENTS.md. Foundation is
# installed above, so run its AGENTS.md-only mode (it won't re-add itself).
# The bootstrap logic lives only in waytide/framework/foundation/install.sh — not duplicated here.
sh waytide/framework/foundation/install.sh agents-md
