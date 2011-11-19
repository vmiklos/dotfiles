changequote(<!,!>)
set folder=imaps://frugalware.org/
account-hook imaps://frugalware.org/ 'set imap_user=vmiklos imap_pass=PASSWORD'
mailboxes `python ~/.mutt/list.py frugalware.org vmiklos PASSWORD ""`
folder-hook imaps://frugalware.org/ 'set folder=imaps://frugalware.org/ record=+INBOX.Sent postponed=+INBOX.Unsent from="Miklos Vajna <vmiklos@frugalware.org>";set crypt_autosign; bind index r reply; bind pager r reply; set sort=threads; set attribution="On %d, %f wrote:"'
folder-hook imaps://frugalware.org/INBOX.Lists.mkk 'set from="Miklos Vajna <vmiklos@vmiklos.hu>";unset crypt_autosign'
folder-hook imaps://frugalware.org/INBOX.Lists.git 'bind index r group-reply; bind pager r group-reply'
folder-hook imaps://frugalware.org/INBOX.Lists.ga-swig 'bind index r group-reply; bind pager r group-reply'
folder-hook imaps://frugalware.org/INBOX.Lists.info 'set from="Miklos Vajna <vmiklos@vmiklos.hu>";unset crypt_autosign'
folder-hook imaps://frugalware.org/INBOX.Lists.z2004b 'set from="Miklos Vajna <vmiklos@vmiklos.hu>";unset crypt_autosign'
folder-hook imaps://frugalware.org/INBOX.Lists.fege 'set from="Miklos Vajna <vmiklos@vmiklos.hu>";unset crypt_autosign'
folder-hook imaps://frugalware.org/INBOX.APrivate 'set from="Miklos Vajna <vmiklos@vmiklos.hu>" record=+INBOX.APrivate;unset crypt_autosign'
folder-hook imaps://frugalware.org/INBOX.Anna 'set from="Miklos Vajna <vmiklos@vmiklos.hu>" record=+INBOX.Anna;unset crypt_autosign; set sort=reverse-date'
folder-hook imaps://frugalware.org/INBOX.Lists.frugalware-forums 'set attribution="On %d, %F wrote:"'
folder-hook imaps://frugalware.org/INBOX.Lists.frugalware-users-hu 'set attribution="On %d, %F wrote:"'
folder-hook imaps://frugalware.org/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
