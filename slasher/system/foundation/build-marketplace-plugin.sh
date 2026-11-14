#!/bin/sh
# Build one of Slasher's marketplace plugins, in plugins/<plugin>/.
#
#   system/foundation/build-marketplace-plugin.sh <plugin>
#
# Run from the repository root. A package defines a marketplace plugin by holding its manifest
# at marketplace/<plugin>/plugin.json, as foundation holds marketplace/slasher-install/plugin.json. The
# plugin is that manifest, the repository's installer, slasher-install, and the package's install
# skill, where it has one. It carries the installer so /install runs the installer of the plugin's
# own version rather than downloading one. It carries no other command and no hooks: a project
# gets them from the Slasher that /install puts there, and a second copy here would show each
# command twice and run each hook twice.
set -e

plugin_name="$1"
plugin="plugins/$plugin_name"

[ -n "$plugin_name" ] || { echo "Usage: system/foundation/build-marketplace-plugin.sh <plugin>" >&2; exit 1; }

manifest=""
for candidate in system/*/marketplace/"$plugin_name"/plugin.json; do
  [ -f "$candidate" ] && { manifest="$candidate"; break; }
done
[ -n "$manifest" ] || { echo "No marketplace plugin named $plugin_name" >&2; exit 1; }
source=${manifest%/marketplace/*}

rm -rf "$plugin"
mkdir -p "$plugin/.claude-plugin"

cp "$manifest" "$plugin/.claude-plugin/plugin.json"

cp -p slasher-install "$plugin/slasher-install"

if [ -d "$source/skills/install" ]; then
  mkdir -p "$plugin/skills"
  cp -R "$source/skills/install" "$plugin/skills/install"
fi

echo "Built $plugin/"
