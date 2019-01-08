Use Cases for Sites
-------------------

Sites can use mkmod in *build* scripts or within *rpm* spec files for modulefile
generation.  However, the component that installs the ``module use <dir>`` 
command in startup scripts must be turned off, and the site name (abbreviation) 
must be specified for the convenience environment variables (e.g. ``TACC_PHDF5_DOC``, etc.).  

Package specific variables can be set, and non-standard pathnames can be added to
PATH-type variables, as explained above in the use cases for HPC users,
by setting environment variables and PATH-type list variables 
(e.g. ``ENV1``, ...,  ``ENVn``,  and ``PATH_LIST``, ``MANPATH_LIST``, etc.)

For site-wide modulefiles the ``SITE_INSTALL`` variable should be set to the site 
name (e.g. ``TACC``, ``PSC``, ``SDSC``, ``NERSC``). This sets the modulefile-name
prefix to "";  the information environment variables are prefixed with the 
site name and an underscore (e.g. ``TACC_``, ``PSC_``, etc.); and no insertion 
of "module use <dir>" is attempted in startup scripts.

Often site installers are interested in including whatis and help
information. There are several ways to have mkmod "ingest" this 
information.

Use Case 1
^^^^^^^^^^

In this example ``SITE_INSTALL`` and ``MODULEFILES_DIR`` are set for site installation.

