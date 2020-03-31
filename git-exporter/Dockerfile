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
			'python3=3.8.2-r0' \
			'curl=7.67.0-r0' \
			'findutils=4.7.0-r0'

RUN pip3 install PyYAML==5.3.1 dotty-dict==1.2.1

COPY --from=BUILD /usr/local/bin/git-secrets /usr/local/bin/git-secrets

COPY run.sh /
COPY utils /utils
RUN chmod a+x /run.sh /utils/*
RUN echo "{\"data\": \"value\", \"container\": {\"condata\": {\"more\":\"test\"}}}" > /tmp/test && /utils/jsonToYaml.py /tmp/ container.condata && cat /tmp/test.yaml
CMD [ "/run.sh" ]