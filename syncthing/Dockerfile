ARG BUILD_FROM
FROM $BUILD_FROM

RUN arch=$(uname -m); if [ "$arch" == "aarch64" ]; then export VERSION='1.7.1-r1'; else export VERSION='1.8.0-r0'; fi && \
	apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		"syncthing=$VERSION"

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]