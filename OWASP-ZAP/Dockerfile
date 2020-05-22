ARG BUILD_FROM
FROM $BUILD_FROM AS REPOSITORY

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y --no-install-recommends install \
	git=1:2.20.1-2+deb10u3 \
	wget=1.20.1-1.1 \
	gnupg=2.2.12-1+deb10u1 \
	unzip=6.0-23+deb10u1 \
	sed=4.7-1

ENV ZAP_VERSION '2.9.0'
ENV WEBSWING_VERSION '2.5.10'

#Download all needed repositories and archives
# hadolint ignore=SC2016
RUN git clone https://github.com/zaproxy/zaproxy.git -b "v${ZAP_VERSION}" /zap-repository \
    && sed -i 's| 2>> $LOG||;s| >> $LOG||' /zap-repository/docker/zap-webswing.sh

RUN wget -nv --content-disposition -O - "https://github.com/zaproxy/zaproxy/releases/download/v${ZAP_VERSION}/ZAP_${ZAP_VERSION}_Linux.tar.gz" | tar zxv \
	&& mkdir /zap \
	&& cp -R ZAP*/* /zap \
	&& rm -R ZAP*/* \
	# Accept ZAP license
	&& touch /zap/AcceptedLicense

RUN	wget -nv --content-disposition -O webswing.zip "https://bitbucket.org/meszarv/webswing/downloads/webswing-${WEBSWING_VERSION}.zip" \
	&& unzip webswing.zip \
	&& rm webswing.zip \
	&& mv webswing-* /webswing \
	# Remove demos
	&& rm -R /webswing/demo/


FROM $BUILD_FROM AS BUILD

RUN apt-get update && apt-get -y --no-install-recommends install \
	build-essential=12.6 \
	automake=1:1.16.1-4 \
	autoconf=2.69-11 \
	python-pip=18.1-5 \
	python3-pip=18.1-5 \
	python-setuptools=40.8.0-1 \
	python3-setuptools=40.8.0-1 \
	python-wheel=0.32.3-2 \
	python3-wheel=0.32.3-2

RUN pip install --user --upgrade pip==20.1 zapcli==0.10.0 python-owasp-zap-v2.4==0.0.14
RUN pip3 install --user --upgrade pip==20.1 zapcli==0.10.0 python-owasp-zap-v2.4==0.0.14


FROM $BUILD_FROM AS RUNNING

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y --no-install-recommends install \
	xmlstarlet=1.6.1-2 \
	openbox=3.6.1-8 \
	xterm=344-1 \
	net-tools=1.60+git20180626.aebd88e-1 \
	python=2.7.16-1 \
	python3=3.7.3-1 \
	xvfb=2:1.20.4-1 \
	xauth=1:1.0.10-1 \
	x11vnc=0.9.13-6 \
	wget=1.20.1-1.1 \
	gnupg=2.2.12-1+deb10u1 \
	software-properties-common=0.96.20.2-2 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
	&& add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
	&& apt-get update && apt-get -y --no-install-recommends install adoptopenjdk-8-hotspot=8u252-b09-2 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /zap

COPY --from=REPOSITORY /zap /zap
COPY --from=REPOSITORY /webswing /zap/webswing

COPY --from=BUILD /root/.local /root/.local

ENV PATH /zap:/root/.local/bin:$PATH
ENV ZAP_PATH /zap/zap.sh
ENV ZAP_PORT 8080

COPY --from=REPOSITORY /zap-repository/docker/zap-webswing.sh /zap/
COPY --from=REPOSITORY /zap-repository/docker/webswing.config /zap/webswing/
COPY --from=REPOSITORY /zap-repository/docker/policies /root/.ZAP/policies/
COPY --from=REPOSITORY /zap-repository/docker/.xinitrc /root/
RUN chmod a+x /root/.xinitrc

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
