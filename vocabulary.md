# Foundation — Vocabulary

The foundation package's vocabulary: the terms it defines and the word substitutions it enforces. These are the terms every other package and every project uses, because foundation defines the artifacts the rest of the system writes into. Binding — use these terms and swaps in rules, artifacts, prose, and dialogue.

**Every word here is one of two things.** This holds for the terms below, and for the **Use** column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required, and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An ETE category is reserved under the ete-declares-its-own-categories rule. STE Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it with a meaning Waytide does not use. The last of the three is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the `language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note names a term absent from the STE dictionary, and reserves it. A definition exists to name a term, and a term names something in the subject field. A **substitution's Use word** with no STE note is **ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

### The three ways of saying "not now"

**These are the terms most easily confused, and they are confused because nothing has stated them beside each other.** They differ in *what is set aside*, *where it goes*, and *what brings it back*.

- **deferred** — work identified mid-task and postponed until the current task finishes. It is an ordinary **idea** in `waytide/local/ideas/` carrying a `**Waits for:**` line, and it may carry a `**Priority:**` rank. A deferred idea is *waiting its turn*. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **suspended** — something the project **stopped doing** and set aside rather than deleted: a rule that became ceremony, a procedure nobody runs. The thing is **removed**, with a log entry tagged `[suspended]` naming what it cost and what else changed. A suspended thing is *not waiting its turn* — the project has stopped, and the entry states why. **STE: absent. `suspend (v)` is not approved and gives HANG (v), which is physical. Technical noun, ETE engineering, process, and method.**
- **out of scope** — what a **design deliberately excludes**. It is neither queued nor set aside. It is a boundary the design draws around itself, recorded in its trailing **Out of Scope / Deferred** section so a reader knows the omission was chosen rather than overlooked. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**

The distinguishing question: **deferred** is *not yet*, **suspended** is *no longer*, **out of scope** is *not here*.

### The rest

- **distributable rule** — a rule that **ships in a package** and is installed into a consuming project. It is named by a dash-separated, lower-case name and takes **no datetime prefix**, because it is identified by what it says rather than by when it was written. A project receives one by `git subtree`, and a refresh brings a change to it down. **STE: `distributable` is absent from the STE dictionary. `distribute (v)` is not approved and gives APPLY (v), as in APPLY THE LOAD, which is physical. `distribution (n)` is not approved and gives SUPPLY (n). `rule` is absent. Technical noun, ETE agent artifacts.**
- **local rule** — a rule a **project writes for itself**, in `waytide/local/rules/`. It takes the ISO-8601-UTC datetime prefix, because it is a dated decision in that project's history rather than a durable convention identified by its name. `waytide/local/` is never split or pushed, so a local rule cannot leak upstream. **STE: `LOCAL (adj)` is approved, meaning *applicable to a given location or position* — SET THE “LAT” KNOB TO THE LOCAL LATITUDE. Waytide's sense is belonging to one project rather than to a position, so the word is reserved with its meaning fixed here per the ete-fixes-the-meaning-of-a-word-in-its-category rule. `rule` is absent. Technical noun, ETE agent artifacts.**
  - **It is the fourth word ETE fixes the meaning of**, after `loop`, `mechanical`, and `level`. That rule calls this the most expensive reservation ETE makes: a reader who meets an unknown word knows they do not know it, and a reader who meets `local` believes they know it because the dictionary told them.
- **Neither of the two is `system rule`**, which the corpus also uses. `system rule` names **where a rule sits** — under `waytide/system/` in a consuming project, or `system/` in the authoring source. `distributable rule` names **how it travels**. Every distributable rule becomes a system rule once it is installed, and the two words name different facts about it. `system rule` carries no entry here.
- **projection** — a **derived** artifact that reads a record **without destroying it**. A summary generated at read-time is a projection of the decision log. A work session record is a projection of the records it is reconstituted from. The term exists to name the alternative to consolidation: where the impulse is to merge, rewrite, or tidy a record into something more readable, a projection gives the readability and leaves the record as written. A projection is regenerated, never maintained — which is why the record it derives from is **not back-edited** to suit it. **STE: absent from the STE dictionary. Technical noun, ETE evented systems and autonomous components.**
- **reconcile** — to correct the **live, forward-looking** artifacts that cite something which has changed, moved, or been deleted. Reconciling is directed at what points *at* a thing, not at the thing itself, and it is confined to artifacts read as current: an observation, an idea, another deferred item, an implementation record. **Historical records are left as written**, the one exception being a record that discloses what should not have been disclosed. A design is reconciled **against** the records rather than **regenerated from** them: it is a source of truth a plan points back at, so rebuilding it from downstream work would invert the direction of authority. **STE: absent from the STE dictionary. Technical verb, ETE engineering, design, process, and method.**
- **working-state artifact** — a file holding the project's **own work** rather than an installed rule. It is everything under `waytide/local/` except `rules/`: log entries, deferred items, observations, designs, plans, work session records, loop records, feature records, experiments, migration records, and suspended things. The class exists because a single set of obligations falls on all of them: the ISO-8601-UTC filename prefix, and the `Authored by … / Changed by …` provenance footer. **STE: absent from the STE dictionary. Technical noun, ETE agent artifacts.**
- **plain text data attribute line** — a **bold label, a colon, and a value**, optionally as a list item — `- **Priority:** 3`, `**State:** active`, `**Origin:** waytide/system/…`. It is the system's one protocol for content that is read **mechanically** as well as by a person: `session-start.sh` parses these lines. One form in the system rather than a new one per directory. Frontmatter is permitted and would serve equally. It is not used where this form already fits. **STE: absent from the STE dictionary. Technical noun, STE category 15, official documents, parts of documentation, standards, and guidelines.**
- **transfer** — a **technical verb**: to move responsibility for the next act from one party to the other. The agent **transfers responsibility to the engineer** at a hinge, and the engineer **transfers responsibility to the agent** once they make the decision. It names the point a collaborative workflow changes hands, which is not the mechanism that carries it — a `gate` is the mechanism, and the loop `waits` there. **STE: not approved. The STE dictionary gives `MOVE (v)`**, which says nothing about who is answerable next. **Technical verb, ETE engineering, design, process, and method.**
  - **It is never written as a noun.** STE Rule 1.13 forbids a technical verb used as one, so there is no *the transfer of responsibility*. Write the verb — *responsibility transfers to the engineer*. This is the `gate` case in mirror image: that word is a noun and takes no verb form, and this one is a verb and takes no noun form.
- **responsibility** — what transfers: answerability for the next act in the work. **STE: absent from the STE dictionary. Technical noun, ETE engineering, design, process, and method.**
- **free-text option** — the answer the **selection interface** supplies beside the options, where the engineer answers outside the option set. **The harness provides it, so the agent adds none of its own.** It is what keeps a closed list from foreclosing the answer only the engineer can produce, and it is present at every prompt without exception.
  - **It is not the `Explain` option**, which asks what the question **means** rather than answering it. The two serve opposite halves of the moment responsibility transfers, and `Explain` costs one of the four option slots where this one costs none.
  - **An option that names an answer inside the question is not this.** A prompt asking for a time may offer *Enter the time*, and that is a candidate rather than a way out of the option set.
  - **STE: absent from the STE dictionary as a compound. `option (n)` is not approved and gives ALTERNATIVE (n), `FREE (adj)` is approved in an unrelated sense, and `text` is absent. Technical noun, ETE human-computer interaction.**

## Substitutions

Foundation-domain word substitutions. When the impulse is a word in the **Don't use** column, write the **Use** term.

| Use | Don't use | Meaning |
|---|---|---|
| **work session record** | "session record" | the record of a stretch of work — see below |
| **free-text option** | "escape" | the answer the selection interface supplies beside the options — see above for the term, and below for why the figure fails |

### Finer distinctions

- **free-text option** — **`escape` is a figure**, and what it pictures is a closed room. The option set is not closed, since the free-text option is always there, so the word dramatized an ordinary part of the interface as a way out of a trap. **STE: `escape (v)` is not approved and gives DEFLATE (v)**, as in *let the air escape from the tire*.
- **work session record** — always carrying **work**. Bare *session* is ambiguous. A reader can supply a shell session, a therapy session, or a parliamentary one, and the shell reading is the one an engineer reaches first. The qualifier says which sense is meant. This holds in the prompt that offers to write one, and in prose about either. The record's own title is `# Work Session — <name> (<date>)`, and the directory name is `waytide/local/logs/work-sessions/`.

## Discontinuations

A word taken out of use with **nothing in its place**. This is not a substitution — a substitution names two words, and each of these names one.

- **handoff** — the point where the work passed between the engineer and the agent. It is discontinued because `transfer` covers it and is a **verb**, so no word-for-word replacement exists: the sentence is rewritten rather than patched. *The naming gate offers the same handoff as the actuation gate* becomes *the naming gate transfers responsibility the same way the actuation gate does*. This is the case STE Rule 9.1 names: use a different sentence construction where a word-for-word replacement is not sufficient. It is the first one Waytide has recorded.

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
