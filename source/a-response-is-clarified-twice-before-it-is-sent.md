# A response is clarified twice before it is sent

**Every response is written at the clarity it would have after the engineer asked twice to clarify it.** That is the default, not a level reached on request. Before sending, rewrite the draft as if asked to clarify it, then rewrite it again.

**A twice-clarified response:**

1. States the point first, in a sentence or two of plain words.
2. Gives only the few facts the engineer needs to understand it and decide.
3. Leaves out figures, file names, method detail, and caveats unless the engineer asks for them. They stay in the records.

**Not this:** a status report with a table of counts, the hook's quoted text, the commit's name, and a list of what remains untested.

**This:**

> Phase 4 is nearly done. When a conversation gets long, Claude Code shortens it into a summary, and the agent then has a summary of the rules, not the rules themselves. The hook now tells the agent to read them again, and in testing every session did. Left to do: update the rule that describes the hook, and check the fix as built.

**Why:** on 2026-10-29 the engineer asked twice to clarify a status report, and called the second rewrite soluble. A response the engineer has to ask to have clarified costs a turn each time.

**How to apply:** before sending any response, ask what the engineer needs from it, and remove the rest.

## Compressed

1. Write every response at the clarity it would have after the engineer asked twice to clarify it.
2. This is the default, not a level reached on request.
3. Before sending, rewrite the draft as if asked to clarify it, then rewrite it again.
4. State the point first, in a sentence or two of plain words.
5. Give only the few facts the engineer needs to understand the response and decide.
6. Leave out figures, file names, method detail, and caveats unless the engineer asks for them. They stay in the records.
7. Before sending any response, ask what the engineer needs from it, and remove the rest.

**Not this:** a status report with a table of counts, the hook's quoted text, the commit's name, and a list of what remains untested.

**This:**

> Phase 4 is nearly done. When a conversation gets long, Claude Code shortens it into a summary, and the agent then has a summary of the rules, not the rules themselves. The hook now tells the agent to read them again, and in testing every session did. Left to do: update the rule that describes the hook, and check the fix as built.

## Compression

- 2026-10-29, compressed: 1369 → 1082 characters; checked: 10 directives, 8 kept, 1 less precise, 1 lost; the example, first left out, is kept in the compressed text at the engineer's direction, so nothing is lost
- 2026-10-29, merge from master re-checked: 10 directives, 10 kept, 0 less precise, 0 lost, 0 repairs

## History

Until Thu Oct 29 2026 the How to apply line said to cut the rest. The engineer settled that *cut* is slang, and it now says to remove the rest.

Related:

- the lead-with-a-summary-then-the-details rule
- the communicate-plainly-and-name-the-actual-thing rule
- the solubility rule

---

Authored by Scott Bellware on Thu Oct 29 2026 at 9:21:13 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 2:05:39 PM PT
