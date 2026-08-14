# A gem's version lives in its gemspec, and the gem is built and pushed from there

This rule carries what releasing a Ruby gem requires that cannot be said without naming Ruby
and RubyGems. What a version **means**, and who chooses the next one, are stated
technology-neutrally in the `versioning` package and are not repeated here.

**The version lives in the gemspec, in `s.version`.** There is no `version.rb`, no `VERSION`
constant, and no file holding it beside the specification:

```ruby
Gem::Specification.new do |s|
  s.name = "evt-constant"
  s.version = "2.2.0.0"
```

One place holds it, so a release changes one line. A version duplicated into a constant is a
second thing to keep true, and the gemspec is the copy that is actually published.

**The gem name takes the `evt-` prefix**, and a multi-word name joins its words with an
underscore. `evt-file_store` sits in a repository whose directory is `file-store`. The directory name
and the gem name are not the same string and are not derived from each other. The gemspec
states the gem name, and it is the authority.

**Building and pushing:**

```
gem build <name>.gemspec
gem push <name>-<version>.gem
```

`gem build` writes the packaged gem into the working directory, named for the gem and the
version it was built from. `gem push` publishes that file.

**A published version is permanent.** RubyGems will not accept a second push of a version that
already exists, and yanking one does not free the number. That is the concrete form of the irreversibility the `versioning` package cites. It is the reason the next version is put to the
engineer rather than decided.

**Why:** where a version is recorded, and what commands build and publish it, are facts about
RubyGems. A project packaged another way records and publishes it differently, and would find
none of this applicable. Held here, the `versioning` package stays usable by any project
whatever it is packaged with, and a Ruby project still gets the concrete answer. The split is
the ordinary one: the general part is substantial on its own, so separating it costs nothing.

**How to apply:** record a gem's version in the gemspec's `s.version` and nowhere else. Choose
the next version by the `versioning` package's rules, put through the selection interface.
Build with `gem build <name>.gemspec` and publish with `gem push <name>-<version>.gem`.

Related:

- the `versioning` package's version-scheme and the-next-version-is-chosen-by-the-engineer rules — what the version means and who chooses it
- the `git` subject-first-commit-messages rule — the commit that records the change
- the running-the-test-suite rule in this package — the suite that is verified before the release commit

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:04:18 AM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
