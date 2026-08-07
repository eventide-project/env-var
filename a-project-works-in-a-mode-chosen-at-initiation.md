# A project works in a mode, chosen at its initiation

A Waytide project works in one of three **modes**, chosen when the project is initiated and held
for its life. The mode decides what the project's two planning artifacts are **called** and
**where they live**:

| Mode | The direction artifact | The sequencing artifact |
|---|---|---|
| **formal** (the default) | a **design**, in `waytide/local/design/` | a **plan**, in `waytide/local/plans/` |
| **intuitive** | an **aspiration**, in `waytide/local/aspiration/` | an **intention**, in `waytide/local/intention/` |
| **OODA** | an **orientation**, in `waytide/local/orientation/` | an **action**, in `waytide/local/action/` |

The pairing is on a near/far axis: a design, an aspiration, and an orientation all answer *what
are we going toward*; a plan, an intention, and an action all answer *what are we going to do*.

**Write *an intuitive-mode project*, never *an intuitive project*.** In this field *intuitive*
means **easy to use**, and a reader meets that sense first. The compound **intuitive mode** does
not collide with it — the noun it qualifies is a way of working rather than a thing to be used —
but **an intuitive project** reads as *a project that is easy to understand*, which is a claim
this rule never makes. The collision lands on the noun phrase alone, so the whole of the remedy
is to keep *mode* in it. Named for the finding that established it: the intuitive-mode experiment,
affirmed 2026-08-05.

## OODA mode borrows the loop's vocabulary, and names two phases rather than four

**The words are the system's own.** The design-by-efferent vocabulary already builds on Boyd's
OODA loop — Observe, Orient, Decide, Act — and holds that Orient dominates it, which is why the
human owns that phase. **Orientation** and **action** are drawn from there rather than imported.

**The mode's name is not a promise of four artifacts.** A reader who knows the loop will ask where
Observe and Decide went, and the answer is that neither produces a **planning** artifact:

- **Observe** is the agent surfacing state — the proposed actuation, the candidate options, the
  run result. It is shown, not written down as a plan.
- **Decide** happens at a gate, in the moment. It *is* recorded — in the decision log and in loop
  records — but those are not planning artifacts and do not vary by mode. They are the same files
  in a formal project as in an OODA one.

So the mode takes the loop's two **poles of intent** and leaves its other two phases where they
already live. It is not a phase-by-phase mapping of artifacts onto the loop, and reading it as one
is what produces the expectation of four.

**The pair straddles the human/agent split deliberately.** In the loop's own table Orient is the
human's phase and Act is the agent's. The planning artifacts are not divided that way, because the
pairing is on the **near/far** axis every mode shares — what are we going toward, what are we going
to do — rather than on who performs the phase.

**Here the two words are concrete, not covering.** *An orientation* and *an action* are this mode's
working words, exactly as *a design* is formal mode's. They are unrelated to the covering terms —
**the direction artifact** and **the sequencing artifact** — which name the class across all three
modes and are not any mode's vocabulary. The distinction was settled by the OODA terminology
experiment, refuted 2026-08-05, which established that a covering term is judged on abstraction and
that a term carrying one method's framing is less abstract than one that does not.

## The conventions are the same in every mode

**The mode changes the vocabulary and the directory. It changes no obligation.** An aspiration and
an orientation are each written exactly as a design is — the same spine, the same dated **Settled**
resolutions, the same **Out of Scope / Deferred** tail. An intention and an action are each written
exactly as a plan is, with the same elements in the same order and the same behavior-stated
checkbox tasks. An intention is **superseded** by a later intention, and an action by a later
action, precisely as a plan is, and their tasks are completed or not completed exactly as a plan's
are.

So there are no separate conventions and no separate document formats. The design-convention,
plans-convention, design-document-format, and plan-document-format rules govern every mode.

