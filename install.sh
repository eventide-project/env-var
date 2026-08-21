#!/bin/sh
# Install (or refresh) Waytide for a Ruby project: every Waytide package, including the
# Ruby package this repository holds. Fetch it into the root of the consuming project and
# run it from there:
#
#   curl -O https://raw.githubusercontent.com/waytide/waytide-ruby/master/install.sh
#   sh install.sh
#
# `sh install.sh`, not `./install.sh`. The file is committed executable, but curl transfers
# content and not file metadata, so the copy it writes is never executable whatever mode
# the original carries.
#
# The name is a package's rather than the composite's. install-all.sh is what the composite
# calls the script that installs everything from its root. A package's installer is
# install.sh, as system/foundation/install.sh is. This repository follows the package
# conventions while sitting outside the composite: it holds no rules, nothing splits into
# it, and it is authored here rather than upstream.
set -e

# The origin the packages are fetched from. Override it to work over HTTPS where no SSH
# key is registered:
#
#   WAYTIDE_ORIGIN=https://github.com/waytide sh install.sh
#
origin=${WAYTIDE_ORIGIN:-git@github.com:waytide}

# The base set is not restated here. It is installed by the composite's own installer,
# fetched and run, so the packages a project gets are asserted in one place and this script
# cannot drift from that list. What this script adds is the one package the base set does
# not carry.
base_url=https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh

# The base installer is fetched to a temporary directory rather than into the project root.
# Nothing collides — this script is install.sh and that one is install-all.sh — so the
# reason is cleanup. A trap removes the directory however the script exits, where a fetch
# into the project root would leave the file behind on any failure between fetching it and
# removing it.
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

curl -sSfL -o "$tmp/install-all.sh" "$base_url"

# Run it from the project root. The base installer resolves every path from the working
# directory rather than from its own location, so where the file sits does not matter. It
# offers to create a repository where there is none, installs the base packages, and places
# the project-root AGENTS.md, the CLAUDE.md that imports it, and .claude/settings.json.
#
# WAYTIDE_ORIGIN is an environment variable, so it reaches the base installer unchanged.
sh "$tmp/install-all.sh"

# Then the Ruby package, which the base set does not carry. The repository name is the
# installed path with its slash flattened to a dash, which is the convention every grouped
# package follows, so refresh-packages.sh derives this repository from the directory
# without being told.
prefix="waytide/system/tools/ruby-lang"
repo="$origin/waytide-ruby.git"

if [ ! -d "$prefix" ]; then
  git subtree add --prefix "$prefix" "$repo" master --squash
fi

git subtree pull --prefix "$prefix" "$repo" master --squash

# AGENTS.md is already placed by the base installer, and adding a package after it is
# placed changes nothing there. The bootstrap does not enumerate the packages, and
# session-start.sh reads the directories that are actually present each session.
