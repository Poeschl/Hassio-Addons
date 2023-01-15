ARG BUILD_FROM
FROM $BUILD_FROM AS RUNNING

RUN apk add --no-cache \
			'espeak=1.48.04-r3' \
			'python3=3.10.5-r0' \
			'popt=1.18-r0' && \
	python3 -m ensurepip

COPY wrapper/ /app
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
