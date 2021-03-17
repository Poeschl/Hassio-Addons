ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache ympd=1.3.0-r9

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