**Why a mode that changes no obligation is worth having.** Because a word is not a label applied
to a thought after the fact — it is the thought's working surface, and choosing a word chooses a
concept. That is the `language` package's premise, and the rules-install-a-mindset rule states
the same thing from the other side: a large share of what a rule does is install a **stance**,
and vocabulary is the most direct lever on a mental model. A developer writing an *aspiration*
is doing something different from a developer writing a *design*, and the difference is in them
rather than in the document. The mode is that lever, applied at the scale of a whole project
rather than a single term.

**What this deliberately gives up.** The idea began with a stronger claim — that an intention
needs no supersession, and that an aspiration is not measured by completion the way a plan is.
Identical conventions abandon that claim. The modes are a vocabulary and a location, and the
machinery beneath them is one machinery.

## How another rule refers to these artifacts

**A rule that is *about* one of these artifacts names every mode's.** The design-convention,
plans-convention, design-document-format, plan-document-format, and plans-no-code-samples rules
each govern one of the pair, so a reader needs the concrete names in front of them; a rule whose
whole subject is the sequencing artifact cannot coherently decline to say what it is called.

**A rule that merely *mentions* one of them generalizes.** It says **the direction artifact** or
**the sequencing artifact** — the terms this rule's own table is headed with — or **the project's
planning directories** where the pair is meant collectively. It does not name
any mode's directory, and it does not name every pair either.

**Both terms end in *artifact*, and that is load-bearing.** They name a **class of file** so a
rule can state an obligation across the pair — the same job **working-state artifact** does for
the log entries, designs, and experiments it spans, and nobody writes one of those either; they
write a deferred item. The trailing class noun is what keeps a covering term from becoming a word
the work is **done in**.

**So neither term is shortened to a bare noun.** *Direction* and *sequencing* alone would be
sayable — *"I'm writing the direction"* — and a sayable, mode-neutral name for the artifact is a
**fourth planning vocabulary**, available in every mode. Adopting it would erase the difference
this rule exists to create, and the mode would survive as a directory name while ceasing to be a
stance. The phrases read clumsily in a sentence about doing the work, and that is the property
being kept, not a cost being tolerated: a rule says *the direction artifact* **about** the work,
and a developer says *aspiration* or *design* **while** doing it.

**Why generalize rather than name every mode everywhere.** Two reasons, and the second is the
stronger:

- **Consistency.** Naming every pair in every rule that touches them puts the mode in as many
  places as there are such rules, and nothing checks that a new one complies. A rule naming only
  `plans/` reviews, publishes, and installs cleanly, and is simply wrong in an intuitive-mode
  project until someone follows it into a directory that does not exist.
- **Resilience in a consuming project.** An installed rule that encodes concrete directory names
  is wrong the moment Waytide changes them, and stays wrong until that project refreshes. A rule
  written in the general terms **survives the change**: what the terms bind to lives in one
  place — this rule and the project's own mode rule — so an upstream change moves one file rather
  than every file that mentioned a path. The fewer specifics an installed rule carries, the less
  of it can go stale between refreshes.

**What this gives up, stated plainly.** A rule that says *the sequencing artifact* tells a reader
what governs but not where their own project keeps things; they reach this rule, or their
project's mode rule, to resolve it. That self-evidence at every site is real and is being traded
away deliberately, on the judgment that it is not achievable at scale while remaining
maintainable.

## The choice is the agent's to put, and it is put at initiation

**Through the selection interface**, per the present-every-prompt-through-askuserquestion rule,
with **formal as the default**.

**Where no mode rule is present, the selection prompt is displayed at once, and the response
carries the prompt and nothing else.** No preamble, no report that the mode has never been
chosen, no account of what the read surfaced, and no citation of this rule. The agent does not
offer to ask and does not wait for a further instruction before asking.

**Two failures are forbidden here and only one of them is obvious.** Announcing the occasion and
stopping leaves the project uninitiated until a second instruction arrives, and spends a turn on a
non-decision — a developer told that a question could be asked has no answer to give but *yes*.
The subtler one is **announcing and then asking in the same response**: the prompt arrives, so
nothing is blocked, and the developer still has to read an explanation of why they are being asked
before reaching the question. The prompt states what it needs; a preamble in front of it is the
agent reasoning where the developer wanted a choice.

