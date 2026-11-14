# The startup display prints as the session starts

**Trigger:** When a session starts, or the engineer types its first prompt, or when changing the startup display or its script

The things below are printed verbatim, in two parts. **The session-start part** prints as the session starts: the title and the copyright and license ahead of the session-start notice, and the load line after it, last. **The loading part** prints on the session's first prompt, whatever the prompt is, since that is when the rules are read: the loading line, then the figure. Five things are always printed, in the order this file gives them. After a compaction the session-start part is not printed, and one line stands in its place, per the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule. The package set is printed only where the project has declared one, and it prints after the loading part, whatever its place in this file.

**The harness prints the five, and the agent prints none of them.** As the session starts, the Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`, which prints the title and the copyright and license ahead of the session-start notice, and the load line after it, in the one `systemMessage`. It takes the title and the license from `startup-display.sh message`, and the load line from `startup-display.sh load-line`, each of which prints its blocks alone. On every prompt, the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh`, which prints the loading part as a `systemMessage` on the session's first prompt and nothing after. An agent can skip a display it is told to print, or write it into its thinking, where it is not shown, and nothing reports either. A display the harness prints does not depend on the agent following an instruction.

**The package set is the one part the agent still prints**, at the head of the response that carries the rule read, because it is the one part that needs markdown. See below.

**The script reads the five from the fenced blocks of this rule's body, in its source file, by position.** It stops at the `## Compressed` heading, so the compressed text's blocks are not counted. The first, third, and fourth fenced blocks are the title, the copyright and license, and the load line: the session-start part. The fifth and sixth are the loading line and the figure: the loading part. The second is the package-set example, which the script skips. **Adding, removing, or reordering a fenced block in this rule's body changes what is printed.** The automated test `test/automated/startup-display.sh` compares the printed display with the expected text, and fails when the two differ.

**The loading part prints once per session, on the first prompt.** The first prompt is when the read starts, whether it is `/load`, `load rules`, or any other request. The script records the session's first prompt in a marker named for the session, under the temporary directory, and prints nothing on a later prompt. A prompt whose input names no session prints the loading part every time, rather than never.

First the title, with the tagline under it:

```
Slasher: Human in the Loop Harness

The engineer decides. The agent generates. Humanity rules.
```

**The tagline stands under it, and nothing else does.** The tagline is the line the root `README.md` gives under its title. No other subtitle or description is printed under it. What the system is belongs to the `README.md`, which a reader reaches deliberately. This display is read every session by someone who has read it before.

**The package set is described here, and prints after the display, where one is declared.** The agent prints it at the head of the response that carries the rule read, after the harness has printed the display. The display and the stanza come from two printers at two moments, so the stanza follows the display rather than sitting inside it. Where no set is declared, nothing about a set is printed and this part is absent entirely — no line saying there is none.

**The declared set `default` prints nothing, where nothing is deactivated.** `default` is the set a project gets by asking for no set at all, so a stanza reporting it says what the absence of a stanza already says, at the cost of four lines in a display printed every session.

**It prints where `default` leaves something deactivated.** A project can hold a package that `default` does not name — `ext/ruby-lang` is one — and there the set is not the whole of what is installed. The condition is that nothing is off, not that the name is `default`, and a suppressed stanza must never be the reason a deactivated package goes unmentioned.

**A named set other than `default` prints even where nothing is deactivated.** Its name is information about the project that the count cannot supply.

The declaration is supplied by the read instruction, which is what reaches the agent before any file is opened. See the a-project-declares-which-installed-packages-are-active rule for where the record lives and what it carries.

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

The load line follows the session-start notice, after **one blank line**, and ends the session-start message:

```
Slasher's rules will load on the first prompt, or enter: /load
```

The loading part prints on the session's first prompt. First the loading line:

```
Slasher is pre-loading its rules... this could take a minute
```

Then **one blank line**, then the block, which ends the loading part:

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

**Each gap is one blank line.** In the session-start part there are three — after the title, after the license line, and ahead of the load line, after the notice. In the loading part there is one — after the loading line. With no gap at all a block reads as a caption attached to what follows, or as its first line, so a separation is needed.

**The harness renders the display as plain text, so the lines print exactly as the blocks hold them.** A blank line is a blank line, and the figure keeps its spacing without a fence. One line is kept because one is what separates.

**The fences in this file are what the script reads, not what is printed.** They mark where each printed part begins and ends. They also keep the figure's spacing when this rule is read as markdown.

