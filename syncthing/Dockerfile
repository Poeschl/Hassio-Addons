ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.27.2-r0"

COPY root /

ENV HOME=/share \
    STCONFDIR=/config \
    STDATADIR=/data \
    STNODEFAULTFOLDER=1 \
    STNORESTART=1 \
    STNOUPGRADE=1

ENTRYPOINT [ "/init" ]
CMD []
