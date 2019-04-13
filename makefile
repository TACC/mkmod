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

#
# Install and create module for mkmod
# Use INSTALL_DIR install in directory other than the makefile directory.
#                                     Kent Milfeld, TACC March 31, 2018
m0 = "  --> Execute one of these make cmds:\n\n"
m1 = "  --> \"make user\" for user install.\n"
m2 = "  -->                        --Checks to see if startup file needs to set MODULEPATH.\n"
m3 = "  -->                        --Will ask permission if needed.\n"
m4 = "  --> \"make site\" for site install.\n"
m5 = "  -->                        --NO startup file check.\n"
m6 = "  -->                        --ALSO sets MODULEFILES_DIR to modulefiles directory.\n"
m7 = "  -->                        --     mkmod/$(VER) will be inserted in MODULEFILES_DIR.\n"

instruct:
	@echo -e $(m0)$(m1)$(m2)$(m3)$(m4)$(m5)$(m6)$(m7)

user: all
	@echo "  --> Finished $@ make"

site: all
	@echo "  --> Finished $@ make"


.PHONY: all
all:
ifeq ($(MAKECMDGOALS), site)
  ifndef MODULEFILES_DIR
	@echo "  --> ERROR: Must set site modulefiles directory in MODULEFILES_DIR."
	exit 1
	@echo "  --> SHOULD NOT BE EXECUTING BEYOND THIS POINT!"
  endif
	@echo "  --> Will be storing mkmod modulefile in $(MODULES_DIR)/mkmod."
endif
#	env MODE=$(MAKECMDGOALS) ./do

ifdef INSTALL_DIR
	@ echo " Installing mkmod in $(INSTALL_DIR)"
	mkdir -p       $(INSTALL_DIR)/mkmod
	cp -r bin      $(INSTALL_DIR)/mkmod
	cp -r examples $(INSTALL_DIR)/mkmod
	cp -r docs     $(INSTALL_DIR)/mkmod
	@env NAME=mkmod VER=$(VER) TOPDIR=$(INSTALL_DIR)/mkmod AUTO_PREREQ=none MODE=$(MAKECMDGOALS) bin/mkmod
else
	@env NAME=mkmod VER=$(VER) TOPDIR=`pwd`                AUTO_PREREQ=none MODE=$(MAKECMDGOALS) bin/mkmod 
endif
