# The next version is put to the engineer, never decided by the agent

At a release, the agent does not select the next version. It presents the candidates through the
**AskUserQuestion** selection UI. There is one option per segment that could be increased, each
showing the version that would result. The engineer chooses.

For a package at `2.2.3.1`, that is:

```
Patch  → 2.2.3.2   behavior corrected, interface unchanged
Minor  → 2.2.4.0   capability added, existing use unaffected
Major  → 2.3.0.0   existing use may not survive
```

**The generation is not among the candidates.** It is a declaration about the product line
rather than a reading of the change. So it is not a release-time decision at all. See the
version-scheme rule.

**Why the agent does not decide.** Which segment increases is a claim about what the change
means **to the people using the package**. It says whether their code still works, whether they
have to read anything, and whether they have to change anything. That is not derivable from the diff.

An agent can see what the code did. It cannot see who depends on which part of it,
what was documented as supported, or what was incidental against what was promised. A version is a promise to
users, and the agent is not in a position to make it.

**It is also irreversible in practice.** A version, once published, is what other projects
pin against and install. A wrong decision is not corrected by editing it — the published
version stays published, and the correction is another version. That asymmetry is why the
decision is put at a gate rather than proposed and confirmed.

**Present the candidates with what each claims, not only the number.** The engineer is
choosing a claim about compatibility, so the option that says *capability added, existing use
unaffected* is the one being weighed. `2.2.4.0` on its own does not put the question. The
resulting version is shown too, since it is what will be written and committed.

**Why:** two facts decide this. The decision is a claim about other people's
code, and it cannot be taken back once published. Either alone would argue for putting it
to a person. Together they settle it.

Offering the candidates rather than asking for a version outright is what keeps the decision about the claim. The engineer weighs three statements
about compatibility instead of typing a number. That is the same reason a hinge presents
options rather than a fait accompli.

**How to apply:** at a release, read the current version. Present patch, minor, and major as
options through the selection UI, with the resulting version and the claim each makes. Let
the engineer choose. Do not include the generation. Do not propose one and ask for
confirmation.

Related:

- the version-scheme rule — what the segments mean and why the generation is excluded
- the `foundation` present-every-prompt-through-askuserquestion rule — why every prompt goes through the selection UI
- the `git` subject-first-commit-messages rule — the commit that records the change, `Package version is increased from X to Y`

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:15:04 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:43:08 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
