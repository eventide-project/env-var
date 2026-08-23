# Robustness lives at the class interface, not the instance interface

The robustness principle is **liberal in what it accepts, uniform in what it returns**. It is a property of the **class interface**, not the instance interface.

- **The instance interface is strict.** The initializer (`new`) records its inputs as-is: no coercion, no validation, no normalization. It is the mechanical, predictable core. Passing a malformed input to `new` is engineer misuse, not something the initializer accounts for.
- **The class interface is the convenience layer, and robustness lives there.** It accepts liberally, coerces inputs into the strict form the core expects, and normalizes what it returns so efferents never branch on type. Construction is lenient where initialization is strict.

**The convenience layer can sit at increasing distance from the strict core.** In order of distance:

1. A **class-level constructor** on the same class (e.g. `build`) that normalizes, then delegates to `new`.
2. At the furthest, a **coercion method not even defined on the instance's class** — a function on an **outer module** (e.g. a universal accessor that resolves an input and routes it to the right subtype's constructor). The coercion is so far removed from the instance that it is not the instance's method at all.

The further out the coercion sits, the more it is pure convenience, and the less it is part of the object's own definition. It is always the *perimeter* meeting the efferent, never the *core*.

**Why:** concentrating leniency at the perimeter keeps the core simple, predictable, and honest, since the initializer just records state. It gives efferents a forgiving, normalized entry point. Normalization lives in one place per layer, rather than scattered through the call sites. An efferent who wants the strict core can still reach it. Strict core, forgiving perimeter, perimeter at a distance.

**How to apply:** keep the initializer (`new`) strict — record inputs verbatim. Put liberal acceptance, coercion, and uniform returns at the class interface. That is a `build` constructor. Where the convenience is furthest from the object, it is a coercion function on an outer module. Do not push normalization into the instance interface, and do not force efferents to match the core's strictness.

Related:

- the `build`-normalizes / `new`-is-strict rule — the class/instance construction pair
- — as a domain-specific application to constant names — the string-outputs/permissive-inputs rule — in this project's `local/`

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:48:55 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
