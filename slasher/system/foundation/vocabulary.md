# Foundation — Vocabulary

The foundation package's vocabulary: the terms it defines and the word substitutions it enforces. These are the terms every other package and every project uses, because foundation defines the artifacts the rest of the system writes into. Binding — use these terms and swaps in rules, artifacts, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

### The three ways of saying "not now"

**These are the terms most easily confused, and they are confused because nothing has stated them beside each other.** They differ in *what is set aside*, *where it goes*, and *what brings it back*.

- **deferred** — work identified mid-task and postponed until the current task finishes. It is an ordinary **item** in `slasher/local/items/` carrying a `**Waits for:**` line, and it may carry a `**Priority:**` rank. A deferred item is *waiting its turn*. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **suspended** — something the project **stopped doing** and set aside rather than deleted: a rule that became ceremony, a procedure nobody runs. The thing is **removed**, with a log entry tagged `[suspended]` naming what it cost and what else changed. A suspended thing is *not waiting its turn* — the project has stopped, and the entry states why. **STE: absent. `suspend (v)` is not approved and gives HANG (v), which is physical. Technical noun, ETE engineering, process, and method.**
- **out of scope** — what a **design deliberately excludes**. It is neither queued nor set aside. It is a boundary the design draws around itself, recorded in its trailing **Out of Scope / Deferred** section so a reader knows the omission was chosen rather than overlooked. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**

The distinguishing question: **deferred** is *not yet*, **suspended** is *no longer*, **out of scope** is *not here*.

### The rest

- **distributable rule** — a rule that **ships in a package** and is installed into a consuming project. It is named by a dash-separated, lower-case name and takes **no datetime prefix**, because it is identified by what it says rather than by when it was written. A project receives one by `git subtree`, and a refresh brings a change to it down. **STE: `distributable` is absent from the STE dictionary. `distribute (v)` is not approved and gives APPLY (v), as in APPLY THE LOAD, which is physical. `distribution (n)` is not approved and gives SUPPLY (n). `rule` is absent. Technical noun, ETE agent artifacts.**
- **local rule** — a rule a **project writes for itself**, in `slasher/local/rules/`. It takes the ISO-8601-UTC datetime prefix, because it is a dated decision in that project's history rather than a durable convention identified by its name. `slasher/local/` is never split or pushed, so a local rule cannot leak upstream. **STE: `LOCAL (adj)` is approved, meaning *applicable to a given location or position* — SET THE “LAT” KNOB TO THE LOCAL LATITUDE. Slasher's sense is belonging to one project rather than to a position, so the word is reserved with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule. `rule` is absent. Technical noun, ETE agent artifacts.**
  - **It is the fourth word ETE fixes the meaning of**, after `loop`, `mechanical`, and `level`. That rule calls this the most expensive reservation ETE makes: a reader who meets an unknown word knows they do not know it, and a reader who meets `local` believes they know it because the dictionary told them.
