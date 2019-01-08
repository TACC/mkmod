Installation for HPC Groups
---------------------------

If you install packages for a research group, you probably
don't want the software in your ``HOME`` directory, and you want 
the modulefiles for the package accessible by other members of a Unix group.

First, set ``MODULEFILES_DIR`` to change the default (``$HOME/modulefiles``) 
to ``$MODULEFILES_DIR/modulefiles``. 
Also, set ``GROUP_ACCESS`` to ``yes`` to allow users of your primary group to access your modulefiles.  
(Of course, they will need to include ``module use <path_to_your_modulefiles_dir>``
in their startup file. Copy and send your ``module use <dir.>`` startup script commands to them.) 
Set the GROUP variable to a non-primary group value if necessary.

The following example installs mkmod in the $WORK/apps directory and specifies
$WORK to be the location of the modulefiles directory, and gives primary group
access to the modulefile (and appropriate directory path component); 
and *mkmod* will be the modulefile name for mkmod 
(not ``my_mkmod``) because ``PREFIX=""``::

          $ export        INSTALL_DIR=$WORK/apps   
          $ export    MODULEFILES_DIR=$WORK
          $ export       GROUP_ACCESS=yes
 
          $ export             PREFIX=""
 
          $ git clone https://github.com/tacc/mkmod
          $ cd mkmod
          $ make
 
          $ # ... If installing  packages at a later date, DON't FORGET
          $ # ... to set MODULEFILES_DIR and GROUP_ACCESS; if you forget
          $ # ... just remove the modulefile, set variables, and execute mkmod
 
          $ export    MODULEFILES_DIR=$WORK
          $ export       GROUP_ACCESS=yes
          $ export   NAME=new_pakage VER=1.0 TOPDIR=$WORK/apps/new_package
          $ mkmod

           

It will be necessary to set ``MODULEFILES_DIR`` to ``$WORK`` each time you
use mkmod for a new installed package and want the modulefile put in ``$WORK/modulefiles``.
Also, don't forget to set the ``GROUP_ACCESS`` variable (and possibly ``GROUP``).
