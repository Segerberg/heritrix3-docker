# HERITRIX

ARG java=11-jre
ARG version="3.4.0-20210923"

FROM openjdk:${java}
ENV USERNAME admin
ENV PASSWORD admin
RUN wget -O /tmp/heritrix.tar.gz https://repo1.maven.org/maven2/org/archive/heritrix/heritrix/3.4.0-20210923/heritrix-3.4.0-20210923-dist.tar.gz

RUN tar -C /opt -xzf /tmp/heritrix.tar.gz
RUN mv /opt/heritrix-3.4.0-20210923 /opt/heritrix

WORKDIR /opt/heritrix

RUN mkdir /mnt/heritrix

VOLUME /mnt/heritrix

EXPOSE 8443

ENV FOREGROUND true
ENTRYPOINT ["/opt/heritrix/bin/heritrix"]
CMD ["--web-admin admin:admin", "--web-bind-hosts 0.0.0.0", "--jobs-dir /mnt/heritrix/jobs"]
