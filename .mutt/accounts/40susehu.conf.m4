changequote(<!,!>)
account-hook imaps://imap.npsh.hu/ 'set imap_user=mvajna imap_pass=SUSEHUPASSWORD'
folder-hook imaps://imap.npsh.hu/ 'set folder=imaps://imap.npsh.hu/ record=imaps://imap.npsh.hu/INBOX/Sent-hu postponed=imaps://imap.npsh.hu/INBOX/Unsent-hu from="Miklos Vajna <mvajna@npsh.hu>";unset crypt_autosign'
mailboxes `python ~/.mutt/list.py imap.npsh.hu mvajna SUSEHUPASSWORD ""`

# vim: ft=muttrc
