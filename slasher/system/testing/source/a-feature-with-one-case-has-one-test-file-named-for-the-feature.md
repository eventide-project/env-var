# A feature with one case has one test file, named for the feature

**Trigger:** When creating or editing a file under `test/`

- **Solubility:** 88
- **Original rank:** 104 of 106
- **Unclarity:** 0.15

When a feature has only **one** case, its test is a **single file named for the feature**. It is `test/automated/upload/status.rb`, directly under the feature context `context "Upload" do; context "Status" do`. Do **not** put it in a folder under a case-discriminating filename (`status/present.rb`).

The folder-with-case-files form is reserved for features with **multiple** cases. It is `rejected/empty.rb` with `rejected/refused.rb`, or `result/located.rb` with `result/unlocated.rb`. Each filename names the case it distinguishes, such as `empty` and `refused`. A case name like `empty` is justified only when there is a sibling case (`refused`) to contrast against. With one case there is nothing to discriminate, so the case name is noise and the file takes the feature's own name.

**Why:** a filename should carry meaning. `present` as the sole file implies a contrast that doesn't exist and misdescribes the feature as multi-case. Naming the lone file for the feature keeps the test path honest about how many cases the feature actually has.

**How to apply:** start a feature's test wherever is convenient. Once the case set is settled, and there is one case, collapse to `<feature>.rb` named for the feature. Fix the `require_relative` depth accordingly. If more than one, use `<feature>/<case>.rb` with each file named for its case.

## Compressed

1. When a feature has only one case, its test is a single file named for the feature.
2. The file sits directly under the feature context. Example: `test/automated/upload/status.rb`, under `context "Upload" do; context "Status" do`.
3. Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`).
4. The folder-with-case-files form is reserved for features with multiple cases.
5. Examples: `rejected/empty.rb` with `rejected/refused.rb`, or `result/located.rb` with `result/unlocated.rb`.
6. In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`.
7. A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against.
8. You may start a feature's test wherever is convenient, before its case set is settled.
9. Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature.
10. When collapsing, fix the `require_relative` depth to match.
11. Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case.

## Compression

- 2026-10-24, compressed: compression 0.04, change 0.45, solubility 88 → 88, clarity 0.85 → 0.85, 11 directives, 10 kept, 1 less precise, 0 lost, after 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 88 → 88, clarity 0.85 → 0.85; checked: 9 directives, 9 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named single-case-test-named-for-feature and titled "A single-case feature is one test file named for the feature, not a folder of case files".

Until Mon Oct 26 2026 this rule was named a-single-case-feature-is-one-test-file-named-for-the-feature and titled "A single-case feature is one test file named for the feature".

Related:

- the test-context-nesting-mirrors-the-folder-hierarchy rule
- the test-structure rule
- the test-name "Is" rule

---

Authored by Scott Bellware on Sat Jun 27 2026 at 4 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:01 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:16 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:08 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
