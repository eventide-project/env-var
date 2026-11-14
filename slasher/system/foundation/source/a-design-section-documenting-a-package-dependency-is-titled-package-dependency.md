# A design section documenting a package dependency is titled "Package Dependency"

**Trigger:** When writing a section of a [design] item that documents a dependency on a package

A design — an item tagged `[design]` — may have a section that documents a dependency on a package, meaning a gem, a library, or another installable package. Title that section **Package Dependency**, not just "Dependency".

**Why:** "Dependency" is overloaded — it can mean a code-level dependency, a runtime relationship, an injected collaborator, and more. "Package Dependency" names exactly what the section is about: a dependency on a package. The user corrected a bare "Dependency" heading to "Package Dependency" directly.

**How to apply:** When writing a section of a design about depending on a gem/library/package, use the heading "Package Dependency". Reserve plain "Dependency" for cases that are genuinely about something other than a package.

## Compressed

1. A design is an item tagged `[design]`.
2. A design may have a section documenting a dependency on a package.
3. A package means a gem, a library, or another installable package.
4. Title that section **Package Dependency**.
5. Do not title it just "Dependency".
6. Use plain "Dependency" only for sections about something other than a package.

## Compression

- 2026-10-24, compressed: compression 0.29, change 0.58, solubility 80 → 99, clarity 0.63 → 1.00, 4 directives, 4 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 99 → 99, clarity 1.00 → 1.00; checked: 2 directives, 2 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named package-dependency-heading.

---

Authored by Scott Bellware on Fri Jun 12 2026 at 10 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:50:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:37 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
