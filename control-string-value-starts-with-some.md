# A control's string value starts with "some"

When a control holds a **string value** (a literal value used as test input, not a
constant name), the string starts with **"some"** — e.g. `control_file = "some file"`,
not `"a file"`. The word "some" marks it as an arbitrary placeholder value
whose specific content does not matter.

This parallels the constant-name convention, where example names are
`"SomeModule"`, `"SomeOtherModule"` (capitalized, because they are constant
names). A bare string *value* is lowercase: `"some file"`, `"some other file"`.

**Why:** "some" signals "any value would do here" — the value is a stand-in, not
significant. "a string" reads as a specific thing; "some string" reads as a
placeholder, matching the `control_` prefix's intent (a known, set-up reference
whose identity, not content, is what the test turns on). Consistent with the
`Some…` naming already used for example constant names.

**How to apply:** Write `control_file = "some file"` (and `"some other
file"`, etc.) for placeholder string values. Reserve specific string content
only when the test actually depends on it. Non-string placeholder values (e.g. a
number) are not covered — they have no "some" form. Related: the `control_`
test-variable prefix rule and the controls-not-fixtures conventions.

---

Authored by Scott Bellware on Mon Jun 29 2026 at 2 PM PT
