ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV VERSION 71

RUN apt-get update && apt-get -y install python-setuptools python3-setuptools git build-essential
RUN git clone 'https://github.com/joan2937/pigpio.git' -b "V${VERSION}" /pigpio &&\
    cd /pigpio &&\
    make  &&\
    make install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y install python3-minimal && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=BUILD /usr/local/include/pigpio* /usr/local/include/
COPY --from=BUILD /usr/local/lib/libpigpio* /usr/local/lib/
COPY --from=BUILD /usr/local/bin/pig* /usr/local/bin/
COPY --from=BUILD /usr/local/lib/python3.7/dist-packages/* /usr/local/lib/python3.7/dist-packages/

# Point to the right libs
RUN echo "/usr/local/lib" > /etc/ld.so.conf && ldconfig

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

EXPOSE 8888
