# code-server 1.0.0
FROM codercom/code-server
USER 0
COPY ./startup /usr/local/bin/startup
RUN chmod 755 /usr/local/bin/startup
USER 1000
RUN mkdir -p /home/coder/.ssh/mnt
ENTRYPOINT [ "/usr/local/bin/startup" ]
