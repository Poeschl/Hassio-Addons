ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add -Uu --no-cache --purge \
        mpc=0.33-r2 \
        mpd=0.21.23-r0 \
        ympd=1.3.0-r9 \
    && rm -rf /var/cache/apk/* /tmp/*

COPY root /