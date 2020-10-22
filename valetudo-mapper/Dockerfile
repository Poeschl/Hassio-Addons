ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV COMMIT_SHA '8e23ac21e3627e376792de907ccf725e73094408'

RUN apk add --no-cache git=2.24.3-r0 npm=12.15.0-r1
# hadolint ignore=DL3003
RUN git clone https://github.com/rand256/valetudo-mapper -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

COPY root /