ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.21.0-r1"

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
