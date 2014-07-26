FROM java:8

MAINTAINER Tobi Schäfer <interface@p3k.org>

RUN cd /tmp; curl -O http://dev.orf.at/download/helma/1.7.0/helma-1.7.0.tar.gz
RUN cd /root; tar -xzf /tmp/*.gz
RUN rm -rf /tmp/*.gz

EXPOSE 8080

CMD /root/helma-1.7.0/start.sh
