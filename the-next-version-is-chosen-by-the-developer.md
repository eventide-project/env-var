# The next version is put to the developer, never decided by the agent

At a release, the agent does not select the next version. It presents the candidates through
the **AskUserQuestion** selection UI — one option per segment that could be increased, each
showing the version that would result — and the developer chooses.

For a package at `2.2.3.1`, that is:

```
Patch  → 2.2.3.2   behavior corrected, interface unchanged
Minor  → 2.2.4.0   capability added, existing use unaffected
Major  → 2.3.0.0   existing use may not survive
```

**The generation is not among the candidates.** It is a declaration about the product line
rather than a reading of the change, so it is not a release-time decision at all (see the
version-scheme rule).

**Why the agent does not decide.** Which segment increases is a claim about what the change
means **to the people using the package** — whether their code still works, whether they have
to read anything, whether they have to change anything. That is not derivable from the diff.
An agent can see what the code did and cannot see who depends on which part of it, what was
documented as supported, what was incidental and what was promised. A version is a promise to
users, and the agent is not in a position to make it.

**It is also irreversible in practice.** A version, once published, is what other projects
pin against and install. A wrong choice is not corrected by editing it — the published
version stays published, and the correction is another version. That asymmetry is why the
decision is gated rather than proposed and confirmed.

**Present the candidates with what each claims, not only the number.** The developer is
choosing a claim about compatibility, so the option that says *capability added, existing use
unaffected* is the one being weighed; `2.2.4.0` on its own does not put the question. The
resulting version is shown too, since it is what will be written and committed.

**Why:** the two facts that decide this are that the choice is a claim about other people's
code and that it cannot be taken back once published. Either alone would argue for putting it
to a person; together they settle it. Offering the candidates rather than asking for a version
outright is what keeps the choice about the claim — the developer weighs three statements
about compatibility instead of typing a number, which is the same reason a hinge presents
options rather than a fait accompli.

**How to apply:** at a release, read the current version, present patch, minor, and major as
options through the selection UI with the resulting version and the claim each makes, and let
the developer choose. Do not include the generation. Do not propose one and ask for
confirmation. Related: the version-scheme rule (what the segments mean and why the generation
is excluded), the `foundation` present-every-prompt-through-askuserquestion rule (why
every prompt goes through the selection UI), and the `git` subject-first-commit-messages rule
(the commit that records the change, `Package version is increased from X to Y`).

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
