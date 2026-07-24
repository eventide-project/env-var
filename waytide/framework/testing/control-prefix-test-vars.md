# control_ prefix for control-built test values

In test code, a local variable that holds a value built by a control (anything from `Controls::*`, e.g. `Controls::Upload.example(...)`) is named with a `control_` prefix — `control_file`, `control_response`, and so on. The prefix marks the value as control-produced.

**Why:** Consistency with the existing tests (which already use names like `control_file` / `control_response`) and to make it obvious at a glance which values originate from controls. Reinforces that these helpers are controls.

**How to apply:** When writing or editing a test, prefix any local bound to a control's output with `control_`. Don't name it bare (`value`, `name`, etc.). Related: the "sent to" entry in the Word Substitutions rule (in `language`).

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
