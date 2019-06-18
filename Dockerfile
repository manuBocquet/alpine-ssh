FROM registry.redhat.io/ubi7/ubi:latest
MAINTAINER manu <manu.bocquet@gmail.com>
USER root

# Update image
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager openssh-server rsync -y && rm -rf /var/cache/yum

VOLUME [ "/mnt" ]
VOLUME [ "/etc/ssh" ]

EXPOSE 22
# Start the service
CMD ["-D"]
ENTRYPOINT ["/sbin/sshd"]
