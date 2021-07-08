ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

ENV LANG C.UTF-8

RUN apk add --no-cache \
	git=2.30.2-r0 \
	npm=14.16.1-r1 \
	python2=2.7.18-r1 \
	build-base=0.5-r2 

# Splited RUN for better layer caching
# hadolint ignore=DL3059
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/bkimminich/juice-shop.git -b v12.8.1 /app

WORKDIR /app
RUN npm install typescript@4.3.5 ts-node@10.0.0 && \
	npm install --production --unsafe-perm && \
	npm dedupe && \
	rm -rf frontend/node_modules


FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
    npm=14.16.1-r1

WORKDIR /app

COPY --from=BUILD /app /app

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
