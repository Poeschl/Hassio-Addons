ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV GIT_SECRET_VERSION 1.3.0

RUN apk add --no-cache \
		'git=2.24.1-r0' \
		'make=4.2.1-r2'

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/awslabs/git-secrets.git -b ${GIT_SECRET_VERSION} /git-secrets && \
    cd /git-secrets && make install

FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
			'git=2.24.1-r0' \
			'rsync=3.1.3-r2'

COPY --from=BUILD /usr/local/bin/git-secrets /usr/local/bin/git-secrets

RUN git config --global core.autocrlf input

COPY run.sh /
COPY exclude.txt /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]