ARG BUILD_FROM
FROM $BUILD_FROM AS NO_VNC

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.35.1-1

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC.git -b v1.3.0 /noVNC

FROM $BUILD_FROM AS WEBSOCKIFY

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.35.1-1 \
    python3=3.10.5-3 \
    python3-setuptools=59.6.0-1.2 \
    python3-numpy=1:1.21.5-1+b1 \
    python3-pip=22.2+dfsg-1

RUN pip3 install --no-cache-dir Cython==0.29.32

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/websockify -b v0.10.0 /websockify && \
    cd /websockify && python3 setup.py install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.35.1-1 \
    python3=3.10.5-3 \
    python3-setuptools=59.6.0-1.2 \
    python3-numpy=1:1.21.5-1+b1 \
    procps=2:3.3.17-7+b1  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=NO_VNC /noVNC /noVNC
COPY --from=WEBSOCKIFY /usr/local/lib/python3.10/dist-packages/ /usr/local/lib/python3.10/dist-packages/
COPY --from=WEBSOCKIFY /usr/local/bin/websockify /usr/local/bin/websockify

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
