# Record substantive design dialogue automatically, as the session proceeds

When the session contains substantive dialogue about the design method — definitions, decisions, forks taken or rejected, methods, reasoning, the results of running a method — record it without being asked, as the conversation proceeds. Do not wait for a "record this" instruction; the recording is automatic.

Two destinations, used together:

- **The running digest** — append each substantive exchange to a dialogue digest observation, preserving the *flow and reasoning* (why a fork was taken), not just conclusions.
- **Discrete artifacts** — when an exchange yields a binding convention, a working hypothesis, or a decision, also create the appropriate discrete file: a rule (`waytide/`), an observation (`waytide/observations/`), and/or a one-line decision-log entry (`waytide/log/`), per the existing conventions. When the exchange is the deliberation of a feature's hinges, its home is a loop record (`waytide/loops/`).

**Why:** The design dialogue is too valuable to lose, and conclusions alone omit the reasoning that produced them — the reasoning is often the more valuable part. Recording it automatically removes the dependence on remembering to ask, and keeps the record complete rather than sampled. The harness cannot do this semantically via a settings hook (hooks run shell commands and cannot distill dialogue), so the agent does it as a standing practice.

**How to apply:** After each substantive design exchange, append a dated entry to the digest observation and create/update discrete artifacts as warranted — proactively, in the same turn, before moving on. Keep the digest scannable: short entries that capture the reasoning and point to the discrete files for detail. Trivial mechanics (typo-level edits, restating settled points) do not need recording. Related: the loop-records rule, and foundation's observations and decision-log conventions.

---

Authored by Scott Bellware on Sat Jun 20 2026 at 12 PM PT
