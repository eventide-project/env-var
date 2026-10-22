# Initialization

The things below are printed once per session, verbatim and in this order. Four are always printed and one more is printed only where the project has declared a package set.

**The harness prints the four, and the agent prints none of them.** When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`. An agent can skip a display it is told to print, or write it into its thinking, where it is not shown, and nothing reports either. A display the harness prints does not depend on the agent following an instruction.

**The package set is the one part the agent still prints**, at the head of the response that carries the rule read, because it is the one part that needs markdown. See below.

**The script reads the four from this file's fenced blocks, by position.** The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure. The second is the package-set example, which the script skips. **Adding, removing, or reordering a fenced block in this file changes what is printed.** The automated test `test/automated/startup-display.sh` compares the printed display with the expected text, and fails when the two differ.

**The display prints on `load waytide` and on no other prompt.** A session opened with any other request shows no display. That is the cost of the hook acting only on the exact command.

First the title, on its own:

```
Waytide: Human-Agent Relations
```

**It stands alone.** Nothing is printed under it. What the system is belongs to the `README.md`, which a reader reaches deliberately. This display is read every session by someone who has read it before.

**Then the package set, where one is declared.** The agent prints it at the head of the response that carries the rule read, after the harness has printed the display. The display and the stanza come from two printers at two moments, so the stanza follows the display rather than sitting inside it. Where no set is declared, nothing about a set is printed and this part is absent entirely — no line saying there is none.

**The declared set `default` prints nothing, where nothing is deactivated.** `default` is the set a project gets by asking for no set at all, so a stanza reporting it says what the absence of a stanza already says, at the cost of four lines in a display printed every session.

**It prints where `default` leaves something deactivated.** A project can hold a package that `default` does not name — `ext/ruby-lang` is one — and there the set is not the whole of what is installed. The condition is that nothing is off, not that the name is `default`, and a suppressed stanza must never be the reason a deactivated package goes unmentioned.

**A named set other than `default` prints even where nothing is deactivated.** Its name is information about the project that the count cannot supply.

The declaration is supplied by the read instruction, which is what reaches the agent before any file is opened. See the a-project-declares-its-package-set rule for where the record lives and what it carries.

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

**The three lines carry no gap between them.** They are one stanza: what the project holds, what the set is called, and how much of it is in force.

**The list leads and the set's name follows it.** The packages are what the engineer is looking for and the name is what accounts for them, so the name reads as a caption under the thing it explains rather than as a heading over a list nobody has seen yet. It sits above the count for the same reason: the count is arithmetic on the list and closes the stanza.

**The set is named in the engineer's own wording** — `package set: content` — rather than in a restatement of it. It is what they type to declare one, and the line that reports it says the same thing back.

**Every installed package is listed, in the order the session-start notice lists them.** The active ones are bold and the deactivated ones are italic. None is omitted and none is replaced by a count: the engineer is being told what the project holds and which half of it is in force.

**The count line says how many, which the emphasis does not.** Eight names in mixed weight are read one at a time, and the count is read at once. It also states the total, which nothing else on the line does.

**A legend is not printed, and the count is why.** With the count naming five active and exactly five names in bold, the convention discloses itself by arithmetic, and a legend would spend a line saying what the reader has already worked out.

Then **one blank line**, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
```

Then **one blank line**, then the loading line:

```
Loading Waytide will take a few moments.
```

Then **one blank line**, then the block:

```
     __      /
    /  \    /
   |    |  /
    \__/  /
      | =/=
     _|_/
    / |
     / \
    /   \
   /    /
===========
    | |
  __|_|__
 (o)   (o)
```

**Each gap is one blank line.** There are three — after the title, after the license line, and after the loading line. With no gap at all a block reads as a caption attached to what follows, or as its first line, so a separation is needed.

**The harness renders the display as plain text, so the lines print exactly as the blocks hold them.** A blank line is a blank line, and the figure keeps its spacing without a fence. One line is kept because one is what separates.

**The fences in this file are what the script reads, not what is printed.** They mark where each printed part begins and ends. They also keep the figure's spacing when this rule is read as markdown.

**These are the whole of what is printed.** Nothing else accompanies them — no greeting, no account of what is about to be read, no name for the block itself. The package set is the one part that is not always present, and its absence is the ordinary case rather than an omission.

**The loading line says what the wait is.** The display is printed when the engineer types `load waytide`, and the response that follows opens every compiled rule in every installed package. That is a wait an engineer sees. The line names it rather than leaving a pause unexplained. It is the only one at the head that is about the moment rather than about the work.

**It repeats the session-start notice's caveat deliberately, and the two are read at different moments.** The notice says *Loading the rules will take a few moments* **before** the engineer types `load waytide`. It is one of the two facts they weigh in deciding to type it. This line is read **after** they have, while the wait is happening.

The first informs a decision. The second explains a pause. Duplication costs where one fact is stated twice to one reader. This is one fact stated to a reader in two different positions, and removing either leaves that position uncovered.

**It says *Waytide* rather than *the rules*.** The notice can say *the rules* because its preceding line has just named the system. This line stands with a title, a copyright, and a license above it and a figure below, none of which is a sentence. So it names its subject itself.

**The title leads.** It is the first line of the display, and the display is printed before the agent's response begins, so nothing the agent writes can stand ahead of it.

**The title is the category line.** It is what this display prints and what the root `README.md` leads with, so the system names itself the same way wherever it is met.

**No description of Waytide is printed here.** What Waytide is and what it does live in the `README.md`. This display carries a name, a configuration, an ownership statement, and a wait — and nothing that argues for the system to a reader who is already using it.

**The title names the work, so the copyright line does not.** The title stands above it and names the work outright, and the copyright line carries the owner and the year alone.

**Emphasis is available on the package set stanza and nowhere else in this display.** The stanza's bold and italic work because the agent prints it, and the agent's output is rendered as markdown. The display the harness prints is plain text, as the session-start notice is, and markup there reaches the engineer as literal asterisks.

**This surface is where a standing statement belongs, and the notice is not.** A line that never changes stops being read, which is this system's own argument against a permanent segment on the session-start notice. That notice reports what is installed and what is open, and its content moves. This display prints a copyright and a license that never move, once per session, at the one moment the system is announced as itself rather than used. A statement of what the work is sits with them rather than against them.

**The license line sits directly under the copyright, with no blank line between them.** The two are one statement about the work. Who owns it, and on what terms it may be used — and a bare copyright answers only the first while raising the second. For a work distributed by copying its files into other people's repositories, the terms are the question a reader actually has.

**The line is the license's name alone, set in italics.** Leading words such as *Licensed under the* would say what the name's position under the copyright already says, and the name is what a reader looks for. A title, an owner, and a license name are three names.

**The block keeps the line in italics, and the display prints it without them.** The italics hold the license name apart from the copyright above it where this rule is read as markdown, so a reader of the rule sees it as emphasized. The harness prints plain text, so `startup-display.sh` removes the asterisks from a line wrapped in them rather than showing them.

**The gap falls after the license line, never between it and the copyright.** It separates the whole statement, the copyright and the terms together, from what follows. It does not split the statement in two. The gap above the copyright does the same work for the title above it.

**What the printed line is for, and what it is not.** It **points**. The `LICENSE` file **states**. A copy of that file sits at this repository's root and in every package directory. So it travels into each component repository and into every project that installs a package. That is where the license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is printed verbatim, so it does not track the clock and is not computed. It changes when the rule changes.
