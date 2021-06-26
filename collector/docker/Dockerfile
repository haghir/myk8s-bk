# collector 1.0.19
FROM alpine:latest
RUN apk add python3 py3-pip make automake autoconf libtool openssh imagemagick rsync mariadb-client
RUN pip3 install PyYAML mysql-connector-python Wand
COPY ./collector.tar.gz /usr/local/src/collector.tar.gz
COPY ./python.sh /etc/profile.d/python.sh
RUN ssh-keygen -A
RUN passwd -u root
RUN cd /usr/local/src && \
    tar xf collector.tar.gz && \
    cd collector && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    mkdir -p /var/local/collector/data && \
    mkdir -p /var/local/collector/backup && \
    mkdir -p /usr/local/etc/collector
ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e" ]