**These are the whole of what is printed.** Nothing else accompanies them — no greeting, no account of what is about to be read, no name for the block itself. The package set is the one part that is not always present, and its absence is the ordinary case rather than an omission.

**The load line says when the rules load, and how to load them now.** It ends the session-start message, after the notice, so it is what the engineer reads last before typing. It states the one fact the engineer needs before the first prompt: the rules load on that prompt, whatever it is, and `/load` loads them with no other request. The session-start notice has no close of its own, because this line says what a close said. The plugin that prints it carries the `/load` skill, so the command it names is always available.

**It says *Slasher's rules*.** It stands under a title, a copyright, and a license, none of which is a sentence, so it names its subject itself.

**The loading line says what the wait is.** It prints on the first prompt, as the read starts, and the response that carries the read loads every installed package's rules. That is a wait an engineer sees. The line names it rather than leaving a pause unexplained, and the figure under it fills the wait.

**The title leads.** It is the first line of the display, and the display is printed before the agent's response begins, so nothing the agent writes can stand ahead of it.

**Each part opens with a line break, so its first line starts a line of its own.** The harness prints its own label ahead of a hook's message, as in `SessionStart:startup says:`. Without the break, the first line runs on from that label as though the two were one sentence. **Each part opens with one more**, so a blank line stands between the label and the part's first line: the title, or the loading line. The breaks are the script's, and they are not fenced blocks in this file.

**The title is the category line.** It is what this display prints and what the root `README.md` leads with, so the system names itself the same way wherever it is met.

**No description of Slasher is printed here, beyond the tagline.** What Slasher is and what it does live in the `README.md`. This display carries a name, an ownership statement, when the rules load, and a wait — and nothing that argues for the system to a reader who is already using it.

**The title names the work, so the copyright line does not.** The title stands above it and names the work outright, and the copyright line carries the owner and the year alone.

**Emphasis is available on the package set stanza and nowhere else in this display.** The stanza's bold and italic work because the agent prints it, and the agent's output is rendered as markdown. The display the harness prints is plain text, as the session-start notice is, and markup there reaches the engineer as literal asterisks.

**This surface is where a standing statement belongs, and the notice is not.** A line that never changes stops being read, which is this system's own argument against a permanent segment on the session-start notice. That notice reports what is installed and what is open, and its content moves. This display prints a copyright and a license that never move, once per session, at the one moment the system is announced as itself rather than used. A statement of what the work is sits with them rather than against them.

**The license line sits directly under the copyright, with no blank line between them.** The two are one statement about the work. Who owns it, and on what terms it may be used — and a bare copyright answers only the first while raising the second. For a work distributed by copying its files into other people's repositories, the terms are the question a reader actually has.

**The line is the license's name alone, set in italics.** Leading words such as *Licensed under the* would say what the name's position under the copyright already says, and the name is what a reader looks for. A title, an owner, and a license name are three names.

**The block keeps the line in italics, and the display prints it without them.** The italics hold the license name apart from the copyright above it where this rule is read as markdown, so a reader of the rule sees it as emphasized. The harness prints plain text, so `startup-display.sh` removes the asterisks from a line wrapped in them rather than showing them.

**The gap falls after the license line, never between it and the copyright.** It separates the whole statement, the copyright and the terms together, from what follows. It does not split the statement in two. The gap above the copyright does the same work for the title above it.

**What the printed line is for, and what it is not.** It **points**. The `LICENSE` file **states**. A copy of that file sits at this repository's root and in every package directory. So it travels into each component repository and into every project that installs a package. That is where the license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is printed verbatim, so it does not track the clock and is not computed. It changes when the rule changes.

## Compressed

1. The display prints verbatim in two parts. The session-start part prints as the session starts: the title and the copyright and license ahead of the session-start notice, and the load line after it, last. The loading part, the loading line and then the figure, prints on the session's first prompt, whatever it is. These five are always printed, in this file's order.
2. The package set is printed only where the project has declared one, after the loading part.
3. The harness prints both parts. The agent prints none of them.
4. As the session starts, the Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`, which prints the title and the copyright and license ahead of the session-start notice and the load line after it, in one `systemMessage`. It takes them from `startup-display.sh message` and `startup-display.sh load-line`, each of which prints its blocks alone.
5. On every prompt, the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh`, which prints the loading part as a `systemMessage` on the session's first prompt only. A marker named for the session, under the temporary directory, records that the first prompt has passed. A prompt that names no session prints the loading part every time.
6. The agent prints the package set, at the head of the response that carries the rule read.
7. The script reads the five from the fenced blocks of this rule's body, in its source file, by position. It stops at the `## Compressed` heading.
8. The first, third, and fourth fenced blocks are the title, the copyright and license, and the load line. The fifth and sixth are the loading line and the figure.
9. The second fenced block is the package-set example, which the script skips.
10. Adding, removing, or reordering a fenced block in this rule's body changes what is printed, so the rule's sections stay where they are.
11. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ.
12. The fences mark where each printed part begins and ends. They are not printed.
13. First the title, with the tagline under it:

