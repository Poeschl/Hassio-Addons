    ARG BUILD_FROM
FROM $BUILD_FROM AS RUNNING

RUN apk update && \
    apk add --no-cache \
		'rsync=3.2.3-r1' \
		'openssh-client=8.4_p1-r3' \
		'coreutils=8.32-r2'

COPY run.sh /
RUN chmod a+x /run.sh
ENTRYPOINT [ "/run.sh" ]

