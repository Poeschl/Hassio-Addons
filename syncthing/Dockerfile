ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.17.0-r0"

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
