# A bare /slasher offers topics to learn about

**Trigger:** When the engineer types a bare `/slasher`, with nothing after it

**A bare `/slasher` offers the engineer topics to learn about, through the selection interface.** The four options are *Items*, *Features*, *Experiments*, and *Commands*. The selection interface's free-text option lets the engineer type any other topic.

**As the engineer stated it:** A bare "/slasher" command offers the user things to learn about: Items, Features, Experiments. The user can also type something in. For the user's selection, for example: items, run "Briefly explain items"

**A topic selected is explained briefly, as the request *Briefly explain <topic>* would be.** Selecting *Items* is the same as the engineer typing *Briefly explain items*. A topic typed in takes the same treatment. The explanation follows the `language` package's rules: it leads with the point, and it is short.

**Selecting *Commands* prints the command domain table.** It prints the table word for word, and nothing else, as `/command-table` does. The the-command-domain-table-prints-when-the-rules-have-loaded rule holds the table.

**The topics are offered once.** After the explanation, or the table, the command is done. It does not offer the topics again.

**As the engineer stated it:** Don't do that looping back to the slasher root command

**The question offers no other topics.** The selection interface holds four options. Items, Features, and Experiments are the three the engineer named, and Commands takes the fourth place because the table was what a bare `/slasher` printed before.

**Why:** an engineer new to Slasher does not yet know its words. A bare `/slasher` is the first thing such an engineer types, and it answers with the ideas the work is organized around, explained in a few lines each, rather than with a table of commands that assumes those ideas are already known.

**How to apply:** on a bare `/slasher`, put the four topics through the selection interface. On a selection, explain that topic briefly, or print the command domain table for *Commands*, and stop. Do not offer the topics again.

## Compressed

1. A bare `/slasher` offers topics to learn about, through the selection interface: *Items*, *Features*, *Experiments*, and *Commands*. The free-text option takes any other topic.
2. Explain a topic selected or typed briefly, as *Briefly explain <topic>* would. Lead with the point, and keep it short.
3. For *Commands*, print the command domain table word for word, and nothing else.
4. Offer no other topics.
5. Offer the topics once. Do not offer them again after the explanation or the table.

## Compression

- 2026-11-06, compressed: written with the rule; checked: 9 directives, 6 kept, 3 less precise, 0 lost, 0 repairs. Left less precise: the example that *Items* is *Briefly explain items*, the `language` package named as the source of the explanation's form, and that the bare command no longer prints the table, which the rule states only where it names what *Commands* prints
- 2026-11-07, revised: the topics are offered again after each explanation, until the engineer escapes, as point 5; re-checked: 11 directives, 10 kept, 1 less precise, 0 lost, 0 repairs. Left less precise: the example that *Items* is *Briefly explain items*
- 2026-11-07, revised: the topics are offered once, and point 5 says they are not offered again, as the engineer directed; not re-checked

## History

For a time on Sat Nov 7 2026 a bare `/slasher` offered the topics again after each explanation, until the engineer escaped. Before and after that, it offers them once.

Related:

- the the-command-domain-table-prints-when-the-rules-have-loaded rule — the table *Commands* prints
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose skill reads a bare `/slasher`

---

Authored by Scott Bellware on Fri Nov 6 2026 at 11:59:49 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:38:23 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:48:19 AM PT
