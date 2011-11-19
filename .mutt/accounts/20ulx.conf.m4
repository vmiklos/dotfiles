changequote(<!,!>)
account-hook imaps://turing.ulx.hu/ 'set imap_user=vmiklos@ulx.hu imap_pass=PASSWORD'
folder-hook imaps://turing.ulx.hu/ 'set folder=imaps://turing.ulx.hu/ record=imaps://turing.ulx.hu/Sent postponed=imaps://turing.ulx.hu/Drafts from="Miklos Vajna <vmiklos@ulx.hu>";unset crypt_autosign'
mailboxes `python ~/.mutt/list.py turing.ulx.hu vmiklos@ulx.hu PASSWORD ""`

# vim: ft=muttrc
