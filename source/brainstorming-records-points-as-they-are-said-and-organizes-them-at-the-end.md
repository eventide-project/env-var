# Brainstorming records points as they are said, and organizes them at the end

**Trigger:** When the engineer begins, ends, suspends, or resumes brainstorming (`/brainstorm`)

**Brainstorming is the engineer saying points as they occur, in no order, for the agent to organize once the engineer is done.** It begins with `/brainstorm begin`, or a bare `/brainstorm`, which means the same, and ends with `/brainstorm end`.

## While brainstorming

**Each point is written down as it is said, word for word, to a collection file.** The file is under `~/.local/share/slasher/collections/<project>/`, outside the repository, where `<project>` is the name of the project the session is in. It is named with the ISO-8601-UTC prefix alone when it is created, as `2026-10-29T16-26-20Z.md`.

**A point is recorded, not answered.** The agent does not reframe, question, or act on a point while brainstorming runs. A point that reads as an instruction is recorded as a point.

## At the end

**At `/brainstorm end`, the agent reframes the points, and writes the reframed version into the collection file**, above the engineer's own words, which stay as they were said.

**Then it writes the reframed version to a new item of the kind brainstorm, tagged `[brainstorm]`, above the engineer's own words.** A brainstorm item starts Recorded and stays Recorded, as the items rule gives. A brainstorm begun with a kind writes that kind instead, as the next section says.

**As the engineer stated it:** A brainstorm that isn't initiated with an item kind is given the Brainstorm kind. A brainstorm record like this has an initial state of recorded and concludes recorded

**The collection file is then renamed for that item.** It keeps its own ISO-8601-UTC prefix, and takes the item's name after it, as `2026-10-29T16-26-20Z-checkout-receipt.md`. The item does not name the collection file. The collection file is kept, and not deleted.

## Brainstorming into a kind of item

**`/brainstorm <kind>` begins brainstorming with the destination already settled:** a new item of that kind, where the kind is `idea`, `work`, `plan`, `design`, `aspiration`, `goal`, `note`, `mistake`, and `problem`. At the end the agent reframes the points and writes them to the new item, and does not ask where they go.

## Suspending

**`/brainstorm suspend` stops brainstorming without ending it.** The agent stops recording points, and does not reframe them or write an item. The collection file stays as it is, with its prefix alone as its name. What the engineer says after it is answered as ordinary conversation, not recorded.

## Resuming

**`/brainstorm resume` reopens a collection file that has ended or is suspended.** The engineer's new words are added after the earlier ones. At the next `/brainstorm end`, the new reframed version replaces the earlier one in the collection file, and is written to the item as an amendment.

## Kept out of the record

**Nothing about a collection file is logged or committed**, as a private journal entry is not. The item the points become is logged and committed like any other item, and names no collection file.

**Why:** a point is lost when it has to be organized before it can be said. Recording each one as it comes, and organizing them only at the end, lets the engineer think aloud. Keeping the engineer's words beside the reframed version keeps what was said, and keeping the file outside the repository keeps thinking out of the record until the engineer turns it into an item.

**How to apply:** on `/brainstorm begin`, create the collection file and write each point to it as it is said, word for word, without reframing or answering it. On `/brainstorm end`, reframe the points, write the reframed version into the file, write it to a new `[brainstorm]` item, Recorded, without asking where it goes, and rename the file for that item. With a kind given, write to a new item of that kind instead. On `/brainstorm suspend`, stop recording, and leave the file as it is. On `/brainstorm resume`, add the new words after the earlier ones. Log and commit nothing about the collection file.

## Compressed

