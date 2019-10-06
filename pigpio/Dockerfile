ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV VERSION 71

RUN apt-get update && apt-get -y --no-install-recommends install \
        python=2.7.13-2 \
        python3=3.5.3-1 \
        python-setuptools=33.1.1-1 \
        python3-setuptools=33.1.1-1 \
        git=1:2.11.0-3+deb9u4 \
        build-essential=12.3
# hadolint ignore=DL3003
RUN git clone 'https://github.com/joan2937/pigpio.git' -b "V${VERSION}" /pigpio &&\
    cd /pigpio &&\
    make  &&\
    make install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install python3-minimal=3.5.3-1 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=BUILD /usr/local/include/pigpio* /usr/local/include/
COPY --from=BUILD /usr/local/lib/libpigpio* /usr/local/lib/
COPY --from=BUILD /usr/local/bin/pig* /usr/local/bin/
COPY --from=BUILD /usr/local/lib/python3.5/dist-packages/* /usr/local/lib/python3.5/dist-packages/

# Point to the right libs
RUN echo "/usr/local/lib" > /etc/ld.so.conf && ldconfig

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

EXPOSE 8888
