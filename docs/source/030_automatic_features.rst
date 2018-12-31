Automatic Features
------------------

The basic function of the modulefile generation component in mkmod
is to determine the flavor of the Modules Environment System (Tcl or Lua), 
investigate the directories and files in the ``$TOPDIR`` directory, 
and construct appropriate module commands to create an environment for
operation of the installed package. *Convenience environment variables* 
are also generated; they make it easy to access important directories.
These operations and modulefile creation are called the 
"automatic features" of mkmod.

These are the features mkmod provides automatically:

       :PATH: Finds the ``bin`` and ``scripts`` directories and inserts them into ``PATH``
       :LD_LIBRARY_PATH: Finds the ``lib``, ``libs`` or ``lib64`` directory and inserts it into ``LD_LIBRARY_PATH``
       :MANPATH: Finds the ``man`` directory and inserts it into ``MANPATH``
       :PYTHONPATH: Finds the ``python`` directory and puts it in ``PYTHONPATH``

       :DIR. VARS: Creates *convenience environment variables* that contain the
        directory paths for ``docs``, ``examples``, ``share``, ``include``, etc.:

           ====================    ============      ====================
           Discovered              mkmod             Convenience Variable
           Directory               standard          (remora example,
           in $TOPDIR              abbr.             with default prefix)
                --------             --------          ---------------
           ====================    ============      ====================
           bench | benchmarks      BEN               MY_REMORA_BEN
           bin                     BIN               MY_REMORA_BIN
           data                    DAT               MY_REMORA_DAT
           docs                    DOC               MY_REMORA_DOC
           examples                EXM               MY_REMORA_EXM
           include                 INC               MY_REMORA_INC
           lib | libs | lib64      LIB               MY_REMORA_LIB
           share                   SHR               MY_REMORA_SHR
           tools                   TOL               MY_REMORA_TOL
           tutorials               TUT               MY_REMORA_TUT
           ====================    ============      ====================

       :family: Sets module ``family`` command to  ``NAME`` so that only a single
        module named ``NAME`` is allowed to be loaded at a time.
       :prereq: Appropriate compiler and MPI modules (ones set at the time mkmod is executed)
        are made modulefile *prereq*'s so that the ``module load`` only continues 
        when the appropriate MPI/compiler modules used by the installed package are loaded.
       :help: A module help file is created which provides the above basic information.
