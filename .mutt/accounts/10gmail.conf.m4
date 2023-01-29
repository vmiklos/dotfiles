changequote(<!,!>)
set folder=imaps://imap.gmail.com/
mailboxes `mutt-imap-lister imap.gmail.com vmiklos@vmiklos.hu PASSWORD`
account-hook imaps://imap.gmail.com/ 'set imap_user=vmiklos@vmiklos.hu imap_pass=PASSWORD'
folder-hook imaps://imap.gmail.com/ "\
	set smtp_url=\"smtps://vmiklos@vmiklos.hu@smtp.gmail.com:465/\"; \
	set smtp_pass=\"PASSWORD\"; \
	set hostname=\"vmiklos.hu\"; \
	unset signature; \
	unset imap_authenticators; \
	unset imap_oauth_refresh_command; \
	set folder=imaps://imap.gmail.com/; \
	set record=\"+[Gmail]/Sent Mail\"; \
	set postponed=\"+[Gmail]/Drafts\"; \
	set from=\"Miklos Vajna <vmiklos@vmiklos.hu>\"; \
	unset crypt_autosign; \
	bind index r reply; \
	bind pager r reply; \
	set sort=threads; \
	set editor=\"env MUTT_ACCOUNT=10gmail vim -c 'set tw=72 noautoindent expandtab notitle ft=mail fileencodings='\"; \
	set attribution=\"On %d, %f wrote:\" \
"

folder-hook imaps://imap.gmail.com/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
