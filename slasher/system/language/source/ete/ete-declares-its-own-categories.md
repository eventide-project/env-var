# ETE declares its own categories

**Trigger:** When reserving a word or choosing a vocabulary category for a term

**STE's category lists are closed and its word lists are open.** Rule 1.5 says a technical noun is usable *if you can include it in one or more of these twenty-two categories*. Rule 1.12 says the same of a technical verb and *these four categories*. The words inside each category are only examples, and Rule 1.5 states that outright.

**ETE adds five categories, and each holds technical nouns and technical verbs.** They are declared here and nowhere else. An entry names its category and its part of speech, since STE Rules 1.7 and 1.13 turn on which one a word is reserved as.

**Engineering, design, process, and method.** Terms that name how engineering work is conducted, recorded, and set aside, the acts that conduct it, and the parts of a design method. Examples: `hinge`, `gate`, `cradle`, `cycle`, `loop`, `actuation`, `observation`, `efferent`, `solubility`, `subtle`, `load-bearing`, `mean-bias`, `deferred`, `suspended`, `out of scope`, `responsibility`, `transfer`, `reconcile`.

**Reach for STE category 7 before this one**, since it covers concepts, design, calculations, and methodologies.

**Evented systems and autonomous components.** Terms that name the parts of a message-based system, the components that run on their own, and what they do. Examples: `projection`, `entity`, `event`, `stream`, `consumer`, `handler`, `message`, `autonomous component`.

**Agent artifacts.** Terms that name the files an agent and an engineer write and read as they work, and what is done to them. Examples: `working-state artifact`, `implementation record`, `loop record`, `work session record`, `log entry`, `rule file`, `vocabulary`.

**Human-computer interaction (HCI).** Terms that name how a person and a machine work together, and what each of them does. Examples: `attended`, `unattended`, `free-text option`, `selection prompt`, `harness`.

**Deliberation and speech.** Words whose object is a judgment or a statement rather than a thing. Examples: `ask`, `decide`, `choose`, `settle`, `state`, `present`, `observe`, `govern`, `establish`, `explain`.

**This contradicts STE Rule 1.5 and STE Rule 1.12**, each of which closes its list of categories. It contradicts nothing else. A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is.

**Reach for an STE category first.** The twenty-two noun categories hold most of what a software project writes about, and category 7 covers concepts, design, calculations, and methodologies. The four verb categories reach any verb that acts on a thing. An ETE category is for what none of them holds.

**A word is reserved one at a time.** The vocabulary entry names the category and states what the STE dictionary says about the word. A word with no entry is not reserved, and the category is not a standing permission.

**Why:** STE was written for aerospace maintenance documentation, where the reader acts on a machine. Its categories follow from that subject and are complete for it. Slasher's subject is a design method and the decisions a person makes inside it.

Two things fall outside every STE category. The method's own nouns, where category 7 sometimes reaches and sometimes does not. And every verb whose object is a judgment, which none of the four verb categories reaches.

Adding a category is one departure, stated once. Reserving each such word by a separate exemption would be a departure that grows, and the growth would go unrecorded.

**How to apply:** reserve a word in an STE category where one holds it. Where none does, reserve it in an ETE category. Name the category in the word's vocabulary entry. State what the STE dictionary says about the word in the same entry.

## Compressed

1. STE's category lists are closed. Its word lists are open.
2. STE Rule 1.5 admits a technical noun that fits one or more of its twenty-two categories.
3. STE Rule 1.12 admits a technical verb that fits one or more of its four categories.
4. The words listed inside each STE category are only examples.
5. ETE adds five categories. Each one holds technical nouns and technical verbs.
6. The five categories are declared here and nowhere else.
7. An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as.

## Engineering, design, process, and method

1. This category holds terms that name how engineering work is conducted, recorded, and set aside.
2. It also holds the acts that conduct that work, and the parts of a design method.
3. Examples: `hinge`, `gate`, `cradle`, `cycle`, `loop`, `actuation`, `observation`, `efferent`, `solubility`, `subtle`, `load-bearing`, `mean-bias`, `deferred`, `suspended`, `out of scope`, `responsibility`, `transfer`, `reconcile`.
4. Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies.

## Evented systems and autonomous components

1. This category holds terms that name the parts of a message-based system, the components that run on their own, and what they do.
2. Examples: `projection`, `entity`, `event`, `stream`, `consumer`, `handler`, `message`, `autonomous component`.

## Agent artifacts

1. This category holds terms that name the files an agent and an engineer write and read as they work.
2. It also holds terms for what is done to those files.
3. Examples: `working-state artifact`, `implementation record`, `loop record`, `work session record`, `log entry`, `rule file`, `vocabulary`.

## Human-computer interaction (HCI)

1. This category holds terms that name how a person and a machine work together, and what each of them does.
2. Examples: `attended`, `unattended`, `free-text option`, `selection prompt`, `harness`.

## Deliberation and speech

1. This category holds words whose object is a judgment or a statement rather than a thing.
2. Examples: `ask`, `decide`, `choose`, `settle`, `state`, `present`, `observe`, `govern`, `establish`, `explain`.

## Applying the categories

1. This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories.
2. It contradicts nothing else.
3. A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is.
4. Try an STE category first.
5. Use an ETE category only for a word that no STE category holds.
6. Reserve words one at a time. The word's vocabulary entry names the category and states what the STE dictionary says about the word.
7. A word with no entry is not reserved.
8. An ETE category is not a standing permission to use the words that fit it.

## Compression

- 2026-10-28, revised: Why points removed, solubility 76, clarity 1.00; checked: 11 directives, 11 kept, 0 less precise, 0 lost
- 2026-10-29, merge from master re-checked: 22 directives, 21 kept, 0 less precise, 1 lost, 1 repair

## History

Until Sun Oct 25 2026 this rule was titled "ETE declares categories of its own".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the a-word-is-reserved-in-six-steps rule — where steps 4 and 5 of the sequence sit
- the ete-fixes-the-meaning-of-a-word-in-its-category rule — the second departure, and the only other one
- the slasher-keeps-its-word-where-the-ste-word-means-something-else rule — the order the two parts decide in
- the foundation a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved — which vocabulary a term is written in

---

Authored by Scott Bellware on Wed Aug 12 2026 at 8:47:52 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 12:14:07 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 2:04:52 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 12:52:39 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 1:08:26 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:12:36 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:12 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:09:50 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
