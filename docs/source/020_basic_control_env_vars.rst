Basic Control with Environment Variables
----------------------------------------

.. role:: raw-latex(raw)
   :format: latex

Environment variables are used to control and include module commands in the modulefile generation.
For a basic modulefile only the ``NAME``, ``VER`` and ``TOPDIR`` variables are required.

Required Environment Variables:

   ==============    =======   ======================   ========================
   Env. Var. Name    default   Description              example     (export ...)
   ==============    =======   ======================   ========================
   NAME              (none)    package name             NAME=remora 
   VER               (none)    package version          VER=1.8.2 
   TOPDIR            (none)    package top-level dir.   TOPDIR=$HOME/apps/remora
   ==============    =======   ======================   ========================

 .. raw:: latex

    \newpage

Prefix Environment Variable:

   ==============    =======   ======================   ========================
   Env. Var. Name    default   Description              example     (export ...)
   ==============    =======   ======================   ========================
   PREFIX            my\_      prefix for module name   PREFIX="" #for no prefix
   ==============    =======   ======================   ========================

The ``NAME`` and ``VER`` values are used to make a modulefile in ``$HOME/modulefiles`` (default, automatically
creates directory if it doesn't exist) with the pathname  ``$NAME/$VER``.  For the above input
the created modulefile is ``$HOME/my_remora/1.8.2`` for a Tcl module system and ``$HOME/my_remora/1.8.2.lua``
for a Lua module system. The content of the modulefile is derived from the directories and
files within the ``$TOPDIR`` directory.  The command::

      $ module load my_remora
      $ module load my_remora/1.8.1    # name and (optional) version used here

will load the module for the example remora installation. Retain the default prefix (``my_``) 
if a version of the package is available in the Modules Environment System (MES), 
so that their is no confusion or complication involving which environment you will obtain.
Otherwise you my want to specify no prefix for a simpler load command::

       $ module load remora            # PREFEX="" set before mkmod execution
       $ module load remora/1.8.2      # PREFEX="" set before mkmod execution

There are a few details and best practices that users might find useful:

   Check the location of the mkmod modulefiles directory in the ``MODULEPATH`` variable.  
   If it appears at the beginning, then the ``module use <modulefiles_dir>`` 
   in your startup directory is appropriately appending to the ``MODULEPATH``
   variable (as designed). 
   In this case, if you use no prefix (export ``PREFIX=""``) your modulefile 
   will be selected over a same-name site-wide modulefile; otherwise, 
   keep the default ``my_`` prefix.

   If you install multiple versions of a modulefile, the command 
   ``module load <module>`` will usually provide the latest version by default; 
   if this is not the case, specify  the version as shown above, or simply 
   remove old modulefiles if they are no longer needed. 

   If you are experimenting with mkmod, here is the normal procedure to follow:

   * Set ``NAME``, ``VER`` and ``TOPDIR`` environment variables
   * Execute ``mkmod``
   * If mkmod reports any problems, fix the problem and execute mkmod again.
     (The old modulefile, if it exists, is overwritten.)

   |

   * Execute: ``module load my_<pkg_name>``
   * If this doesn't create the right environment; then execute:
     **module unload my_<pkg_name>**
   * Adjust what you need with mkmod environment variables
   * Execute ``mkmod`` again

   |

   * If you are not certain about what environment variables
     mkmod is seeing, then execute:
     ``mkmod -r`` to display what it will be using.
     (The list is preceded by an *unset command*, so it can be executed, as shown next.)
   * To start all over again setting mkmod environment variables, excute:
     ```mkmod -r``` in a bash/zsh shell (``eval`` ```mkmod -r```  for csh-type shells).  
     The backticks specify execution of the output from ``mkmod -r``.

(Remora also needs the ```REMORA_BIN``` variable set for full operation, as shown in the next section 
:ref:`Use Cases for HPC Users <remorabin>`.)
