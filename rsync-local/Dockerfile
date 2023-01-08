ARG BUILD_FROM
FROM $BUILD_FROM AS RUNNING

RUN apk update && \
    apk add --no-cache \
		'rsync=3.2.7-r0' \
		'coreutils=9.1-r0'

COPY root /
RUN chmod a+x /run.sh
ENTRYPOINT [ "/run.sh" ]

