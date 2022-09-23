changequote(<!,!>)
set folder=imaps://imap.gmail.com/
account-hook imaps://imap.gmail.com/ 'set imap_user=vmiklos@vmiklos.hu imap_pass=PASSWORD'
account-hook imaps://imap.gmail.com/ 'set smtp_url="smtps://vmiklos@vmiklos.hu@smtp.gmail.com:465/"'
account-hook imaps://imap.gmail.com/ 'set smtp_pass=PASSWORD'
account-hook imaps://imap.gmail.com/ 'set hostname="vmiklos.hu"'
account-hook imaps://imap.gmail.com/ 'unset signature'
account-hook imaps://imap.gmail.com/ 'unset imap_authenticators'
account-hook imaps://imap.gmail.com/ 'unset imap_oauth_refresh_command'
mailboxes `python ~/.mutt/list.py imap.gmail.com vmiklos@vmiklos.hu PASSWORD ""`
folder-hook imaps://imap.gmail.com/ 'set folder=imaps://imap.gmail.com/ record="+[Gmail]/Sent Mail" postponed="+[Gmail]/Drafts" from="Miklos Vajna <vmiklos@vmiklos.hu>";unset crypt_autosign; bind index r reply; bind pager r reply; set sort=threads; set attribution="On %d, %f wrote:"'

folder-hook imaps://imap.gmail.com/Lists/libreoffice-commits 'set from="Miklos Vajna <vmiklos@collabora.com>";unset crypt_autosign'
folder-hook imaps://imap.gmail.com/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
