ARG BUILD_FROM
FROM $BUILD_FROM

ENV MOPIDY_VERSION='2.2.3-1'

RUN apt-get update && apt-get install -y wget gnupg &&\
    wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - &&\
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list &&\
    apt-get update &&\
    apt-get -y install jq mopidy=${MOPIDY_VERSION} python-pip gstreamer1.0-plugins-bad sudo &&\
    apt-get -y remove wget gnupg && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install Mopidy-YouTube youtube-dl pafy
RUN pip install Mopidy-Iris 
#Let mopidy run local scans
RUN echo "mopidy ALL=NOPASSWD: /usr/local/lib/python2.7/dist-packages/mopidy_iris/system.sh" >> /etc/sudoers

COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
