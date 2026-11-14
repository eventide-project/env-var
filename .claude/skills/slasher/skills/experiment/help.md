EXPERIMENTS
  An experiment tests a question on its own branch or worktree, to a declared
  end. Features and experiments are both kinds of implementations.

  /experiment new                  Create its branch and an Open record
  /experiment new with phases      Create it, asking for its phases
  /experiment status               Phases, current phase, and its goal
  /experiment start, /start        Open -> Active
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
