ARG BUILD_FROM

FROM $BUILD_FROM AS build-base

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/community --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/main \
      python3=3.9.5-r2 \
      py3-gst=1.18.4-r1 \
      py3-pip=20.3.4-r1 \
      mopidy=3.1.1-r3 \
      && ln -s /usr/lib/libpython3.9.so.1.0 /usr/lib/libpython3.9.so


FROM build-base AS mopidy-iris

RUN pip3 install --no-cache-dir --user Mopidy-Iris==3.62.0 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM build-base AS mopidy-mpd

RUN pip3 install --no-cache-dir --user Mopidy-MPD==3.2.0 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM build-base AS mopidy-radionet

RUN pip3 install --no-cache-dir --user Mopidy-RadioNet==0.2.2 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM $BUILD_FROM AS run

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/community --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/main \
      python3=3.9.5-r2 \
      py3-gst=1.18.4-r1 \
      mopidy=3.1.1-r3 \
      ca-certificates=20211220-r0 \
      sudo=1.9.7_p1-r1 \
      && ln -s /usr/lib/libpython3.9.so.1.0 /usr/lib/libpython3.9.so

COPY --from=mopidy-iris /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-mpd /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-radionet /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/

RUN echo "root ALL=NOPASSWD: /usr/lib/python3.9/site-packages/mopidy_iris/system.sh" >> /etc/sudoers

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
