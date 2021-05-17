ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
      asterisk=18.2.1-r1 \
      asterisk-sample-config=18.2.1-r1

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
