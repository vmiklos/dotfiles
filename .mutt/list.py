import imaplib
# imaplib.Debug = 10
from imaplib import *
import sys
import config

"""
this is a small python script to list your imap folders in mutt
usage:

    mailboxes `python ~/.mutt/list.py mail "ssh -q foo.com /usr/sbin/imapd" foo.com`

    or

    mailboxes `python ~/.mutt/list.py bar.com nick@bar.com secret "" [--subscr]`

using --subscr, only subscribed folders are listed.
"""


class ImapLister:
    def __init__(self, server=None, user=None, pwd=None, dir=None, tunnel=None, subscr=False):
        self.dirs = []

        if not tunnel:
            sock = IMAP4_SSL(server)
            sock.login(user, pwd)
        else:
            sock = IMAP4_stream(tunnel)
            server = tunnel
        if subscr:
            self.dirs.append("INBOX")
            mylist = sock.lsub
        else:
            mylist = sock.list
        for i in mylist(dir)[1]:
            if i.split(" ")[-1] == dir:
                i = "INBOX"
            if i.split(" ")[-1][-8:] != "_archive" and not self.needs_ignore(server, i):
                if '" "' in i:
                    self.dirs.append(i.split('" "')[-1].strip('"'))
                else:
                    self.dirs.append(i.split(" ")[-1])
        self.dirs.sort()

    def needs_ignore(self, server, folder):
        if server not in config.ignore.keys():
            return False
        if folder in config.ignore[server]:
            return True
        else:
            return False

if __name__ == "__main__":
    if len(sys.argv) == 4:
        server = ImapLister(dir=sys.argv[1], tunnel=sys.argv[2])
        url = sys.argv[3]
    else:
        sys.stderr.write("Listing %s..." % sys.argv[1])
        # we have one more parameter for a real imap server
        if len(sys.argv) > 5:
            subscr = True
        else:
            subscr = False
        server = ImapLister(server=sys.argv[1], user=sys.argv[2], pwd=sys.argv[3], dir=sys.argv[4], subscr=subscr)
        url = sys.argv[1]
        sys.stderr.write(" done.\n")
    for i in server.dirs:
        if i.strip('"') == "INBOX":
            sys.stdout.write('"imaps://%s/%s" ' % (url, i.strip('"')))
    for i in server.dirs:
        if i.strip('"') != "INBOX":
            sys.stdout.write('"imaps://%s/%s" ' % (url, i.strip('"')))
# vim:set shiftwidth=4 softtabstop=4 expandtab:
