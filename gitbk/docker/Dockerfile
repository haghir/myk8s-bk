FROM alpine
RUN apk update && apk add --no-cache git openssh-client
RUN mkdir -p /var/local/repos && \
    mkdir /root/.ssh && \
    mkdir /root/known_hosts.d && \
    echo "UserKnownHostsFile ~/known_hosts.d/%k" >> /etc/ssh/ssh_config
COPY ./gitbk /usr/local/bin
RUN chmod 755 /usr/local/bin/gitbk
ENTRYPOINT ["gitbk"]
CMD ["1", "3600"]
