Installation at Sites
---------------------

For site installations, it will be necessary to turn off the component of mkmod that installs
``module use <dir>`` in startup scripts; and it will be necessary to specify where the modulefile is to
be installed.  Otherwise, every thing is quite similar to how a user would install mkmod:

* Get mkmod from the TACC repo with a "git" command. 
* Set INSTALL_DIR to an install directory. 
* Set INSTALL_SITE to your site name (e.g. TACC, PSC, NERSC, etc.). 
* Execute make. 

The makefile installs mkmod and uses it to create and install a mkmod modulefile.
When the ``INSTALL_SITE`` variable is set, it turns off the insertion 
of  ``module use <dir>`` command in startup scripts, and eliminates appending a prefix
to the modulefile name (by internally setting ``PREFIX`` to ``""``). 

See the INSTALL text file in the mkmod directory for the specifics of the install commands.

The following site installation commands install ``mkmod`` and a mkmod modulefile::


          $ git    clone https://github.com/tacc/mkmod
          $ cd     mkmod

          $ export     INSTALL_DIR=/opt/apps/mkmod
          $ export MODULEFILES_DIR=/opt/apps/modulefiles
          $ export    INSTALL_SITE=TACC

          $ make   site #uses itself to install and create a mkmod modulefile
