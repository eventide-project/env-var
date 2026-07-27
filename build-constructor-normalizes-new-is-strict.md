# `build` is the normalizing constructor; `new` is the strict initializer

A domain class has two construction paths, with distinct jobs:

- **`new` (the initializer)** — **strict**. It records its inputs as-is: no
  normalization, no validation (the initializer is "purely mechanical
  state-recording"). Passing a malformed input to `new` is developer misuse, not
  accounted for.
- **`build` (the constructor)** — the **forgiving, user-friendly front door**. It
  **normalizes** its inputs into the strict form the initializer expects, then
  constructs. Construction is lenient where initialization is strict.

For example, `Upload::Result` records the outcome of an upload, and it is a small
family — `Success` and `Rejected`. Each subtype's `new` is strict: it assigns
fields already in final form. The supertype's `build` is the forgiving factory —
it takes the raw response, normalizes it (reads the status, decides success vs.
rejection, extracts the fields that outcome carries), and constructs the right
subtype:

```ruby
class Upload
  class Result
    def self.build(response)
      status = response.status

      if status.between?(200, 299)
        Success.new(status, response.location)
      else
        Rejected.new(status, response.reason)
      end
    end

    class Success < Result
      attr_reader :status
      attr_reader :location

      def initialize(status, location)
        @status = status
        @location = location
      end
    end

    class Rejected < Result
      attr_reader :status
      attr_reader :reason

      def initialize(status, reason)
        @status = status
        @reason = reason
      end
    end
  end
end
```

**Why:** separating a strict initializer from a forgiving constructor keeps `new`
simple and predictable (just records state) while giving callers a lenient,
normalized entry point. Normalization lives in one place (`build`), not scattered
across call sites, so it can't be forgotten by a path that bypasses the
constructor.

**How to apply:** give a domain type a `build` that normalizes its inputs and
constructs; keep `new` strict. Construct through `build`; reserve `new` for the
internal, strict primitive. Related: the robustness-lives-at-the-class-interface
rule (the general stance this is one case of).

## The supertype factory constructs a subtype via `new` directly

The "construct through `build`" instruction governs **callers outside the family**.
Inside the family, the abstract supertype (`Upload::Result`) **is** a factory of
its subtypes (`Success`, `Rejected`), and its own factory code invokes a subtype's
`new` **directly** — not the subtype's `build` — because by then it already holds
the input in the strict, normalized form `new` expects.

`build`'s job is the **determination/normalization**: read the response, decide
the outcome, pull out the fields. Once `Result.build` has made that determination,
it holds strict values in hand — `Success.new(status, location)` — so routing
through a subtype `build` would only re-run a determination whose answer is
already known. The factory goes straight to the initializer.

**The boundary:** this is an **intra-family privilege**, not a general license to
skip `build`. It applies only to (a) code *within* the family constructing (b) its
*own* subtypes from (c) an input already in strict form. Any path that still needs
normalization must go through `build`. **External callers always use
`Result.build`** — they never call `Success.new` / `Rejected.new`.

**Why:** the supertype-as-factory relationship makes `new` a legitimate internal
seam *for the family itself*, the way a class may use its own private constructor.
The strict/forgiving split protects callers from `new`'s strictness; family code
that has already satisfied that strictness is the factory, not a caller in that
sense. Forcing it back through `build` would run determination logic whose outcome
is already known.

**How to apply:** inside the family, constructing a family subtype from an input
already in the strict form the initializer records, use `new` — it is preferable
to a `build` call whose normalization is a no-op. If any normalization remains, use
`build`. Related: the general `build`/`new` distinction above and the
robustness-lives-at-the-class-interface rule.

---

Authored by Scott Bellware on Tue Jun 30 2026 at 1 PM PT
