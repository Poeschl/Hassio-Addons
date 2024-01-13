ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apk add --no-cache \
		'git=2.36.6-r0' \
		'make=4.3-r0'

ENV GIT_SECRET_VERSION 1.3.0
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/awslabs/git-secrets.git -b ${GIT_SECRET_VERSION} /git-secrets && \
    cd /git-secrets && make install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
			'git=2.36.6-r0' \
			'rsync=3.2.7-r0' \
			'grep=3.7-r0' \
			'sed=4.8-r0' \
			'python3=3.10.13-r0' \
			'py3-pip=22.1.1-r0' \
			'findutils=4.9.0-r0' \
	&& pip3 install --no-cache-dir PyYAML==5.3.1 dotty-dict==1.3.1

COPY --from=BUILD /usr/local/bin/git-secrets /usr/local/bin/git-secrets

COPY root /
RUN chmod a+x /run.sh /utils/*
ENTRYPOINT [ "/run.sh" ]
