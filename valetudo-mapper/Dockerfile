ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV VALETUDOMAPPER_VERSION 0.2.0
ENV COMMIT_SHA '02655ed8f2e1c81d6b1798fd63c9b7c0ef70e382'

RUN apk add --no-cache git=2.20.2-r0 npm=10.14.2-r0
# hadolint ignore=DL3003
RUN git clone https://github.com/rand256/valetudo-mapper -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
