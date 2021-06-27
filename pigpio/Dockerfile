ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apt-get update && apt-get -y --no-install-recommends install \
        python=2.7.16-1 \
        python3=3.7.3-1 \
        python-setuptools=40.8.0-1 \
        python3-setuptools=40.8.0-1 \
        git=1:2.20.1-2+deb10u3 \
        build-essential=12.6

# hadolint ignore=DL3003
RUN git clone 'https://github.com/joan2937/pigpio.git' -b v79 /pigpio &&\
    cd /pigpio &&\
    echo 'Reroute "/dev/pig*" to "/tmp/pig*", to make pigpio addon compatible.' &&\
    find . -type f -exec sed -i -re 's#/dev/pig(pio|out|err)#/tmp/pig\1#g' {} \; &&\
    make  &&\
    make install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
	python3-minimal=3.7.3-1 &&\
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=BUILD /usr/local/include/pigpio* /usr/local/include/
COPY --from=BUILD /usr/local/lib/libpigpio* /usr/local/lib/
COPY --from=BUILD /usr/local/bin/pig* /usr/local/bin/
COPY --from=BUILD /usr/local/lib/python3.7/dist-packages/* /usr/local/lib/python3.7/dist-packages/

# Point to the right libs
RUN echo "/usr/local/lib" > /etc/ld.so.conf && ldconfig

ENTRYPOINT [ "/init" ]
CMD []
COPY root /

