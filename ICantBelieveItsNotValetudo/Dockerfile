ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apt-get update && apt-get -y --no-install-recommends install \
	git=1:2.35.1-1 \
	npm=8.19.2~ds1-2 \
	python3=3.10.6-1 \
	libpixman-1-dev=0.40.0-1 \
	libcairo2-dev=1.16.0-6 \
	libpango1.0-dev=1.50.10+ds-1 \
	build-essential=12.9 \
	libjpeg62-turbo-dev=1:2.1.2-1+b1

# Splited RUN for better layer caching
# hadolint ignore=DL3059
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b 2022.05.0 /app

WORKDIR /app
RUN npm install


FROM $BUILD_FROM AS SERVER

RUN apt-get update && apt-get -y --no-install-recommends install \
    npm=8.19.2~ds1-2

COPY root/server /server

WORKDIR /server
RUN npm install


FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
    npm=8.19.2~ds1-2 \
    libpixman-1-0=0.40.0-1 \
		libcairo2=1.16.0-6 \
		libpango-1.0-0=1.50.10+ds-1 \
		libjpeg62-turbo=1:2.1.2-1+b1 \
		&& apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=BUILD /app /app
COPY --from=SERVER /server /server

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
