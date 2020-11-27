ARG BUILD_FROM

FROM $BUILD_FROM AS REPOSITORY

RUN apk --update add --no-cache \
    git=2.26.2-r0

ENV COMMIT_SHA '586ebebf16195bfab7ffd2b3dbc4344077e72a05'
# hadolint ignore=DL3003
RUN git clone https://github.com/virtualzone/docker-container-stats.git -b master /container-stats && \
    cd /container-stats && git checkout $COMMIT_SHA


FROM $BUILD_FROM AS BUILD

RUN apk --update add --no-cache \
    npm=12.18.4-r0 \
    python2=2.7.18-r0 \
    make=4.3-r0 \
    g++=9.3.0-r2

WORKDIR /container-stats

RUN npm update && \
    npm install \
    	express@4.17.1 \
    	sqlite3@5.0.0 \
    	body-parser@1.19.0 \
    	moment@2.29.1

FROM $BUILD_FROM AS RUNNING

RUN apk --update add --no-cache \
    nodejs=12.18.4-r0 \
    docker=19.03.12-r0 \
    sqlite=3.32.1-r0

RUN mkdir -p /container-stats/db

COPY --from=BUILD /container-stats /container-stats
COPY --from=REPOSITORY /container-stats/stats.js /container-stats
COPY --from=REPOSITORY /container-stats/httpd.js /container-stats
COPY --from=REPOSITORY /container-stats/html /container-stats/html

COPY root /
