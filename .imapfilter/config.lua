-- gmail: echo "before:$(date --date="90 days ago" +%Y/%m/%d) label:lists-linux-hotplug"

account = IMAP {
	server = 'imap.suse.de',
	username = 'vmiklos',
	ssl = 'ssl3'
}
results = account['Lists.libreoffice']:is_older(90)
results:delete_messages()
