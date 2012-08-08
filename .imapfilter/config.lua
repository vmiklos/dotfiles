account = IMAP {
	server = 'imap.suse.de',
	username = 'vmiklos',
	ssl = 'ssl3'
}
results = account['Lists.libreoffice']:is_older(90)
results:delete_messages()
