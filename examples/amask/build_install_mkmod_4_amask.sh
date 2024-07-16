#!/bin/bash

# You can execute this file, or copy and paste a set of commands.

# MKMOD exercise: install amask and build a modulefile for it.

  export    INSTALL_DIR=$HOME/apps/amask
  mkdir -p $INSTALL_DIR

echo " -> Cloning amask in $HOME, will install in $HOME/APPS/amask"
   cd
   git clone https://github.com/tacc/amask

echo "  -> Build and install amask"
   cd amask
   export PREFIX=$INSTALL_DIR
   make   
   make install

echo "  -> Creating amask modulefile"
   cd $INSTALL_DIR

   unset PREFIX
   [[   -d $HOME/modulefiles/my_mkmod ]] && ml my_mkmod #try your own 1st
   [[ ! -d $HOME/modulefiles/my_mkmod ]] && ml    mkmod #otherwise use system mkmod
   export VER=1.1 NAME=amask TOPDIR=`pwd`
   mkmod

echo " -> You are set to load amask module and use amask!"

echo -e " -> Suggestion: rm -rf  $HOME/amask"

