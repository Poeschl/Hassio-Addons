ARG BUILD_FROM
FROM $BUILD_FROM

RUN apt-get update && apt-get -y --no-install-recommends install dirmngr \
    ca-certificates \
    apt-utils \
    apt-transport-https \
    sed \
    unzip \
    supervisor \
    mpg123 \
    git \
    gnupg \
    python3 \
    python3-venv &&\
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN if [ "$(uname --m)" = 'aarch64' ]; then bash -c 'echo "deb https://raspbian.snips.ai/410c_linaro_buster stable main" > /etc/apt/sources.list.d/snips.list'; fi &&\
    if [ "$(uname --m)" = 'armv7l' ]; then bash -c 'echo "deb https://raspbian.snips.ai/respeaker_iot stable main" > /etc/apt/sources.list.d/snips.list'; fi &&\
    if [ "$(uname --m)" = 'x86_64' ]; then bash -c 'echo "deb https://debian.snips.ai/stretch stable main" > /etc/apt/sources.list.d/snips.list'; fi &&\
    \
    if [ "$(uname --m)" = 'amd64' ]; then apt-key adv --keyserver pgp.surfnet.nl --recv-keys F727C778CCB0A455; \
        else apt-key adv --keyserver pgp.surfnet.nl --recv-keys D4F50CDCA10A2849 && apt-get update; fi &&\
    \
    apt-get -y --no-install-recommends --allow-unauthenticated install snips-asr \
        snips-audio-server \
        snips-dialogue \
        snips-nlu \
        snips-skill-server \
        snips-template \
        snips-watch &&\
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

COPY assistant.zip /assistant.zip
