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
