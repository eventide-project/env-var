# Record a rule's authorship in a provenance footer

Every rule file ends with a **provenance footer** — who authored it and when, and who has changed it since. In a project with multiple contributors, this makes a rule's authorship traceable at the rule itself, not only in version-control history.

The footer sits at the end of the file, after the rule's content, below a `---` divider:

```
---

Authored by <name> on <datetime>
```

Each change **appends** a line — the footer is a running history, never rewritten:

```
---

Authored by <name> on <datetime>
Changed by <name> on <datetime>
Changed by <other name> on <datetime>
```

- **The datetime is human-readable local time**, formatted `Mon Jan 1 2026 at 3 PM PT` — day-of-week, month, day, year, then the hour with AM/PM and a timezone abbreviation, in the author's **local** time. This deliberately differs from the ISO-8601-UTC filename prefix (machine-sortable, UTC): the footer is provenance written for a person to read.
- **Authored** names the original author and when the rule was first written. **Changed** is appended each time the rule is edited, oldest first — never rewrite or remove an earlier line.
- **The name** is the contributor's name, as in their git identity.

**Why in the file, not just git history:** a package is installed into a consuming project by `git subtree`, which does not carry the composite repo's per-file history into that project. So `git blame` / `git log` there cannot show who authored a rule. An in-file footer travels with the file, so authorship is legible wherever the rule is read — which is where review and accountability need it.

**How to apply:** when authoring a new rule, end it with a `---` divider and an `Authored by <name> on <local datetime>` line. When changing an existing rule, append a `Changed by <name> on <local datetime>` line to its footer. Related: the agent-rules-convention (the rule format) and the agent-file-names rule (the UTC filename prefix this contrasts with).

---

Authored by Scott Bellware on Wed Jul 22 2026 at 7 PM PT
