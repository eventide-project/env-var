# DBE, first turn: the first gate is the actuation and an unnamed assert

Start a feature by writing a test file, not implementation. The first turn produces that file and nothing more, and it stops at the **first gate**, where responsibility first transfers to the human.

What the first gate puts down is small and fixed:

1. **The actuation** — the invocation of the unit under test, the first efferent reference, bound to an explaining variable. Arrange any inputs just above it (via controls or literals).
2. **An unnamed assert** — a single bare `test` block asserting that explaining variable (or the variable against a control value). No inner outcome `context`, and so no outcome to name yet.

The file is still nested to mirror its folder path, per the folder-mirroring rule. There is an outer `context` per path segment. The actuation and the unnamed `test` block sit inside the innermost of those.

```ruby
context "Constant" do
  context "Module" do
    context "Namespace" do
      control_value = Controls::Constant.example

      constant = Constant::Module.new(control_value)

      namespace = constant.namespace
      control_namespace_constant = Constant::Module.new(Object)

      comment "Namespace: #{namespace.inspect}"

      test do
        assert(namespace == control_namespace_constant)
      end
    end
  end
end
```

The assertion is made against an **explaining variable** — a named local whose name states what is being asserted — not against an inline expression. That variable holds the result of actuating the concern. Actuate first, bind the result, then assert it.

**Naming the outcome is deferred to the end.** The **shell of the cradle** is the actuation and its unnamed assert. Once it is implemented, the test is left unnamed through the rest of the feature's development. Only **at the end** does the work come back and **name the test**. The outcome `context` each observation establishes is added then. That is the "one inner `context` per outcome" structure of the test-structure rule.

In practice this closing step is the seam where the next feature begins. So a feature in progress carries bare unnamed asserts, and a feature left behind carries named outcome contexts. The first gate deliberately withholds that naming, so its hinge stays the shape of the actuation and the truth of the one observation. It is not about how outcomes are named or carved up.

**Why:** The first turn is where the unit is designed from the efferent side. The actuation is the first efferent reference, and writing it before any implementation forces the interface to be designed from the use site. See the DBE-as-design-tool rule.

Keeping the first gate to the actuation and a single unnamed assert keeps that gate's hinge undiluted. It is the actuation's shape and the observed truth, with no premature commitment to an outcome taxonomy. Asserting against an explaining variable keeps the test reading as a statement of the concern rather than a mechanical check. Binding it to the actuation result keeps the efferent view in the frame.

**How to apply:** When beginning a feature, write only the test file this turn. Nest one `context` per folder segment. Actuate the unit under test and bind the result to an explaining variable. Write one bare unnamed `test` block asserting that variable. Do not name an inner outcome context yet. Do not write the implementation, and do not pause to run the inevitably-failing test.

**Acceptance is separate gates, not one.** The *content* of turn one is as above. The human accepts it in separate hinges: **actuation, then observation, then controls**. The implementation is the fourth hinge, and the naming is the fifth, at the feature's close.

Each is proposed and accepted before the next, per the hinge-cycle rule. Do not present the whole test file for a single accept. Settle the three test hinges first, then assemble and show the file.

Related:

- the DBE-as-design-tool rule
- the test-structure rule — the grown form
- the folder-mirroring rule
- the what-each-hinge-displays rule
- the actuation-gate options-or-chat rule
- the `control_` test-variable prefix rule

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:37:36 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:47:26 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 9:04:18 AM PT
