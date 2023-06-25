FROM alpine:3.18

MAINTAINER victor@vrdominguez.es

RUN apk update && apk add perl-libwww curl \
    && curl -o ./dinaip.tar.gz https://dinahosting.com/utilidades/estandar/aplicaciones/dinaIP-consola.tar.gz \
    && tar xzpf ./dinaip.tar.gz -C /tmp/ && rm -f ./dinaip.tar.gz \
    && cd /tmp/dinaIP-consola && sh ./install.sh && cd -- && rm -rf /tmp/dinaIP-consola \
    && sed -i '/use Cwd/a no warnings experimental;' /opt/dinaip/dinaip.pl \
    && ln -sf /proc/self/fd/1 /var/log/dinaip.log

ADD bootstrap.sh /

RUN chmod a+x /bootstrap.sh

ENV DHUSER='mydinahostinguser'
ENV DHPASS='mydinahostingpass'

CMD "/bootstrap.sh"