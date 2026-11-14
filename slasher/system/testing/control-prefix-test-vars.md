# control_ prefix for control-built test values

In test code, a local variable may hold a value built by a control, meaning anything from `Controls::*`. Name it with a `control_` prefix, as in `control_file` and `control_response`. The prefix marks the value as control-produced.

**Why:** Consistency with the existing tests, which already use names like `control_file` and `control_response`. It also makes it obvious at a glance which values originate from controls. Reinforces that these helpers are controls.

**How to apply:** When writing or editing a test, prefix any local bound to a control's output with `control_`. Don't name it bare (`value`, `name`, etc.). Related: the "sent to" entry in the `language` vocabulary.
