changequote(<!,!>)
account-hook imaps://outlook.office365.com/ 'set imap_user=vmiklos@suse.com imap_pass=SUSEPASSWORD'
mailboxes `python ~/.mutt/list.py outlook.office365.com vmiklos@suse.com SUSEPASSWORD "" --subscr`

# vim: ft=muttrc
