# Communicate plainly, and name the actual thing

Speak and write to the user in plain language, using the **actual names of things**. Do not hide meaning behind invented labels or compressed jargon offered as if it were already shared. This is a principle rule beneath the `language-is-used-precisely-here-and-words-are-load-bearing` premise, alongside `name-literally` and `no-slang`.

- **No invented labels.** Don't coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names. Say the thing itself — "the notes copied into a project when it installs a package," not "the distributed tier."
- **No symbolic back-references.** Don't point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter"). The reader has to scroll back and count to recover what you meant. Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of a little repetition. Repetition the reader can follow beats a shorthand they must decode. **The engineer may use the number**, since a list they may refer back to is numbered for them (see the an-answer-is-a-list-and-prose-must-justify-itself rule). When they write *#2*, name what #2 is before acting on it, so the reference is confirmed rather than assumed.
- **No jargon as shorthand.** A compressed term ("distributed", "atomic records") is fine only once its plain meaning is on the table. Don't lead with it as though the reader already shares it.
- **Plain over impressive.** Prefer the plain word and the concrete description over the clever-sounding one. If a sentence needs a glossary to parse, rewrite it.
- **Governs conversation, not only the code.** Like `no-slang`, this reaches phrasing addressed *to* the user — an explanation, a summary, a status note — not only what goes into the codebase. The clarity it preserves lives in being understood.

## An explanation is short, shows an example, and gives only what the reader needs

**Being clear is not enough as an instruction, because an explanation can try to be clear and still bury the point.** An explanation does four things:

1. It states the problem in one plain sentence.
2. It shows a real example value, rather than describing one.
3. It says what happened in one sentence.
4. It gives the choice or the next step, and stops.

**It leaves out where things are and why they matter**, such as file names, line numbers, quotations, and background, unless the reader asks for them.

**Not this:**

> The printed-list rule contradicts itself about what the first column holds. This is the master version, `a-record-list-is-a-table.md`, and the phase branch has the same text. What the rule says, line 5: "The first column is the record's handle and carries no heading. That is the ISO-8601-UTC filename prefix…" What its two example tables show, lines 14–15 and 23–24: the date alone…

**This:**

> The list rule says the first column holds the full date and time, like `2026-10-02T14-10-05Z`. Its examples show just the date, like `2026-10-02`. One agent copied the example and failed, and the other nine followed the text.
>
> To fix it, either the examples change to show the date and time, or the text changes to say the date alone.

**The engineer settled that the second is the level of clarity needed.**

**Why:** invented labels and unexplained jargon feel precise but actually hide meaning — the reader has to work out what "tier 1" stands for. Naming the real thing costs a few words and saves the reader the decoding. The point of communicating is to be understood, not to sound authoritative.

**How to apply:** when explaining something, use the concrete name and a plain description. Bring in a shorthand only after its meaning is clear, and only if it is justified. Explain in short plain sentences: the problem, a real example, what happened, and the choice. Leave out locations, quotations, and background unless asked. This governs conversation with the user *and* the durable artifacts they read later — rules, logs, plans, deferred items.

## Compressed

1. Speak and write to the user in plain language, using the actual names of things.
2. Do not hide meaning behind invented labels or compressed jargon offered as if already shared.
3. Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names.
4. Say the thing itself — "the notes copied into a project when it installs a package," not "the distributed tier."
5. Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter").
6. Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition.
7. The engineer may refer to a list item by its number.
8. When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed.
9. Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated.
10. Do not lead with a compressed term as though the reader already shares it.
11. Bring in a shorthand only if it is justified.
12. Prefer the plain word and the concrete description over the clever-sounding one.
13. If a sentence needs a glossary to parse, rewrite it.
14. This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note.
15. It also governs the codebase and the durable artifacts the user reads later: rules, logs, plans, and deferred items.

## An explanation is short, shows an example, and gives only what the reader needs

1. Explain in short plain sentences. State the problem in one plain sentence.
2. Show a real example value, such as `2026-10-02T14-10-05Z`, rather than describing one.
3. Say what happened in one sentence.
4. Give the choice or the next step, and stop.
5. Give only what the reader needs. Leave out where things are and why they matter, such as file names, line numbers, quotations, and background, unless the reader asks.
6. Not this: "The printed-list rule contradicts itself about what the first column holds. This is the master version, `a-record-list-is-a-table.md`… What the rule says, line 5: …"
7. This: "The list rule says the first column holds the full date and time, like `2026-10-02T14-10-05Z`. Its examples show just the date, like `2026-10-02`. To fix it, either the examples change, or the text does."

## Compression

- 2026-10-24, compressed: compression 0.33, change 0.52, solubility 46 → 74, clarity 0.26 → 0.66, 16 directives, 16 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, revised: an explanation is short, shows an example, and gives only what the reader needs; checked: 22 directives, 19 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 74 → 71, clarity 0.66 → 0.78; checked: 18 directives, 18 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named communicate-plainly-name-the-thing and titled "Communicate plainly — name the actual thing, not invented jargon".

Related:

- the `language-is-used-precisely-here-and-words-are-load-bearing` premise this serves
- its sibling principle rules `name-literally` (name a thing for what it is) and `no-slang`
- foundation's `rules-establish-a-mindset` — a rule establishes a stance

---

Authored by Scott Bellware on Sat Jul 18 2026 at 10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:52:56 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:35:39 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:07 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:32 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 8:37:09 PM PT
