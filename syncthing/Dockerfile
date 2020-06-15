ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		'syncthing=1.6.1-r0'

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]