Also, ``NAME``, ``VER`` and ``TOPDIR`` variables are set as usual; and the ``ENV1`` 
variable is set to a *name=value pair* (``REMORA_BIN=$TOPDIR/bin``) for mkmod to set 
the `REMORA_BIN`` environment variable to ``$TOPDIR/bin`` in the modulefile::

          # finished installing remora, with compiler and mpi module loaded

          $ export SITE_INSTALL=TACC
          $ export MODULEFILES_DIR=/opt/apps/modulefiles

          $ export NAME=remora VER=1.8.1 TOPDIR=/opt/apps/$NAME/$VER

          $ export ENV1="REMORA_BIN=$TOPDIR/bin"

          $ mkmod

The compiler and MPI modules loaded at this time (for the remora install,
and subsequent mkmod execution) are set as prerequisites.

Use Case 2
^^^^^^^^^^

The following example is a script for installing a modulefile for *MOOSE*. 

Compiler and MPI modules are explicitly loaded in the script, and the 
subsequent mkmod execution
will put these module prerequisites in the modulefile (``gcc/7.1.0`` and ``impi/17.0``).

The ``SITE_INSTALL`` and ``MODULEFILES_DIR`` mkmod variables are set for site installation.
For a site with a hierarchical module structure the ``MODULEFILES_DIR`` and ``TOPDIR``
may contain compiler and MPI path components, and may even be in different directory
trees, as shown in this example.

Here, the *whatis* information is included through the ``WHATIS`` mkmod environment 
variable, and modulefile help-text is contained in the ``HELP_MESSAGE`` mkmod variable. 
The environment variables ``MOOSE_DIR`` and ``MOOSE_ARCH`` are set in the modulefile 
as specified by the mkmod ``ENV1`` and ``ENV2`` variables::

        #!/bin/bash
        
        module load gcc/7.1.0 impi/17.0

        export SITE_INSTALL=TACC
        export MODULEFILES_DIR=/opt/apps/gcc7_1/impi17_0/modulefiles

        export NAME=moose
        export VER=git.20170622
        export TOPDIR=/home1/apps/gcc7_1/impi17_0/$NAME/$VER

        
        export ENV1="MOOSE_DIR=$TOPDIR"
        export ENV2="MOOSE_ARCH=\"\""    # set to blank, ""

        export WHATIS="
          Name: Moose
          @ Version: $VER
          @ Version-notes: external packages installed: 
          @ Category: library, mathematics
          @ URL: https://mooseframework.inl.gov
          @ Description: Numerical library for sparse linear algebra  
        "
        export HELP_MESSAGE="
         Compile with: -I\$PHDF5_INC
         Link with:    -Wl,-rpath,\$PHDF5_LIB -L\$PHDF5_LIB -lhdf5 -lz 
        "
        mkmod

The ``WHATIS`` variable contains a @-separated list of whatis key-value pairs
separated by colons. (Above, each *key:value* type pair is entered on a separate
line, and includes a @ separator where appropriate.) 
Optionally, each key-value pair can be entered 
as a ``WHATIS#`` variable, like this::

        export WHATIS1="Name: Moose"
        export WHATIS2="Version: $VER"
        export WHATIS3="Version-notes: external packages installed"
        export WHATIS4="Category: library, mathematics"
        export WHATIS5="URL: https://mooseframework.inl.gov"
        export WHATIS6="Description: Numerical library for sparse linear algebra"

Note: the installation tree is in ``/home1/apps``, while the modulefile is 
in ``/opt/apps``.  The site hierarchical structure is indicated in the pathnames.

Case 3
^^^^^^

This *HDF5* modulefile site installation is similar to the above scripts,
but it extracts the whatis and help information from files.

The whatis key-value pairs are in the ``site_phdf_modules_whatis`` file,
and the help information text is in the ``site_phdf5_modules_help`` file. ::

        #!/bin/bash

        module load intel/18.0.2 impi/18.0.2

        BASE_DIR=/opt/apps/intel18/impi18_0

        export SITE_INSTALL=TACC
        export MODULEFILES_DIR=$BASE_DIR/modulefiles

                  NAME=phdf5
                   VER=1.8.16
                TOPDIR=$BASE_DIR/phdf5/1.8.16

        export NAME VER TOPDIR PREFIX

        export WHATIS_FILE=site_phdf5_modules_whatis
        export   HELP_FILE=site_phdf5_modules_help
        
        mkmod

The contents of the files are shown below. (If a whatis or help file is specified,
then the ``WHATIS`` or ``HELP_MESSAGE`` environment variable is ignored.)

Variable substitution is performed for the file content.  Hence it may be
necessary to escape (protect) the dollar ($) character at times, as is done 
in the help file below.
(Substitution is only for externally defined variables; internal 
(convenience) variables, such as``TACC_PHDF5_LIB``, ``TACC_PHDF5_DOC``, etc. 
holding directory names, are not available for evaluation). 
The two information files are listed here::

          $ cat my_local_whatis_file
  
             Name:        PHDF5
             Version:     $VER
             Category:    library, runtime support
             Keywords:    I/O, Library
             URL:         http://www.hdfgroup.org/HDF5/
             Description: file format library for storing data (Parallel Version)
  
          $ cat my_local_help_file
  
             Compile the source code with the option:
  
                 -I\$PHDF5_INC
  
             and add the following options to the link step:
  
                 -Wl,-rpath,\$PHDF5_LIB -L\$PHDF5_LIB -lhdf5 -lz 


Mkmod also searches, relative to ``$TOPDIR``,
for files named ``modules_help`` and ``modules_whatis``. It appends the content of ``modules_help`` 
to the automatic modulefile help message, and uses the key-value pairs in the ``modules_whatis`` 
file for the modulefile *whatis* entries. The precedence is presented in the following table:

    HELP:

    ==================  ===========================   ===========================================
    File/Env. Var.      Location/Value                Modulefile Help Message Contribution
    ==================  ===========================   ===========================================
    modules_help        file name, found relative     Append content to  modulefile help message.
                        to $TOPDIR search
    HELP_FILE           \=pathname (file)             Don't search for modules_help file.
                                                      Append content to modulefile help message.
    HELP_FILE           \=none                        Don't search for modules_help file.
    HELP_MESSAGE        \="some text"                 Only append text to module help message,
                                                      if no help file is being used.
    ==================  ===========================   ===========================================

    WHATIS:

    ==================  ===========================   ===========================================
    File/Env. Var.      Location/Value                whatis
    ==================  ===========================   ===========================================
    modules_whatis      file name, found relative     Read each line as a
                        to $TOPDIR search             whatis key:value formatted pair.
    WHATIS_FILE         \=pathname (file)             Don't search for modules_whatis file,
                                                      Read each line as a whatis key:value format.
    WHATIS_FILE         \=none                        Don't search for modules_whatis file.
    WHATIS_MESSAGE      \="list of key:value pairs"   Only uses these as whatis values 
                        (@-separated list)            if no whatis file is being used.
    ==================  ===========================   ===========================================

