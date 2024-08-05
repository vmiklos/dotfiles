changequote(<!,!>)
mailboxes `mutt-imap-lister imappro.zoho.com miklos.vajna@collabora.com CPPASSWORD`
account-hook imaps://imappro.zoho.com/ 'set imap_user=miklos.vajna@collabora.com imap_pass=CPPASSWORD'
folder-hook imaps://imappro.zoho.com/ "\
	set smtp_url=\"smtps://miklos.vajna@collabora.com:CPPASSWORD@smtppro.zoho.com:465\"; \
	set smtp_pass=\"PASSWORD\"; \
	set hostname=\"collabora.com\"; \
	unset signature; \
	unset imap_authenticators; \
	unset imap_oauth_refresh_command; \
	set folder=imaps://imappro.zoho.com/; \
	set record=imaps://imappro.zoho.com/Sent; \
	set postponed=imaps://imappro.zoho.com/Unsent; \
	set from=\"Miklos Vajna <vmiklos@collabora.com>\"; \
	unset crypt_autosign; \
	bind index r reply; \
	bind pager r reply; \
	set sort=threads; \
	set editor=\"env MUTT_ACCOUNT=15collabora vim -c 'set tw=72 noautoindent expandtab notitle ft=mail fileencodings='\"; \
	set attribution=\"On %d, %f wrote:\" \
"

folder-hook imaps://imappro.zoho.com/INBOX.?$ 'set record=+INBOX'

# vim: ft=muttrc
