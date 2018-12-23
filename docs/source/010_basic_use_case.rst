Basic Use Case
--------------

Set ``NAME``, ``VER``, and ``TOPDIR`` environment variables to the *name*, *version*, and the *top level*
directory of the application you installed, and execute mkmod.  Here is an example::

      $ #<install remora; git clone https://github.com/tacc/remora; cd remora; install.sh >
      $ export NAME=remora  VER=1.8.2 TOPDIR=$HOME/apps/remora
      $ mkmod

This creates the modulefile ``$HOME/modulefiles/my_remora/1.8.2`` (or ``1.8.2.lua``),
and makes sure that your startup file executes ``module use $HOME/modulefiles``
so that the module environment system knows where to find your module files.

Example: To load your remora environment, execute::

      $ module load my_remora

So that there is no possible interference with corresponding system modules the
module name is constructed by combining the ``my_`` prefix and the NAME environment variable.
If you don't want/need the ``my_`` prefix, set the PREFIX environment variable to ``""`` before
executing mkmod. You can also avoid conflicts with system-wide software by using a
creative alternate name for the package (e.g. just set NAME to remo, Remora, etc.).
(Need to start over, just remove the ``my_remora`` directory in ``$HOME/modulefiles``,
and run mkmod again.)
