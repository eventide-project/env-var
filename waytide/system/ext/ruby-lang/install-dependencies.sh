#!/bin/sh
# Install (or refresh) the Waytide packages this package depends on.
# Run from the root of the consuming project. This script lives inside the package whose
# dependencies it installs, so it is invoked by its path from that root.
#
# Usage:
#
#   waytide/system/tools/ruby-lang/install-dependencies.sh
#
# This package's dependency is every other Waytide package, which is what makes installing
# it enough for a Ruby project. Every other package names one to three of them.
#
# So the list is not written here. Every other install-dependencies.sh names its packages
# because it names a few; naming all of them would put the package set in a second place,
# and two copies of a list drift. The composite's own installer is fetched and run instead,
# so the set a project gets is asserted once, upstream, and this script cannot disagree
# with it.
set -e

# The origin the packages are fetched from. Override it to install over HTTPS where no
# SSH key is registered:
#
#   WAYTIDE_ORIGIN=https://github.com/waytide <this script>
#
# It is an environment variable, so it reaches the composite's installer unchanged.
: "${WAYTIDE_ORIGIN:=}"
export WAYTIDE_ORIGIN

base_url=https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh

# Fetched to a temporary directory, and removed however this script exits.
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

curl -sSfL -o "$tmp/install-all.sh" "$base_url"

# The composite's installer resolves every path from the working directory rather than from
# its own location, so running it from the project root is what matters and where the file
# sits does not. It installs the base packages and places the project-root AGENTS.md, the
# CLAUDE.md that imports it, and .claude/settings.json.
#
# It does not install this package. This script is run from inside it, so it is already here.
sh "$tmp/install-all.sh"
