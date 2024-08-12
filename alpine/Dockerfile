FROM alpine:3.20 AS downloader

RUN apk add --no-cache \
        curl=8.9.0-r0 \
        tar=1.35-r2 \
        gzip=1.13-r0 \
    && curl -o ./dinaip.tar.gz https://dinahosting.com/utilidades/estandar/aplicaciones/dinaIP-consola.tar.gz \
    && tar xzpf ./dinaip.tar.gz -C /tmp/ && rm -f ./dinaip.tar.gz

FROM alpine:3.20

LABEL matainer="Víctor R. Rodríguez Domínguez <victor@vrdominguez.es>"

ENV DHUSER='mydinahostinguser' \
    DHPASS='mydinahostingpass'

COPY bootstrap.sh /
COPY --from=downloader /tmp/dinaIP-consola/* /opt/dinaip/

RUN apk update \
    && apk add --no-cache \
        perl-libwww=6.77-r0 \
        curl=8.9.0-r0 \
    && ln -s /opt/dinaip/dinaip.pl /usr/sbin/dinaip \
    && sed -i '/use Cwd/a no warnings experimental;' /opt/dinaip/dinaip.pl \
    && ln -sf /proc/self/fd/1 /var/log/dinaip.log \
    && chmod a+x /bootstrap.sh

CMD ["/bootstrap.sh"]