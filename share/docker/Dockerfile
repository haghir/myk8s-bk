# share 1.0.0
FROM alpine:latest
RUN apk add openssh rsync
COPY ./ll.sh /etc/profile.d/ll.sh
COPY ./bkshare /usr/local/bin/bkshare
COPY ./startup /usr/local/bin/startup
RUN ssh-keygen -A
RUN passwd -u root
RUN chmod 755 /usr/local/bin/bkshare && \
    chmod 755 /usr/local/bin/startup && \
    mkdir -p /var/local/share/data && \
    mkdir -p /var/local/share/backup && \
    ln -s /var/local/share/data /root/share && \
    mkdir -p /root/.ssh/mnt && \
    chmod 700 /root/.ssh
ENTRYPOINT [ "/usr/local/bin/startup" ]
