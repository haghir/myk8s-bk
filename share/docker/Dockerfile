# share 1.0.2
FROM alpine:latest
RUN apk add openssh rsync
COPY ./bkshare /usr/local/bin/bkshare
RUN ssh-keygen -A
RUN passwd -u root
RUN chmod 755 /usr/local/bin/bkshare && \
    mkdir -p /var/local/share/data && \
    mkdir -p /var/local/share/backup
ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e" ]
