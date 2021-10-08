changequote(<!,!>)
account-hook imaps://outlook.office365.com/ 'set imap_user=vmiklos@suse.com'
# run './mutt_oauth2.py vmiklos@suse.com.tokens --authorize' instead.
account-hook imaps://outlook.office365.com/ 'unset imap_pass'
mailboxes imaps://outlook.office365.com/INBOX
account-hook imaps://outlook.office365.com/ 'set imap_authenticators="xoauth2"'
account-hook imaps://outlook.office365.com/ 'set imap_oauth_refresh_command="~/.mutt/mutt_oauth2.py ~/.mutt/vmiklos@suse.com.tokens"'

# vim: ft=muttrc
