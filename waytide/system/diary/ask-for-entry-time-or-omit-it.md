# Where an entry carries no time, ask for one through the selection interface

When creating a diary entry, where the writer has not given a **time**, ask them through the
selection interface. Do not choose a default, and do not invent or guess a placeholder time.

**A date settles nothing about the time.** *Yesterday*, *today*, *last Tuesday*, and an explicit
date each fix the day and say nothing about the hour. So the ask fires for each of them, and the
answer decides only whether the entry carries a time and what it is.

**The ask carries these options:**

1. **No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`. The
   datetime line drops the `at HH:MM` with it and reads `Ddd Mon D YYYY`.
2. **Now**, with the current time in the label — `Now (2:01 PM)`. The filename takes the
   `YYYY-MM-DDTHH-MM` prefix and the datetime line reads `Ddd Mon D YYYY at HH:MM`.
3. **Enter the time.** The writer gives the value. A value stated to the second takes the
   `YYYY-MM-DDTHH-MM-SS` prefix. Every other value stops at the minute.
4. **Explain**, per the foundation package's present-every-prompt-through-askuserquestion rule.

**`Now` is held to the minute, like every other answer.** It reads a clock that has a seconds
value, and the stamp drops it. Seconds reach a filename only where the writer states them, so no
answer here produces a resolution the writer did not give. See the diary-entries rule.

**`Now` is offered only for an entry about today.** For a back-dated entry the current clock time
is not the entry's time, and naming it `Now` would say it is. The ask then carries **No time**,
**Enter the time**, and **Explain**.

**`Enter the time` is not a free-text option, and adding it does not break the present-every-prompt
rule.** That rule forbids an agent-supplied free-text option because the harness already gives one
for what the options do not contain. This question asks for a time, so a specific time is
an answer **within** the question rather than outside it. The harness's free-text option remains for anything else.

**A date-only entry sorts to the start of its day**, which matches the filename sort, where `-`
precedes `T`.

**The date is settled before the ask, and the ask does not revisit it.** Where the writer referred
to a day, the entry takes that day. Where they referred to none, it takes today. The diary-entries
rule's dating default governs that, and this rule governs the time alone.

**Why:** the writer owns the timestamp, and a guessed time is a fabricated fact. Asking keeps the
diary accurate.

The trigger is the **time** rather than the whole datetime because a day-granular
phrase is the ordinary way a person refers to when something happened. *Yesterday* is a complete
answer about the day and no answer at all about the hour. A rule that fired only where the writer
said nothing would take *yesterday* as settling the two, and would then have to invent an hour or
drop one without asking.

Offering the date-only form as an answer is what makes it reachable. It was
formerly a separate signal the writer had to know to give, which is a capability nobody discovers.

**How to apply:** on a new entry, check whether the writer gave a time. Where they did not, ask
through the selection interface. Offer **No time**, **Now** with the current time in its label,
**Enter the time**, and **Explain**. Drop **Now** where the entry is not about today.

Stamp the filename to the minute under **Now**, and under a time the writer stated to the minute.
Write seconds only where the writer stated seconds.

Name the file and write the datetime line to match the answer. Settle the date first by the
diary-entries rule's dating default, and do not put the date to the writer.

Related:

- the diary-entries rule — the dating default that settles the date, and the filename stamp
- the datetime-stamp-line rule — the in-content line that drops the time with it
- the foundation package's present-every-prompt-through-askuserquestion rule — the interface, the
  `Explain` option, and the free-text option this rule's third option is not

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:05:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:01:46 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
