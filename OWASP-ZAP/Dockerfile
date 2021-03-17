ARG BUILD_FROM
FROM owasp/zap2docker-stable:2.10.0 AS REPOSITORY

FROM $BUILD_FROM AS RUNNING

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y --no-install-recommends install \
	python3=3.7.3-1 \
	xvfb=2:1.20.4-1+deb10u2 \
	xauth=1:1.0.10-1 \
	x11vnc=0.9.13-6+deb10u1 \
	wget=1.20.1-1.1 \
	gnupg=2.2.12-1+deb10u1 \
	openjdk-11-jdk=11.0.9.1+1-1~deb10u2 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /zap

COPY --from=REPOSITORY /zap /zap

ENV PATH /zap:/root/.local/bin:$PATH
ENV ZAP_PATH /zap/zap.sh
ENV IS_CONTAINERIZED true
ENV ZAP_PORT 8080

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
