# Anything given to `/private` is recorded only in the private directory

**Trigger:** When the engineer types `/private`, or asks to write, read, or list a private record, or starts or ends a private session

1. A private record is a record the engineer keeps for a project outside the project's repository. It is not committed with the project.
2. Anything given to `/private` is recorded only in the private directory. Nothing of it is written into the project.
3. A private record is a document, an item, a log entry, or a journal entry. In a private session, it is also a work session record, an implementation record, or a loop record.
4. Its contents are what the engineer directs. Write the engineer's words, or what the engineer asks the agent to write. Add nothing on your own initiative.

## The private directory

1. Every private record is under one root, `~/.local/share/slasher/`. Per-machine settings stay under `~/.config/slasher/`, which this root does not share.
2. Each kind has its own directory under the root, and each project has one directory in each kind's directory. The project's directory is named for the project's repository directory.
3. In a git worktree, the project's directory is named for the main repository's directory, not the worktree's. Every worktree of a project and its main checkout use one directory. Read the name from the parent of `git rev-parse --path-format=absolute --git-common-dir`.

| Kind | Directory |
|---|---|
| document | `~/.local/share/slasher/documents/<project>/` |
| item | `~/.local/share/slasher/items/<project>/` |
| log entry | `~/.local/share/slasher/log/<project>/` |
| journal entry | `~/.local/share/slasher/journal/<project>/` |
| work session record | `~/.local/share/slasher/work-sessions/<project>/` |
| implementation record | `~/.local/share/slasher/implementations/<project>/` |
| loop record | `~/.local/share/slasher/loops/<project>/` |

4. One file in a project's directory is one record.
5. No directory has a `<username>` directory. The private directory belongs to one user.
6. A directory may not exist, and its absence is ordinary. Make it when the first record of its kind for that project is written.

## What `/private` records

1. **A file path**, as in `/private notes/pricing.md`: copy that file to the private directory, into the project's documents directory there, with its name and content unchanged. The copy is a private document. The original stays where it is.
2. **`item <words>`**: write a private item.
3. **`log <words>`**: write a private log entry.
4. **`journal <words>`**: write a private journal entry, by the journal package's private-journal-convention, as `/journal private` does.
5. **`session <instruction>`**: start a private session, and carry out the instruction in it.
6. **`session end`**: end the private session.
7. Words that are not a subcommand and not a path to an existing file are not guessed at. Say so, and ask which subcommand is meant, through the selection interface.

## A private session

1. `/private session <instruction>` starts a private session. It lasts until the session ends, or until `/private session end`.
2. In a private session, every record the agent writes goes to the private directory, in the directory for its kind, and never into the project. That holds for a record the engineer asks for and for a record a rule asks for.
3. A record is a file under `slasher/local/` that a rule tells the agent to write: an item, a log entry, a journal entry, a work session record, an implementation record, or a loop record.
4. Carry out the instruction after `session` in the private session. Where no instruction was typed, start the private session and wait for the engineer's request.
5. When the private session starts, say once that the session's records go to the private directory. Say it again when it ends.
6. A file that is not a record still changes in the project, as the work asks. Code, a test, a rule, a vocabulary, a README, and a skill are not records.
7. The log-entry hook still writes into the project's log. In a private session, move each entry it writes to the private log directory, before anything is committed.
8. Commit no record written in a private session, and log nothing in the project about the private session.
9. A record that already exists in the project stays there. Do not change its state or its content in a private session. Where the work asks for that change, say so, and ask, through the selection interface, whether to end the private session first.
10. A private session does not reach another session. A record written in another session at the same time goes into the project as usual.

## A private session times out

1. A private session times out when 4 minutes pass with no prompt from the engineer.
2. The plugin's hook on each prompt keeps the time. `/private session` writes the session's state file, in `~/.local/state/slasher/private-sessions/`, named for the session. Each prompt in the private session writes its time there. `/private session end` removes the file.
3. Where a prompt comes more than 4 minutes after the last one, the hook tells the agent so. Before anything else, ask the engineer, through the selection interface, whether to continue the private session or end it.
4. The options are **Continue** and **End**. Continue keeps the private session, and its 4 minutes count from the prompt that brought the question.
5. End ends the private session: delete the state file the hook names, and say that the session's records go into the project again.
6. Then take up the prompt that brought the question, under what the engineer selected.
7. The question carries no decision marker, and nothing about it is logged.

