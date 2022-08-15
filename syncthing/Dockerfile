ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/3.16/community \
		"syncthing=1.20.1-r3"

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
