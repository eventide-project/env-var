# Session — The Log collision found in review, and the import refusal it produced (Sun Aug 2 2026 09:46)

The session opened as a review of one pull request and became the discovery of a defect in a
dependency. Pull request #3 replaced the test suite's `include EnvVar` with the constant gem's
`import EnvVar`, and the review found that the import silently took the top-level `Log`
constant from the `evt-log` gem. The finding was recorded as a deferred item in the `constant`
repository rather than worked around here; that project fixed it in its own sessions, adding a
refusal and the `only:`/`except:` keywords, and released `evt-constant 2.2.1.0`. The pull
request was then updated to `import EnvVar, except: :Log`, verified, and merged. Along the way
the Waytide packages were refreshed and the `versioning` package installed.

This is the communicable record — the guided tour. The durable records are the commits, the
decision log, and the `constant` repository's own log and feature records; this narrative
points at them and does not restate them.

## 1. A pull request to review

The only open pull request was #3, `constant-top-level-import`, three commits replacing the
test suite's `include EnvVar` workaround with the `evt-constant` gem's refinement —
`using Constant::Import` then `import EnvVar` — and shortening every test script's constant
references from `EnvVar::Controls::VariableName` to `Controls::VariableName`. It closed a TODO
Scott had left in `test_init.rb` in February. The suite passed on the branch: 13 files, 24
tests.

## 2. The Log collision

`Constant::Import.()` is constant **assignment**, not lookup. It reads the origin module's own
constants and `const_set`s each onto the destination. At the top level of a script the
destination is `Object`, and `EnvVar` owns three constants, so `import EnvVar` performed three
assignments — `Controls` and `Error` onto free names, and `Log` onto a name `evt-log` already
occupied with its own top-level `Log` class. `EnvVar::Log` is a subclass of it, so the import
replaced the parent with the child:

```
constant/lib/constant/import.rb:42: warning: already initialized constant Log
evt-log-2.1.1.2/lib/log.rb:10: warning: previous definition of Log was here
```

Nothing broke — `EnvVar.logger`'s `Log.get(self)` resolves lexically inside `module EnvVar` to
`EnvVar::Log` either way, and the suite passed. What it cost was two warning lines on every
run and a global name in the test process pointing at a tagged subclass.

## 3. Why `include` never did it

Inclusion assigns nothing. It offers `EnvVar` as a place to look for a name Ruby failed to
find on `Object`, and `Log` was never such a name: `Object::Log` is defined directly on
`Object`, and a constant on the class itself is found before any included module is consulted.
**Import assigns; include only offers a fallback.** That difference was the whole of the
defect, and it is why the change of mechanism introduced it.

## 4. The finding goes to the `constant` repository

Twenty-two Eventide libraries define `class Log < ::Log` — `consumer`, `messaging`,
`entity-store`, `transform`, and the rest — so every one of them would hit the identical
collision the moment its suite adopted a top-level import. That made it a defect in
`Constant::Import` rather than a quirk of `env-var`, and the work belonged upstream.

A deferred item was written into `constant`'s `waytide/local/deferred/`, detailed enough to be
acted on in a session with no access to this conversation: what `Import` did, the reproduction,
the twenty-two libraries, the two-part change proposed (refuse the collision; take `except:` /
`only:` to resolve one deliberately), three things not to do, and — most usefully — a
reconciliation the item insisted be settled first. A prior decision in that project held that
`Define` matches `const_set`'s overwrite-plus-warning semantics because there is no library
policy to protect. That reasoning reads as though it already governs `Import`, and it does not:
a `Define` caller names the one constant, while an `Import` caller names an origin module and
receives assignments they never enumerated.

## 5. The gem is fixed, and the refreshed working copy fails to load

That work happened in `constant`'s own sessions. Refreshing the review copy afterward showed
the fix working exactly as intended — the pull request no longer loaded at all:

```
Log is already defined on Object (imported from EnvVar) (Constant::Error)
```

The silent overwrite had become a failure at the moment of import, and `env-var` was the use
site that had to resolve it. `import EnvVar, except: :Log` did: 24 tests, no failures, and the
two warnings gone, since nothing overwrote anything any more.

## 6. Where the escape applies, and where it does not

The new `override_ancestor` keyword does not reach this case, and working out why took most of
an exchange. It narrows the collision search from the destination's whole ancestor chain to the
destination alone, so a name found on an **ancestor** is permitted and shadows it, while a name
on the **destination itself** is still refused. `Log` is defined directly on `Object`, which is
the destination — so no keyword permits it, and omission is the only way through.

