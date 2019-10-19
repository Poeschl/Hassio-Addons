ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV ICANTBELIEVEITSNOTVALETUDO_VERSION 0.2.0
ENV COMMIT_SHA '0884f7c141551bc5c2d259b230f415107aeebf85'

RUN apk add --no-cache git=2.20.1-r0 npm=10.14.2-r0
# hadolint ignore=DL3003
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
