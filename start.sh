#!/bin/bash
if [ ! -f "/etc/ssh/sshd.config" ]; then
	/usr/bin/rsync -a /etc/ssh.orig/ /etc/ssh/
fi
chown remoteuser:remoteuser /home/remoteuser && /usr/sbin/sshd -D