The underlying rule turned out to be principled: **the escape exists where nothing can be
lost.** Defining a name the destination inherits takes nothing away, since the ancestor keeps
its constant and every other descendant still resolves it. Replacing a name the destination
defines itself destroys the only binding the previous value had.

A critique of the parameter's name was raised here and then withdrawn. The argument was that
"override" implies destruction while the permitted case is additive. It does not survive the
obvious counter-example: method overriding in Ruby is also additive — the parent keeps its
method, `super` still reaches it — and it is the primary sense in which a Ruby programmer meets
the word. `ancestor` is also the more precise half, naming what the implementation actually
consults. The reasoning that had gone wrong went wrong for a different reason: nobody had
checked where `Log` was defined.

## 7. The packages are refreshed, and `versioning` is installed

`refresh-packages.sh` moved six of seven packages. The substantial changes: the deferred queue
is now **printed after the rule read every session**, ordered by a new `**Priority:**` rank;
`waytide/local/sessions/` became `work-sessions/`, with a design-reconciliation prompt after a
record is written; stack-specific facts moved out of `git` and `testing` into two new
`code/ruby` rules; `precondition` arrived as a testing term and the one stated exception to the
assertion-only rule; and nine foundation rules were renamed, with a new instruction to
reference a rule **by name, never by file path** — precisely because renames break paths.

Two gaps were surfaced upstream: `code/ruby/install-dependencies.sh` still points at
`github.com/eventide-project/agent-norms-*` where the other packages point at
`github.com/waytide`, and `code/ruby`'s releasing-a-gem rule sends a reader to the `versioning`
package while declaring only `foundation, language`. The `versioning` package was then
installed here, bringing the rule that a version's segments are read off what a change requires
of its users, and that the next version is **put to the developer, never decided by the agent**.

## 8. The release, the update, and the merge

`evt-constant 2.2.1.0` was released. Here, the gemspec was left **unconstrained** — house
practice, and decisively so: exactly one version constraint exists across every Eventide
gemspec. The bundle was re-vendored, the suite verified against the released gem, and the
one-line change committed and pushed so the pull request would show what actually merged rather
than closing on a diff that predated the fix.

## Takeaways

- **An import that assigns names the caller never enumerated, onto a destination they never
  inspected, has to refuse rather than replace.** Ruby's own signal is inadequate in both
  directions — a warning for a direct overwrite, nothing at all for a shadowed inherited name.
- **The escape belongs where nothing can be lost.** Shadowing an inherited constant is additive
  and can be permitted; replacing a directly-defined one is destructive and is not.
- **A defect found in a dependency is fixed in the dependency.** The workaround here would have
  cost one line and left twenty-one other libraries to rediscover it.
- **A prior decision that reads as governing a new case may not.** `Define`'s transparency to
  `const_set` did not extend to `Import`, and saying so explicitly was the most useful part of
  the deferred item.
- **A published version cannot be taken back**, which is why the `versioning` package puts the
  choice to the developer rather than deriving it from the diff.

## Glossary

- **citation** (as against a **dependency**) — naming another package's rule is a citation; it
  becomes a dependency only where the citing rule *will not work* without the cited package.
  Motivation is not the test.
- **precondition** — a bare `assert`/`refute` that is not a test, documenting a factor that
  decides the test's outcome where the script does not express it. Its predicate reads inline.
- **product generation** — the optional leading version segment, answering *is this the same
  product*. A declaration rather than a compatibility claim, and never increased at a release.
- **already defined on the destination** / **inherited by the destination** — the two collision
  conditions `Constant::Import` distinguishes. Only the second has an escape.

## Where the durable records live

- **This repository** — commit `418d594` (the `except: :Log` change and why), the merge
  `8f019cf` closing pull request #3, and two decision-log entries of 2026-08-02: the gemspec
  constraint left unconstrained, and the `versioning` package install.
- **The `constant` repository** — the log entry `2026-07-31T01-08-49Z-import-collision-refusal-is-carried-out`
  and the feature and loop records for that work, plus the later `only`/`except` and
  `override_ancestor` entries. The deferred item written here was deleted on resolution, as its
  convention requires; those log entries are its durable trace.
- **The released gem** — `evt-constant 2.2.1.0`, published 2026-08-02.
- **The packages** — the refresh commits of 2026-08-02 and the `versioning` install.

## A closing note

The most useful thing the session produced was not the one-line fix. It was the observation
that twenty-two libraries were shaped to hit the same collision, which is what moved the work
from a workaround here to a refusal upstream. The least useful was a naming critique argued at
length and then withdrawn — worth recording because the record of a session is not improved by
leaving out the parts that went nowhere.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 9:46:28 AM PT
