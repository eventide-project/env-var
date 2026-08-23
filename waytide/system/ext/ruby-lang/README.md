# Waytide — tools/ruby-lang

**Repository:** waytide-ruby

Prescriptive Ruby style.

**The repository name is not this package's path flattened**, which is the ordinary rule. It installs at `waytide/system/tools/ruby-lang/` and it is published from `waytide/waytide-ruby`, because the colloquial name is the one a person reaches for. The `**Repository:**` line above is what `refresh-packages.sh` reads instead of deriving the name.

**Construction and robustness**
- Robustness lives at the **class interface**, not the instance: the initializer (`new`) is strict and records inputs as-is. The class interface is the forgiving perimeter (coercion, liberal acceptance, uniform returns), and it can sit at increasing distance from the core — a `build` constructor, or a coercion function on an outer module.
- `build` is the normalizing constructor. `new` is the strict initializer. A supertype acting as a factory of its subtypes may call a subtype's `new` directly once it holds strict-form input.

**Naming and signatures**
- Never put a preposition in a method name — name the action (`import`, not `import_from`).
- Optional parameters default to `nil` in the signature, and the real default is assigned in the body — `||=`, or `.nil?` for a settable payload that may be legitimately falsy. Do not default an argument you only delegate.
- A positional-argument default is written tight — `namespace=Object`, no spaces.

**Structure**
- Don't inline a method-call result as an argument — bind it to an explaining variable first.
- Include the primary domain mixin before infrastructure mixins.

**Errors**
- An applicative error extends `RuntimeError`, and extends it directly — not `StandardError`, and with no base class inserted between for organization.

**Running the test suite**
- The suite entry point is `test/automated.rb`, run as `ruby test/automated.rb`. Verified output reads `0 failed, 0 aborted`.
- The `test-tree` command's durable script lives at `test/automated/tree.rb`, excluded from the default run, parsing the run's output rather than the source.
- This is where the Ruby and TestBench specifics of running a suite live, so `git` and `testing` can state their conventions without naming a stack.

**Releasing a gem**
- The version lives in the gemspec's `s.version` and nowhere else. The gem is built with `gem build` and published with `gem push`.
- Gem names take the `evt-` prefix, joining a multi-word name with an underscore — `evt-file_store` in a directory named `file-store`.
- What a version *means* and who chooses the next one are the `versioning` package's, stated without knowledge of Ruby.

**Command**: `lib-report` (classify `lib/` by role, construct, method style, the values received and returned, error taxonomy, idioms).

`tools/` groups by the tool a project uses and is not a package. `tools/ruby-lang` is the package.

**It includes every other Waytide package.** That is what makes installing this one enough for a Ruby project, and it is the only package whose dependency is the whole set:

```
tools/ruby-lang  →  foundation, language, testing, git,
                    versioning, design-by-efferent, journal
```

## Installing into a project

**From a bare directory**, in one command. This fetches the composite's installer, runs it for the other seven packages, and adds this one:

```
curl -O https://raw.githubusercontent.com/waytide/waytide-ruby/master/install.sh
sh install.sh
```

`sh install.sh`, not `./install.sh`. The file is committed executable, but `curl` transfers content and not file metadata, so the copy it writes is never executable.

**Into a project that already has Waytide**, with `git subtree`:

```
git subtree add  --prefix waytide/system/tools/ruby-lang git@github.com:waytide/waytide-ruby.git master --squash
git subtree pull --prefix waytide/system/tools/ruby-lang git@github.com:waytide/waytide-ruby.git master --squash
```

Then `waytide/system/tools/ruby-lang/install-dependencies.sh` from your project root, which installs the seven packages this one includes.

**Over HTTPS**, where no SSH key is registered, use `https://github.com/waytide/waytide-ruby.git` in place of the address above. Every script takes `WAYTIDE_ORIGIN=https://github.com/waytide` for the same reason.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/tools/ruby-lang git@github.com:waytide/waytide-ruby.git master --squash
```

## This package is authored here

Every other Waytide package is authored in the [composite](https://github.com/waytide/waytide) and published to its own repository by `git subtree split`. This one is authored here. It moved out of the composite on 2026-08-21, and `waytide/code-ruby` is retired in its favour.


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
