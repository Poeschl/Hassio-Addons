ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=1.27.4-r2"

COPY root /
RUN chmod +x /etc/s6-overlay/s6-rc.d/syncthing-setup/run

ENV HOME=/share \
    STCONFDIR=/config \
    STDATADIR=/data \
    STNODEFAULTFOLDER=1 \
    STNORESTART=1 \
    STNOUPGRADE=1

ENTRYPOINT [ "/init" ]
CMD []
