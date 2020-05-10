FROM centos:latest
MAINTAINER Yamada, Yasuhiro <yamadagrep@gmail.com>
RUN yum install -y rpm-build redhat-rpm-config rpmdevtools
RUN curl -L https://github.com/mikefarah/yq/releases/download/2.3.0/yq_linux_amd64 > /usr/bin/yq && chmod +x /usr/bin/yq

COPY build.sh /tmp/
COPY template.spec /tmp/

CMD /bin/bash /tmp/build.sh
