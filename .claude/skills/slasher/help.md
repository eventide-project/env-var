SLASHER SKILLS

Usage: /<command> [<subcommand>] [<arguments>]
       A command typed with no subcommand asks which one is meant,
       except where a bare command has its own meaning, shown below.
       A bare /slasher offers topics to learn about. /command-table prints
       the command domain table, one line for each command domain, and
       /commands and /; are aliases of /command-table. /shortcuts
       prints the shortcuts table, and /sc and /: are aliases of /shortcuts.
       /slasher help prints this help, and /help is an alias of
       /slasher help.

ITEMS
  Items hold the project's thinking: ideas, plans, designs, notes, and work
  to be done, each with a state.

  /item new [<kind>]               Create an item tagged [<kind>], or [idea]
                                   with no kind. Any kind may be named.
  /item <kind>                     An alias of /item new <kind>, where the
                                   kind is not also a subcommand of /item
  /item idea, /idea                Create an item tagged [idea]
  /item improvement, /improvement  Create an item tagged [improvement]
  /item correction, /correction    Create an item tagged [correction] [work]
                                   [rework]
  /item rework, /rework            Create an item tagged [rework] [work]
                                   [correction]
  /item work, /work, /work-item    Create an item tagged [work]
  /item plan, /plan                Create an item tagged [plan]
  /item design, /design            Create an item tagged [design]
  /item aspiration, /aspiration    Create an item tagged [aspiration]
  /item goal, /goal                Create an item tagged [goal]
  /item note, /note                Record a note
  /notes [<n>]                     List the notes, or the n most recent
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item brainstorm                 Create an item tagged [brainstorm]. A
                                   brainstorm that names no kind ends as one
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open, Active, and Implementation)
  /item status [<item>]            The item's state, what exists, and what
                                   is left. <item>: a number from the last
                                   list, a datetime, or words from the
                                   title. With none, the Active item

  /item start, /start              Open, or Recorded for a goal or an
                                   aspiration -> Active
  /item complete, /complete        -> the kind's concluding state:
                                   Realized, Completed, Corrected, or
                                   Resolved
  /item realize, /realize          -> Realized
  /item defer, /defer              -> Deferred (kept to do later)
  /item suspend, /suspend          -> Suspended
  /item discontinue, /discontinue  -> Discontinued (no plan to do it)
  /item obsolete, /obsolete        -> Obsolete
  /item supersede, /supersede      -> Superseded, naming the replacement
  /item abandon, /abandon          -> Abandoned
  /item resume, /resume            Any state but Open, Active, or
                                   Recorded -> Open or Active

  Each state change also acts on a feature or an experiment, and
  asks which record is meant where the words do not say. A state
  the record cannot take is refused. /affirm, /refute, and
  /inconclusive act on a feature or an experiment only.

  /item help                       Print this command's help

  /note help                       Print this command's help

  A bare /idea is /idea new. A bare /note is /note new.
  A kind that is also a subcommand, such as list, is created with
  /item new list.

