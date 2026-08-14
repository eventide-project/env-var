# Test context nesting mirrors the folder hierarchy

A test file's context nesting mirrors the hierarchy of its folder path. Each directory segment under `test/automated/` becomes a context, mirroring the test organization's hierarchy. The scenario contexts nest inside those, and the test blocks inside those.

A test at `test/automated/upload/call/present.rb` opens `context "Upload"` → `context "Call"` → the outcome context — mirroring `upload/call/`. The existing `test/automated/upload/build/build.rb` does the same: `"Upload"` → `"Build"`.

Do **not** flatten the hierarchy into a single combined context (e.g. `"Upload Call"`). The leaf files within a feature folder (e.g. `call/present.rb`, `call/empty.rb`) represent distinct cases of the same feature. They share the folder-mirrored context nesting and are distinguished by their outcome-context titles, not by an extra per-file context layer.

**Why:** the test output and the file tree then read as the same structure. Each outcome is situated under the segments of its path, and under the scenario it establishes. It also keeps the suite consistent with the existing `upload/` tests.

**How to apply:** nest the file's contexts in this order:

- one `context` per folder segment, mirroring the test organization's hierarchy
- the contexts that pertain to the scenario
- the test blocks, each with an optional context scoping a local variable or a comment

Related:

- the test-structure rule
- the test-name "Is" rule
- the `control_` test-variable prefix rule

---

Authored by Scott Bellware on Fri Jun 26 2026 at 2 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
