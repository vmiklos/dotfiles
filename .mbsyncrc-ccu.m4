changequote(<!,!>)
IMAPAccount      collabora
Host             imappro.zoho.com
User             miklos.vajna@collabora.com
Pass             PASSWORD
# See <https://people.kernel.org/mcgrof/replacing-offlineimap-with-mbsync>, don't go over the quota.
PipelineDepth 2
AuthMechs LOGIN
SSLType IMAPS
CertificateFile  /var/lib/ca-certificates/ca-bundle.pem

IMAPStore  collabora-cloud
Account    collabora
SubscribedOnly yes

MaildirStore  collabora-backup
Path          ~/git/collabora/email/
Inbox         ~/git/collabora/email/Inbox
Subfolders Verbatim

Channel   collabora
Far    :collabora-cloud:
Near     :collabora-backup:
Create    Near
Expunge   Near
Sync      Pull
Patterns  *
