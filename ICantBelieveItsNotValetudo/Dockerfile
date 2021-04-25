ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache \
	git=2.30.2-r0 \
	npm=14.16.1-r1 \
	python3=3.8.8-r0 \
	pixman-dev=0.40.0-r2 \
	cairo-dev=1.16.0-r2 \
	pango-dev=1.48.2-r0 \
	build-base=0.5-r2 \
	libjpeg-turbo-dev=2.1.0-r0

# Splited RUN for better layer caching
# hadolint ignore=DL3059
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b 2021.4.0 /app

WORKDIR /app
RUN npm install


FROM $BUILD_FROM AS SERVER

RUN apk add --no-cache \
    npm=14.16.1-r1

COPY root/server /server

WORKDIR /server
RUN npm install


FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
    npm=14.16.1-r1 \
    pixman=0.40.0-r2 \
	cairo=1.16.0-r2 \
	pango=1.48.2-r0 \
	libjpeg-turbo=2.1.0-r0

WORKDIR /app

COPY --from=BUILD /app /app
COPY --from=SERVER /server /server

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
