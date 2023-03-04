FROM phusion/baseimage:latest
MAINTAINER Yamada, Yasuhiro <yamada@gr3.ie>
ENV DEBFULLNAME="Yamada, Yasuhiro" DEBEMAIL=yamada@gr3.ie DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y dh-make fakeroot pbuilder software-properties-common jq

RUN curl -L https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 > /usr/bin/yq && chmod +x /usr/bin/yq

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY deb-template /tmp/deb-template
COPY build.sh /tmp
COPY changelog.sh /tmp

CMD /bin/bash /tmp/build.sh
