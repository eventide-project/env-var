# Initialization

Print the two things below, verbatim and in this order, **once per session, at the head of the
response that carries the rule read** — above any account of the read and above every tool call
the read makes.

**This rule file is opened ahead of every other**, which is what puts them in hand.

First the copyright notice and the license line, on consecutive lines with no gap between them:

```
Waytide — Copyright © 2026 Scott Bellware
Licensed under the Eventide Common Interest License
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

**One blank line separates them, and a larger gap is not available.** With no gap at all the
notice reads as a caption attached to the block, or as the block's first line, so a separation is
needed. A wider one cannot be had: the agent's output is **rendered as markdown**, and markdown
collapses any run of blank lines between blocks into a single paragraph break. Writing two or
three produces exactly what writing one produces, and specifying a count that cannot be observed
would be a rule nothing can comply with or violate.

**The block sits in a fenced code block and the notice does not.** The fence is what preserves the
figure's spacing; the notice is ordinary prose and reads as prose. That difference is also why the
gap between them is the renderer's paragraph break rather than a count of lines — they are two
kinds of thing, and the break between them is whatever separates a paragraph from a code block.

**A wider gap is achievable only by giving something up**, and neither cost is worth it: putting
the notice inside the fence with the block would set it in monospace and make it part of the
figure, and separating them with lines carrying an invisible character would put marks in the
output whose purpose no reader could see.

**These two are the whole of what is printed there.** Nothing else accompanies them — no
greeting, no account of what is about to be read, no name for the block itself.

**The notice leads.** It is therefore the **first text of the read**, which the
announce-waytide-at-session-start rule permits unchanged: that rule requires the response opening
this file to carry no prose so that *what this rule carries* comes first, and the notice is part
of what this rule carries.

**It names the work as well as the owner.** A notice printed with no surrounding prose has
nothing to attach itself to, so `Waytide` leads it rather than being inferred from the block
below.

**The license line sits directly under the copyright, with no blank line between them.** The two
are one statement about the work — who owns it, and on what terms it may be used — and a bare
copyright answers only the first while raising the second. For a work distributed by copying its
files into other people's repositories, the terms are the question a reader actually has.

**The blank line falls after the license line**, so the gap separates the whole statement from
the block rather than splitting the statement.

**What the printed line is for, and what it is not.** It **points**; the `LICENSE` file **states**.
A copy of that file sits at this repository's root and in every package directory, so it travels
into each component repository and into every project that installs a package — which is where the
license is read. The printed line does not carry terms and is not the place to put them.

**The year is the year of the notice, not of the session.** It is written into this rule and is
printed verbatim, so it does not track the clock and is not computed. It changes when the rule
changes.

**Why:** the block stands for the system being brought into force in this session, so it is
printed at the moment the rule files are opened — the one moment only the agent is present for.
The notice sits there for the same reason: it is the one moment in a session where the system
is announced as itself rather than being used, and a copyright notice belongs on the work at the
point the work is presented.

**How to apply:** read this file ahead of every other rule file, and at the head of the response
that carries the rest of the read print the copyright notice and the license line on consecutive lines, then one blank line,
then the block, both verbatim and in that order. Print no other words with either. Print them
once per session and never again. There is no condition under which they are withheld.

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
