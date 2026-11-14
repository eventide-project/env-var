# "Lib report" classifies the library source by category

When the user asks for a **lib report**, classify the library source (`lib/`) along the lenses below — a category analysis paralleling the test report. **Re-derive everything from the current files** — read the source and recompute membership. Do not report stale buckets from memory. The lenses are the frame. The specific buckets are whatever the current source yields. Do not write the rendered report to a file — it is printed output only.

Produce these sections, in order:

1. **By role / layer** — package wiring (pure `require` files), the domain object(s), operations, infrastructure, and test support. Name which files fall in each.

2. **By Ruby construct**:
   - stateful **classes**
   - **module-function namespaces** that carry behavior through `self.` methods
   - **mixin modules**, and any `included`/`extended` hooks

3. **By method style**:
   - instance methods
   - class/module functions (`self.`)
   - macro/hook methods
   - any **dual class+instance delegation pairs** — a class method and an instance method of the same name, the instance delegating to the class

4. **By the kinds of value received and returned** — group the methods by them. Those are raw platform objects, the library's own domain objects, Strings, and boolean predicates. This is the surface where a migration from one kind to another shows.

5. **Error taxonomy** — the applicative error classes and which operations raise which.

6. **Idioms / conventions visible** — the recurring patterns in the source (mixins, aliasing/shadowing idioms, control-flow preferences, and the like).

Keep each section tight.

**Why:** the library has a discoverable structure — layers, construct kinds, and a split by the values received and returned — worth surfacing on demand. Fixing the report's shape makes it repeatable and steers reading to the source rather than recollection.

**How to apply:** on a lib-report request, read `lib/` and render the sections from current state. Confirm membership by reading the files rather than asserting it. Companion to the `test-report` command (in `testing`). Neither report is written to a file.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 12 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 3:04:33 AM PT
