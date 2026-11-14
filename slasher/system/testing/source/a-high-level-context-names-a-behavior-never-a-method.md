# A high-level context names a behavior, never a method

**Trigger:** When creating or editing a file under `test/`

- **Solubility:** 50
- **Original rank:** 56 of 106
- **Unclarity:** 0.37

A test's high-level context is expressed in terms of a **behavior**. A method name is an implementation, so it does not name one. `context "Call"` takes the name of the method `call` and states nothing about what the unit does. What the reader wants there is the behavior the unit is being read for.

## The requirement is firm at the top and relaxes with depth

**As the engineer stated it:** the rule applies more vigorously at higher-level contexts, and is more permissive in deeper contexts that begin to describe implementation elements. Ideally, contexts describe behavior, but deeper contexts may be more permissive.

**The higher a context sits, the more firmly it names a behavior.** The unit's own context and the contexts directly under it are what a reader meets first, and they decide what the reader takes the test to be about. A method name there is the case this rule exists to stop.

**A deeper context may name an implementation element.** Further down, a context is frequently about one part of how the behavior is carried out, and naming that part is the plain description of it. The a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate rule is that case — `context "Defined Predicate"` sits inside the behavior it qualifies.

**No fixed level marks the change.** The ideal is a behavior at every level, and the writer judges where a context has begun to describe the implementation. A deep context that can name a behavior still names one.

## Where the root test sits

**The root test needs no second-level context at all.** A unit's basic test establishes the unit's central behavior, and there is nothing to distinguish it from. So it sits directly under the unit's own context, and its outcome context carries the behavior's name. Subsequent tests, which cover other behaviors, take a second level and name it for the behavior they cover.

**The file path follows, because the contexts mirror it.** The test-context-nesting-mirrors-the-folder-hierarchy rule makes each path segment under `test/automated/` a context, so dropping a context and leaving the segment puts the two out of step. A root test lives at `test/automated/<unit>.rb` and a subsequent behavior at `test/automated/<unit>/<behavior>.rb`.

**Why:** a context is read before anything under it, and it decides what the reader takes the test to be about. A method name sends them to the source to find out what the method does, which is the interpretive work solubility is the absence of. A behavior name says it on the page.

The method name also fixes the test to an implementation detail. Renaming the method would leave the context describing something that no longer exists, and the test would still pass while saying the wrong thing.

The relaxation with depth follows from the same reason. A deep context is read with the behavior above it already in hand, so naming the implementation element it covers costs the reader no interpretive work.

**How to apply:** name a high-level context for the behavior under test. Do not name one for a method, and do not name one for a class's internal structure. Give a unit's root test no second-level context, and put it at `test/automated/<unit>.rb`. Give each subsequent behavior its own second level, named for the behavior.

Prefer a behavior at every level. Where a deeper context describes an implementation element, it may name that element.

## Compressed

1. A test's high-level context names a behavior.
2. A high-level context does not name a method. A method name is an implementation.
3. A high-level context does not name a class's internal structure.
4. `context "Call"` names the method `call` and states nothing about what the unit does.

## The requirement is firm at the top and relaxes with depth

1. The requirement applies more firmly at higher contexts and more permissively at deeper ones.
2. The higher a context sits, the more firmly it names a behavior.
3. The unit's own context and the contexts directly under it must not name a method.
4. A deeper context may name an implementation element when it describes one part of how the behavior is carried out.
5. The a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate rule is that case. `context "Defined Predicate"` sits inside the behavior it qualifies.
6. No fixed level marks the change. The writer judges where a context has begun to describe the implementation.
7. Prefer a behavior at every level.
8. A deep context that can name a behavior still names one.

## Where the root test sits

1. A unit's root test has no second-level context.
2. The root test sits directly under the unit's own context.
3. The root test's outcome context carries the name of the unit's central behavior.
4. Each subsequent test takes a second-level context named for the behavior it covers.
5. A root test lives at `test/automated/<unit>.rb`.
6. A subsequent behavior lives at `test/automated/<unit>/<behavior>.rb`.

## Compression

- 2026-10-24, compressed: compression 0.42, change 0.63, solubility 50 → 81, clarity 0.63 → 0.88, 15 directives, 15 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 81 → 78, clarity 0.88 → 0.87; checked: 14 directives, 13 kept, 1 less precise, 0 lost

## History

Until Thu Nov 5 2026 this rule had no trigger, and was read at every session start.

Until Sun Oct 25 2026 this rule was named a-high-level-context-names-a-behavior-not-a-method.

Related:

- the test-context-nesting-mirrors-the-folder-hierarchy rule — the path the contexts mirror
- the a-feature-with-one-case-has-one-test-file-named-for-the-feature rule — the file named for the feature rather than for a case
- the a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables rule — when a context is warranted at all
- the a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate rule — a deeper context naming an implementation element
- the `language` package's name-concepts-literally-not-by-analogy-code-or-jargon rule and its solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding rule

---

Authored by Scott Bellware on Fri Aug 28 2026 at 10:13:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:42 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:55 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:01 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:16 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:21:00 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:11:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:23:08 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:06:23 PM PT
