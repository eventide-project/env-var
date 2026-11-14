# Versioning — Vocabulary

The versioning package's vocabulary. One term, and it is the one the package exists to introduce. Everything else in a version number is semantic versioning, which is defined elsewhere and is not restated here. Binding — use this term with this meaning in rules, release notes, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **product generation** — the **leading segment** of a four-segment version (`<generation>.<major>.<minor>.<patch>`), and a **different kind of statement** from the three that follow it. The semver segments answer *what does a user of this have to do?* — a technical compatibility claim, derived from what changed. The generation answers *which product line is this?* — a **declaration**, made by product management, that a new line has begun.

  It is not derived from a change and cannot be computed from a diff. Nothing about a code change ever obliges a generation bump, and a generation bump does not, by itself, say anything about compatibility. **STE: absent from the STE dictionary. `generation` is absent from the STE dictionary, and `product (n)` is listed with the guidance to be accurate. Technical noun, STE category 7, mathematical, scientific, engineering terms, and formulas.**

  A version with **no** leading segment is the ordinary case: three segments, plain semver, no generation declared. The segment appears only where a project has declared generations, and its absence is not a defect.

## Compressed

## product generation

1. **product generation** is the leading segment of a four-segment version: `<generation>.<major>.<minor>.<patch>`.
2. It is a different kind of statement from the three semver segments that follow it.
3. The semver segments answer *what does a user of this have to do?*: a technical compatibility claim, derived from what changed.
4. The generation answers *which product line is this?*: a declaration, made by product management, that a new line has begun.
5. It is not derived from a change and cannot be computed from a diff.
6. No code change obliges a generation bump.
7. A generation bump does not, by itself, say anything about compatibility.
8. A version with no leading segment is the ordinary case: three segments, plain semver, no generation declared.
9. The segment appears only where a project has declared generations. Its absence is not a defect.

## Compression

- 2026-10-29, compressed: 1727 → 1685 characters; checked: 18 directives, 17 kept, 0 less precise, 1 lost; nothing repaired, the items not kept being reasons or background
- 2026-10-29, revised: the head line saying every word is approved or reserved is left out of the compressed text, at the engineer's direction, since the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule states it in the read
- 2026-10-29, revised: the lines naming the vocabulary and saying it is binding are left out of the compressed text, at the engineer's direction; the loader names the file, and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says every vocabulary binds
- 2026-10-29, revised: the line "The rest of a version number is semantic versioning, defined elsewhere and not restated here." is left out of the compressed text, at the engineer's direction, after an evaluation found the product generation entry already says the other three segments are semantic versioning
- 2026-11-05, revised: each entry's STE note is left out of the compressed text, at the engineer's direction; it matters only when a word is reserved or an entry written, and the full text keeps it

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
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:55:34 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:04:03 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:09:54 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:33:19 PM PT
