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

  /item start, /start              Open, or Recorded for a goal or an
                                   aspiration -> Active
  /item complete, /complete        -> the kind's concluding state:
                                   Realized, Done, Corrected, or Resolved
  /item realize, /realize          -> Realized
  /item done, /done                -> Done ([work] and [rework] items)
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
