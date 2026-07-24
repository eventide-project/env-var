# A single-case feature is one test file named for the feature, not a folder of case files

When a feature has only **one** case, its test is a **single file named for the feature** — `test/automated/upload/status.rb` — directly under the feature context (`context "Upload" do; context "Status" do`). Do **not** put it in a folder under a case-discriminating filename (`status/present.rb`).

The folder-with-case-files form — `call/empty.rb` + `call/present.rb`, `result/located.rb` + `result/unlocated.rb` — is reserved for features with **multiple** cases, where each filename names the case it distinguishes (`empty`, `present`). A case name like `empty` only earns its place when there is a sibling case (`present`) to contrast against; with one case there is nothing to discriminate, so the case name is noise and the file takes the feature's own name.

**Why:** a filename should carry meaning. `present` as the sole file implies a contrast that doesn't exist and misdescribes the feature as multi-case. Naming the lone file for the feature keeps the test path honest about how many cases the feature actually has.

**How to apply:** start a feature's test wherever is convenient, but once the case set is settled: if one case, collapse to `<feature>.rb` named for the feature (fix the `require_relative` depth accordingly); if more than one, use `<feature>/<case>.rb` with each file named for its case. Related: the test-context-nesting-mirrors-folders rule, the test-structure rule, and the test-name "Is" rule.

---

Authored by Scott Bellware on Sat Jun 27 2026 at 4 PM PT
