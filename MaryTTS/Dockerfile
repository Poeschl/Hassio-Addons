ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV MARYTTS_VERSION 5.2

RUN apk add --no-cache \
		'wget=1.20.3-r1' \
		'unzip=6.0-r8'

RUN wget -q --show-progress "https://github.com/marytts/marytts/releases/download/v${MARYTTS_VERSION}/marytts-${MARYTTS_VERSION}.zip" &&\
    unzip marytts-${MARYTTS_VERSION}.zip -d / && mv /marytts-${MARYTTS_VERSION} /app

FROM $BUILD_FROM AS RUNNING

ENV MARYTTS_VERSION 5.2

RUN apk update && \
    apk add --no-cache 'openjdk8=8.252.09-r0'

COPY --from=BUILD /app /app

COPY root /
