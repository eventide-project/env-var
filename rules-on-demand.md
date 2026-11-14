# Clarify explains the previous answer using what the agent knows of the engineer's understanding

Source: system/language/source/clarify-explains-the-previous-answer-using-what-the-agent-knows-of-the-engineers-understanding.md

Trigger: When the engineer asks for an answer to be clarified, as with `/clarify`

1. `/clarify` does what the reply "I don't understand" does. It explains the previous answer again using what the agent knows of the engineer's understanding. It does not shorten the answer or the question.
2. Start from what the agent knows of the engineer's understanding that the answer bears on. It covers the code, the test, the behavior seen, and the engineer's own words. State the point first in those terms, in a sentence or two of plain words. Then give each fact the point rests on, in the same terms, including those the answer left out.
3. Replace each term the answer took for granted with what it names.
4. Where the previous answer put a question, state what the question decides in those terms. Set out each option by what it would and would not do. Recommend one option, with a sentence on why. Put the question again through the selection interface, with the same options.
5. Keep every claim, fact, and decision the engineer was asked to make. Add no new claim. The recommendation is the only addition, and only where the answer put a question.
6. The clarified answer may be longer than the previous one. It still leads with its point and follows the a-response-is-clarified-twice-before-it-is-sent rule in all else.

# A word is reserved in six steps

Source: system/language/source/ete/a-word-is-reserved-in-six-steps.md

Trigger: When asked to reserve a word (e.g. "Slasher reserves the word, X", or `/reserve X`)

1. Reserve a word by following these six steps in order, every time a word is reserved.
2. The instruction that starts the sequence is "Slasher reserves the word, X", or the command `/reserve X`. It names the word and asks for all six steps.
3. The sequence does not have to be spelled out each time a term is settled.
4. Write the verb as `reserves`, and never `claims`.
5. A reservation is made under STE Rules 1.5, 1.6, and 1.12, which let a project add its own technical nouns and verbs.
6. Step 1: look the word up in the STE dictionary. This step is mechanical.
7. The lookup has three outcomes. The word is approved, with the one meaning it may carry.
8. Or the word is not approved, and the dictionary names the approved word that replaces it.
9. Or the word is absent from the STE dictionary.
10. Step 2: ask what the word names. Do not skip this step.
11. If the word is terminology, continue the sequence.
12. If the word is ordinary vocabulary, stop.
13. Step 3: decide noun or verb.
14. A word used both ways takes a category for each. These are two decisions, not one.
15. STE Rule 1.7 forbids a technical noun used as a verb. STE Rule 1.13 forbids a technical verb used as a noun.
16. Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories.
17. Slasher's terms land in noun categories 7, 11, 15, and 19, and verb category 2.
18. Step 5: use an ETE category only where no STE category holds the word.
19. Do not reach step 5 until an STE category has been tried and refused.
20. The five ETE categories are declared in the ete-declares-its-own-categories rule.
21. Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved.
22. The entry gives the definition.
23. The engineer decides the term's category, because a term is a design decision.
24. Put the category to the engineer through the selection UI.
25. Bring the step 1 lookup already done, and name the candidate categories.
26. Steps 4 and 5 are judgment. Step 1 is not.
27. The phrase reserves the word and does not order a sweep.
28. A reservation settles what the word means in Slasher's prose from that point on.
29. Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately.
30. Do not conform existing prose until that separate instruction is given.

# ETE declares its own categories

Source: system/language/source/ete/ete-declares-its-own-categories.md

Trigger: When reserving a word or choosing a vocabulary category for a term

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

# ETE fixes the meaning of a word in its category

Source: system/language/source/ete/ete-fixes-the-meaning-of-a-word-in-its-category.md

Trigger: When reserving a word as a technical noun or verb in a package's vocabulary.md, or writing that reservation's entry

