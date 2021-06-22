# collector 1.0.18
FROM alpine:latest
RUN apk add python3 py3-pip make automake autoconf libtool openssh imagemagick rsync mariadb-client
RUN pip3 install PyYAML mysql-connector-python Wand
COPY ./collector.tar.gz /root/collector.tar.gz
COPY ./python.sh /etc/profile.d/python.sh
COPY ./ll.sh /etc/profile.d/ll.sh
COPY ./startup /usr/local/bin/startup
RUN ssh-keygen -A
RUN passwd -u root
RUN cd /root && \
    tar xf collector.tar.gz && \
    cd collector && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    chmod 755 /usr/local/bin/startup && \
    mkdir -p /var/local/collector/data && \
    mkdir -p /var/local/collector/backup && \
    mkdir -p /usr/local/etc/collector && \
    mkdir -p /root/work && \
    mkdir -p /root/dat && \
    mkdir -p /root/.ssh/mnt && \
    chmod 700 /root/.ssh && \
    rm -rf /root/collector && \
    rm -f /root/collector.tar.gz
ENTRYPOINT [ "/usr/local/bin/startup" ]