- **Neither of the two is `system rule`**, which the corpus also uses. `system rule` names **where a rule sits** — under `slasher/system/` in a consuming project, or `system/` in the authoring source. `distributable rule` names **how it travels**. Every distributable rule becomes a system rule once it is installed, and the two words name different facts about it. `system rule` carries no entry here.
- **item** — a record in `slasher/local/items/`: a design, a plan, an aspiration, a note, or deferred work, each told apart by a tag. The the-items-directory-holds-one-file-per-item rule fixes its states and its shape. **A bare *item* means this record and nothing else.** An entry in a bulleted or numbered list is a **list item**, written in full, and a thing in general is named for what it is — a part, a segment, a piece of work. **STE: `ITEM (n)` is approved, meaning *a thing that is determined or specified*, which is not this. Technical noun, ETE agent artifacts, with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule.**
- **projection** — a **derived** artifact that reads a record **without destroying it**. A summary generated at read-time is a projection of the log. A work session record is a projection of the records it is reconstituted from. The term exists to name the alternative to consolidation: where the impulse is to merge, rewrite, or tidy a record into something more readable, a projection gives the readability and leaves the record as written. A projection is regenerated, never maintained — which is why the record it derives from is **not back-edited** to suit it. **STE: absent from the STE dictionary. Technical noun, ETE evented systems and autonomous components.**
- **reconcile** — to correct the **live, forward-looking** artifacts that cite something which has changed, moved, or been deleted. Reconciling is directed at what points *at* a thing, not at the thing itself, and it is confined to artifacts read as current: a note, an item, another deferred item, an implementation record. **Historical records are left as written**, the one exception being a record that discloses what should not have been disclosed. A design is reconciled **against** the records rather than **regenerated from** them: it is a source of truth a plan points back at, so rebuilding it from downstream work would invert the direction of authority. **STE: absent from the STE dictionary. Technical verb, ETE engineering, design, process, and method.**
- **working-state artifact** — a file holding the project's **own work** rather than an installed rule. It is everything under `slasher/local/` except `rules/`: log entries, deferred items, notes, designs, plans, work session records, loop records, feature records, experiments, migration records, and suspended things. The class exists because a single set of obligations falls on all of them: the ISO-8601-UTC filename prefix, and the `Authored by … / Changed by …` provenance footer. **STE: absent from the STE dictionary. Technical noun, ETE agent artifacts.**
- **plain text data attribute line** — a **bold label, a colon, and a value**, optionally as a list item — `- **Priority:** 3`, `**State:** active`, `**Origin:** slasher/system/…`. It is the system's one protocol for content that is read **mechanically** as well as by a person: `session-start.sh` parses these lines. One form in the system rather than a new one per directory. Frontmatter is permitted and would serve equally. It is not used where this form already fits. **STE: absent from the STE dictionary. Technical noun, STE category 15, official documents, parts of documentation, standards, and guidelines.**
- **transfer** — a **technical verb**: to move responsibility for the next act from one party to the other. The agent **transfers responsibility to the engineer** at a hinge, and the engineer **transfers responsibility to the agent** once they make the decision. It names the point a collaborative workflow changes hands, which is not the mechanism that carries it — a `gate` is the mechanism, and the loop `waits` there. **STE: not approved. The STE dictionary gives `MOVE (v)`**, which says nothing about who is answerable next. **Technical verb, ETE engineering, design, process, and method.**
  - **It is never written as a noun.** STE Rule 1.13 forbids a technical verb used as one, so there is no *the transfer of responsibility*. Write the verb — *responsibility transfers to the engineer*. This is the `gate` case in mirror image: that word is a noun and takes no verb form, and this one is a verb and takes no noun form.
- **responsibility** — what transfers: answerability for the next act in the work. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **free-text option** — the answer the **selection interface** supplies beside the options, where the engineer answers outside the option set.
  - **STE: absent from the STE dictionary as a compound. `option (n)` is not approved and gives ALTERNATIVE (n), `FREE (adj)` is approved in an unrelated sense, and `text` is absent. Technical noun, ETE human-computer interaction.**

## Substitutions

Foundation-domain word substitutions. When the impulse is a word in the **Don't use** column, write the **Use** term.

| Use | Don't use | Meaning |
|---|---|---|
| **work session record** | "session record" | the record of a stretch of work — see below |
| **free-text option** | "escape" | the answer the selection interface supplies beside the options — see above for the term, and below for why the figure fails |
| **superseded** | "overtaken" | a record, a claim, or a rule that a later one has replaced or left behind — see below |

### Finer distinctions

- **free-text option** — **`escape` is a figure**, and what it pictures is a closed room. **STE: `escape (v)` is not approved and gives DEFLATE (v)**, as in *let the air escape from the tire*.
- **superseded** — `overtake` and `supersede` are each **absent from the STE dictionary**, so neither is refused and the selection between them is Slasher's own. **The Use word is ordinary vocabulary here**, as `cost`, `required`, and `justified` are in the `language` vocabulary, so it is not reserved and it takes no ETE category.
  - **It overlaps the `Superseded` state word, deliberately and at a cost.** The the-items-directory-holds-one-file-per-item rule and the the-implementations-directory-holds-one-record-per-implementation rule give that state a narrower meaning — *another item replaced it, and the two name each other* — which requires a named counterpart. The substitution's sense is wider and needs no counterpart. So a reader who meets `superseded` in prose cannot tell from the word alone whether a `**State:**` line is being reported. **The state line is the only authoritative statement of a state**, which is what keeps the overlap from being ambiguous in the place it would matter.
  - **The `language` vocabulary's `moot` is not displaced.** It remains the adjective for the condition the state word `Obsolete` names — *no longer bearing on anything, because circumstances moved rather than because a judgment was reached*. `superseded` says a later thing replaced this one. `moot` says nothing bears on it now. Reach for `moot` where no replacement exists.
  - **No sweep follows from this.** Recording a substitution settles what is written from now on. Replacing `overtaken` where it already stands is a separate instruction, asked for separately.
- **work session record** — always carrying **work**. Bare *session* is ambiguous. A reader can supply a shell session, a therapy session, or a parliamentary one, and the shell reading is the one an engineer reaches first. The qualifier says which sense is meant. This holds in the prompt that offers to write one, and in prose about either. The record's own title is `# Work Session — <name> (<date>)`, and the directory name is `slasher/local/logs/work-sessions/`.

