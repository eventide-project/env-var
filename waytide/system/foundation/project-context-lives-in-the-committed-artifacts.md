# A project's durable context lives in its committed artifacts, never in an agent memory store

**Every piece of context meant to survive a session is written into `waytide/`.** The rules bind it, the working directories hold it, and git carries it. An agent memory store is not one of those places, and nothing that belongs in one of them is held in a store instead.

**The artifacts are the ones this package already defines.** A binding convention is a rule in `waytide/local/rules/`. A decision is a one-line entry in `waytide/local/logs/log/`. Thinking that has not stabilized is an observation in `waytide/local/ideas/`. An idea is where the project's planning goes. Postponed work is a deferred item, and what the project stopped doing is suspended. Each has its own convention, and between them they hold what a project knows about itself.

**What this forbids is a store standing in for one of them.** A note about how this project's code is arranged, what was decided last week, or which approach was rejected belongs in an artifact. Holding it anywhere else is holding it where nobody reviews it.

## What it does not reach

**A fact about the engineer rather than the project.** How they want to be answered, and what they want the agent never to offer, are not project context. They hold across every project on the machine, and the a-project-does-not-name-its-consumers rule already sends a machine-scoped fact to per-machine configuration under `~/.config/`, outside any repository.

**A preference that has not yet been settled as a rule.** That is the ask-at-once-when-a-preference-is-expressed rule's concern, and it is what keeps this one from costing anything. The pipeline from a preference to a written rule is short enough that nothing has to be held while it waits.

**The harness's own working state.** A cache, a transcript, an index of the repository. None of it is the project's context and none of it is a substitute for an artifact.

**Why:** the premise of the whole system is in the rules-convention. The conventions are committed alongside the code and **read fresh each session rather than recalled**. A memory store is recall. It is unreviewed, undiffable, and invisible to everyone but the agent that wrote it.

It drifts, and its drift is silent. A note written in June contradicts a rule written in August, and nothing detects it. That is the same failure the a-project-does-not-name-its-consumers rule names about a hand-kept list, arriving through a different mechanism.

The cost of forbidding it is real and is bounded to one case. That is the preference not yet worth a rule, and the rule named above is what answers it. Without that rule this one would trade a silent store for a silent loss, which is not an improvement.

**How to apply:** write durable project context into the artifact whose convention covers it. A rule, a log entry, an observation, an idea, or a suspended thing. Do not hold it in an agent memory store, and do not create one.

Where a fact is about the engineer rather than the project, it is outside this rule. Where a preference is not yet a rule, ask about it at once rather than holding it.

Related:

- the ask-at-once-when-a-preference-is-expressed rule — what makes forbidding the store safe
- the rules-convention — the read-fresh premise, and where a binding convention goes
- the decision-log-convention — where a decision goes
- the observations-convention — where thinking goes before it binds
- the a-project-does-not-name-its-consumers rule — the machine-scoped fact, and where it goes instead

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:32:29 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
