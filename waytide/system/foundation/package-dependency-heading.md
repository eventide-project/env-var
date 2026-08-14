# A design section documenting a package dependency is titled "Package Dependency"

A design doc may have a section that documents a dependency on a package, meaning a gem, a library, or another installable package. Title that section **Package Dependency**, not just "Dependency".

**Why:** "Dependency" is overloaded — it can mean a code-level dependency, a runtime relationship, an injected collaborator, and more. "Package Dependency" names exactly what the section is about: a dependency on a package. The user corrected a bare "Dependency" heading to "Package Dependency" directly.

**How to apply:** When authoring a design doc section about depending on a gem/library/package, use the heading "Package Dependency". Reserve plain "Dependency" for cases that are genuinely about something other than a package.

---

Authored by Scott Bellware on Fri Jun 12 2026 at 10 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
