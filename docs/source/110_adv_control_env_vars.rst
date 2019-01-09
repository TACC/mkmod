Advanced Control with Environment Variables
-------------------------------------------

Often packages need package-specific environment variables set, or additional entries
in PATH-type variables (``PATH``, ``LD_LIBRARY_PATH``, etc.). 
When a package is installed, required variables are often specified at the end
of the installation output.  You can have mkmod set these in the modulefile. 
If the variable name is ``name`` with the value ``value``, just specify the pair as
``name=value`` in an ``ENV#`` variable before executing mkmod.

For instance, to have the modulefile set ``REMORA_PERIOD``
to ``15`` and ``REMORA_BIN`` to ``$HOME/apps/remora/bin``, export these settings::

          $ export ENV1="REMORA_PERIOD=15"
          $ export ENV2="REMORA_BIN=$HOME/apps/remora/bin"

Mkmod checks for the sequence of variables, ``ENV1``, ..., ``ENV``\ *n*, and creates package
environment variables for the ``name=value`` pairs.


Mkmod (presently) only searches for PATH-type directories 
(those that should be included in ``PATH``, ``LD_LIBRARY``, etc.) 
in the ``$TOPDIR`` (top level) directory.  

To explicitly add additional paths to PATH-type variables, include them with the 
``PATH_LIST``, ``LDPATH_LIST``, ``MANPATH_LIST``, ``PYTHONPATH_LIST`` 
and ``PKGCONFIGPATH_LIST`` variables. 
For example, here is how to use ``PATH_LIST`` to **add** a directory to ``PATH``::

          $ export PATH_LIST="$HOME/bin/my_remora_utils"

The ``$HOME/bin/my_remora_utils`` path is prepended to the PATH variable (after prepending 
``$TOPDIR/bin`` or ``$TOPDIR/scripts`` directories if either or both have been 
automatically detected by mkmod).

To turn off automatic detection, and to insert paths into PATH-type variables for directories
that exist relative to ``$TOPDIR``, manually specify a directory (or set of directories) using 
an appropriate ``TOPDIR_`` prefixed variable:
``TOPDIR_PATH_LIST``, ``TOPDIR_LDPATH_LIST``, ``TOPDIR_MANPATH_LIST``, 
``TOPDIR_PYTHONPATH_LIST``, or ``TOPDIR_CHKCONFIGPATH_LIST`` variable 
(as a colon-separated list, for a set). 

This example manually specifies PATH-type subdirectories relative to $TOPDIR::

          $ export  TOPDIR_LDPATH_LIST=x86_64/libraries/linpack
          $ export TOPDIR_MANPATH_LIST=share/man
          $ export    TOPDIR_PATH_LIST="tools/bin:bin"

Note: It was necessary to include ``bin`` explicitly here in the ``PATH`` variable,
because automatic detection and addition to the ``PATH`` variable is turned off 
by the use of of the ``TOPDIR_PATH`` variable.  

This following example manually specifies PATH-type subdirectories as *absolute paths*,
and retains the automatic search and PATH-type insertions for top-level directories
in ``$TOPDIR``::

          $ export  LDPATH_LIST=$TOPDIR/x86_64/libraries/linpack
          $ export MANPATH_LIST=$TOPDIR/share/man
          $ export    PATH_LIST=$TOPDIR/tools/bin

Note, ``$TOPDIR/bin`` will automatically be detected and inserted in PATH, because
the non-prefixed (i.e. no ``TOPDIR_``) form of the variable, ``PATH_LIST``, is used.
