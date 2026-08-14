# A citation of another package's rule is not a dependency unless the rule will not work without it

A rule may **name** another package's rule — for orientation, for contrast, or because that
rule treats something this one only touches. Naming it is a **citation**, and a citation is
**not** a dependency. A **dependency** exists only where the citing rule **will not work**
without the cited package.

**The test:** take the cited package away. Can the rule still be applied? If it can, the
reference is a citation and nothing is declared. It cannot be applied where the rule instructs something that has no
meaning, or requires content that is not there. Then the reference is a dependency. It is
declared in the package's README and added to its `install-dependencies.sh`.

**Motivation is not the test.** A rule whose *reason to exist* weakens when a sibling package
is absent still works, and a citation is what that is. The question is whether the rule can be
**applied**, not whether it still has a point. Reaching for the weaker test would make a
dependency out of every rule that is more useful in company than alone. That is most of them.

**A "standalone" claim is about installation, not about prose.** A package that declares no
dependencies may still name any other package's rules. The claim says what must be installed
alongside it. It says nothing about what its rules may refer to.

**The model citation** is foundation's own status-report-format rule. It names the
`testing` package and is written for its absence. Its words are *"If the project has **not**
adopted the testing conventions, degrade this section."* The rule works either way. So `testing` is cited
and not declared.

**The refused dependency** is the features-convention rule. It cites
`design-by-efferent`'s loop-records rule and deliberately stops short of requiring anything in
`waytide/local/loops/`. Its words are *"would invert the package graph, and would make the
feature lifecycle unavailable to a project that installs `foundation` alone."* That rule is
two things at once. It is a citation of another package, and the reason a dependency was not taken.

**Why:** the alternative reading is not available, and the package graph shows it. Six of the
seven packages name packages they do not declare. `foundation`, the base every other
package builds on, cites all six of them in eleven rules. If a citation were a
dependency, `foundation` would depend on `design-by-efferent`, which declares a dependency on
`foundation`, and the graph would cycle. So the two kinds of reference have to be distinct,
and the only workable line between them is whether the rule functions alone.

Keeping the line
at *works* rather than *is motivated* also keeps the declarations meaningful. A declared
dependency obliges an install. Declaring one that is merely helpful would make every
install drag in the whole system and reduce the graph to noise.

This criterion was practiced before it was written. Every declaration in the system
already conforms to it. Stating it here is what makes it available to a rule's author
without their having to infer it from another rule's aside.

**How to apply:** when a rule you are writing names another package's rule, ask one question. Could
your rule still be applied with that package absent? If it could, cite it plainly and declare
nothing. If it could not, declare the dependency in the package README's `Includes` line and
its dependency graph. Add it to `install-dependencies.sh`. Do not declare a dependency for any of these reasons:

- a citation is frequent
- the packages are usually installed together
- the rule reads better with its sibling present

Related:

- the rules-convention — the rule format and where rules live
- the features-convention — the refused dependency worked through in full
- the status-report-format rule — the model citation, written for the cited package's absence
- each package's README — where a dependency is declared

---

Authored by Scott Bellware on Fri Jul 31 2026 at 10:42:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:40:54 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
