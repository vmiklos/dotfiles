changequote(<!,!>)
set folder=imaps://imap.gmail.com/
account-hook imaps://imap.gmail.com/ 'set imap_user=vmiklos@vmiklos.hu imap_pass=PASSWORD'
mailboxes `python ~/.mutt/list.py imap.gmail.com vmiklos@vmiklos.hu PASSWORD ""`
folder-hook imaps://imap.gmail.com/ 'set folder=imaps://imap.gmail.com/ record="+[Gmail]/Sent Mail" postponed="+[Gmail]/Drafts" from="Miklos Vajna <vmiklos@vmiklos.hu>";set crypt_autosign; bind index r reply; bind pager r reply; set sort=threads; set attribution="On %d, %f wrote:"'

folder-hook imaps://imap.gmail.com/Lists/frugalware-devel 'set from="Miklos Vajna <vmiklos@frugalware.org>";set crypt_autosign'
folder-hook imaps://imap.gmail.com/Anna 'set record=+Anna; set sort=reverse-date'
folder-hook imaps://imap.gmail.com/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
