Package Directories and Makefile
--------------------------------

The makefile is the simplest part of mkmod.  Mkmod is written in bash, so
it is compiler independent, and it installs in ``$PWD`` by default. 
You can optionally set an install directory in the ``INSTALL_DIR`` variable.

The execution of ``make`` also executes mkmod to create and install
a modulefile for mkmod (by default, named ``my_mkmod`` for users;
and ``mkmod`` for site installations).

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


