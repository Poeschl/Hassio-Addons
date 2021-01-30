ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.12.1-r0"

COPY root /
