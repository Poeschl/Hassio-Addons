ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache git=2.32.0-r0 npm=7.17.0-r0

ENV COMMIT_SHA '850070117562d83ccae214585cc92422ffec8347'
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/rand256/valetudo-mapper -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache npm=7.17.0-r0

WORKDIR /app
COPY --from=BUILD /app /app

ENTRYPOINT [ "/init" ]
CMD []
COPY root /