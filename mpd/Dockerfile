ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
        mpc=0.33-r2 \
        mpd=0.22.3-r0 \
        ympd=1.3.0-r9

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
