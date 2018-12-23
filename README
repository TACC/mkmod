
INSTALL

        cd <to your app directory>
        git clone https://github.com/tacc/mkmod
        cd mkmod
        # default install is $PWD; set INSTALL_DIR if you have an apps dir 
        make

GENERAL INFO

  mkmod automatically creates a module in $HOME/modulefiles
  mkmod works with both Lua and Tcl modules installations

         * for Users and Developers who install their own packages.
         * for staff who provide scripts for users to
                 build their own packages (e.g. you hand them
                 a mk_package script which includes mkmod)
         * for the LMOD tutorial lab of tinyurl.com/chcp-2017-tools
         * can be used with rpms
               (that don't require rpm logic and %{} variables)
         * See examples in examples directory

INSTRUCTIONS

  The minimal work a user must do is export 3 variables and call mkmod.

  1.) Define & Export         NAME, VER,   and   TOPDIR
                     (package name, version, and top-level directory)

                export   NAME=...
                export    VER=...
                export TOPDIR=...

  2.) Execute:  mkmod




  ------------------------------

TRY IT YOURSELF

  See examples in examples directory

  When you executed "make" (above) in the mkmod directory a 
  modulefile was automatically created for mkmod (with the commands below).
  You can try this "by hand" by first removing $HOME/modulefiles/my_mkmod
  if you already executed make.
  

     FIRST:  execute: rm -rf $HOME/modulefiles/my_mkmod  #if you already executed make

  Build your own modulefile for mkmod
        cd mkmod/docs                 #this directory

        export NAME=mkmod
        export VER=2.0                 #execute bin/mkmod -v for current ver.
        export TOPDIR=$(dirname `pwd`) #TOPDIR=directory above this.
        export PREREQ=none             #we do this to avoid compiler/mpi
                                       #prerequisite--since this is a
                                       #compiler/mpi agnostic tool
     
        ../bin/mkmod                   #mkmod location relative to this directory
                                       #ASSUMES YOU ARE IN mkmod/docs
                                       #Change to suite yourself

        #logout, then login

        module load my_mkmod           #install directory is in your path

        module help my_mkmod           # See examples for features.
                                       # Use export PREFIX="" for no "my_"
                                       # mkmod --help   for details

