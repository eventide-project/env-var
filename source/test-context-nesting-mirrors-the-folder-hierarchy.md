# Test context nesting mirrors the folder hierarchy

**Trigger:** When creating or editing a file under `test/`

- **Solubility:** 87
- **Original rank:** 102 of 106
- **Unclarity:** 0.16

A test file's context nesting mirrors the hierarchy of its folder path. Each directory segment under `test/automated/` becomes a context, mirroring the test organization's hierarchy. The scenario contexts nest inside those, and the test blocks inside those.

A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context — mirroring `upload/rejected/`. A test at `test/automated/upload/retried.rb` does the same: `"Upload"` → `"Retried"`.

Do **not** flatten the hierarchy into a single combined context (e.g. `"Upload Rejected"`). The leaf files within a feature folder (e.g. `rejected/empty.rb`, `rejected/refused.rb`) represent distinct cases of the same feature. They share the folder-mirrored context nesting and are distinguished by their outcome-context titles, not by an extra per-file context layer.

**Why:** the test output and the file tree then read as the same structure. Each outcome is situated under the segments of its path, and under the scenario it establishes. It also keeps the suite consistent with the existing `upload/` tests.

**How to apply:** nest the file's contexts in this order:

- one `context` per folder segment, mirroring the test organization's hierarchy
- the contexts that pertain to the scenario
- the test blocks, each with an optional context scoping a local variable or a comment

## Compressed

1. A test file's context nesting mirrors the hierarchy of its folder path.
2. Each directory segment under `test/automated/` becomes a context.
3. Scenario contexts nest inside the folder contexts.
4. Test blocks nest inside the scenario contexts.
5. A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context.
6. A test at `test/automated/upload/retried.rb` opens `"Upload"` → `"Retried"`.
7. Do **not** flatten the hierarchy into a single combined context, such as `"Upload Rejected"`.
8. Leaf files within a feature folder, such as `rejected/empty.rb` and `rejected/refused.rb`, are distinct cases of the same feature.
9. Those leaf files share the folder-mirrored context nesting.
10. Leaf files are distinguished by their outcome-context titles.
11. Do not add an extra per-file context layer.
12. Nest the file's contexts in this order: one `context` per folder segment, then the scenario contexts, then the test blocks.
13. Each test block may have an optional context that scopes a local variable or a comment.
14. Keep the suite consistent with the existing `upload/` tests.

## Compression

- 2026-10-24, compressed: compression 0.07, change 0.52, solubility 87 → 95, clarity 0.84 → 1.00, 9 directives, 9 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 95 → 95, clarity 1.00 → 1.00; checked: 8 directives, 8 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named test-context-nesting-mirrors-folders.

Related:

- the test-structure rule
- the test-name "Is" rule
- the `control_` test-variable prefix rule
- the a-high-level-context-names-a-behavior-never-a-method rule — what the contexts the folders produce are named for

---

Authored by Scott Bellware on Fri Jun 26 2026 at 2 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:16 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
