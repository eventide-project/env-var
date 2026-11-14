# A version is semver, optionally prefixed by a product generation number

**Trigger:** When choosing, writing, or proposing a package version or cutting a release

A version takes one of two forms:

```
<major>.<minor>.<patch>              2.3.1
<generation>.<major>.<minor>.<patch> 2.2.3.1
```

The three trailing segments are **semantic versioning**. The leading segment, when there is one, is the **product generation**, and it is a different kind of statement entirely.

**The three semver segments each answer one question: what does a user of this have to do?**

- **Patch** — behavior is corrected, and the interface is unchanged. A user upgrades without reading anything and without touching their code.
- **Minor** — a capability is added, and everything that used the previous version still works. A user upgrades without changing their code, and reads only if they want the new capability.
- **Major** — something a user may be relying on is gone or different. A user reads before upgrading, and may have to change their code.

Stated that way, the segment a change increases is **read off what the change does to the people using it**. It is not read off how large the change was, how long it took, or how much of the source it touched. A rewrite that leaves every interface intact is a patch. A single removed method is a major.

**The generation segment is a declaration, not a compatibility claim.** Semver's three segments answer *will what I have still work*. The generation answers *is this the same product*. Those are different questions, and only the first is derivable from the change itself. The second is decided by whoever decides what the product line is. It is increased when an entirely new product line is declared, which is a **product management decision** rather than a technological one.

**So the generation is never increased at a release.** A release states what a change means for the people using it, which is what the three semver segments carry. Declaring a new product line is a separate act that happens for its own reasons, on its own occasion. A release that followed one would carry the new generation because the line had already been declared, not as part of deciding the release.

**A project uses one form throughout.** The two forms are not alternatives to be chosen per release. A project that carries a generation carries it in every version. One that does not never acquires it at a release. Mixing them within a project would make two versions uncomparable, since `2.3.1` and `2.2.3.1` do not sit on one line.

**Why:** a version is read by someone deciding whether to upgrade, so each segment has to answer a question they actually have. Semver answers the compatibility question precisely, and is worth keeping exactly as it is rather than being re-invented. What it does not have is any way to say *this is a different product now*. That statement is not about the change, so no analysis of a change can produce it. Adding one segment for that keeps the two kinds of claim apart: three segments that are derived, and one that is declared. Collapsing them would make the leading number look like a compatibility break so severe it needed its own digit, which is not what it says.

**How to apply:** version a package as `<major>.<minor>.<patch>`, prefixed by a `<generation>` where the project carries one. Hold to that form for the life of the project. Choose the segment to increase by asking what a user of the package must do. It is nothing, nothing but read, or change their code. Never increase the generation as part of a release. It moves only when a new product line has been declared.

## Compressed

1. A version takes one of two forms:

```
<major>.<minor>.<patch>              2.3.1
<generation>.<major>.<minor>.<patch> 2.2.3.1
```

2. The three trailing segments are semantic versioning.
3. The leading segment, when present, is the product generation.
4. Choose the semver segment to increase by what a user of the package must do.
5. Do not choose it by the change's size, duration, or how much source it touched.
6. Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code.
7. Increase minor when a capability is added and everything using the previous version still works.
8. With a minor, the user changes no code and reads only to use the new capability.
9. Increase major when something a user may rely on is gone or different. The user reads first and may change code.
10. A rewrite that leaves every interface intact is a patch.
11. A single removed method is a major.
12. The generation is a declaration, not a compatibility claim. It answers whether this is the same product.
13. The generation is increased only when an entirely new product line is declared.
14. Declaring a new product line is a product management decision, not a technological one. Whoever decides what the product line is decides it.
15. Never increase the generation as part of a release. Declaring a new product line is a separate act, done for its own reasons on its own occasion.
16. A release after a declared new product line carries the new generation because the line was already declared.
17. A project uses one form throughout its life.
18. A project that carries a generation carries it in every version.
19. A project without a generation never acquires one at a release.

## Compression

- 2026-10-24, compressed: compression 0.44, change 0.70, solubility 52 → 84, clarity 0.66 → 0.93, 19 directives, 19 kept, 0 less precise, 0 lost, after 3 repairs, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 84 → 84, clarity 0.93 → 0.93; checked: 16 directives, 15 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named version-scheme.

Related:

- the the-next-version-is-put-to-the-engineer-never-decided-by-the-agent rule — who makes the decision and how it is put
- the `git` write-subject-first-commit-messages rule — the commit that records a version change
- the `ext/ruby-lang` releasing-a-gem rule — where a Ruby project records its version

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:52:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:20:41 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:43 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:48 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
