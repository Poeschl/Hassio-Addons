ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV ICANTBELIEVEITSNOTVALETUDO_VERSION 0.2.0

RUN apk add --no-cache git=2.22.0-r0 npm=10.16.3-r0
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b $ICANTBELIEVEITSNOTVALETUDO_VERSION /app && \
    cd /app && \
    npm install

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
