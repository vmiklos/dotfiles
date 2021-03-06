changequote(<!,!>)
IMAPAccount      gmail
Host             imap.gmail.com
User             vmiklos@vmiklos.hu
Pass             PASSWORD
# See <https://people.kernel.org/mcgrof/replacing-offlineimap-with-mbsync>, don't go over gmail's
# quota.
PipelineDepth 1
SSLType IMAPS
SSLVersions TLSv1.1
CertificateFile  /var/lib/ca-certificates/ca-bundle.pem

IMAPStore  gmail-cloud
Account    gmail

MaildirStore  gmail-backup
Path          ~/mentes/2012-08-27-email/vmiklos-gmail/
Inbox         ~/mentes/2012-08-27-email/vmiklos-gmail/Inbox
Subfolders Verbatim

Channel   gmail
Master    :gmail-cloud:
Slave     :gmail-backup:
Create    Slave
Expunge   Slave
Sync      Pull
# Exclude everything under the internal [Gmail] folder, except archived mails
Patterns  * ![Gmail]* "[Gmail]/All Mail"
