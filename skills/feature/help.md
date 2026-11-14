FEATURES
  A feature builds something the project needs, on its own branch or worktree,
  to a declared end. Features and experiments are both kinds of implementations.

  /feature new                     Create its branch and an Open record
  /feature new with phases         Create it, asking for its phases
  /feature status                  Phases, current phase, and its goal
  /feature start, /start           Open -> Active
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
  stated at the start where you give one, and the verdict is asked
  when the work completes.
