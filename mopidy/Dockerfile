ARG BUILD_FROM

FROM $BUILD_FROM AS build-base

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
      python3-dev=3.9.5-r0 \
      py3-gst=1.18.4-r1 \
      py3-pip=20.3.4-r1 \
      mopidy=3.1.1-r3


FROM build-base AS mopidy-iris

RUN pip3 install --no-cache-dir --user Mopidy-Iris==3.57.6 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM build-base AS mopidy-mpd

RUN pip3 install --no-cache-dir --user Mopidy-MPD==3.1.0 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM build-base AS mopidy-radionet

RUN pip3 install --no-cache-dir --user Mopidy-RadioNet==0.2.2 &&\
      ls -al /root/.local/lib/python3.9/site-packages


FROM build-base AS mopidy-spotify

RUN apk add --no-cache wget=1.21.1-r1 build-base=0.5-r2 libffi-dev=3.3-r2 py3-wheel=0.36.2-r0 &&\
      (([[ "$(uname -m)" == "armv7l" ]] && wget -q --show-progress https://mopidy.github.io/libspotify-archive/libspotify-12.1.51-Linux-armv7-release.tar.gz -O libspotify.tar.gz) ||\
      ([[ "$(uname -m)" == "x86_64" ]] && wget -q --show-progress https://mopidy.github.io/libspotify-archive/libspotify-12.1.51-Linux-x86_64-release.tar.gz -O libspotify.tar.gz)) &&\
      tar -xzf libspotify.tar.gz  &&\
      cd libspotify-* && sed -i 's|install -T|install|g;s|ldconfig|ldconfig $(prefix)/lib/libspotify.so\n\tldconfig $(prefix)/lib/libspotify.so.12\n\tldconfig $(prefix)/lib/libspotify.so.12.1.51|g' Makefile &&\
      make install prefix=/usr/local

RUN pip3 install --no-cache-dir --user \
      pyspotify==2.1.3 \
      Mopidy-Spotify==4.1.1 &&\
      ls -al /root/.local/lib/python3.9/site-packages  


FROM $BUILD_FROM AS run

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
      python3=3.9.5-r0 \
      py3-gst=1.18.4-r1 \
      mopidy=3.1.1-r3 \
      ca-certificates=20191127-r5 \
      sudo=1.9.5p2-r0 \
      && ln -s /usr/lib/libpython3.9.so.1.0 /usr/lib/libpython3.9.so

COPY --from=mopidy-iris /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-mpd /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-radionet /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-spotify /root/.local/lib/python3.9/site-packages /usr/lib/python3.9/site-packages/
COPY --from=mopidy-spotify /usr/local/lib/libspotify.so.12.1.51 /usr/local/lib/libspotify.so.12.1.51

RUN echo "root ALL=NOPASSWD: /usr/lib/python3.9/site-packages/mopidy_iris/system.sh" >> /etc/sudoers \
      ln -sf  /usr/local/lib/libspotify.so.12.1.51  /usr/local/lib/libspotify.so.12 && ln -sf  /usr/local/lib/libspotify.so.12.1.51 /usr/local/lib/libspotify.so


ENTRYPOINT [ "/init" ]
CMD []
COPY root /
