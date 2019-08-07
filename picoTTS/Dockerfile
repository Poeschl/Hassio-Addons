ARG BUILD_FROM
FROM $BUILD_FROM AS BUILD

RUN apk add git make g++ automake autoconf libtool popt-dev

ENV COMMIT_SHA '2f86050dc5da9ab68fc61510b594d8e6975c4d2d'
RUN git clone https://github.com/naggety/picotts.git -b master /build && \
    cd build && git checkout ${COMMIT_SHA} &&\
    cd pico && ./autogen.sh && ./configure && make install

FROM $BUILD_FROM AS RUNNING

RUN apk add python3 popt &&\
    python3 -m ensurepip

COPY --from=BUILD /usr/local/bin/pico2wave /usr/local/bin/pico2wave
COPY --from=BUILD /usr/local/lib/libttspico.* /usr/local/lib/
COPY --from=BUILD /usr/local/share/pico /usr/local/share/pico

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

COPY wrapper/ /app
RUN cd app && pip3 install -r requirements.txt
