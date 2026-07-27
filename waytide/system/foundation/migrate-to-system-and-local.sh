#!/bin/sh
# Migrate an installed Waytide from the old layout to the current one.
#
#   before                        after
#   waytide/framework/<package>   waytide/system/<package>
#   waytide/rules/                waytide/local/rules/
#   waytide/log/ deferred/ …      waytide/local/log/ deferred/ …
#
# Run from the root of the consuming project.
#
# The packages are removed and re-added rather than pulled. When the split path
# changed from framework/<package> to system/<package>, every component repository's
# history was replaced, so an existing subtree in a consuming project shares no commits
# with the current remote and `git subtree pull` has nothing to merge from.
#
# This is a one-time migration. Once a project has run it, it does nothing.
#
# Usage:
#   sh migrate-to-system-and-local.sh          show what would happen, then ask
#   sh migrate-to-system-and-local.sh --yes    do it without asking

set -e

answer_given=no
if [ "$1" = "--yes" ]; then
  answer_given=yes
fi

# --- Preconditions ---------------------------------------------------------

if [ ! -d .git ]; then
  echo "Run this from the root of the consuming project (no .git here)." >&2
  exit 1
fi

if [ ! -d waytide/framework ]; then
  if [ -d waytide/system ]; then
    echo "Already migrated — waytide/system/ is present and waytide/framework/ is gone."
    exit 0
  fi
  echo "Nothing to migrate — waytide/framework/ is not present." >&2
  exit 1
fi

# Tracked changes only. Untracked files are not at risk from a move or a subtree add,
# and this script is often downloaded into the project root to be run — which would
# otherwise trip its own precondition.
if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
  echo "The working tree has uncommitted changes to tracked files." >&2
  echo "This migration moves directories and makes commits; commit or stash first." >&2
  exit 1
fi

# --- What is installed -----------------------------------------------------

# A package is a directory carrying a README.md — the same test the load notice uses.
# Depth 2 finds a top-level package, depth 3 a grouped one such as code/ruby.
packages=$(
  cd waytide/framework &&
    find . -mindepth 2 -maxdepth 3 -name README.md |
      sed 's|^\./||; s|/README\.md$||' |
      sort
)

if [ -z "$packages" ]; then
  echo "No packages found under waytide/framework/ — nothing to re-add." >&2
  exit 1
fi

# The project's own directories, whichever of them exist.
own=
for directory in rules log deferred observations design plans experiments features sessions loops; do
  if [ -d "waytide/$directory" ]; then
    own="${own}${own:+ }$directory"
  fi
done

# --- Report, then confirm --------------------------------------------------

echo "Packages to re-add under waytide/system/:"
for package in $packages; do
  echo "  $package"
done

echo
if [ -n "$own" ]; then
  echo "Directories to move under waytide/local/:"
  for directory in $own; do
    echo "  $directory"
  done
else
  echo "No project-owned directories to move."
fi

cat <<'WARNING'

Anything edited inside waytide/framework/ is discarded — the packages are removed
and re-added from their component repositories. If this project edited an installed
rule in place, capture that change before continuing; it belongs upstream.
WARNING

if [ "$answer_given" != "yes" ]; then
  printf '\nProceed? [y/N] '
  read -r reply
  case "$reply" in
    y|Y|yes|YES) ;;
    *) echo "Stopped. Nothing changed."; exit 0 ;;
  esac
fi

# --- Move the project's own work -------------------------------------------

if [ -n "$own" ]; then
  mkdir -p waytide/local
  for directory in $own; do
    # A directory holding no tracked files is unknown to git — it exists because the
    # convention creates it, not because anything was parked there. `git mv` refuses
    # such a directory, so move it on disk instead.
    if [ -n "$(git ls-files "waytide/$directory")" ]; then
      git mv "waytide/$directory" "waytide/local/$directory"
    else
      mv "waytide/$directory" "waytide/local/$directory"
    fi
  done
  # Nothing is staged if every moved directory was empty of tracked files.
  if [ -n "$(git diff --cached --name-only)" ]; then
    git commit --quiet -m "The project's own Waytide work moves under waytide/local/"
  fi
  echo "Moved: $own"
fi

# --- Replace the packages --------------------------------------------------

if [ -n "$(git ls-files waytide/framework)" ]; then
  git rm -r --quiet waytide/framework
  git commit --quiet -m "The installed packages are removed ahead of re-adding at waytide/system/"
else
  rm -rf waytide/framework
fi

for package in $packages; do
  # code/ruby is nested here and publishes to the flat repository name code-ruby.
  repository=$(printf '%s' "$package" | tr '/' '-')
  url="https://github.com/waytide/$repository.git"

  echo "Adding $package from $url"
  git subtree add --prefix "waytide/system/$package" "$url" master --squash --quiet
done

# --- The harness configuration ---------------------------------------------

settings=.claude/settings.json
if [ -f "$settings" ] && grep -q 'waytide/framework/' "$settings"; then
  # sed -i differs between GNU and BSD, so write through a temporary file.
  sed 's|waytide/framework/|waytide/system/|g' "$settings" > "$settings.migrating"
  mv "$settings.migrating" "$settings"
  git add "$settings"
  git commit --quiet -m "The harness configuration points at waytide/system/"
  echo "Updated: $settings"
fi

# --- The bootstrap, which this script will not rewrite ----------------------

if [ -f AGENTS.md ] && grep -q 'waytide/framework/\|waytide/rules/' AGENTS.md; then
  cat <<'REMAINS'

One thing remains, and this script will not do it for you.

  AGENTS.md still names waytide/framework/ and waytide/rules/. It is your file and
  may hold content of your own, so it is never edited silently. Delete its Waytide
  section and run:

      sh waytide/system/foundation/install.sh agents-md

  which regenerates the section, asking before it writes.
REMAINS
fi

cat <<'DONE'

Migrated. Start a session and confirm the notice reads:

    Waytide loaded from waytide/system/ — N packages: …
DONE
