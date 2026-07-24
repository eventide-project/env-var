#!/bin/sh
# Print the Waytide load notice at session start.
#
# Run by the harness as a SessionStart hook, not by the agent — see the
# announce-waytide-at-session-start rule. It reads the package directories
# actually present and emits the notice as JSON on stdout, which the harness
# renders as its own message.
#
# The notice never disrupts a session: any problem exits quietly with no output.

# Never let a notice break a session start.
set +e

# A non-empty WAYTIDE_QUIET silences the notice. The opt-out lives in the
# developer's own environment, never in committed project content.
if [ -n "$WAYTIDE_QUIET" ]; then
  exit 0
fi

# Locate the framework: waytide/framework/ in a consuming project, framework/
# in the Waytide authoring source. Checked in that order — a consuming project
# may have a framework/ directory of its own.
if [ -d waytide/framework ]; then
  framework=waytide/framework
elif [ -d framework ] && [ -d framework/foundation ]; then
  framework=framework
else
  exit 0
fi

# A package is a directory carrying a README.md. That distinguishes a package
# from a grouping directory: framework/code/ has no README and is not a package,
# framework/code/ruby/ has one and is. Depth 2 finds a top-level package's
# README, depth 3 a grouped one's.
packages=$(
  cd "$framework" 2>/dev/null || exit 0
  find . -mindepth 2 -maxdepth 3 -name README.md 2>/dev/null |
    sed 's|^\./||; s|/README\.md$||' |
    sort
)

if [ -z "$packages" ]; then
  exit 0
fi

count=$(printf '%s\n' "$packages" | wc -l | tr -d ' ')
list=$(printf '%s\n' "$packages" | tr '\n' ',' | sed 's|,$||; s|,|, |g')

# Installing foundation alone is the ordinary first install, so the single-package
# notice is what a developer sees before any other package is added.
noun=packages
if [ "$count" = "1" ]; then
  noun=package
fi

printf '{"systemMessage": "Waytide loaded from %s/ — %s %s: %s"}\n' \
  "$framework" "$count" "$noun" "$list"