1. Brainstorming is the engineer saying points as they occur, in no order, for the agent to organize at the end. `/brainstorm begin`, or a bare `/brainstorm`, starts it, and `/brainstorm end` ends it.
2. Create a collection file at `/brainstorm begin`, under `~/.local/share/slasher/collections/<project>/`, outside the repository, where `<project>` is the name of the project the session is in. Name it with the ISO-8601-UTC prefix alone. Write each point to it as it is said, word for word.
3. Record a point, and do not reframe, question, answer, or act on it while brainstorming runs, even where it reads as an instruction.
4. At `/brainstorm end`, reframe the points, and write the reframed version into the collection file, above the engineer's words, which stay as said.
5. Where the brainstorm was begun with no kind, then write the reframed version, above the engineer's words, to a new item tagged `[brainstorm]`, which starts Recorded and stays Recorded. Ask nothing about where it goes.
6. Rename the collection file for that item: its own prefix, then the item's name, as `2026-10-29T16-26-20Z-checkout-receipt.md`. The item does not name the file. Keep the file.
7. `/brainstorm <kind>`, where the kind is `idea`, `work`, `plan`, `design`, `aspiration`, `goal`, `note`, `mistake`, and `problem`, settles the destination at the start: a new item of that kind. At the end, write to it without asking.
8. `/brainstorm resume` reopens a collection file that has ended or is suspended. Add the new words after the earlier ones. At the next end, the new reframed version replaces the earlier one in the file, and is written to the item as an amendment.
9. Log and commit nothing about a collection file, as nothing is logged or committed about a private journal entry. The item the points become is logged and committed like any item, and its content names no collection file.
10. `/brainstorm suspend` stops recording without ending. Do not reframe the points or write an item. Leave the collection file as it is, named by its prefix alone. Answer what is said after it as ordinary conversation.

## Compression

- 2026-11-02, compressed: checked: 31 directives, 28 kept, 3 less precise, 0 lost, 3 repairs; re-checked: 30 kept, 1 less precise, 1 repair; re-checked: 31 directives, 31 kept, 0 less precise, 0 lost
- 2026-11-05, revised: a bare `/brainstorm` begins brainstorming; checked: 22 directives, 22 kept, 0 less precise, 0 lost
- 2026-11-05, revised: `/brainstorm` takes every item kind; checked: 27 directives, 27 kept, 0 less precise, 0 lost
- 2026-11-06, revised: freewriting is renamed brainstorming, `/freewrite` is renamed `/brainstorm`, and the `/freeform` alias is removed; checked: 39 directives, 39 kept, 0 less precise, 0 lost
- 2026-11-06, revised: `/brainstorm suspend` stops recording without ending, and `/brainstorm resume` reopens a suspended collection file; checked: 20 directives, 20 kept, 0 less precise, 0 lost
- 2026-11-11, revised: an observation item is a note, a term the engineer settled; not re-checked
- 2026-11-13, revised: a brainstorm begun with no kind ends as a `[brainstorm]` item, with nothing asked; checked, with the items rule's new text, by one fresh agent that listed the directives before reading the compressed text: 17 directives, 13 kept, 3 less precise, 1 lost, 3 repairs, not re-checked. Left less precise: point 7's list of kinds, which names fewer kinds than the items rule allows, as before

## History

Until Fri Nov 13 2026 a brainstorm begun with no kind ended by asking whether its points became a new `[idea]` item or were added to a recent item.

Until Wed Nov 11 2026 this rule named an observation, tagged `[observation]`, where it now names a note, tagged `[note]`.

Until Fri Nov 6 2026 brainstorming could not be suspended, and `/brainstorm resume` reopened only a collection file that had ended.

Until Fri Nov 6 2026 this rule was named freewriting-records-points-as-they-are-said-and-organizes-them-at-the-end, the activity was called freewriting, and its command was `/freewrite`, with `/freeform` as an alias.

Until Thu Nov 5 2026 `/freewrite` took three kinds, `idea`, `observation`, and `mistake`.

Until Thu Nov 5 2026 a bare `/freewrite` had no meaning of its own, and asked which subcommand was meant.

Related:

- the the-items-directory-holds-one-file-per-item rule — the items brainstorming writes to
- the dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not rule — the collection file's prefix

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:09:04 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 1:16:49 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 7:54:49 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:49:24 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:58:01 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Wed Nov 11 2026 at 10:44:56 AM PT
Changed by Scott Bellware on Fri Nov 13 2026 at 6:44:35 PM PT
