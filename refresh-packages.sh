#!/bin/sh
# Refresh the installed Waytide packages from their component repositories.
#
# Run from the root of the consuming project.
#
# Usage:
#   waytide/system/foundation/refresh-packages.sh               refresh every installed package
#   waytide/system/foundation/refresh-packages.sh testing git   refresh only those named
#
# What a refresh changes is binding rules — files read at the start of every session,
# which govern how the agent works. So every package that moves is reported by name,
# with the rule files that changed in it. A refresh that altered them silently would be
# a change of behavior nobody saw.

set -e

# Where the component repositories live. Overridable so a fork or a mirror can be
# refreshed from, and so this script can be exercised against a local repository
# without reaching the network.
origin=${WAYTIDE_ORIGIN:-https://github.com/waytide}

# --- Preconditions ---------------------------------------------------------

if [ ! -d .git ]; then
  echo "Run this from the root of the consuming project (no .git here)." >&2
  exit 1
fi

if [ -d system/foundation ] && [ ! -d waytide/system ]; then
  echo "This is the Waytide authoring source, where the packages are written rather" >&2
  echo "than installed. There is nothing upstream of it to refresh." >&2
  exit 1
fi

if [ ! -d waytide/system ]; then
  echo "No packages installed — waytide/system/ is not present." >&2
  exit 1
fi

# A subtree pull merges and commits, so it needs a clean tree. Untracked files are not
# at risk and are allowed, as they are by the installer.
if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
  echo "The working tree has uncommitted changes to tracked files." >&2
  echo "A refresh merges and commits; commit or stash first." >&2
  exit 1
fi

# --- What is installed -----------------------------------------------------

# A package is a directory carrying a README.md — the same test the session-start
# notice uses.
# Depth 2 finds a top-level package, depth 3 a grouped one such as code/ruby.
installed=$(
  cd waytide/system &&
    find . -mindepth 2 -maxdepth 3 -name README.md |
      sed 's|^\./||; s|/README\.md$||' |
      sort
)

if [ -z "$installed" ]; then
  echo "No packages found under waytide/system/." >&2
  exit 1
fi

# Named packages, or all of them.
if [ "$#" -gt 0 ]; then
  packages=
  for wanted in "$@"; do
    found=no
    for package in $installed; do
      if [ "$package" = "$wanted" ]; then
        found=yes
        break
      fi
    done
    if [ "$found" = "no" ]; then
      echo "Not installed: $wanted" >&2
      echo "Installed: $(printf '%s ' $installed)" >&2
      exit 1
    fi
    packages="${packages}${packages:+ }$wanted"
  done
else
  packages=$installed
fi

# --- Refresh ---------------------------------------------------------------

moved=
unchanged=
failed=

for package in $packages; do
  # code/ruby is nested here and publishes to the flat repository name code-ruby.
  repository=$(printf '%s' "$package" | tr '/' '-')
  url="$origin/$repository.git"
  prefix="waytide/system/$package"

  before=$(git rev-parse HEAD)

  # Keep the pull's own words. A pull fails for more than one reason — the project
  # edited the package in place, or an untracked file sits where an incoming one goes —
  # and guessing which would send the reader after the wrong fix.
  complaint=$(mktemp)

  if ! git subtree pull --prefix "$prefix" "$url" master --squash --quiet >"$complaint" 2>&1; then
    # Leave no half-merged tree behind, and keep going — one package should not
    # block the rest.
    if [ -f .git/MERGE_HEAD ]; then
      git merge --abort 2>/dev/null || true
    fi
    failed="${failed}${failed:+ }$package"
    echo "$package — could not refresh:"
    sed 's|^|  |' "$complaint" | grep -v '^  $' | head -12
    rm -f "$complaint"
    continue
  fi

  rm -f "$complaint"

  after=$(git rev-parse HEAD)

  if [ "$before" = "$after" ]; then
    unchanged="${unchanged}${unchanged:+ }$package"
  else
    moved="${moved}${moved:+ }$package"
    echo "$package — updated:"
    git diff --name-only "$before" "$after" -- "$prefix" |
      sed "s|^$prefix/|  |"
  fi
done

# --- Report ----------------------------------------------------------------

echo
if [ -n "$moved" ]; then
  echo "Updated:   $moved"
else
  echo "Updated:   none"
fi
[ -n "$unchanged" ] && echo "Unchanged: $unchanged"

if [ -n "$failed" ]; then
  cat <<REPORT

Could not refresh: $failed

Each one's own complaint is above. The usual causes are an installed package edited
in place — those edits belong upstream, and the refresh succeeds once they are there —
or an untracked file sitting where an incoming one goes. Nothing was left half-merged.
REPORT
fi

if [ -n "$moved" ]; then
  cat <<'BINDING'

The files listed above are binding rules, read at the start of every session. Read
what changed before the next one, since the agent's conventions have moved.
BINDING
fi

# The bootstrap is not a package, so no subtree pull touches it, and it can fall behind
# the packages it activates. Saying so is all this script does about it.
cat <<'BOOTSTRAP'

Not refreshed by this script, because neither is a package: the root AGENTS.md and
.claude/settings.json. If foundation's bootstrap has changed, delete AGENTS.md's Waytide
section and run `waytide/system/foundation/install.sh agents-md` to regenerate it.
BOOTSTRAP

[ -z "$failed" ]
