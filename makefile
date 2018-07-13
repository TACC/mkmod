#
# Install and create module for mkmod
# Use INSTALL_DIR install in directory other than the makefile directory.
#                                     Kent Milfeld, TACC March 31, 2018


#  If INSTALL_DIR is NOT set, use git clone (MAKEFILE) DIRECTORY

ifeq ($(strip $(INSTALL_DIR)),"")   #get rit of any white space before check
   makefile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
   INSTALL_DIR   := $(makefile_path:/makefile=)
endif

 VER = $(shell grep -P 'MKMOD_VERSION=[.0-9]+\s+\#\s+VERSION SOURCE' bin/mkmod | sed 's/.*=//'| sed s'/\s*\#.*//')


.PHONY: all
all:
ifdef INSTALL_DIR
	@ echo " Installing mkmod in $(INSTALL_DIR)"
	mkdir -p       $(INSTALL_DIR)/mkmod
	cp -r bin      $(INSTALL_DIR)/mkmod
	cp -r examples $(INSTALL_DIR)/mkmod
	cp -r docs     $(INSTALL_DIR)/mkmod
	env NAME=mkmod VER=$(VER) TOPDIR=$(INSTALL_DIR)/mkmod AUTO_PREREQ=none bin/mkmod
else
	env NAME=mkmod VER=$(VER) TOPDIR=`pwd` AUTO_PREREQ=none bin/mkmod
endif