## A private record's shape

1. **A document** keeps the name of the file given. It takes no datetime prefix, no state suffix, and no provenance footer.
2. **An item** takes an item's shape: the ISO-8601-UTC prefix, the state suffix, a `**State:**` line, a `**Tags:**` line, and the provenance footer.
3. **A log entry** takes a log entry's shape: the ISO-8601-UTC prefix and a one-line title, with a `**Tags:**` line or a body where it needs one.
4. **A journal entry** takes the shape the private-journal-convention gives it.
5. **A work session record, an implementation record, or a loop record** takes the shape its own rule gives it, with no log entry in the project and no commit.
6. Where a file of that name is already there, ask, through the selection interface, whether to replace it or to use another name.

## Only on the engineer's command

1. Write, read, or list a private record only when the engineer asks for it. A private session is the engineer's request for every record the session writes.
2. `/private read` reads the record the engineer names. `/private list` lists the project's private records, of every kind or of the kind named.
3. Do not read a private record at session start.
4. Do not read one to answer a question, unless the engineer names it.
5. Do not offer to write a private record, or name the private directory as a place to put something.
6. Log nothing in the project about a private record: not its creation, a change to it, its being read, or its move into the project. This holds where another rule asks for a log entry.
7. A private item takes no log entry in the project when it is written or when its state changes.
8. A private record takes no commit.
9. Whether the private directory is under version control is the engineer's decision. Neither ask for it nor forbid it.

## Moving a private record into the project

1. A private record moves into the project only on the engineer's command.
2. The engineer names where it goes. Where the engineer names no place, ask, through the selection interface.
3. Before the move, name the record and its destination, and ask, through the selection interface, whether to move it. The move publishes it to every reader of the repository.
4. Move the file with its content unchanged, and remove it from the private directory.
5. It is then a file of the project. Where it goes under `slasher/local/`, it takes that directory's conventions from then on.
6. A private journal entry moves by the private-journal-convention.
7. Nothing else moves a private record. Do not offer to move one.

## What private does not promise

1. Private means kept out of the project's repository and out of the session-start read, and nothing more.
2. It does not keep a record on the machine. A record the agent writes or reads is plain text in the session. It reaches the model provider, the local transcript, and any hook that is installed.

**Why:** an engineer has material about a project that is not for the project's repository: a draft not ready to share, a note about a person, an idea not ready to be seen, or a document from someone else. Kept in the repository, it is committed and read by every reader. Kept anywhere else, the agent cannot find it. One command that records only in a fixed directory per project, read only on command, keeps it at hand without publishing it.

**How to apply:** when the engineer types `/private`, record what was given in the project's directory for its kind under `~/.local/share/slasher/`. Do only the act asked for, write nothing into the project, log nothing, and commit nothing. In a private session, write every record there until the session or the private session ends.

## History

1. Until Thu Nov 12 2026, a private session had no time limit.
2. Until Thu Nov 12 2026, `/private` recorded only what was given to it. It had no private session.
3. Until Thu Nov 12 2026, the rule named the project's directory for the project's repository directory and did not say which directory that is in a git worktree. A record written from a worktree was put in a directory named for the worktree.

Related:

- the journal package's private-journal-convention — the private journal, kept under the same root
- the the-items-directory-holds-one-file-per-item rule — the shape a private item takes
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the shape a private log entry takes
- the brainstorming-records-points-as-they-are-said-and-organizes-them-at-the-end rule — another record kept outside the repository
- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — per-machine configuration under `~/.config/`, beside which this keeps data

---

Authored by Scott Bellware on Thu Nov 12 2026 at 10:13:55 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:21:02 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:22:47 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 10:29:33 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:13:01 PM PT
Changed by Scott Bellware on Thu Nov 12 2026 at 11:46:17 PM PT