1. The STE dictionary carries no technical nouns. STE Rule 1.8 sends the reader to the company glossary for them.
2. A technical noun takes its meaning from the vocabulary that reserves it.
3. Rules 1.5 and 1.6 reach only a word the dictionary omits or refuses. So an approved word cannot be reserved as a technical noun under them.
4. STE Rule 1.3 requires an approved word to keep the dictionary's meaning and no other.
5. A word reserved in an ETE category takes the meaning its ETE entry gives it.
6. This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning.
7. This contradicts STE Rule 1.3.
8. Mark each word reserved this way in its package's vocabulary.
9. For example, `LOOP (n)` is approved as *a circular shape made in a flexible material*, and Slasher's loop is the DBE cycle.
10. This is the most expensive reservation ETE makes, and the entry carries the cost.
11. The entry quotes the approved meaning.
12. The entry states why the approved meaning does not carry Slasher's.
13. Recast the sentence instead where a different word serves.
14. STE Rule 9.1 covers the case where a word-for-word replacement will not do.
15. This reservation is the last resort, not the first.
16. An entry that does not argue against the approved meaning has not made the reservation.
17. Use the STE dictionary's approved meaning where it serves.
18. Where the approved meaning does not serve but a different word does, recast the sentence under STE Rule 9.1.
19. Reserve the word in an ETE category only where neither serves.

# Ordinary vocabulary is not reserved and not rewritten

Source: system/language/source/ete/ordinary-vocabulary-is-not-reserved-and-not-rewritten.md

Trigger: When reserving a word, or writing or revising a vocabulary entry

1. ETE conforms its terminology to the STE dictionary. It does not conform its ordinary vocabulary.
2. This departs from STE Rule 1.1, which admits only approved words, technical nouns, and technical verbs.
3. What a word names decides which side of the line it falls on.
4. A word that names something in the subject field is terminology. It is either reserved or rewritten.
5. A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary.
6. Example: `branch` is terminology. `under` is not.
7. Words such as `as`, `every`, `never`, `under`, `would`, `already`, and `may` are ordinary vocabulary. They are not technical nouns or verbs in any category.
8. Do not reserve an ordinary-vocabulary word. Reserving it puts a false claim of conformance in a vocabulary. A vocabulary carries no false claim of conformance.
9. Do not rewrite prose to replace an ordinary-vocabulary word.
10. To apply this rule, ask what a refused word names.
11. Reserve the word in a category where it names something in the subject field.
12. Rewrite the prose where an approved word says the same thing.
13. Leave the word in place where it is ordinary vocabulary.
14. Record no entry for an ordinary-vocabulary word.

# Reprint-and-review prints the draft and a review of it

Source: system/language/source/reprint-and-review-prints-the-draft-and-a-review-of-it.md

Trigger: When the engineer types `/reprint-and-review` or `/rr`, or asks for the draft to be reprinted and reviewed

**Trigger:** When the engineer types `/reprint-and-review` or `/rr`, or asks for the draft to be reprinted and reviewed

**`/reprint-and-review` prints the draft as it now stands, then a review of it.** `/rr` is its shortcut alias. The draft is the text the conversation is working on, such as an article, a page, a message, or a rule, with every change made to it so far. `/rr <file>` names a file, and the draft is that file's text.

**As the engineer stated it:** "/reprint-and-review" command with a "/rr" shortcut alias. This is useful typically in content editing when working a draft of a text. It asks the agent to reprint the text so far, and to follow it with a review or critique.

**The draft is printed whole and unchanged.** Print it as it stands, in a fenced block where it is markdown or code, so its form is seen as written. Do not correct it while printing it.

**The review follows the draft, as a numbered list of findings, most important first.** Each finding quotes the passage it is about, says what is wrong with it, and suggests a change in the words the change would use. The numbers are handles, so the engineer can answer *take 2 and 4*.

**The review judges the draft by its purpose and its reader.** It asks whether the draft says what it means to, in the order a reader needs, in words the reader holds. Where the draft is Slasher's own prose, such as a rule or a record, it is also judged by the `language` package's rules. Where nothing needs to change, say so in one line, and give no findings to fill the list.

**The command changes nothing.** It does not edit the draft or its file. The engineer decides which findings to act on, and asks for the change.

**Where no draft is under way, and no file is named, say so, and ask which text is meant**, through the free-text option.

**Why:** a draft worked on in conversation is changed a piece at a time, and its whole is not seen again until it is asked for. Seeing the whole and a critique of it together lets the engineer judge the next change against the text as it is, not as remembered.

**How to apply:** on `/reprint-and-review` or `/rr`, find the draft, or read the file named. Print it whole and unchanged. Then give a numbered list of findings, each quoting its passage, naming what is wrong, and suggesting the change. Change nothing.
