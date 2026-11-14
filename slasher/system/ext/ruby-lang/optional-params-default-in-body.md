# Optional parameters default to nil in the signature. Assign their real defaults in the body

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

**Why:** It is **more robust**. An inline default only applies when the argument is *omitted*, so an explicitly-passed `nil` slips past it. `build(nil)` leaves `retries` as `nil`, which then fails. The `||=` form coerces an explicit `nil` to the default too, so the omitted and explicit-`nil` calls behave the same.

It also keeps defaulting **uniform and visible in the body**. Every default is normalized in one place the reader scans, rather than scattered into the parameter list. This is the convention `Controls::HTTP::Response.example` already follows (`status: nil` / `location: nil`, then `status ||= 201`, `location ||= "some location"`). The rule makes it explicit and project-wide.

**How to apply:** Give every optional parameter a `nil` default in the signature, positional or keyword. Assign its real default with `||=` at the top of the body. Note `flag ||= false` for a boolean default normalizes only `nil → false` (a `true` passes through). That is intended and keeps the body's defaulting uniform even when the default is falsy. Keep the assignments free of inlined method calls per the no-inline-method-call-arguments rule (constants and literals as the default are fine). Related: the no-inline-method-call-arguments rule.

## Don't default an argument you only delegate

Coalesce an optional argument only where its value is **actually used**. When the argument is **passed through to another method that is itself responsible for defaulting it**, do **not** coalesce it first. Pass it as-is, the `nil`, and let the receiver assign the default.

Coalescing before delegating **double-defaults**: the receiver's own `||=` never fires, and it obscures which method owns the default. A method that merely forwards an argument owns no default for it. So the `||=` is not always "the first lines of the body". It belongs at the point of use, which may be inside one branch while the other branch delegates raw.

Examples:
- `Upload#call` forwards `verify` to `http_client.post` (which defaults it) in its delegating branch — passing `verify` raw there — but coalesces `verify ||= false` in the branch that inspects the response itself.
- `Upload.call` forwards `verify` only to the instance `#call` (which defaults it), so it does **not** coalesce `verify` at all. (It still coalesces `retries ||= 3`, because that default is `call`'s own.)

## Default with `.nil?`, not `||=`, when the parameter carries a settable value that may be legitimately falsy

`||=` is the right tool **only when `nil` and the real default are the sole falsy possibilities**. They are the sole possibilities for a retry count, `retries ||= 3`. They are also the sole possibilities for a boolean flag, `verify ||= false`, which intentionally normalizes only `nil → false`.

But an optional parameter may carry a **value the method will store or set as-is**. That value may legitimately be `false`, `nil`, or another falsy object. There `||=` is **wrong**. It clobbers an efferent's deliberate falsy value. Default such a parameter explicitly on `nil` instead:

```ruby
# Yes — only a truly-omitted value is defaulted; a settable false/nil literal passes through
def self.build(response, location=nil)
  location = response.location if location.nil?
  ...
end
```

`Upload::Result.build` is the example. Its `location` becomes the value recorded on the result. An efferent may legitimately build a result whose location is `false`, meaning the response reported no location. `location ||= response.location` would replace that `false` with the response's. `location = response.location if location.nil?` defaults only the genuinely-omitted case.

This is not a violation of the `||=` convention — it is the convention's boundary. The distinction: `||=` when the parameter is a **selector/flag** (its own falsy default is the only falsy meaning). `if .nil?` when the parameter is a **settable payload** (falsy is a real value the efferent may intend).

**Why:** `||=` conflates "omitted" with "any falsy value." That conflation is harmless, and even desirable, for flags and selectors. There the falsy default *is* the meaning. It is a defect for a payload the method records verbatim, because it silently rewrites an efferent's intended `false`/`nil`. Robustness (the whole point of defaulting in the body) means honoring an explicit falsy value, which only the `.nil?` test does.

**How to apply:** ask what the parameter *is*. If it selects behavior or defaults to its own falsy value, use `||=`. The method may store or forward it as a value the efferent could legitimately want falsy. Default it with `if param.nil?`. An equivalent `nil`-only test serves. Related: the build/new-strict rule (`build` normalizes, and a settable payload is normalized only for the omitted case).

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:37:36 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:58:52 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
