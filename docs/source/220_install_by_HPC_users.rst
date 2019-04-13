Installation by HPC Users
-------------------------

Users can easily install mkmod in their user space.  Just get *mkmod* from the
TACC repo with a ``git`` command, set ``INSTALL_DIR`` to an install directory and
execute ``make``. The makefile uses  the installed mkmod to create and install 
a ``my_mkmod`` modulefile.
Setting ``INSTALL_DIR`` is optional, default installation is the present working directory.
See the INSTALL text file in the mkmod directory for the specifics of the install commands.

Any user-owned *build* and *install* directory are fine. Directories ``build`` and ``apps`` are 
used below in this example of installation commands::

          $ mkdir -p $HOME/build  $HOME/apps
          $ cd       $HOME/build

          $ git    clone https://github.com/tacc/mkmod
          $ cd     mkmod 

          $ export INSTALL_DIR=$HOME/apps
          $ make   user #uses itself to install & create a my_mkmod modulefile

          $ module load my_mkmod  # do after logout and login,
                                  # to execute startup scripts
