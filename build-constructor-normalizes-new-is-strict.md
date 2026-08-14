# `build` is the normalizing constructor. `new` is the strict initializer

A domain class has two construction paths, with distinct jobs:

- **`new` (the initializer)** — **strict**. It records its inputs as-is: no
  normalization, no validation (the initializer is "purely mechanical
  state-recording"). Passing a malformed input to `new` is engineer misuse, not
  accounted for.
- **`build` (the constructor)** — the **forgiving, user-friendly front door**. It
  **normalizes** its inputs into the strict form the initializer expects, then
  constructs. Construction is lenient where initialization is strict.

For example, `Upload::Result` records the outcome of an upload, and it is a small
family — `Success` and `Rejected`. Each subtype's `new` is strict: it assigns
fields already in final form. The supertype's `build` is the forgiving factory. It takes the raw response and normalizes it, reading the status, deciding success against rejection, and extracting the fields that outcome carries. Then it constructs the right subtype:

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
simple and predictable (just records state) while giving efferents a lenient,
normalized entry point. Normalization lives in one place (`build`), not scattered
through the call sites, so it can't be forgotten by a path that bypasses the
constructor.

**How to apply:** give a domain type a `build` that normalizes its inputs and
constructs. Keep `new` strict. Construct through `build`. Reserve `new` for the
internal, strict primitive. Related: the robustness-lives-at-the-class-interface
rule (the general stance this is one case of).

## The supertype factory constructs a subtype via `new` directly

The "construct through `build`" instruction governs **efferents outside the family**.
Inside the family, the abstract supertype `Upload::Result` **is** a factory of
its subtypes `Success` and `Rejected`. Its own factory code invokes a subtype's `new` **directly**, rather than the subtype's `build`. By then it already holds the input in the strict, normalized form `new` expects.

`build`'s job is the **determination/normalization**: read the response, decide
the outcome, pull out the fields. Once `Result.build` has made that determination,
it holds strict values in hand, as `Success.new(status, location)`. Routing through a subtype
`build` would only re-run a determination whose answer is already known. The factory goes straight to the initializer.

**The boundary:** this is an **intra-family privilege**, not a general license to
skip `build`. It applies only to (a) code *within* the family constructing (b) its
*own* subtypes from (c) an input already in strict form. Any path that still needs
normalization must go through `build`. **External efferents always use
`Result.build`** — they never call `Success.new` / `Rejected.new`.

**Why:** the supertype-as-factory relationship makes `new` a legitimate internal
seam *for the family itself*, the way a class may use its own private constructor.
The strict/forgiving split prevents efferents from `new`'s strictness. Family code
that has already satisfied that strictness is the factory, not an efferent in that
sense. Forcing it back through `build` would run determination logic whose outcome
is already known.

**How to apply:** inside the family, use `new` to construct a family subtype. The input is
already in the strict form the initializer records. It is preferable
to a `build` call whose normalization is a no-op. If any normalization remains, use
`build`. Related: the general `build`/`new` distinction above and the
robustness-lives-at-the-class-interface rule.

---

Authored by Scott Bellware on Tue Jun 30 2026 at 1 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:53:39 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