This is the same reasoning the `design-by-efferent` never-ask-to-start-test-first rule applies to
its own settled default: asking whether to ask confirms what is already decided. It is also the
shape the announce-waytide-at-session-start rule requires of the response that opens the
initialization rule — the tool call and nothing else — for the same reason, that a line of the
agent's narration stands where the thing itself should be.

**Say "ask", not "put".** *Put* in the sense of *pose* is archaic, and a developer meets the
everyday sense first, where it says nothing about what will happen — the same objection the
present-every-prompt rule makes to *put this question again* in an option description. It holds in
speech to the developer as well as in an option's wording. This rule's own headings still read
*put*, which is the older idiom and is being left rather than swept.

**The question is asked in these words:**

> Select the mode for this project. The behavior and functioning of Waytide isn't affected by the
> mode. The mode only sets the process vocabulary for the project, and the names of the
> directories where planning records are stored.

**The wording is fixed because the developer meeting this choice cannot yet know what it
decides.** It is put at a project's initiation, before any of this system's material has been
worked with, so a mode named alone — *formal, intuitive, or OODA* — reads as a choice about how
the system will **behave**: how strict it is, how much ceremony it imposes, what it will require.
Every one of those readings is wrong, and a developer holding one of them chooses on grounds that
do not exist. Saying outright that behavior and functioning are unaffected removes the wrong
question before it is asked, and naming what the mode **does** settle — the process vocabulary,
and the directories planning records are stored in — leaves the developer weighing the thing
actually in front of them.

**It does not restate the case for the modes**, which is the argument above about a word being a
thought's working surface. That is what the `Explain` option is for. The question says what the
choice governs; the explanation says why it is worth making.

**Each option names its mode's two artifacts and their directories**, and nothing else. The
developer is choosing a vocabulary and a pair of locations, so those are what the options carry.

**`install.sh` cannot do this**, and neither can any other script. The selection interface is an
agent-side tool and the installer is a POSIX `sh` script run from a shell; a script has no way to
reach it. The mode is therefore something the **agent** establishes, not a step in an
installation. Nor is it the concern of a tool that reaches existing projects — those are already
initiated.

## The mode is recorded as a local rule named for it

The chosen mode is written into `waytide/local/rules/` as a rule named **`formal-mode`**,
**`intuitive-mode`**, or **`ooda-mode`**, carrying the ISO-8601-UTC filename prefix every local rule takes (see the
file-names rule) — `2026-08-05T06-30-25Z-intuitive-mode.md`. It states that the project operates
under that mode and which conventions are therefore active.

**It is a local rule rather than a setting** because that is what it is: a binding convention of
the project, read unconditionally at the start of every session along with every other rule. No
new mechanism carries it, and nothing has to be taught to read it.

**The filename alone carries the mode**, which is what lets both checks below work without the
file being opened.

**The mode rule is committed, and a decision-log entry is written with it.** Writing the file is
not the whole of recording the mode, and neither obligation is new — the rules-convention already
requires a matching `waytide/local/log/` entry for every new local rule, and the
decision-log-convention already requires a log entry to be committed with the change it describes.
They are restated here because this is the rule an agent reads at the moment a mode is chosen, and
a rule that says only *write the file* is followed exactly as far as it is written.

- **The log entry** states which mode was chosen, in the log's one-line form. The mode rule
  records that the project is in a mode; the log entry records that the choice was made and when,
  which is the trail every other decision in the project leaves.
- **The commit** carries both. An uncommitted mode rule is a mode that exists on one machine — the
  project's own convention, invisible to everyone who clones it and to every check that reads it,
  which is the same failure an uncommitted executable bit produces on a script.

**This lands at the least convenient moment, which is why it is stated.** A mode is chosen at
initiation, when a project is new and often has nothing else in it, so the mode rule and its log
entry are frequently the project's first substantive commit rather than an addition to work
already in flight.

- **A rule is written whichever mode is chosen.** Formal is the default, not the silent case.
- **An absent mode rule means the question has never been asked** — not that the project is
  formal. The agent asks, once, and writes the rule.
