#!/bin/sh
# Build Slasher's marketplace listing, .claude-plugin/marketplace.json, naming each plugin given,
# each at plugins/<plugin>/.
#
#   system/foundation/build-marketplace-listing.sh <plugin> ...
#
# Run from the repository root. A plugin's description is read from its manifest, at
# system/<package>/marketplace/<plugin>/plugin.json, the file build-marketplace-plugin.sh copies.
set -e

[ $# -gt 0 ] || { echo "Usage: system/foundation/build-marketplace-listing.sh <plugin> ..." >&2; exit 1; }

manifest_of() {
  for candidate in system/*/marketplace/"$1"/plugin.json; do
    [ -f "$candidate" ] && { echo "$candidate"; return; }
  done
}

for plugin_name in "$@"; do
  [ -n "$(manifest_of "$plugin_name")" ] || { echo "No marketplace plugin named $plugin_name" >&2; exit 1; }
done

mkdir -p .claude-plugin

{
  cat <<'HEAD'
{
  "name": "slasher",
  "owner": {
    "name": "slasher-bot"
  },
  "plugins": [
HEAD
  separator=""
  for plugin_name in "$@"; do
    description=$(sed -n 's/^  "description": "\(.*\)",\{0,1\}$/\1/p' "$(manifest_of "$plugin_name")")
    printf '%s' "$separator"
    cat <<ENTRY
    {
      "name": "$plugin_name",
      "source": "./plugins/$plugin_name",
      "description": "$description"
ENTRY
    printf '    }'
    separator=",
"
  done
  echo
  cat <<'TAIL'
  ]
}
TAIL
} > .claude-plugin/marketplace.json

echo "Built .claude-plugin/marketplace.json"
