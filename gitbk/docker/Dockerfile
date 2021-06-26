# gitbk 1.0.4
FROM alpine
RUN apk update && apk add --no-cache git openssh-client
RUN mkdir -p /var/local/repos
COPY ./gitbk /usr/local/bin
RUN chmod 755 /usr/local/bin/gitbk
ENTRYPOINT ["gitbk"]
CMD ["1", "3600"]
