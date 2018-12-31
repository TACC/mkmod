Developer Contributions
------------------------

Often package installers at HPC sites have a difficult time figuring out
what should be in the modulefiles, in terms of information and the
environment variable setting they want the package to have.  
And often there is no consistency among what and how installers 
provide in modulefiles.

Developers can indirectly and directly contribute to the content of
modulefiles.

Indirectly, developers already contribute to a consistency by 
using directory names consistent with the Filesystem Hierarchy Standard,
FHS_ (also content in `Wikipedia FHS`).
See /usr directory in Filesystem Hierarchy Standard (bin, lib, include, etc.).

Directly, developers can contribute by providing basic package
information that can be included in  *whatis* modulefile entries
(key-value pairs), as shown in the examples above. Mkmod searches
for a file named ``modules_what`` (and provides variable substitution,
which shouldn't be necessary for package-provided information).
At TACC, the *Name*, *Version*, *Category*, *URL* and 
*Description* keywords (and values) are included in all modulefiles so that
a software catalogue can be built, from the *key:value* pairs
in all the installed modulefiles. The following example shows
the content of a ``modules_whatis`` file that would provide sites
with developer "blessed" package information (useful to 
installers and mkmod). The following table lists the 
whatis information that TACC provides for XALT::

       Name:        XALT
       Version:     2.4
       Category:    tools
       Keywords:    System, TOOLS
       URL:         http://xalt.sf.net
       Description: Collects system usage data

Likewise, developers can provide their own help information in 
a ``modules_help`` file as plain text (with variable substitution).
The list of possible help instructions include::

       Exampes of package execution
       Compiler and loader options for libraries
       List of runtime environment variables for package and suggested values

.. _FHS: https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf

.. _Wikipedia FHS: https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

