ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV mitmproxy_VERSION='5.1.1'

RUN apk add -Uu --no-cache --purge \
       	python3=3.8.3-r0  \
        python3-dev=3.8.3-r0 \
        py3-pip=20.1.1-r0 \
        py3-wheel=0.34.2-r1 \
        py3-six=1.15.0-r0 \
        py3-parsing=2.4.7-r0 \
        py3-certifi=2020.4.5.1-r0 \
        py3-setuptools=47.0.0-r0 \
        build-base=0.5-r2 \
        libffi=3.3-r2 \
        libffi-dev=3.3-r2 \
        libstdc++=9.3.0-r2 \
        openssl=1.1.1g-r0 \
        openssl-dev=1.1.1g-r0

RUN pip3 install --user --upgrade mitmproxy==5.1.1


FROM $BUILD_FROM AS RUNNING

RUN apk add -Uu --no-cache --purge \
       	python3=3.8.3-r0 \
       	python3-dev=3.8.3-r0 \
		py3-six=1.15.0-r0 \
        py3-parsing=2.4.7-r0 \
        py3-certifi=2020.4.5.1-r0 \
        py3-setuptools=47.0.0-r0 \
    && rm -rf /var/cache/apk/* /tmp/*

COPY --from=BUILD /root/.local /root/.local

ENV PATH /root/.local/bin:$PATH

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
