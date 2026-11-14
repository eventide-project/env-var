PACKAGES
  These commands manage the installed packages: which are active, refreshing
  them, and installing Slasher.

  /package activate <package>      Activate an installed package
  /package deactivate <package>    Deactivate an installed package
  /package refresh [<package>...]  Refresh installed packages
  /package install                 Install Slasher
  /install [<set or packages>]     Install Slasher where it is not installed

  /package-set                     Show the active package set
  /package-set <set or packages>   Declare the package set

  /packages                        List the installed packages, whether
                                   each is active, and what each is
  /packages refresh [<package>...]
                                   An alias of /package refresh
  /packages <package> [<act>]      Act on one package. <act>: refresh,
                                   activate, or deactivate. With no act,
                                   asks which

  /package help                    Print this command's help
