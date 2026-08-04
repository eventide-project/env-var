# A project does not name its downstream consumers in its own files

A project's own files do not name the projects that **consume** it — not the installed packages
under `waytide/system/`, not the project's own working state under `waytide/local/`, and not the
code or documentation beside them. This holds for a library, a package, a rule system, or
anything else other projects install.

**What a consumer is, here.** A project named **only because it installed this one**. That is
the whole of the test, and it is narrow on purpose — see what it does not reach, below.

## Why a consumer list does not belong in the project

Three reasons, and each would be sufficient on its own:

- **It inverts the dependency direction.** A package is depended *upon*; it does not depend on
  who depends on it. A package that knows its consumers has a reference running the wrong way,
  and every argument that keeps a package unaware of its use sites applies here unchanged.
- **A maintained list drifts, and its drift is silent.** A consumer added today is absent from
  the list until someone remembers, and nothing detects the omission. That is the same drifting
  corpus this system argues against wherever it appears — a record kept by hand beside a fact
  that changes without it.
- **The consumers are frequently not the project's to name.** A repository is public, and an
  installed rule is read on other people's machines. Another party's project, client, or
  repository named in passing is disclosed to everyone who reads the file, whatever the file was
  for. This is the disclosure concern, arriving through a list nobody thought of as a
  disclosure.

## What it does not reach

**A project named because a decision was about it.** The test is *why* the name is there, not
whether the named project happens to consume this one. A project that is part of this project at
large, or a reference project the method is shown through, is named because something was
decided about it — that is ordinary, and removing such a name would cost the record its subject.
Waytide's own two are `website`, which is part of Waytide at large, and `constant`, the worked
example the method is shown through; neither is named as a consumer.

**A historical record that already names one.** A record states what was true when it was
written and is not revised to suit a later convention. The one exception is disclosure, and it is
the disclosure rule that governs it — the correction removes the name and keeps every claim true
by stating it at a lower resolution, and the developer is the authority on what counts. This rule
governs what is **written from now on**; it does not license going back through the records.

## Where the operational need goes instead

A tool sometimes genuinely has to reach the consuming projects — to survey them, or to drive a
refresh across them. What it reads is **per-machine configuration outside the repository**, under
`~/.config/`, so the constraint holds without depending on a `.gitignore` staying correct, and so
the list is what it actually is: one developer's machine, not a fact about the project.

The tool itself is committed and names no consumer; it reads the configuration. That split is
what lets the tooling be shared while the list stays local.

**Why:** the pull toward a consumer list is real — it is the obvious way to answer *who needs
this change* — and each of the three reasons above defeats it separately. The one that is easiest
to miss is the third: a list of consumers reads as internal bookkeeping right up until the
repository is public, at which point it is a list of other people's projects published by someone
who was not thinking about publishing. Putting the operational answer in per-machine
configuration keeps the capability without any of the three costs, so the rule forbids something
that has an available substitute rather than something that has none.

**How to apply:** do not name a downstream consumer in the project's files, and do not add a list
of them for convenience. Where a tool must reach them, have it read a per-machine configuration
file under `~/.config/` and commit the tool without the list. Where a name is there because a
decision was about that project, leave it — the rule is about naming a project *as a consumer*.
Leave historical records as written, and treat a name already in one as the disclosure rule's
concern rather than this one's. Related: the
disclosure-is-the-one-reason-to-edit-a-historical-record rule (a name already recorded), the
a-citation-is-not-a-dependency rule (the other place this package draws a line about what a
reference obliges), and the rules-convention.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:16:51 AM PT
