# An answer is a list; prose must justify itself

An answer to the developer is a **list**. Prose is not forbidden, and it is not the default: it is
written where one of the conditions below applies, and those conditions are the whole of what
justifies it.

**The burden is inverted deliberately.** A rule saying *prefer lists* leaves prose available
whenever the agent finds it easier, which is always — prose is what an agent produces without
deciding to. Requiring a justification means the agent has to name which condition applies, and
where none does, the answer is a list.

## What justifies prose

**One condition: the answer is a sentence or two.** A single bullet is decoration, and two bullets
for a two-clause answer organizes nothing. *Yes*, *The suite passes*, *Correct — the rule says so
and I did not follow it* are answers, and a list would only put marks in front of them.

**That is the whole set.** Two candidates were considered and rejected, and the reasons are worth
keeping because both are tempting:

- **An explanation the developer asked for is not a justification.** The request is for the
  substance, not for a form. Where this was tested, every explanation asked for outright was
  answered in a list and none was harder to follow for it.
- **Dependent reasoning is not a justification either**, because it is answered inside the form.
  See below.

## A list item states a fact; it does not narrate

**Narration is the failure the list form does not by itself prevent.** An answer can be a correct
list of items every one of which describes the work rather than stating what is true, and it reads
as compliance while being the thing the rule exists to stop.

**These are narration, and none of them belongs in an answer:**

- **Describing a choice as a choice** — *the judgment is left as a judgment on purpose*, *this was
  recorded as a new entry rather than by rewriting the old one*, *the option was declined*.
- **Explaining why something is as it is**, unasked — *so a later reader knows what tightening
  would mean*, *which is what keeps the record honest*, *for the same reason the other rule gives*.
- **Characterizing the work or its result** — *the miss is instructive*, *worth noting*, *this is
  the substantive part*, *cleanly*, *correctly*.
- **Reporting the agent's process** — *I checked*, *verified rather than assumed*, *rather than
  trusting the composite's copy*.

**The fact is what is left when those are removed.** *The rule names two stricter forms: the line
on every list answer, or above a length threshold. Neither is adopted.* That is the same content
with nothing said about it.

**The test:** could the item be false? A fact can be. *The check is green*, *nine of thirteen
scripts lack it*, *the branch is deleted* are all falsifiable. *This keeps the record honest* is
not — it is a comment on a fact rather than a fact, and it is where narration hides.

**Why the reasoning still belongs somewhere.** A rule, a record, and a commit message all carry
why; each is written to be read as a document and its reader came for the reasoning. **An answer
is not one of those.** The developer asked something, and reasoning they did not ask for is the
agent taking their turn to think out loud. Where the reasoning is wanted, it is asked for — which
is what the expansion line is for.

## Dependent reasoning takes an ordered list, not prose

**An unordered list asserts that its items are parallel and independent.** Where a point follows
*from* the point above it, that assertion is false, and the reader is left to recover a
relationship the form denied.

**A numbered list asserts sequence.** So reasoning whose steps rest on each other is written
`1.`, `2.`, `3.` — the dependence is carried by the form rather than escaping it.

**This is why dependent reasoning is not an exception.** The problem was never prose against
lists; it was one kind of list used where another was meant.

## After a list answer, the developer is offered an expansion

**Where an expansion would add something, the answer ends with one line:**

```
For more detail than bullet points, ask for an expanded answer.
```

- **It is a line, not a prompt.** A selection prompt where no decision is pending doubles the turns
  and becomes furniture — a thing always present is read once and never again.
- **It appears only where there is something to expand**, meaning the agent compressed material
  out of the answer. On an answer that says all it has, the line is noise.
- **What it offers is depth on the answer given, not a next topic.** That distinction is the whole
  difference between this line and the trailing offer-of-more that is otherwise a defect: it points
  back at what was just said, not forward at what else might be done.
- **It names the form being traded away**, not only the depth on offer. *More detail* alone leaves
  a developer to guess what an expansion would look like; *more detail than bullet points* says the
  expansion is a different form of answer, which is what they would be asking for.

**The known weakness, stated rather than discovered later:** the timing rests on the agent judging
its own answer, and an agent's judgment about its own output is exactly what makes this rule
necessary. An agent that compresses badly will also decide badly whether it compressed.

**It is left as a judgment on purpose, and experience decides whether it stays one.** The rule is
not tightened in advance of evidence that it needs to be, because the cost of tightening is real:
the alternatives replace the judgment with a mechanical condition, and each buys reliability with
noise. **Appending the line to every list answer** cannot be got wrong and puts the same sentence
under every answer, which is how a line stops being read. **Appending it above a length threshold**
removes the most pointless instances and still fires on answers that say all they have. Either is
available if the judgment proves unreliable in use; neither is worth paying for a weakness that has
not yet cost anything.

**Why:** an agent produces prose without choosing to, and prose is where padding, editorializing,
and unattributed back-references hide. A list forces each claim onto its own line, where a claim
with nothing in it is visible as a line with nothing in it. The developer this was settled with had
stated the preference three times across a week before it was written down — and a preference
restated is a rule that has not been written, because every restatement is evidence the agent does
not hold it between sessions. Inverting the burden, rather than expressing a preference, is what
makes the difference survive a session boundary.

**How to apply:** answer in a list. State facts in it — remove any item that describes a choice,
explains an unasked-for reason, characterizes the work, or reports what the agent did to be sure,
and test each survivor by whether it could be false. Number the list where its items depend on each
other, and leave it unordered where they do not. Write prose only where the answer is a sentence or two, and do not
reach for it because an explanation was requested or because the reasoning is connected — the first
is not a justification and the second is served by numbering. Where the answer left something out,
end it with `For more detail than bullet points, ask for an expanded answer.` on its own line, and omit that line where the
answer says all it has. Related: the communicate-plainly-name-the-thing rule (which governs the
words inside the list and reaches conversation the same way this does), the
language-is-precise-here premise, and `foundation`'s
present-every-prompt-through-askuserquestion rule (the selection interface, which is where a
**question** goes — this rule governs an **answer**, and the two do not overlap).

---

Authored by Scott Bellware on Fri Aug 7 2026 at 12:55:09 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:02:58 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:10:48 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:28:11 PM PT
