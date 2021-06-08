changequote(<!,!>)
account-hook imaps://mail.collabora.com/ 'set imap_user=vmiklos imap_pass=CPPASSWORD'
account-hook imaps://mail.collabora.com/ 'set smtp_url="smtp://vmiklos:CPPASSWORD@mail.collabora.com:587"'
account-hook imaps://mail.collabora.com/ 'set hostname="collabora.com"'
account-hook imaps://mail.collabora.com/ 'unset imap_authenticators'
account-hook imaps://mail.collabora.com/ 'unset imap_oauth_refresh_command'
folder-hook imaps://mail.collabora.com/ 'set folder=imaps://mail.collabora.com/ record=imaps://mail.collabora.com/Sent postponed=imaps://mail.collabora.com/Unsent from="Miklos Vajna <vmiklos@collabora.com>";unset crypt_autosign; set sort=threads'
folder-hook imaps://mail.collabora.com/INBOX.?$ 'set record=+INBOX'
mailboxes `python ~/.mutt/list.py mail.collabora.com vmiklos CPPASSWORD "" --subscr`

# vim: ft=muttrc
