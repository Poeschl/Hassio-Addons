ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apt-get update && apt-get -y --no-install-recommends install \
        python2=2.7.18-3 \
        python3=3.9.2-3 \
        python-setuptools=44.1.1-1 \
        python3-setuptools=52.0.0-4 \
        git=1:2.30.2-1 \
        build-essential=12.9

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone 'https://github.com/joan2937/pigpio.git' -b v79 /pigpio &&\
    cd /pigpio &&\
    echo 'Reroute "/dev/pig*" to "/tmp/pig*", to make pigpio addon compatible.' &&\
    find . -type f -exec sed -i -re 's#/dev/pig(pio|out|err)#/tmp/pig\1#g' {} \; &&\
    make  &&\
    make install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
	python3-minimal=3.9.2-3 &&\
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=BUILD /usr/local/include/pigpio* /usr/local/include/
COPY --from=BUILD /usr/local/lib/libpigpio* /usr/local/lib/
COPY --from=BUILD /usr/local/bin/pig* /usr/local/bin/
COPY --from=BUILD /usr/local/lib/python3.9/dist-packages/* /usr/local/lib/python3.9/dist-packages/

# Point to the right libs
RUN echo "/usr/local/lib" > /etc/ld.so.conf && ldconfig

ENTRYPOINT [ "/init" ]
CMD []
COPY root /

