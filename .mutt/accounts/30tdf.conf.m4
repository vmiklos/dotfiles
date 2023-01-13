changequote(<!,!>)
mailboxes imaps://mail.documentfoundation.org/INBOX
account-hook imaps://mail.documentfoundation.org/ 'set imap_user=vmiklos imap_pass=PASSWORD'
folder-hook imaps://mail.documentfoundation.org/ "\
	set smtp_url=\"smtps://vmiklos:PASSWORD@mail.documentfoundation.org:465\"; \
	unset smtp_pass; \
	set hostname=\"documentfoundation.org\"; \
	set signature=\"~/.mutt/signature-tdf\"; \
	unset imap_authenticators; \
	unset imap_oauth_refresh_command; \
	set folder=imaps://mail.documentfoundation.org/; \
	set record=\"imaps://mail.documentfoundation.org/Sent\"; \
	set postponed=\"imaps://mail.documentfoundation.org/Unsent\"; \
	set from=\"Miklos Vajna <vmiklos@documentfoundation.org>\"; \
	unset crypt_autosign; \
	bind index r reply; \
	bind pager r reply; \
	set sort=threads; \
	set editor=\"env MUTT_ACCOUNT=30tdf vim -c 'set tw=72 noautoindent expandtab notitle ft=mail fileencodings='\"; \
	set attribution=\"On %d, %f wrote:\" \
"

folder-hook imaps://mail.documentfoundation.org/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
