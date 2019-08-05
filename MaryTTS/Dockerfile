ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV MARYTTS_VERSION 5.2

RUN apk add wget unzip
RUN wget -q --show-progress "https://github.com/marytts/marytts/releases/download/v${MARYTTS_VERSION}/marytts-${MARYTTS_VERSION}.zip" &&\
    unzip marytts-${MARYTTS_VERSION}.zip -d / && mv /marytts-${MARYTTS_VERSION} /app

FROM $BUILD_FROM AS RUNNING

RUN apk add openjdk8

COPY --from=BUILD /app /app

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
