# Optional parameters default to nil in the signature; assign their real defaults in the body

Do not put a default value in the parameter list. Declare each optional parameter with a `nil` default in the signature, and assign its actual default in the method body with `||=`.

```ruby
# No — default in the parameter list
def self.build(retries = 3, verify: false)
  ...
end

# Yes — nil in the signature, real default assigned in the body
def self.build(retries=nil, verify: nil)
  retries ||= 3
  verify ||= false
  ...
end
```

**Why:** It is **more robust** — an inline default only applies when the argument is *omitted*, so an explicitly-passed `nil` slips past it (`build(nil)` would leave `retries` as `nil` and then fail). The `||=` form coerces an explicit `nil` to the default too, so the omitted and explicit-`nil` calls behave the same. It also keeps defaulting **uniform and visible in the body** — every default is normalized in one place the reader scans, rather than scattered into the parameter list. This is the convention `Controls::HTTP::Response.example` already follows (`status: nil` / `location: nil`, then `status ||= 201`, `location ||= "some location"`); the rule makes it explicit and project-wide.

**How to apply:** Give every optional parameter — positional or keyword — a `nil` default in the signature, and assign its real default with `||=` at the top of the body. Note `flag ||= false` for a boolean default normalizes only `nil → false` (a `true` passes through); that is intended and keeps the body's defaulting uniform even when the default is falsy. Keep the assignments free of inlined method calls per the no-inline-method-call-arguments rule (constants and literals as the default are fine). Related: the no-inline-method-call-arguments rule.

## Don't default an argument you only delegate

Coalesce an optional argument only where its value is **actually used**. When the argument is **passed through to another method that is itself responsible for defaulting it**, do **not** coalesce it first — pass it as-is (the `nil`) and let the receiver assign the default.

Coalescing before delegating **double-defaults**: the receiver's own `||=` never fires, and it obscures which method owns the default. A method that merely forwards an argument owns no default for it. So the `||=` is not always "the first lines of the body" — it belongs at the point of use, which may be inside one branch (the other branch delegating raw).

Examples:
- `Upload#call` forwards `verify` to `http_client.post` (which defaults it) in its delegating branch — passing `verify` raw there — but coalesces `verify ||= false` in the branch that inspects the response itself.
- `Upload.call` forwards `verify` only to the instance `#call` (which defaults it), so it does **not** coalesce `verify` at all. (It still coalesces `retries ||= 3`, because that default is `call`'s own.)

## Default with `.nil?`, not `||=`, when the parameter carries a settable value that may be legitimately falsy

`||=` is the right tool **only when `nil` and the real default are the sole falsy possibilities** — as they are for a retry count (`retries ||= 3`) or a boolean flag (`verify ||= false`, which intentionally normalizes only `nil → false`). But when an optional parameter carries a **value the method will store or set as-is** — and that value may legitimately be `false`, `nil`, or another falsy object — `||=` is **wrong**: it clobbers a caller's deliberate falsy value. Default such a parameter explicitly on `nil` instead:

```ruby
# Yes — only a truly-omitted value is defaulted; a settable false/nil literal passes through
def self.build(response, location=nil)
  location = response.location if location.nil?
  ...
end
```

`Upload::Result.build` is the example: its `location` becomes the value recorded on the result, and a caller may legitimately build a result whose location is `false` (the response reported no location). `location ||= response.location` would replace that `false` with the response's; `location = response.location if location.nil?` defaults only the genuinely-omitted case. This is not a violation of the `||=` convention — it is the convention's boundary. The distinction: `||=` when the parameter is a **selector/flag** (its own falsy default is the only falsy meaning); `if .nil?` when the parameter is a **settable payload** (falsy is a real value the caller may intend).

**Why:** `||=` conflates "omitted" with "any falsy value." That conflation is harmless — even desirable — for flags and selectors, where the falsy default *is* the meaning. It is a defect for a payload the method records verbatim, because it silently rewrites a caller's intended `false`/`nil`. Robustness (the whole point of defaulting in the body) means honoring an explicit falsy value, which only the `.nil?` test does.

**How to apply:** ask what the parameter *is*. If it selects behavior or defaults to its own falsy value, use `||=`. If the method stores or forwards it as a value the caller could legitimately want falsy, default it with `if param.nil?` (or an equivalent `nil`-only test). Related: the build/new-strict rule (`build` normalizes; a settable payload is normalized only for the omitted case).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
