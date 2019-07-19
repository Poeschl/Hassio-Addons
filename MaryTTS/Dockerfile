ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV MARYTTS_VERSION 5.2

RUN apk add git maven openjdk8
RUN git clone https://github.com/marytts/marytts.git -b "v${MARYTTS_VERSION}" /build && \
    cd /build &&\
    mvn install -Dmaven.test.skip=true && mv target/marytts-${MARYTTS_VERSION}/ target/marytts


FROM $BUILD_FROM AS RUNNING

RUN apk add openjdk8

COPY --from=BUILD /build/target/marytts /app

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
