# A version is semver, optionally prefixed by a product generation number

A version takes one of two forms:

```
<major>.<minor>.<patch>              2.3.1
<generation>.<major>.<minor>.<patch> 2.2.3.1
```

The three trailing segments are **semantic versioning**. The leading segment, when there is
one, is the **product generation**, and it is a different kind of statement entirely.

**The three semver segments each answer one question: what does a user of this have to do?**

- **Patch** — behavior is corrected, and the interface is unchanged. A user upgrades without
  reading anything and without touching their code.
- **Minor** — a capability is added, and everything that used the previous version still
  works. A user upgrades without changing their code, and reads only if they want the new
  capability.
- **Major** — something a user may be relying on is gone or different. A user reads before
  upgrading, and may have to change their code.

Stated that way, the segment a change increases is **read off what the change does to the
people using it**. It is not read off how large the change was, how long it took, or how much of
the source it touched. A rewrite that leaves every interface intact is a patch. A single removed
method is a major.

**The generation segment is a declaration, not a compatibility claim.** Semver's three
segments answer *will what I have still work*. The generation answers *is this the same
product*. Those are different questions, and only the first is derivable from the change
itself. The second is decided by whoever decides what the product line is. It is increased
when an entirely new product line is declared, which is a **product management decision**
rather than a technological one.

**So the generation is never increased at a release.** A release states what a change means
for the people using it, which is what the three semver segments carry. Declaring a new product line is a separate act that happens for its own reasons, on its own
occasion. A release that followed one would carry the new generation because the line had
already been declared, not as part of deciding the release.

**A project uses one form throughout.** The two forms are not alternatives to be chosen per
release. A project that carries a generation carries it in every version. One that does
not never acquires it at a release. Mixing them within a project would make two versions
uncomparable, since `2.3.1` and `2.2.3.1` do not sit on one line.

**Why:** a version is read by someone deciding whether to upgrade, so each segment has to
answer a question they actually have. Semver answers the compatibility question precisely, and
is worth keeping exactly as it is rather than being re-invented. What it does not have is any
way to say *this is a different product now*. That statement is not about the change, so no
analysis of a change can produce it. Adding one segment for that keeps the two kinds of claim
apart: three segments that are derived, and one that is declared. Collapsing them would make
the leading number look like a compatibility break so severe it needed its own digit, which is
not what it says.

**How to apply:** version a package as `<major>.<minor>.<patch>`, prefixed by a
`<generation>` where the project carries one. Hold to that form for the life of the
project. Choose the segment to increase by asking what a user of the package must do. It is
nothing, nothing but read, or change their code. Never increase the generation as part of a
release. It moves only when a new product line has been declared.

Related:

- the the-next-version-is-chosen-by-the-engineer rule — who makes the decision and how it is put
- the `git` subject-first-commit-messages rule — the commit that records a version change
- the `tools/ruby-lang` running-the-test-suite rule's package for where a Ruby project records its version

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
