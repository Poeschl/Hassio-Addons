ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV GIT_SECRET_VERSION 1.3.0

RUN apk add --no-cache \
		'git=2.24.1-r0' \
		'make=4.2.1-r2'

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/awslabs/git-secrets.git -b ${GIT_SECRET_VERSION} /git-secrets && \
    cd /git-secrets && make install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
			'git=2.24.1-r0' \
			'rsync=3.1.3-r2' \
			'grep=3.3-r0' \
			'sed=4.7-r0' \
			'python3=3.8.1-r0' \
			'py3-yaml=5.2-r0'

COPY --from=BUILD /usr/local/bin/git-secrets /usr/local/bin/git-secrets

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]