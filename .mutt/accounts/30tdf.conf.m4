changequote(<!,!>)
account-hook imaps://mail.documentfoundation.org/ 'set imap_user=vmiklos imap_pass=PASSWORD'
account-hook imaps://mail.documentfoundation.org/ 'set smtp_url="smtps://vmiklos:PASSWORD@mail.documentfoundation.org:465"'
account-hook imaps://mail.documentfoundation.org/ 'set hostname="documentfoundation.org"'
account-hook imaps://mail.documentfoundation.org/ 'set signature="~/.mutt/signature-tdf"'
account-hook imaps://mail.documentfoundation.org/ 'unset imap_authenticators'
account-hook imaps://mail.documentfoundation.org/ 'unset imap_oauth_refresh_command'
folder-hook imaps://mail.documentfoundation.org/ 'set folder=imaps://mail.documentfoundation.org/ record=imaps://mail.documentfoundation.org/Sent postponed=imaps://mail.documentfoundation.org/Unsent from="Miklos Vajna <vmiklos@documentfoundation.org>";unset crypt_autosign; set sort=threads'
folder-hook imaps://mail.documentfoundation.org/INBOX.?$ 'set record=+INBOX'
mailboxes imaps://mail.documentfoundation.org/INBOX

# vim: ft=muttrc
