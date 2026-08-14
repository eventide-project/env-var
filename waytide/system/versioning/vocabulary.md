# Versioning — Vocabulary

The versioning package's vocabulary. One term, and it is the one the package exists to introduce. Everything else in a version number is semantic versioning, which is defined elsewhere and is not restated here. Binding — use this term with this meaning in rules, release
notes, prose, and dialogue.

**Every word here is one of two things.** This holds for the terms below, and for the **Use**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-its-own-categories rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the
`language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note
names a term absent from the STE dictionary, and reserves it. A definition exists to name a term,
and a term names something in the subject field. A **substitution's Use word** with no STE note is
**ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's
ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its
waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

- **product generation** — the **leading segment** of a four-segment version
  (`<generation>.<major>.<minor>.<patch>`), and a **different kind of statement** from the three
  that follow it. The semver segments answer *what does a user of this have to do?* — a
  technical compatibility claim, derived from what changed. The generation answers *which
  product line is this?* — a **declaration**, made by product management, that a new line has
  begun.

  It is not derived from a change and cannot be computed from a diff. Nothing about a
  code change ever obliges a generation bump, and a generation bump does not, by itself, say
  anything about compatibility. **STE: absent from the STE dictionary. `generation` is absent from the STE dictionary, and
  `product (n)` is listed with the guidance to be accurate. Technical noun, STE category 7,
  mathematical, scientific, engineering terms, and formulas.**

  A version with **no** leading segment is the ordinary case: three segments, plain semver, no
  generation declared. The segment appears only where a project has declared generations, and
  its absence is not a defect.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 10:22:47 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