- **The mode is not inferred from which directories exist.** That reasoning is circular: the
  first aspiration cannot be placed until the mode is known, the directory exists only once
  something is in it, and git does not track an empty directory.

## What the mode rule says

**One template, filled.** The three possible files differ only in the mode name, the two artifact
names, and the two directories — so the text is not composed at initiation, it is substituted.
Nothing in it is specific to the project beyond that, and the developer is not asked for a
reason: the file is one of exactly three documents in the system, apart from its date and its
provenance footer.

**Only the first paragraph binds.** A local rule is a **dated snapshot** — the file-names rule
calls it a dated decision in that project's history — so the explanation below the binding claim
states the system as it stood at that project's initiation and is not obliged to track this rule
afterward. That is safe precisely because the binding part **cannot go stale**: it says which
mode *this project* is in, and a project's mode does not change. Only the restated system
substance could drift, and it binds nothing, so a drift is a stale explanation rather than two
binding rules in conflict.

Filled for intuitive mode:

```markdown
# This project works in intuitive mode — its planning artifacts are an aspiration and an intention

**What this rule binds:** this project works in **intuitive mode**. Its direction artifact is
an **aspiration**, in `waytide/local/aspiration/`, and its sequencing artifact is an
**intention**, in `waytide/local/intention/`. `waytide/local/design/` and
`waytide/local/plans/` are not used here. That is the whole of what this file binds, and it
is fixed — a project's mode does not change after initiation.

**Everything below explains the mode and binds nothing.** It is written out so this file
stands on its own, and it describes the system as it stood when this project was initiated,
which is the date in this filename. Waytide's own `a-project-works-in-a-mode-chosen-at-initiation`
rule holds the system's account.

**The three modes.** A Waytide project works in one of three, chosen at its initiation. Under
**formal**, the default, the artifacts are a **design** and a **plan**, in
`waytide/local/design/` and `waytide/local/plans/`. Under **intuitive** they are an
**aspiration** and an **intention**, in `waytide/local/aspiration/` and
`waytide/local/intention/`. Under **OODA** they are an **orientation** and an **action**, in
`waytide/local/orientation/` and `waytide/local/action/`. The first of each pair answers
*what are we going toward*; the second answers *what are we going to do*.

**The conventions are identical in every mode.** An aspiration is written exactly as a design
is, an intention exactly as a plan is — the same document shapes, the same dated **Settled**
resolutions, the same behavior-stated checkbox tasks, the same supersession. The mode changes
the vocabulary and the directory and no obligation. The design-convention,
plans-convention, design-document-format, and plan-document-format rules govern every mode.

**Why a mode that changes no obligation is worth having.** A word is not a label applied to a
thought after the fact — it is the thought's working surface, so choosing a word chooses a
concept. A developer writing an *aspiration* is doing something different from one writing a
*design*, and the difference is in them rather than in the document.

**Why:** the words a project plans in are load-bearing, so which pair it uses is a binding
convention rather than a preference, and it belongs where the project's binding conventions
are read.

**How to apply:** write this project's settled direction as an aspiration in
`waytide/local/aspiration/` and its sequencing as an intention in `waytide/local/intention/`,
following the four planning rules unchanged. Do not use `waytide/local/design/` or
`waytide/local/plans/` here.
```

**The other two fills substitute their own mode's terms throughout** — for formal, *formal mode*,
*a design* in `waytide/local/design/`, *a plan* in `waytide/local/plans/`, and the unused
directories named; for OODA, *OODA mode*, *an orientation* in `waytide/local/orientation/`, *an
action* in `waytide/local/action/`, and likewise. The formal fill restates the default at length,
which every other rule already describes; that is the accepted cost of one template rather than
three shapes.

**The title states the mode and its consequence**, rather than either alone. The filename already
carries the mode, so a title repeating only that would state a label a reader cannot act on;
a title carrying only the directories would leave the word *intuitive* nowhere in the line a
person scanning `waytide/local/rules/` actually reads.

**The provenance footer is the ordinary one**, per record-rule-authorship-in-a-footer.

