# HERITRIX

FROM base

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-jdk7-installer
RUN mkdir /opt/heritrix
RUN wget -O /tmp/heritrix.tar.gz http://builds.archive.org/maven2/org/archive/heritrix/heritrix/3.4.0-SNAPSHOT/heritrix-3.4.0-20190205.123555-1-dist.tar.gz
RUN tar -C /opt -xvf /tmp/heritrix.tar.gz

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 8443

CMD /usr/local/bin/entrypoint.sh 
	