```
Slasher: Human in the Loop Harness

The engineer decides. The agent generates. Humanity rules.
```

14. The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it.
15. Each part opens with a line break, so its first line starts a line of its own after the harness's label, as in `SessionStart:startup says:`. Each part opens with one more, so a blank line stands between the label and the part's first line: the title, or the loading line. The breaks are the script's, not fenced blocks in this file.
16. The tagline stands under the title, as the root `README.md` gives it. No other subtitle or description is printed under it.
17. The title is the category line. The root `README.md` leads with the same line.
18. No description of Slasher is printed, beyond the tagline. What Slasher is and does belongs to the `README.md`.
19. The display carries nothing that argues for the system to a reader already using it.
20. The package set is described here, and prints after the display, where one is declared. The agent prints it after the harness has printed the display.
21. The stanza follows the display rather than sitting inside it.
22. Where no set is declared, this part is absent entirely. No line says there is none.
23. The declared set `default` prints nothing where nothing is deactivated.
24. The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`.
25. The condition is that nothing is off, not that the name is `default`.
26. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
27. A named set other than `default` prints even where nothing is deactivated.
28. The declaration is supplied to the agent by the read instruction, before any file is opened. The a-project-declares-which-installed-packages-are-active rule says where the record lives and what it carries.
29. The stanza takes this form:

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

30. The stanza's lines carry no gap between them.
31. The package list leads. The set's name follows it, above the count. The count closes the stanza.
32. The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it.
33. Every installed package is listed, in the order the session-start notice lists them.
34. Active packages are bold. Deactivated packages are italic.
35. No package is omitted, and none is replaced by a count.
36. The count line states how many are active and the installed total, in the form `(N active of M installed)`.
37. No legend is printed.
38. Emphasis is available on the package set stanza and nowhere else in the display.
39. The harness display is plain text, where markup reaches the engineer as literal asterisks.
40. Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
```