FEATURES
  A feature builds something the project needs, on its own branch or worktree,
  to a declared end. Features and experiments are both kinds of implementations.

  /feature new                     Create its branch and an Open record
  /feature new with phases         Create it, asking for its phases
  /feature status [<feature>]      Phases, state, what exists, and
                                   what is left. <feature>: a number
                                   from the last list, a datetime, or
                                   words from the title
  /feature start, /start           Open -> Active, or, where none is
                                   Open, create one Active
  /feature complete, /complete     -> Completed, or asks which state
                                   where there is a forecast
  /feature affirm, /affirm         -> Affirmed (engineer's declaration only)
  /feature refute, /refute         -> Refuted
  /feature inconclusive, /inconclusive
                                   -> Inconclusive
  /feature defer, /defer           -> Deferred (kept to do later)
  /feature suspend, /suspend       -> Suspended
  /feature discontinue, /discontinue
                                   -> Discontinued (no plan to do it)
  /feature obsolete, /obsolete     -> Obsolete
  /feature supersede, /supersede   -> Superseded, naming the replacement
  /feature abandon, /abandon       -> Abandoned
  /feature resume, /resume         Any state but Open or Active -> Active
  /features [current] [<n>]        The current features, or the n most recent
  /feature help                    Print this command's help

  Either kind opens with a question or an intent. A forecast is
  stated when it is created, where you give one, and the verdict is asked
  when the work completes.

EXPERIMENTS
  An experiment tests a question on its own branch or worktree, to a declared
  end. Features and experiments are both kinds of implementations.

  /experiment new                  Create its branch and an Open record
  /experiment new with phases      Create it, asking for its phases
  /experiment status [<experiment>]
                                   Phases, state, what exists, and
                                   what is left. <experiment>: a number
                                   from the last list, a datetime, or
                                   words from the title
  /experiment start, /start        Open -> Active, or, where none is
                                   Open, create one Active
  /experiment complete, /complete  -> Completed, or asks which state
                                   where there is a forecast
  /experiment affirm, /affirm      -> Affirmed (engineer's declaration only)
  /experiment refute, /refute      -> Refuted
  /experiment inconclusive, /inconclusive
                                   -> Inconclusive
  /experiment defer, /defer        -> Deferred (kept to do later)
  /experiment suspend, /suspend    -> Suspended
  /experiment discontinue, /discontinue
                                   -> Discontinued (no plan to do it)
  /experiment obsolete, /obsolete  -> Obsolete
  /experiment supersede, /supersede
                                   -> Superseded, naming the replacement
  /experiment abandon, /abandon    -> Abandoned
  /experiment resume, /resume      Any state but Open or Active -> Active
  /experiments [current] [<n>]     The current experiments, or the n most recent
  /experiment help                 Print this command's help

PHASE
  Phases split a feature or an experiment into steps, run one at a time, each on
  its own sub branch.

  /phase, /phase current           The current phase, its goal, and its branch
  /phase status                    The phases, the current one emphasized,
                                   and its goal
  /phase new <name>                Create a phase after the last
  /phase start                     Start the next phase
  /phase complete                  -> Completed, merged into the implementation
  /phase affirm                    -> Affirmed (engineer's declaration only)
  /phase refute                    -> Refuted (the phase's proposition is
                                   not realized)
  /phase inconclusive              -> Inconclusive

  Whether a phase states a forecast is asked when it is created.
  A phase with one is asked the verdict question when it completes.

  /phases                          List the phases, the current one emphasized

  /phase help                      Print this command's help

PROCESS
  These commands move the work under way along: take its next step, or say what
  was done and what's next.

  /items                           Every item, whatever its state
  /items current                   The current items (/item list current)
  /i                               An alias of /items current
  /current [<n>]                   The current items, or the n most recent,
                                   then the current features and experiments
  /' [<n>]                         An alias of /current
  /c [<n>]                         An alias of /current
  /recent                          Brief summary of recent work, and what's
                                   next
  /?                               An alias of /recent
  /status [<record>]               The status of the work under way, or of
                                   the item, feature, or experiment named

  /next                            Proceed to the next step in the current
                                   multi-step process or with the action
                                   that the agent is suggesting, or resume
                                   interrupted work
  /proceed                         An alias of /next
  /.                               An alias of /next
  /next?                           "What are we doing?" or "what's next?"
                                   The next step in the current multi-step
                                   process, or the step that has been
                                   interrupted.

  /unattended <request>            Carry out the request on the agent's own,
                                   after a plan is proposed
  /! <request>                     An alias of /unattended

  /ask-again                       Repeat the agent's previous multiple-choice
                                   question
  /aa                              An alias of /ask-again

  /pros-and-cons [<words>]         Give each option of the agent's last
                                   question with its pros and cons. Then
                                   /ask-again puts the question again
  /??                              An alias of /pros-and-cons

  /estimate-confidence             The agent's confidence of proceeding
                                   unattended from where the work stands
  /%                               An alias of /estimate-confidence

  /process help                    Print this command's help

LOG
  The log records what was decided and when, and a work session record tells the
  story of a stretch of work.

  /log                             Write a log entry for the current work
  /log <message>                   Write a log entry with this message
  /log summary                     Summarize the log

  /decision [<decision>]           Log a decision, tagged [decision]

  /work-session new | amend        Write or amend a work session record

  /log help                        Print this command's help

RECORD
  These commands print or copy the path of, print, or open the most recent
  principal record, and open any record by name.

  /record                          Print the record's path
  /record copy                     Copy the record's path to the clipboard
  /record print                    Print the record's contents
  /record open                     Open the record in its default application
  /open <record>                   Open the record named in its default
                                   application. <record>: an ordinal from
                                   the last list, a handle, a path, or
                                   words from its title
  /record help                     Print this command's help

RECORDS
  The records line ends a reply that wrote a record, with the full path of the
  record it is about.

  /records, /records show          Print every record the previous reply
                                   wrote. A reply prints its principal
                                   record alone
  /records help                    Print this command's help

JOURNAL
  The journal is the writer's own record of what they think, either stored with
  the project or kept in a private journal.

  /journal, /journal new, /journal entry
                                   Write an entry in the project journal
  /journal private                 Write a private journal entry
  /journal read private            Read the private journal
  /journal list [<timespan>]       List entries by date, all or within
                                   a timespan
  /journal publish-private         Move a private entry to the project journal
                                   (requires confirmation)
  /journal help                    Print this command's help

PRIVATE
  Anything given to /private is recorded only in the private directory,
  outside the project's repository, and is read only on command.

  /private                         Start a private session, whose records
                                   all go to the private directory
  /private end                     End the private session. After 4 minutes
                                   with no prompt, the agent asks whether
                                   to continue it or end it
  /private <file path>             Copy the file to the private directory
  /private item <words>            Write a private item
  /private log <words>             Write a private log entry
  /private journal <words>         Write a private journal entry
  /private session <instruction>   Carry out the instruction in a private
                                   session
  /private session end             End the private session, as /private end
                                   does
  /private read <name>             Read a private record
  /private list [<kind>]           List the private records
  /private help                    Print this command's help

BRAINSTORMING
  Brainstorming records points as they are said, freeform in no order, and
  organizes them when the writer is done.

  /brainstorm, /brainstorm start   Start brainstorming
  /brainstorm end                  End it, and organize what was said into a
                                   [brainstorm] item
  /brainstorm suspend              Suspend the brainstorm
  /brainstorm resume               Resume a brainstorm that has ended or is
                                   suspended
  /brainstorm <kind>               Brainstorm and record it in an item of
                                   that kind
                                   <kind>: idea, work, plan, design,
                                   aspiration, goal, note, mistake,
                                   or problem
  /brainstorm help                 Print this command's help

TESTS
  These commands run the project's tests, or other compliance routines,
  quality checks, and report on them.

  /test                            Run the automated suite
  /test interactive [<test>]       Run an interactive test, or ask which
  /test report, /test-report       Classify the suite
  /test tree, /test-tree           Run the suite and print its context tree
  /test help                       Print this command's help

PUSH
  These commands commit the work and push the current branch to its remote,
  and never force.

  /push                            Push the current branch to its upstream
  /p                               An alias of /push
  /commit-and-push                 Run the suite, commit the work, then push
                                   the current branch
  /cp                              An alias of /commit-and-push
  /push help                       Print this command's help

PROJECTS
  This command lists the Slasher projects registered on this machine. The list
  helps move ideas, new patterns, and corrections into other projects.

  /projects                        The machine's registry of Slasher projects
  /projects -base <instruction>    Carry out the instruction in this project's base project
  /projects -system <instruction>  Carry out the instruction in the machine's system project
  /projects <name> <instruction>   Carry out the instruction in the registered project of that name
  /projects help                   Print this command's help

RELEASE
  This command presents the candidates for a package's next version, for the
  engineer to choose.

  /release                         Choose the next version
  /release help                    Print this command's help

PACKAGE
  These commands manage the installed packages: which are active, updating
  them, and installing Slasher.

  /package activate <package>      Activate an installed package
  /package deactivate <package>    Deactivate an installed package
  /package update [<package>...]   Update installed packages
  /package install                 Install Slasher
  /install [<set or packages>]     Install Slasher where it is not installed

  /package-set                     Show the active package set
  /package-set <set or packages>   Declare the package set

  /package help                    Print this command's help

PACKAGES
  These commands list the installed packages, update them, and act on one
  package.

  /packages                        List the installed packages, whether
                                   each is active, and what each is
  /packages update [<package>...]  An alias of /package update
  /packages <package> [<act>]      Act on one package. <act>: update,
                                   activate, or deactivate. With no act,
                                   asks which

  /packages help                   Print this command's help

LANGUAGE
  These commands work on language: reserving a word, ETE, Slasher's
  implementation of STE and its extensions, and clarifying language, often the
  agent's.

  /expand                          Expand the previous answer
  /brief [<request>]               Answer the request in brief, or give the
                                   previous answer again in brief

  /reserve <word>                  Reserve a word, in six steps

  /ete [<text>]                    Say the previous answer, or the text, in
                                   Eventide Technical English

  /language help                   Print this command's help

LOAD
  This command loads the rules now, without waiting for the first prompt.

  /load                            Load the rules now
  /load help                       Print this command's help
