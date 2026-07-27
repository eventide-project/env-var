# A report the developer asks for is recorded in `waytide/sessions/`

When the developer asks for a **report** — a status report, a test report, a test tree, a
lib report, or any other on-demand report command — print it in the response as usual, then
**ask the developer whether to save it**. On confirmation, the same content is written to a
file in `waytide/sessions/`. A report is not printed and discarded by default, and it is not
saved without being asked either.

- **Which reports.** Every on-demand report the developer requests. The named ones are the
  status report, the test report, the test tree, and the lib report; the rule is not
  limited to those.
- **The confirmation goes through the selection UI.** Ask through `AskUserQuestion`, never
  as a prose question — one option to save it, one to leave it unsaved. Do not add an
  escape option of your own; the interface's built-in free-text choice is the escape (see
  the `design-by-efferent` package's present-every-prompt rule). Ask **after** the report is
  rendered, so the developer decides with the report in front of them rather than in the
  abstract.
- **Filename.** A dated working-state artifact, so it takes the ISO-8601-UTC prefix:
  `YYYY-MM-DDTHH-MM-SSZ-<report-name>.md` — for example
  `2026-07-26T06-48-43Z-status-report.md`.
- **Content.** The report as rendered, under a `# <Report name> — <date>` title. It is a
  **snapshot**, true as of its timestamp: derived from current files at the moment it was
  produced, never revised afterward to stay current. A later report is a new file.
- **Provenance footer.** Like every working-state artifact with a body, it ends with the
  `Authored by … / Changed by …` footer.

**This overrides two framework rules.** The `code/ruby` package's `lib-report-format` rule
says "Do not write the rendered report to a file — it is printed output only," and the
`testing` package's `test-report-format` rule repeats it ("neither report is written to a
file"). In this project that instruction is reversed. The framework rules are otherwise
unchanged: their prescribed sections and their instruction to re-derive everything from
current files still hold — only the printed-output-only restriction is lifted.

**Why:** a report is derived from state that moves. Printed and discarded, it answers a
question once and leaves nothing to compare against; recorded and dated, a sequence of them
shows how the project's state changed — which tests appeared, when the deferred queue grew,
what the suite counted a month ago. The cost of keeping one is a file; the cost of not
keeping it is that the comparison can never be made after the fact, because the state it
described is gone.

**Why the confirmation:** not every report is worth keeping. Many are asked in passing — a
suite count checked mid-task, a tree glanced at while naming a test — and saving those
fills the directory with snapshots nobody will compare. Which reports become part of the
record is a judgment about what will matter later, and that judgment is the developer's. The
prompt also comes after the report is rendered, when its contents are visible, so the
decision is made on the actual report rather than on the intention to produce one.

**Why `waytide/sessions/`:** the developer directed this directory. It is the home of the
records written to be read by a person rather than consulted as truth-of-record, which is
what a report is — a rendering for a reader, pointing at the durable files it was derived
from. Note that it means the directory holds two kinds of document: session records, which
follow the shape in foundation's `agent-sessions-convention`, and reports, which follow the
shape of their own report rule. A report is not a session record and is not held to that
shape.

**How to apply:** on a report request, render the report per its own format rule and print
it. Then ask through the selection UI whether to save it. On confirmation, write the same
content to `waytide/sessions/` with a UTC-prefixed filename, a titled heading, and a
provenance footer; on a decline, print nothing further and leave no file. Do not revise a
recorded report later — produce a new one. Related: foundation's `status-report-format` and
`agent-sessions-convention`, the `design-by-efferent` package's present-every-prompt rule
(the selection UI and its built-in escape), the
`testing` package's `test-report-format` and `test-tree-command`, the `code/ruby` package's
`lib-report-format`, and foundation's `agent-file-names` and
`working-state-artifacts-carry-a-provenance-footer` rules.

---

Authored by Scott Bellware on Sat Jul 25 2026 at 11 PM PT
Changed by Scott Bellware on Sat Jul 25 2026 at 11 PM PT
