changequote(<!,!>)
[general]
accounts = suse-cz

[Account suse-cz]
localrepository = suse-cz-local
remoterepository = suse-cz-remote

[Repository suse-cz-remote]
type = IMAP
remotehost = imap.suse.de
ssl = yes
remoteuser = vmiklos
remotepass = SUSECZPASSWORD

[Repository suse-cz-local]
type = Maildir
localfolders = ~/.offlineimap-local
