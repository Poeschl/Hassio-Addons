ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8
ENV COMMIT_SHA '5dc26e1f7b018df12f23082bc7d606be3a9d6281'

RUN apk add --no-cache git=2.24.3-r0 npm=12.15.0-r1
# hadolint ignore=DL3003
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

COPY valetudo.jq /app/config-template.jq
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
