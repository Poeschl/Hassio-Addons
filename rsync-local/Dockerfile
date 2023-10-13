ARG BUILD_FROM
FROM $BUILD_FROM AS RUNNING

RUN apk update && \
    apk add --no-cache \
		'rsync=3.2.7-r4' \
		'coreutils=9.3-r1'

COPY root /
RUN chmod a+x /run.sh
ENTRYPOINT [ "/run.sh" ]

