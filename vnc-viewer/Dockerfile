ARG BUILD_FROM
FROM $BUILD_FROM AS NO_VNC

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.20.1-2+deb10u3

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC.git -b v1.2.0 /noVNC

FROM $BUILD_FROM AS WEBSOCKIFY

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.20.1-2+deb10u3 \
    python3=3.7.3-1 \
    python3-setuptools=40.8.0-1 \
    python3-numpy=1:1.16.2-1 \
    python3-pip=18.1-5

RUN pip3 install --no-cache-dir Cython==0.29.21

# hadolint ignore=DL3003
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/websockify -b v0.9.0 /websockify && \
    cd /websockify && python3 setup.py install

FROM $BUILD_FROM AS RUNNING

RUN apt-get update && apt-get -y --no-install-recommends install \
    git=1:2.20.1-2+deb10u3 \
    python3=3.7.3-1 \
    python3-setuptools=40.8.0-1 \
    python3-numpy=1:1.16.2-1 \
    procps=2:3.3.15-2  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=NO_VNC /noVNC /noVNC
COPY --from=WEBSOCKIFY /usr/local/lib/python3.7/dist-packages/ /usr/local/lib/python3.7/dist-packages/
COPY --from=WEBSOCKIFY /usr/local/bin/websockify /usr/local/bin/websockify

ENTRYPOINT [ "/init" ]
CMD []
COPY root /
