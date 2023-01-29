changequote(<!,!>)
mailboxes `mutt-imap-lister mail.collabora.com vmiklos CPPASSWORD`
account-hook imaps://mail.collabora.com/ 'set imap_user=vmiklos imap_pass=CPPASSWORD'
folder-hook imaps://mail.collabora.com/ "\
	set smtp_url=\"smtp://vmiklos:CPPASSWORD@mail.collabora.com:587\"; \
	set smtp_pass=\"PASSWORD\"; \
	set hostname=\"collabora.com\"; \
	unset signature; \
	unset imap_authenticators; \
	unset imap_oauth_refresh_command; \
	set folder=imaps://mail.collabora.com/; \
	set record=imaps://mail.collabora.com/Sent; \
	set postponed=imaps://mail.collabora.com/Unsent; \
	set from=\"Miklos Vajna <vmiklos@collabora.com>\"; \
	unset crypt_autosign; \
	bind index r reply; \
	bind pager r reply; \
	set sort=threads; \
	set editor=\"env MUTT_ACCOUNT=15collabora vim -c 'set tw=72 noautoindent expandtab notitle ft=mail fileencodings='\"; \
	set attribution=\"On %d, %f wrote:\" \
"

folder-hook imaps://mail.collabora.com/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
