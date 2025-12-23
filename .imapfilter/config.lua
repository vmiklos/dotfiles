-- gmail: echo "before:$(date --date="90 days ago" +%Y/%m/%d) label:lists-libreoffice"
--        echo "before:$(date --date="90 days ago" +%Y/%m/%d) in:sent"

account = IMAP {
	server = 'imappro.zoho.com',
	username = 'miklos.vajna@collabora.com',
	ssl = 'yes'
}
results = account['INBOX']:is_older(90)
results:move_messages(account['ZArchive'])
results = account['Lists/libreoffice']:is_older(90)
results:delete_messages()
results = account['Lists/libreoffice-bugs']:is_older(90)
results:delete_messages()
results = account['Lists/zcp-marketing']:is_older(90)
results:delete_messages()
results = account['Spam']:is_older(90)
results:delete_messages()
