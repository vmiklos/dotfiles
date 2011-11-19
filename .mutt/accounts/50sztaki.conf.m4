changequote(<!,!>)
account-hook imaps://acel.dsd.sztaki.hu/ 'set imap_user=vmiklos imap_pass=PASSWORD'
folder-hook imaps://acel.dsd.sztaki.hu/ 'set folder=imaps://acel.dsd.sztaki.hu/ record=imaps://acel.dsd.sztaki.hu/Sent postponed=imaps://acel.dsd.sztaki.hu/Unsent from="Miklos Vajna <vmiklos@dsd.sztaki.hu>";unset crypt_autosign'
mailboxes `python ~/.mutt/list.py acel.dsd.sztaki.hu vmiklos PASSWORD ""`

# vim: ft=muttrc