41. The copyright and license belong on this display, not on the session-start notice. Any standing statement that never changes belongs here, not as a permanent segment of the notice.
42. The copyright line carries the owner and the year alone. It does not name the work.
43. The license line is the license's name alone, set in italics. It takes no leading words such as *Licensed under the*.
44. The block keeps the license line in italics. `startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them.
45. The gap falls after the license line, never between it and the copyright.
46. The printed license line points to the license. It does not carry the terms, and is not the place to put them.
47. The `LICENSE` file states the terms. A copy sits at this repository's root and in every package directory.
48. The year is the year of the notice, not of the session. It is written into this rule and printed verbatim.
49. The year is not computed. It changes only when the rule changes.
50. The load line follows the session-start notice, after one blank line, and ends the session-start message:

```
Slasher's rules will load on the first prompt, or enter: /load
```

51. The load line states that the rules load on the first prompt, whatever it is, and that `/load` loads them now. It names its subject, *Slasher's rules*, itself. The plugin that prints it carries the `/load` skill, so the command it names is always available.
52. The session-start notice has no close of its own. The load line says what a close said.
53. The loading part opens with the loading line, which names the wait for the read:

```
Slasher is pre-loading its rules... this could take a minute
```

54. Then one blank line, then the block, which ends the loading part:

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

55. Each gap is one blank line: after the title, after the license line, and ahead of the load line in the session-start part, and after the loading line in the loading part.
56. The harness renders the display as plain text, so the lines print exactly as the blocks hold them.
57. A blank line prints as a blank line. The figure keeps its spacing without a fence.
58. These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them.
59. The package set's absence is the ordinary case, not an omission.
60. After a compaction, the session-start part is not printed. One line stands in its place, per the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule.

## Compression

- 2026-10-24, compressed: compression 0.44, change 0.74, solubility 18 → 53, clarity 0.35 → 0.90, 56 directives, 55 kept, 1 less precise, 0 lost, after 3 repairs, re-checked kept; directive 40 less precise, judged immaterial
- 2026-10-25, revised: points 1, 14, and 18 take the new wording, that the package set prints after the display; not checked
- 2026-10-27, re-checked: 53 directives, 51 kept, 2 less precise, 0 lost, 2 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 53 → 52, clarity 0.90 → 0.90; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-10-29, revised: the compiled rules are one file per package and the read runs the loader, solubility 52 → 52, clarity 0.90 → 0.90; checked: 51 directives, 51 kept, 0 less precise, 0 lost
- 2026-10-29, revised: point 12's title reads *Slasher: Human-in-the-Loop Harness*, as the body's does; not checked
- 2026-10-29, merge from master re-checked: 60 directives, 60 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-29, revised: master's line break ahead of the title is carried into the compressed text; not checked
- 2026-10-29, merge from master re-checked: 61 directives, 60 kept, 1 less precise, 0 lost, 1 repair
- 2026-11-03, revised: the display prints on `/load` as well; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-11-04, revised: the display prints as the session starts, from the plugin's hook, and again on the load command; checked: 54 directives, 51 kept, 3 less precise, 0 lost, 2 repairs; re-checked: 54 directives, 53 kept, 1 less precise, 0 lost. Left less precise: the reason the agent prints none of the four, which the Why points removed on 2026-10-28 already left out
- 2026-11-04, revised: the notice's close names `/load`, a body sentence only; not checked, since the compressed text does not name the command there
- 2026-11-04, revised: the display prints in two parts, the session-start part as the session starts and the loading part on the first prompt; checked: 61 directives, 58 kept, 2 less precise, 1 lost, 2 repairs; re-checked: 61 directives, 60 kept, 1 less precise, 0 lost. Left less precise: that the figure fills the wait the loading line names
- 2026-11-04, revised: the loading part prints the figure, then the loading line; checked: 60 directives, 59 kept, 1 less precise, 0 lost. Left less precise, untouched by this revision: that the agent prints the package set because it needs markdown
- 2026-11-04, revised: a blank line stands between the harness's label and the title; checked: 66 directives, 66 kept, 0 less precise, 0 lost
- 2026-11-04, revised: the load line ends the session-start message, after the notice; checked: 65 directives, 65 kept, 0 less precise, 0 lost
- 2026-11-04, revised: the loading line reads *Slasher is pre-loading its rules...*, wording the engineer gave; not re-checked
- 2026-11-04, revised: the loading line prints ahead of the figure, the order the engineer set; not re-checked
- 2026-11-04, revised: a blank line stands between the harness's label and the loading line, as the engineer directed; not re-checked
- 2026-11-04, revised: the typed command `load slasher` is `load rules`, a term swap the engineer settled; not re-checked
- 2026-11-06, revised: the title reads *Slasher: Human-in-the-Loop Harness*, wording the engineer gave; not re-checked
- 2026-11-06, revised: the title reads *Slasher: Human in the Loop AI*, wording the engineer gave; not re-checked
- 2026-11-06, revised: the tagline *The engineer decides. The agent generates. Humanity rules.* prints under the title, as the engineer directed; not re-checked
- 2026-11-07, revised: the title reads *Slasher: Humanity in the Loop AI*, wording the engineer gave; not re-checked
- 2026-11-07, revised: the tagline reads *The engineer decides. The agent generates.*, wording the engineer gave; not re-checked
- 2026-11-07, revised: the title reads *Slasher: Human in the Loop AI*, wording the engineer gave; not re-checked
- 2026-11-07, revised: the tagline reads *The engineer decides. The agent generates. Humanity rules.* again, wording the engineer gave; not re-checked
- 2026-11-08, revised: the session-start part is not printed after a compaction, as point 60; not re-checked
- 2026-11-08, revised: the title reads *Slasher: Human in the Loop Harness*, wording the engineer gave; not re-checked
- 2026-11-12, revised: the loading line reads *Slasher is pre-loading its rules... this could take a minute*, wording the engineer gave; not re-checked

## History

Until Thu Nov 12 2026 the loading line read *Slasher is pre-loading its rules...*

Until Sun Nov 8 2026 the title read *Slasher: Human in the Loop AI*, and the root `README.md`'s title read *Human in the Loop AI*.

Until Sun Nov 8 2026 the session-start part printed after a compaction too.

Until Sat Nov 7 2026, for part of that day, the tagline read *The engineer decides. The agent generates.* The engineer restored *Humanity rules.*

Until Sat Nov 7 2026 the title read *Slasher: Humanity in the Loop AI*, and the root `README.md`'s title read *Humanity in the Loop AI*.

Until Sat Nov 7 2026 the tagline read *The engineer decides. The agent generates. Humanity rules.* The engineer dropped *Humanity rules.*

Until Sat Nov 7 2026 the title, and the root `README.md`'s title with it, read *Slasher: Human in the Loop AI*.

Until Fri Nov 6 2026 the title stood alone, and no tagline was printed under it.

Until Fri Nov 6 2026 the title, and the root `README.md`'s title with it, read *Slasher: Human-in-the-Loop Harness*.

Until Fri Nov 6 2026 the title, and the root `README.md`'s title with it, read *Waytide: Human-in-the-Loop Harness*.

Until Wed Nov 4 2026 the typed command was `load waytide`.

On Wed Nov 4 2026 the loading line read *Loading will take a moment*, until the engineer reworded it the same day.

On Wed Nov 4 2026 the load line followed the license line, ahead of the session-start notice, until it was moved after the notice the same day.

On Wed Nov 4 2026 the loading part printed the loading line ahead of the figure, then after it, then ahead of it again, each at the engineer's direction.

Until Wed Nov 4 2026 the display printed whole, with the loading line *Loading Waytide will take a few moments.* and the figure, as the session starts and again on `load waytide` or `/load`. The session-start notice closed with its own caveat and `To load them now, type: /load.`

Until Tue Nov 3 2026 the rule was named the-startup-display-prints-once-per-session, and the display printed only on `load waytide`, and from that day on `/load`, through a `UserPromptSubmit` hook in `.claude/settings.json`. A session opened with any other request showed no display. The hooks moved into the Slasher plugin, and the display came to print as the session starts, ahead of the notice.

The agent printed the four until 2026-10-10, at the head of the response that carried the rule read. Under a later model they stopped reaching the engineer: the agent skipped them, or wrote them into its thinking, and nothing reported either failure. That the harness renders blank lines and the figure's spacing exactly was confirmed in a session on 2026-10-10.

The formulation *Agent harness and ally* sat under the title until 2026-08-23, when it was removed — first to the end of the load and then from the display altogether.

The package set stood between the title and the copyright until 2026-10-10, because it says what this session is running.

The list carried `**on**  *off*` under it briefly on 2026-08-23.

*Waytide: Human-Agent Relations* was settled as the category line on 2026-08-03, and it was the title until 2026-10-28, when the engineer changed it to *Waytide: Human-in-the-Loop Harness*. The four-sentence paragraph *A Generalized Description of Waytide* was settled on 2026-08-20, and with the formulation it lives in the `README.md`.

The license line read `Licensed under the Eventide Common Interest License` until 2026-08-23. Its italics held the name apart from the copyright while the agent printed the display as markdown.

The copyright line read `Waytide — Copyright © 2026 Scott Bellware` until 2026-08-21, because a notice printed with no surrounding prose had nothing to attach itself to.

Until 2026-10-25 the rule said its parts print "in this order" and described the package set second, between the title and the copyright, while saying the agent prints the set after the harness's display. The title section said "Nothing is printed under it". The engineer settled that the order covers the harness's four parts, that the package set keeps its place in this file and prints after them, and that what the title excludes is a subtitle or description. The sections stay where they are, because the script reads the display's parts from this file's fenced blocks by position.

Until Sun Oct 25 2026 this rule was named initialization-rule and titled "Initialization".

Until Thu Oct 29 2026 the script read the display from this rule's compiled file, which held the body alone. When the compiled rules became one file per package, it began reading the source file, up to the `## Compressed` heading.

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
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:39:37 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:27:32 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:30:04 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:13:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:09 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 6:57:20 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:35:51 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 3:12:40 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:37:47 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:51:16 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 1:03:03 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 5:47:07 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:02:22 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:07:24 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:09:55 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:11:43 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:14:38 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 6:22:26 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:26:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:17:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:24:39 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:52:44 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:49:24 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:15:12 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 6:20:24 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 5:25:11 PM PT
Changed by Scott Bellware on Sun Nov 8 2026 at 11:05:51 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:39:02 PM PT
