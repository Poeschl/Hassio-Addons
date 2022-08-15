ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache \
	git=2.36.2-r0 \
	npm=8.10.0-r0 \
	python3=3.10.5-r0 \
	pixman-dev=0.40.0-r3 \
	cairo-dev=1.17.4-r2 \
	pango-dev=1.50.7-r0 \
	build-base=0.5-r3 \
	libjpeg-turbo-dev=2.1.3-r1

# Splited RUN for better layer caching
# hadolint ignore=DL3059
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/Hypfer/ICantBelieveItsNotValetudo.git -b 2022.05.0 /app

WORKDIR /app
RUN npm install


FROM $BUILD_FROM AS SERVER

RUN apk add --no-cache \
    npm=8.10.0-r0

COPY root/server /server

WORKDIR /server
RUN npm install


FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
    npm=8.10.0-r0 \
    pixman=0.40.0-r3 \
	cairo=1.17.4-r2 \
	pango=1.50.7-r0 \
	libjpeg-turbo=2.1.3-r1

WORKDIR /app

COPY --from=BUILD /app /app
COPY --from=SERVER /server /server

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