## Discontinuations

A word taken out of use with **nothing in its place**. This is not a substitution — a substitution names two words, and each of these names one.

- **handoff** — the point where the work passed between the engineer and the agent. It is discontinued because `transfer` covers it and is a **verb**, so no word-for-word replacement exists: the sentence is rewritten rather than patched. *The naming gate offers the same handoff as the actuation gate* becomes *the naming gate transfers responsibility the same way the actuation gate does*. This is the case STE Rule 9.1 names: use a different sentence construction where a word-for-word replacement is not sufficient. It is the first one Slasher has recorded.

## Compressed


## The three ways of saying "not now"

1. They differ in what is set aside, where it goes, and what brings it back. **Deferred** is not yet, **suspended** is no longer, **out of scope** is not here.
2. **deferred** — work identified mid-task and postponed until the current task finishes. It is an ordinary item in `slasher/local/items/` with a `**Waits for:**` line, and it may carry a `**Priority:**` rank. It waits its turn.
3. **suspended** — something the project stopped doing and set aside rather than deleted, such as a rule that became ceremony or a procedure nobody runs. The thing is removed, with a log entry tagged `[suspended]` naming what it cost, what else changed, and why the project stopped. It does not wait its turn.
4. **out of scope** — what a design deliberately excludes. It is neither queued nor set aside. It is a boundary the design draws around itself, recorded in its trailing **Out of Scope / Deferred** section so the omission reads as chosen.

## The rest

1. **distributable rule** — a rule that ships in a package and is installed into a consuming project. Its name is dash-separated and lower-case, with no datetime prefix. A project receives one by `git subtree`, and a refresh brings a change to it down.
2. **local rule** — a rule a project writes for itself, in `slasher/local/rules/`. It takes the ISO-8601-UTC datetime prefix. `slasher/local/` is never split or pushed, so a local rule cannot leak upstream.
3. `local` is the fourth word ETE fixes the meaning of, after `loop`, `mechanical`, and `level`.
4. **system rule** is neither of the two and carries no entry here. It names where a rule sits: under `slasher/system/` in a consuming project, or `system/` in the authoring source. `distributable rule` names how it travels. Every distributable rule becomes a system rule once installed.
5. **item** — a record in `slasher/local/items/`: a design, a plan, an aspiration, a note, or deferred work, each told apart by a tag. The the-items-directory-holds-one-file-per-item rule fixes its states and shape. A bare *item* means this record and nothing else. Call an entry in a bulleted or numbered list a **list item**, in full. Name a thing in general for what it is, such as a part, a segment, or a piece of work.
6. **projection** — a derived artifact that reads a record without destroying it, such as a summary generated at read-time from the log, or a work session record reconstituted from other records. Where the impulse is to merge, rewrite, or tidy a record, make a projection and leave the record as written. A projection is regenerated, never maintained. Do not back-edit its record to suit it.
7. **reconcile** — to correct the live, forward-looking artifacts that cite something which has changed, moved, or been deleted. It is directed at what points at a thing, not at the thing. It is confined to artifacts read as current: a note, an item, another deferred item, an implementation record. Leave historical records as written, except a record that discloses what should not have been disclosed. Reconcile a design against the records. Never regenerate it from them.
8. **working-state artifact** — a file holding the project's own work rather than an installed rule: everything under `slasher/local/` except `rules/`. That is log entries, deferred items, notes, designs, plans, work session records, loop records, feature records, experiments, migration records, and suspended things. Each takes the ISO-8601-UTC filename prefix and the `Authored by … / Changed by …` provenance footer.
9. **plain text data attribute line** — a bold label, a colon, and a value, optionally as a list item: `- **Priority:** 3`, `**State:** active`, `**Origin:** slasher/system/…`. It is the system's one protocol for content read mechanically as well as by a person. `session-start.sh` parses these lines. Use this one form, not a new one per directory. Frontmatter is permitted, but is not used where this form fits.
10. **transfer** — a technical verb: to move responsibility for the next act from one party to the other. The agent transfers responsibility to the engineer at a hinge, and the engineer transfers responsibility to the agent once they decide. It names where a collaborative workflow changes hands, not the mechanism. A `gate` is the mechanism, and the loop `waits` there.
11. Never write `transfer` as a noun (STE Rule 1.13). Write *responsibility transfers to the engineer*, not *the transfer of responsibility*. It mirrors `gate`, a noun that takes no verb form.
12. **responsibility** — what transfers: answerability for the next act in the work.
13. **free-text option** — the answer the selection interface supplies beside the options, where the engineer answers outside the option set.
14. STE for free-text option: absent as a compound. `option (n)` is not approved and gives ALTERNATIVE (n). `FREE (adj)` is approved in an unrelated sense. `text` is absent. Technical noun, ETE human-computer interaction.
15. **private record** — a record the engineer keeps for a project outside the project's repository, under `~/.local/share/slasher/`, in one directory for each kind and project: a document, an item, a log entry, or a journal entry. Anything given to `/private` is a private record. It is not committed, and the agent writes, reads, or lists one only on the engineer's command. **Private** means kept out of the repository and out of the session-start read, and nothing more: a record the agent writes or reads still passes through the session. It differs from a working-state artifact, which is committed with the project.
16. **private session** — the part of a session from `/private session` until the session ends, until `/private session end`, or until the engineer ends it when it times out after 4 minutes with no prompt. In a private session, every record the agent writes goes to the private directory, and none goes into the project. A file that is not a record, such as code or a rule, still changes in the project.

