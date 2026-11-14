PHASE
  Phases split a feature or an experiment into steps, run one at a time, each on
  its own sub branch.

  /phase, /phase current           The current phase, its goal, and its branch
  /phase add <name>                Add a phase after the last
  /phase start                     Start the next phase
  /phase complete                  -> Completed, merged into the implementation
  /phase affirm                    -> Affirmed (engineer's declaration only)
  /phase refute                    -> Refuted (the phase's proposition is
                                   not realized)
  /phase inconclusive              -> Inconclusive

  Whether a phase states a forecast is asked when it is added.
  A phase with one is asked the verdict question when it completes.

  /phases                          List the phases, the current one emphasized

  /phase help                      Print this command's help
