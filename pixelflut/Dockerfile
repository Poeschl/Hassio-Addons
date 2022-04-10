ARG BUILD_FROM
FROM $BUILD_FROM AS NO_VNC

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.34.1-1

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC.git -b v1.3.0 /noVNC


FROM $BUILD_FROM AS WEBSOCKIFY

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.34.1-1 \
    python3=3.9.7-1 \
    python3-setuptools=58.2.0-1 \
    python3-numpy=1:1.21.5-1 \
    python3-pip=20.3.4-4

RUN pip3 install --no-cache-dir Cython==0.29.26

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/websockify -b v0.10.0 /websockify && \
    cd /websockify && python3 setup.py install


FROM $BUILD_FROM AS SHORELINE

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.34.1-1 \
    build-essential=12.9 \
    libvncserver-dev=0.9.13+dfsg-3 \
    libsdl2-dev=2.0.18+dfsg-5 \
    libpthread-stubs0-dev=0.4-1 \
    libfreetype6-dev=2.11.1+dfsg-1 \
    libnuma-dev=2.0.14-3

ENV COMMIT_SHA '05a2bbfb4559090727c51673e1fb47d20eac5672'
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
  git clone https://github.com/TobleMiner/shoreline.git -b master shoreline && \
  cd shoreline && \
  git checkout ${COMMIT_SHA} && \
  make


FROM $BUILD_FROM AS VNCMUX

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.34.1-1 \
    build-essential=12.9 \
    libvncserver-dev=0.9.13+dfsg-3 \
    pkg-config=0.29.2-1

ENV COMMIT_SHA 'c703aea6d699d403596302e3955b93b4366810b5'
# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
  git clone https://github.com/tobleminer/vncmux.git -b master vncmux && \
  cd vncmux && \
  git checkout ${COMMIT_SHA} && \
  make


FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
    python3=3.9.7-1 \
    python3-numpy=1:1.21.5-1 \
    procps=2:3.3.17-5  \
    libvncserver1=0.9.13+dfsg-3 \
    libvncclient1=0.9.13+dfsg-3 \
    libsdl2-2.0-0=2.0.18+dfsg-5 \
    libpthread-stubs0-dev=0.4-1 \
    libfreetype6=2.11.1+dfsg-1 \
    libnuma1=2.0.14-3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=NO_VNC /noVNC /noVNC
COPY --from=WEBSOCKIFY /usr/local/lib/python3.9/dist-packages/ /usr/local/lib/python3.9/dist-packages/
COPY --from=WEBSOCKIFY /usr/local/bin/websockify /usr/local/bin/websockify
COPY --from=SHORELINE /shoreline/shoreline /usr/local/bin/shoreline
COPY --from=VNCMUX /vncmux/vncmux /usr/local/bin/vncmux

ENTRYPOINT [ "/init" ]
CMD []
COPY root /