FROM debian:stretch

MAINTAINER victor@vrdominguez.es

RUN apt-get update \
    && apt-get install -y --no-install-recommends perl libwww-perl ca-certificates curl procps \
    && curl -o ./dinaip.tar.gz https://dinahosting.com/utilidades/estandar/aplicaciones/dinaIP-consola.tar.gz \
    && tar xzpf ./dinaip.tar.gz -C /tmp/ && rm -f ./dinaip.tar.gz \
    && cd /tmp/dinaIP-consola && sh ./install.sh && cd -- && rm -rf /tmp/dinaIP-consola \
    && apt-get autoremove -y && apt-get clean -y \
    && sed -i '/use Cwd/a no warnings experimental;' /opt/dinaip/dinaip.pl

ADD bootstrap.sh /

RUN chmod a+x /bootstrap.sh

ENV DHUSER='mydinahostinguser'
ENV DHPASS='mydinahostingpass'

CMD "/bootstrap.sh"
