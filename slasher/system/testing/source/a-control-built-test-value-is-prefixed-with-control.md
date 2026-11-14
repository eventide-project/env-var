# A control-built test value is prefixed with control_

**Trigger:** When creating or editing a file under `test/`

- **Solubility:** 99
- **Original rank:** 106 of 106
- **Unclarity:** 0.00

In test code, a local variable may hold a value built by a control, meaning anything from `Controls::*`. Name it with a `control_` prefix, as in `control_file` and `control_response`. The prefix marks the value as control-produced.

**Why:** Consistency with the existing tests, which already use names like `control_file` and `control_response`. It also makes it obvious at a glance which values originate from controls. Reinforces that these helpers are controls.

**How to apply:** When writing or editing a test, prefix any local bound to a control's output with `control_`. Don't name it bare (`value`, `name`, etc.). Related: the "sent to" entry in the `language` vocabulary.

## Compressed

1. In test code, a control is anything from `Controls::*`.
2. Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`.
3. This applies whenever you write or edit a test.
4. Do not give such a local a bare name, such as `value` or `name`.

## Compression

- 2026-10-24, compressed: compression 0.30, change 0.67, solubility 99 → 99, clarity 1.00 → 0.99, 2 directives, 2 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 99 → 98, clarity 0.99 → 0.97; checked: 2 directives, 2 kept, 0 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named control-prefix-test-vars and titled "control_ prefix for control-built test values".

Until Mon Oct 26 2026 this rule was named a-control-built-test-value-takes-the-control-prefix and titled "A control-built test value takes the control_ prefix".

---

Authored by Scott Bellware on Fri Jun 5 2026 at 10 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:46:47 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:32 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:19 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:15 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
