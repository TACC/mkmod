#
# Install and create module for mkmod
# Use INSTALL_DIR install in directory other than the makefile directory.
#                                     Kent Milfeld, TACC March 31, 2018


#  If INSTALL_DIR is NOT set, use git clone (MAKEFILE) DIRECTORY

ifeq ($( strip $(INSTALL_DIR)),)   #get rit of any white space
   makefile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
   INSTALL_DIR   := $(makefile_path:/makefile=)
else
   INSTALL=true
endif

#VER = `grep -P 'MKMOD_VERSION=[.0-9]+\s+\#\s+makefile extracts version from this line' bin/version | sed 's/.*=//' | sed s'/\s*\#.*//'`
VER = $(eval VER := $(shell grep -P 'MKMOD_VERSION=[.0-9]+\s+\#\s+VERSION SOURCE' bin/version | sed 's/.*=//'| sed s'/\s*\#.*//'))$(value VER)


.PHONY: all
all:

ifdef INSTALL
	@ echo " Installing mkmod in $(INSTALL_DIR)"
	mkdir -p       $(INSTALL_DIR)
	cp -r bin      $(INSTALL_DIR)
	cp -r examples $(INSTALL_DIR)
	cp -r docs     $(INSTALL_DIR)
endif
	env NAME=mkmod VER=$(VER) TOPDIR=$(INSTALL_DIR) PREREQ=none bin/mkmod
#echo " Calling: env NAME=mkmod VER=$(VER) TOPDIR=$(INSTALL_DIR)    bin/mkmod"
