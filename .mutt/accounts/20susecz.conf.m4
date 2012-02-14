changequote(<!,!>)
account-hook imaps://imap.suse.de/ 'set imap_user=vmiklos imap_pass=SUSECZPASSWORD'
folder-hook imaps://imap.suse.de/ 'set folder=imaps://imap.suse.de/ record=imaps://imap.suse.de/INBOX/Sent postponed=imaps://imap.suse.de/INBOX/Unsent from="Miklos Vajna <vmiklos@suse.cz>";unset crypt_autosign'
mailboxes `python ~/.mutt/list.py imap.suse.de vmiklos SUSECZPASSWORD ""`
set smtp_url="smtp://vmiklos:SUSECZPASSWORD@imap.suse.de:587"

# vim: ft=muttrc
