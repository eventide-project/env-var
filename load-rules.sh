#!/bin/sh
# Print every file the session-start read covers, each under a line naming it, in one output.
#
# Run from the project root:
#
#   slasher/system/foundation/load-rules.sh     in a consuming project
#   system/foundation/load-rules.sh             in the Slasher authoring source
#   system/foundation/load-rules.sh <rule-name> one rule, on-demand when its trigger comes up, or
#                                               pre-loaded when a skill hands its act to the rule
#
# The order is fixed: foundation's pre-loaded rules, the triggers of its on-demand rules, and its
# vocabulary; then each other package's, in name order; then the project's local rules, in name
# order; then its vocabulary; then its journal entries, oldest first across every writer. A file
# that does not exist is passed over.
set -e

# Locate the system and the project's own directory: slasher/ in a consuming project, the root
# in the Slasher authoring source. Checked in that order — a consuming project may have a
# system/ directory of its own.
if [ -d slasher/system ]; then
  system=slasher/system
  local=slasher/local
else
  system=system
  local=local
fi

# Given a rule's name, print that rule's entry alone: its title, source, any trigger, and its
# compressed text. The on-demand rules are searched, then the pre-loaded ones. A line inside a
# fenced code block never starts a rule, though a comment in a code example may begin with #.
if [ -n "$1" ] && [ "$1" != "--package" ]; then
  # Only the files that exist. A pattern that matches nothing reaches awk as a name it cannot
  # open, and awk stops there, before the files after it.
  rule_files=
  for file in "$system"/*/rules-on-demand.md "$system"/*/rules-pre-loaded.md; do
    [ -f "$file" ] && rule_files="$rule_files $file"
  done
  [ -n "$rule_files" ] || { echo "No rule named $1" >&2; exit 1; }
  awk -v name="$1" '
    function flush() {
      if (found) { while (n > 0 && entry[n] == "") n--; for (i = 1; i <= n; i++) print entry[i]; done = 1 }
      n = 0; found = 0
    }
    FNR == 1 { fenced = 0 }
    FNR == 1 || (!fenced && /^# /) { flush() }
    /^```/ { fenced = !fenced }
    { entry[++n] = $0 }
    /^Source: / { k = split($2, parts, "/"); if (parts[k] == name ".md") found = 1 }
    END { flush(); if (!done) exit 1 }
  ' $rule_files 2>/dev/null || { echo "No rule named $1" >&2; exit 1; }
  exit 0
fi

first=1

print_file() {
  [ -f "$1" ] || return 0
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== FILE: $1 ====="
  echo
  cat "$1"
}

# A vocabulary or a local rule with a Compressed section is printed as its title and that section:
# its full text, History, Related list, and footer are left out. Without one, it is printed whole.
print_compressed() {
  [ -f "$1" ] || return 0
  grep -qx '## Compressed' "$1" || { print_file "$1"; return 0; }
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== FILE: $1 ====="
  echo
  awk '
    NR == 1 { print; print ""; next }
    $0 == "## Compressed" { inside = 1; next }
    inside && ($0 ~ /^## (Compression|History)$/ || $0 ~ /^Related:/ || $0 == "---") { exit }
    inside { line[++n] = $0 }
    END {
      first = 1; while (first <= n && line[first] == "") first++
      while (n >= first && line[n] == "") n--
      for (i = first; i <= n; i++) print line[i]
    }
  ' "$1"
}

# A package's on-demand rules are not printed. Each one's trigger is, with the command that loads
# it: the rule's name is its source file's name.
print_index() {
  [ -f "$1" ] || return 0
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== ON DEMAND: $1 ====="
  echo
  awk -v loader="$system/foundation/load-rules.sh" '
    /^Source: / { n = split($2, parts, "/"); name = parts[n]; sub(/\.md$/, "", name) }
    /^Trigger: / { trigger = substr($0, 10); print "- " trigger ", run: " loader " " name }
  ' "$1"
}

# Given --package and a package's name, print that package alone, as the full read prints it when
# it is active: its pre-loaded rules, its on-demand triggers, and its vocabulary.
if [ "$1" = "--package" ]; then
  [ -n "$2" ] && [ -d "$system/$2" ] || { echo "No package named $2" >&2; exit 1; }
  print_file "$system/$2/rules-pre-loaded.md"
  print_index "$system/$2/rules-on-demand.md"
  print_compressed "$system/$2/vocabulary.md"
  exit 0
fi

# The packages the project's latest package set makes active, one name per line. The Packages line
# is authoritative: every installed package it does not name is deactivated, including one
# installed after the set was declared, which the Inactive line cannot name. A declaration without
# both a Package set line and a Packages line is not a declaration, and a project with none has
# every package active.
declaration=$(ls "$local"/*-package-set.md 2>/dev/null | sort | tail -1)
declared_active=
if [ -n "$declaration" ]; then
  attribute() {
    sed -n "s|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*$1:\*\*[[:space:]]*\(.*\)$|\1|p" "$declaration" | head -1
  }
  if [ -n "$(attribute 'Package set')" ]; then
    declared_active=$(attribute 'Packages' | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | grep -v '^$' || true)
  fi
fi

is_deactivated() {
  [ -n "$declared_active" ] && ! printf '%s\n' "$declared_active" | grep -qx "$1"
}

# A deactivated package's rules are not printed. Its name is, with the command that loads it.
print_deactivated() {
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== DEACTIVATED: $1 ====="
  echo
  echo "- Its rules are not printed. If the engineer reactivates it, run: $system/foundation/load-rules.sh --package ${1##*/}"
}

for package in "$system/foundation" $(ls -d "$system"/*/ | sed 's|/$||' | grep -v "^$system/foundation$" | sort); do
  if is_deactivated "${package##*/}"; then
    print_deactivated "$package"
    continue
  fi
  print_file "$package/rules-pre-loaded.md"
  print_index "$package/rules-on-demand.md"
  print_compressed "$package/vocabulary.md"
done

for rule in $(ls "$local"/rules/*.md 2>/dev/null | sort); do
  print_compressed "$rule"
done

print_compressed "$local/vocabulary.md"

# Oldest first across writers: sorted by the entry's file name, which leads with its datetime.
for entry in $(ls "$local"/journal/*/*.md 2>/dev/null | awk -F/ '{ print $NF "\t" $0 }' | sort | cut -f2); do
  print_file "$entry"
done
