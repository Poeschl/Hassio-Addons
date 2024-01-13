ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache git=2.36.6-r0 npm=8.10.0-r0

ENV COMMIT_SHA '54aba3534e9e797b9a22c0e134fa2706effd2e9d'
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/rand256/valetudo-mapper -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache npm=8.10.0-r0

WORKDIR /app
COPY --from=BUILD /app /app

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
