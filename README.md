[![Documentation Status](https://readthedocs.org/projects/mkmod/badge/?version=v2.1)] (https://mkmod.readthedocs.io/en/latest/?badge=v2.1)

mkmod Documentation               {#mainpage}
===================

Developers and Maintainers
--------------------------
Kent Milfeld  (<mailto:milfeld@tacc.utexas.edu> include mkmod in subject)

mkmod Web Sites
---------------
* Documentation:   https://mkmod.readthedocs.org
* Github:          https://github.com/TACC/mkmod
* TACC Homepage:   https://www.tacc.utexas.edu/research-development/tacc-projects/mkmod

Description
-----------
Automatically creates and installs a basic modulefile for an installed package,
given the package name, version and directory location set by the user in the
`NAME`, `VER`, and `TOPDIR`
environment variables. Other environment variables can be used to customize the
environment and operation of the modulefile for complex environments.

Code Access
-----------
To get access to the mkmod source code clone this repository:

    git clone https://github.com/tacc/mkmod


----------------------------------------------------------------------------

Installation
------------
#### *user* installation

Users can easily install mkmod in their user space.  Just get *mkmod* from the
TACC repo with a `git` command, set `INSTALL_DIR` to an install directory and
execute `make`. The makefile uses  the installed mkmod to create and install
a `my_mkmod` modulefile.
Setting `INSTALL_DIR` is optional, default installation is the present working directory.
See the *INSTALL* text in the mkmod directory for the specifics of the install commands.

Any user-owned build and install directory are fine. Directories `build` and `apps` are
used below in this example of installation commands::

      ```
      $ mkdir $HOME/build  $HOME/apps
      $ cd    $HOME/build

      $ git    clone https://github.com/tacc/mkmod
      $ cd     mkmod

      $ export INSTALL_DIR=$HOME/apps
      $ make   #uses itself to install and create a my_mkmod modulefile

      $ module load my_mkmod   #do after logout and login,
                               #to execute startup scripts
      ```


#### *system* installation

For site installations, it will be necessary to turn off the component of mkmod that installs
`module use <dir>` in startup scripts; and it will be necessary to specify where the modulefile is to
be installed.  Otherwise, every thing is quite similar to how a user would install mkmod::

      ```
      Get mkmod from the TACC repo with a "git" command. 
      Set INSTALL_DIR to an install directory. 
      Set INSTALL_SITE to your site name (e.g. TACC, PSC, NERSC, etc.). 
      Execute make. 
      ```

The makefile installs mkmod and uses it to create and install a mkmod modulefile.
When the `INSTALL_SITE` variable is set, it turns off the insertion
of  `module use <dir>` command in startup scripts, and eliminates appending a prefix
to the modulefile name (by internally setting `PREFIX` to `""`). 

See the *INSTALL* text in the mkmod directory for the specifics of the install commands.

The folowing example site installation commands intall mkmod and a mkmod modulefile::

      ```
      $ git    clone https://github.com/tacc/mkmod
      $ cd     mkmod

      $ export    INSTALL_DIR=/opt/apps/mkmod
      $ export MODULEFILE_DIR=/opt/apps/modulefiles
      $ export   INSTALL_SITE=TACC

      $ make   #uses itself to install and create a my_mkmod modulefile
      ```


## ChangeLog

### Lmod 2.1:
Features:
Bug Fixes:

### Lmod 2.0:
Features:
Bug Fixes:

### Lmod 1.0:
Features:
Bug Fixes:

## Copyright
(C) 2018 University of Texas at Austin

## MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

