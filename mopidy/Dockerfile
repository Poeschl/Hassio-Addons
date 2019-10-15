ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get -y --no-install-recommends install wget=1.18-5+deb9u3 gnupg=2.1.18-8~deb9u4 &&\
    wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - &&\
    debian_codename=$(dpkg --status tzdata | grep Provides | cut -f2 -d'-') &&\
    wget -q -O /etc/apt/sources.list.d/mopidy.list "https://apt.mopidy.com/${debian_codename}.list" &&\
    apt-get update &&\
    if [ "$(uname -m)" = "aarch64" ]; then export MOPIDY_VERSION=2.1.0-1; \
    else export MOPIDY_VERSION='2.2.3-1'; fi &&\
    apt-get -y --no-install-recommends install \
        mopidy=${MOPIDY_VERSION} \
        jq=1.5+dfsg-1.3 \
        python-pip=9.0.1-2+deb9u1 \
        python-setuptools=33.1.1-1 \
        python-wheel=0.29.0-2 \
        gstreamer1.0-plugins-bad=1.10.4-1 \
        sudo=1.8.19p1-2.1 &&\
    apt-get -y remove wget gnupg && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install Mopidy-YouTube==2.0.2 youtube-dl==2019.9.28 pafy==0.5.4 Mopidy-Iris==3.40.0 Mopidy-Local-SQLite==1.0.0
#Let mopidy run local scans
RUN echo "mopidy ALL=NOPASSWD: /usr/local/lib/python2.7/dist-packages/mopidy_iris/system.sh" >> /etc/sudoers

COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
