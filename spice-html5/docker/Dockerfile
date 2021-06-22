FROM ubuntu:latest
RUN apt update && apt install -y spice-html5
ENTRYPOINT [ "/usr/bin/websockify", "--web", "/usr/share/spice-html5/", "5959" ]
