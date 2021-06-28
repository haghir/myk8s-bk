# secret 1.0.0
FROM alpine:latest
RUN apk add openssh rsync gnupg
COPY ./bksec /usr/local/bin/bksec
RUN ssh-keygen -A
RUN passwd -u root
RUN chmod 755 /usr/local/bin/bksec && \
    mkdir -p /var/local/secret/data && \
    mkdir -p /var/local/secret/backup-1 && \
    mkdir -p /var/local/secret/backup-2
ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e" ]
