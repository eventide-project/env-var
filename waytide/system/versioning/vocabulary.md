# Versioning — Vocabulary

The versioning package's vocabulary. One term, and it is the one the package exists to
introduce: everything else in a version number is semantic versioning, which is defined
elsewhere and is not restated here. Binding — use this term with this meaning in rules, release
notes, prose, and dialogue.

## Terms

- **product generation** — the **leading segment** of a four-segment version
  (`<generation>.<major>.<minor>.<patch>`), and a **different kind of statement** from the three
  that follow it. The semver segments answer *what does a user of this have to do?* — a
  technical compatibility claim, derived from what changed. The generation answers *which
  product line is this?* — a **declaration**, made by product management, that a new line has
  begun. It is not derived from a change and cannot be computed from a diff. Nothing about a
  code change ever obliges a generation bump, and a generation bump does not, by itself, say
  anything about compatibility.

  A version with **no** leading segment is the ordinary case: three segments, plain semver, no
  generation declared. The segment appears only where a project has declared generations, and
  its absence is not a defect.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
