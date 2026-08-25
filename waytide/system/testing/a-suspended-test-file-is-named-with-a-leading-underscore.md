# A test file whose name begins with an underscore is suspended, and the suite does not run it

**A leading underscore on a test file's name means the file is suspended.** `_upload.rb` is suspended and `upload.rb` is not. **A suite run does not run a suspended file.**

**Suspending a test is a rename and nothing else.** The file stays where it is, with its content untouched. Removing the underscore takes it back into the suite.

## Suspended here means paused, not stopped

**This is the `Suspended` state's sense — paused, not ended.** The file is kept, and it is expected to run again.

**It is not a suspension in the `foundation` a-suspension-is-a-log-entry rule's sense.** That rule governs something the project **did** and stopped: the thing is **removed**, and a log entry tagged `[suspended]` says what it cost and what else changed. A test file marked this way is removed from nothing.

**So a suspended test takes no `[suspended]` log entry.** The reserved tag marks the removal act, and no removal happened. That the test was suspended is an ordinary decision, and the decision log's own trigger reaches it like any other.

## The mark is in the filename because that is what a suite reads

**A suite selects its files by name**, expanding a pattern over the test directory and running what comes back. A mark inside a file would require opening every file to decide whether to run it, which is work the name does for free.

**The underscore does not exclude itself, and that is the failure to expect.** A shell glob skips a leading dot and does **not** skip a leading underscore — `*.rb` returns `_upload.rb` along with the rest, and a language's own test-file discovery usually behaves the same way. **Whatever runs the suite excludes the mark explicitly.** Assuming the mark is self-enforcing runs every suspended test.

**A dot-prefixed name would be self-excluding and is deliberately not used.** It hides the file from an ordinary directory listing and from most editors' file trees, which is the opposite of what a paused test wants: visible, and passed over.

**Why:** a test that cannot pass right now has two bad remedies and one good one. Deleting it loses the work and the intent. Leaving it in the suite makes every run report a failure the engineer has already accounted for, which is how a suite stops being read — an expected red teaches nothing and hides the next real one.

Renaming keeps the file, keeps it visible, and takes it out of the report. What it costs is that a suspended test is invisible to the pass count, so a file can stay suspended indefinitely with nothing announcing it. That is accepted: the name is in the directory listing, where an engineer looking at the suite meets it.

**How to apply:** to suspend a test, rename its file with a leading underscore. Change nothing inside it. To take it back, remove the underscore.

When running a suite, skip every file whose name begins with an underscore, and write that exclusion explicitly, because the pattern does not do it.

Do not delete a test to get it out of the suite, and do not leave a failing one in. Do not tag a log entry `[suspended]` for one, since nothing was removed.

Related:

- the tests-are-automated-or-interactive rule — the other thing that decides what a run contains
- the `foundation` a-suspension-is-a-log-entry rule — the other sense of the word, which this is not
- the `foundation` ideas-convention — the `Suspended` state, whose sense this takes
- the `foundation` vocabulary — *deferred*, *suspended*, and *out of scope*, stated beside each other
- the `git` run-suite-before-commit rule — the run this narrows the membership of

---

Authored by Scott Bellware on Mon Aug 24 2026 at 12:59:35 PM PT
