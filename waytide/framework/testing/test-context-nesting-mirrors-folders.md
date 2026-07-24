# Test context nesting mirrors the folder hierarchy

A test file's context nesting mirrors the hierarchy of its folder path. Each directory segment under `test/automated/` becomes a context; the file's body nests inside those contexts, ending in the outcome context(s).

A test at `test/automated/upload/call/present.rb` opens `context "Upload"` → `context "Call"` → the outcome context — mirroring `upload/call/`. The existing `test/automated/upload/build/build.rb` does the same: `"Upload"` → `"Build"`.

Do **not** flatten the hierarchy into a single combined context (e.g. `"Upload Call"`). The leaf files within a feature folder (e.g. `call/present.rb`, `call/empty.rb`) represent distinct cases of the same feature; they share the folder-mirrored context nesting and are distinguished by their outcome-context titles, not by an extra per-file context layer.

**Why:** the test output and the file tree then read as the same structure — each outcome is situated under the class/namespace and the feature it establishes. It also keeps the suite consistent with the existing `upload/` tests.

**How to apply:** open one `context` per folder segment of the test's path (the class/namespace, then the feature/method), then the outcome context(s) holding the assertions. Related: the test-structure rule, the test-name "Is" rule, and the `control_` test-variable prefix rule.

---

Authored by Scott Bellware on Fri Jun 26 2026 at 2 PM PT
