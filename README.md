# Waytide — code/ruby

Prescriptive Ruby style.

**Construction and robustness**
- Robustness lives at the **class interface**, not the instance: the initializer (`new`) is strict and records inputs as-is; the class interface is the forgiving perimeter (coercion, liberal acceptance, uniform returns), and it can sit at increasing distance from the core — a `build` constructor, or a coercion function on an outer module.
- `build` is the normalizing constructor; `new` is the strict initializer. A supertype acting as a factory of its subtypes may call a subtype's `new` directly once it holds strict-form input.

**Naming and signatures**
- Never put a preposition in a method name — name the action (`import`, not `import_from`).
- Optional parameters default to `nil` in the signature; assign the real default in the body (`||=`, or `.nil?` for a settable payload that may be legitimately falsy; don't default an argument you only delegate).
- A positional-argument default is written tight — `namespace=Object`, no spaces.

**Structure**
- Don't inline a method-call result as an argument — bind it to an explaining variable first.
- Include the primary domain mixin before infrastructure mixins.

**Command**: `lib-report` (classify `lib/` by role, construct, method style, API currency, error taxonomy, idioms).

`code/` groups by programming language and is not a package; `code/ruby` is the package. Includes `foundation`, `language`.

```
code/ruby  →  foundation, language
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/framework/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/framework/code/ruby https://github.com/waytide/code-ruby.git master --squash
git subtree pull --prefix waytide/framework/code/ruby https://github.com/waytide/code-ruby.git master --squash
```

It includes `foundation` and `language` — install those too, or run `sh waytide/framework/code/ruby/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/framework/code/ruby https://github.com/waytide/code-ruby.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