## Substitutions

| Use | Don't use | Meaning |
|---|---|---|
| **work session record** | "session record" | the record of a stretch of work |
| **free-text option** | "escape" | the answer the selection interface supplies beside the options |
| **superseded** | "overtaken" | a record, a claim, or a rule that a later one has replaced or left behind |

1. Do not write `escape` for the free-text option.
2. Write **superseded**, not "overtaken", for a record, a claim, or a rule that a later one replaced. It is ordinary vocabulary, not reserved, and takes no ETE category. `overtake` and `supersede` are both absent from the STE dictionary.
3. **superseded** overlaps the `Superseded` state word, which means another item replaced this one and the two name each other. A reader cannot tell from `superseded` alone whether a state is being reported. The `**State:**` line is the only authoritative statement of a state.
4. The `language` vocabulary's `moot` is not displaced. It stays the adjective for the condition the state word `Obsolete` names: no longer bearing on anything, because circumstances moved rather than because a judgment was reached. `superseded` says a later thing replaced this one. Write `moot` where no replacement exists.
5. Recording the substitution orders no sweep. Replacing `overtaken` where it already stands is a separate instruction, asked for separately.
6. Always write **work session record** with **work**, not bare *session*. This holds in the prompt that offers to write one and in prose about either. The record's title is `# Work Session — <name> (<date>)`, and its directory is `slasher/local/logs/work-sessions/`.

## Discontinuations

1. **handoff** — the point where the work passed between the engineer and the agent. It is discontinued. Use `transfer`, a verb, and rewrite the sentence rather than patch it (STE Rule 9.1). *The naming gate offers the same handoff as the actuation gate* becomes *the naming gate transfers responsibility the same way the actuation gate does*.

## Compression

- 2026-10-29, compressed: 11717 → 8636 characters; checked: 86 directives, 84 kept, 1 less precise, 1 lost; nothing repaired, the items not kept being reasons or background
- 2026-10-29, revised: the head line saying every word is approved or reserved is left out of the compressed text, at the engineer's direction, since the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule states it in the read
- 2026-10-29, revised: the lines naming the vocabulary and saying it is binding are left out of the compressed text, at the engineer's direction; the loader names the file, and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says every vocabulary binds
- 2026-10-29, revised: the `Explain` option and every statement about the free-text option are removed, at the engineer's direction; checked: 93 directives, 84 kept, 2 less precise, 7 lost; what is not kept was left out on purpose, in this revision or an earlier one, or is stated in the pre-loaded present-every-prompt-to-the-engineer-through-the-selection-ui rule
- 2026-10-29, revised: the *superseded* substitution moves here from this project's own vocabulary, at the engineer's direction; its compressed points are the ones checked in phase 13
- 2026-11-05, revised: each entry's STE note is left out of the compressed text, at the engineer's direction; it matters only when a word is reserved or an entry written, and the full text keeps it

## History

Until Thu Oct 29 2026, the free-text option entry said the harness provides it so the agent adds none of its own, that it is present at every prompt, and that it differs from the `Explain` option, which asks what a question means and costs one of the four option slots. It also said an option naming an answer inside the question, such as *Enter the time*, is not the free-text option, and the `escape` distinction argued that the option set is not closed because the free-text option is always there.

Until Thu Oct 29 2026 the *superseded* substitution stood in the Waytide authoring source's own `local/vocabulary.md`, where it was settled on Thu Aug 20 2026. It moved here so that every project that installs `foundation` writes *superseded*.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:03:20 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 2:04:52 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 10:31:52 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 11:18:04 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:38:29 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:08:25 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:26:19 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:55:34 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 12:04:03 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:34:54 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:40:05 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 1:57:17 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:35 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:33:19 PM PT
