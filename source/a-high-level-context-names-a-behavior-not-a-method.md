# A high-level context names a behavior, never a method

A test's high-level context is expressed in terms of a **behavior**. A method name is an implementation, so it does not name one. `context "Call"` takes the name of the method `call` and states nothing about what the unit does. What the reader wants there is the behavior the unit is being read for.

## The requirement is firm at the top and relaxes with depth

**As the engineer stated it:** the rule applies more vigorously at higher-level contexts, and is more permissive in deeper contexts that begin to describe implementation elements. Ideally, contexts describe behavior, but deeper contexts may be more permissive.

**The higher a context sits, the more firmly it names a behavior.** The unit's own context and the contexts directly under it are what a reader meets first, and they decide what the reader takes the test to be about. A method name there is the case this rule exists to stop.

**A deeper context may name an implementation element.** Further down, a context is frequently about one part of how the behavior is carried out, and naming that part is the plain description of it. The predicate-context-name rule is that case — `context "Defined Predicate"` sits inside the behavior it qualifies.

**No fixed level marks the change.** The ideal is a behavior at every level, and the writer judges where a context has begun to describe the implementation. A deep context that can name a behavior still names one.

## Where the root test sits

**The root test needs no second-level context at all.** A unit's basic test establishes the unit's central behavior, and there is nothing to distinguish it from. So it sits directly under the unit's own context, and its outcome context carries the behavior's name. Subsequent tests, which cover other behaviors, take a second level and name it for the behavior they cover.

**The file path follows, because the contexts mirror it.** The test-context-nesting-mirrors-folders rule makes each path segment under `test/automated/` a context, so dropping a context and leaving the segment puts the two out of step. A root test lives at `test/automated/<unit>.rb` and a subsequent behavior at `test/automated/<unit>/<behavior>.rb`.

**Why:** a context is read before anything under it, and it decides what the reader takes the test to be about. A method name sends them to the source to find out what the method does, which is the interpretive work solubility is the absence of. A behavior name says it on the page.

The method name also fixes the test to an implementation detail. Renaming the method would leave the context describing something that no longer exists, and the test would still pass while saying the wrong thing.

The relaxation with depth follows from the same reason. A deep context is read with the behavior above it already in hand, so naming the implementation element it covers costs the reader no interpretive work.

**How to apply:** name a high-level context for the behavior under test. Do not name one for a method, and do not name one for a class's internal structure. Give a unit's root test no second-level context, and put it at `test/automated/<unit>.rb`. Give each subsequent behavior its own second level, named for the behavior.

Prefer a behavior at every level. Where a deeper context describes an implementation element, it may name that element.

Related:

- the test-context-nesting-mirrors-folders rule — the path the contexts mirror
- the single-case-test-named-for-feature rule — the file named for the feature rather than for a case
- the context-only-for-local-instrumentation rule — when a context is warranted at all
- the predicate-context-name rule — a deeper context naming an implementation element
- the `language` package's name-literally-not-by-analogy rule and its solubility rule

---

Authored by Scott Bellware on Fri Aug 28 2026 at 10:13:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
