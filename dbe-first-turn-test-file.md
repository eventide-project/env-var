# DBE, first turn: the first gate is the actuation and an unnamed assert

Start a feature by writing a test file, not implementation. The first turn produces that file and nothing more, and it stops at the **first gate** — the first handoff to the human.

What the first gate puts down is small and fixed:

1. **The actuation** — the invocation of the unit under test, the first efferent reference, bound to an explaining variable. Arrange any inputs just above it (via controls or literals).
2. **An unnamed assert** — a single bare `test` block asserting that explaining variable (or the variable against a control value). No inner outcome `context`, and so no outcome to name yet.

The file is still nested to mirror its folder path (per the folder-mirroring rule): an outer `context` per path segment — the class/namespace, then the feature — with the actuation and the unnamed `test` block inside the innermost of those.

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

**Naming the outcome is deferred to the end.** Once the **shell of the cradle** — the actuation and its unnamed assert — is implemented, the test is left unnamed through the rest of the feature's development. Only **at the end** does the work come back and **name the test**: the outcome `context` each observation establishes is added then (the "one inner `context` per outcome" structure of the test-structure rule). In practice this closing step is the seam where the next feature begins — so a feature in progress carries bare unnamed asserts, and a feature left behind carries named outcome contexts. The first gate deliberately withholds that naming so its hinge stays the shape of the actuation and the truth of the one observation — not how outcomes are named or carved up.

**Why:** The first turn is where the unit is designed from the efferent side — the actuation is the first efferent reference, and writing it before any implementation forces the interface outside-in (see the DBE-as-design-tool rule). Keeping the first gate to the actuation and a single unnamed assert keeps that gate's hinge undiluted: the actuation's shape and the observed truth, with no premature commitment to an outcome taxonomy. Asserting against an explaining variable keeps the test reading as a statement of the concern rather than a mechanical check; binding it to the actuation result keeps the efferent view in the frame.

**How to apply:** When beginning a feature, write only the test file this turn. Nest one `context` per folder segment (class/namespace, then feature), actuate the unit under test and bind the result to an explaining variable, and write one bare unnamed `test` block asserting that variable. Do not name an inner outcome context yet, do not write the implementation, and do not pause to run the inevitably-failing test.

**Acceptance is separate gates, not one.** The *content* of turn one is as above, but the human accepts it in separate hinges — **actuation, then observation, then controls** (then the implementation as the fourth hinge, and the naming as the fifth, at the feature's close) — each proposed and accepted before the next, per the hinge-cycle rule. Do not present the whole test file for a single accept; settle the three test hinges first, then assemble and show the file. Related: the DBE-as-design-tool rule, the test-structure rule (the grown form), the folder-mirroring rule, the what-each-hinge-displays rule, the actuation-gate options-or-chat rule, and the `control_` test-variable prefix rule.

---

Authored by Scott Bellware on Sat Jun 20 2026 at 11 AM PT
