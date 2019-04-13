Package Directories and Makefile
--------------------------------

The makefile is the simplest part of mkmod.  Mkmod is written in bash, so
it is compiler independent, and it installs in ``$PWD`` by default. 
You can optionally set an install directory in the ``INSTALL_DIR`` variable.

Users and site administrator should use ``user`` and ``site`` targets, respectively, in the make execution::

          make user
          make site

For users the ``make user`` command not only installs the mkmod execution files,
it creates a mkmod modulefile (``my_mkmod/<version>`` or ``my_mkmod/<version>.lua`` for Tmod and
Lmod, respectively), and installs it in ``$HOME/modulefiles``. It then requests
permission to insert a ``module use $HOME/modulefiles`` command in an appropriate
startup script (if one doesn't exist),
so that the modules system knows to look in ``$HOME/modulefiles`` for modules.

For site installers the ``make site`` command installs the mkmod execution files,
and creates a module file without a prefix, of the form ``mkmod/<version>`` or
``mkmod/<version>.lua`` for Tmod and Lmod, respectively. The site installer 
will most likely set the ``INSTALL_DIR variable``.  
For site installations, ``MODULEFILES_DIR`` must be set to the site modulefiles
directory for the mkmod utility.

The directory structure of the mkmod package is::

           mkmod/INSTALL
           mkmod/makefile

           mkmod/README
           mkmod/README.md
           mkmod/todo.txt
           mkmod/LICENSE

           mkmod/examples
           mkmod/docs
           mkmod/bin


