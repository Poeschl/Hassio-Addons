ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV MARYTTS_VERSION 5.2

RUN apk update && \
    apk add --no-cache \
			'wget=1.20.3-r0' \
			'unzip=6.0-r4'

RUN wget -q --show-progress "https://github.com/marytts/marytts/releases/download/v${MARYTTS_VERSION}/marytts-${MARYTTS_VERSION}.zip" &&\
    unzip marytts-${MARYTTS_VERSION}.zip -d / && mv /marytts-${MARYTTS_VERSION} /app

FROM $BUILD_FROM AS RUNNING

RUN apk update && \
    apk add --no-cache 'openjdk8=8.222.10-r0'

COPY --from=BUILD /app /app

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /app
CMD [ "/run.sh" ]
