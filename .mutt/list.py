import imaplib
import os
import shlex
import sys
import yaml

"""
this is a small python script to list your imap folders in mutt
usage:

    mailboxes `python ~/.mutt/list.py bar.com nick@bar.com secret [--subscr]`

using --subscr, only subscribed folders are listed.
"""


class ImapLister:
    def __init__(self, server=None, user=None, pwd=None, subscr=False):
        with open(os.path.expanduser("~/.mutt/imap-lister.yaml")) as stream:
            self.config = yaml.safe_load(stream)
        self.dirs = []
        sock = imaplib.IMAP4_SSL(server)
        sock.login(user, pwd)
        if subscr:
            dirs = sock.lsub()
        else:
            dirs = sock.list()
        for i in dirs[1]:
            # Split the string by spaces, preserving quoted substrings.
            folder = shlex.split(i)[-1]
            if self.needs_ignore(server, folder):
                continue
            self.dirs.append(folder)
        self.dirs.sort()

    def needs_ignore(self, server, folder):
        if server not in self.config["ignore"].keys():
            return False
        return folder in self.config["ignore"][server]


if __name__ == "__main__":
    sys.stderr.write("Listing %s..." % sys.argv[1])
    # We have one more parameter to only list subscribed folders.
    subscr = len(sys.argv) > 4
    server = ImapLister(server=sys.argv[1], user=sys.argv[2], pwd=sys.argv[3], subscr=subscr)
    url = sys.argv[1]
    sys.stderr.write(" done.\n")
    sys.stdout.write('"imaps://%s/INBOX" ' % url)
    for i in server.dirs:
        if i == "INBOX":
            continue
        sys.stdout.write('"imaps://%s/%s" ' % (url, i))

# vim:set shiftwidth=4 softtabstop=4 expandtab:
