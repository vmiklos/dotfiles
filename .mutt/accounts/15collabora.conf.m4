changequote(<!,!>)
account-hook imaps://mail.collabora.co.uk/ 'set imap_user=vmiklos imap_pass=CPPASSWORD'
folder-hook imaps://mail.collabora.co.uk/ 'set folder=imaps://mail.collabora.co.uk/ record=imaps://mail.collabora.co.uk/Sent postponed=imaps://mail.collabora.co.uk/Unsent from="Miklos Vajna <vmiklos@collabora.co.uk>";set crypt_autosign; set sort=threads'
folder-hook imaps://mail.collabora.co.uk/INBOX.?$ 'set record=+INBOX'
mailboxes `python ~/.mutt/list.py mail.collabora.co.uk vmiklos CPPASSWORD "" --subscr`
set smtp_url="smtp://vmiklos:CPPASSWORD@mail.collabora.co.uk:587"
set hostname="collabora.co.uk"

# vim: ft=muttrc
