# A design section documenting a package dependency is titled "Package Dependency"

A design — an item tagged `[design]` — may have a section that documents a dependency on a package, meaning a gem, a library, or another installable package. Title that section **Package Dependency**, not just "Dependency".

**Why:** "Dependency" is overloaded — it can mean a code-level dependency, a runtime relationship, an injected collaborator, and more. "Package Dependency" names exactly what the section is about: a dependency on a package. The user corrected a bare "Dependency" heading to "Package Dependency" directly.

**How to apply:** When writing a section of a design about depending on a gem/library/package, use the heading "Package Dependency". Reserve plain "Dependency" for cases that are genuinely about something other than a package.
