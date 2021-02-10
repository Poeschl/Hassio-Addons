ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache \
	git=2.30.1-r0 \
	npm=14.15.4-r0 \
	python3=3.8.7-r0 \
	pkgconf=1.7.3-r0 \
	pixman-dev=0.40.0-r2 \
	cairo-dev=1.16.0-r2 \
	pango-dev=1.48.1-r0 \
	build-base=0.5-r2 \
	libjpeg-turbo-dev=2.0.6-r0

ENV COMMIT_SHA 'bd687c11b6d35a2c98a22c548d64583988c0bd4c'
# hadolint ignore=DL3003
RUN git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b master /app && \
    cd app && git checkout $COMMIT_SHA

WORKDIR /app
RUN npm install


FROM $BUILD_FROM AS SERVER

RUN apk add --no-cache \
	npm=14.15.4-r0

COPY root/server /server

WORKDIR /server
RUN npm install


FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache npm=14.15.4-r0 \
    pixman=0.40.0-r2 \
	cairo=1.16.0-r2 \
	pango=1.48.1-r0 \
	libjpeg-turbo=2.0.6-r0

WORKDIR /app

COPY --from=BUILD /app /app
COPY --from=SERVER /server /server

COPY root /
