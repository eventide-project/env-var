# A hinge question carries no decision marker

**Trigger:** When presenting a hinge to the engineer

**A question put at a hinge carries no `decision` marker.** Do not set the selection's `metadata.source` to `decision` when the question puts a hinge to the engineer: the actuation, the observation, the controls, the implementation, or the naming. The foundation package's a-process-question-and-its-answer-are-logged rule logs a marked question, and a hinge question is not logged.

**The loop record holds the hinge.** A hinge, its options, and the engineer's selection are recorded in the feature's loop record, one cycle to a section, per the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule. A log entry for the same selection repeats the loop record in the log, and the loop record must not displace the log.

**A design decision made before the loop is not a hinge.** Where the engineer settles the design of a feature before its first hinge, such as what a configuration file is named or where a value is kept, that question is a process question, and it carries the marker.

**Why:** the log records what was decided, one entry to a decision. The loop record records how a feature was decided, cycle by cycle. A hinge selection logged by the hook puts a turn of the work in the log, and the log then holds the same selection twice, once as an entry and once in the loop record. The foundation rule names a design as a process question, and a hinge is a design decision, so without this rule a hinge question reads as one that is marked.

**How to apply:** when putting a hinge question through the selection interface, set no `metadata` marker. Record the hinge, its options, and the selection in the loop record.

Related:

- the foundation a-process-question-and-its-answer-are-logged rule — the marker, and the questions it logs
- the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — where a hinge is recorded
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the five hinges

---

Authored by Scott Bellware on Sun Nov 8 2026 at 12:50:04 PM PT
