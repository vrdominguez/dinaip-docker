FROM alpine:3.20 AS downloader

RUN apk add --no-cache \
        curl=8.10.1-r0 \
        tar=1.35-r2 \
        gzip=1.13-r0 \
    && curl -o ./dinaip.tar.gz https://dinahosting.com/utilidades/estandar/aplicaciones/dinaIP-consola.tar.gz \
    && tar xzpf ./dinaip.tar.gz -C /tmp/ && rm -f ./dinaip.tar.gz

FROM alpine:3.20

LABEL mantainer="Víctor R. Rodríguez Domínguez <victor@vrdominguez.es>"

ENV DHUSER='mydinahostinguser' \
    DHPASS='mydinahostingpass'

COPY --chmod=755 bootstrap.sh /
COPY --from=downloader /tmp/dinaIP-consola/* /opt/dinaip/

RUN apk update \
    && apk add --no-cache \
        perl-libwww=6.77-r0 \
        curl=8.10.1-r0 \
    && ln -s /opt/dinaip/dinaip.pl /usr/sbin/dinaip \
    && sed -i '/use Cwd/a no warnings deprecated;' /opt/dinaip/dinaip.pl \
    && ln -sf /proc/self/fd/1 /var/log/dinaip.log

CMD ["/bootstrap.sh"]