Use Cases for HPC Users
-----------------------

For some HPC packages and utilities it is necessary to augment the
automatic environment that mkmod creates by including additional
package environment variables, or adding to PATH-type variables.
This is accomplished by specifying *name=value* pairs and paths
to mkmod through environment variables.

Use Case 1
^^^^^^^^^^
For instance, as the end of a remora installation the output states
something like this::

     REMORA INSTRUCTIONS For a fully functional installation make sure to:

	export            PATH=$PATH:/work/johndoe/APPS/remora/bin
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/work/johndoe/APPS/remora/lib
	export      REMORA_BIN=/work/johndoe/APPS/remora/bin

..  _remorabin:

The first two are automatically set by mkmod, but the ``REMORA_BIN`` variable
should be specified by the name=value pair with the ``ENV1`` variable for mkmod
as shown here::

          $ export NAME=remora VER=1.8.1 TOPDIR=$WORK/APPS/remora

          $ export ENV1="REMORA_BIN=/work/johndoe/APPS/remora/bin"

Preference variables might be set in the modulefile at this time, as shown
here::

          $ export ENV2="REMORA_VERBOSE=0"
          $ export ENV3="REMORA_MODE=FULL"
          $ export ENV4="REMORA_PERIOD=10"

          $ mkmod

Use Case 2
^^^^^^^^^^

Gromacs puts its document (README and man) files in non-standard places,
requires the variable GMXLIB be set, as well as an addition to the 
PATH-type variable ``PKG_CONFIG_PATH``.  These can be accommodated with 
``ENV#`` variables and appropriate *PATH-type_LIST* variables,
as in this example::

          $ export NAME=gromacs VER=2018.1 TOPDIR=$HOME/APPS/gromacs

          $ export    ENV1="GMXLIB=$TOPDIR/share/gromacs/top"
          $ export    ENV2="MY_GROMACS_DOC=$TOPDIR/share"

          $ export    PKGCONFIGPATH_LIST="$TOPDIR/lib/pkgconfig"
          $ export          MANPATH_LIST="$TOPDIR/share/man"

          $ mkmod
