ARG BUILD_FROM
FROM $BUILD_FROM

ENV YMPD_VERSION='1.3.0-r9'

RUN apk add -Uu --no-cache --purge \
        ympd=$YMPD_VERSION \
    && rm -rf /var/cache/apk/* /tmp/*

COPY root /
