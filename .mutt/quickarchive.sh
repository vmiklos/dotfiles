cd ~
mv Maildir/Maildir_archive .
archivemail -d 30 -q --no-compress Maildir/
mv Maildir_archive Maildir/
