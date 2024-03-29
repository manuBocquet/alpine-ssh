FROM alpine:latest
MAINTAINER manu <manu.bocquet@gmail.com>
USER root

# Update image
RUN set -x \
	&& apk add --no-cache openssh-server openssh rsync bash \
	&& /usr/bin/ssh-keygen -A \
	&& addgroup -S remoteuser \
        && adduser -S -G remoteuser -h /home/remoteuser -s /bin/sh remoteuser \
	&& passwd -u remoteuser \
	&& mv /etc/ssh /etc/ssh.orig
ADD ./start.sh /etc/start.sh
VOLUME [ "/home/remoteuser" ]
VOLUME [ "/etc/ssh" ]

EXPOSE 22
# Start the service
ENTRYPOINT ["/etc/start.sh"]
