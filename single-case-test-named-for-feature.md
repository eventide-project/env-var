# A single-case feature is one test file named for the feature, not a folder of case files

When a feature has only **one** case, its test is a **single file named for the feature**. It is `test/automated/upload/status.rb`, directly under the feature context `context "Upload" do; context "Status" do`. Do **not** put it in a folder under a case-discriminating filename (`status/present.rb`).

The folder-with-case-files form is reserved for features with **multiple** cases. It is `call/empty.rb` with `call/present.rb`, or `result/located.rb` with `result/unlocated.rb`. Each filename names the case it distinguishes, such as `empty` and `present`. A case name like `empty` is justified only when there is a sibling case (`present`) to contrast against. With one case there is nothing to discriminate, so the case name is noise and the file takes the feature's own name.

**Why:** a filename should carry meaning. `present` as the sole file implies a contrast that doesn't exist and misdescribes the feature as multi-case. Naming the lone file for the feature keeps the test path honest about how many cases the feature actually has.

**How to apply:** start a feature's test wherever is convenient. Once the case set is settled, and there is one case, collapse to `<feature>.rb` named for the feature. Fix the `require_relative` depth accordingly. If more than one, use `<feature>/<case>.rb` with each file named for its case.

Related:

- the test-context-nesting-mirrors-folders rule
- the test-structure rule
- the test-name "Is" rule

---

Authored by Scott Bellware on Sat Jun 27 2026 at 4 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
