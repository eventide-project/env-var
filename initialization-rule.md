# Initialization

Print the things below, verbatim and in this order. Four are always printed and one more is printed only where the project has declared a package set. Print them **once per session, at the head of the response that carries the rule read**. They go above any account of the read, and above every tool call the read makes.

**This rule file is opened ahead of every other**, which is what puts them in hand.

First the title, on its own:

```
Waytide: Human-Agent Relations
```

**It stands alone.** The formulation *Agent harness and ally* sat under it until 2026-08-23, when it was removed — first to the end of the load and then from the display altogether. Nothing replaces it, and nothing is to be put back under the title. What the system is belongs to the `README.md`, which a reader reaches deliberately. This display is read every session by someone who has read it before.

**Then the package set, where one is declared**, after one blank line. It goes here rather than lower because it says what this session is running, and that belongs beside what the system is called rather than after the license. Where no set is declared, nothing about a set is printed and this item is absent entirely — no line saying there is none.

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

**A legend is not printed, and the count is why.** The list carried `**on**  *off*` under it briefly on 2026-08-23. With the count naming five active and exactly five names in bold, the convention discloses itself by arithmetic, and a legend would spend a line saying what the reader has already worked out.

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

**Each gap is one blank line, and a larger one is not available.** There are three — after the title, after the license line, and after the loading line — and a fourth after the package set where one is printed. With no gap at all a block reads as a caption attached to what follows, or as its first line, so a separation is needed.

A wider one cannot be had. The agent's output is **rendered as markdown**, and markdown collapses any run of blank lines between blocks into a single paragraph break. Writing two or three produces exactly what writing one produces. Specifying a count that cannot be observed would be a rule nothing can comply with or violate.

**The block sits in a fenced code block and the notice does not.** The fence is what preserves the figure's spacing. The notice is ordinary prose and reads as prose. That difference is also why the gap between them is the renderer's paragraph break rather than a count of lines. They are two kinds of thing, and the break between them is whatever separates a paragraph from a code block.

**A wider gap is achievable only by giving something up**, and neither cost is worth it. Putting the notice inside the fence with the block would set it in monospace and make it part of the figure. Separating them with lines carrying an invisible character would put marks in the output whose purpose no reader could see.

**These are the whole of what is printed there.** Nothing else accompanies them — no greeting, no account of what is about to be read, no name for the block itself. The package set is the one item at the head that is not always present, and its absence is the ordinary case rather than an omission.

**The loading line says what the wait is.** Everything printed here appears at the head of the response that then opens every rule file in every installed package. That is a wait an engineer sees. The line names it rather than leaving a pause unexplained. It is the only one at the head that is about the moment rather than about the work.

**It repeats the session-start notice's caveat deliberately, and the two are read at different moments.** The notice says *Loading the rules will take a few moments* **before** the engineer types `load waytide`. It is one of the two facts they weigh in deciding to type it. This line is read **after** they have, while the wait is happening.

The first informs a decision. The second explains a pause. Duplication that has cost this system elsewhere was one fact stated twice for one reader. This is one fact stated to a reader in two different positions, and removing either leaves that position uncovered.

**It says *Waytide* rather than *the rules*.** The notice can say *the rules* because its preceding line has just named the system. This line stands with a title, a copyright, and a license above it and a figure below, none of which is a sentence. So it names its subject itself.

**The title leads.** It is therefore the **first text of the read**, which the announce-waytide-at-session-start rule permits unchanged. That rule requires the response opening this file to carry no prose, so that *what this rule carries* comes first. The title is part of what this rule carries.

**The title is the category line.** *Waytide: Human-Agent Relations* was settled as the category line on 2026-08-03. It is what this display prints and what the root `README.md` leads with, so the system names itself the same way wherever it is met.

**Neither the formulation nor the generalized description is printed here.** The four-sentence paragraph *A Generalized Description of Waytide*, settled on 2026-08-20, says what Waytide does, and the formulation said what it is to the two parties. Both live in the `README.md`. This display carries a name, a configuration, an ownership statement, and a wait — and nothing that argues for the system to a reader who is already using it.

**The title names the work, which is why the copyright line no longer does.** That line read `Waytide — Copyright © 2026 Scott Bellware` until 2026-08-21, because a notice printed with no surrounding prose had nothing to attach itself to. The title now stands above it and names the work outright, so the copyright line carries the owner and the year alone.

**Emphasis is available here and not on the session-start notice.** The bold and italic in the package set stanza work because the agent's output is rendered as markdown. They are **not** available on the notice, which the harness renders literally — the announce-waytide-at-session-start rule records what that cost when the notice's own markup reached the engineer as asterisks. Nothing printed here is to be copied there without that in mind.

**This surface is where a standing statement belongs, and the notice is not.** A line that never changes stops being read, which is this system's own argument against a permanent segment on the session-start notice. That notice reports what is installed and what is open, and its content moves. This display prints a copyright and a license that never move, once per session, at the one moment the system is announced as itself rather than used. A statement of what the work is sits with them rather than against them.

**The license line sits directly under the copyright, with no blank line between them.** The two are one statement about the work. Who owns it, and on what terms it may be used — and a bare copyright answers only the first while raising the second. For a work distributed by copying its files into other people's repositories, the terms are the question a reader actually has.

**The line is the license's name alone, set in italics.** It read `Licensed under the Eventide Common Interest License` until 2026-08-23. The three leading words say what the name's position under the copyright already says, and the name is what a reader looks for. A title, an owner, and a license name are three names, and the italics are what hold the third apart from the second rather than reading as a continuation of it.

**Italics rather than a colour.** The startup content is the agent's own text, rendered as markdown, and markdown carries emphasis and no colour instruction. So a lighter weight is what is available on this surface, and it is the same constraint the blank lines below are subject to.

**The gap falls after the license line, never between it and the copyright.** It separates the whole statement, the copyright and the terms together, from what follows. It does not split the statement in two. The gap above the copyright does the same work for whatever precedes it, the title or the package set stanza.

**What the printed line is for, and what it is not.** It **points**. The `LICENSE` file **states**. A copy of that file sits at this repository's root and in every package directory. So it travels into each component repository and into every project that installs a package. That is where the license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is printed verbatim, so it does not track the clock and is not computed. It changes when the rule changes.

---

Authored by Scott Bellware on Wed Aug 5 2026 at 10:47:28 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:08:06 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:30:57 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:44:36 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:53:15 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:57:42 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 4:59:06 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:06:41 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:08:51 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:11:06 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 6:05:55 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 10:51:50 AM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:34:58 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 11:25:15 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 11:39:17 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:09:40 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 4:22:15 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:34:00 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:44:10 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:49:30 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:56:40 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:46:13 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
