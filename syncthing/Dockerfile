ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.25.0-r1"

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
