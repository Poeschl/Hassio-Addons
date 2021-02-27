ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache \
	git=2.30.1-r0 \
	npm=14.16.0-r0 \
	python3=3.8.7-r1 \
	pixman-dev=0.40.0-r2 \
	cairo-dev=1.16.0-r2 \
	pango-dev=1.48.2-r0 \
	build-base=0.5-r2 \
	libjpeg-turbo-dev=2.0.6-r0

ENV COMMIT_SHA '73a7965704027ec37a302545821d688e73df0c3e'
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
    npm=14.16.0-r0 \
    pixman=0.40.0-r2 \
	cairo=1.16.0-r2 \
	pango=1.48.2-r0 \
	libjpeg-turbo=2.0.6-r0

WORKDIR /app

COPY --from=BUILD /app /app

COPY root /
