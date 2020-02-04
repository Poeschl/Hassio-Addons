ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV COMMIT_SHA 'f9cb790d79d13ab835b437293d693ea5d863211b'

RUN apk add --no-cache git=2.22.2-r0 npm=10.16.3-r0
# hadolint ignore=DL3003
RUN git clone https://github.com/rand256/valetudo-mapper -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
