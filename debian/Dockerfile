FROM alpine:3.20 AS downloader

RUN apk add --no-cache \
        curl=8.10.1-r0 \
        tar=1.35-r2 \
        gzip=1.13-r0 \
    && curl -o ./dinaip.tar.gz https://dinahosting.com/utilidades/estandar/aplicaciones/dinaIP-consola.tar.gz \
    && tar xzpf ./dinaip.tar.gz -C /tmp/ && rm -f ./dinaip.tar.gz


FROM debian:bookworm-slim

LABEL matainer="Víctor R. Rodríguez Domínguez <victor@vrdominguez.es>"

ENV DHUSER='mydinahostinguser' \
    DHPASS='mydinahostingpass'

COPY bootstrap.sh /
COPY --from=downloader /tmp/dinaIP-consola/* /opt/dinaip/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        perl=5.36.0-7+deb12u1 \
        libcrypt-ssleay-perl=0.73.06-2+b1 \
        libwww-perl=6.68-1 \
        ca-certificates=20230311 \
        curl=7.88.1-10+deb12u7 \
        procps=2:4.0.2-3 \
    && ln -s /opt/dinaip/dinaip.pl /usr/sbin/dinaip \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/ /var/lib/dpkg/ /var/lib/cache/ /var/lib/log/ \
    && sed -i '/use Cwd/a no warnings experimental;' /opt/dinaip/dinaip.pl \
    && chmod a+x /bootstrap.sh


CMD ["/bootstrap.sh"]
