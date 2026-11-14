PRIVATE
  Anything given to /private is recorded only in the private directory,
  outside the project's repository, and is read only on command.

  /private <file path>             Copy the file to the private directory
  /private item <words>            Write a private item
  /private log <words>             Write a private log entry
  /private journal <words>         Write a private journal entry
  /private session <instruction>   Carry out the instruction in a private
                                   session, whose records all go to the
                                   private directory
  /private session end             End the private session. After 4 minutes
                                   with no prompt, the agent asks whether
                                   to continue it or end it
  /private read <name>             Read a private record
  /private list [<kind>]           List the private records
  /private help                    Print this command's help
