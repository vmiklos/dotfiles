changequote(<!,!>)
[general]
accounts = vmiklos-gmail

[Account vmiklos-gmail]
localrepository = vmiklos-gmail-local
remoterepository = vmiklos-gmail-remote

[Repository vmiklos-gmail-remote]
type = IMAP
remotehost = imap.gmail.com
ssl = yes
remoteuser = vmiklos@vmiklos.hu
remotepass = PASSWORD

[Repository vmiklos-gmail-local]
type = Maildir
localfolders = ~/.offlineimap-local
