# Attended or unattended is chosen when the work is initiated; DBE is in effect either way

Work designed through DBE runs in one of two modes, chosen when a feature or an experiment is
initiated and held for its duration:

- **Attended** — human-in-the-loop. The loop **gates** at every hinge, and the developer
  deliberates each one. **This is the default.**
- **Unattended** — the loop does not gate. The agent determines each hinge and decides it,
  generating through to the end of the work.

**DBE is in effect either way, and that is what makes this a cadence rather than a switch.**
Unattended is not DBE off. The **cradle** still holds — the efferent test written before the
implementation, the actuation designed from the use site, the generation steered toward
**solubility**. Every hinge is still determined; what changes is who decides it. The method is
untouched; only the stopping is.

**The choice is batch size.** Attended is **small-batch**: the developer's attention is spent
continuously, and a wrong turn is caught at the hinge where it was taken, so rework stays near
zero. Unattended is **big-batch**: no attention is spent until the end, and a wrong turn is
found with everything built on top of it, so rework is the price. Which is cheaper depends on
how load-bearing the work is and how likely the first pass is to be right — a judgment about
*this* piece of work.

**It is asked at initiation, through the selection UI, beside the working location.** Both are
choices about how the work will be conducted, both are made once, and both hold for its
duration — so they are put at the same gate rather than adding one. The default is attended,
and the option set says so.

**The mode is recorded in both records.**

- **The feature or experiment record** carries it as a **confirmation at initiation**, beside
  the working-location choice. It is a lifecycle fact: what was chosen, when, and by whom.
- **The loop record declares it at the top**, because it changes how every cycle below is read.

**An unattended cycle is not written as though a developer was consulted.** A loop record's
cycle ordinarily carries a hinge, the **options** put at the gate, and the **decision or chat**
that resolved it. Under unattended work the last two did not happen. So:

- The record **declares the mode once**, at the top.
- Each cycle records its **hinge** and **what was decided and why** — the reasoning the agent
  actually applied.
- There is **no Options line and no Decision / chat line**. Writing them would be a false
  record of a deliberation that never occurred.

**This is not the same as an ungated hinge in an attended run.** The loop-records rule has a
form for that — *"none — not gated"* — and it exists to **surface a skipped gate as a defect**.
Under unattended work every hinge is ungated by choice, so marking each one that way would
report a run of failures where there was a declared mode. The mode declaration is what
distinguishes them, and it is why it goes at the top rather than being inferred cycle by cycle.

**Why:** the developer's attention is the scarce thing the whole method is arranged around, and
the arrangement assumes it is always worth spending at a hinge. For work whose rework cost is
negligible that assumption is wrong, and gating five times buys nothing — the ceremony this
method exists to retire, arriving by a different route. Making the cadence a choice puts the
trade where it belongs, with the person who knows what the work is worth. Keeping DBE in force
in both modes is what stops the choice from being a way out of the method: unattended work is
still designed from the efferent side, still cradled by a test written first, still judged by
solubility. And recording the mode honestly is what keeps the loop record worth reading — a
record that showed options put to a developer who was not there would be worse than no record,
because it would be believed.

**How to apply:** at a feature's or an experiment's initiation, put **attended or unattended**
to the developer through the selection UI alongside the working location, with attended as the
default. Record the choice as a confirmation in the feature or experiment record, and declare
it at the top of the loop record. Run the hinges either way. When unattended, write each cycle
as its hinge and the decision with its reasoning, and write no Options or Decision / chat line.
Do not describe unattended work as suspending DBE — what is suspended is the gating. Related:
the loop-records rule (the record's shape and the "none — not gated" form this is distinct
from), the dbe-human-in-the-loop rule (why attention is placed at the hinges), the hinge-cycle
rule (the hinges that run either way), the never-ask-to-start-test-first rule (which forbids
asking about the method's substance, where this asks about its cadence), and foundation's
feature-lifecycle and experiment-lifecycle rules (the initiations where the choice is put).

---

Authored by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