## The planning directories corroborate the rule

**A project's directories are evidence, and they are checked against the mode rule.** A mode's
planning directory holding anything in a project carrying a different mode's rule — or no mode
rule at all — is a **contradiction**, not a project in the default mode. So is a mode rule in a
project where only some other mode's directories hold anything.

**A contradiction is surfaced and never resolved by assumption.** The agent says what it found and
asks; it does not pick a mode and proceed.

**The failure this exists to prevent** is a project whose mode rule is accidentally deleted.
Without the check, its absence would read as formal, and the agent would write designs and plans
into `design/` and `plans/` while the project's own mode directories held its actual planning
artifacts — the project's planning split across two vocabularies, working incorrectly, with
nothing announcing it.

## The session-start notice does not report the mode

**And the reason is not that it could not.** The mode rule's **filename** carries the mode, so
`session-start.sh` could find it with the same kind of directory read it already performs for the
installed packages. Declining is a judgment rather than a limitation.

**The notice reports live or open state, and a mode is neither.** What is installed changes on an
install or a refresh; the experiments and features it names are the ones that have **not
concluded**, and the notice "grows only when there is something open". A project's mode is
settled once and never changes, so a line reporting it would be identical every session for the
life of the project — which is exactly the failure the announce-waytide-at-session-start rule
names in keeping the deferred queue out of the notice: a line that is always present is read once
and never again.

**Where the mode is legible instead** is where every binding convention is: the rules the agent
reads at the start of the session, one of which is the mode rule itself.

## The mode does not change after initiation

A project's mode is settled when the project is initiated and is not switched later. What would
be involved in changing it — what becomes of artifacts written under the other mode, and whether
the two can coexist — is deliberately unaddressed rather than answered badly.

**Why:** the modes exist because the words a project plans in are load-bearing, and a project
that can drift between them gets the cost of every vocabulary and the benefit of none.
Recording the mode as an ordinary local rule keeps it where binding conventions already live and
adds no mechanism to the system. Writing the rule in every mode is what makes an absent rule
mean something precise, and corroborating it against the directories is what keeps a deleted rule
from silently reverting a project to a mode it is not in — the same stance the rest of the system
takes toward ambiguous input, which is to refuse it rather than to guess.

**How to apply:** at a project's initiation, put **formal, intuitive, or OODA** to the developer
through the selection interface, with formal as the default, asking it in the words fixed above —
that the behavior and functioning of Waytide are unaffected and the mode sets the process
vocabulary and the planning directories — with each option naming its mode's two artifacts and
their directories. Write the chosen mode into
`waytide/local/rules/` as a `formal-mode`, `intuitive-mode`, or `ooda-mode` rule with its datetime
prefix, write a matching one-line `waytide/local/log/` entry naming the mode chosen, and commit
both. Where
no mode rule is present, display the selection prompt at once, in a response carrying the prompt
and nothing else — no preamble, no report of the absence, no citation of this rule. The absence is
a question never asked, not a default, and finding it is the occasion to ask. Check the
planning directories against the rule and surface any contradiction rather than assuming a mode.
Work the directories the mode names, applying the same conventions and document formats in
either. In a rule that merely mentions one of the artifacts, write **the direction artifact** or
**the sequencing artifact**, keeping the trailing class noun — do not shorten either to a bare
`direction` or `sequencing`, which would be a third planning vocabulary. Write **an
intuitive-mode project**, never **an intuitive project**. Do not switch a project's mode after
initiation. Related: the design-convention and
plans-convention (the directories, both named in each), the design-document-format and
plan-document-format rules (the shapes, identical in every mode), the rules-convention (where a
local rule lives and what it looks like), the file-names rule (the datetime prefix), the
`language` package's language-is-precise-here rule and this package's rules-install-a-mindset rule
(why a vocabulary change is a real change), and the present-every-prompt-through-askuserquestion
rule (why the choice is put through the selection interface).

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:16:03 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:18:14 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:57:02 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 10:13:17 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 3:25:24 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:15:51 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 9:44:31 PM PT
