# A test file named with a leading underscore is suspended

**Trigger:** When taking a test out of the suite, finding a failing test to set aside, or writing the code that selects a suite's test files

**A leading underscore on a test file's name means the file is suspended.** `_upload.rb` is suspended and `upload.rb` is not. **A suite run does not run a suspended file.**

**Suspending a test is a rename and nothing else.** The file stays where it is, with its content untouched. Removing the underscore takes it back into the suite.

## Suspended here means paused, not stopped

**This is the `Suspended` state's sense — paused, not ended.** The file is kept, and it is expected to run again.

**It is not a suspension in the `foundation` a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule's sense.** That rule governs something the project **did** and stopped: the thing is **removed**, and a log entry tagged `[suspended]` says what it cost and what else changed. A test file marked this way is removed from nothing.

**So a suspended test takes no `[suspended]` log entry.** The `[suspended]` tag marks the removal act, and no removal happened. That the test was suspended is an ordinary decision, and the log's own trigger reaches it like any other.

## The mark is in the filename because that is what a suite reads

**A suite selects its files by name**, expanding a pattern over the test directory and running what comes back. A mark inside a file would require opening every file to decide whether to run it, which is work the name does for free.

**The underscore does not exclude itself, and that is the failure to expect.** A shell glob skips a leading dot and does **not** skip a leading underscore — `*.rb` returns `_upload.rb` along with the rest, and a language's own test-file discovery usually behaves the same way. **Whatever runs the suite excludes the mark explicitly.** Assuming the mark is self-enforcing runs every suspended test.

**A dot-prefixed name would be self-excluding and is deliberately not used.** It hides the file from an ordinary directory listing and from most editors' file trees, which is the opposite of what a paused test wants: visible, and passed over.

**Why:** a test that cannot pass right now has two bad remedies and one good one. Deleting it loses the work and the intent. Leaving it in the suite makes every run report a failure the engineer has already accounted for, which is how a suite stops being read — an expected red teaches nothing and hides the next real one.

Renaming keeps the file, keeps it visible, and takes it out of the report. What it costs is that a suspended test is invisible to the pass count, so a file can stay suspended indefinitely with nothing announcing it. That is accepted: the name is in the directory listing, where an engineer looking at the suite meets it.

**How to apply:** to suspend a test, rename its file with a leading underscore. Change nothing inside it. To take it back, remove the underscore.

When running a suite, skip every file whose name begins with an underscore, and write that exclusion explicitly, because the pattern does not do it.

Do not delete a test to get it out of the suite, and do not leave a failing one in. Do not tag a log entry `[suspended]` for one, since nothing was removed.

## Compressed

1. A leading underscore on a test file's name means the file is suspended.
2. `_upload.rb` is suspended and `upload.rb` is not.
3. A suite run does not run a suspended file.
4. To suspend a test, rename its file with a leading underscore. Suspending is a rename and nothing else.
5. The file stays where it is.
6. Change nothing inside the file.
7. To take the test back into the suite, remove the underscore.
8. Do not delete a test to get it out of the suite.
9. Do not leave a failing test in the suite.

## Suspended here means paused, not stopped

1. This is the `Suspended` state's sense: paused, not ended.
2. The file is kept, and it is expected to run again.
3. It is not a suspension in the sense of the `foundation` a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule. That rule governs something done, stopped, and removed.
4. A suspended test is removed from nothing.
5. Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed.
6. Suspending a test is an ordinary decision. The log's own trigger applies to it like any other.

## The mark is in the filename because that is what a suite reads

1. The suspension mark goes in the filename, not inside the file.
2. A suite selects its files by name, by expanding a pattern over the test directory.
3. The underscore does not exclude itself. Expect this failure.
4. A shell glob skips a leading dot but not a leading underscore. `*.rb` returns `_upload.rb` along with the rest.
5. A language's own test-file discovery usually does not skip the underscore either.
6. Whatever runs the suite excludes files whose names begin with an underscore.
7. Write that exclusion explicitly, because the pattern does not do it.
8. Do not use a dot-prefixed name for suspension. It would hide the file from directory listings and editor file trees.
9. A suspended test should stay visible and be passed over.

## Compression

- 2026-10-24, compressed: compression 0.28, change 0.67, solubility 41 → 75, clarity 0.38 → 0.86, 13 directives, 13 kept, 0 less precise, 0 lost
- 2026-10-28, revised: Why points removed, solubility 75 → 76, clarity 0.86 → 0.87; checked: 14 directives, 14 kept, 0 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named a-suspended-test-file-is-named-with-a-leading-underscore and titled "A test file whose name begins with an underscore is suspended, and the suite does not run it".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the tests-are-automated-or-interactive-and-only-the-automated-run-before-a-commit rule — the other thing that decides what a run contains
- the `foundation` a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the other sense of the word, which this is not
- the `foundation` the-items-directory-holds-one-file-per-item rule — the `Suspended` state, whose sense this takes
- the `foundation` vocabulary — *deferred*, *suspended*, and *out of scope*, stated beside each other
- the `git` run-the-test-suite-after-changes-before-considering-whether-to-commit rule — the run this narrows the membership of

---

Authored by Scott Bellware on Mon Aug 24 2026 at 12:59:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:55:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:26:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:37 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
