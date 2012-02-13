changequote(<!,!>)
account-hook imaps://gwmail.emea.novell.com/ 'set imap_user=vmiklos imap_pass=SUSECOMPASSWORD'
folder-hook imaps://gwmail.emea.novell.com/ 'set folder=imaps://gwmail.emea.novell.com/ record=imaps://gwmail.emea.novell.com/INBOX/Sent-com postponed=imaps://gwmail.emea.novell.com/INBOX/Unsent-com from="Miklos Vajna <vmiklos@suse.com>";unset crypt_autosign'
mailboxes `python ~/.mutt/list.py gwmail.emea.novell.com vmiklos SUSECOMPASSWORD ""`

# vim: ft=muttrc
