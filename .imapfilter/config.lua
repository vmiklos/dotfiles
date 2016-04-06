-- gmail: echo "before:$(date --date="90 days ago" +%Y/%m/%d) label:lists-linux-hotplug"

account = IMAP {
	server = 'mail.collabora.co.uk',
	username = 'vmiklos',
	ssl = 'tls1'
}
results = account['INBOX']:is_older(90)
results:move_messages(account['ZArchive'])
results = account['Lists.libreoffice']:is_older(90)
results:delete_messages()
