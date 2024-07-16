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
   cd $HOME/APP

   unset PREFIX
   ml mkmod
   export VER=2.3 NAME=amask TOPDIR=`pwd`
   mkmod

echo " -> You are set to load amask module and use amask!"

echo -e " -> Suggestion: rm -rf  $HOME/amask"

