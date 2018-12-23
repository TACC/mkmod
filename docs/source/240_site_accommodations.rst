Site Accommodations
-------------------

Some sites, like *NERSC*, create links in $HOME that point to
system-wide startup files that cannot be modified by the user.
Users are provided identically-named startup files with an ".ext"
suffix.  

If your site uses this mechanism,
check the ``sites`` variable list inside the mkmod code to see if your site has provided an extension.
If not, set the suffix in the ``MKMOD_STARTUP_FILE_SUFFIX`` variable before installing
or executing mkmod.

Or: Add the *site name* (lower case) to the ``sites`` list, add the *suffix* to the
corresponding position in the ``site_suffixes`` list, and add the
*site domain name* to the ``site_domains`` list.  (It is expected
that the site name appears in the domain name from the ``hostname -d``
command.)  Make a *git pull* request, or send the information to the mkmod author
with mkmod in the subject.



