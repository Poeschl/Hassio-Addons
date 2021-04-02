ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apk add --no-cache \
        python3=3.8.8-r0  \
        python3-dev=3.8.8-r0 \
        py3-pip=20.1.1-r0 \
        py3-wheel=0.34.2-r1 \
        py3-six=1.15.0-r0 \
        py3-parsing=2.4.7-r0 \
        py3-certifi=2020.4.5.1-r0 \
        py3-setuptools=47.0.0-r0 \
        py3-cryptography=2.9.2-r0 \
        py3-brotli=1.0.9-r1 \
        py3-sortedcontainers=2.1.0-r3 \
        py3-tornado=6.0.4-r0 \
        py3-urwid=2.1.0-r0 \
        py3-ruamel.yaml.clib=0.2.0-r0 \
        build-base=0.5-r2 \
        libffi=3.3-r2 \
        libffi-dev=3.3-r2 \
        libstdc++=9.3.0-r2 \
        openssl=1.1.1k-r0 \
        openssl-dev=1.1.1k-r0

RUN pip3 install --no-cache-dir --user --upgrade mitmproxy==5.1.1


FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
        python3=3.8.8-r0 \
        ca-certificates=20191127-r4 \
        haproxy=2.1.12-r0 \
    && rm -rf /var/cache/apk/* /tmp/*

COPY --from=BUILD /root/.local /root/.local
COPY --from=BUILD /usr/lib/python3.8/site-packages /usr/lib/python3.8/site-packages

ENV PATH /root/.local/bin:$PATH

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
