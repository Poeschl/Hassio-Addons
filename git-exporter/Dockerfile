ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apk add --no-cache \
		'git=2.32.0-r0' \
		'make=4.3-r0'

ENV GIT_SECRET_VERSION 1.3.0
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/awslabs/git-secrets.git -b ${GIT_SECRET_VERSION} /git-secrets && \
    cd /git-secrets && make install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
			'git=2.32.0-r0' \
			'rsync=3.2.3-r4' \
			'grep=3.7-r0' \
			'sed=4.8-r0' \
			'python3=3.9.5-r1' \
			'py3-pip=20.3.4-r1' \
			'findutils=4.8.0-r1' 

RUN pip3 install --no-cache-dir PyYAML==6.0 dotty-dict==1.3.0

COPY --from=BUILD /usr/local/bin/git-secrets /usr/local/bin/git-secrets

COPY root /
RUN chmod a+x /run.sh /utils/*
ENTRYPOINT [ "/run.sh" ]
