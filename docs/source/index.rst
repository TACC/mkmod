
mkmod: Makes modulefile for Installed Software Package
======================================================

.. image:: kent.jpg
   :scale: 15
.. image:: mkmod_logo.png
   :scale: 70
   :align: right
.. include:: <isotech.txt>

PURPOSE
^^^^^^^

Mkmod automatically creates and installs a basic modulefile for an installed package, 
given the package *name*, *version* and *directory* location set by the user in the 
``NAME``, ``VER``, and ``TOPDIR``
environment variables. Other environment variables can be used to customize the 
environment and operation of the modulefile for complex environments.

OVERVIEW
^^^^^^^^

The mkmod utility was designed to allow users, who install their own package, 
to automatically create and install a basic modulefile for their installed package.
Requirements are: Tcl/Lua Environment Module System (EMS).  
If mkmod is not available on the system, installation in user-space is simple, 
requiring only a ``make`` execution.

A basic modulefile is automatically generated for an installed package 
from appropriate values set in the ``NAME``, ``VER`` and ``TOPDIR`` environment variables.
Mkmod has advanced features, accessible by setting other environment variables\\-\\-
to accommodate the more sophisticated needs of some package environments. 

Mkmod installs the generated modulefile in a ``modulefiles`` directory. It includes the
``module use $HOME/modulefiles`` command in appropriate startup files, directing 
EMS to be aware of the mkmod-installed modulefiles.

Other capabilities are available for developers who want to provide a modulefile 
for automatic installation, or at least provide *help* and *whatis* components of a
modulefile for users and site managers to include in their modulefile installation.

Guide for HPC Users
^^^^^^^^^^^^^^^^^^^

The easiest way to get started is to follow one of the use cases, using,
for practice, a package that is already installed. For cleanup, just
remove the modulefile from your ``modulefiles`` directory.

.. toctree::
   :maxdepth: 1

   010_basic_use_case
   020_basic_control_env_vars
   030_automatic_features

Advanced Features
^^^^^^^^^^^^^^^^^

.. toctree::
   :maxdepth: 1

   110_adv_control_env_vars
   120_use_cases_for_HPC_users
   130_use_cases_for_sites
   140_developer_contributions

Installation
^^^^^^^^^^^^

.. toctree::
   :maxdepth: 1
   
   210_package_directories_and_makefile
   220_install_by_HPC_users
   225_install_for_HPC_group
   230_install_at_sites
   240_site_accommodations

To Be Included Later
^^^^^^^^^^^^^^^^^^^^

#. Overview of mkmod code 
#. Logic Flow in mkmod code
#. PKGCONFIG_LIST

Indices and Tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
