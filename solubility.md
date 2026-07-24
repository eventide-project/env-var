# Solubility: how readily a unit dissolves into use

**Solubility** is the design-quality term for how readily a unit **dissolves into use** — how usable and transparent it is from the standpoint of what uses it. A soluble unit is as simple as it should be and no simpler: maximum simplicity, minimal necessary complexity, found rather than presumed.

The word is used as a general quality of a design, and it is judged **from the outside** — from the use site, not from the implementation. An implementation that only works by forcing an awkward use is not soluble, however tidy it reads internally.

**Say "soluble" / "solubility"** for this quality. It is not a synonym for "simple" (a unit can be simple and still dissolve badly into use), nor for "clean" or "elegant" (which describe how the code reads, not how it is used).

**Why:** the quality needs one settled name so it can be aimed at, taught, and judged. "Dissolves into use" is the literal description the name is built from — the reader needs no mapping to a metaphor or an imported academic term (this is the name-literally standard applied to the term itself). Naming it makes it available as a target of design work and as a criterion at the moment a design is judged, rather than leaving the judgment to unstated taste.

**How to apply:** use "solubility" wherever the concern is how well a unit dissolves into its use — in prose, rules, designs, commits, and dialogue. Judge it from the use site. Related: the name-literally-not-by-analogy rule (which uses solubility as its criterion), and — for the term's role inside a specific method — the `design-by-efferent` package's vocabulary, where solubility is the target of generation and a known hinge.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
