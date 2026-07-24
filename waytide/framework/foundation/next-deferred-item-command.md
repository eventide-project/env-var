# The "next deferred item" command: list the deferred items and prompt for a selection

When the developer gives the command **"next deferred item"**, list the items
currently in `waytide/deferred/` and **prompt the developer to select one** to take
up next. Do not pick one automatically — present the list and let the developer
choose.

**How to apply:** on the command, read `waytide/deferred/`, present each item
through the selection UI (one option per deferred item, labelled by its title /
one-line hook), and let the developer pick which to work on. If there are more
items than the selection UI's option limit, list them in prose and ask. Once the
developer selects one, take up that item (build it out per its "How to apply", or
discuss first if it needs settling). Related: the deferred-item convention and the
other command rules (status report, test tree, lib report).

---

Authored by Scott Bellware on Wed Jul 1 2026 at 2 PM PT
